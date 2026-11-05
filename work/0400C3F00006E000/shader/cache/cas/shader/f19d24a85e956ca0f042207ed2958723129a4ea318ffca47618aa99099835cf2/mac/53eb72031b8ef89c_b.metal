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
    constant _16* fp_c9 [[id(0)]];
    constant _16* fp_c15 [[id(1)]];
    constant _16* fp_c8 [[id(2)]];
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d_array<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_55 [[color(0)]];
};

struct main0_in
{
    float4 m_46 [[user(locn0)]];
    float4 m_50 [[user(locn1)]];
    float4 m_42 [[user(locn2)]];
    float4 m_59 [[user(locn3)]];
    float4 m_52 [[user(locn4)]];
    float4 m_48 [[user(locn5)]];
    float4 m_40 [[user(locn6)]];
    float4 m_38 [[user(locn7), flat]];
    float4 m_44 [[user(locn8)]];
    float4 m_57 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _66 = gl_FragCoord.w;
    float _68 = in.m_38.x;
    float _70 = in.m_40.z;
    float _72 = gl_FragCoord.w;
    float _74 = _70 * _72;
    float _76 = in.m_40.y;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = in.m_40.x;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = in.m_40.w;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = 1.0 / _66;
    float _96 = rint(_68);
    float _98 = precise::max(_96, 0.0);
    uint _101 = uint(_98);
    uint _103 = clamp(_101, 0u, 65535u);
    float _105 = _94 * _74;
    float _107 = _94 * _80;
    float _109 = _94 * _86;
    float _111 = _94 * _92;
    float2 _551 = float2(_105, _111);
    float _113 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_551, float2(0.0), isnan(_551))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_551, float2(0.0), isnan(_551))).w;
    float3 _565 = float3(_109, _107, float(int(_103)));
    float3 _569 = select(_565, float3(0.0), isnan(_565));
    float4 _116 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _569.xy, uint(rint(_569.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _569.xy, uint(rint(_569.z))).xyzw;
    float _118 = _116.x;
    float _120 = _116.y;
    float _122 = _116.z;
    float _124 = _116.w;
    float _126 = in.m_42.y;
    float _128 = gl_FragCoord.w;
    float _130 = _126 * _128;
    float _132 = in.m_42.x;
    float _134 = gl_FragCoord.w;
    float _136 = _132 * _134;
    float _138 = in.m_42.z;
    float _140 = gl_FragCoord.w;
    float _142 = _138 * _140;
    float _144 = in.m_44.y;
    float _146 = gl_FragCoord.w;
    float _148 = _144 * _146;
    float _150 = in.m_44.x;
    float _152 = gl_FragCoord.w;
    float _154 = _150 * _152;
    float _156 = in.m_44.z;
    float _158 = gl_FragCoord.w;
    float _160 = _156 * _158;
    float _162 = _94 * _130;
    float _164 = _94 * _136;
    float _166 = _94 * _142;
    float _168 = _94 * _148;
    float _170 = _162 * _162;
    float _172 = in.m_46.w;
    float _174 = gl_FragCoord.w;
    float _176 = _172 * _174;
    float _178 = in.m_48.w;
    float _180 = gl_FragCoord.w;
    float _182 = _178 * _180;
    float _184 = fma(_164, _164, _170);
    float _186 = fma(_166, _166, _184);
    float _188 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _190 = _188 + (*spvDescriptorSet0.fp_c9)._m0[139].w;
    float _192 = 1.0 / _190;
    float _194 = rsqrt(_186);
    float _196 = _162 * _194;
    float _198 = _168 * _196;
    float _200 = _94 * _154;
    float _202 = _164 * _194;
    float _204 = in.m_50.w;
    float _206 = gl_FragCoord.w;
    float _208 = _204 * _206;
    float _210 = _166 * _194;
    float _212 = fma(_200, _202, _198);
    float _214 = _94 * _160;
    float _216 = in.m_52.x;
    float _218 = gl_FragCoord.w;
    float _220 = _216 * _218;
    float _222 = fma(_214, _210, _212);
    float _224 = abs(_222);
    float _226 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _228 = _224 + _226;
    float _230 = _228 * _192;
    float _232 = precise::clamp(_230, 0.0, 1.0);
    float _234 = fma(_232, -2.0, 3.0);
    float _236 = _232 * _232;
    float _238 = _94 * _176;
    float _240 = _234 * _236;
    float _242 = _94 * _220;
    float _244 = in.m_46.y;
    float _246 = gl_FragCoord.w;
    float _248 = _244 * _246;
    float _250 = in.m_50.x;
    float _252 = gl_FragCoord.w;
    float _254 = _250 * _252;
    float _256 = in.m_46.z;
    float _258 = gl_FragCoord.w;
    float _260 = _256 * _258;
    float _262 = in.m_48.x;
    float _264 = gl_FragCoord.w;
    float _266 = _262 * _264;
    float _268 = in.m_48.y;
    float _270 = gl_FragCoord.w;
    float _272 = _268 * _270;
    float _274 = in.m_48.z;
    float _276 = gl_FragCoord.w;
    float _278 = _274 * _276;
    float _280 = _94 * _254;
    float _282 = _124 * _113;
    float _284 = _94 * _182;
    float _286 = -_238;
    float _288 = fma(_282, _284, _286);
    float _290 = _94 * _208;
    float _292 = _290 * _288;
    float _294 = 0.0 + _292;
    float _296 = precise::clamp(_294, 0.0, 1.0);
    float _298 = _296 * _240;
    float _300 = _298 * _242;
    bool _304 = _300 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _306 = isnan(_300);
    bool _308 = _304 || _306;
    bool _310 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _312 = _308 || _310;
    float _314 = in.m_46.x;
    float _316 = gl_FragCoord.w;
    float _318 = _314 * _316;
    float _320 = in.m_50.y;
    float _322 = gl_FragCoord.w;
    float _324 = _320 * _322;
    float _326 = in.m_50.z;
    float _328 = gl_FragCoord.w;
    float _330 = _326 * _328;
    if (!_312)
    {
        discard_fragment();
    }
    float _332 = _94 * _260;
    float _334 = _94 * _318;
    float _336 = _94 * _248;
    float _338 = _94 * _324;
    float _340 = _94 * _330;
    float _342 = -_280;
    float _344 = _334 + _342;
    float _346 = -_338;
    float _348 = _336 + _346;
    float _350 = -_340;
    float _352 = _332 + _350;
    float _354 = fma(_118, _344, _280);
    float _356 = _94 * _272;
    float _358 = fma(_120, _348, _338);
    float _360 = fma(_122, _352, _340);
    float _362 = _94 * _266;
    float _364 = _94 * _278;
    float _366 = _358 * _356;
    float _368 = _354 * _362;
    float _370 = _360 * _364;
    if (!_312)
    {
        out.m_55.x = _368;
        out.m_55.y = _366;
        out.m_55.z = _370;
        out.m_55.w = _292;
        return out;
    }
    float _372 = _366 * 0.715200006961822509765625;
    float _374 = in.m_57.w;
    float _376 = gl_FragCoord.w;
    float _378 = _374 * _376;
    float _380 = in.m_57.z;
    float _382 = gl_FragCoord.w;
    float _384 = _380 * _382;
    float _386 = in.m_57.x;
    float _388 = gl_FragCoord.w;
    float _390 = _386 * _388;
    float _392 = fma(_368, 0.2125999927520751953125, _372);
    float _394 = in.m_57.y;
    float _396 = gl_FragCoord.w;
    float _398 = _394 * _396;
    float _400 = 0.0 + _300;
    float _402 = precise::clamp(_400, 0.0, 1.0);
    float _404 = fma(_370, 0.072200000286102294921875, _392);
    bool _406 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _408 = 1.0 / _404;
    float _410 = _408 * (*spvDescriptorSet0.fp_c15)._m0[661].z;
    float _412 = precise::clamp(_410, 0.0, 1.0);
    float _414 = _94 * _378;
    float _416 = fma(_412, (*spvDescriptorSet0.fp_c15)._m0[661].y, (*spvDescriptorSet0.fp_c15)._m0[661].x);
    float _418 = _94 * _384;
    float _420 = _416 * _414;
    float _422 = _94 * _390;
    float _424 = _94 * _398;
    float _426 = fma(_370, _420, _418);
    float _428 = fma(_368, _420, _422);
    float _430 = fma(_366, _420, _424);
    float _432 = _418;
    if (!_406)
    {
        _432 = _402;
    }
    float _434 = _432;
    bool _436 = !_406;
    float _438 = _434;
    if (!_436)
    {
        float _440 = in.m_59.w;
        float _442 = gl_FragCoord.w;
        float _444 = _440 * _442;
        float _446 = in.m_59.z;
        float _448 = gl_FragCoord.w;
        float _450 = _446 * _448;
        float _452 = _94 * _444;
        float _454 = _94 * _450;
        float _456 = 1.0 / _452;
        float _458 = _454 * _456;
        float _460 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _462 = fma(_458, (*spvDescriptorSet0.fp_c8)._m0[30].w, _460);
        float _464 = 1.0 / _462;
        float _466 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _468 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _470 = fma(_464, _466, _468);
        float _472 = _470 * 8.0;
        float _474 = precise::clamp(_472, 0.0, 1.0);
        float _476 = _402 * _474;
        _438 = _476;
    }
    float _478 = _438;
    float _480 = 0.0 + _478;
    float _482 = precise::clamp(_480, 0.0, 1.0);
    out.m_55.x = _428;
    out.m_55.y = _430;
    out.m_55.z = _426;
    out.m_55.w = _482;
    return out;
}

