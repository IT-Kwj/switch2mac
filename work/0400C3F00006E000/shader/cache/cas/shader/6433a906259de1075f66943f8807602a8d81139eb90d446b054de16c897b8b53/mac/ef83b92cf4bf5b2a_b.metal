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
    texture2d<float> fp_t_tcb_E [[id(3)]];
    sampler fp_t_tcb_ESmplr [[id(4)]];
    texture2d_array<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_ESmplr_w [[id(10)]];
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
    float2 _393 = float2(_52, _54);
    float3 _58 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_393, float2(0.0), isnan(_393)), int2(0), component::x).xyw;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = _58.z;
    float2 _410 = float2(_52, _54);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_410, float2(0.0), isnan(_410))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_410, float2(0.0), isnan(_410))).x;
    float _68 = in.m_38.y;
    float _70 = in.m_40.y;
    float _72 = in.m_38.x;
    float _74 = in.m_42.y;
    float _76 = in.m_40.x;
    float _78 = in.m_42.x;
    float _80 = -_60;
    float _82 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _84 = -_62;
    float _86 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _88 = -_64;
    float _90 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _92 = 1.0 / _82;
    float _94 = 1.0 / _86;
    float _96 = 1.0 / _90;
    float _98 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _100 = _92 * _98;
    float _102 = _68 * _100;
    float _104 = _72 * _100;
    float _106 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _108 = _94 * _106;
    float _110 = -_102;
    float _112 = fma(_108, _70, _110);
    float _114 = -_104;
    float _116 = fma(_108, _76, _114);
    float _118 = -_100;
    float _120 = _118 + _108;
    float _122 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _124 = _96 * _122;
    float _126 = _112 * _112;
    float _128 = -_102;
    float _130 = fma(_124, _74, _128);
    float _132 = -_104;
    float _134 = fma(_124, _78, _132);
    float _136 = fma(_116, _116, _126);
    float _138 = -_100;
    float _140 = _138 + _124;
    float _142 = _130 * _130;
    float _144 = fma(_120, _120, _136);
    float _146 = fma(_134, _134, _142);
    float _148 = fma(_140, _140, _146);
    float _150 = rsqrt(_144);
    float _152 = rsqrt(_148);
    float _154 = _116 * _150;
    float _156 = _120 * _150;
    float _158 = _112 * _150;
    float _160 = _140 * _152;
    float _162 = _130 * _152;
    float _164 = _134 * _152;
    float _166 = _154 * _160;
    float _168 = _156 * _162;
    float _170 = -_166;
    float _172 = fma(_156, _164, _170);
    float _174 = _158 * _164;
    float _176 = -_168;
    float _178 = fma(_158, _160, _176);
    float _180 = _172 * _172;
    float _182 = -_174;
    float _184 = fma(_154, _162, _182);
    float _186 = fma(_178, _178, _180);
    float _188 = fma(_184, _184, _186);
    float _190 = rsqrt(_188);
    float _192 = _172 * _190;
    float _194 = _178 * _190;
    float _196 = _184 * _190;
    float _198 = _192 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _200 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[35].x, _198);
    float _202 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[35].z, _200);
    float _204 = abs(_202);
    float _206 = -_204;
    float _208 = _206 + 1.0;
    float _210 = precise::clamp(_208, 0.0, 1.0);
    float _212 = abs(_210);
    float _214 = log2(_212);
    float _216 = -_66;
    float _218 = fma(_216, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _220 = 1.0 / _218;
    float _222 = _214 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _224 = exp2(_222);
    float _226 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _228 = _220 * _226;
    float _230 = _228 * _68;
    float _232 = _228 * _72;
    float _234 = _230 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _236 = _230 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _238 = _230 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _240 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[15].x, _234);
    float _242 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[13].x, _236);
    float _244 = _224 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _246 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[12].x, _238);
    float _248 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[15].z, _240);
    float _250 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[13].z, _242);
    float _252 = fma(_192, _244, _230);
    float _254 = fma(_194, _244, _232);
    float _256 = _248 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _258 = fma(_196, _244, _228);
    float _260 = _252 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _262 = _252 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _264 = _252 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _266 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[12].z, _246);
    float _268 = fma(_254, (*spvDescriptorSet0.fp_c3)._m0[3].x, _260);
    float _270 = 1.0 / _256;
    float _272 = _252 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _274 = fma(_254, (*spvDescriptorSet0.fp_c3)._m0[1].x, _262);
    float _276 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[3].z, _268);
    float _278 = _266 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _280 = _276 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _282 = fma(_254, (*spvDescriptorSet0.fp_c3)._m0[0].x, _272);
    float _284 = fma(_254, (*spvDescriptorSet0.fp_c3)._m0[2].x, _264);
    float _286 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[1].z, _274);
    float _288 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[0].z, _282);
    float _290 = 1.0 / _280;
    float _292 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[2].z, _284);
    float _294 = _250 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _296 = _288 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _298 = _286 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _300 = _292 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _302 = _278 * _270;
    float _304 = _294 * _270;
    float _306 = _296 * _290;
    float _308 = _298 * _290;
    float _310 = _300 * _290;
    float _312 = precise::clamp(_310, 0.0, 1.0);
    float2 _831 = float2(_302, _304);
    float2 _316 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_831, float2(0.0), isnan(_831))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_831, float2(0.0), isnan(_831))).xy;
    float _318 = _316.x;
    float _320 = _316.y;
    float3 _844 = float3(_306, _308, float(0));
    float3 _848 = select(_844, float3(0.0), isnan(_844));
    float _322 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _848.xy, uint(rint(_848.z)), _312);
    float2 _854 = float2(_52, _54);
    float _324 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_854, float2(0.0), isnan(_854))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_854, float2(0.0), isnan(_854))).x;
    float _326 = _230 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _328 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[14].x, _326);
    float _330 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[14].z, _328);
    float _332 = _330 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _334 = precise::min(_332, 1.0);
    float _336 = -_228;
    float _338 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _340 = _336 + _338;
    float _342 = -_228;
    float _344 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _346 = _342 + _344;
    float _348 = _340 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _350 = precise::clamp(_348, 0.0, 1.0);
    float _352 = _346 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _354 = precise::clamp(_352, 0.0, 1.0);
    float _356 = -_318;
    float _358 = fma(_356, _318, _320);
    float _360 = -_318;
    float _362 = _334 + _360;
    float _364 = _350 + _322;
    float _366 = fma(_362, _362, _358);
    bool _370 = _362 <= 0.001000000047497451305389404296875;
    float _372 = float(_370);
    float _374 = 1.0 / _366;
    float _376 = _358 * _374;
    float _378 = precise::max(_376, _372);
    float _380 = precise::min(_378, 1.0);
    float _382 = _354 + _380;
    out.m_45.x = _324;
    out.m_45.y = _364;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _382;
    return out;
}

