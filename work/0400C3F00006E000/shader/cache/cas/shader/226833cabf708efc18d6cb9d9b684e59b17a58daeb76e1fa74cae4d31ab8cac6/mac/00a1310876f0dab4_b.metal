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
    constant _16* fp_c10 [[id(1)]];
    constant _16* fp_c9 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    sampler fp_t_tcb_ASmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_48 [[color(0)]];
};

struct main0_in
{
    float4 m_45 [[user(locn0)]];
    float4 m_39 [[user(locn1)]];
    float4 m_37 [[user(locn2)]];
    float4 m_41 [[user(locn3)]];
    float4 m_43 [[user(locn4)]];
    float4 m_50 [[user(locn6)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _57 = gl_FragCoord.w;
    float _59 = in.m_37.x;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = (*spvDescriptorSet0.fp_c8)._m0[28].y * (*spvDescriptorSet0.fp_c8)._m0[28].y;
    float _67 = in.m_39.y;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_39.x;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = fma((*spvDescriptorSet0.fp_c8)._m0[28].x, (*spvDescriptorSet0.fp_c8)._m0[28].x, _65);
    float _81 = fma((*spvDescriptorSet0.fp_c8)._m0[28].z, (*spvDescriptorSet0.fp_c8)._m0[28].z, _79);
    float _83 = rsqrt(_81);
    float _85 = (*spvDescriptorSet0.fp_c10)._m0[5].x * (*spvDescriptorSet0.fp_c10)._m0[5].x;
    float _87 = fma((*spvDescriptorSet0.fp_c10)._m0[4].x, (*spvDescriptorSet0.fp_c10)._m0[4].x, _85);
    float _89 = fma((*spvDescriptorSet0.fp_c10)._m0[6].x, (*spvDescriptorSet0.fp_c10)._m0[6].x, _87);
    float _91 = 1.0 / _57;
    float _93 = _83 * (*spvDescriptorSet0.fp_c8)._m0[28].y;
    float _95 = _83 * (*spvDescriptorSet0.fp_c8)._m0[28].x;
    float _97 = _83 * (*spvDescriptorSet0.fp_c8)._m0[28].z;
    float _99 = _93 * (*spvDescriptorSet0.fp_c10)._m0[9].z;
    float _101 = sqrt(_89);
    float _103 = fma(_95, (*spvDescriptorSet0.fp_c10)._m0[8].z, _99);
    float _105 = fma(_97, (*spvDescriptorSet0.fp_c10)._m0[10].z, _103);
    float _107 = _91 * _63;
    bool _111 = _105 > 0.0;
    bool _113 = _105 >= 0.0;
    bool _115 = isnan(_105);
    bool _117 = _113 || _115;
    bool _119 = isnan(0.0);
    bool _121 = _117 || _119;
    int _124 = _121 ? 0 : 1;
    int _126 = ~_124;
    int _128 = _126 + 1;
    int _130 = _128 + 1;
    int _132 = _130;
    if (!_111)
    {
        int _134 = ~_124;
        int _136 = _134 + 1;
        _132 = _136;
    }
    int _138 = _132;
    float _140 = _101 * (*spvDescriptorSet0.fp_c9)._m0[194].z;
    float _142 = float(_138);
    float _144 = _142 * _140;
    float _146 = _91 * _71;
    float _148 = fma(_144, _107, 0.5);
    float _150 = _91 * _77;
    float _152 = 0.0 + _146;
    float _154 = precise::clamp(_152, 0.0, 1.0);
    float _156 = 0.0 + _148;
    float _158 = precise::clamp(_156, 0.0, 1.0);
    float2 _678 = float2(_150, _146);
    float2 _162 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_678, float2(0.0), isnan(_678))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_678, float2(0.0), isnan(_678))).xw;
    float _164 = _162.x;
    float _166 = _162.y;
    float2 _692 = float2(_158, _154);
    float2 _168 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_692, float2(0.0), isnan(_692))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_692, float2(0.0), isnan(_692))).xw;
    float _170 = _168.x;
    float _172 = _168.y;
    float _174 = in.m_37.y;
    float _176 = gl_FragCoord.w;
    float _178 = _174 * _176;
    bool _180 = _107 > 0.0;
    float _182 = in.m_41.w;
    float _184 = gl_FragCoord.w;
    float _186 = _182 * _184;
    bool _188 = _107 >= 0.0;
    bool _190 = isnan(_107);
    bool _192 = _188 || _190;
    bool _194 = isnan(0.0);
    bool _196 = _192 || _194;
    float _198 = in.m_41.z;
    float _200 = gl_FragCoord.w;
    float _202 = _198 * _200;
    float _204 = _101 * _107;
    float _206 = _91 * _178;
    int _208 = _196 ? 0 : 1;
    float _210 = _91 * _186;
    bool _212 = _206 > 0.0;
    float _214 = 1.0 / _210;
    bool _216 = _206 >= 0.0;
    bool _218 = isnan(_206);
    bool _220 = _216 || _218;
    bool _222 = isnan(0.0);
    bool _224 = _220 || _222;
    int _226 = ~_208;
    int _228 = _226 + 1;
    int _230 = _228 + 1;
    int _232 = _224 ? 0 : 1;
    int _234 = _230;
    if (!_180)
    {
        int _236 = ~_208;
        int _238 = _236 + 1;
        _234 = _238;
    }
    int _240 = _234;
    int _242 = ~_232;
    int _244 = _242 + 1;
    int _246 = _244 + 1;
    float _248 = in.m_43.x;
    float _250 = gl_FragCoord.w;
    float _252 = _248 * _250;
    float _254 = float(_240);
    int _256 = _246;
    if (!_212)
    {
        int _258 = ~_232;
        int _260 = _258 + 1;
        _256 = _260;
    }
    int _262 = _256;
    float _264 = _254 * 0.785398006439208984375;
    float _266 = float(_262);
    float _268 = _264 * _266;
    float _270 = _268 * 0.15915493667125701904296875;
    float _272 = _270 * 6.283185482025146484375;
    float _274 = sin(_272);
    float _276 = (*spvDescriptorSet0.fp_c10)._m0[2].x * 0.166666686534881591796875;
    float _278 = _270 * 6.283185482025146484375;
    float _280 = cos(_278);
    float _282 = floor(_276);
    float _284 = _206 * _274;
    float _286 = -_284;
    float _288 = fma(_204, _280, _286);
    float _290 = _282 * 0.20000000298023223876953125;
    float _292 = _282 * 0.100000001490116119384765625;
    float _294 = fma(_254, _290, _288);
    float _296 = floor(_292);
    float _298 = _91 * _202;
    float _300 = _298 * _214;
    float _302 = floor(_294);
    float _304 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _306 = fma(_300, (*spvDescriptorSet0.fp_c8)._m0[30].w, _304);
    float _308 = 1.0 / _306;
    float _310 = -_296;
    float _312 = _292 + _310;
    float _314 = fma(_312, 0.7790000438690185546875, 0.1640000045299530029296875);
    float _316 = fma(_312, 0.7790000438690185546875, 0.16500000655651092529296875);
    bool _318 = _148 >= 1.02499997615814208984375;
    bool _320 = isnan(_148);
    bool _322 = _318 || _320;
    bool _324 = isnan(1.02499997615814208984375);
    bool _326 = _322 || _324;
    float _328 = float(_326);
    float _330 = -_302;
    float _332 = _294 + _330;
    bool _334 = _148 < (-0.02500000037252902984619140625);
    float _336 = float(_334);
    float _338 = precise::max(_314, _332);
    float _340 = _328 + _336;
    float _342 = _91 * _252;
    float _344 = precise::min(_316, _338);
    float _346 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _348 = _308 * _346;
    float _350 = -_314;
    float _352 = _350 + _344;
    float _354 = precise::max(_348, 1.0);
    float _356 = _352 * 999.99798583984375;
    float _358 = precise::min(_354, 5.0);
    float _360 = fma(_358, 0.25, -0.25);
    float _362 = in.m_45.y;
    float _364 = gl_FragCoord.w;
    float _366 = _362 * _364;
    float _368 = in.m_45.z;
    float _370 = gl_FragCoord.w;
    float _372 = _368 * _370;
    float _374 = _164 * _164;
    float _376 = fma(_374, _356, _166);
    float _378 = _376 * _360;
    float _380 = fma(_340, _378, _172);
    float _382 = precise::clamp(_380, 0.0, 1.0);
    float _384 = _382 * _342;
    bool _386 = _384 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _388 = isnan(_384);
    bool _390 = _386 || _388;
    bool _392 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _394 = _390 || _392;
    float _396 = in.m_45.x;
    float _398 = gl_FragCoord.w;
    float _400 = _396 * _398;
    if (!_394)
    {
        discard_fragment();
    }
    float _402 = _170 * _170;
    float _404 = _91 * _372;
    float _406 = -_402;
    float _408 = fma(_376, _376, _406);
    float _410 = fma(_340, _408, _402);
    float _412 = _91 * _366;
    float _414 = _404 * _410;
    float _416 = _412 * _410;
    float _418 = _91 * _400;
    float _420 = _418 * _410;
    if (!_394)
    {
        out.m_48.x = _420;
        out.m_48.y = _416;
        out.m_48.z = _414;
        out.m_48.w = _382;
        return out;
    }
    float _422 = _416 * 0.715200006961822509765625;
    float _424 = in.m_50.w;
    float _426 = gl_FragCoord.w;
    float _428 = _424 * _426;
    float _430 = in.m_50.x;
    float _432 = gl_FragCoord.w;
    float _434 = _430 * _432;
    float _436 = in.m_50.y;
    float _438 = gl_FragCoord.w;
    float _440 = _436 * _438;
    float _442 = fma(_420, 0.2125999927520751953125, _422);
    float _444 = in.m_50.z;
    float _446 = gl_FragCoord.w;
    float _448 = _444 * _446;
    float _450 = fma(_414, 0.072200000286102294921875, _442);
    bool _452 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _454 = 1.0 / _450;
    float _456 = _454 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _458 = precise::clamp(_456, 0.0, 1.0);
    float _460 = fma(_458, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _462 = _91 * _428;
    float _464 = _428;
    float _466 = _462;
    if (_452)
    {
        float _468 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _470 = _348 + _468;
        _464 = _470;
    }
    float _472 = _464;
    float _474 = _91 * _434;
    float _476 = _460 * _462;
    float _478 = 0.0 + _384;
    float _480 = precise::clamp(_478, 0.0, 1.0);
    float _482 = _480;
    if (_452)
    {
        float _484 = _472 * 8.0;
        float _486 = precise::clamp(_484, 0.0, 1.0);
        _466 = _486;
    }
    float _488 = _466;
    float _490 = _91 * _440;
    float _492 = _91 * _448;
    float _494 = fma(_420, _476, _474);
    if (_452)
    {
        float _496 = _480 * _488;
        _482 = _496;
    }
    float _498 = _482;
    float _500 = fma(_416, _476, _490);
    float _502 = fma(_414, _476, _492);
    float _504 = 0.0 + _498;
    float _506 = precise::clamp(_504, 0.0, 1.0);
    out.m_48.x = _494;
    out.m_48.y = _500;
    out.m_48.z = _502;
    out.m_48.w = _506;
    return out;
}

