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
    texture2d<float> fp_t_tcb_10 [[id(5)]];
    sampler fp_t_tcb_10Smplr [[id(6)]];
    texture2d_array<float> fp_t_tcb_E [[id(7)]];
    sampler fp_t_tcb_ESmplr [[id(8)]];
    texture2d<float> fp_t_tcb_A [[id(9)]];
    sampler fp_t_tcb_ASmplr [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_CSmplr_w [[id(12)]];
    sampler fp_t_tcb_10Smplr_w [[id(13)]];
    sampler fp_t_tcb_ASmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_47 [[color(0)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0), center_no_perspective]];
    float4 m_44 [[user(locn1), center_no_perspective]];
    float4 m_42 [[user(locn2), center_no_perspective]];
    float4 m_38 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _54 = in.m_38.x;
    float _56 = in.m_38.y;
    float2 _446 = float2(_54, _56);
    float3 _60 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_446, float2(0.0), isnan(_446)), int2(0), component::x).xyw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float2 _463 = float2(_54, _56);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_463, float2(0.0), isnan(_463))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_463, float2(0.0), isnan(_463))).x;
    float2 _471 = float2(_54, _56);
    float2 _72 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_471, float2(0.0), isnan(_471))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_471, float2(0.0), isnan(_471))).xy;
    float _74 = _72.x;
    float _76 = _72.y;
    float _78 = in.m_40.y;
    float _80 = in.m_40.x;
    float _82 = in.m_42.y;
    float _84 = in.m_44.y;
    float _86 = in.m_42.x;
    float _88 = in.m_44.x;
    float _90 = -_62;
    float _92 = fma(_90, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _94 = -_64;
    float _96 = fma(_94, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _98 = -_66;
    float _100 = fma(_98, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _102 = 1.0 / _92;
    float _104 = 1.0 / _96;
    float _106 = 1.0 / _100;
    float _108 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _110 = _102 * _108;
    float _112 = _78 * _110;
    float _114 = _80 * _110;
    float _116 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _118 = _104 * _116;
    float _120 = -_112;
    float _122 = fma(_118, _82, _120);
    float _124 = -_114;
    float _126 = fma(_118, _86, _124);
    float _128 = -_110;
    float _130 = _128 + _118;
    float _132 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _134 = _106 * _132;
    float _136 = _122 * _122;
    float _138 = -_112;
    float _140 = fma(_134, _84, _138);
    float _142 = -_114;
    float _144 = fma(_134, _88, _142);
    float _146 = fma(_126, _126, _136);
    float _148 = -_110;
    float _150 = _148 + _134;
    float _152 = _140 * _140;
    float _154 = fma(_130, _130, _146);
    float _156 = fma(_144, _144, _152);
    float _158 = fma(_150, _150, _156);
    float _160 = rsqrt(_154);
    float _162 = rsqrt(_158);
    float _164 = _126 * _160;
    float _166 = _130 * _160;
    float _168 = _122 * _160;
    float _170 = _150 * _162;
    float _172 = _144 * _162;
    float _174 = _140 * _162;
    float _176 = _164 * _170;
    float _178 = _166 * _174;
    float _180 = -_176;
    float _182 = fma(_166, _172, _180);
    float _184 = _168 * _172;
    float _186 = -_178;
    float _188 = fma(_168, _170, _186);
    float _190 = _182 * _182;
    float _192 = -_184;
    float _194 = fma(_164, _174, _192);
    float _196 = fma(_188, _188, _190);
    float _198 = fma(_194, _194, _196);
    float _200 = rsqrt(_198);
    float _202 = _182 * _200;
    float _204 = _188 * _200;
    float _206 = _194 * _200;
    float _208 = _202 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _210 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[35].x, _208);
    float _212 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[35].z, _210);
    float _214 = abs(_212);
    float _216 = -_214;
    float _218 = _216 + 1.0;
    float _220 = precise::clamp(_218, 0.0, 1.0);
    float _222 = abs(_220);
    float _224 = log2(_222);
    float _226 = -_68;
    float _228 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _230 = 1.0 / _228;
    float _232 = _224 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _234 = exp2(_232);
    float _236 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _238 = _230 * _236;
    float _240 = _238 * _78;
    float _242 = _238 * _80;
    float _244 = _240 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _246 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[15].x, _244);
    float _248 = _234 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _250 = _240 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _252 = fma(_238, (*spvDescriptorSet0.fp_c3)._m0[15].z, _246);
    float _254 = fma(_202, _248, _240);
    float _256 = fma(_204, _248, _242);
    float _258 = fma(_206, _248, _238);
    float _260 = _252 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _262 = _254 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _264 = _240 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _266 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[13].x, _250);
    float _268 = 1.0 / _260;
    float _270 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[3].x, _262);
    float _272 = _254 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _274 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[12].x, _264);
    float _276 = fma(_238, (*spvDescriptorSet0.fp_c3)._m0[13].z, _266);
    float _278 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[3].z, _270);
    float _280 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[2].x, _272);
    float _282 = fma(_238, (*spvDescriptorSet0.fp_c3)._m0[12].z, _274);
    float _284 = _278 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _286 = _254 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _288 = _276 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _290 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[2].z, _280);
    float _292 = 1.0 / _284;
    float _294 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[0].x, _286);
    float _296 = _282 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _298 = _254 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _300 = _290 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _302 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[0].z, _294);
    float _304 = _296 * _268;
    float _306 = _288 * _268;
    float _308 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[1].x, _298);
    float _310 = _302 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float2 _876 = float2(_304, _306);
    float2 _312 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_876, float2(0.0), isnan(_876))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_876, float2(0.0), isnan(_876))).xy;
    float _314 = _312.x;
    float _316 = _312.y;
    float _318 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[1].z, _308);
    float _320 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _322 = _300 * _292;
    float _324 = precise::clamp(_322, 0.0, 1.0);
    float _326 = _310 * _292;
    float _328 = _318 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _330 = rint(_324);
    float _332 = precise::max(_330, 0.0);
    uint _335 = uint(_332);
    uint _337 = clamp(_335, 0u, 65535u);
    float _339 = fma(_74, 2.0, -1.0);
    float _341 = _328 * _292;
    float _343 = fma(_76, 2.0, -1.0);
    float _345 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _347 = fma(_320, 0.5, _326);
    float _349 = fma(_320, -0.5, _326);
    float _351 = _339 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _353 = fma(_345, 0.5, _341);
    float _355 = _343 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _357 = fma(_351, 2.0, _54);
    float _359 = fma(_345, -0.5, _341);
    float _361 = fma(_355, 2.0, _56);
    float3 _968 = float3(_347, _353, float(int(_337)));
    float3 _972 = select(_968, float3(0.0), isnan(_968));
    float _363 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _972.xy, uint(rint(_972.z)), 1.0);
    float3 _980 = float3(_349, _353, float(int(_337)));
    float3 _982 = select(_980, float3(0.0), isnan(_980));
    float _365 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _982.xy, uint(rint(_982.z)), 1.0);
    float3 _990 = float3(_347, _359, float(int(_337)));
    float3 _992 = select(_990, float3(0.0), isnan(_990));
    float _367 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _992.xy, uint(rint(_992.z)), 1.0);
    float3 _1000 = float3(_349, _359, float(int(_337)));
    float3 _1002 = select(_1000, float3(0.0), isnan(_1000));
    float _369 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1002.xy, uint(rint(_1002.z)), 1.0);
    float2 _1007 = float2(_357, _361);
    float _371 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1007, float2(0.0), isnan(_1007))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1007, float2(0.0), isnan(_1007))).x;
    float _373 = _240 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _375 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[14].x, _373);
    float _377 = fma(_238, (*spvDescriptorSet0.fp_c3)._m0[14].z, _375);
    float _379 = _377 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _381 = precise::min(_379, 1.0);
    float _383 = -_238;
    float _385 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _387 = _383 + _385;
    float _389 = -_238;
    float _391 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _393 = _389 + _391;
    float _395 = _387 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _397 = precise::clamp(_395, 0.0, 1.0);
    float _399 = _393 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _401 = precise::clamp(_399, 0.0, 1.0);
    float _403 = -_314;
    float _405 = fma(_403, _314, _316);
    float _407 = -_314;
    float _409 = _381 + _407;
    float _411 = fma(_409, _409, _405);
    bool _415 = _409 <= 0.001000000047497451305389404296875;
    float _417 = float(_415);
    float _419 = 1.0 / _411;
    float _421 = _405 * _419;
    float _423 = _363 + _365;
    float _425 = _423 + _367;
    float _427 = precise::max(_421, _417);
    float _429 = _425 + _369;
    float _431 = precise::min(_427, 1.0);
    float _433 = fma(_429, 0.25, _397);
    float _435 = _401 + _431;
    out.m_47.x = _371;
    out.m_47.y = _433;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _435;
    return out;
}

