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
    float2 _423 = float2(_54, _56);
    float3 _60 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_423, float2(0.0), isnan(_423)), int2(0), component::x).xyw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float2 _440 = float2(_54, _56);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_440, float2(0.0), isnan(_440))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_440, float2(0.0), isnan(_440))).x;
    float2 _448 = float2(_54, _56);
    float2 _72 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_448, float2(0.0), isnan(_448))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_448, float2(0.0), isnan(_448))).xy;
    float _74 = _72.x;
    float _76 = _72.y;
    float _78 = in.m_40.y;
    float _80 = in.m_42.y;
    float _82 = in.m_40.x;
    float _84 = in.m_44.y;
    float _86 = in.m_42.x;
    float _88 = in.m_44.x;
    float _90 = -_62;
    float _92 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _94 = fma(_90, (*spvDescriptorSet0.fp_c3)._m0[46].z, _92);
    float _96 = -_64;
    float _98 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _100 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[46].z, _98);
    float _102 = _78 * _94;
    float _104 = _82 * _94;
    float _106 = -_102;
    float _108 = fma(_100, _80, _106);
    float _110 = -_66;
    float _112 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _114 = fma(_110, (*spvDescriptorSet0.fp_c3)._m0[46].z, _112);
    float _116 = -_104;
    float _118 = fma(_100, _86, _116);
    float _120 = -_94;
    float _122 = _120 + _100;
    float _124 = _108 * _108;
    float _126 = -_102;
    float _128 = fma(_114, _84, _126);
    float _130 = -_104;
    float _132 = fma(_114, _88, _130);
    float _134 = -_94;
    float _136 = _134 + _114;
    float _138 = fma(_118, _118, _124);
    float _140 = _128 * _128;
    float _142 = fma(_122, _122, _138);
    float _144 = fma(_132, _132, _140);
    float _146 = fma(_136, _136, _144);
    float _148 = rsqrt(_142);
    float _150 = rsqrt(_146);
    float _152 = _118 * _148;
    float _154 = _122 * _148;
    float _156 = _108 * _148;
    float _158 = _136 * _150;
    float _160 = _132 * _150;
    float _162 = _128 * _150;
    float _164 = _152 * _158;
    float _166 = _154 * _162;
    float _168 = -_164;
    float _170 = fma(_154, _160, _168);
    float _172 = _156 * _160;
    float _174 = -_166;
    float _176 = fma(_156, _158, _174);
    float _178 = _170 * _170;
    float _180 = -_172;
    float _182 = fma(_152, _162, _180);
    float _184 = fma(_176, _176, _178);
    float _186 = fma(_182, _182, _184);
    float _188 = rsqrt(_186);
    float _190 = _170 * _188;
    float _192 = _176 * _188;
    float _194 = _182 * _188;
    float _196 = _190 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _198 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[35].x, _196);
    float _200 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[35].z, _198);
    float _202 = abs(_200);
    float _204 = -_202;
    float _206 = _204 + 1.0;
    float _208 = precise::clamp(_206, 0.0, 1.0);
    float _210 = abs(_208);
    float _212 = log2(_210);
    float _214 = -_68;
    float _216 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _218 = fma(_214, (*spvDescriptorSet0.fp_c3)._m0[46].z, _216);
    float _220 = _218 * _78;
    float _222 = _218 * _82;
    float _224 = _220 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _226 = _220 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _228 = _220 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _230 = fma(_222, (*spvDescriptorSet0.fp_c3)._m0[15].x, _224);
    float _232 = fma(_222, (*spvDescriptorSet0.fp_c3)._m0[12].x, _226);
    float _234 = fma(_222, (*spvDescriptorSet0.fp_c3)._m0[13].x, _228);
    float _236 = _212 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _238 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[15].z, _230);
    float _240 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[12].z, _232);
    float _242 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[13].z, _234);
    float _244 = exp2(_236);
    float _246 = _242 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _248 = _244 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _250 = fma(_190, _248, _220);
    float _252 = _238 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _254 = fma(_192, _248, _222);
    float _256 = fma(_194, _248, _218);
    float _258 = _250 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _260 = _250 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _262 = _250 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _264 = 1.0 / _252;
    float _266 = fma(_254, (*spvDescriptorSet0.fp_c3)._m0[3].x, _258);
    float _268 = fma(_254, (*spvDescriptorSet0.fp_c3)._m0[1].x, _260);
    float _270 = fma(_254, (*spvDescriptorSet0.fp_c3)._m0[2].x, _262);
    float _272 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[3].z, _266);
    float _274 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[1].z, _268);
    float _276 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[2].z, _270);
    float _278 = _272 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _280 = _250 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _282 = _240 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _284 = _274 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _286 = 1.0 / _278;
    float _288 = fma(_254, (*spvDescriptorSet0.fp_c3)._m0[0].x, _280);
    float _290 = _282 * _264;
    float _292 = _246 * _264;
    float _294 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[0].z, _288);
    float2 _838 = float2(_290, _292);
    float2 _296 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_838, float2(0.0), isnan(_838))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_838, float2(0.0), isnan(_838))).xy;
    float _298 = _296.x;
    float _300 = _296.y;
    float _302 = _276 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _304 = _294 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _306 = _302 * _286;
    float _308 = precise::clamp(_306, 0.0, 1.0);
    float _310 = fma(_74, 2.0, -1.0);
    float _312 = fma(_76, 2.0, -1.0);
    float _314 = _304 * _286;
    float _316 = _308 * (*spvDescriptorSet0.fp_c3)._m0[47].x;
    float _318 = _310 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _320 = _312 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _322 = _284 * _286;
    float _324 = _316 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _326 = _316 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _328 = fma(_320, 2.0, _56);
    float _330 = fma(_324, 0.5, _314);
    float _332 = fma(_324, -0.5, _314);
    float _334 = fma(_326, 0.5, _322);
    float _336 = fma(_326, -0.5, _322);
    float _338 = fma(_318, 2.0, _54);
    float3 _919 = float3(_330, _334, float(0));
    float3 _923 = select(_919, float3(0.0), isnan(_919));
    float _340 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _923.xy, uint(rint(_923.z)), _308);
    float3 _930 = float3(_332, _334, float(0));
    float3 _932 = select(_930, float3(0.0), isnan(_930));
    float _342 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _932.xy, uint(rint(_932.z)), _308);
    float3 _939 = float3(_330, _336, float(0));
    float3 _941 = select(_939, float3(0.0), isnan(_939));
    float _344 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _941.xy, uint(rint(_941.z)), _308);
    float3 _948 = float3(_332, _336, float(0));
    float3 _950 = select(_948, float3(0.0), isnan(_948));
    float _346 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _950.xy, uint(rint(_950.z)), _308);
    float2 _956 = float2(_338, _328);
    float _348 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_956, float2(0.0), isnan(_956))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_956, float2(0.0), isnan(_956))).x;
    float _350 = _220 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _352 = fma(_222, (*spvDescriptorSet0.fp_c3)._m0[14].x, _350);
    float _354 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[14].z, _352);
    float _356 = _354 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _358 = precise::min(_356, 1.0);
    float _360 = -_218;
    float _362 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _364 = _360 + _362;
    float _366 = -_218;
    float _368 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _370 = _366 + _368;
    float _372 = _364 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _374 = precise::clamp(_372, 0.0, 1.0);
    float _376 = _370 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _378 = precise::clamp(_376, 0.0, 1.0);
    float _380 = -_298;
    float _382 = fma(_380, _298, _300);
    float _384 = -_298;
    float _386 = _358 + _384;
    float _388 = fma(_386, _386, _382);
    bool _392 = _386 <= 0.001000000047497451305389404296875;
    float _394 = float(_392);
    float _396 = 1.0 / _388;
    float _398 = _382 * _396;
    float _400 = _340 + _342;
    float _402 = _400 + _344;
    float _404 = precise::max(_398, _394);
    float _406 = _402 + _346;
    float _408 = precise::min(_404, 1.0);
    float _410 = fma(_406, 0.25, _374);
    float _412 = _378 + _408;
    out.m_47.x = _348;
    out.m_47.y = _410;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _412;
    return out;
}

