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
    texture2d<float> fp_t_tcb_10 [[id(3)]];
    sampler fp_t_tcb_10Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    texture2d<float> fp_t_tcb_C [[id(9)]];
    sampler fp_t_tcb_CSmplr [[id(10)]];
    texture2d<float> fp_t_tcb_34 [[id(11)]];
    sampler fp_t_tcb_34Smplr [[id(12)]];
    sampler fp_t_tcb_10Smplr_w [[id(13)]];
    sampler fp_t_tcb_8Smplr_w [[id(14)]];
    sampler fp_t_tcb_ASmplr_w [[id(15)]];
    sampler fp_t_tcb_CSmplr_w [[id(16)]];
    sampler fp_t_tcb_34Smplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_60 [[color(0)]];
};

struct main0_in
{
    float4 m_49 [[user(locn0)]];
    float4 m_57 [[user(locn1)]];
    float4 m_55 [[user(locn2)]];
    float4 m_43 [[user(locn3)]];
    float4 m_51 [[user(locn4)]];
    float4 m_53 [[user(locn5)]];
    float4 m_41 [[user(locn6)]];
    float4 m_45 [[user(locn7)]];
    float4 m_47 [[user(locn8)]];
    float4 m_62 [[user(locn10)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _69 = gl_FragCoord.w;
    float _71 = in.m_41.w;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_41.y;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_41.x;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = in.m_43.y;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = in.m_43.x;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = in.m_43.w;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = in.m_43.z;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = in.m_45.x;
    float _115 = gl_FragCoord.w;
    float _117 = _113 * _115;
    float _119 = in.m_45.y;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = in.m_47.x;
    float _127 = gl_FragCoord.w;
    float _129 = _125 * _127;
    float _131 = in.m_47.y;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = 1.0 / _69;
    float _139 = _137 * _75;
    float _141 = _137 * _81;
    float _143 = _137 * _87;
    float _145 = _137 * _93;
    float _147 = 1.0 / _139;
    float _149 = _137 * _99;
    float _151 = _137 * _105;
    float _153 = _137 * _111;
    float _155 = _137 * _117;
    float _157 = _137 * _123;
    float _159 = _137 * _129;
    float _161 = _137 * _135;
    float _163 = _141 * _147;
    float _165 = _143 * _147;
    float2 _613 = float2(_165, _163);
    float _167 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_613, float2(0.0), isnan(_613))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_613, float2(0.0), isnan(_613))).x;
    float2 _624 = float2(_149, _145);
    float _169 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_624, float2(0.0), isnan(_624))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_624, float2(0.0), isnan(_624))).w;
    float2 _632 = float2(_153, _151);
    float _171 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_632, float2(0.0), isnan(_632))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_632, float2(0.0), isnan(_632))).w;
    float2 _640 = float2(_155, _157);
    float4 _174 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_640, float2(0.0), isnan(_640))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_640, float2(0.0), isnan(_640))).xyzw;
    float _176 = _174.x;
    float _178 = _174.y;
    float _180 = _174.z;
    float _182 = _174.w;
    float2 _656 = float2(_159, _161);
    float4 _184 = dm_bs(spvDescriptorSet0.fp_t_tcb_34.sample(spvDescriptorSet0.fp_t_tcb_34Smplr, select(_656, float2(0.0), isnan(_656))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_34, spvDescriptorSet0.fp_t_tcb_34Smplr_w, select(_656, float2(0.0), isnan(_656))).xyzw;
    float _186 = _184.x;
    float _188 = _184.y;
    float _190 = _184.z;
    float _192 = _184.w;
    float _194 = in.m_41.z;
    float _196 = gl_FragCoord.w;
    float _198 = _194 * _196;
    float _200 = in.m_49.w;
    float _202 = gl_FragCoord.w;
    float _204 = _200 * _202;
    float _206 = in.m_51.w;
    float _208 = gl_FragCoord.w;
    float _210 = _206 * _208;
    float _212 = in.m_53.w;
    float _214 = gl_FragCoord.w;
    float _216 = _212 * _214;
    float _218 = in.m_55.x;
    float _220 = gl_FragCoord.w;
    float _222 = _218 * _220;
    float _224 = _137 * _198;
    float _226 = _224 * _147;
    float _228 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _230 = fma(_226, (*spvDescriptorSet0.fp_c8)._m0[30].w, _228);
    float _232 = 1.0 / _230;
    float _234 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _236 = _232 * _234;
    float _238 = _137 * _204;
    float _240 = precise::max(_236, 2.0);
    float _242 = precise::min(_240, 6.0);
    float _244 = in.m_49.y;
    float _246 = gl_FragCoord.w;
    float _248 = _244 * _246;
    float _250 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _252 = fma(_167, (*spvDescriptorSet0.fp_c8)._m0[30].w, _250);
    float _254 = _169 + _171;
    float _256 = 1.0 / _252;
    float _258 = _182 * _254;
    float _260 = _137 * _210;
    float _262 = fma(_242, 0.25, -0.5);
    float _264 = _238 * _258;
    float _266 = _260 + (-1.0);
    float _268 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _270 = -_236;
    float _272 = fma(_256, _268, _270);
    bool _276 = _272 <= 1.0;
    bool _278 = isnan(_272);
    bool _280 = _276 || _278;
    bool _282 = isnan(1.0);
    bool _284 = _280 || _282;
    float _286 = float(_284);
    float _288 = fma(_264, _262, _286);
    float _290 = precise::clamp(_288, 0.0, 1.0);
    float _292 = _192 * _260;
    float _294 = _137 * _222;
    float _296 = _290 + _266;
    float _298 = precise::clamp(_296, 0.0, 1.0);
    float _300 = _137 * _216;
    float _302 = fma(_298, _300, _292);
    float _304 = precise::clamp(_302, 0.0, 1.0);
    float _306 = _304 * _294;
    bool _308 = _306 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _310 = isnan(_306);
    bool _312 = _308 || _310;
    bool _314 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _316 = _312 || _314;
    float _318 = in.m_57.y;
    float _320 = gl_FragCoord.w;
    float _322 = _318 * _320;
    float _324 = in.m_57.x;
    float _326 = gl_FragCoord.w;
    float _328 = _324 * _326;
    float _330 = in.m_57.z;
    float _332 = gl_FragCoord.w;
    float _334 = _330 * _332;
    float _336 = in.m_49.x;
    float _338 = gl_FragCoord.w;
    float _340 = _336 * _338;
    float _342 = in.m_49.z;
    float _344 = gl_FragCoord.w;
    float _346 = _342 * _344;
    float _348 = _236;
    if (!_316)
    {
        discard_fragment();
    }
    float _350 = fma(_188, _188, _178);
    float _352 = fma(_186, _186, _176);
    float _354 = fma(_190, _190, _180);
    float _356 = -_350;
    float _358 = _356 + 1.0;
    float _360 = -_352;
    float _362 = _360 + 1.0;
    float _364 = -_354;
    float _366 = _364 + 1.0;
    float _368 = _137 * _322;
    float _370 = _137 * _328;
    float _372 = _137 * _334;
    float _374 = _368 * _358;
    float _376 = _370 * _362;
    float _378 = _137 * _340;
    float _380 = _372 * _366;
    float _382 = _137 * _248;
    float _384 = _137 * _346;
    float _386 = fma(_352, _378, _376);
    float _388 = fma(_350, _382, _374);
    float _390 = fma(_354, _384, _380);
    float _392 = fma(_386, _286, _386);
    float _394 = fma(_388, _286, _388);
    float _396 = fma(_390, _286, _390);
    if (!_316)
    {
        out.m_60.x = _392;
        out.m_60.y = _394;
        out.m_60.z = _396;
        out.m_60.w = _304;
        return out;
    }
    float _398 = _394 * 0.715200006961822509765625;
    float _400 = in.m_62.w;
    float _402 = gl_FragCoord.w;
    float _404 = _400 * _402;
    float _406 = in.m_62.x;
    float _408 = gl_FragCoord.w;
    float _410 = _406 * _408;
    float _412 = in.m_62.y;
    float _414 = gl_FragCoord.w;
    float _416 = _412 * _414;
    float _418 = fma(_392, 0.2125999927520751953125, _398);
    float _420 = in.m_62.z;
    float _422 = gl_FragCoord.w;
    float _424 = _420 * _422;
    float _426 = fma(_396, 0.072200000286102294921875, _418);
    bool _428 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _430 = 1.0 / _426;
    float _432 = (*spvDescriptorSet0.fp_c15)._m0[2].y;
    if (_428)
    {
        float _434 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _436 = _236 + _434;
        _348 = _436;
    }
    float _438 = _348;
    float _440 = _430 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _442 = precise::clamp(_440, 0.0, 1.0);
    float _444 = fma(_442, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _446 = _137 * _404;
    if (_428)
    {
        float _448 = _438 * 8.0;
        float _450 = precise::clamp(_448, 0.0, 1.0);
        _432 = _450;
    }
    float _452 = _432;
    float _454 = _137 * _410;
    float _456 = _444 * _446;
    float _458 = 0.0 + _306;
    float _460 = precise::clamp(_458, 0.0, 1.0);
    float _462 = _137 * _416;
    float _464 = _137 * _424;
    float _466 = fma(_392, _456, _454);
    float _468 = _460;
    if (_428)
    {
        float _470 = _460 * _452;
        _468 = _470;
    }
    float _472 = _468;
    float _474 = fma(_394, _456, _462);
    float _476 = fma(_396, _456, _464);
    float _478 = 0.0 + _472;
    float _480 = precise::clamp(_478, 0.0, 1.0);
    out.m_60.x = _466;
    out.m_60.y = _474;
    out.m_60.z = _476;
    out.m_60.w = _480;
    return out;
}

