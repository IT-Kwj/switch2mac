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
    float2 _413 = float2(_54, _56);
    float3 _60 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_413, float2(0.0), isnan(_413)), int2(0), component::x).xyw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float2 _430 = float2(_54, _56);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_430, float2(0.0), isnan(_430))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_430, float2(0.0), isnan(_430))).x;
    float2 _438 = float2(_54, _56);
    float2 _72 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_438, float2(0.0), isnan(_438))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_438, float2(0.0), isnan(_438))).xy;
    float _74 = _72.x;
    float _76 = _72.y;
    float _78 = in.m_40.y;
    float _80 = in.m_42.y;
    float _82 = in.m_40.x;
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
    float _114 = _82 * _110;
    float _116 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _118 = _104 * _116;
    float _120 = -_112;
    float _122 = fma(_118, _80, _120);
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
    float _172 = _140 * _162;
    float _174 = _144 * _162;
    float _176 = _164 * _170;
    float _178 = _166 * _172;
    float _180 = -_176;
    float _182 = fma(_166, _174, _180);
    float _184 = _168 * _174;
    float _186 = -_178;
    float _188 = fma(_168, _170, _186);
    float _190 = -_68;
    float _192 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _194 = _182 * _182;
    float _196 = -_184;
    float _198 = fma(_164, _172, _196);
    float _200 = fma(_188, _188, _194);
    float _202 = 1.0 / _192;
    float _204 = fma(_198, _198, _200);
    float _206 = rsqrt(_204);
    float _208 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _210 = _202 * _208;
    float _212 = _210 * _78;
    float _214 = _182 * _206;
    float _216 = _188 * _206;
    float _218 = _198 * _206;
    float _220 = _214 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _222 = fma(_216, (*spvDescriptorSet0.fp_c3)._m0[35].x, _220);
    float _224 = _210 * _82;
    float _226 = _212 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _228 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[35].z, _222);
    float _230 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[15].x, _226);
    float _232 = _212 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _234 = abs(_228);
    float _236 = -_234;
    float _238 = _236 + 1.0;
    float _240 = precise::clamp(_238, 0.0, 1.0);
    float _242 = fma(_210, (*spvDescriptorSet0.fp_c3)._m0[15].z, _230);
    float _244 = abs(_240);
    float _246 = log2(_244);
    float _248 = _246 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _250 = _242 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _252 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[12].x, _232);
    float _254 = 1.0 / _250;
    float _256 = fma(_210, (*spvDescriptorSet0.fp_c3)._m0[12].z, _252);
    float _258 = _256 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _260 = exp2(_248);
    float _262 = _260 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _264 = _212 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _266 = fma(_214, _262, _212);
    float _268 = fma(_216, _262, _224);
    float _270 = fma(_218, _262, _210);
    float _272 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[13].x, _264);
    float _274 = _266 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _276 = _266 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _278 = fma(_210, (*spvDescriptorSet0.fp_c3)._m0[13].z, _272);
    float _280 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[3].x, _274);
    float _282 = _278 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _284 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[3].z, _280);
    float _286 = _266 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _288 = fma(_74, 2.0, -1.0);
    float _290 = _282 * _254;
    float _292 = _284 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _294 = _258 * _254;
    float _296 = _266 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _298 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[1].x, _286);
    float _300 = 1.0 / _292;
    float _302 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[0].x, _296);
    float _304 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[1].z, _298);
    float _306 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[2].x, _276);
    float _308 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[0].z, _302);
    float _310 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[2].z, _306);
    float _312 = _288 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _314 = _304 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _316 = fma(_76, 2.0, -1.0);
    float2 _855 = float2(_294, _290);
    float2 _318 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_855, float2(0.0), isnan(_855))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_855, float2(0.0), isnan(_855))).xy;
    float _320 = _318.x;
    float _322 = _318.y;
    float _324 = _308 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _326 = _310 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _328 = _316 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _330 = _314 * _300;
    float _332 = _324 * _300;
    float _334 = _326 * _300;
    float _336 = precise::clamp(_334, 0.0, 1.0);
    float _338 = fma(_328, 2.0, _56);
    float _340 = fma(_312, 2.0, _54);
    float3 _897 = float3(_332, _330, float(0));
    float3 _901 = select(_897, float3(0.0), isnan(_897));
    float _342 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _901.xy, uint(rint(_901.z)), _336);
    float2 _907 = float2(_340, _338);
    float _344 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_907, float2(0.0), isnan(_907))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_907, float2(0.0), isnan(_907))).x;
    float _346 = _212 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _348 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[14].x, _346);
    float _350 = fma(_210, (*spvDescriptorSet0.fp_c3)._m0[14].z, _348);
    float _352 = _350 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _354 = precise::min(_352, 1.0);
    float _356 = -_210;
    float _358 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _360 = _356 + _358;
    float _362 = -_210;
    float _364 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _366 = _362 + _364;
    float _368 = _360 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _370 = precise::clamp(_368, 0.0, 1.0);
    float _372 = _366 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _374 = precise::clamp(_372, 0.0, 1.0);
    float _376 = -_320;
    float _378 = fma(_376, _320, _322);
    float _380 = -_320;
    float _382 = _354 + _380;
    float _384 = fma(_382, _382, _378);
    bool _388 = _382 <= 0.001000000047497451305389404296875;
    float _390 = float(_388);
    float _392 = 1.0 / _384;
    float _394 = _370 + _342;
    float _396 = _378 * _392;
    float _398 = precise::max(_396, _390);
    float _400 = precise::min(_398, 1.0);
    float _402 = _374 + _400;
    out.m_47.x = _344;
    out.m_47.y = _394;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _402;
    return out;
}

