#pragma clang diagnostic ignored "-Wmissing-prototypes"

#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct dm_border_t { uint mask; float4 k[32]; };
static inline __attribute__((always_inline)) float4 dm_bmix(float4 r, float4 w, float4 k) { return r + (w - r) * k; }
static inline __attribute__((always_inline)) float dm_bmix(float r, float w, float4 k) { return r + (w - r) * k.x; }
template<typename V, typename T, typename... A> static inline __attribute__((always_inline)) V dm_bs(V r, constant dm_border_t* b, uint i, T t, sampler w, A... a)
{
    if (b->mask >> i & 1u) r = dm_bmix(r, t.sample(w, a...), b->k[i]);
    return r;
}

template <typename T>
static inline depth2d<T> spvDepthCast(texture2d<T> t)
{
    return reinterpret_cast<thread const depth2d<T> &>(t);
}

template <typename T>
static inline depth2d_array<T> spvDepthCast(texture2d_array<T> t)
{
    return reinterpret_cast<thread const depth2d_array<T> &>(t);
}

template <typename T>
static inline depthcube<T> spvDepthCast(texturecube<T> t)
{
    return reinterpret_cast<thread const depthcube<T> &>(t);
}

template <typename T>
static inline depthcube_array<T> spvDepthCast(texturecube_array<T> t)
{
    return reinterpret_cast<thread const depthcube_array<T> &>(t);
}

