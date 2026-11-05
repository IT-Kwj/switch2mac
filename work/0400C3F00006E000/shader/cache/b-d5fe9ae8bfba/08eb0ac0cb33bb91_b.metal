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
    texture2d_array<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_CSmplr_w [[id(8)]];
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
    float2 _398 = float2(_50, _52);
    float3 _56 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_398, float2(0.0), isnan(_398)), int2(0), component::x).xyw;
    float _58 = _56.x;
    float _60 = _56.y;
    float _62 = _56.z;
    float2 _415 = float2(_50, _52);
    float _64 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_415, float2(0.0), isnan(_415))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_415, float2(0.0), isnan(_415))).x;
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
    float _94 = -_64;
    float _96 = fma(_94, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _98 = 1.0 / _88;
    float _100 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _102 = _90 * _100;
    float _104 = _66 * _102;
    float _106 = _70 * _102;
    float _108 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _110 = _92 * _108;
    float _112 = 1.0 / _96;
    float _114 = -_104;
    float _116 = fma(_110, _68, _114);
    float _118 = -_106;
    float _120 = fma(_110, _74, _118);
    float _122 = -_102;
    float _124 = _122 + _110;
    float _126 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _128 = _98 * _126;
    float _130 = _116 * _116;
    float _132 = -_104;
    float _134 = fma(_128, _72, _132);
    float _136 = -_106;
    float _138 = fma(_128, _76, _136);
    float _140 = fma(_120, _120, _130);
    float _142 = -_102;
    float _144 = _142 + _128;
    float _146 = _134 * _134;
    float _148 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _150 = _112 * _148;
    float _152 = fma(_124, _124, _140);
    float _154 = fma(_138, _138, _146);
    float _156 = _150 * _66;
    float _158 = _150 * _70;
    float _160 = fma(_144, _144, _154);
    float _162 = rsqrt(_152);
    float _164 = _156 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _166 = rsqrt(_160);
    float _168 = _120 * _162;
    float _170 = _124 * _162;
    float _172 = _116 * _162;
    float _174 = _144 * _166;
    float _176 = _134 * _166;
    float _178 = _138 * _166;
    float _180 = _168 * _174;
    float _182 = _170 * _176;
    float _184 = -_180;
    float _186 = fma(_170, _178, _184);
    float _188 = -_182;
    float _190 = fma(_172, _174, _188);
    float _192 = _172 * _178;
    float _194 = _186 * _186;
    float _196 = -_192;
    float _198 = fma(_168, _176, _196);
    float _200 = fma(_190, _190, _194);
    float _202 = fma(_198, _198, _200);
    float _204 = rsqrt(_202);
    float _206 = _186 * _204;
    float _208 = _190 * _204;
    float _210 = _198 * _204;
    float _212 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[15].x, _164);
    float _214 = _206 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _216 = _156 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _218 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[15].z, _212);
    float _220 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[35].x, _214);
    float _222 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[13].x, _216);
    float _224 = _218 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _226 = fma(_210, (*spvDescriptorSet0.fp_c3)._m0[35].z, _220);
    float _228 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[13].z, _222);
    float _230 = abs(_226);
    float _232 = -_230;
    float _234 = _232 + 1.0;
    float _236 = precise::clamp(_234, 0.0, 1.0);
    float _238 = 1.0 / _224;
    float _240 = _228 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _242 = abs(_236);
    float _244 = log2(_242);
    float _246 = _244 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _248 = exp2(_246);
    float _250 = _248 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _252 = _156 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _254 = fma(_206, _250, _156);
    float _256 = fma(_208, _250, _158);
    float _258 = fma(_210, _250, _150);
    float _260 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[12].x, _252);
    float _262 = _254 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _264 = _254 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _266 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[12].z, _260);
    float _268 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[3].x, _262);
    float _270 = _254 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _272 = _254 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _274 = _266 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _276 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[3].z, _268);
    float _278 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[1].x, _264);
    float _280 = _274 * _238;
    float _282 = _276 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _284 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[0].x, _270);
    float _286 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[2].x, _272);
    float _288 = _240 * _238;
    float _290 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[1].z, _278);
    float _292 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[0].z, _284);
    float _294 = 1.0 / _282;
    float _296 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[2].z, _286);
    float _298 = _290 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _300 = _292 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _302 = _296 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _304 = _300 * _294;
    float _306 = _302 * _294;
    float _308 = precise::clamp(_306, 0.0, 1.0);
    float2 _833 = float2(_280, _288);
    float2 _312 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_833, float2(0.0), isnan(_833))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_833, float2(0.0), isnan(_833))).xy;
    float _314 = _312.x;
    float _316 = _312.y;
    float _318 = _298 * _294;
    float _320 = rint(_308);
    float _322 = precise::max(_320, 0.0);
    uint _325 = uint(_322);
    uint _327 = clamp(_325, 0u, 65535u);
    float3 _861 = float3(_304, _318, float(int(_327)));
    float3 _865 = select(_861, float3(0.0), isnan(_861));
    float _329 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _865.xy, uint(rint(_865.z)), 1.0);
    float _331 = _156 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _333 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[14].x, _331);
    float _335 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[14].z, _333);
    float _337 = _335 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _339 = precise::min(_337, 1.0);
    float _341 = -_314;
    float _343 = fma(_341, _314, _316);
    float _345 = -_314;
    float _347 = _339 + _345;
    float _349 = -_150;
    float _351 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _353 = _349 + _351;
    float _355 = fma(_347, _347, _343);
    bool _359 = _347 <= 0.001000000047497451305389404296875;
    float _361 = float(_359);
    float _363 = _353 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _365 = precise::clamp(_363, 0.0, 1.0);
    float _367 = 1.0 / _355;
    float _369 = _343 * _367;
    float _371 = precise::max(_369, _361);
    float _373 = -_150;
    float _375 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _377 = _373 + _375;
    float _379 = precise::min(_371, 1.0);
    float _381 = _377 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _383 = precise::clamp(_381, 0.0, 1.0);
    float _385 = _365 + _329;
    float _387 = _383 + _379;
    out.m_43.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_43.y = _385;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _387;
    return out;
}

