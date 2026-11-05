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
    constant _16* fp_c3 [[id(0)]];
    texture2d<float> fp_t_tcb_C [[id(1)]];
    sampler fp_t_tcb_CSmplr [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_E [[id(5)]];
    sampler fp_t_tcb_ESmplr [[id(6)]];
    sampler fp_t_tcb_CSmplr_w [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    sampler fp_t_tcb_ESmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_40 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
    float4 m_33 [[user(locn1)]];
    float4 m_37 [[user(locn2)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _47 = gl_FragCoord.w;
    float _49 = in.m_33.x;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = in.m_33.y;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = 1.0 / _47;
    float _63 = _61 * _53;
    float _65 = _61 * _59;
    float2 _570 = float2(_63, _65);
    float _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_570, float2(0.0), isnan(_570))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_570, float2(0.0), isnan(_570))).x;
    float _69 = in.m_35.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_35.y;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_35.w;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_37.x;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = in.m_37.y;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = in.m_37.w;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = in.m_33.z;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = in.m_33.w;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = _61 * _73;
    float _119 = _61 * _79;
    float _121 = _61 * _85;
    float _123 = _61 * _91;
    float _125 = _61 * _97;
    float _127 = _61 * _103;
    float _129 = _61 * _109;
    float _131 = _61 * _115;
    float2 _662 = float2(_129, _131);
    float3 _135 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_662, float2(0.0), isnan(_662))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_662, float2(0.0), isnan(_662))).xyz;
    float _137 = _135.x;
    float _139 = _135.y;
    float _141 = _135.z;
    float2 _676 = float2(_129, _131);
    float3 _143 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_676, float2(0.0), isnan(_676)), int2(1, 0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_676, float2(0.0), isnan(_676)), int2(1, 0)).xyz;
    float _145 = _143.x;
    float _147 = _143.y;
    float _149 = _143.z;
    float2 _692 = float2(_129, _131);
    float3 _151 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_692, float2(0.0), isnan(_692)), int2(0, 1)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_692, float2(0.0), isnan(_692)), int2(0, 1)).xyz;
    float _153 = _151.x;
    float _155 = _151.y;
    float _157 = _151.z;
    float _159 = -_67;
    float _161 = -(*spvDescriptorSet0.fp_c3)._m0[12].z;
    float _163 = _159 + _161;
    float _165 = fma(_163, (*spvDescriptorSet0.fp_c3)._m0[12].y, (*spvDescriptorSet0.fp_c3)._m0[12].w);
    float _167 = _127 * _165;
    float _169 = _123 * _165;
    float _171 = _125 * _165;
    float _173 = fma(_121, _163, _167);
    float _175 = fma(_117, _163, _169);
    float _177 = fma(_119, _163, _171);
    float _179 = 1.0 / _173;
    float _181 = _175 * _179;
    float _183 = _177 * _179;
    float2 _753 = float2(_129, _131);
    float3 _185 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_753, float2(0.0), isnan(_753)), int2(1)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_753, float2(0.0), isnan(_753)), int2(1)).xyz;
    float _187 = _185.x;
    float _189 = _185.y;
    float _191 = _185.z;
    float2 _768 = float2(_63, _65);
    float4 _194 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_768, float2(0.0), isnan(_768))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_768, float2(0.0), isnan(_768))).xyzw;
    float _196 = _194.x;
    float _198 = _194.y;
    float _200 = _194.z;
    float _202 = _194.w;
    float2 _784 = float2(_181, _183);
    float4 _204 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_784, float2(0.0), isnan(_784))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_784, float2(0.0), isnan(_784))).xyzw;
    float _206 = _204.x;
    float _208 = _204.y;
    float _210 = _204.z;
    float _212 = _204.w;
    float _214 = _139 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _216 = _147 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _218 = fma(_137, (*spvDescriptorSet0.fp_c3)._m0[2].x, _214);
    float _220 = _155 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _222 = fma(_145, (*spvDescriptorSet0.fp_c3)._m0[2].x, _216);
    float _224 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[2].x, _220);
    float _226 = -_65;
    float _228 = _226 + _183;
    float _230 = fma(_141, (*spvDescriptorSet0.fp_c3)._m0[2].z, _218);
    float _232 = fma(_149, (*spvDescriptorSet0.fp_c3)._m0[2].z, _222);
    float _234 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[2].z, _224);
    float _236 = -_63;
    float _238 = _236 + _181;
    float _240 = _228 * (*spvDescriptorSet0.fp_c3)._m0[10].w;
    float _242 = precise::min(_230, _234);
    float _244 = _238 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _246 = precise::max(_230, _234);
    float _248 = _240 * _240;
    float _250 = fma(_244, _244, _248);
    float _252 = sqrt(_250);
    float _254 = _189 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _256 = _198 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _258 = fma(_187, (*spvDescriptorSet0.fp_c3)._m0[2].x, _254);
    float _260 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[2].x, _256);
    float _262 = fma(_191, (*spvDescriptorSet0.fp_c3)._m0[2].z, _258);
    float _264 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[2].z, _260);
    float _266 = precise::min(_232, _262);
    float _268 = precise::max(_232, _262);
    float _270 = precise::min(_242, _266);
    float _272 = precise::max(_246, _268);
    float _274 = precise::min(_264, _270);
    float _276 = precise::max(_264, _272);
    float _278 = _272 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _280 = -_274;
    float _282 = _280 + _276;
    float _284 = precise::max(_278, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    bool _288 = _282 > _284;
    float _290 = 0.0 + _252;
    float _292 = precise::clamp(_290, 0.0, 1.0);
    float _294 = fma(_292, -0.5, 0.5);
    float _296 = 0.5;
    float _298 = _266;
    float _300 = _278;
    float _302 = _196;
    if (!_288)
    {
        _296 = _198;
    }
    float _304 = _296;
    float _306 = _304;
    if (!_288)
    {
        _298 = _200;
    }
    float _308 = _298;
    float _310 = _308;
    if (!_288)
    {
        _300 = _202;
    }
    float _312 = _300;
    bool _314 = !_288;
    float _316 = _312;
    if (!_314)
    {
        float _318 = _230 + _232;
        float _320 = -_232;
        float _322 = _320 + _234;
        float _324 = -_230;
        float _326 = _324 + _262;
        float _328 = _234 + _318;
        float _330 = _322 + _326;
        float _332 = -_326;
        float _334 = _322 + _332;
        float _336 = _262 + _328;
        float _338 = (*spvDescriptorSet0.fp_c3)._m0[4].z * 0.25;
        float _340 = abs(_330);
        float _342 = abs(_334);
        float _344 = precise::min(_340, _342);
        float _346 = fma(_336, _338, (*spvDescriptorSet0.fp_c3)._m0[4].w);
        float _348 = precise::max(_346, _344);
        float _350 = 1.0 / _348;
        float _352 = _330 * _350;
        float _354 = _334 * _350;
        float _356 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
        float _358 = precise::max(_352, _356);
        float _360 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
        float _362 = precise::max(_354, _360);
        float _364 = precise::min(_358, (*spvDescriptorSet0.fp_c3)._m0[4].y);
        float _366 = precise::min(_362, (*spvDescriptorSet0.fp_c3)._m0[4].y);
        float _368 = -_364;
        float _370 = fma(_368, (*spvDescriptorSet0.fp_c3)._m0[1].z, _63);
        float _372 = -_364;
        float _374 = fma(_372, (*spvDescriptorSet0.fp_c3)._m0[1].x, _63);
        float _376 = -_366;
        float _378 = fma(_376, (*spvDescriptorSet0.fp_c3)._m0[1].w, _65);
        float _380 = fma(_364, (*spvDescriptorSet0.fp_c3)._m0[1].z, _63);
        float _382 = fma(_364, (*spvDescriptorSet0.fp_c3)._m0[1].x, _63);
        float _384 = fma(_366, (*spvDescriptorSet0.fp_c3)._m0[1].w, _65);
        float _386 = -_366;
        float _388 = fma(_386, (*spvDescriptorSet0.fp_c3)._m0[1].y, _65);
        float _390 = fma(_366, (*spvDescriptorSet0.fp_c3)._m0[1].y, _65);
        float2 _1098 = float2(_370, _378);
        float4 _392 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1098, float2(0.0), isnan(_1098))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1098, float2(0.0), isnan(_1098))).xyzw;
        float _394 = _392.x;
        float _396 = _392.y;
        float _398 = _392.z;
        float _400 = _392.w;
        float2 _1114 = float2(_380, _384);
        float4 _402 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1114, float2(0.0), isnan(_1114))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1114, float2(0.0), isnan(_1114))).xyzw;
        float _404 = _402.x;
        float _406 = _402.y;
        float _408 = _402.z;
        float _410 = _402.w;
        float2 _1130 = float2(_374, _388);
        float4 _412 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1130, float2(0.0), isnan(_1130))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1130, float2(0.0), isnan(_1130))).xyzw;
        float _414 = _412.x;
        float _416 = _412.y;
        float _418 = _412.z;
        float _420 = _412.w;
        float2 _1146 = float2(_382, _390);
        float4 _422 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1146, float2(0.0), isnan(_1146))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1146, float2(0.0), isnan(_1146))).xyzw;
        float _424 = _422.x;
        float _426 = _422.y;
        float _428 = _422.z;
        float _430 = _422.w;
        float _432 = _396 + _406;
        float _434 = _394 + _404;
        float _436 = _416 + _426;
        float _438 = _414 + _424;
        float _440 = _398 + _408;
        float _442 = _418 + _428;
        float _444 = _432 + _436;
        float _446 = _434 + _438;
        float _448 = _400 + _410;
        float _450 = _440 + _442;
        float _452 = _444 * 0.25;
        float _454 = _446 * 0.25;
        float _456 = _450 * 0.25;
        float _458 = _452 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _460 = fma(_454, (*spvDescriptorSet0.fp_c3)._m0[2].x, _458);
        float _462 = fma(_456, (*spvDescriptorSet0.fp_c3)._m0[2].z, _460);
        float _464 = _420 + _430;
        bool _466 = _462 > _272;
        bool _468 = isnan(_462);
        bool _470 = _466 || _468;
        bool _472 = isnan(_272);
        bool _474 = _470 || _472;
        float _476 = _448 + _464;
        float _478 = _448 * 0.5;
        bool _480 = _270 <= _462;
        bool _482 = !_474;
        bool _484 = _480 && _482;
        float _486 = _454;
        float _488 = _452;
        float _490 = _456;
        _316 = _478;
        if (!_484)
        {
            float _492 = _434 * 0.5;
            _486 = _492;
        }
        float _494 = _486;
        _302 = _494;
        if (!_484)
        {
            float _496 = _432 * 0.5;
            _488 = _496;
        }
        float _498 = _488;
        _306 = _498;
        if (!_484)
        {
            float _500 = _440 * 0.5;
            _490 = _500;
        }
        float _502 = _490;
        _310 = _502;
        if (_484)
        {
            float _504 = _476 * 0.25;
            _316 = _504;
        }
    }
    float _506 = _302;
    float _508 = _306;
    float _510 = _310;
    float _512 = _316;
    float _514 = -_506;
    float _516 = _206 + _514;
    float _518 = -_508;
    float _520 = _208 + _518;
    float _522 = -_510;
    float _524 = _210 + _522;
    float _526 = -_512;
    float _528 = _212 + _526;
    float _530 = fma(_294, _516, _506);
    float _532 = fma(_294, _520, _508);
    float _534 = fma(_294, _524, _510);
    float _536 = fma(_294, _528, _512);
    out.m_40.x = _530;
    out.m_40.y = _532;
    out.m_40.z = _534;
    out.m_40.w = _536;
    return out;
}

