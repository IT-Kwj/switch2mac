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
    constant _16* fp_c10 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    constant _16* fp_c8 [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_34 [[id(6)]];
    sampler fp_t_tcb_34Smplr [[id(7)]];
    texture2d<float> fp_t_tcb_A [[id(8)]];
    sampler fp_t_tcb_ASmplr [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_34Smplr_w [[id(11)]];
    sampler fp_t_tcb_ASmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_58 [[color(0)]];
};

struct main0_in
{
    float4 m_45 [[user(locn0)]];
    float4 m_43 [[user(locn1)]];
    float4 m_60 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_39 [[user(locn4)]];
    float4 m_41 [[user(locn5)]];
    float4 m_49 [[user(locn6)]];
    float4 m_55 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], bool gl_FrontFacing [[front_facing]])
{
    main0_out out = {};
    float _67 = gl_FragCoord.w;
    float _69 = in.m_39.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_41.y;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_39.y;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_41.x;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = 1.0 / _67;
    float _95 = _93 * _73;
    float _97 = _93 * _79;
    float _99 = _93 * _85;
    float _101 = _93 * _91;
    float2 _546 = float2(_95, _99);
    float _103 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_546, float2(0.0), isnan(_546))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_546, float2(0.0), isnan(_546))).w;
    float2 _557 = float2(_101, _97);
    float _105 = dm_bs(spvDescriptorSet0.fp_t_tcb_34.sample(spvDescriptorSet0.fp_t_tcb_34Smplr, select(_557, float2(0.0), isnan(_557))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_34, spvDescriptorSet0.fp_t_tcb_34Smplr_w, select(_557, float2(0.0), isnan(_557))).w;
    float _107 = in.m_43.w;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = in.m_45.w;
    float _115 = gl_FragCoord.w;
    float _117 = _113 * _115;
    float _119 = in.m_47.x;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = _93 * _111;
    float _127 = -_125;
    float _129 = _127 + 1.0;
    float _131 = -_125;
    float _133 = _131 + 1.10000002384185791015625;
    float _135 = _103 * _105;
    float _137 = precise::max(_129, _135);
    float _139 = precise::min(_133, _137);
    float _141 = -_129;
    float _143 = _141 + _139;
    float _145 = _93 * _117;
    float _147 = _143 * 9.9999980926513671875;
    float _149 = _145 * _147;
    float _151 = _93 * _123;
    float _153 = 0.0 + _149;
    float _155 = precise::clamp(_153, 0.0, 1.0);
    float _157 = _155 * _151;
    bool _160 = _157 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _162 = isnan(_157);
    bool _164 = _160 || _162;
    bool _166 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _168 = _164 || _166;
    float _170 = in.m_39.z;
    float _172 = gl_FragCoord.w;
    float _174 = _170 * _172;
    float _176 = in.m_39.w;
    float _178 = gl_FragCoord.w;
    float _180 = _176 * _178;
    if (!_168)
    {
        discard_fragment();
    }
    float _182 = _93 * _174;
    float _184 = _93 * _180;
    float2 _674 = float2(_182, _184);
    float3 _188 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_674, float2(0.0), isnan(_674))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_674, float2(0.0), isnan(_674))).xyz;
    float _190 = _188.x;
    float _192 = _188.y;
    float _194 = _188.z;
    float _196 = in.m_49.y;
    float _198 = gl_FragCoord.w;
    float _200 = _196 * _198;
    float _202 = as_type<float>(gl_FrontFacing ? (-1) : 0);
    float _204 = in.m_49.x;
    float _206 = gl_FragCoord.w;
    float _208 = _204 * _206;
    float _210 = in.m_49.z;
    float _212 = gl_FragCoord.w;
    float _214 = _210 * _212;
    float _216 = in.m_55.y;
    float _218 = gl_FragCoord.w;
    float _220 = _216 * _218;
    float _222 = in.m_55.z;
    float _224 = gl_FragCoord.w;
    float _226 = _222 * _224;
    float _228 = in.m_55.x;
    float _230 = gl_FragCoord.w;
    float _232 = _228 * _230;
    float _234 = in.m_43.y;
    float _236 = gl_FragCoord.w;
    float _238 = _234 * _236;
    float _240 = in.m_43.z;
    float _242 = gl_FragCoord.w;
    float _244 = _240 * _242;
    float _246 = in.m_45.x;
    float _248 = gl_FragCoord.w;
    float _250 = _246 * _248;
    float _252 = in.m_45.y;
    float _254 = gl_FragCoord.w;
    float _256 = _252 * _254;
    float _258 = _93 * _200;
    bool _260 = as_type<int>(_202) != 0;
    float _262 = _93 * _208;
    bool _264 = !_260;
    float _266 = -_258;
    float _268 = _264 ? _266 : _258;
    float _270 = _93 * _214;
    bool _272 = !_260;
    float _274 = -_262;
    float _276 = _272 ? _274 : _262;
    float _278 = _93 * _232;
    float _280 = _268 * _268;
    bool _282 = !_260;
    float _284 = -_270;
    float _286 = _282 ? _284 : _270;
    float _288 = _93 * _220;
    float _290 = -(*spvDescriptorSet0.fp_c10)._m0[8].w;
    float _292 = _278 + _290;
    float _294 = fma(_276, _276, _280);
    float _296 = -(*spvDescriptorSet0.fp_c10)._m0[9].w;
    float _298 = _288 + _296;
    float _300 = _93 * _226;
    float _302 = fma(_286, _286, _294);
    float _304 = in.m_43.x;
    float _306 = gl_FragCoord.w;
    float _308 = _304 * _306;
    float _310 = _298 * _298;
    float _312 = -(*spvDescriptorSet0.fp_c10)._m0[10].w;
    float _314 = _300 + _312;
    float _316 = rsqrt(_302);
    float _318 = fma(_292, _292, _310);
    float _320 = fma(_314, _314, _318);
    float _322 = rsqrt(_320);
    float _324 = _268 * _316;
    float _326 = _276 * _316;
    float _328 = _286 * _316;
    float _330 = _93 * _244;
    float _332 = _324 * _324;
    float _334 = -_330;
    float _336 = _334 + 1.0;
    float _338 = fma(_326, _326, _332);
    float _340 = _298 * _322;
    float _342 = _292 * _322;
    float _344 = _314 * _322;
    float _346 = fma(_328, _328, _338);
    float _348 = in.m_45.z;
    float _350 = gl_FragCoord.w;
    float _352 = _348 * _350;
    float _354 = rsqrt(_346);
    float _356 = _324 * _354;
    float _358 = _328 * _354;
    float _360 = _340 * _356;
    float _362 = _326 * _354;
    float _364 = _93 * _256;
    float _366 = fma(_342, _362, _360);
    float _368 = _93 * _250;
    float _370 = _93 * _352;
    float _372 = fma(_344, _358, _366);
    float _374 = _93 * _308;
    float _376 = fma(_372, 0.5, 0.5);
    float _378 = _93 * _238;
    float _380 = -_374;
    float _382 = _380 + 1.0;
    bool _384 = _376 < 0.5;
    float _386 = float(_384);
    float _388 = -_378;
    float _390 = _388 + 1.0;
    float _392 = -_382;
    float _394 = fma(_392, _386, 1.0);
    float _396 = -_390;
    float _398 = fma(_396, _386, 1.0);
    float _400 = -_336;
    float _402 = fma(_400, _386, 1.0);
    float _404 = _368 * _190;
    float _406 = _364 * _192;
    float _408 = _370 * _194;
    float _410 = _394 * _404;
    float _412 = _398 * _406;
    float _414 = _402 * _408;
    if (!_168)
    {
        out.m_58.x = _410;
        out.m_58.y = _412;
        out.m_58.z = _414;
        out.m_58.w = _149;
        return out;
    }
    float _416 = _412 * 0.715200006961822509765625;
    bool _418 = 0.5 <= (*spvDescriptorSet0.fp_c15)._m0[653].w;
    float _420 = 0.0 + _157;
    float _422 = precise::clamp(_420, 0.0, 1.0);
    float _424 = fma(_410, 0.2125999927520751953125, _416);
    float _426 = fma(_414, 0.072200000286102294921875, _424);
    float _428 = 1.0 / _426;
    float _430 = _428 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _432 = precise::clamp(_430, 0.0, 1.0);
    float _434 = fma(_432, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _436 = _410 * _434;
    float _438 = _412 * _434;
    float _440 = _414 * _434;
    float _442 = _434;
    if (!_418)
    {
        _442 = _422;
    }
    float _444 = _442;
    bool _446 = !_418;
    float _448 = _444;
    if (!_446)
    {
        float _450 = in.m_60.w;
        float _452 = gl_FragCoord.w;
        float _454 = _450 * _452;
        float _456 = in.m_60.z;
        float _458 = gl_FragCoord.w;
        float _460 = _456 * _458;
        float _462 = _93 * _454;
        float _464 = _93 * _460;
        float _466 = 1.0 / _462;
        float _468 = _464 * _466;
        float _470 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _472 = fma(_468, (*spvDescriptorSet0.fp_c8)._m0[30].w, _470);
        float _474 = 1.0 / _472;
        float _476 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _478 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _480 = fma(_474, _476, _478);
        float _482 = _480 * 8.0;
        float _484 = precise::clamp(_482, 0.0, 1.0);
        float _486 = _422 * _484;
        _448 = _486;
    }
    float _488 = _448;
    float _490 = 0.0 + _488;
    float _492 = precise::clamp(_490, 0.0, 1.0);
    out.m_58.x = _436;
    out.m_58.y = _438;
    out.m_58.z = _440;
    out.m_58.w = _492;
    return out;
}

