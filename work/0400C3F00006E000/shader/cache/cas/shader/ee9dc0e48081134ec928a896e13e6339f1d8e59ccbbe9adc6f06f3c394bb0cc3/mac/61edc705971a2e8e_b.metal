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
    float2 _415 = float2(_50, _52);
    float3 _56 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_415, float2(0.0), isnan(_415)), int2(0), component::x).xyw;
    float _58 = _56.x;
    float _60 = _56.y;
    float _62 = _56.z;
    float2 _432 = float2(_50, _52);
    float _64 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_432, float2(0.0), isnan(_432))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_432, float2(0.0), isnan(_432))).x;
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
    float _164 = rsqrt(_160);
    float _166 = _120 * _162;
    float _168 = _124 * _162;
    float _170 = _116 * _162;
    float _172 = _144 * _164;
    float _174 = _134 * _164;
    float _176 = _138 * _164;
    float _178 = _166 * _172;
    float _180 = _168 * _174;
    float _182 = -_178;
    float _184 = fma(_168, _176, _182);
    float _186 = -_180;
    float _188 = fma(_170, _172, _186);
    float _190 = _170 * _176;
    float _192 = _184 * _184;
    float _194 = -_190;
    float _196 = fma(_166, _174, _194);
    float _198 = fma(_188, _188, _192);
    float _200 = fma(_196, _196, _198);
    float _202 = rsqrt(_200);
    float _204 = _156 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _206 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[15].x, _204);
    float _208 = _184 * _202;
    float _210 = _188 * _202;
    float _212 = _196 * _202;
    float _214 = _208 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _216 = fma(_210, (*spvDescriptorSet0.fp_c3)._m0[35].x, _214);
    float _218 = fma(_212, (*spvDescriptorSet0.fp_c3)._m0[35].z, _216);
    float _220 = abs(_218);
    float _222 = -_220;
    float _224 = _222 + 1.0;
    float _226 = precise::clamp(_224, 0.0, 1.0);
    float _228 = abs(_226);
    float _230 = log2(_228);
    float _232 = _230 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _234 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[15].z, _206);
    float _236 = _156 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _238 = _234 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _240 = exp2(_232);
    float _242 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[12].x, _236);
    float _244 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[12].z, _242);
    float _246 = 1.0 / _238;
    float _248 = _244 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _250 = _240 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _252 = fma(_208, _250, _156);
    float _254 = fma(_210, _250, _158);
    float _256 = fma(_212, _250, _150);
    float _258 = _252 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _260 = _252 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _262 = fma(_254, (*spvDescriptorSet0.fp_c3)._m0[3].x, _258);
    float _264 = fma(_254, (*spvDescriptorSet0.fp_c3)._m0[0].x, _260);
    float _266 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[3].z, _262);
    float _268 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[0].z, _264);
    float _270 = _266 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _272 = _252 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _274 = _252 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _276 = _268 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _278 = fma(_254, (*spvDescriptorSet0.fp_c3)._m0[1].x, _272);
    float _280 = 1.0 / _270;
    float _282 = fma(_254, (*spvDescriptorSet0.fp_c3)._m0[2].x, _274);
    float _284 = _156 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _286 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[1].z, _278);
    float _288 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[2].z, _282);
    float _290 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[13].x, _284);
    float _292 = _286 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _294 = _288 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _296 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[13].z, _290);
    float _298 = _248 * _246;
    float _300 = _296 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _302 = _294 * _280;
    float _304 = precise::clamp(_302, 0.0, 1.0);
    float _306 = _276 * _280;
    float _308 = _292 * _280;
    float _310 = _300 * _246;
    float _312 = _304 * (*spvDescriptorSet0.fp_c3)._m0[47].x;
    float _314 = _312 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _316 = _312 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _318 = fma(_314, 0.5, _306);
    float _320 = fma(_314, -0.5, _306);
    float _322 = fma(_316, 0.5, _308);
    float _324 = fma(_316, -0.5, _308);
    float2 _881 = float2(_298, _310);
    float2 _328 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_881, float2(0.0), isnan(_881))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_881, float2(0.0), isnan(_881))).xy;
    float _330 = _328.x;
    float _332 = _328.y;
    float3 _894 = float3(_318, _322, float(0));
    float3 _898 = select(_894, float3(0.0), isnan(_894));
    float _334 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _898.xy, uint(rint(_898.z)), _304);
    float3 _905 = float3(_320, _322, float(0));
    float3 _907 = select(_905, float3(0.0), isnan(_905));
    float _336 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _907.xy, uint(rint(_907.z)), _304);
    float3 _914 = float3(_318, _324, float(0));
    float3 _916 = select(_914, float3(0.0), isnan(_914));
    float _338 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _916.xy, uint(rint(_916.z)), _304);
    float3 _923 = float3(_320, _324, float(0));
    float3 _925 = select(_923, float3(0.0), isnan(_923));
    float _340 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _925.xy, uint(rint(_925.z)), _304);
    float _342 = _156 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _344 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[14].x, _342);
    float _346 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[14].z, _344);
    float _348 = _346 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _350 = precise::min(_348, 1.0);
    float _352 = -_330;
    float _354 = fma(_352, _330, _332);
    float _356 = -_330;
    float _358 = _350 + _356;
    float _360 = _334 + _336;
    float _362 = -_150;
    float _364 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _366 = _362 + _364;
    float _368 = -_150;
    float _370 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _372 = _368 + _370;
    float _374 = fma(_358, _358, _354);
    bool _378 = _358 <= 0.001000000047497451305389404296875;
    float _380 = float(_378);
    float _382 = _366 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _384 = precise::clamp(_382, 0.0, 1.0);
    float _386 = _360 + _338;
    float _388 = _372 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _390 = precise::clamp(_388, 0.0, 1.0);
    float _392 = 1.0 / _374;
    float _394 = _386 + _340;
    float _396 = fma(_394, 0.25, _390);
    float _398 = _354 * _392;
    float _400 = precise::max(_398, _380);
    float _402 = precise::min(_400, 1.0);
    float _404 = _384 + _402;
    out.m_43.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_43.y = _396;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _404;
    return out;
}