struct _10
{
    uint _m0;
    uint _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _16* fp_c3 [[id(0)]];
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    texture2d<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d_array<float> fp_t_tcb_E [[id(5)]];
    sampler fp_t_tcb_ESmplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_CSmplr_w [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_45 [[color(0)]];
};

struct main0_in
{
    float4 m_38 [[user(locn0), center_no_perspective]];
    float4 m_42 [[user(locn1), center_no_perspective]];
    float4 m_40 [[user(locn2), center_no_perspective]];
    float4 m_36 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _52 = in.m_36.x;
    float _54 = in.m_36.y;
    float2 _341 = float2(_52, _54);
    float3 _58 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_341, float2(0.0), isnan(_341)), int2(0), component::x).xyw;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = _58.z;
    float2 _359 = float2(_52, _54);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_359, float2(0.0), isnan(_359))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_359, float2(0.0), isnan(_359))).x;
    float2 _367 = float2(_52, _54);
    float2 _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_367, float2(0.0), isnan(_367))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_367, float2(0.0), isnan(_367))).xy;
    float _72 = _70.x;
    float _74 = _70.y;
    float _76 = in.m_38.y;
    float _78 = in.m_40.y;
    float _80 = in.m_38.x;
    float _82 = in.m_42.y;
    float _84 = in.m_40.x;
    float _86 = in.m_42.x;
    float _88 = -_60;
    float _90 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _92 = -_62;
    float _94 = fma(_92, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _96 = -_64;
    float _98 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _100 = 1.0 / _90;
    float _102 = 1.0 / _94;
    float _104 = 1.0 / _98;
    float _106 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _108 = _100 * _106;
    float _110 = _76 * _108;
    float _112 = _80 * _108;
    float _114 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _116 = _102 * _114;
    float _118 = -_110;
    float _120 = fma(_116, _78, _118);
    float _122 = -_112;
    float _124 = fma(_116, _84, _122);
    float _126 = -_108;
    float _128 = _126 + _116;
    float _130 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _132 = _104 * _130;
    float _134 = _120 * _120;
    float _136 = -_110;
    float _138 = fma(_132, _82, _136);
    float _140 = -_112;
    float _142 = fma(_132, _86, _140);
    float _144 = fma(_124, _124, _134);
    float _146 = -_108;
    float _148 = _146 + _132;
    float _150 = _138 * _138;
    float _152 = fma(_128, _128, _144);
    float _154 = fma(_142, _142, _150);
    float _156 = fma(_148, _148, _154);
    float _158 = rsqrt(_152);
    float _160 = rsqrt(_156);
    float _162 = _124 * _158;
    float _164 = _128 * _158;
    float _166 = _120 * _158;
    float _168 = _148 * _160;
    float _170 = _138 * _160;
    float _172 = _142 * _160;
    float _174 = _162 * _168;
    float _176 = _164 * _170;
    float _178 = -_174;
    float _180 = fma(_164, _172, _178);
    float _182 = -_176;
    float _184 = fma(_166, _168, _182);
    float _186 = _166 * _172;
    float _188 = _180 * _180;
    float _190 = -_186;
    float _192 = fma(_162, _170, _190);
    float _194 = fma(_184, _184, _188);
    float _196 = fma(_192, _192, _194);
    float _198 = rsqrt(_196);
    float _200 = _180 * _198;
    float _202 = _184 * _198;
    float _204 = _192 * _198;
    float _206 = _200 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _208 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[35].x, _206);
    float _210 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[35].z, _208);
    float _212 = abs(_210);
    float _214 = -_212;
    float _216 = _214 + 1.0;
    float _218 = precise::clamp(_216, 0.0, 1.0);
    float _220 = abs(_218);
    float _222 = log2(_220);
    float _224 = -_66;
    float _226 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _228 = 1.0 / _226;
    float _230 = _222 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _232 = exp2(_230);
    float _234 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _236 = _228 * _234;
    float _238 = _232 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _240 = _200 * _238;
    float _242 = _202 * _238;
    float _244 = fma(_204, _238, _236);
    float _246 = fma(_236, _76, _240);
    float _248 = fma(_236, _80, _242);
    float _250 = _246 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _252 = _246 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _254 = fma(_248, (*spvDescriptorSet0.fp_c3)._m0[3].x, _250);
    float _256 = _246 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _258 = _246 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _260 = fma(_248, (*spvDescriptorSet0.fp_c3)._m0[1].x, _252);
    float _262 = fma(_244, (*spvDescriptorSet0.fp_c3)._m0[3].z, _254);
    float _264 = fma(_244, (*spvDescriptorSet0.fp_c3)._m0[1].z, _260);
    float _266 = _262 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _268 = fma(_248, (*spvDescriptorSet0.fp_c3)._m0[0].x, _256);
    float _270 = fma(_248, (*spvDescriptorSet0.fp_c3)._m0[2].x, _258);
    float _272 = _264 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _274 = fma(_244, (*spvDescriptorSet0.fp_c3)._m0[0].z, _268);
    float _276 = 1.0 / _266;
    float _278 = fma(_244, (*spvDescriptorSet0.fp_c3)._m0[2].z, _270);
    float _280 = _274 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _282 = fma(_72, 2.0, -1.0);
    float _284 = _278 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _286 = fma(_74, 2.0, -1.0);
    float _288 = _280 * _276;
    float _290 = _272 * _276;
    float _292 = _284 * _276;
    float _294 = precise::clamp(_292, 0.0, 1.0);
    float _296 = _282 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _298 = _286 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _300 = fma(_296, 2.0, _52);
    float _302 = fma(_298, 2.0, _54);
    float3 _749 = float3(_288, _290, float(0));
    float3 _753 = select(_749, float3(0.0), isnan(_749));
    float _304 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _753.xy, uint(rint(_753.z)), _294);
    float2 _759 = float2(_300, _302);
    float _306 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_759, float2(0.0), isnan(_759))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_759, float2(0.0), isnan(_759))).x;
    float _308 = -_236;
    float _310 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _312 = _308 + _310;
    float _314 = -_236;
    float _316 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _318 = _314 + _316;
    float _320 = _312 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _322 = precise::clamp(_320, 0.0, 1.0);
    float _324 = _318 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _326 = precise::clamp(_324, 0.0, 1.0);
    float _328 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[48].w, _322);
    float _330 = _326 + _304;
    out.m_45.x = _306;
    out.m_45.y = _330;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _328;
    return out;
}

