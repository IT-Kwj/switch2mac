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
    texture2d_array<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_ASmplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_43 [[color(0)]];
};

struct main0_in
{
    float4 m_36 [[user(locn0), center_no_perspective]];
    float4 m_40 [[user(locn1), center_no_perspective]];
    float4 m_38 [[user(locn2), center_no_perspective]];
    float4 m_34 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _50 = in.m_34.x;
    float _52 = in.m_34.y;
    float2 _346 = float2(_50, _52);
    float3 _56 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_346, float2(0.0), isnan(_346)), int2(0), component::x).xyw;
    float _58 = _56.x;
    float _60 = _56.y;
    float _62 = _56.z;
    float2 _364 = float2(_50, _52);
    float _64 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_364, float2(0.0), isnan(_364))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_364, float2(0.0), isnan(_364))).x;
    float _66 = in.m_36.y;
    float _68 = in.m_38.y;
    float _70 = in.m_36.x;
    float _72 = in.m_40.y;
    float _74 = in.m_38.x;
    float _76 = in.m_40.x;
    float _78 = -_58;
    float _80 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _82 = -_60;
    float _84 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _86 = -_62;
    float _88 = fma(_86, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _90 = 1.0 / _80;
    float _92 = 1.0 / _84;
    float _94 = 1.0 / _88;
    float _96 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _98 = _90 * _96;
    float _100 = _66 * _98;
    float _102 = _70 * _98;
    float _104 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _106 = _92 * _104;
    float _108 = -_100;
    float _110 = fma(_106, _68, _108);
    float _112 = -_102;
    float _114 = fma(_106, _74, _112);
    float _116 = -_98;
    float _118 = _116 + _106;
    float _120 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _122 = _94 * _120;
    float _124 = _110 * _110;
    float _126 = -_100;
    float _128 = fma(_122, _72, _126);
    float _130 = -_102;
    float _132 = fma(_122, _76, _130);
    float _134 = fma(_114, _114, _124);
    float _136 = -_98;
    float _138 = _136 + _122;
    float _140 = _128 * _128;
    float _142 = -_64;
    float _144 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _146 = fma(_118, _118, _134);
    float _148 = fma(_132, _132, _140);
    float _150 = 1.0 / _144;
    float _152 = fma(_138, _138, _148);
    float _154 = rsqrt(_146);
    float _156 = rsqrt(_152);
    float _158 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _160 = _150 * _158;
    float _162 = _114 * _154;
    float _164 = _118 * _154;
    float _166 = _110 * _154;
    float _168 = _138 * _156;
    float _170 = _128 * _156;
    float _172 = _132 * _156;
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
    float _224 = _222 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _226 = exp2(_224);
    float _228 = _226 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _230 = _200 * _228;
    float _232 = _202 * _228;
    float _234 = fma(_204, _228, _160);
    float _236 = fma(_160, _66, _230);
    float _238 = fma(_160, _70, _232);
    float _240 = _236 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _242 = fma(_238, (*spvDescriptorSet0.fp_c3)._m0[3].x, _240);
    float _244 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[3].z, _242);
    float _246 = _244 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _248 = _236 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _250 = 1.0 / _246;
    float _252 = fma(_238, (*spvDescriptorSet0.fp_c3)._m0[2].x, _248);
    float _254 = _236 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _256 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[2].z, _252);
    float _258 = _236 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _260 = fma(_238, (*spvDescriptorSet0.fp_c3)._m0[0].x, _254);
    float _262 = _256 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _264 = fma(_238, (*spvDescriptorSet0.fp_c3)._m0[1].x, _258);
    float _266 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[0].z, _260);
    float _268 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[1].z, _264);
    float _270 = _266 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _272 = _262 * _250;
    float _274 = precise::clamp(_272, 0.0, 1.0);
    float _276 = _268 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _278 = _270 * _250;
    float _280 = _274 * (*spvDescriptorSet0.fp_c3)._m0[47].x;
    float _282 = _276 * _250;
    float _284 = _280 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _286 = _280 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _288 = fma(_284, 0.5, _278);
    float _290 = fma(_286, 0.5, _282);
    float _292 = fma(_284, -0.5, _278);
    float _294 = fma(_286, -0.5, _282);
    float3 _749 = float3(_288, _290, float(0));
    float3 _753 = select(_749, float3(0.0), isnan(_749));
    float _296 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _753.xy, uint(rint(_753.z)), _274);
    float3 _760 = float3(_292, _290, float(0));
    float3 _762 = select(_760, float3(0.0), isnan(_760));
    float _298 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _762.xy, uint(rint(_762.z)), _274);
    float3 _769 = float3(_288, _294, float(0));
    float3 _771 = select(_769, float3(0.0), isnan(_769));
    float _300 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _771.xy, uint(rint(_771.z)), _274);
    float3 _778 = float3(_292, _294, float(0));
    float3 _780 = select(_778, float3(0.0), isnan(_778));
    float _302 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _780.xy, uint(rint(_780.z)), _274);
    float2 _786 = float2(_50, _52);
    float _304 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_786, float2(0.0), isnan(_786))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_786, float2(0.0), isnan(_786))).x;
    float _306 = -_160;
    float _308 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _310 = _306 + _308;
    float _312 = _310 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _314 = precise::clamp(_312, 0.0, 1.0);
    float _316 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[48].w, _314);
    float _318 = _296 + _298;
    float _320 = _318 + _300;
    float _322 = -_160;
    float _324 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _326 = _322 + _324;
    float _328 = _320 + _302;
    float _330 = _326 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _332 = precise::clamp(_330, 0.0, 1.0);
    float _334 = fma(_328, 0.25, _332);
    out.m_43.x = _304;
    out.m_43.y = _334;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _316;
    return out;
}

