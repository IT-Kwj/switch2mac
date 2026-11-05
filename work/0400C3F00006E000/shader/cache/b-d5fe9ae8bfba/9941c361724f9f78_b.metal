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
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_10 [[id(5)]];
    sampler fp_t_tcb_10Smplr [[id(6)]];
    texture2d_array<float> fp_t_tcb_8 [[id(7)]];
    sampler fp_t_tcb_8Smplr [[id(8)]];
    sampler fp_t_tcb_ASmplr_w [[id(9)]];
    sampler fp_t_tcb_10Smplr_w [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_59 [[color(0)]];
};

struct main0_in
{
    float4 m_50 [[user(locn0)]];
    float4 m_52 [[user(locn1)]];
    float4 m_44 [[user(locn2)]];
    float4 m_54 [[user(locn3)]];
    float4 m_48 [[user(locn4), flat]];
    float4 m_42 [[user(locn5)]];
    float4 m_56 [[user(locn6)]];
    float4 m_46 [[user(locn7), flat]];
    float4 m_38 [[user(locn8), flat]];
    float4 m_61 [[user(locn10)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _68 = in.m_38.x;
    float _70 = gl_FragCoord.w;
    float _72 = in.m_42.w;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[22].x;
    float _80 = in.m_42.x;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = in.m_44.x;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = in.m_44.z;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = in.m_42.y;
    float _100 = gl_FragCoord.w;
    float _102 = _98 * _100;
    float _104 = in.m_44.w;
    float _106 = gl_FragCoord.w;
    float _108 = _104 * _106;
    float _110 = in.m_44.y;
    float _112 = gl_FragCoord.w;
    float _114 = _110 * _112;
    float _116 = _68 + 1.0;
    float _118 = 1.0 / _70;
    float _120 = _116 * _78;
    float _122 = rint(_68);
    float _124 = precise::max(_122, 0.0);
    uint _127 = uint(_124);
    uint _129 = clamp(_127, 0u, 65535u);
    float _131 = floor(_120);
    float _133 = _118 * _76;
    float _135 = _118 * _96;
    float _137 = _118 * _90;
    float _139 = _118 * _102;
    float _141 = _118 * _108;
    float _143 = 1.0 / _133;
    float _145 = -_131;
    float _147 = fma(_145, (*spvDescriptorSet0.fp_c9)._m0[22].x, _116);
    float _149 = _118 * _84;
    float _151 = _118 * _114;
    float _153 = rint(_147);
    float _155 = precise::max(_153, 0.0);
    uint _157 = uint(_155);
    uint _159 = clamp(_157, 0u, 65535u);
    float _161 = _149 * _143;
    float _163 = _139 * _143;
    float2 _700 = float2(_135, _141);
    float4 _166 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_700, float2(0.0), isnan(_700))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_700, float2(0.0), isnan(_700))).xyzw;
    float _168 = _166.x;
    float _170 = _166.y;
    float _172 = _166.z;
    float _174 = _166.w;
    float2 _718 = float2(_161, _163);
    float _176 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_718, float2(0.0), isnan(_718))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_718, float2(0.0), isnan(_718))).x;
    float3 _730 = float3(_137, _151, float(int(_129)));
    float3 _734 = select(_730, float3(0.0), isnan(_730));
    float4 _178 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _734.xy, uint(rint(_734.z))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _734.xy, uint(rint(_734.z))).xyzw;
    float _180 = _178.x;
    float _182 = _178.y;
    float _184 = _178.z;
    float _186 = _178.w;
    float3 _751 = float3(_137, _151, float(int(_159)));
    float3 _753 = select(_751, float3(0.0), isnan(_751));
    float4 _188 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _753.xy, uint(rint(_753.z))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _753.xy, uint(rint(_753.z))).xyzw;
    float _190 = _188.x;
    float _192 = _188.y;
    float _194 = _188.z;
    float _196 = _188.w;
    float _198 = in.m_46.y;
    float _200 = in.m_46.x;
    float _202 = in.m_48.y;
    float _204 = in.m_46.z;
    float _206 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[22].y;
    float _208 = in.m_42.z;
    float _210 = gl_FragCoord.w;
    float _212 = _208 * _210;
    float _214 = in.m_50.w;
    float _216 = gl_FragCoord.w;
    float _218 = _214 * _216;
    float _220 = 1.0 / (*spvDescriptorSet0.fp_c8)._m0[31].x;
    float _222 = -_198;
    float _224 = _222 + (*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _226 = -_200;
    float _228 = _226 + (*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _230 = _202 * _206;
    float _232 = -_204;
    float _234 = _232 + (*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _236 = _224 * _224;
    float _238 = _230 * _206;
    float _240 = fma(_228, _228, _236);
    float _242 = fma(_234, _234, _240);
    float _244 = floor(_238);
    float _246 = _220 * (*spvDescriptorSet0.fp_c8)._m0[31].y;
    float _248 = _118 * _212;
    float _250 = _248 * _143;
    float _252 = sqrt(_242);
    float _254 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _256 = fma(_250, (*spvDescriptorSet0.fp_c8)._m0[30].w, _254);
    float _258 = -_244;
    float _260 = fma(_258, (*spvDescriptorSet0.fp_c9)._m0[22].y, _230);
    float _262 = _118 * _218;
    float _264 = 1.0 / _256;
    float _266 = _260 + 9.9999997473787516355514526367188e-05;
    float _268 = fma(_262, 2.0, -1.0);
    float _270 = _252 * _246;
    float _272 = floor(_266);
    float _274 = in.m_52.w;
    float _276 = gl_FragCoord.w;
    float _278 = _274 * _276;
    float _280 = fma(_270, 0.0555555559694766998291015625, -0.666666686534881591796875);
    float _282 = precise::clamp(_280, 0.0, 1.0);
    float _284 = in.m_54.w;
    float _286 = gl_FragCoord.w;
    float _288 = _284 * _286;
    float _290 = fma(_282, -2.0, 3.0);
    float _292 = _282 * _282;
    float _294 = -_272;
    float _296 = _266 + _294;
    float _298 = _290 * _292;
    float _300 = _118 * _288;
    float _302 = in.m_52.y;
    float _304 = gl_FragCoord.w;
    float _306 = _302 * _304;
    float _308 = in.m_52.z;
    float _310 = gl_FragCoord.w;
    float _312 = _308 * _310;
    float _314 = _174 + _268;
    float _316 = precise::clamp(_314, 0.0, 1.0);
    float _318 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _320 = fma(_176, (*spvDescriptorSet0.fp_c8)._m0[30].w, _318);
    float _322 = fma(_316, -2.0, 3.0);
    float _324 = in.m_56.x;
    float _326 = gl_FragCoord.w;
    float _328 = _324 * _326;
    float _330 = _316 * _316;
    float _332 = 1.0 / _320;
    float _334 = _322 * _330;
    float _336 = -_186;
    float _338 = _336 + _196;
    float _340 = fma(_296, _338, _186);
    float _342 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _344 = _174 * _340;
    float _346 = _344 * _334;
    float _348 = _346 * _300;
    float _350 = _118 * _278;
    float _352 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _354 = _264 * _352;
    float _356 = _350 * _348;
    float _358 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _360 = -_354;
    float _362 = fma(_332, _358, _360);
    float _364 = _356 * _298;
    float _366 = _362 * _342;
    float _368 = precise::clamp(_366, 0.0, 1.0);
    float _370 = _118 * _328;
    float _372 = 0.0 + _364;
    float _374 = precise::clamp(_372, 0.0, 1.0);
    float _376 = _374 * _368;
    float _378 = _376 * _370;
    bool _382 = _378 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _384 = isnan(_378);
    bool _386 = _382 || _384;
    bool _388 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _390 = _386 || _388;
    float _392 = in.m_52.x;
    float _394 = gl_FragCoord.w;
    float _396 = _392 * _394;
    float _398 = in.m_50.y;
    float _400 = gl_FragCoord.w;
    float _402 = _398 * _400;
    float _404 = in.m_50.x;
    float _406 = gl_FragCoord.w;
    float _408 = _404 * _406;
    float _410 = in.m_50.z;
    float _412 = gl_FragCoord.w;
    float _414 = _410 * _412;
    float _416 = _354;
    if (!_390)
    {
        discard_fragment();
    }
    float _418 = -_182;
    float _420 = _418 + _192;
    float _422 = -_184;
    float _424 = _422 + _194;
    float _426 = -_180;
    float _428 = _426 + _190;
    float _430 = _170 * _170;
    float _432 = fma(_296, _420, _182);
    float _434 = fma(_296, _424, _184);
    float _436 = _172 * _172;
    float _438 = fma(_296, _428, _180);
    float _440 = _168 * _168;
    float _442 = _430 * _432;
    float _444 = _436 * _434;
    float _446 = _118 * _306;
    float _448 = _440 * _438;
    float _450 = -_442;
    float _452 = _450 + 1.0;
    float _454 = _118 * _312;
    float _456 = _118 * _396;
    float _458 = -_444;
    float _460 = _458 + 1.0;
    float _462 = -_448;
    float _464 = _462 + 1.0;
    float _466 = _446 * _452;
    float _468 = _118 * _402;
    float _470 = _454 * _460;
    float _472 = _456 * _464;
    float _474 = _118 * _408;
    float _476 = _118 * _414;
    float _478 = fma(_442, _468, _466);
    float _480 = fma(_448, _474, _472);
    float _482 = fma(_444, _476, _470);
    float _484 = _466;
    if (!_390)
    {
        out.m_59.x = _480;
        out.m_59.y = _478;
        out.m_59.z = _482;
        out.m_59.w = _364;
        return out;
    }
    float _486 = _478 * 0.715200006961822509765625;
    float _488 = in.m_61.w;
    float _490 = gl_FragCoord.w;
    float _492 = _488 * _490;
    float _494 = in.m_61.y;
    float _496 = gl_FragCoord.w;
    float _498 = _494 * _496;
    float _500 = in.m_61.x;
    float _502 = gl_FragCoord.w;
    float _504 = _500 * _502;
    float _506 = fma(_480, 0.2125999927520751953125, _486);
    float _508 = in.m_61.z;
    float _510 = gl_FragCoord.w;
    float _512 = _508 * _510;
    float _514 = fma(_482, 0.072200000286102294921875, _506);
    bool _516 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _518 = 1.0 / _514;
    if (_516)
    {
        float _520 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _522 = _354 + _520;
        _416 = _522;
    }
    float _524 = _416;
    if (_516)
    {
        float _526 = _524 * 8.0;
        float _528 = precise::clamp(_526, 0.0, 1.0);
        _484 = _528;
    }
    float _530 = _484;
    float _532 = _518 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _534 = precise::clamp(_532, 0.0, 1.0);
    float _536 = fma(_534, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _538 = _118 * _492;
    float _540 = _118 * _498;
    float _542 = _118 * _504;
    float _544 = _536 * _538;
    float _546 = 0.0 + _378;
    float _548 = precise::clamp(_546, 0.0, 1.0);
    float _550 = _118 * _512;
    float _552 = fma(_480, _544, _542);
    float _554 = _548;
    if (_516)
    {
        float _556 = _548 * _530;
        _554 = _556;
    }
    float _558 = _554;
    float _560 = fma(_478, _544, _540);
    float _562 = fma(_482, _544, _550);
    float _564 = 0.0 + _558;
    float _566 = precise::clamp(_564, 0.0, 1.0);
    out.m_59.x = _552;
    out.m_59.y = _560;
    out.m_59.z = _562;
    out.m_59.w = _566;
    return out;
}

