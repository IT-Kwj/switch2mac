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

template<typename T>
[[clang::optnone]] T spvFAdd(T l, T r)
{
    return fma(T(1), l, r);
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
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_44 [[color(0)]];
};

struct main0_in
{
    float4 m_41 [[user(locn0)]];
    float4 m_37 [[user(locn1)]];
    float4 m_48 [[user(locn2)]];
    float4 m_39 [[user(locn3)]];
    float4 m_35 [[user(locn4)]];
    float4 m_46 [[user(locn6)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _55 = gl_FragCoord.w;
    float _57 = in.m_35.z;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_35.w;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = 1.0 / _55;
    float _71 = _69 * _61;
    float _73 = _69 * _67;
    float2 _556 = float2(_71, _73);
    float2 _77 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_556, float2(0.0), isnan(_556))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_556, float2(0.0), isnan(_556))).xw;
    float _79 = _77.x;
    float _81 = _77.y;
    float _83 = in.m_37.w;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = in.m_39.x;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = in.m_35.x;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = _69 * _87;
    float _103 = in.m_35.y;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = _69 * _99;
    float _111 = _69 * _107;
    float _113 = _101 * _81;
    float _115 = _69 * _93;
    float _117 = 0.0 + _113;
    float _119 = precise::clamp(_117, 0.0, 1.0);
    float _121 = _119 * _115;
    bool _125 = _121 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _127 = isnan(_121);
    bool _129 = _125 || _127;
    bool _131 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _133 = _129 || _131;
    if (!_133)
    {
        discard_fragment();
    }
    float2 _646;
    _646.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_109, _111));
    _646.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_109, _111));
    float _135 = _646.x;
    float _137 = _135 * 256.0;
    int _140 = int(_137);
    float _142 = float(uint(_140));
    float _144 = _142 * 0.00390625;
    float _146 = precise::min(_144, 2.0);
    float2 _665 = float2(_109, _111);
    float _148 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_665, float2(0.0), isnan(_665)), level(_146)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_665, float2(0.0), isnan(_665)), level(_146)).w;
    float _150 = in.m_37.y;
    float _152 = gl_FragCoord.w;
    float _154 = _150 * _152;
    float _156 = in.m_37.z;
    float _158 = gl_FragCoord.w;
    float _160 = _156 * _158;
    float _162 = in.m_37.x;
    float _164 = gl_FragCoord.w;
    float _166 = _162 * _164;
    float _168 = _69 * _154;
    float _170 = _69 * _160;
    float _172 = _69 * _166;
    float _174 = -_170;
    float _176 = _168 + _174;
    bool _178 = _168 >= _170;
    bool _180 = isnan(_168);
    bool _182 = _178 || _180;
    bool _184 = isnan(_170);
    bool _186 = _182 || _184;
    float _188 = float(_186);
    float _190 = fma(_188, _176, _170);
    float _192 = -_168;
    float _194 = _192 + _170;
    float _196 = -_172;
    float _198 = _196 + _190;
    bool _200 = _172 >= _190;
    bool _202 = isnan(_172);
    bool _204 = _200 || _202;
    bool _206 = isnan(_190);
    bool _208 = _204 || _206;
    float _210 = float(_208);
    float _212 = fma(_188, _194, _168);
    float _214 = -_190;
    float _216 = _172 + _214;
    float _218 = _168 * (*spvDescriptorSet0.fp_c9)._m0[191].w;
    float _220 = fma(_210, _198, _172);
    float _222 = fma(_210, _216, _190);
    float _224 = -_188;
    float _226 = _224 + 0.666666686534881591796875;
    float _228 = precise::min(_212, _220);
    float _230 = -_212;
    float _232 = _230 + _220;
    float _234 = -_228;
    float _236 = _222 + _234;
    float _238 = fma(_236, 6.0, 1.0000000133514319600180897396058e-10);
    float _240 = _188 + (-1.0);
    float _242 = spvFAdd(_222, 1.0000000133514319600180897396058e-10);
    float _244 = -_226;
    float _246 = _240 + _244;
    float _248 = 1.0 / _238;
    float _250 = fma(_210, _246, _226);
    float _252 = 1.0 / _242;
    float _254 = fma(_232, _248, _250);
    float _256 = in.m_41.w;
    float _258 = gl_FragCoord.w;
    float _260 = _256 * _258;
    float _262 = abs(_254);
    float _264 = _262 + 0.07999999821186065673828125;
    float _266 = abs(_254);
    float _268 = _266 + 0.7466666698455810546875;
    float _270 = abs(_254);
    float _272 = _270 + 0.413333356380462646484375;
    float _274 = abs(_254);
    float _276 = fma(_274, 6.0, 0.4799999892711639404296875);
    float _278 = abs(_254);
    float _280 = fma(_278, 6.0, 4.480000019073486328125);
    float _282 = abs(_254);
    float _284 = fma(_282, 6.0, 2.480000019073486328125);
    float _286 = floor(_264);
    float _288 = _236 * _252;
    float _290 = _170 * (*spvDescriptorSet0.fp_c9)._m0[191].w;
    float _292 = _79 * _79;
    float _294 = _288 * (*spvDescriptorSet0.fp_c9)._m0[191].z;
    float _296 = floor(_268);
    float _298 = floor(_272);
    float _300 = fma(_286, -6.0, _276);
    float _302 = in.m_41.z;
    float _304 = gl_FragCoord.w;
    float _306 = _302 * _304;
    float _308 = _300 + (-3.0);
    float _310 = fma(_296, -6.0, _280);
    float _312 = abs(_308);
    float _314 = _312 + (-1.0);
    float _316 = precise::clamp(_314, 0.0, 1.0);
    float _318 = in.m_41.x;
    float _320 = gl_FragCoord.w;
    float _322 = _318 * _320;
    float _324 = _69 * _260;
    float _326 = _310 + (-3.0);
    float _328 = _316 + (-1.0);
    float _330 = fma(_298, -6.0, _284);
    float _332 = abs(_326);
    float _334 = _332 + (-1.0);
    float _336 = precise::clamp(_334, 0.0, 1.0);
    float _338 = in.m_41.y;
    float _340 = gl_FragCoord.w;
    float _342 = _338 * _340;
    float _344 = fma(_294, _328, 1.0);
    float _346 = _330 + (-3.0);
    float _348 = _336 + (-1.0);
    float _350 = abs(_346);
    float _352 = _350 + (-1.0);
    float _354 = precise::clamp(_352, 0.0, 1.0);
    float _356 = fma(_294, _348, 1.0);
    float _358 = _354 + (-1.0);
    float _360 = -_218;
    float _362 = fma(_222, _356, _360);
    float _364 = fma(_294, _358, 1.0);
    float _366 = _172 * (*spvDescriptorSet0.fp_c9)._m0[191].w;
    float _368 = fma(_292, _362, _218);
    float _370 = -_290;
    float _372 = fma(_222, _364, _370);
    float _374 = -_366;
    float _376 = fma(_222, _344, _374);
    float _378 = _368 + 0.310000002384185791015625;
    float _380 = fma(_292, _372, _290);
    float _382 = fma(_292, _376, _366);
    float _384 = _69 * _306;
    float _386 = _380 + 0.23999999463558197021484375;
    float _388 = _382 + 0.3400000035762786865234375;
    bool _390 = _148 >= _324;
    bool _392 = isnan(_148);
    bool _394 = _390 || _392;
    bool _396 = isnan(_324);
    bool _398 = _394 || _396;
    float _400 = float(_398);
    float _402 = _69 * _322;
    float _404 = _69 * _342;
    float _406 = _400 * (*spvDescriptorSet0.fp_c9)._m0[192].x;
    float _408 = fma(_402, _406, _388);
    float _410 = fma(_404, _406, _378);
    float _412 = fma(_384, _406, _386);
    if (!_133)
    {
        out.m_44.x = _408;
        out.m_44.y = _410;
        out.m_44.z = _412;
        out.m_44.w = _113;
        return out;
    }
    float _414 = _410 * 0.715200006961822509765625;
    float _416 = in.m_46.w;
    float _418 = gl_FragCoord.w;
    float _420 = _416 * _418;
    float _422 = in.m_46.z;
    float _424 = gl_FragCoord.w;
    float _426 = _422 * _424;
    float _428 = in.m_46.x;
    float _430 = gl_FragCoord.w;
    float _432 = _428 * _430;
    float _434 = fma(_408, 0.2125999927520751953125, _414);
    float _436 = in.m_46.y;
    float _438 = gl_FragCoord.w;
    float _440 = _436 * _438;
    float _442 = fma(_412, 0.072200000286102294921875, _434);
    bool _444 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _446 = 1.0 / _442;
    float _448 = _446 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _450 = precise::clamp(_448, 0.0, 1.0);
    float _452 = _69 * _420;
    float _454 = fma(_450, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _456 = _69 * _426;
    float _458 = _454 * _452;
    float _460 = 0.0 + _121;
    float _462 = precise::clamp(_460, 0.0, 1.0);
    float _464 = _69 * _432;
    float _466 = _69 * _440;
    float _468 = fma(_412, _458, _456);
    float _470 = fma(_408, _458, _464);
    float _472 = fma(_410, _458, _466);
    float _474 = _456;
    if (!_444)
    {
        _474 = _462;
    }
    float _476 = _474;
    bool _478 = !_444;
    float _480 = _476;
    if (!_478)
    {
        float _482 = in.m_48.w;
        float _484 = gl_FragCoord.w;
        float _486 = _482 * _484;
        float _488 = in.m_48.z;
        float _490 = gl_FragCoord.w;
        float _492 = _488 * _490;
        float _494 = _69 * _486;
        float _496 = _69 * _492;
        float _498 = 1.0 / _494;
        float _500 = _496 * _498;
        float _502 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _504 = fma(_500, (*spvDescriptorSet0.fp_c8)._m0[30].w, _502);
        float _506 = 1.0 / _504;
        float _508 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _510 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _512 = fma(_506, _508, _510);
        float _514 = _512 * 8.0;
        float _516 = precise::clamp(_514, 0.0, 1.0);
        float _518 = _462 * _516;
        _480 = _518;
    }
    float _520 = _480;
    float _522 = 0.0 + _520;
    float _524 = precise::clamp(_522, 0.0, 1.0);
    out.m_44.x = _470;
    out.m_44.y = _472;
    out.m_44.z = _468;
    out.m_44.w = _524;
    return out;
}

