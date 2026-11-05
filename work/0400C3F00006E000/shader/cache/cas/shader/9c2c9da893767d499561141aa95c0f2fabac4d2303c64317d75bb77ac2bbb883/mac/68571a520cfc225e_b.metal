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
    constant _16* fp_c8 [[id(0)]];
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    texture2d<float> fp_t_tcb_10 [[id(9)]];
    sampler fp_t_tcb_10Smplr [[id(10)]];
    texture2d<float> fp_t_tcb_34 [[id(11)]];
    sampler fp_t_tcb_34Smplr [[id(12)]];
    sampler fp_t_tcb_8Smplr_w [[id(13)]];
    sampler fp_t_tcb_CSmplr_w [[id(14)]];
    sampler fp_t_tcb_ASmplr_w [[id(15)]];
    sampler fp_t_tcb_10Smplr_w [[id(16)]];
    sampler fp_t_tcb_34Smplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_66 [[color(0)]];
};

struct main0_in
{
    float4 m_57 [[user(locn0)]];
    float4 m_59 [[user(locn1)]];
    float4 m_41 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_61 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 m_43 [[user(locn6), flat]];
    float4 m_53 [[user(locn7), flat]];
    float4 m_63 [[user(locn8), flat]];
    float4 m_55 [[user(locn9), flat]];
    float4 m_45 [[user(locn10)]];
    float4 m_49 [[user(locn11)]];
    float4 m_68 [[user(locn13)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _75 = gl_FragCoord.w;
    float _77 = in.m_41.x;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_41.y;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = 1.0 / _75;
    float _91 = _89 * _81;
    float _93 = _89 * _87;
    float2 _589 = float2(_91, _93);
    float3 _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_589, float2(0.0), isnan(_589))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_589, float2(0.0), isnan(_589))).xyw;
    float _99 = _97.x;
    float _101 = _97.y;
    float _103 = _97.z;
    float _105 = in.m_43.x;
    float _107 = in.m_41.z;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = in.m_45.x;
    float _115 = gl_FragCoord.w;
    float _117 = _113 * _115;
    float _119 = in.m_41.w;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = in.m_47.w;
    float _127 = gl_FragCoord.w;
    float _129 = _125 * _127;
    float _131 = in.m_45.y;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = in.m_47.y;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = in.m_47.x;
    float _145 = gl_FragCoord.w;
    float _147 = _143 * _145;
    float _149 = in.m_49.x;
    float _151 = gl_FragCoord.w;
    float _153 = _149 * _151;
    float _155 = in.m_49.y;
    float _157 = gl_FragCoord.w;
    float _159 = _155 * _157;
    float _161 = _89 * _129;
    float _163 = _89 * _135;
    float _165 = _89 * _141;
    float _167 = _89 * _147;
    float _169 = 1.0 / _161;
    float _171 = _165 * _169;
    float _173 = _167 * _169;
    float _175 = _99 * _99;
    float _177 = _101 * _101;
    float _179 = fma(_175, 2.0, -1.0);
    float _181 = fma(_177, 2.0, -1.0);
    float _183 = _179 * _105;
    float _185 = _89 * _111;
    float _187 = _181 * _105;
    float _189 = _89 * _117;
    float _191 = _89 * _123;
    float _193 = _185 + _183;
    float _195 = _89 * _153;
    float _197 = fma(_183, 0.25, _189);
    float _199 = _191 + _187;
    float _201 = fma(_187, 0.25, _163);
    float _203 = _89 * _159;
    float2 _739 = float2(_197, _201);
    float2 _207 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_739, float2(0.0), isnan(_739))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_739, float2(0.0), isnan(_739))).yz;
    float _209 = _207.x;
    float _211 = _207.y;
    float2 _751 = float2(_193, _199);
    float3 _213 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_751, float2(0.0), isnan(_751))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_751, float2(0.0), isnan(_751))).xyw;
    float _215 = _213.x;
    float _217 = _213.y;
    float _219 = _213.z;
    float2 _765 = float2(_173, _171);
    float _221 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_765, float2(0.0), isnan(_765))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_765, float2(0.0), isnan(_765))).x;
    float2 _773 = float2(_195, _203);
    float4 _224 = dm_bs(spvDescriptorSet0.fp_t_tcb_34.sample(spvDescriptorSet0.fp_t_tcb_34Smplr, select(_773, float2(0.0), isnan(_773))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_34, spvDescriptorSet0.fp_t_tcb_34Smplr_w, select(_773, float2(0.0), isnan(_773))).xyzw;
    float _226 = _224.x;
    float _228 = _224.y;
    float _230 = _224.z;
    float _232 = _224.w;
    float _234 = in.m_51.w;
    float _236 = gl_FragCoord.w;
    float _238 = _234 * _236;
    float _240 = in.m_53.x;
    float _242 = in.m_47.z;
    float _244 = gl_FragCoord.w;
    float _246 = _242 * _244;
    float _248 = in.m_55.x;
    float _250 = in.m_51.y;
    float _252 = gl_FragCoord.w;
    float _254 = _250 * _252;
    float _256 = in.m_57.w;
    float _258 = gl_FragCoord.w;
    float _260 = _256 * _258;
    float _262 = in.m_59.w;
    float _264 = gl_FragCoord.w;
    float _266 = _262 * _264;
    float _268 = _89 * _238;
    float _270 = 1.0 / _240;
    float _272 = -_268;
    float _274 = _272 + 1.0;
    float _276 = _103 * _268;
    float _278 = _276 * 2.0;
    float _280 = precise::max(0.0, _268);
    float _282 = _89 * _260;
    float _284 = sqrt(_274);
    float _286 = _278 * _284;
    float _288 = _89 * _246;
    float _290 = _288 * _169;
    float _292 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _294 = fma(_290, (*spvDescriptorSet0.fp_c8)._m0[30].w, _292);
    float _296 = 1.0 / _294;
    float _298 = precise::max(0.0, _211);
    float _300 = _89 * _266;
    float _302 = precise::min(_240, _298);
    float _304 = _302 * _270;
    float _306 = -_304;
    float _308 = fma(_219, _286, _306);
    float _310 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _312 = fma(_221, (*spvDescriptorSet0.fp_c8)._m0[30].w, _310);
    float _314 = _89 * _254;
    float _316 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _318 = fma(_304, _248, _308);
    float _320 = in.m_61.x;
    float _322 = gl_FragCoord.w;
    float _324 = _320 * _322;
    float _326 = _314 * _318;
    float _328 = 1.0 / _312;
    float _330 = _232 * _326;
    float _332 = precise::min(_280, 0.100000001490116119384765625);
    float _334 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _336 = _296 * _334;
    float _338 = _282 * _330;
    float _340 = _332 * 10.0;
    float _342 = _300 * _338;
    float _344 = _342 * _340;
    float _346 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _348 = -_336;
    float _350 = fma(_328, _346, _348);
    float _352 = 0.0 + _344;
    float _354 = precise::clamp(_352, 0.0, 1.0);
    float _356 = _350 * _316;
    float _358 = precise::clamp(_356, 0.0, 1.0);
    float _360 = _354 * _358;
    float _362 = _89 * _324;
    float _364 = _360 * _362;
    bool _368 = _364 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _370 = isnan(_364);
    bool _372 = _368 || _370;
    bool _374 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _376 = _372 || _374;
    float _378 = _215 * _215;
    float _380 = abs(_378);
    float _382 = log2(_380);
    if (!_376)
    {
        discard_fragment();
    }
    float _384 = in.m_63.x;
    float _386 = in.m_59.z;
    float _388 = gl_FragCoord.w;
    float _390 = _386 * _388;
    float _392 = in.m_59.x;
    float _394 = gl_FragCoord.w;
    float _396 = _392 * _394;
    float _398 = in.m_59.y;
    float _400 = gl_FragCoord.w;
    float _402 = _398 * _400;
    float _404 = in.m_57.x;
    float _406 = gl_FragCoord.w;
    float _408 = _404 * _406;
    float _410 = _382 * 1.5;
    float _412 = in.m_57.y;
    float _414 = gl_FragCoord.w;
    float _416 = _412 * _414;
    float _418 = in.m_57.z;
    float _420 = gl_FragCoord.w;
    float _422 = _418 * _420;
    float _424 = fma(_217, _217, _209);
    float _426 = exp2(_410);
    float _428 = fma(_424, _384, _426);
    float _430 = _89 * _390;
    float _432 = _89 * _402;
    float _434 = _428 * _230;
    float _436 = _428 * _226;
    float _438 = _428 * _228;
    float _440 = _89 * _396;
    float _442 = -_434;
    float _444 = _442 + 1.0;
    float _446 = -_436;
    float _448 = _446 + 1.0;
    float _450 = -_438;
    float _452 = _450 + 1.0;
    float _454 = _430 * _444;
    float _456 = _440 * _448;
    float _458 = _89 * _408;
    float _460 = _432 * _452;
    float _462 = _89 * _416;
    float _464 = _89 * _422;
    float _466 = fma(_436, _458, _456);
    float _468 = fma(_438, _462, _460);
    float _470 = fma(_434, _464, _454);
    if (!_376)
    {
        out.m_66.x = _466;
        out.m_66.y = _468;
        out.m_66.z = _470;
        out.m_66.w = _344;
        return out;
    }
    float _472 = _468 * 0.715200006961822509765625;
    float _474 = in.m_68.w;
    float _476 = gl_FragCoord.w;
    float _478 = _474 * _476;
    float _480 = in.m_68.x;
    float _482 = gl_FragCoord.w;
    float _484 = _480 * _482;
    float _486 = in.m_68.y;
    float _488 = gl_FragCoord.w;
    float _490 = _486 * _488;
    float _492 = fma(_466, 0.2125999927520751953125, _472);
    float _494 = in.m_68.z;
    float _496 = gl_FragCoord.w;
    float _498 = _494 * _496;
    float _500 = fma(_470, 0.072200000286102294921875, _492);
    bool _502 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _504 = 1.0 / _500;
    float _506 = (*spvDescriptorSet0.fp_c15)._m0[653].w;
    if (_502)
    {
        float _508 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _510 = _336 + _508;
        _506 = _510;
    }
    float _512 = _506;
    float _514 = _504 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _516 = precise::clamp(_514, 0.0, 1.0);
    float _518 = fma(_516, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _520 = _89 * _478;
    float _522 = _89 * _490;
    float _524 = _518 * _520;
    float _526 = 0.0 + _364;
    float _528 = precise::clamp(_526, 0.0, 1.0);
    float _530 = _520;
    float _532 = _528;
    if (_502)
    {
        float _534 = _512 * 8.0;
        float _536 = precise::clamp(_534, 0.0, 1.0);
        _530 = _536;
    }
    float _538 = _530;
    float _540 = _89 * _484;
    float _542 = _89 * _498;
    float _544 = fma(_468, _524, _522);
    if (_502)
    {
        float _546 = _528 * _538;
        _532 = _546;
    }
    float _548 = _532;
    float _550 = fma(_466, _524, _540);
    float _552 = fma(_470, _524, _542);
    float _554 = 0.0 + _548;
    float _556 = precise::clamp(_554, 0.0, 1.0);
    out.m_66.x = _550;
    out.m_66.y = _544;
    out.m_66.z = _552;
    out.m_66.w = _556;
    return out;
}

