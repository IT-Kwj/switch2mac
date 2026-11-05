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
    float2 _325 = float2(_52, _54);
    float3 _58 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_325, float2(0.0), isnan(_325)), int2(0), component::x).xyw;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = _58.z;
    float2 _343 = float2(_52, _54);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_343, float2(0.0), isnan(_343))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_343, float2(0.0), isnan(_343))).x;
    float2 _351 = float2(_52, _54);
    float2 _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_351, float2(0.0), isnan(_351))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_351, float2(0.0), isnan(_351))).xy;
    float _72 = _70.x;
    float _74 = _70.y;
    float _76 = in.m_38.y;
    float _78 = in.m_40.y;
    float _80 = in.m_38.x;
    float _82 = in.m_42.y;
    float _84 = in.m_40.x;
    float _86 = in.m_42.x;
    float _88 = -_60;
    float _90 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _92 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[46].z, _90);
    float _94 = -_62;
    float _96 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _98 = fma(_94, (*spvDescriptorSet0.fp_c3)._m0[46].z, _96);
    float _100 = _76 * _92;
    float _102 = _80 * _92;
    float _104 = -_100;
    float _106 = fma(_98, _78, _104);
    float _108 = -_64;
    float _110 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _112 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[46].z, _110);
    float _114 = -_102;
    float _116 = fma(_98, _84, _114);
    float _118 = -_92;
    float _120 = _118 + _98;
    float _122 = _106 * _106;
    float _124 = -_100;
    float _126 = fma(_112, _82, _124);
    float _128 = -_102;
    float _130 = fma(_112, _86, _128);
    float _132 = -_92;
    float _134 = _132 + _112;
    float _136 = fma(_116, _116, _122);
    float _138 = _126 * _126;
    float _140 = fma(_120, _120, _136);
    float _142 = fma(_130, _130, _138);
    float _144 = fma(_134, _134, _142);
    float _146 = rsqrt(_140);
    float _148 = rsqrt(_144);
    float _150 = _116 * _146;
    float _152 = _120 * _146;
    float _154 = _106 * _146;
    float _156 = _134 * _148;
    float _158 = _130 * _148;
    float _160 = _126 * _148;
    float _162 = _150 * _156;
    float _164 = _152 * _160;
    float _166 = -_162;
    float _168 = fma(_152, _158, _166);
    float _170 = _154 * _158;
    float _172 = -_164;
    float _174 = fma(_154, _156, _172);
    float _176 = _168 * _168;
    float _178 = -_170;
    float _180 = fma(_150, _160, _178);
    float _182 = fma(_174, _174, _176);
    float _184 = fma(_180, _180, _182);
    float _186 = rsqrt(_184);
    float _188 = _168 * _186;
    float _190 = _174 * _186;
    float _192 = _180 * _186;
    float _194 = _188 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _196 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[35].x, _194);
    float _198 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[35].z, _196);
    float _200 = abs(_198);
    float _202 = -_200;
    float _204 = _202 + 1.0;
    float _206 = precise::clamp(_204, 0.0, 1.0);
    float _208 = abs(_206);
    float _210 = log2(_208);
    float _212 = _210 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _214 = exp2(_212);
    float _216 = -_66;
    float _218 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _220 = fma(_216, (*spvDescriptorSet0.fp_c3)._m0[46].z, _218);
    float _222 = _214 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _224 = _188 * _222;
    float _226 = _190 * _222;
    float _228 = fma(_192, _222, _220);
    float _230 = fma(_220, _76, _224);
    float _232 = fma(_220, _80, _226);
    float _234 = _230 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _236 = _230 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _238 = _230 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _240 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[3].x, _234);
    float _242 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[1].x, _236);
    float _244 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[2].x, _238);
    float _246 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[3].z, _240);
    float _248 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[1].z, _242);
    float _250 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[2].z, _244);
    float _252 = _246 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _254 = _230 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _256 = _248 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _258 = 1.0 / _252;
    float _260 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[0].x, _254);
    float _262 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[0].z, _260);
    float _264 = fma(_72, 2.0, -1.0);
    float _266 = fma(_74, 2.0, -1.0);
    float _268 = _262 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _270 = _250 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _272 = _264 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _274 = _266 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _276 = fma(_272, 2.0, _52);
    float _278 = _268 * _258;
    float _280 = _256 * _258;
    float _282 = _270 * _258;
    float _284 = precise::clamp(_282, 0.0, 1.0);
    float _286 = fma(_274, 2.0, _54);
    float3 _717 = float3(_278, _280, float(0));
    float3 _721 = select(_717, float3(0.0), isnan(_717));
    float _288 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _721.xy, uint(rint(_721.z)), _284);
    float2 _727 = float2(_276, _286);
    float _290 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_727, float2(0.0), isnan(_727))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_727, float2(0.0), isnan(_727))).x;
    float _292 = -_220;
    float _294 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _296 = _292 + _294;
    float _298 = -_220;
    float _300 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _302 = _298 + _300;
    float _304 = _296 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _306 = precise::clamp(_304, 0.0, 1.0);
    float _308 = _302 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _310 = precise::clamp(_308, 0.0, 1.0);
    float _312 = fma(_214, (*spvDescriptorSet0.fp_c3)._m0[48].w, _306);
    float _314 = _310 + _288;
    out.m_45.x = _290;
    out.m_45.y = _314;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _312;
    return out;
}

