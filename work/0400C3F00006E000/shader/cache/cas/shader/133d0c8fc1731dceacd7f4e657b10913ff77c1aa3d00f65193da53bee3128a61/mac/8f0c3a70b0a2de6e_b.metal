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
    texture2d<float> fp_t_tcb_10 [[id(3)]];
    sampler fp_t_tcb_10Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    sampler fp_t_tcb_10Smplr_w [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_50 [[color(0)]];
};

struct main0_in
{
    float4 m_41 [[user(locn0)]];
    float4 m_45 [[user(locn1)]];
    float4 m_35 [[user(locn2), flat]];
    float4 m_37 [[user(locn3)]];
    float4 m_43 [[user(locn4)]];
    float4 m_39 [[user(locn5)]];
    float4 m_47 [[user(locn6), flat]];
    float4 m_52 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _59 = gl_FragCoord.w;
    float _61 = in.m_35.x;
    float _63 = in.m_35.z;
    float _65 = in.m_37.w;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_39.x;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_37.x;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_37.y;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = in.m_39.y;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = 1.0 / _59;
    bool _99 = _61 > 0.0;
    bool _101 = _63 > 0.0;
    bool _103 = _61 >= 0.0;
    bool _105 = isnan(_61);
    bool _107 = _103 || _105;
    bool _109 = isnan(0.0);
    bool _111 = _107 || _109;
    bool _113 = _63 >= 0.0;
    bool _115 = isnan(_63);
    bool _117 = _113 || _115;
    bool _119 = isnan(0.0);
    bool _121 = _117 || _119;
    int _124 = _111 ? 0 : 1;
    int _126 = _121 ? 0 : 1;
    int _128 = ~_124;
    int _130 = _128 + 1;
    int _132 = _130 + 1;
    int _134 = ~_126;
    int _136 = _134 + 1;
    int _138 = _136 + 1;
    float _140 = _95 * _69;
    int _142 = _132;
    int _144 = _138;
    if (!_99)
    {
        int _146 = ~_124;
        int _148 = _146 + 1;
        _142 = _148;
    }
    int _150 = _142;
    float _152 = _95 * _75;
    if (!_101)
    {
        int _154 = ~_126;
        int _156 = _154 + 1;
        _144 = _156;
    }
    int _158 = _144;
    float _160 = 1.0 / _140;
    float _162 = float(_150);
    float _164 = _95 * _81;
    float _166 = float(_158);
    float _168 = _95 * _87;
    float _170 = _95 * _93;
    float _172 = 0.0 + _162;
    float _174 = precise::clamp(_172, 0.0, 1.0);
    float _176 = 0.0 + _166;
    float _178 = precise::clamp(_176, 0.0, 1.0);
    float _180 = fma(_174, 0.5, _152);
    float _182 = _164 * _160;
    float _184 = _168 * _160;
    float _186 = fma(_178, 0.5, _170);
    float2 _604 = float2(_182, _184);
    float _188 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_604, float2(0.0), isnan(_604))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_604, float2(0.0), isnan(_604))).x;
    float2 _614 = float2(_180, _186);
    float _190 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_614, float2(0.0), isnan(_614))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_614, float2(0.0), isnan(_614))).w;
    float _192 = in.m_37.z;
    float _194 = gl_FragCoord.w;
    float _196 = _192 * _194;
    float _198 = in.m_41.w;
    float _200 = gl_FragCoord.w;
    float _202 = _198 * _200;
    float _204 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _206 = _95 * _196;
    float _208 = _206 * _160;
    float _210 = in.m_43.x;
    float _212 = gl_FragCoord.w;
    float _214 = _210 * _212;
    float _216 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _218 = fma(_208, (*spvDescriptorSet0.fp_c8)._m0[30].w, _216);
    float _220 = _95 * _202;
    float _222 = 1.0 / _218;
    float _224 = in.m_45.x;
    float _226 = gl_FragCoord.w;
    float _228 = _224 * _226;
    float _230 = in.m_45.y;
    float _232 = gl_FragCoord.w;
    float _234 = _230 * _232;
    float _236 = in.m_45.z;
    float _238 = gl_FragCoord.w;
    float _240 = _236 * _238;
    float _242 = in.m_41.x;
    float _244 = gl_FragCoord.w;
    float _246 = _242 * _244;
    float _248 = in.m_41.y;
    float _250 = gl_FragCoord.w;
    float _252 = _248 * _250;
    float _254 = in.m_41.z;
    float _256 = gl_FragCoord.w;
    float _258 = _254 * _256;
    float _260 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _262 = fma(_188, (*spvDescriptorSet0.fp_c8)._m0[30].w, _260);
    float _264 = _220 + (*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _266 = precise::max(_220, _190);
    float _268 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _270 = precise::min(_264, _266);
    float _272 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _274 = _222 * _272;
    float _276 = 1.0 / _262;
    float _278 = -_220;
    float _280 = _278 + _270;
    float _282 = _280 * _204;
    float _284 = _95 * _214;
    float _286 = 0.0 + _282;
    float _288 = precise::clamp(_286, 0.0, 1.0);
    float _290 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _292 = -_274;
    float _294 = fma(_276, _290, _292);
    float _296 = _294 * _268;
    float _298 = precise::clamp(_296, 0.0, 1.0);
    float _300 = _288 * _298;
    float _302 = _300 * _284;
    bool _304 = _302 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _306 = isnan(_302);
    bool _308 = _304 || _306;
    bool _310 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _312 = _308 || _310;
    float _314 = in.m_47.x;
    float _316 = _274;
    if (!_312)
    {
        discard_fragment();
    }
    float _318 = precise::max(_264, _190);
    float _320 = _95 * _240;
    float _322 = 1.0 / _314;
    float _324 = _264 + _314;
    float _326 = precise::min(_324, _318);
    float _328 = _95 * _246;
    float _330 = -_264;
    float _332 = _330 + _326;
    float _334 = _95 * _228;
    float _336 = _332 * _322;
    float _338 = _95 * _234;
    float _340 = -_336;
    float _342 = _340 + 1.0;
    float _344 = _334 * _342;
    float _346 = _338 * _342;
    float _348 = _320 * _342;
    float _350 = _95 * _252;
    float _352 = _95 * _258;
    float _354 = fma(_328, _336, _344);
    float _356 = fma(_350, _336, _346);
    float _358 = fma(_352, _336, _348);
    if (!_312)
    {
        out.m_50.x = _354;
        out.m_50.y = _356;
        out.m_50.z = _358;
        out.m_50.w = _282;
        return out;
    }
    float _360 = _356 * 0.715200006961822509765625;
    float _362 = in.m_52.w;
    float _364 = gl_FragCoord.w;
    float _366 = _362 * _364;
    float _368 = in.m_52.x;
    float _370 = gl_FragCoord.w;
    float _372 = _368 * _370;
    float _374 = in.m_52.y;
    float _376 = gl_FragCoord.w;
    float _378 = _374 * _376;
    float _380 = fma(_354, 0.2125999927520751953125, _360);
    float _382 = in.m_52.z;
    float _384 = gl_FragCoord.w;
    float _386 = _382 * _384;
    float _388 = fma(_358, 0.072200000286102294921875, _380);
    bool _390 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _392 = 1.0 / _388;
    if (_390)
    {
        float _394 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _396 = _274 + _394;
        _316 = _396;
    }
    float _398 = _316;
    float _400 = _392 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _402 = precise::clamp(_400, 0.0, 1.0);
    float _404 = fma(_402, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _406 = _95 * _366;
    float _408 = _404 * _406;
    float _410 = 0.0 + _302;
    float _412 = precise::clamp(_410, 0.0, 1.0);
    float _414 = _406;
    float _416 = _412;
    if (_390)
    {
        float _418 = _398 * 8.0;
        float _420 = precise::clamp(_418, 0.0, 1.0);
        _414 = _420;
    }
    float _422 = _414;
    float _424 = _95 * _372;
    float _426 = _95 * _378;
    float _428 = _95 * _386;
    if (_390)
    {
        float _430 = _412 * _422;
        _416 = _430;
    }
    float _432 = _416;
    float _434 = fma(_354, _408, _424);
    float _436 = fma(_356, _408, _426);
    float _438 = fma(_358, _408, _428);
    float _440 = 0.0 + _432;
    float _442 = precise::clamp(_440, 0.0, 1.0);
    out.m_50.x = _434;
    out.m_50.y = _436;
    out.m_50.z = _438;
    out.m_50.w = _442;
    return out;
}

