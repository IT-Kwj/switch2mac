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
    constant _16* fp_c10 [[id(0)]];
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c9 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    texture2d<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    texture2d<float> fp_t_tcb_8 [[id(6)]];
    sampler fp_t_tcb_8Smplr [[id(7)]];
    texture2d<float> fp_t_tcb_10 [[id(8)]];
    sampler fp_t_tcb_10Smplr [[id(9)]];
    sampler fp_t_tcb_ASmplr_w [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_10Smplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_52 [[color(0)]];
};

struct main0_in
{
    float4 m_49 [[user(locn0)]];
    float4 m_47 [[user(locn1)]];
    float4 m_43 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_41 [[user(locn4)]];
    float4 m_39 [[user(locn6)]];
    float4 m_54 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _61 = gl_FragCoord.w;
    float _63 = in.m_39.y;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_39.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_39.z;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = (*spvDescriptorSet0.fp_c10)._m0[5].x * (*spvDescriptorSet0.fp_c10)._m0[5].x;
    float _83 = fma((*spvDescriptorSet0.fp_c10)._m0[4].x, (*spvDescriptorSet0.fp_c10)._m0[4].x, _81);
    float _85 = 1.0 / _61;
    float _87 = _85 * _67;
    float _89 = _85 * _73;
    float _91 = _85 * _79;
    float _93 = _87 * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _95 = fma(_89, (*spvDescriptorSet0.fp_c8)._m0[2].x, _93);
    float _97 = fma(_91, (*spvDescriptorSet0.fp_c8)._m0[2].z, _95);
    float _99 = fma((*spvDescriptorSet0.fp_c10)._m0[6].x, (*spvDescriptorSet0.fp_c10)._m0[6].x, _83);
    float _101 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _103 = _97 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _105 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _107 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _109 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[1].x, _101);
    float _111 = _87 * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _113 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[0].x, _105);
    float _115 = 1.0 / _103;
    float _117 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[2].x, _107);
    float _119 = _87 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _121 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[0].z, _113);
    float _123 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[1].z, _109);
    float _125 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[2].z, _117);
    float _127 = fma(_89, (*spvDescriptorSet0.fp_c8)._m0[0].x, _111);
    float _129 = fma(_89, (*spvDescriptorSet0.fp_c8)._m0[1].x, _119);
    float _131 = rsqrt(_99);
    float _133 = _125 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _135 = fma(_91, (*spvDescriptorSet0.fp_c8)._m0[0].z, _127);
    float _137 = fma(_91, (*spvDescriptorSet0.fp_c8)._m0[1].z, _129);
    float _139 = _121 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _141 = _123 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _143 = _135 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _145 = _137 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _147 = _133 * _115;
    float _149 = -_139;
    float _151 = fma(_143, _147, _149);
    float _153 = -_147;
    float _155 = fma(_145, _153, _141);
    float _157 = _131 * (*spvDescriptorSet0.fp_c9)._m0[194].z;
    float _159 = fma(_151, _157, 0.5);
    float _161 = fma(_155, _157, 0.5);
    float2 _713 = float2(_159, _161);
    float2 _165 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_713, float2(0.0), isnan(_713))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_713, float2(0.0), isnan(_713))).xw;
    float _167 = _165.x;
    float _169 = _165.y;
    float _171 = in.m_41.y;
    float _173 = gl_FragCoord.w;
    float _175 = _171 * _173;
    float _177 = in.m_41.x;
    float _179 = gl_FragCoord.w;
    float _181 = _177 * _179;
    float _183 = _85 * _175;
    float _185 = _85 * _181;
    float _187 = fma(_169, (*spvDescriptorSet0.fp_c9)._m0[194].w, _183);
    float2 _754;
    _754.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_185, _187));
    _754.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_185, _187));
    float _189 = _754.x;
    float _191 = _189 * 256.0;
    int _194 = int(_191);
    float _196 = in.m_43.w;
    float _198 = gl_FragCoord.w;
    float _200 = _196 * _198;
    float _202 = in.m_43.x;
    float _204 = gl_FragCoord.w;
    float _206 = _202 * _204;
    float _208 = in.m_43.y;
    float _210 = gl_FragCoord.w;
    float _212 = _208 * _210;
    float _214 = _85 * _200;
    float _216 = _85 * _206;
    float _218 = _85 * _212;
    float _220 = 1.0 / _214;
    float _222 = _216 * _220;
    float _224 = _218 * _220;
    float2 _802 = float2(_222, _224);
    float _226 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_802, float2(0.0), isnan(_802))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_802, float2(0.0), isnan(_802))).x;
    float _228 = float(uint(_194));
    float _230 = _228 * 0.00390625;
    float _232 = precise::min(_230, 2.0);
    float2 _819 = float2(_185, _187);
    float2 _234 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_819, float2(0.0), isnan(_819)), level(_232)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_819, float2(0.0), isnan(_819)), level(_232)).xw;
    float _236 = _234.x;
    float _238 = _234.y;
    float _240 = in.m_43.z;
    float _242 = gl_FragCoord.w;
    float _244 = _240 * _242;
    float _246 = _155 * _131;
    float _248 = _151 * _131;
    float _250 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _252 = _246 * _246;
    float _254 = fma(_248, _248, _252);
    float _256 = sqrt(_254);
    float _258 = _85 * _244;
    float _260 = _258 * _220;
    float _262 = in.m_45.x;
    float _264 = gl_FragCoord.w;
    float _266 = _262 * _264;
    float _268 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _270 = fma(_260, (*spvDescriptorSet0.fp_c8)._m0[30].w, _268);
    float _272 = 1.0 / _270;
    float _274 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _276 = fma(_226, (*spvDescriptorSet0.fp_c8)._m0[30].w, _274);
    float _278 = 0.0 + _256;
    float _280 = precise::clamp(_278, 0.0, 1.0);
    float _282 = -_280;
    float _284 = _282 + 1.0;
    float _286 = 1.0 / _276;
    float _288 = _284 * _284;
    float _290 = fma(_288, 0.39999997615814208984375, 0.60000002384185791015625);
    float _292 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _294 = _272 * _292;
    float _296 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _298 = -_294;
    float _300 = fma(_286, _296, _298);
    float _302 = _300 * _250;
    float _304 = precise::clamp(_302, 0.0, 1.0);
    float _306 = in.m_47.y;
    float _308 = gl_FragCoord.w;
    float _310 = _306 * _308;
    float _312 = in.m_49.z;
    float _314 = gl_FragCoord.w;
    float _316 = _312 * _314;
    float _318 = in.m_47.z;
    float _320 = gl_FragCoord.w;
    float _322 = _318 * _320;
    float _324 = _167 * _167;
    float _326 = _85 * _310;
    float _328 = _85 * _322;
    float _330 = _238 * _290;
    float _332 = precise::clamp(_330, 0.0, 1.0);
    float _334 = _85 * _266;
    float _336 = _332 * _304;
    float _338 = _336 * _334;
    bool _342 = _338 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _344 = isnan(_338);
    bool _346 = _342 || _344;
    bool _348 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _350 = _346 || _348;
    float _352 = in.m_49.x;
    float _354 = gl_FragCoord.w;
    float _356 = _352 * _354;
    float _358 = in.m_47.x;
    float _360 = gl_FragCoord.w;
    float _362 = _358 * _360;
    float _364 = in.m_49.y;
    float _366 = gl_FragCoord.w;
    float _368 = _364 * _366;
    float _370 = _294;
    if (!_350)
    {
        discard_fragment();
    }
    float _372 = _324 * _236;
    float _374 = _85 * _356;
    float _376 = _85 * _362;
    float _378 = _85 * _368;
    float _380 = _85 * _316;
    float _382 = -_374;
    float _384 = _382 + _376;
    float _386 = fma(_372, _288, _288);
    float _388 = _288 * _288;
    float _390 = -_378;
    float _392 = _390 + _326;
    float _394 = -_380;
    float _396 = _394 + _328;
    float _398 = fma(_386, _384, _374);
    float _400 = _388 * _388;
    float _402 = _400 * 0.25;
    float _404 = fma(_386, _392, _378);
    float _406 = fma(_386, _396, _380);
    float _408 = fma(_402, (*spvDescriptorSet0.fp_c9)._m0[106].x, _398);
    float _410 = fma(_402, (*spvDescriptorSet0.fp_c9)._m0[106].x, _404);
    float _412 = fma(_402, (*spvDescriptorSet0.fp_c9)._m0[106].x, _406);
    if (!_350)
    {
        out.m_52.x = _408;
        out.m_52.y = _410;
        out.m_52.z = _412;
        out.m_52.w = _332;
        return out;
    }
    float _414 = _410 * 0.715200006961822509765625;
    float _416 = in.m_54.w;
    float _418 = gl_FragCoord.w;
    float _420 = _416 * _418;
    float _422 = in.m_54.x;
    float _424 = gl_FragCoord.w;
    float _426 = _422 * _424;
    float _428 = in.m_54.y;
    float _430 = gl_FragCoord.w;
    float _432 = _428 * _430;
    float _434 = fma(_408, 0.2125999927520751953125, _414);
    float _436 = in.m_54.z;
    float _438 = gl_FragCoord.w;
    float _440 = _436 * _438;
    float _442 = fma(_412, 0.072200000286102294921875, _434);
    bool _444 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _446 = 1.0 / _442;
    float _448 = (*spvDescriptorSet0.fp_c15)._m0[2].y;
    if (_444)
    {
        float _450 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _452 = _294 + _450;
        _370 = _452;
    }
    float _454 = _370;
    float _456 = _446 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _458 = precise::clamp(_456, 0.0, 1.0);
    float _460 = fma(_458, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _462 = _85 * _420;
    if (_444)
    {
        float _464 = _454 * 8.0;
        float _466 = precise::clamp(_464, 0.0, 1.0);
        _448 = _466;
    }
    float _468 = _448;
    float _470 = _85 * _426;
    float _472 = _85 * _432;
    float _474 = _460 * _462;
    float _476 = 0.0 + _338;
    float _478 = precise::clamp(_476, 0.0, 1.0);
    float _480 = _85 * _440;
    float _482 = fma(_408, _474, _470);
    float _484 = _478;
    if (_444)
    {
        float _486 = _478 * _468;
        _484 = _486;
    }
    float _488 = _484;
    float _490 = fma(_410, _474, _472);
    float _492 = fma(_412, _474, _480);
    float _494 = 0.0 + _488;
    float _496 = precise::clamp(_494, 0.0, 1.0);
    out.m_52.x = _482;
    out.m_52.y = _490;
    out.m_52.z = _492;
    out.m_52.w = _496;
    return out;
}

