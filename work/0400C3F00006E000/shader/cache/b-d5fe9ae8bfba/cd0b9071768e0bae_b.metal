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
    constant _16* vp_c8 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture3d<float> vp_t_tcb_32 [[id(6)]];
    sampler vp_t_tcb_32Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_30 [[id(8)]];
    sampler vp_t_tcb_30Smplr [[id(9)]];
    texture2d<float> vp_t_tcb_1C [[id(10)]];
    sampler vp_t_tcb_1CSmplr [[id(11)]];
    sampler vp_t_tcb_32Smplr_w [[id(12)]];
    sampler vp_t_tcb_30Smplr_w [[id(13)]];
    sampler vp_t_tcb_1CSmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_55 [[user(locn0)]];
    float4 m_71 [[user(locn1)]];
    float4 m_75 [[user(locn2)]];
    float4 m_77 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_67 [[user(locn5)]];
    float4 m_69 [[user(locn6)]];
    float4 m_73 [[user(locn7)]];
    float4 m_79 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_57 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_63 [[attribute(4)]];
    float4 m_61 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_59 [[attribute(9)]];
    float4 m_65 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1576 = false;
    bool _534 = false;
    bool _296 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_44.w;
    float _95 = trunc(_93);
    int _98 = int(_95);
    bool _102 = _98 >= 1;
    float _104 = 0.0;
    if (!_102)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _106 = _104;
    float _108 = _106;
    if (!_102)
    {
        out.m_47.x = 0.0;
    }
    int _110 = 0;
    if (!_102)
    {
        float _112 = _106 * 5.0;
        _110 = as_type<int>(_112);
    }
    int _114 = _110;
    int _116 = _114;
    if (!_102)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2238 = as_type<float>(_114);
        out.gl_Position.z = _2238;
    }
    if (!_102)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _118 = in.m_49.w;
    bool _120 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _122 = isnan(_118);
    bool _124 = _120 || _122;
    bool _126 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _128 = _124 || _126;
    float _130 = -_118;
    float _132 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _134 = _132;
    if (_128)
    {
        float _136 = float(_98);
        _108 = _136;
    }
    float _138 = _108;
    bool _140 = _132 >= _138;
    bool _142 = !_128;
    bool _144 = _140 || _142;
    float _146 = _138;
    if (_144)
    {
        _146 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _146;
    if (_144)
    {
        out.m_47.x = 0.0;
    }
    if (_144)
    {
        float _150 = _148 * 5.0;
        _116 = as_type<int>(_150);
    }
    int _152 = _116;
    if (_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2308 = as_type<float>(_152);
        out.gl_Position.z = _2308;
    }
    if (_144)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _154 = in.m_51.w;
    float _156 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _158 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _160 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _162 = _158 || _160;
    bool _164 = isnan(1.0);
    bool _166 = _162 || _164;
    float _168 = in.m_49.x;
    float _170 = in.m_49.y;
    float _172 = in.m_49.z;
    float _174 = in.m_44.x;
    float _176 = in.m_44.y;
    float _178 = in.m_44.z;
    float _180 = 0.0;
    float _182 = _156;
    if (!_166)
    {
        float _184 = _156 * _156;
        float _186 = _184 * 0.5;
        _180 = _186;
    }
    float _188 = _180;
    float _190 = _188;
    if (!_166)
    {
        float _192 = _188 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _192;
    }
    float _194 = _190;
    bool _196 = !_166;
    float _198 = _194;
    if (!_196)
    {
        float _200 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = log2(_200);
        float _204 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _206 = _204 + 1.0;
        float _208 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = _156 * _202;
        float _212 = 1.0 / _206;
        float _214 = _208 * 0.693147182464599609375;
        float _216 = exp2(_210);
        float _218 = 1.0 / _214;
        float _220 = _216 + (-1.0);
        float _222 = -_220;
        float _224 = fma(_222, _218, _156);
        float _226 = _224 * _212;
        float _228 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _198 = _228;
    }
    float _230 = _198;
    bool _232 = !_166;
    if (!_232)
    {
        float _234 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _236 = log2(_234);
        float _238 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _240 = _238 + 1.0;
        float _242 = 1.0 / _240;
        float _244 = _156 * _236;
        float _246 = exp2(_244);
        float _248 = -_246;
        float _250 = _248 + 1.0;
        float _252 = _250 * _242;
        _182 = _252;
    }
    float _254 = _182;
    bool _256 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _258 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _260 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _262 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _264 = fma(_254, _168, _258);
    float _266 = fma(_254, _170, _260);
    float _268 = fma(_254, _172, _262);
    float _270 = fma(_264, _154, _174);
    float _272 = fma(_266, _154, _176);
    float _274 = fma(_268, _154, _178);
    bool _276 = !_256;
    float _294;
    if (!_276)
    {
        float _278 = in.m_53.x;
        float _280 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _282 = _278 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _284 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[12].x, _132);
        float _286 = _284 * _280;
        float _288 = floor(_286);
        float _290 = -_288;
        float _292 = _286 + _290;
        _294 = _292;
        _296 = true;
    }
    else
    {
        float _298 = float(_98);
        float _300 = 1.0 / _298;
        float _302 = _132 * _300;
        _294 = _302;
    }
    _296 = false;
    float _304 = _294;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _308 = _304 + _306;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _312 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _310;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _316 = _314 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _320 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _318;
    float _322 = 1.0 / _312;
    float _324 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _328 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _330 = _324 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _332 = 1.0 / _316;
    float _334 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _336 = _326 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _338 = _328 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _342 = _304 + _340;
    float _344 = 1.0 / _320;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _348 = _304 + _346;
    float _350 = _342 * _322;
    out.m_55.x = _330;
    out.m_55.y = _336;
    out.m_55.z = _338;
    out.m_55.w = _334;
    bool _352 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _354 = isnan(_304);
    bool _356 = _352 || _354;
    bool _358 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _360 = _356 || _358;
    float _362 = float(_360);
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _364;
    bool _368 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _370 = _348 * _332;
    bool _372 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _374 = isnan(_304);
    bool _376 = _372 || _374;
    bool _378 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _380 = _376 || _378;
    float _382 = float(_380);
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _384;
    float _388 = fma(_366, _350, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _390 = -_382;
    float _392 = _390 + 1.0;
    float _394 = fma(_386, _350, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _396 = _308 * _344;
    bool _398 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _400 = isnan(_304);
    bool _402 = _398 || _400;
    bool _404 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _406 = _402 || _404;
    float _408 = float(_406);
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _410;
    bool _414 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _416 = isnan(_304);
    bool _418 = _414 || _416;
    bool _420 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _422 = _418 || _420;
    float _424 = float(_422);
    float _426 = _362 * _392;
    float _428 = -_362;
    float _430 = _428 + 1.0;
    float _432 = -_408;
    float _434 = _432 + 1.0;
    float _436 = fma(_412, _350, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _440 = _438 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _442 = _408 * _430;
    float _444 = _424 * _434;
    float _446 = -_424;
    float _448 = _446 + 1.0;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _452 = _450 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _454 = _388 * _444;
    float _456 = _394 * _444;
    float _458 = _436 * _444;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _462 = _460 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _464 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[143].x, _454);
    float _466 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[143].y, _456);
    float _468 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[143].z, _458);
    float _470 = fma(_440, _370, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _472 = fma(_452, _370, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _474 = fma(_462, _370, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _476;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _480;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _484;
    float _488 = fma(_470, _442, _464);
    float _490 = fma(_478, _396, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _492 = fma(_482, _396, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _494 = fma(_486, _396, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _496 = fma(_472, _442, _466);
    float _498 = fma(_474, _442, _468);
    float _500 = fma(_490, _426, _488);
    float _502 = fma(_492, _426, _496);
    float _504 = fma(_494, _426, _498);
    float _506 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[146].x, _500);
    float _508 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[146].y, _502);
    float _510 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[146].z, _504);
    bool _512 = !_368;
    float _514 = _464;
    float _532;
    if (!_512)
    {
        float _516 = in.m_53.x;
        float _518 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _520 = _516 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _522 = fma(_520, (*spvDescriptorSet0.vp_c9)._m0[11].w, _132);
        float _524 = _522 * _518;
        float _526 = floor(_524);
        float _528 = -_526;
        float _530 = _524 + _528;
        _532 = _530;
        _534 = true;
    }
    else
    {
        float _536 = float(_98);
        float _538 = 1.0 / _536;
        float _540 = _132 * _538;
        _532 = _540;
    }
    _534 = false;
    float _542 = _532;
    float _544 = in.m_53.z;
    float _546 = _272 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _548 = in.m_53.x;
    int _550 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _552 = _550 != 0;
    float _554 = _272 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _556 = _272 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _558 = in.m_53.y;
    float _560 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _562 = log2(_560);
    float _564 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[4].x, _546);
    float _566 = in.m_53.w;
    float _568 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _570 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[4].z, _564);
    bool _572 = _542 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _574 = isnan(_542);
    bool _576 = _572 || _574;
    bool _578 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _580 = _576 || _578;
    float _582 = float(_580);
    float _584 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _586 = _544 * 2.0;
    if (!_552)
    {
        _514 = _544;
    }
    float _588 = _514;
    float _590 = _562 * _132;
    float _592 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _594 = _548 * 2.0;
    float _596 = _558 * 2.0;
    float _598 = _588;
    if (_552)
    {
        _598 = _558;
    }
    float _600 = _598;
    float _602 = _558 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _604 = floor(_586);
    float _606 = _584 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _608 = fma(_602, -2.0, _568);
    float _610 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[76].y, _608);
    float _612 = floor(_594);
    float _614 = floor(_596);
    bool _616 = _604 > 0.0;
    bool _618 = _604 >= 0.0;
    bool _620 = isnan(_604);
    bool _622 = _618 || _620;
    bool _624 = isnan(0.0);
    bool _626 = _622 || _624;
    float _628 = _626 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _630 = exp2(_590);
    bool _632 = _612 >= 0.0;
    bool _634 = isnan(_612);
    bool _636 = _632 || _634;
    bool _638 = isnan(0.0);
    bool _640 = _636 || _638;
    bool _642 = _612 > 0.0;
    float _644 = _640 ? 0.0 : 1.4012984643248170709237295832899e-45;
    int _646 = ~as_type<int>(_628);
    int _648 = _646 + 1;
    int _650 = _648 + 1;
    bool _652 = _614 >= 0.0;
    bool _654 = isnan(_614);
    bool _656 = _652 || _654;
    bool _658 = isnan(0.0);
    bool _660 = _656 || _658;
    bool _662 = _614 > 0.0;
    int _664 = _660 ? 0 : 1;
    int _666 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _668 = _666 != 0;
    int _670 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _672 = _670 != 0;
    int _674 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _676 = _674 != 0;
    float _678 = -_630;
    float _680 = _678 + 1.0;
    float _682 = in.m_51.x;
    float _684 = in.m_51.y;
    float _686 = in.m_51.z;
    int _688 = ~_664;
    int _690 = _688 + 1;
    int _692 = _690 + 1;
    int _694 = ~as_type<int>(_644);
    int _696 = _694 + 1;
    int _698 = _696 + 1;
    int _700 = _650;
    int _702 = _692;
    int _704 = _698;
    float _706 = _644;
    float _708 = _628;
    if (!_616)
    {
        int _710 = ~as_type<int>(_628);
        int _712 = _710 + 1;
        _700 = _712;
    }
    int _714 = _700;
    if (!_662)
    {
        int _716 = ~_664;
        int _718 = _716 + 1;
        _702 = _718;
    }
    int _720 = _702;
    if (!_642)
    {
        int _722 = ~as_type<int>(_644);
        int _724 = _722 + 1;
        _704 = _724;
    }
    int _726 = _704;
    if (!_552)
    {
        _706 = _558;
    }
    float _728 = _706;
    float _730 = _728;
    if (!_552)
    {
        _708 = _544;
    }
    float _732 = _708;
    float _734 = _732;
    if (_552)
    {
        _730 = _548;
    }
    float _736 = _730;
    if (_552)
    {
        _734 = _558;
    }
    float _738 = _734;
    int _740 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _742 = _740 != 0;
    int _744 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _746 = _744 != 0;
    float _748 = _508 * _684;
    float _750 = _510 * _686;
    int _752 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _754 = _752 != 0;
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _758 = _756 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _760 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _762 = _760 != 0;
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _766 = _764 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _768 = !_668;
    int _770 = _768 ? 0 : 1;
    float _772 = _506 * _682;
    bool _774 = _566 > 0.5;
    float _776 = 1.0 / _766;
    float _778 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[5].x, _554);
    float _780 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[6].x, _556);
    float _782 = _548 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _786 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _784;
    float _788 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[5].z, _778);
    float _790 = 1.0 / _758;
    float _792 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[6].z, _780);
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _796 = _794 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _798 = _548 + _544;
    float _800 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _802 = _548 + _558;
    float _804 = _798 + (-1.0);
    float _806 = _796 * _776;
    float _808 = _558 + _544;
    float _810 = -_800;
    float _812 = fma(_782, 2.0, _810);
    float _814 = _808 + (-1.0);
    float _816 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _818 = _802 + (-1.0);
    float _820 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _822 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _824 = abs(_770);
    float _826 = fma(_818, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _828 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _830 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _832 = _736 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _834 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[83].w, _822);
    float _836 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _838 = _600 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _840 = -_828;
    float _842 = fma(_832, 2.0, _840);
    float _844 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[83].z, _830);
    float _846 = fma(_838, -2.0, _836);
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _850 = 1.0 + _848;
    float _852 = in.m_57.x;
    float _854 = in.m_57.y;
    float _856 = in.m_57.z;
    float _858 = float(_824);
    float _860 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _862 = float(_714);
    float _864 = 1.0 / _850;
    float _866 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[78].z, _860);
    bool _868 = !_676;
    int _870 = _868 ? 0 : 1;
    float _872 = _858 * _862;
    bool _874 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _876 = isnan(1.0);
    bool _878 = _874 || _876;
    bool _880 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _882 = _878 || _880;
    float _884 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _886 = !_672;
    int _888 = _886 ? 0 : 1;
    float _890 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].z, _866);
    bool _892 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _894 = isnan(0.0);
    bool _896 = _892 || _894;
    bool _898 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _900 = _896 || _898;
    float _902 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[78].w, _884);
    int _904 = abs(_888);
    float _906 = -_132;
    float _908 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[76].x, _812);
    float _910 = _900 ? _680 : 0.0;
    float _912 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].w, _902);
    float _914 = float(_904);
    float _916 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].z, _844);
    int _918 = abs(_870);
    float _920 = -_132;
    float _922 = fma(_920, (*spvDescriptorSet0.vp_c9)._m0[81].x, _842);
    float _924 = float(_726);
    float _926 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].w, _834);
    float _928 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[81].y, _846);
    bool _930 = _900;
    bool _932 = _774;
    if (_882)
    {
        float _934 = _910 * _864;
        _134 = _934;
    }
    float _936 = _134;
    float _938 = _872 * (-2.0);
    float _940 = _914 * _924;
    float _942 = _786 * _790;
    if (_742)
    {
        bool _944 = _548 > 0.5;
        _930 = _944;
    }
    bool _946 = _930;
    float _948 = _548 + (-0.5);
    float _950 = fma(_938, _852, _852);
    float _952 = float(_918);
    float _954 = fma(_826, _938, _826);
    float _956 = float(_720);
    float _958 = fma(_948, (*spvDescriptorSet0.vp_c9)._m0[196].x, _950);
    float _960 = in.m_59.y;
    float _962 = _940 * (-2.0);
    float _964 = _952 * _956;
    float _966 = fma(_954, _936, _958);
    bool _968 = _558 > 0.5;
    float _970 = in.m_61.x;
    float _972 = in.m_61.y;
    float _974 = in.m_61.z;
    float _976 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _978 = _976 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _980 = _964 * (-2.0);
    float _982 = fma(_962, _854, _854);
    float _984 = _558 + (-0.5);
    float _986 = 1.0 / _978;
    float _988 = fma(_980, _856, _856);
    float _990 = fma(_816, _980, _816);
    float _992 = fma(_984, (*spvDescriptorSet0.vp_c9)._m0[196].y, _982);
    float _994 = fma(_820, _962, _820);
    float _996 = _544 + (-0.5);
    float _998 = _772 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1000 = fma(_994, _936, _992);
    float _1002 = fma(_996, (*spvDescriptorSet0.vp_c9)._m0[196].z, _988);
    float _1004 = _966 * 0.15915493667125701904296875;
    float _1006 = _1000 * 0.15915493667125701904296875;
    float _1008 = -_960;
    float _1010 = _1008 + 1.0;
    float _1012 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1014 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1012;
    float _1016 = _748 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1018 = in.m_59.x;
    float _1020 = _1004 * 6.283185482025146484375;
    float _1022 = cos(_1020);
    int _1024 = _774 ? as_type<int>(_1010) : as_type<int>(_960);
    float _1026 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _970);
    float _1028 = _1014 * _986;
    float _1030 = _960;
    float _1032 = _1028;
    if (_746)
    {
        bool _1034 = _544 > 0.5;
        _932 = _1034;
    }
    bool _1036 = _932;
    float _1038 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _972);
    float _1040 = _998 * _1026;
    float _1042 = fma(_990, _936, _1002);
    float _1044 = _1004 * 6.283185482025146484375;
    float _1046 = sin(_1044);
    float _1048 = in.m_63.x;
    float _1050 = in.m_63.y;
    float _1052 = in.m_63.z;
    float _1054 = _1016 * _1038;
    float _1056 = _1042 * 0.15915493667125701904296875;
    float _1058 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _974);
    float _1060 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1062 = _542 + _1060;
    float _1064 = _792 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1066 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1068 = _754 ? as_type<float>(_1024) : _960;
    float _1070 = _750 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _1072 = _972 != 0.0;
    bool _1074 = isnan(_972);
    bool _1076 = _1072 || _1074;
    bool _1078 = isnan(0.0);
    bool _1080 = _1076 || _1078;
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1084 = _542 + _1082;
    float _1086 = _1042;
    float _1088 = _1064;
    if (_762)
    {
        float _1090 = _968 ? _1010 : _960;
        _1030 = _1090;
    }
    float _1092 = _1030;
    float _1094 = _1070 * _1058;
    bool _1096 = _970 == 0.0;
    bool _1098 = !_1080;
    bool _1100 = _1096 && _1098;
    float _1102 = _1006 * 6.283185482025146484375;
    float _1104 = sin(_1102);
    float _1106 = fma(_806, _1084, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1108 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1110 = _542 + _1108;
    bool _1112 = _974 == 0.0;
    bool _1114 = _1112 && _1100;
    float _1116 = fma(_942, _1062, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    if (!_742)
    {
        _1086 = _1018;
    }
    float _1118 = _1086;
    float _1120 = fma(_1028, _1110, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1122 = _1006 * 6.283185482025146484375;
    float _1124 = cos(_1122);
    float _1126 = _1066 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1128 = _1118;
    if (!_742)
    {
        _1032 = _1118;
    }
    float _1130 = _1032;
    float _1132 = _1130;
    if (_742)
    {
        _1128 = _1018;
    }
    float _1134 = _1128;
    float _1136 = fma(_1068, _1126, -0.5);
    float _1138 = _1056 * 6.283185482025146484375;
    float _1140 = cos(_1138);
    float _1142 = _1048;
    float _1144 = _1052;
    float _1146 = _1050;
    float _1148 = _1134;
    if (!_1114)
    {
        float _1150 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1048);
        _1142 = _1150;
    }
    float _1152 = _1142;
    if (!_1114)
    {
        float _1154 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1052);
        _1144 = _1154;
    }
    float _1156 = _1144;
    float _1158 = _1046 * _1104;
    if (!_1114)
    {
        float _1160 = fma(_972, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1050);
        _1146 = _1160;
    }
    float _1162 = _1146;
    int _1164 = 0;
    if (_742)
    {
        float _1166 = -_1134;
        float _1168 = _1166 + 1.0;
        _1164 = as_type<int>(_1168);
    }
    int _1170 = _1164;
    int _1172 = 0;
    if (_746)
    {
        float _1174 = -_1134;
        float _1176 = _1174 + 1.0;
        _1172 = as_type<int>(_1176);
    }
    int _1178 = _1172;
    float _1180 = -_928;
    float _1182 = fma(_926, _1136, _1180);
    float _1184 = _1056 * 6.283185482025146484375;
    float _1186 = sin(_1184);
    float _1188 = _1046 * _1124;
    float _1190 = _1022 * _1124;
    if (_742)
    {
        float _1192 = _946 ? as_type<float>(_1170) : _1134;
        _1132 = _1192;
    }
    float _1194 = _1132;
    float _1196 = _1194;
    if (_746)
    {
        float _1198 = _1036 ? as_type<float>(_1178) : _1134;
        _1148 = _1198;
    }
    float _1200 = _1148;
    float _1202 = _1046 * _1140;
    float _1204 = _1022 * _1140;
    float _1206 = _1124 * _1140;
    float _1208 = _1022 * _1104;
    float _1210 = _1202 * _1054;
    float _1212 = _1204 * _1054;
    float _1214 = _1104 * _1140;
    float _1216 = _1204 * _1162;
    float _1218 = fma(_1186, _1190, _1158);
    float _1220 = fma(_1186, _1158, _1190);
    float _1222 = -_1054;
    float _1224 = _1186 * _1222;
    float _1226 = -_1208;
    float _1228 = fma(_1186, _1188, _1226);
    float _1230 = -_1188;
    float _1232 = fma(_1186, _1208, _1230);
    float _1234 = fma(_1218, _1040, _1212);
    float _1236 = fma(_1206, _1040, _1224);
    float _1238 = fma(_1228, _1040, _1210);
    bool _1240 = _542 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1242 = isnan(_542);
    bool _1244 = _1240 || _1242;
    bool _1246 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1248 = _1244 || _1246;
    float _1250 = float(_1248);
    float _1252 = fma(_1232, _1094, _1234);
    float _1254 = fma(_1214, _1094, _1236);
    bool _1256 = _542 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1258 = isnan(_542);
    bool _1260 = _1256 || _1258;
    bool _1262 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1264 = _1260 || _1262;
    float _1266 = float(_1264);
    float _1268 = fma(_1220, _1094, _1238);
    float _1270 = _1252 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1272 = _1252 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    bool _1274 = _542 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1276 = isnan(_542);
    bool _1278 = _1274 || _1276;
    bool _1280 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1282 = _1278 || _1280;
    float _1284 = float(_1282);
    float _1286 = -_1250;
    float _1288 = _1286 + 1.0;
    float _1290 = fma(_1254, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1270);
    float _1292 = fma(_1254, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1272);
    float _1294 = _570 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1296 = _1284 * _1288;
    float _1298 = -_1284;
    float _1300 = _1298 + 1.0;
    float _1302 = fma(_1268, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1290);
    float _1304 = fma(_1268, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1292);
    float _1306 = -_1266;
    float _1308 = _1306 + 1.0;
    float _1310 = _1266 * _1300;
    float _1312 = _1294 + _1302;
    float _1314 = _1064 + _1304;
    float _1316 = _582 * _1308;
    float _1318 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1320 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1322 = _1312 + _1320;
    float _1324 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1326 = _1314 + _1324;
    float _1328 = _1116 * _1316;
    float _1330 = fma(_606, _1092, -0.5);
    float _1332 = _1322 * _1322;
    float _1334 = _1326 * _1326;
    float _1336 = -_582;
    float _1338 = _1336 + 1.0;
    float _1340 = -_610;
    float _1342 = fma(_912, _1330, _1340);
    float _1344 = -_1162;
    float _1346 = _1186 * _1344;
    float _1348 = _1332 + _1334;
    float _1350 = fma(_1338, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1328);
    float _1352 = _1202 * _1162;
    float _1354 = fma(_1206, _1152, _1346);
    float _1356 = sqrt(_1348);
    float _1358 = _788 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1360 = _1318 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1362 = _592 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1364 = fma(_1106, _1310, _1350);
    float _1366 = fma(_1218, _1152, _1216);
    float _1368 = fma(_1360, _1194, -0.5);
    float _1370 = fma(_1362, _1200, -0.5);
    float _1372 = fma(_1228, _1152, _1352);
    float _1374 = fma(_1120, _1296, _1364);
    float _1376 = fma(_890, _1368, _908);
    float _1378 = _1252 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1380 = fma(_1214, _1156, _1354);
    float _1382 = fma(_1232, _1156, _1366);
    float _1384 = fma(_916, _1370, _922);
    float _1386 = fma(_1254, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1378);
    bool _1388 = _1356 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1390 = fma(_1220, _1156, _1372);
    float _1392 = fma(_1250, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1374);
    float _1394 = fma(_1268, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1386);
    float _1396 = _1358 + _1394;
    float _1398 = _1372;
    float _1400 = _1332;
    float _1402 = _1334;
    float _1404 = _1312;
    float _1406 = _1314;
    float _1408 = _1376;
    if (!_1388)
    {
        _1398 = _1396;
    }
    float _1410 = _1398;
    bool _1412 = !_1388;
    float _1414 = _1410;
    if (!_1412)
    {
        float _1416 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1418 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1420 = _1356 + _1418;
        float _1422 = rsqrt(_1348);
        float _1424 = _1420 * _1416;
        float _1426 = _1396 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1428 = _1424 * 0.15915493667125701904296875;
        float _1430 = _1428 * 6.283185482025146484375;
        float _1432 = sin(_1430);
        float _1434 = _1428 * 6.283185482025146484375;
        float _1436 = cos(_1434);
        float _1438 = fma(_1432, _1426, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1440 = _1422 * _1438;
        float _1442 = _1436 + (-1.0);
        float _1444 = fma(_1322, _1440, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1446 = fma(_1326, _1440, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1448 = _1442 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1450 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1452 = _1444 + _1450;
        float _1454 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1456 = _1446 + _1454;
        float _1458 = fma(_1396, _1436, _1448);
        float _1460 = _1452 * _1452;
        float _1462 = _1456 * _1456;
        _1414 = _1458;
        _1400 = _1460;
        _1402 = _1462;
        _1404 = _1444;
        _1406 = _1446;
    }
    float _1464 = _1414;
    float _1466 = _1400;
    float _1468 = _1402;
    float _1470 = _1404;
    float _1472 = _1406;
    float _1474 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1476 = _1464 + _1474;
    float _1478 = in.m_65.w;
    float _1480 = _1382 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1482 = fma(_1476, _1476, _1466);
    float _1484 = _1382 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1486 = _1382 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1488 = _1482 + _1468;
    float _1490 = fma(_1380, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1480);
    float _1492 = fma(_1380, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1484);
    float _1494 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1496 = fma(_1380, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1486);
    float _1498 = sqrt(_1488);
    float _1500 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1502 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1504 = _1342 + 0.5;
    float _1506 = fma(_1390, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1490);
    float _1508 = _1182 + 0.5;
    float _1510 = fma(_1390, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1492);
    float _1512 = _1500 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1514 = _1494 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1516 = _1502 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1518 = _1376 + 0.5;
    float _1520 = _1384 + 0.5;
    float _1522 = _1392 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1524 = fma(_1390, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1496);
    out.m_67.w = _1478;
    bool _1526 = _1498 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1528 = isnan(_1498);
    bool _1530 = _1526 || _1528;
    bool _1532 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1534 = _1530 || _1532;
    out.m_69.x = _1518;
    out.m_69.y = _1504;
    out.m_69.z = _1520;
    out.m_69.w = _1508;
    out.m_71.x = _1512;
    out.m_71.y = _1514;
    out.m_71.z = _1516;
    out.m_71.w = _1522;
    out.m_73.x = _1506;
    out.m_73.y = _1510;
    out.m_73.z = _1524;
    float _1536 = _1464;
    float _1538 = _1518;
    float _1540 = _1508;
    if (!_1534)
    {
        _1408 = 1.0;
    }
    float _1542 = _1408;
    bool _1544 = !_1534;
    float _1546 = _1542;
    if (!_1544)
    {
        bool _1548 = _1498 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1550 = isnan(_1498);
        bool _1552 = _1548 || _1550;
        bool _1554 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1556 = _1552 || _1554;
        if (!_1556)
        {
            float _1558 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1560 = _1498 + _1558;
            float _1562 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1564 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1562;
            float _1566 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1568 = _1566 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1570 = 1.0 / _1564;
            float _1572 = _1560 * _1570;
            float _1574 = fma(_1572, _1568, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1546 = _1574;
            _1576 = true;
        }
        else
        {
            bool _1578 = _1498 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1580 = isnan(_1498);
            bool _1582 = _1578 || _1580;
            bool _1584 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1586 = _1582 || _1584;
            if (!_1586)
            {
                float _1588 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1590 = _1498 + _1588;
                float _1592 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1594 = _1592 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1596 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1598 = _1596 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1600 = 1.0 / _1594;
                float _1602 = _1590 * _1600;
                float _1604 = fma(_1602, _1598, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1546 = _1604;
                _1576 = true;
            }
            else
            {
                _1546 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1576 = false;
    float _1606 = _1546;
    float _1608 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1610 = _1470 + _1608;
    float _1612 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1614 = _1464 + _1612;
    float _1616 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1618 = _1472 + _1616;
    bool _1620 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1622 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1624 = _1620 || _1622;
    bool _1626 = isnan(0.5);
    bool _1628 = _1624 || _1626;
    float _1630 = fma(_1610, _1606, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1632 = fma(_1614, _1606, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1634 = fma(_1618, _1606, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1636 = _1618;
    float _1638 = _1630;
    if (_1628)
    {
        _1636 = _1632;
    }
    float _1640 = _1636;
    float _1642 = _1640;
    if (_1628)
    {
        _1536 = _1634;
    }
    float _1644 = _1536;
    float _1646 = _1644;
    if (!_1628)
    {
        float _1648 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1650 = _1358 + _1648;
        float _1652 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1654 = _1294 + _1652;
        float _1656 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1658 = -_1294;
        float _1660 = _1658 + _1630;
        float _1662 = _1650 * _1650;
        float _1664 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1666 = _1064 + _1664;
        float _1668 = fma(_1654, _1654, _1662);
        float _1670 = fma(_1666, _1666, _1668);
        float _1672 = -_1064;
        float _1674 = _1672 + _1634;
        float _1676 = sqrt(_1670);
        float _1678 = precise::min(_1676, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1680 = _1678 * _1656;
        float _1682 = -_1358;
        float _1684 = _1682 + _1632;
        float _1686 = fma(_1660, _1680, _1294);
        float _1688 = fma(_1684, _1680, _1358);
        float _1690 = fma(_1674, _1680, _1064);
        _1642 = _1688;
        _1638 = _1686;
        _1646 = _1690;
    }
    float _1692 = _1642;
    float _1694 = _1638;
    float _1696 = _1646;
    float _1698 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1700 = _1692 + _1698;
    float _1702 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1704 = _1694 + _1702;
    float _1706 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1708 = _1696 + _1706;
    float _1710 = _1700 * _1700;
    float _1712 = fma(_1704, _1704, _1710);
    float _1714 = fma(_1708, _1708, _1712);
    float _1716 = rsqrt(_1714);
    float _1718 = sqrt(_1714);
    float _1720 = _1716 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1722 = _1704 * _1720;
    float _1724 = _1708 * _1720;
    float _1726 = _1722 * _1722;
    float _1728 = _1724 * _1724;
    float _1730 = _1726 + _1728;
    float _1732 = sqrt(_1730);
    bool _1734 = _1732 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1736 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1738 = _1732 + _1736;
    float _1740 = _1712;
    float _1742 = _1738;
    float _1744 = _1720;
    float _1746 = _1722;
    if (_1734)
    {
        float _1748 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1740 = _1748;
    }
    float _1750 = _1740;
    if (_1734)
    {
        float _1752 = rsqrt(_1730);
        _1538 = _1752;
    }
    float _1754 = _1538;
    float _1756 = _1754;
    if (_1734)
    {
        float _1758 = _1738 * _1750;
        _1742 = _1758;
    }
    float _1760 = _1742;
    if (_1734)
    {
        float _1762 = _1760 * 0.15915493667125701904296875;
        _1540 = _1762;
    }
    float _1764 = _1540;
    float _1766 = _1750;
    float _1768 = _1764;
    if (_1734)
    {
        float _1770 = _1764 * 6.283185482025146484375;
        float _1772 = sin(_1770);
        _1766 = _1772;
    }
    float _1774 = _1766;
    float _1776 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1778 = precise::max(0.0, _1776);
    float _1780 = _1520;
    float _1782 = _1778;
    if (_1734)
    {
        float _1784 = _1764 * 6.283185482025146484375;
        float _1786 = cos(_1784);
        _1780 = _1786;
    }
    float _1788 = _1780;
    float _1790 = -_1720;
    float _1792 = -_1778;
    float _1794 = fma(_1700, _1790, _1792);
    if (_1734)
    {
        float _1796 = _1794 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1782 = _1796;
    }
    float _1798 = _1782;
    float _1800 = _1798;
    if (!_1734)
    {
        _1768 = _1726;
    }
    float _1802 = _1768;
    float _1804 = _1774;
    float _1806 = _1802;
    if (_1734)
    {
        float _1808 = fma(_1774, _1798, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1804 = _1808;
    }
    float _1810 = _1804;
    float _1812 = _1810;
    if (_1734)
    {
        float _1814 = _1788 + (-1.0);
        _1800 = _1814;
    }
    float _1816 = _1800;
    float _1818 = _1816;
    if (_1734)
    {
        float _1820 = _1754 * _1810;
        _1196 = _1820;
    }
    float _1822 = _1196;
    if (!_1734)
    {
        _1756 = _1794;
    }
    float _1824 = _1756;
    float _1826 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1828 = fma(_1718, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1826);
    float _1830 = precise::clamp(_1828, 0.0, 1.0);
    float _1832 = _1824;
    if (_1734)
    {
        float _1834 = _1816 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1744 = _1834;
    }
    float _1836 = _1744;
    if (_1734)
    {
        float _1838 = _1722 * _1822;
        _1746 = _1838;
    }
    float _1840 = _1746;
    if (!_1734)
    {
        _1812 = _1724;
    }
    float _1842 = _1812;
    float _1844 = _1842;
    if (_1734)
    {
        float _1846 = _1724 * _1822;
        _1844 = _1846;
    }
    float _1848 = _1844;
    if (_1734)
    {
        float _1850 = fma(_1794, _1788, _1836);
        _1832 = _1850;
    }
    float _1852 = _1832;
    if (_1734)
    {
        float _1854 = _1840 * _1840;
        _1806 = _1854;
    }
    float _1856 = _1806;
    if (!_1734)
    {
        _1818 = _1728;
    }
    float _1858 = _1818;
    float _1860 = _1858;
    if (_1734)
    {
        float _1862 = _1848 * _1848;
        _1860 = _1862;
    }
    float _1864 = _1860;
    float _1866 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1868 = fma(_1852, _1852, _1856);
    float _1870 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1872 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1874 = -_1830;
    float _1876 = _1874 + 1.0;
    float _1878 = _1868 + _1864;
    float _1880 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1870);
    float _1882 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1884 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1872);
    float _1886 = rsqrt(_1878);
    float _1888 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1880);
    float _1890 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1882);
    float _1892 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1884);
    float _1894 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1896 = _1888 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1898 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1890);
    float _1900 = _1892 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1902 = abs(_1876);
    float _1904 = log2(_1902);
    float _1906 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1894);
    float _1908 = _1898 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1910 = _1896 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1912 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1906);
    float _1914 = _1908 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1916 = -_1910;
    float _1918 = fma(_1916, _1866, 1.0);
    float _1920 = _1886 * _1840;
    float _1922 = _1886 * _1852;
    float _1924 = fma(_1900, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1914);
    float _1926 = _1886 * _1848;
    float _1928 = _1920 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1930 = _1912 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1932 = fma(_1896, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1924);
    float _1934 = log2(_1918);
    float _1936 = -_1928;
    float _1938 = fma(_1922, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1936);
    float _1940 = _1904 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1942 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1932);
    float _1944 = _1908 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1946 = -_1926;
    float _1948 = fma(_1946, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1938);
    float _1950 = _1908 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1952 = exp2(_1940);
    float _1954 = fma(_1948, -0.5, 0.5);
    float _1956 = fma(_1900, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1944);
    float _1958 = fma(_1900, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1950);
    float _1960 = fma(_1948, 0.5, 0.5);
    float _1962 = fma(_1896, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1956);
    float _1964 = fma(_1896, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1958);
    float _1966 = 1.0 / _1942;
    float _1968 = _1922 + 1.0;
    float _1970 = fma(_1960, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1972 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1962);
    float _1974 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1964);
    float _1976 = _1934 * 0.693147182464599609375;
    float _1978 = fma(_1960, _1970, -0.212114393711090087890625);
    float _1980 = sqrt(_1954);
    float _1982 = -_1922;
    float _1984 = fma(_1952, _1968, _1982);
    float _1986 = fma(_1960, _1978, 1.570728778839111328125);
    float _1988 = _1976 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1990 = fma(_1984, 0.5, 0.5);
    float _1992 = _1972 * _1966;
    float _1994 = _1974 * _1966;
    float _1996 = fma(_1992, 0.5, 0.5);
    float _1998 = fma(_1994, -0.5, 0.5);
    float _2000 = _1980 * 0.636619746685028076171875;
    float3 _5305 = float3(_1996, _1998, _1988);
    float _2002 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5305, float3(0.0), isnan(_5305)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5305, float3(0.0), isnan(_5305)), level(0.0)).x;
    float3 _5316 = float3(_1996, _1998, _1988);
    float4 _2005 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5316, float3(0.0), isnan(_5316)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5316, float3(0.0), isnan(_5316)), level(0.0)).xyzw;
    float _2007 = _2005.x;
    float _2009 = _2005.y;
    float _2011 = _2005.z;
    float _2013 = _2005.w;
    float _2015 = -_1986;
    float _2017 = fma(_2000, _2015, 1.0);
    float2 _5338 = float2(_2017, _1990);
    float3 _2021 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5338, float2(0.0), isnan(_5338)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5338, float2(0.0), isnan(_5338)), level(0.0)).xyz;
    float _2023 = _2021.x;
    float _2025 = _2021.y;
    float _2027 = _2021.z;
    float _2029 = _1358 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2031 = _1358 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2033 = _1908 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_75.x = _1704;
    out.m_75.y = _1700;
    out.m_75.z = _1708;
    float _2035 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2029);
    float _2037 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2031);
    float _2039 = fma(_1900, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2033);
    float _2041 = _1942 * 0.5;
    float _2043 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2035);
    float _2045 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2037);
    float _2047 = fma(_1896, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2039);
    float _2049 = _2043 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2051 = _2045 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2053 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2047);
    float _2055 = 1.0 / _2049;
    bool _2057 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2059 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2061 = _2057 || _2059;
    bool _2063 = isnan(0.5);
    bool _2065 = _2061 || _2063;
    float _2067 = _2051 + _2049;
    float _2069 = fma(_1974, -0.5, _2041);
    float _2071 = _2053 + _1942;
    out.gl_Position.x = _1972;
    out.gl_Position.y = _1974;
    out.gl_Position.z = _2053;
    out.gl_Position.w = _1942;
    float _2073 = _2071 * 0.5;
    float _2075 = _1904 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2077 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _2079 = _1904;
    if (!_2065)
    {
        _1088 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2081 = _1088;
    float _2083 = exp2(_2075);
    float _2085 = _2067 * _2055;
    float _2087 = _2085 * 0.5;
    float _2089 = _2055;
    float _2091 = _2087;
    float _2093 = _2081;
    if (!_2065)
    {
        _2077 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2095 = _2077;
    if (!_2065)
    {
        float _2097 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2099 = fma(_2087, _2081, _2097);
        _2089 = _2099;
    }
    float _2101 = _2089;
    if (_2065)
    {
        _2091 = 1.0;
    }
    float _2103 = _2091;
    float _2105 = _2103;
    if (!_2065)
    {
        float _2107 = -_2095;
        float _2109 = _2107 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2093 = _2109;
    }
    float _2111 = _2093;
    float _2113 = _2101;
    if (!_2065)
    {
        float _2115 = 1.0 / _2101;
        _2113 = _2115;
    }
    float _2117 = _2113;
    float _2119 = -_2083;
    float _2121 = _2119 + 1.0;
    float _2123 = _2111;
    if (!_2065)
    {
        float _2125 = 1.0 / _2111;
        _2123 = _2125;
    }
    float _2127 = _2123;
    float _2129 = _2121 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_2065)
    {
        float _2131 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2133 = -_2095;
        float _2135 = fma(_2117, _2131, _2133);
        _2079 = _2135;
    }
    float _2137 = _2079;
    if (!_2065)
    {
        float _2139 = _2137 * _2127;
        float _2141 = precise::clamp(_2139, 0.0, 1.0);
        _2105 = _2141;
    }
    float _2143 = _2105;
    float _2145 = _1972 + _1942;
    float _2147 = _2143 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2149 = _2143 > 0.0;
    bool _2151 = isnan(_2143);
    bool _2153 = _2149 || _2151;
    bool _2155 = isnan(0.0);
    bool _2157 = _2153 || _2155;
    float _2159 = _2145 * 0.5;
    float _2161 = _2147 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_77.x = _2159;
    out.m_77.y = _2069;
    out.m_77.z = _2073;
    out.m_77.w = _1942;
    out.m_47.x = _2161;
    float _2163 = _2129 * _2002;
    float _2165 = -_2129;
    float _2167 = _2165 + 1.0;
    float _2169 = _2013 * _2163;
    float _2171 = _2027 * _2163;
    float _2173 = fma(_2023, _2169, _2007);
    float _2175 = fma(_2025, _2169, _2009);
    float _2177 = _2013 * _2167;
    float _2179 = fma(_2013, _2171, _2011);
    out.m_79.x = _2173;
    out.m_79.y = _2175;
    out.m_79.z = _2179;
    out.m_79.w = _2177;
    if (_2157)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2181 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2181;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1576 = false;
    bool _534 = false;
    bool _296 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_44.w;
    float _95 = trunc(_93);
    int _98 = int(_95);
    bool _102 = _98 >= 1;
    float _104 = 0.0;
    if (!_102)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _106 = _104;
    float _108 = _106;
    if (!_102)
    {
        out.m_47.x = 0.0;
    }
    int _110 = 0;
    if (!_102)
    {
        float _112 = _106 * 5.0;
        _110 = as_type<int>(_112);
    }
    int _114 = _110;
    int _116 = _114;
    if (!_102)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2238 = as_type<float>(_114);
        out.gl_Position.z = _2238;
    }
    if (!_102)
    {
        return out;
    }
    float _118 = in.m_49.w;
    bool _120 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _122 = isnan(_118);
    bool _124 = _120 || _122;
    bool _126 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _128 = _124 || _126;
    float _130 = -_118;
    float _132 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _134 = _132;
    if (_128)
    {
        float _136 = float(_98);
        _108 = _136;
    }
    float _138 = _108;
    bool _140 = _132 >= _138;
    bool _142 = !_128;
    bool _144 = _140 || _142;
    float _146 = _138;
    if (_144)
    {
        _146 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _146;
    if (_144)
    {
        out.m_47.x = 0.0;
    }
    if (_144)
    {
        float _150 = _148 * 5.0;
        _116 = as_type<int>(_150);
    }
    int _152 = _116;
    if (_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2308 = as_type<float>(_152);
        out.gl_Position.z = _2308;
    }
    if (_144)
    {
        return out;
    }
    float _154 = in.m_51.w;
    float _156 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _158 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _160 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _162 = _158 || _160;
    bool _164 = isnan(1.0);
    bool _166 = _162 || _164;
    float _168 = in.m_49.x;
    float _170 = in.m_49.y;
    float _172 = in.m_49.z;
    float _174 = in.m_44.x;
    float _176 = in.m_44.y;
    float _178 = in.m_44.z;
    float _180 = 0.0;
    float _182 = _156;
    if (!_166)
    {
        float _184 = _156 * _156;
        float _186 = _184 * 0.5;
        _180 = _186;
    }
    float _188 = _180;
    float _190 = _188;
    if (!_166)
    {
        float _192 = _188 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _192;
    }
    float _194 = _190;
    bool _196 = !_166;
    float _198 = _194;
    if (!_196)
    {
        float _200 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = log2(_200);
        float _204 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _206 = _204 + 1.0;
        float _208 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = _156 * _202;
        float _212 = 1.0 / _206;
        float _214 = _208 * 0.693147182464599609375;
        float _216 = exp2(_210);
        float _218 = 1.0 / _214;
        float _220 = _216 + (-1.0);
        float _222 = -_220;
        float _224 = fma(_222, _218, _156);
        float _226 = _224 * _212;
        float _228 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _198 = _228;
    }
    float _230 = _198;
    bool _232 = !_166;
    if (!_232)
    {
        float _234 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _236 = log2(_234);
        float _238 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _240 = _238 + 1.0;
        float _242 = 1.0 / _240;
        float _244 = _156 * _236;
        float _246 = exp2(_244);
        float _248 = -_246;
        float _250 = _248 + 1.0;
        float _252 = _250 * _242;
        _182 = _252;
    }
    float _254 = _182;
    bool _256 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _258 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _260 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _262 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _264 = fma(_254, _168, _258);
    float _266 = fma(_254, _170, _260);
    float _268 = fma(_254, _172, _262);
    float _270 = fma(_264, _154, _174);
    float _272 = fma(_266, _154, _176);
    float _274 = fma(_268, _154, _178);
    bool _276 = !_256;
    float _294;
    if (!_276)
    {
        float _278 = in.m_53.x;
        float _280 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _282 = _278 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _284 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[12].x, _132);
        float _286 = _284 * _280;
        float _288 = floor(_286);
        float _290 = -_288;
        float _292 = _286 + _290;
        _294 = _292;
        _296 = true;
    }
    else
    {
        float _298 = float(_98);
        float _300 = 1.0 / _298;
        float _302 = _132 * _300;
        _294 = _302;
    }
    _296 = false;
    float _304 = _294;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _308 = _304 + _306;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _312 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _310;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _316 = _314 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _320 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _318;
    float _322 = 1.0 / _312;
    float _324 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _328 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _330 = _324 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _332 = 1.0 / _316;
    float _334 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _336 = _326 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _338 = _328 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _342 = _304 + _340;
    float _344 = 1.0 / _320;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _348 = _304 + _346;
    float _350 = _342 * _322;
    out.m_55.x = _330;
    out.m_55.y = _336;
    out.m_55.z = _338;
    out.m_55.w = _334;
    bool _352 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _354 = isnan(_304);
    bool _356 = _352 || _354;
    bool _358 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _360 = _356 || _358;
    float _362 = float(_360);
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _364;
    bool _368 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _370 = _348 * _332;
    bool _372 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _374 = isnan(_304);
    bool _376 = _372 || _374;
    bool _378 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _380 = _376 || _378;
    float _382 = float(_380);
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _384;
    float _388 = fma(_366, _350, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _390 = -_382;
    float _392 = _390 + 1.0;
    float _394 = fma(_386, _350, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _396 = _308 * _344;
    bool _398 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _400 = isnan(_304);
    bool _402 = _398 || _400;
    bool _404 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _406 = _402 || _404;
    float _408 = float(_406);
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _410;
    bool _414 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _416 = isnan(_304);
    bool _418 = _414 || _416;
    bool _420 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _422 = _418 || _420;
    float _424 = float(_422);
    float _426 = _362 * _392;
    float _428 = -_362;
    float _430 = _428 + 1.0;
    float _432 = -_408;
    float _434 = _432 + 1.0;
    float _436 = fma(_412, _350, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _440 = _438 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _442 = _408 * _430;
    float _444 = _424 * _434;
    float _446 = -_424;
    float _448 = _446 + 1.0;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _452 = _450 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _454 = _388 * _444;
    float _456 = _394 * _444;
    float _458 = _436 * _444;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _462 = _460 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _464 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[143].x, _454);
    float _466 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[143].y, _456);
    float _468 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[143].z, _458);
    float _470 = fma(_440, _370, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _472 = fma(_452, _370, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _474 = fma(_462, _370, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _476;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _480;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _484;
    float _488 = fma(_470, _442, _464);
    float _490 = fma(_478, _396, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _492 = fma(_482, _396, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _494 = fma(_486, _396, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _496 = fma(_472, _442, _466);
    float _498 = fma(_474, _442, _468);
    float _500 = fma(_490, _426, _488);
    float _502 = fma(_492, _426, _496);
    float _504 = fma(_494, _426, _498);
    float _506 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[146].x, _500);
    float _508 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[146].y, _502);
    float _510 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[146].z, _504);
    bool _512 = !_368;
    float _514 = _464;
    float _532;
    if (!_512)
    {
        float _516 = in.m_53.x;
        float _518 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _520 = _516 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _522 = fma(_520, (*spvDescriptorSet0.vp_c9)._m0[11].w, _132);
        float _524 = _522 * _518;
        float _526 = floor(_524);
        float _528 = -_526;
        float _530 = _524 + _528;
        _532 = _530;
        _534 = true;
    }
    else
    {
        float _536 = float(_98);
        float _538 = 1.0 / _536;
        float _540 = _132 * _538;
        _532 = _540;
    }
    _534 = false;
    float _542 = _532;
    float _544 = in.m_53.z;
    float _546 = _272 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _548 = in.m_53.x;
    int _550 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _552 = _550 != 0;
    float _554 = _272 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _556 = _272 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _558 = in.m_53.y;
    float _560 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _562 = log2(_560);
    float _564 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[4].x, _546);
    float _566 = in.m_53.w;
    float _568 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _570 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[4].z, _564);
    bool _572 = _542 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _574 = isnan(_542);
    bool _576 = _572 || _574;
    bool _578 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _580 = _576 || _578;
    float _582 = float(_580);
    float _584 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _586 = _544 * 2.0;
    if (!_552)
    {
        _514 = _544;
    }
    float _588 = _514;
    float _590 = _562 * _132;
    float _592 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _594 = _548 * 2.0;
    float _596 = _558 * 2.0;
    float _598 = _588;
    if (_552)
    {
        _598 = _558;
    }
    float _600 = _598;
    float _602 = _558 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _604 = floor(_586);
    float _606 = _584 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _608 = fma(_602, -2.0, _568);
    float _610 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[76].y, _608);
    float _612 = floor(_594);
    float _614 = floor(_596);
    bool _616 = _604 > 0.0;
    bool _618 = _604 >= 0.0;
    bool _620 = isnan(_604);
    bool _622 = _618 || _620;
    bool _624 = isnan(0.0);
    bool _626 = _622 || _624;
    float _628 = _626 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _630 = exp2(_590);
    bool _632 = _612 >= 0.0;
    bool _634 = isnan(_612);
    bool _636 = _632 || _634;
    bool _638 = isnan(0.0);
    bool _640 = _636 || _638;
    bool _642 = _612 > 0.0;
    float _644 = _640 ? 0.0 : 1.4012984643248170709237295832899e-45;
    int _646 = ~as_type<int>(_628);
    int _648 = _646 + 1;
    int _650 = _648 + 1;
    bool _652 = _614 >= 0.0;
    bool _654 = isnan(_614);
    bool _656 = _652 || _654;
    bool _658 = isnan(0.0);
    bool _660 = _656 || _658;
    bool _662 = _614 > 0.0;
    int _664 = _660 ? 0 : 1;
    int _666 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _668 = _666 != 0;
    int _670 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _672 = _670 != 0;
    int _674 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _676 = _674 != 0;
    float _678 = -_630;
    float _680 = _678 + 1.0;
    float _682 = in.m_51.x;
    float _684 = in.m_51.y;
    float _686 = in.m_51.z;
    int _688 = ~_664;
    int _690 = _688 + 1;
    int _692 = _690 + 1;
    int _694 = ~as_type<int>(_644);
    int _696 = _694 + 1;
    int _698 = _696 + 1;
    int _700 = _650;
    int _702 = _692;
    int _704 = _698;
    float _706 = _644;
    float _708 = _628;
    if (!_616)
    {
        int _710 = ~as_type<int>(_628);
        int _712 = _710 + 1;
        _700 = _712;
    }
    int _714 = _700;
    if (!_662)
    {
        int _716 = ~_664;
        int _718 = _716 + 1;
        _702 = _718;
    }
    int _720 = _702;
    if (!_642)
    {
        int _722 = ~as_type<int>(_644);
        int _724 = _722 + 1;
        _704 = _724;
    }
    int _726 = _704;
    if (!_552)
    {
        _706 = _558;
    }
    float _728 = _706;
    float _730 = _728;
    if (!_552)
    {
        _708 = _544;
    }
    float _732 = _708;
    float _734 = _732;
    if (_552)
    {
        _730 = _548;
    }
    float _736 = _730;
    if (_552)
    {
        _734 = _558;
    }
    float _738 = _734;
    int _740 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _742 = _740 != 0;
    int _744 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _746 = _744 != 0;
    float _748 = _508 * _684;
    float _750 = _510 * _686;
    int _752 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _754 = _752 != 0;
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _758 = _756 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _760 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _762 = _760 != 0;
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _766 = _764 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _768 = !_668;
    int _770 = _768 ? 0 : 1;
    float _772 = _506 * _682;
    bool _774 = _566 > 0.5;
    float _776 = 1.0 / _766;
    float _778 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[5].x, _554);
    float _780 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[6].x, _556);
    float _782 = _548 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _786 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _784;
    float _788 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[5].z, _778);
    float _790 = 1.0 / _758;
    float _792 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[6].z, _780);
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _796 = _794 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _798 = _548 + _544;
    float _800 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _802 = _548 + _558;
    float _804 = _798 + (-1.0);
    float _806 = _796 * _776;
    float _808 = _558 + _544;
    float _810 = -_800;
    float _812 = fma(_782, 2.0, _810);
    float _814 = _808 + (-1.0);
    float _816 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _818 = _802 + (-1.0);
    float _820 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _822 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _824 = abs(_770);
    float _826 = fma(_818, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _828 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _830 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _832 = _736 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _834 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[83].w, _822);
    float _836 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _838 = _600 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _840 = -_828;
    float _842 = fma(_832, 2.0, _840);
    float _844 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[83].z, _830);
    float _846 = fma(_838, -2.0, _836);
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _850 = 1.0 + _848;
    float _852 = in.m_57.x;
    float _854 = in.m_57.y;
    float _856 = in.m_57.z;
    float _858 = float(_824);
    float _860 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _862 = float(_714);
    float _864 = 1.0 / _850;
    float _866 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[78].z, _860);
    bool _868 = !_676;
    int _870 = _868 ? 0 : 1;
    float _872 = _858 * _862;
    bool _874 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _876 = isnan(1.0);
    bool _878 = _874 || _876;
    bool _880 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _882 = _878 || _880;
    float _884 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _886 = !_672;
    int _888 = _886 ? 0 : 1;
    float _890 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].z, _866);
    bool _892 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _894 = isnan(0.0);
    bool _896 = _892 || _894;
    bool _898 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _900 = _896 || _898;
    float _902 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[78].w, _884);
    int _904 = abs(_888);
    float _906 = -_132;
    float _908 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[76].x, _812);
    float _910 = _900 ? _680 : 0.0;
    float _912 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].w, _902);
    float _914 = float(_904);
    float _916 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].z, _844);
    int _918 = abs(_870);
    float _920 = -_132;
    float _922 = fma(_920, (*spvDescriptorSet0.vp_c9)._m0[81].x, _842);
    float _924 = float(_726);
    float _926 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].w, _834);
    float _928 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[81].y, _846);
    bool _930 = _900;
    bool _932 = _774;
    if (_882)
    {
        float _934 = _910 * _864;
        _134 = _934;
    }
    float _936 = _134;
    float _938 = _872 * (-2.0);
    float _940 = _914 * _924;
    float _942 = _786 * _790;
    if (_742)
    {
        bool _944 = _548 > 0.5;
        _930 = _944;
    }
    bool _946 = _930;
    float _948 = _548 + (-0.5);
    float _950 = fma(_938, _852, _852);
    float _952 = float(_918);
    float _954 = fma(_826, _938, _826);
    float _956 = float(_720);
    float _958 = fma(_948, (*spvDescriptorSet0.vp_c9)._m0[196].x, _950);
    float _960 = in.m_59.y;
    float _962 = _940 * (-2.0);
    float _964 = _952 * _956;
    float _966 = fma(_954, _936, _958);
    bool _968 = _558 > 0.5;
    float _970 = in.m_61.x;
    float _972 = in.m_61.y;
    float _974 = in.m_61.z;
    float _976 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _978 = _976 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _980 = _964 * (-2.0);
    float _982 = fma(_962, _854, _854);
    float _984 = _558 + (-0.5);
    float _986 = 1.0 / _978;
    float _988 = fma(_980, _856, _856);
    float _990 = fma(_816, _980, _816);
    float _992 = fma(_984, (*spvDescriptorSet0.vp_c9)._m0[196].y, _982);
    float _994 = fma(_820, _962, _820);
    float _996 = _544 + (-0.5);
    float _998 = _772 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1000 = fma(_994, _936, _992);
    float _1002 = fma(_996, (*spvDescriptorSet0.vp_c9)._m0[196].z, _988);
    float _1004 = _966 * 0.15915493667125701904296875;
    float _1006 = _1000 * 0.15915493667125701904296875;
    float _1008 = -_960;
    float _1010 = _1008 + 1.0;
    float _1012 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1014 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1012;
    float _1016 = _748 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1018 = in.m_59.x;
    float _1020 = _1004 * 6.283185482025146484375;
    float _1022 = cos(_1020);
    int _1024 = _774 ? as_type<int>(_1010) : as_type<int>(_960);
    float _1026 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _970);
    float _1028 = _1014 * _986;
    float _1030 = _960;
    float _1032 = _1028;
    if (_746)
    {
        bool _1034 = _544 > 0.5;
        _932 = _1034;
    }
    bool _1036 = _932;
    float _1038 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _972);
    float _1040 = _998 * _1026;
    float _1042 = fma(_990, _936, _1002);
    float _1044 = _1004 * 6.283185482025146484375;
    float _1046 = sin(_1044);
    float _1048 = in.m_63.x;
    float _1050 = in.m_63.y;
    float _1052 = in.m_63.z;
    float _1054 = _1016 * _1038;
    float _1056 = _1042 * 0.15915493667125701904296875;
    float _1058 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _974);
    float _1060 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1062 = _542 + _1060;
    float _1064 = _792 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1066 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1068 = _754 ? as_type<float>(_1024) : _960;
    float _1070 = _750 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _1072 = _972 != 0.0;
    bool _1074 = isnan(_972);
    bool _1076 = _1072 || _1074;
    bool _1078 = isnan(0.0);
    bool _1080 = _1076 || _1078;
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1084 = _542 + _1082;
    float _1086 = _1042;
    float _1088 = _1064;
    if (_762)
    {
        float _1090 = _968 ? _1010 : _960;
        _1030 = _1090;
    }
    float _1092 = _1030;
    float _1094 = _1070 * _1058;
    bool _1096 = _970 == 0.0;
    bool _1098 = !_1080;
    bool _1100 = _1096 && _1098;
    float _1102 = _1006 * 6.283185482025146484375;
    float _1104 = sin(_1102);
    float _1106 = fma(_806, _1084, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1108 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1110 = _542 + _1108;
    bool _1112 = _974 == 0.0;
    bool _1114 = _1112 && _1100;
    float _1116 = fma(_942, _1062, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    if (!_742)
    {
        _1086 = _1018;
    }
    float _1118 = _1086;
    float _1120 = fma(_1028, _1110, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1122 = _1006 * 6.283185482025146484375;
    float _1124 = cos(_1122);
    float _1126 = _1066 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1128 = _1118;
    if (!_742)
    {
        _1032 = _1118;
    }
    float _1130 = _1032;
    float _1132 = _1130;
    if (_742)
    {
        _1128 = _1018;
    }
    float _1134 = _1128;
    float _1136 = fma(_1068, _1126, -0.5);
    float _1138 = _1056 * 6.283185482025146484375;
    float _1140 = cos(_1138);
    float _1142 = _1048;
    float _1144 = _1052;
    float _1146 = _1050;
    float _1148 = _1134;
    if (!_1114)
    {
        float _1150 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1048);
        _1142 = _1150;
    }
    float _1152 = _1142;
    if (!_1114)
    {
        float _1154 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1052);
        _1144 = _1154;
    }
    float _1156 = _1144;
    float _1158 = _1046 * _1104;
    if (!_1114)
    {
        float _1160 = fma(_972, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1050);
        _1146 = _1160;
    }
    float _1162 = _1146;
    int _1164 = 0;
    if (_742)
    {
        float _1166 = -_1134;
        float _1168 = _1166 + 1.0;
        _1164 = as_type<int>(_1168);
    }
    int _1170 = _1164;
    int _1172 = 0;
    if (_746)
    {
        float _1174 = -_1134;
        float _1176 = _1174 + 1.0;
        _1172 = as_type<int>(_1176);
    }
    int _1178 = _1172;
    float _1180 = -_928;
    float _1182 = fma(_926, _1136, _1180);
    float _1184 = _1056 * 6.283185482025146484375;
    float _1186 = sin(_1184);
    float _1188 = _1046 * _1124;
    float _1190 = _1022 * _1124;
    if (_742)
    {
        float _1192 = _946 ? as_type<float>(_1170) : _1134;
        _1132 = _1192;
    }
    float _1194 = _1132;
    float _1196 = _1194;
    if (_746)
    {
        float _1198 = _1036 ? as_type<float>(_1178) : _1134;
        _1148 = _1198;
    }
    float _1200 = _1148;
    float _1202 = _1046 * _1140;
    float _1204 = _1022 * _1140;
    float _1206 = _1124 * _1140;
    float _1208 = _1022 * _1104;
    float _1210 = _1202 * _1054;
    float _1212 = _1204 * _1054;
    float _1214 = _1104 * _1140;
    float _1216 = _1204 * _1162;
    float _1218 = fma(_1186, _1190, _1158);
    float _1220 = fma(_1186, _1158, _1190);
    float _1222 = -_1054;
    float _1224 = _1186 * _1222;
    float _1226 = -_1208;
    float _1228 = fma(_1186, _1188, _1226);
    float _1230 = -_1188;
    float _1232 = fma(_1186, _1208, _1230);
    float _1234 = fma(_1218, _1040, _1212);
    float _1236 = fma(_1206, _1040, _1224);
    float _1238 = fma(_1228, _1040, _1210);
    bool _1240 = _542 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1242 = isnan(_542);
    bool _1244 = _1240 || _1242;
    bool _1246 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1248 = _1244 || _1246;
    float _1250 = float(_1248);
    float _1252 = fma(_1232, _1094, _1234);
    float _1254 = fma(_1214, _1094, _1236);
    bool _1256 = _542 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1258 = isnan(_542);
    bool _1260 = _1256 || _1258;
    bool _1262 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1264 = _1260 || _1262;
    float _1266 = float(_1264);
    float _1268 = fma(_1220, _1094, _1238);
    float _1270 = _1252 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1272 = _1252 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    bool _1274 = _542 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1276 = isnan(_542);
    bool _1278 = _1274 || _1276;
    bool _1280 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1282 = _1278 || _1280;
    float _1284 = float(_1282);
    float _1286 = -_1250;
    float _1288 = _1286 + 1.0;
    float _1290 = fma(_1254, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1270);
    float _1292 = fma(_1254, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1272);
    float _1294 = _570 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1296 = _1284 * _1288;
    float _1298 = -_1284;
    float _1300 = _1298 + 1.0;
    float _1302 = fma(_1268, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1290);
    float _1304 = fma(_1268, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1292);
    float _1306 = -_1266;
    float _1308 = _1306 + 1.0;
    float _1310 = _1266 * _1300;
    float _1312 = _1294 + _1302;
    float _1314 = _1064 + _1304;
    float _1316 = _582 * _1308;
    float _1318 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1320 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1322 = _1312 + _1320;
    float _1324 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1326 = _1314 + _1324;
    float _1328 = _1116 * _1316;
    float _1330 = fma(_606, _1092, -0.5);
    float _1332 = _1322 * _1322;
    float _1334 = _1326 * _1326;
    float _1336 = -_582;
    float _1338 = _1336 + 1.0;
    float _1340 = -_610;
    float _1342 = fma(_912, _1330, _1340);
    float _1344 = -_1162;
    float _1346 = _1186 * _1344;
    float _1348 = _1332 + _1334;
    float _1350 = fma(_1338, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1328);
    float _1352 = _1202 * _1162;
    float _1354 = fma(_1206, _1152, _1346);
    float _1356 = sqrt(_1348);
    float _1358 = _788 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1360 = _1318 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1362 = _592 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1364 = fma(_1106, _1310, _1350);
    float _1366 = fma(_1218, _1152, _1216);
    float _1368 = fma(_1360, _1194, -0.5);
    float _1370 = fma(_1362, _1200, -0.5);
    float _1372 = fma(_1228, _1152, _1352);
    float _1374 = fma(_1120, _1296, _1364);
    float _1376 = fma(_890, _1368, _908);
    float _1378 = _1252 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1380 = fma(_1214, _1156, _1354);
    float _1382 = fma(_1232, _1156, _1366);
    float _1384 = fma(_916, _1370, _922);
    float _1386 = fma(_1254, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1378);
    bool _1388 = _1356 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1390 = fma(_1220, _1156, _1372);
    float _1392 = fma(_1250, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1374);
    float _1394 = fma(_1268, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1386);
    float _1396 = _1358 + _1394;
    float _1398 = _1372;
    float _1400 = _1332;
    float _1402 = _1334;
    float _1404 = _1312;
    float _1406 = _1314;
    float _1408 = _1376;
    if (!_1388)
    {
        _1398 = _1396;
    }
    float _1410 = _1398;
    bool _1412 = !_1388;
    float _1414 = _1410;
    if (!_1412)
    {
        float _1416 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1418 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1420 = _1356 + _1418;
        float _1422 = rsqrt(_1348);
        float _1424 = _1420 * _1416;
        float _1426 = _1396 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1428 = _1424 * 0.15915493667125701904296875;
        float _1430 = _1428 * 6.283185482025146484375;
        float _1432 = sin(_1430);
        float _1434 = _1428 * 6.283185482025146484375;
        float _1436 = cos(_1434);
        float _1438 = fma(_1432, _1426, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1440 = _1422 * _1438;
        float _1442 = _1436 + (-1.0);
        float _1444 = fma(_1322, _1440, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1446 = fma(_1326, _1440, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1448 = _1442 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1450 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1452 = _1444 + _1450;
        float _1454 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1456 = _1446 + _1454;
        float _1458 = fma(_1396, _1436, _1448);
        float _1460 = _1452 * _1452;
        float _1462 = _1456 * _1456;
        _1414 = _1458;
        _1400 = _1460;
        _1402 = _1462;
        _1404 = _1444;
        _1406 = _1446;
    }
    float _1464 = _1414;
    float _1466 = _1400;
    float _1468 = _1402;
    float _1470 = _1404;
    float _1472 = _1406;
    float _1474 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1476 = _1464 + _1474;
    float _1478 = in.m_65.w;
    float _1480 = _1382 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1482 = fma(_1476, _1476, _1466);
    float _1484 = _1382 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1486 = _1382 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1488 = _1482 + _1468;
    float _1490 = fma(_1380, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1480);
    float _1492 = fma(_1380, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1484);
    float _1494 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1496 = fma(_1380, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1486);
    float _1498 = sqrt(_1488);
    float _1500 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1502 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1504 = _1342 + 0.5;
    float _1506 = fma(_1390, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1490);
    float _1508 = _1182 + 0.5;
    float _1510 = fma(_1390, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1492);
    float _1512 = _1500 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1514 = _1494 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1516 = _1502 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1518 = _1376 + 0.5;
    float _1520 = _1384 + 0.5;
    float _1522 = _1392 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1524 = fma(_1390, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1496);
    out.m_67.w = _1478;
    bool _1526 = _1498 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1528 = isnan(_1498);
    bool _1530 = _1526 || _1528;
    bool _1532 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1534 = _1530 || _1532;
    out.m_69.x = _1518;
    out.m_69.y = _1504;
    out.m_69.z = _1520;
    out.m_69.w = _1508;
    out.m_71.x = _1512;
    out.m_71.y = _1514;
    out.m_71.z = _1516;
    out.m_71.w = _1522;
    out.m_73.x = _1506;
    out.m_73.y = _1510;
    out.m_73.z = _1524;
    float _1536 = _1464;
    float _1538 = _1518;
    float _1540 = _1508;
    if (!_1534)
    {
        _1408 = 1.0;
    }
    float _1542 = _1408;
    bool _1544 = !_1534;
    float _1546 = _1542;
    if (!_1544)
    {
        bool _1548 = _1498 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1550 = isnan(_1498);
        bool _1552 = _1548 || _1550;
        bool _1554 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1556 = _1552 || _1554;
        if (!_1556)
        {
            float _1558 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1560 = _1498 + _1558;
            float _1562 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1564 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1562;
            float _1566 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1568 = _1566 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1570 = 1.0 / _1564;
            float _1572 = _1560 * _1570;
            float _1574 = fma(_1572, _1568, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1546 = _1574;
            _1576 = true;
        }
        else
        {
            bool _1578 = _1498 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1580 = isnan(_1498);
            bool _1582 = _1578 || _1580;
            bool _1584 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1586 = _1582 || _1584;
            if (!_1586)
            {
                float _1588 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1590 = _1498 + _1588;
                float _1592 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1594 = _1592 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1596 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1598 = _1596 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1600 = 1.0 / _1594;
                float _1602 = _1590 * _1600;
                float _1604 = fma(_1602, _1598, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1546 = _1604;
                _1576 = true;
            }
            else
            {
                _1546 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1576 = false;
    float _1606 = _1546;
    float _1608 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1610 = _1470 + _1608;
    float _1612 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1614 = _1464 + _1612;
    float _1616 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1618 = _1472 + _1616;
    bool _1620 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1622 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1624 = _1620 || _1622;
    bool _1626 = isnan(0.5);
    bool _1628 = _1624 || _1626;
    float _1630 = fma(_1610, _1606, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1632 = fma(_1614, _1606, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1634 = fma(_1618, _1606, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1636 = _1618;
    float _1638 = _1630;
    if (_1628)
    {
        _1636 = _1632;
    }
    float _1640 = _1636;
    float _1642 = _1640;
    if (_1628)
    {
        _1536 = _1634;
    }
    float _1644 = _1536;
    float _1646 = _1644;
    if (!_1628)
    {
        float _1648 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1650 = _1358 + _1648;
        float _1652 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1654 = _1294 + _1652;
        float _1656 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1658 = -_1294;
        float _1660 = _1658 + _1630;
        float _1662 = _1650 * _1650;
        float _1664 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1666 = _1064 + _1664;
        float _1668 = fma(_1654, _1654, _1662);
        float _1670 = fma(_1666, _1666, _1668);
        float _1672 = -_1064;
        float _1674 = _1672 + _1634;
        float _1676 = sqrt(_1670);
        float _1678 = precise::min(_1676, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1680 = _1678 * _1656;
        float _1682 = -_1358;
        float _1684 = _1682 + _1632;
        float _1686 = fma(_1660, _1680, _1294);
        float _1688 = fma(_1684, _1680, _1358);
        float _1690 = fma(_1674, _1680, _1064);
        _1642 = _1688;
        _1638 = _1686;
        _1646 = _1690;
    }
    float _1692 = _1642;
    float _1694 = _1638;
    float _1696 = _1646;
    float _1698 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1700 = _1692 + _1698;
    float _1702 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1704 = _1694 + _1702;
    float _1706 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1708 = _1696 + _1706;
    float _1710 = _1700 * _1700;
    float _1712 = fma(_1704, _1704, _1710);
    float _1714 = fma(_1708, _1708, _1712);
    float _1716 = rsqrt(_1714);
    float _1718 = sqrt(_1714);
    float _1720 = _1716 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1722 = _1704 * _1720;
    float _1724 = _1708 * _1720;
    float _1726 = _1722 * _1722;
    float _1728 = _1724 * _1724;
    float _1730 = _1726 + _1728;
    float _1732 = sqrt(_1730);
    bool _1734 = _1732 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1736 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1738 = _1732 + _1736;
    float _1740 = _1712;
    float _1742 = _1738;
    float _1744 = _1720;
    float _1746 = _1722;
    if (_1734)
    {
        float _1748 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1740 = _1748;
    }
    float _1750 = _1740;
    if (_1734)
    {
        float _1752 = rsqrt(_1730);
        _1538 = _1752;
    }
    float _1754 = _1538;
    float _1756 = _1754;
    if (_1734)
    {
        float _1758 = _1738 * _1750;
        _1742 = _1758;
    }
    float _1760 = _1742;
    if (_1734)
    {
        float _1762 = _1760 * 0.15915493667125701904296875;
        _1540 = _1762;
    }
    float _1764 = _1540;
    float _1766 = _1750;
    float _1768 = _1764;
    if (_1734)
    {
        float _1770 = _1764 * 6.283185482025146484375;
        float _1772 = sin(_1770);
        _1766 = _1772;
    }
    float _1774 = _1766;
    float _1776 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1778 = precise::max(0.0, _1776);
    float _1780 = _1520;
    float _1782 = _1778;
    if (_1734)
    {
        float _1784 = _1764 * 6.283185482025146484375;
        float _1786 = cos(_1784);
        _1780 = _1786;
    }
    float _1788 = _1780;
    float _1790 = -_1720;
    float _1792 = -_1778;
    float _1794 = fma(_1700, _1790, _1792);
    if (_1734)
    {
        float _1796 = _1794 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1782 = _1796;
    }
    float _1798 = _1782;
    float _1800 = _1798;
    if (!_1734)
    {
        _1768 = _1726;
    }
    float _1802 = _1768;
    float _1804 = _1774;
    float _1806 = _1802;
    if (_1734)
    {
        float _1808 = fma(_1774, _1798, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1804 = _1808;
    }
    float _1810 = _1804;
    float _1812 = _1810;
    if (_1734)
    {
        float _1814 = _1788 + (-1.0);
        _1800 = _1814;
    }
    float _1816 = _1800;
    float _1818 = _1816;
    if (_1734)
    {
        float _1820 = _1754 * _1810;
        _1196 = _1820;
    }
    float _1822 = _1196;
    if (!_1734)
    {
        _1756 = _1794;
    }
    float _1824 = _1756;
    float _1826 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1828 = fma(_1718, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1826);
    float _1830 = precise::clamp(_1828, 0.0, 1.0);
    float _1832 = _1824;
    if (_1734)
    {
        float _1834 = _1816 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1744 = _1834;
    }
    float _1836 = _1744;
    if (_1734)
    {
        float _1838 = _1722 * _1822;
        _1746 = _1838;
    }
    float _1840 = _1746;
    if (!_1734)
    {
        _1812 = _1724;
    }
    float _1842 = _1812;
    float _1844 = _1842;
    if (_1734)
    {
        float _1846 = _1724 * _1822;
        _1844 = _1846;
    }
    float _1848 = _1844;
    if (_1734)
    {
        float _1850 = fma(_1794, _1788, _1836);
        _1832 = _1850;
    }
    float _1852 = _1832;
    if (_1734)
    {
        float _1854 = _1840 * _1840;
        _1806 = _1854;
    }
    float _1856 = _1806;
    if (!_1734)
    {
        _1818 = _1728;
    }
    float _1858 = _1818;
    float _1860 = _1858;
    if (_1734)
    {
        float _1862 = _1848 * _1848;
        _1860 = _1862;
    }
    float _1864 = _1860;
    float _1866 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1868 = fma(_1852, _1852, _1856);
    float _1870 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1872 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1874 = -_1830;
    float _1876 = _1874 + 1.0;
    float _1878 = _1868 + _1864;
    float _1880 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1870);
    float _1882 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1884 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1872);
    float _1886 = rsqrt(_1878);
    float _1888 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1880);
    float _1890 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1882);
    float _1892 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1884);
    float _1894 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1896 = _1888 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1898 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1890);
    float _1900 = _1892 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1902 = abs(_1876);
    float _1904 = log2(_1902);
    float _1906 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1894);
    float _1908 = _1898 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1910 = _1896 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1912 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1906);
    float _1914 = _1908 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1916 = -_1910;
    float _1918 = fma(_1916, _1866, 1.0);
    float _1920 = _1886 * _1840;
    float _1922 = _1886 * _1852;
    float _1924 = fma(_1900, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1914);
    float _1926 = _1886 * _1848;
    float _1928 = _1920 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1930 = _1912 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1932 = fma(_1896, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1924);
    float _1934 = log2(_1918);
    float _1936 = -_1928;
    float _1938 = fma(_1922, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1936);
    float _1940 = _1904 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1942 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1932);
    float _1944 = _1908 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1946 = -_1926;
    float _1948 = fma(_1946, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1938);
    float _1950 = _1908 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1952 = exp2(_1940);
    float _1954 = fma(_1948, -0.5, 0.5);
    float _1956 = fma(_1900, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1944);
    float _1958 = fma(_1900, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1950);
    float _1960 = fma(_1948, 0.5, 0.5);
    float _1962 = fma(_1896, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1956);
    float _1964 = fma(_1896, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1958);
    float _1966 = 1.0 / _1942;
    float _1968 = _1922 + 1.0;
    float _1970 = fma(_1960, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1972 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1962);
    float _1974 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1964);
    float _1976 = _1934 * 0.693147182464599609375;
    float _1978 = fma(_1960, _1970, -0.212114393711090087890625);
    float _1980 = sqrt(_1954);
    float _1982 = -_1922;
    float _1984 = fma(_1952, _1968, _1982);
    float _1986 = fma(_1960, _1978, 1.570728778839111328125);
    float _1988 = _1976 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1990 = fma(_1984, 0.5, 0.5);
    float _1992 = _1972 * _1966;
    float _1994 = _1974 * _1966;
    float _1996 = fma(_1992, 0.5, 0.5);
    float _1998 = fma(_1994, -0.5, 0.5);
    float _2000 = _1980 * 0.636619746685028076171875;
    float3 _5305 = float3(_1996, _1998, _1988);
    float _2002 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5305, float3(0.0), isnan(_5305)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5305, float3(0.0), isnan(_5305)), level(0.0)).x;
    float3 _5316 = float3(_1996, _1998, _1988);
    float4 _2005 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5316, float3(0.0), isnan(_5316)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5316, float3(0.0), isnan(_5316)), level(0.0)).xyzw;
    float _2007 = _2005.x;
    float _2009 = _2005.y;
    float _2011 = _2005.z;
    float _2013 = _2005.w;
    float _2015 = -_1986;
    float _2017 = fma(_2000, _2015, 1.0);
    float2 _5338 = float2(_2017, _1990);
    float3 _2021 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5338, float2(0.0), isnan(_5338)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5338, float2(0.0), isnan(_5338)), level(0.0)).xyz;
    float _2023 = _2021.x;
    float _2025 = _2021.y;
    float _2027 = _2021.z;
    float _2029 = _1358 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2031 = _1358 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2033 = _1908 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_75.x = _1704;
    out.m_75.y = _1700;
    out.m_75.z = _1708;
    float _2035 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2029);
    float _2037 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2031);
    float _2039 = fma(_1900, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2033);
    float _2041 = _1942 * 0.5;
    float _2043 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2035);
    float _2045 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2037);
    float _2047 = fma(_1896, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2039);
    float _2049 = _2043 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2051 = _2045 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2053 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2047);
    float _2055 = 1.0 / _2049;
    bool _2057 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2059 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2061 = _2057 || _2059;
    bool _2063 = isnan(0.5);
    bool _2065 = _2061 || _2063;
    float _2067 = _2051 + _2049;
    float _2069 = fma(_1974, -0.5, _2041);
    float _2071 = _2053 + _1942;
    out.gl_Position.x = _1972;
    out.gl_Position.y = _1974;
    out.gl_Position.z = _2053;
    out.gl_Position.w = _1942;
    float _2073 = _2071 * 0.5;
    float _2075 = _1904 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2077 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _2079 = _1904;
    if (!_2065)
    {
        _1088 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2081 = _1088;
    float _2083 = exp2(_2075);
    float _2085 = _2067 * _2055;
    float _2087 = _2085 * 0.5;
    float _2089 = _2055;
    float _2091 = _2087;
    float _2093 = _2081;
    if (!_2065)
    {
        _2077 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2095 = _2077;
    if (!_2065)
    {
        float _2097 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2099 = fma(_2087, _2081, _2097);
        _2089 = _2099;
    }
    float _2101 = _2089;
    if (_2065)
    {
        _2091 = 1.0;
    }
    float _2103 = _2091;
    float _2105 = _2103;
    if (!_2065)
    {
        float _2107 = -_2095;
        float _2109 = _2107 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2093 = _2109;
    }
    float _2111 = _2093;
    float _2113 = _2101;
    if (!_2065)
    {
        float _2115 = 1.0 / _2101;
        _2113 = _2115;
    }
    float _2117 = _2113;
    float _2119 = -_2083;
    float _2121 = _2119 + 1.0;
    float _2123 = _2111;
    if (!_2065)
    {
        float _2125 = 1.0 / _2111;
        _2123 = _2125;
    }
    float _2127 = _2123;
    float _2129 = _2121 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_2065)
    {
        float _2131 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2133 = -_2095;
        float _2135 = fma(_2117, _2131, _2133);
        _2079 = _2135;
    }
    float _2137 = _2079;
    if (!_2065)
    {
        float _2139 = _2137 * _2127;
        float _2141 = precise::clamp(_2139, 0.0, 1.0);
        _2105 = _2141;
    }
    float _2143 = _2105;
    float _2145 = _1972 + _1942;
    float _2147 = _2143 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2149 = _2143 > 0.0;
    bool _2151 = isnan(_2143);
    bool _2153 = _2149 || _2151;
    bool _2155 = isnan(0.0);
    bool _2157 = _2153 || _2155;
    float _2159 = _2145 * 0.5;
    float _2161 = _2147 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_77.x = _2159;
    out.m_77.y = _2069;
    out.m_77.z = _2073;
    out.m_77.w = _1942;
    out.m_47.x = _2161;
    float _2163 = _2129 * _2002;
    float _2165 = -_2129;
    float _2167 = _2165 + 1.0;
    float _2169 = _2013 * _2163;
    float _2171 = _2027 * _2163;
    float _2173 = fma(_2023, _2169, _2007);
    float _2175 = fma(_2025, _2169, _2009);
    float _2177 = _2013 * _2167;
    float _2179 = fma(_2013, _2171, _2011);
    out.m_79.x = _2173;
    out.m_79.y = _2175;
    out.m_79.z = _2179;
    out.m_79.w = _2177;
    if (_2157)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2181 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2181;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1576 = false;
    bool _534 = false;
    bool _296 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_44.w;
    float _95 = trunc(_93);
    int _98 = int(_95);
    bool _102 = _98 >= 1;
    float _104 = 0.0;
    if (!_102)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _106 = _104;
    float _108 = _106;
    if (!_102)
    {
        out.m_47.x = 0.0;
    }
    int _110 = 0;
    if (!_102)
    {
        float _112 = _106 * 5.0;
        _110 = as_type<int>(_112);
    }
    int _114 = _110;
    int _116 = _114;
    if (!_102)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2238 = as_type<float>(_114);
        out.gl_Position.z = _2238;
    }
    if (!_102)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _118 = in.m_49.w;
    bool _120 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _122 = isnan(_118);
    bool _124 = _120 || _122;
    bool _126 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _128 = _124 || _126;
    float _130 = -_118;
    float _132 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _134 = _132;
    if (_128)
    {
        float _136 = float(_98);
        _108 = _136;
    }
    float _138 = _108;
    bool _140 = _132 >= _138;
    bool _142 = !_128;
    bool _144 = _140 || _142;
    float _146 = _138;
    if (_144)
    {
        _146 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _146;
    if (_144)
    {
        out.m_47.x = 0.0;
    }
    if (_144)
    {
        float _150 = _148 * 5.0;
        _116 = as_type<int>(_150);
    }
    int _152 = _116;
    if (_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2308 = as_type<float>(_152);
        out.gl_Position.z = _2308;
    }
    if (_144)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _154 = in.m_51.w;
    float _156 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _158 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _160 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _162 = _158 || _160;
    bool _164 = isnan(1.0);
    bool _166 = _162 || _164;
    float _168 = in.m_49.x;
    float _170 = in.m_49.y;
    float _172 = in.m_49.z;
    float _174 = in.m_44.x;
    float _176 = in.m_44.y;
    float _178 = in.m_44.z;
    float _180 = 0.0;
    float _182 = _156;
    if (!_166)
    {
        float _184 = _156 * _156;
        float _186 = _184 * 0.5;
        _180 = _186;
    }
    float _188 = _180;
    float _190 = _188;
    if (!_166)
    {
        float _192 = _188 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _192;
    }
    float _194 = _190;
    bool _196 = !_166;
    float _198 = _194;
    if (!_196)
    {
        float _200 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = log2(_200);
        float _204 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _206 = _204 + 1.0;
        float _208 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = _156 * _202;
        float _212 = 1.0 / _206;
        float _214 = _208 * 0.693147182464599609375;
        float _216 = exp2(_210);
        float _218 = 1.0 / _214;
        float _220 = _216 + (-1.0);
        float _222 = -_220;
        float _224 = fma(_222, _218, _156);
        float _226 = _224 * _212;
        float _228 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _198 = _228;
    }
    float _230 = _198;
    bool _232 = !_166;
    if (!_232)
    {
        float _234 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _236 = log2(_234);
        float _238 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _240 = _238 + 1.0;
        float _242 = 1.0 / _240;
        float _244 = _156 * _236;
        float _246 = exp2(_244);
        float _248 = -_246;
        float _250 = _248 + 1.0;
        float _252 = _250 * _242;
        _182 = _252;
    }
    float _254 = _182;
    bool _256 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _258 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _260 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _262 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _264 = fma(_254, _168, _258);
    float _266 = fma(_254, _170, _260);
    float _268 = fma(_254, _172, _262);
    float _270 = fma(_264, _154, _174);
    float _272 = fma(_266, _154, _176);
    float _274 = fma(_268, _154, _178);
    bool _276 = !_256;
    float _294;
    if (!_276)
    {
        float _278 = in.m_53.x;
        float _280 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _282 = _278 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _284 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[12].x, _132);
        float _286 = _284 * _280;
        float _288 = floor(_286);
        float _290 = -_288;
        float _292 = _286 + _290;
        _294 = _292;
        _296 = true;
    }
    else
    {
        float _298 = float(_98);
        float _300 = 1.0 / _298;
        float _302 = _132 * _300;
        _294 = _302;
    }
    _296 = false;
    float _304 = _294;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _308 = _304 + _306;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _312 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _310;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _316 = _314 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _320 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _318;
    float _322 = 1.0 / _312;
    float _324 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _328 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _330 = _324 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _332 = 1.0 / _316;
    float _334 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _336 = _326 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _338 = _328 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _342 = _304 + _340;
    float _344 = 1.0 / _320;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _348 = _304 + _346;
    float _350 = _342 * _322;
    out.m_55.x = _330;
    out.m_55.y = _336;
    out.m_55.z = _338;
    out.m_55.w = _334;
    bool _352 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _354 = isnan(_304);
    bool _356 = _352 || _354;
    bool _358 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _360 = _356 || _358;
    float _362 = float(_360);
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _364;
    bool _368 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _370 = _348 * _332;
    bool _372 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _374 = isnan(_304);
    bool _376 = _372 || _374;
    bool _378 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _380 = _376 || _378;
    float _382 = float(_380);
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _384;
    float _388 = fma(_366, _350, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _390 = -_382;
    float _392 = _390 + 1.0;
    float _394 = fma(_386, _350, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _396 = _308 * _344;
    bool _398 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _400 = isnan(_304);
    bool _402 = _398 || _400;
    bool _404 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _406 = _402 || _404;
    float _408 = float(_406);
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _410;
    bool _414 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _416 = isnan(_304);
    bool _418 = _414 || _416;
    bool _420 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _422 = _418 || _420;
    float _424 = float(_422);
    float _426 = _362 * _392;
    float _428 = -_362;
    float _430 = _428 + 1.0;
    float _432 = -_408;
    float _434 = _432 + 1.0;
    float _436 = fma(_412, _350, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _440 = _438 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _442 = _408 * _430;
    float _444 = _424 * _434;
    float _446 = -_424;
    float _448 = _446 + 1.0;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _452 = _450 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _454 = _388 * _444;
    float _456 = _394 * _444;
    float _458 = _436 * _444;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _462 = _460 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _464 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[143].x, _454);
    float _466 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[143].y, _456);
    float _468 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[143].z, _458);
    float _470 = fma(_440, _370, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _472 = fma(_452, _370, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _474 = fma(_462, _370, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _476;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _480;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _484;
    float _488 = fma(_470, _442, _464);
    float _490 = fma(_478, _396, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _492 = fma(_482, _396, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _494 = fma(_486, _396, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _496 = fma(_472, _442, _466);
    float _498 = fma(_474, _442, _468);
    float _500 = fma(_490, _426, _488);
    float _502 = fma(_492, _426, _496);
    float _504 = fma(_494, _426, _498);
    float _506 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[146].x, _500);
    float _508 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[146].y, _502);
    float _510 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[146].z, _504);
    bool _512 = !_368;
    float _514 = _464;
    float _532;
    if (!_512)
    {
        float _516 = in.m_53.x;
        float _518 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _520 = _516 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _522 = fma(_520, (*spvDescriptorSet0.vp_c9)._m0[11].w, _132);
        float _524 = _522 * _518;
        float _526 = floor(_524);
        float _528 = -_526;
        float _530 = _524 + _528;
        _532 = _530;
        _534 = true;
    }
    else
    {
        float _536 = float(_98);
        float _538 = 1.0 / _536;
        float _540 = _132 * _538;
        _532 = _540;
    }
    _534 = false;
    float _542 = _532;
    float _544 = in.m_53.z;
    float _546 = _272 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _548 = in.m_53.x;
    int _550 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _552 = _550 != 0;
    float _554 = _272 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _556 = _272 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _558 = in.m_53.y;
    float _560 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _562 = log2(_560);
    float _564 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[4].x, _546);
    float _566 = in.m_53.w;
    float _568 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _570 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[4].z, _564);
    bool _572 = _542 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _574 = isnan(_542);
    bool _576 = _572 || _574;
    bool _578 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _580 = _576 || _578;
    float _582 = float(_580);
    float _584 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _586 = _544 * 2.0;
    if (!_552)
    {
        _514 = _544;
    }
    float _588 = _514;
    float _590 = _562 * _132;
    float _592 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _594 = _548 * 2.0;
    float _596 = _558 * 2.0;
    float _598 = _588;
    if (_552)
    {
        _598 = _558;
    }
    float _600 = _598;
    float _602 = _558 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _604 = floor(_586);
    float _606 = _584 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _608 = fma(_602, -2.0, _568);
    float _610 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[76].y, _608);
    float _612 = floor(_594);
    float _614 = floor(_596);
    bool _616 = _604 > 0.0;
    bool _618 = _604 >= 0.0;
    bool _620 = isnan(_604);
    bool _622 = _618 || _620;
    bool _624 = isnan(0.0);
    bool _626 = _622 || _624;
    float _628 = _626 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _630 = exp2(_590);
    bool _632 = _612 >= 0.0;
    bool _634 = isnan(_612);
    bool _636 = _632 || _634;
    bool _638 = isnan(0.0);
    bool _640 = _636 || _638;
    bool _642 = _612 > 0.0;
    float _644 = _640 ? 0.0 : 1.4012984643248170709237295832899e-45;
    int _646 = ~as_type<int>(_628);
    int _648 = _646 + 1;
    int _650 = _648 + 1;
    bool _652 = _614 >= 0.0;
    bool _654 = isnan(_614);
    bool _656 = _652 || _654;
    bool _658 = isnan(0.0);
    bool _660 = _656 || _658;
    bool _662 = _614 > 0.0;
    int _664 = _660 ? 0 : 1;
    int _666 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _668 = _666 != 0;
    int _670 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _672 = _670 != 0;
    int _674 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _676 = _674 != 0;
    float _678 = -_630;
    float _680 = _678 + 1.0;
    float _682 = in.m_51.x;
    float _684 = in.m_51.y;
    float _686 = in.m_51.z;
    int _688 = ~_664;
    int _690 = _688 + 1;
    int _692 = _690 + 1;
    int _694 = ~as_type<int>(_644);
    int _696 = _694 + 1;
    int _698 = _696 + 1;
    int _700 = _650;
    int _702 = _692;
    int _704 = _698;
    float _706 = _644;
    float _708 = _628;
    if (!_616)
    {
        int _710 = ~as_type<int>(_628);
        int _712 = _710 + 1;
        _700 = _712;
    }
    int _714 = _700;
    if (!_662)
    {
        int _716 = ~_664;
        int _718 = _716 + 1;
        _702 = _718;
    }
    int _720 = _702;
    if (!_642)
    {
        int _722 = ~as_type<int>(_644);
        int _724 = _722 + 1;
        _704 = _724;
    }
    int _726 = _704;
    if (!_552)
    {
        _706 = _558;
    }
    float _728 = _706;
    float _730 = _728;
    if (!_552)
    {
        _708 = _544;
    }
    float _732 = _708;
    float _734 = _732;
    if (_552)
    {
        _730 = _548;
    }
    float _736 = _730;
    if (_552)
    {
        _734 = _558;
    }
    float _738 = _734;
    int _740 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _742 = _740 != 0;
    int _744 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _746 = _744 != 0;
    float _748 = _508 * _684;
    float _750 = _510 * _686;
    int _752 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _754 = _752 != 0;
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _758 = _756 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _760 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _762 = _760 != 0;
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _766 = _764 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _768 = !_668;
    int _770 = _768 ? 0 : 1;
    float _772 = _506 * _682;
    bool _774 = _566 > 0.5;
    float _776 = 1.0 / _766;
    float _778 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[5].x, _554);
    float _780 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[6].x, _556);
    float _782 = _548 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _786 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _784;
    float _788 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[5].z, _778);
    float _790 = 1.0 / _758;
    float _792 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[6].z, _780);
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _796 = _794 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _798 = _548 + _544;
    float _800 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _802 = _548 + _558;
    float _804 = _798 + (-1.0);
    float _806 = _796 * _776;
    float _808 = _558 + _544;
    float _810 = -_800;
    float _812 = fma(_782, 2.0, _810);
    float _814 = _808 + (-1.0);
    float _816 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _818 = _802 + (-1.0);
    float _820 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _822 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _824 = abs(_770);
    float _826 = fma(_818, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _828 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _830 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _832 = _736 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _834 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[83].w, _822);
    float _836 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _838 = _600 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _840 = -_828;
    float _842 = fma(_832, 2.0, _840);
    float _844 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[83].z, _830);
    float _846 = fma(_838, -2.0, _836);
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _850 = 1.0 + _848;
    float _852 = in.m_57.x;
    float _854 = in.m_57.y;
    float _856 = in.m_57.z;
    float _858 = float(_824);
    float _860 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _862 = float(_714);
    float _864 = 1.0 / _850;
    float _866 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[78].z, _860);
    bool _868 = !_676;
    int _870 = _868 ? 0 : 1;
    float _872 = _858 * _862;
    bool _874 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _876 = isnan(1.0);
    bool _878 = _874 || _876;
    bool _880 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _882 = _878 || _880;
    float _884 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _886 = !_672;
    int _888 = _886 ? 0 : 1;
    float _890 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].z, _866);
    bool _892 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _894 = isnan(0.0);
    bool _896 = _892 || _894;
    bool _898 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _900 = _896 || _898;
    float _902 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[78].w, _884);
    int _904 = abs(_888);
    float _906 = -_132;
    float _908 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[76].x, _812);
    float _910 = _900 ? _680 : 0.0;
    float _912 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].w, _902);
    float _914 = float(_904);
    float _916 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].z, _844);
    int _918 = abs(_870);
    float _920 = -_132;
    float _922 = fma(_920, (*spvDescriptorSet0.vp_c9)._m0[81].x, _842);
    float _924 = float(_726);
    float _926 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].w, _834);
    float _928 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[81].y, _846);
    bool _930 = _900;
    bool _932 = _774;
    if (_882)
    {
        float _934 = _910 * _864;
        _134 = _934;
    }
    float _936 = _134;
    float _938 = _872 * (-2.0);
    float _940 = _914 * _924;
    float _942 = _786 * _790;
    if (_742)
    {
        bool _944 = _548 > 0.5;
        _930 = _944;
    }
    bool _946 = _930;
    float _948 = _548 + (-0.5);
    float _950 = fma(_938, _852, _852);
    float _952 = float(_918);
    float _954 = fma(_826, _938, _826);
    float _956 = float(_720);
    float _958 = fma(_948, (*spvDescriptorSet0.vp_c9)._m0[196].x, _950);
    float _960 = in.m_59.y;
    float _962 = _940 * (-2.0);
    float _964 = _952 * _956;
    float _966 = fma(_954, _936, _958);
    bool _968 = _558 > 0.5;
    float _970 = in.m_61.x;
    float _972 = in.m_61.y;
    float _974 = in.m_61.z;
    float _976 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _978 = _976 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _980 = _964 * (-2.0);
    float _982 = fma(_962, _854, _854);
    float _984 = _558 + (-0.5);
    float _986 = 1.0 / _978;
    float _988 = fma(_980, _856, _856);
    float _990 = fma(_816, _980, _816);
    float _992 = fma(_984, (*spvDescriptorSet0.vp_c9)._m0[196].y, _982);
    float _994 = fma(_820, _962, _820);
    float _996 = _544 + (-0.5);
    float _998 = _772 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1000 = fma(_994, _936, _992);
    float _1002 = fma(_996, (*spvDescriptorSet0.vp_c9)._m0[196].z, _988);
    float _1004 = _966 * 0.15915493667125701904296875;
    float _1006 = _1000 * 0.15915493667125701904296875;
    float _1008 = -_960;
    float _1010 = _1008 + 1.0;
    float _1012 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1014 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1012;
    float _1016 = _748 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1018 = in.m_59.x;
    float _1020 = _1004 * 6.283185482025146484375;
    float _1022 = cos(_1020);
    int _1024 = _774 ? as_type<int>(_1010) : as_type<int>(_960);
    float _1026 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _970);
    float _1028 = _1014 * _986;
    float _1030 = _960;
    float _1032 = _1028;
    if (_746)
    {
        bool _1034 = _544 > 0.5;
        _932 = _1034;
    }
    bool _1036 = _932;
    float _1038 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _972);
    float _1040 = _998 * _1026;
    float _1042 = fma(_990, _936, _1002);
    float _1044 = _1004 * 6.283185482025146484375;
    float _1046 = sin(_1044);
    float _1048 = in.m_63.x;
    float _1050 = in.m_63.y;
    float _1052 = in.m_63.z;
    float _1054 = _1016 * _1038;
    float _1056 = _1042 * 0.15915493667125701904296875;
    float _1058 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _974);
    float _1060 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1062 = _542 + _1060;
    float _1064 = _792 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1066 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1068 = _754 ? as_type<float>(_1024) : _960;
    float _1070 = _750 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _1072 = _972 != 0.0;
    bool _1074 = isnan(_972);
    bool _1076 = _1072 || _1074;
    bool _1078 = isnan(0.0);
    bool _1080 = _1076 || _1078;
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1084 = _542 + _1082;
    float _1086 = _1042;
    float _1088 = _1064;
    if (_762)
    {
        float _1090 = _968 ? _1010 : _960;
        _1030 = _1090;
    }
    float _1092 = _1030;
    float _1094 = _1070 * _1058;
    bool _1096 = _970 == 0.0;
    bool _1098 = !_1080;
    bool _1100 = _1096 && _1098;
    float _1102 = _1006 * 6.283185482025146484375;
    float _1104 = sin(_1102);
    float _1106 = fma(_806, _1084, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1108 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1110 = _542 + _1108;
    bool _1112 = _974 == 0.0;
    bool _1114 = _1112 && _1100;
    float _1116 = fma(_942, _1062, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    if (!_742)
    {
        _1086 = _1018;
    }
    float _1118 = _1086;
    float _1120 = fma(_1028, _1110, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1122 = _1006 * 6.283185482025146484375;
    float _1124 = cos(_1122);
    float _1126 = _1066 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1128 = _1118;
    if (!_742)
    {
        _1032 = _1118;
    }
    float _1130 = _1032;
    float _1132 = _1130;
    if (_742)
    {
        _1128 = _1018;
    }
    float _1134 = _1128;
    float _1136 = fma(_1068, _1126, -0.5);
    float _1138 = _1056 * 6.283185482025146484375;
    float _1140 = cos(_1138);
    float _1142 = _1048;
    float _1144 = _1052;
    float _1146 = _1050;
    float _1148 = _1134;
    if (!_1114)
    {
        float _1150 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1048);
        _1142 = _1150;
    }
    float _1152 = _1142;
    if (!_1114)
    {
        float _1154 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1052);
        _1144 = _1154;
    }
    float _1156 = _1144;
    float _1158 = _1046 * _1104;
    if (!_1114)
    {
        float _1160 = fma(_972, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1050);
        _1146 = _1160;
    }
    float _1162 = _1146;
    int _1164 = 0;
    if (_742)
    {
        float _1166 = -_1134;
        float _1168 = _1166 + 1.0;
        _1164 = as_type<int>(_1168);
    }
    int _1170 = _1164;
    int _1172 = 0;
    if (_746)
    {
        float _1174 = -_1134;
        float _1176 = _1174 + 1.0;
        _1172 = as_type<int>(_1176);
    }
    int _1178 = _1172;
    float _1180 = -_928;
    float _1182 = fma(_926, _1136, _1180);
    float _1184 = _1056 * 6.283185482025146484375;
    float _1186 = sin(_1184);
    float _1188 = _1046 * _1124;
    float _1190 = _1022 * _1124;
    if (_742)
    {
        float _1192 = _946 ? as_type<float>(_1170) : _1134;
        _1132 = _1192;
    }
    float _1194 = _1132;
    float _1196 = _1194;
    if (_746)
    {
        float _1198 = _1036 ? as_type<float>(_1178) : _1134;
        _1148 = _1198;
    }
    float _1200 = _1148;
    float _1202 = _1046 * _1140;
    float _1204 = _1022 * _1140;
    float _1206 = _1124 * _1140;
    float _1208 = _1022 * _1104;
    float _1210 = _1202 * _1054;
    float _1212 = _1204 * _1054;
    float _1214 = _1104 * _1140;
    float _1216 = _1204 * _1162;
    float _1218 = fma(_1186, _1190, _1158);
    float _1220 = fma(_1186, _1158, _1190);
    float _1222 = -_1054;
    float _1224 = _1186 * _1222;
    float _1226 = -_1208;
    float _1228 = fma(_1186, _1188, _1226);
    float _1230 = -_1188;
    float _1232 = fma(_1186, _1208, _1230);
    float _1234 = fma(_1218, _1040, _1212);
    float _1236 = fma(_1206, _1040, _1224);
    float _1238 = fma(_1228, _1040, _1210);
    bool _1240 = _542 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1242 = isnan(_542);
    bool _1244 = _1240 || _1242;
    bool _1246 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1248 = _1244 || _1246;
    float _1250 = float(_1248);
    float _1252 = fma(_1232, _1094, _1234);
    float _1254 = fma(_1214, _1094, _1236);
    bool _1256 = _542 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1258 = isnan(_542);
    bool _1260 = _1256 || _1258;
    bool _1262 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1264 = _1260 || _1262;
    float _1266 = float(_1264);
    float _1268 = fma(_1220, _1094, _1238);
    float _1270 = _1252 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1272 = _1252 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    bool _1274 = _542 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1276 = isnan(_542);
    bool _1278 = _1274 || _1276;
    bool _1280 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1282 = _1278 || _1280;
    float _1284 = float(_1282);
    float _1286 = -_1250;
    float _1288 = _1286 + 1.0;
    float _1290 = fma(_1254, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1270);
    float _1292 = fma(_1254, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1272);
    float _1294 = _570 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1296 = _1284 * _1288;
    float _1298 = -_1284;
    float _1300 = _1298 + 1.0;
    float _1302 = fma(_1268, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1290);
    float _1304 = fma(_1268, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1292);
    float _1306 = -_1266;
    float _1308 = _1306 + 1.0;
    float _1310 = _1266 * _1300;
    float _1312 = _1294 + _1302;
    float _1314 = _1064 + _1304;
    float _1316 = _582 * _1308;
    float _1318 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1320 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1322 = _1312 + _1320;
    float _1324 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1326 = _1314 + _1324;
    float _1328 = _1116 * _1316;
    float _1330 = fma(_606, _1092, -0.5);
    float _1332 = _1322 * _1322;
    float _1334 = _1326 * _1326;
    float _1336 = -_582;
    float _1338 = _1336 + 1.0;
    float _1340 = -_610;
    float _1342 = fma(_912, _1330, _1340);
    float _1344 = -_1162;
    float _1346 = _1186 * _1344;
    float _1348 = _1332 + _1334;
    float _1350 = fma(_1338, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1328);
    float _1352 = _1202 * _1162;
    float _1354 = fma(_1206, _1152, _1346);
    float _1356 = sqrt(_1348);
    float _1358 = _788 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1360 = _1318 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1362 = _592 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1364 = fma(_1106, _1310, _1350);
    float _1366 = fma(_1218, _1152, _1216);
    float _1368 = fma(_1360, _1194, -0.5);
    float _1370 = fma(_1362, _1200, -0.5);
    float _1372 = fma(_1228, _1152, _1352);
    float _1374 = fma(_1120, _1296, _1364);
    float _1376 = fma(_890, _1368, _908);
    float _1378 = _1252 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1380 = fma(_1214, _1156, _1354);
    float _1382 = fma(_1232, _1156, _1366);
    float _1384 = fma(_916, _1370, _922);
    float _1386 = fma(_1254, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1378);
    bool _1388 = _1356 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1390 = fma(_1220, _1156, _1372);
    float _1392 = fma(_1250, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1374);
    float _1394 = fma(_1268, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1386);
    float _1396 = _1358 + _1394;
    float _1398 = _1372;
    float _1400 = _1332;
    float _1402 = _1334;
    float _1404 = _1312;
    float _1406 = _1314;
    float _1408 = _1376;
    if (!_1388)
    {
        _1398 = _1396;
    }
    float _1410 = _1398;
    bool _1412 = !_1388;
    float _1414 = _1410;
    if (!_1412)
    {
        float _1416 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1418 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1420 = _1356 + _1418;
        float _1422 = rsqrt(_1348);
        float _1424 = _1420 * _1416;
        float _1426 = _1396 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1428 = _1424 * 0.15915493667125701904296875;
        float _1430 = _1428 * 6.283185482025146484375;
        float _1432 = sin(_1430);
        float _1434 = _1428 * 6.283185482025146484375;
        float _1436 = cos(_1434);
        float _1438 = fma(_1432, _1426, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1440 = _1422 * _1438;
        float _1442 = _1436 + (-1.0);
        float _1444 = fma(_1322, _1440, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1446 = fma(_1326, _1440, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1448 = _1442 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1450 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1452 = _1444 + _1450;
        float _1454 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1456 = _1446 + _1454;
        float _1458 = fma(_1396, _1436, _1448);
        float _1460 = _1452 * _1452;
        float _1462 = _1456 * _1456;
        _1414 = _1458;
        _1400 = _1460;
        _1402 = _1462;
        _1404 = _1444;
        _1406 = _1446;
    }
    float _1464 = _1414;
    float _1466 = _1400;
    float _1468 = _1402;
    float _1470 = _1404;
    float _1472 = _1406;
    float _1474 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1476 = _1464 + _1474;
    float _1478 = in.m_65.w;
    float _1480 = _1382 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1482 = fma(_1476, _1476, _1466);
    float _1484 = _1382 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1486 = _1382 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1488 = _1482 + _1468;
    float _1490 = fma(_1380, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1480);
    float _1492 = fma(_1380, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1484);
    float _1494 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1496 = fma(_1380, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1486);
    float _1498 = sqrt(_1488);
    float _1500 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1502 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1504 = _1342 + 0.5;
    float _1506 = fma(_1390, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1490);
    float _1508 = _1182 + 0.5;
    float _1510 = fma(_1390, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1492);
    float _1512 = _1500 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1514 = _1494 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1516 = _1502 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1518 = _1376 + 0.5;
    float _1520 = _1384 + 0.5;
    float _1522 = _1392 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1524 = fma(_1390, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1496);
    out.m_67.w = _1478;
    bool _1526 = _1498 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1528 = isnan(_1498);
    bool _1530 = _1526 || _1528;
    bool _1532 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1534 = _1530 || _1532;
    out.m_69.x = _1518;
    out.m_69.y = _1504;
    out.m_69.z = _1520;
    out.m_69.w = _1508;
    out.m_71.x = _1512;
    out.m_71.y = _1514;
    out.m_71.z = _1516;
    out.m_71.w = _1522;
    out.m_73.x = _1506;
    out.m_73.y = _1510;
    out.m_73.z = _1524;
    float _1536 = _1464;
    float _1538 = _1518;
    float _1540 = _1508;
    if (!_1534)
    {
        _1408 = 1.0;
    }
    float _1542 = _1408;
    bool _1544 = !_1534;
    float _1546 = _1542;
    if (!_1544)
    {
        bool _1548 = _1498 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1550 = isnan(_1498);
        bool _1552 = _1548 || _1550;
        bool _1554 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1556 = _1552 || _1554;
        if (!_1556)
        {
            float _1558 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1560 = _1498 + _1558;
            float _1562 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1564 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1562;
            float _1566 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1568 = _1566 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1570 = 1.0 / _1564;
            float _1572 = _1560 * _1570;
            float _1574 = fma(_1572, _1568, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1546 = _1574;
            _1576 = true;
        }
        else
        {
            bool _1578 = _1498 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1580 = isnan(_1498);
            bool _1582 = _1578 || _1580;
            bool _1584 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1586 = _1582 || _1584;
            if (!_1586)
            {
                float _1588 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1590 = _1498 + _1588;
                float _1592 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1594 = _1592 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1596 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1598 = _1596 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1600 = 1.0 / _1594;
                float _1602 = _1590 * _1600;
                float _1604 = fma(_1602, _1598, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1546 = _1604;
                _1576 = true;
            }
            else
            {
                _1546 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1576 = false;
    float _1606 = _1546;
    float _1608 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1610 = _1470 + _1608;
    float _1612 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1614 = _1464 + _1612;
    float _1616 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1618 = _1472 + _1616;
    bool _1620 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1622 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1624 = _1620 || _1622;
    bool _1626 = isnan(0.5);
    bool _1628 = _1624 || _1626;
    float _1630 = fma(_1610, _1606, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1632 = fma(_1614, _1606, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1634 = fma(_1618, _1606, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1636 = _1618;
    float _1638 = _1630;
    if (_1628)
    {
        _1636 = _1632;
    }
    float _1640 = _1636;
    float _1642 = _1640;
    if (_1628)
    {
        _1536 = _1634;
    }
    float _1644 = _1536;
    float _1646 = _1644;
    if (!_1628)
    {
        float _1648 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1650 = _1358 + _1648;
        float _1652 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1654 = _1294 + _1652;
        float _1656 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1658 = -_1294;
        float _1660 = _1658 + _1630;
        float _1662 = _1650 * _1650;
        float _1664 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1666 = _1064 + _1664;
        float _1668 = fma(_1654, _1654, _1662);
        float _1670 = fma(_1666, _1666, _1668);
        float _1672 = -_1064;
        float _1674 = _1672 + _1634;
        float _1676 = sqrt(_1670);
        float _1678 = precise::min(_1676, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1680 = _1678 * _1656;
        float _1682 = -_1358;
        float _1684 = _1682 + _1632;
        float _1686 = fma(_1660, _1680, _1294);
        float _1688 = fma(_1684, _1680, _1358);
        float _1690 = fma(_1674, _1680, _1064);
        _1642 = _1688;
        _1638 = _1686;
        _1646 = _1690;
    }
    float _1692 = _1642;
    float _1694 = _1638;
    float _1696 = _1646;
    float _1698 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1700 = _1692 + _1698;
    float _1702 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1704 = _1694 + _1702;
    float _1706 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1708 = _1696 + _1706;
    float _1710 = _1700 * _1700;
    float _1712 = fma(_1704, _1704, _1710);
    float _1714 = fma(_1708, _1708, _1712);
    float _1716 = rsqrt(_1714);
    float _1718 = sqrt(_1714);
    float _1720 = _1716 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1722 = _1704 * _1720;
    float _1724 = _1708 * _1720;
    float _1726 = _1722 * _1722;
    float _1728 = _1724 * _1724;
    float _1730 = _1726 + _1728;
    float _1732 = sqrt(_1730);
    bool _1734 = _1732 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1736 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1738 = _1732 + _1736;
    float _1740 = _1712;
    float _1742 = _1738;
    float _1744 = _1720;
    float _1746 = _1722;
    if (_1734)
    {
        float _1748 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1740 = _1748;
    }
    float _1750 = _1740;
    if (_1734)
    {
        float _1752 = rsqrt(_1730);
        _1538 = _1752;
    }
    float _1754 = _1538;
    float _1756 = _1754;
    if (_1734)
    {
        float _1758 = _1738 * _1750;
        _1742 = _1758;
    }
    float _1760 = _1742;
    if (_1734)
    {
        float _1762 = _1760 * 0.15915493667125701904296875;
        _1540 = _1762;
    }
    float _1764 = _1540;
    float _1766 = _1750;
    float _1768 = _1764;
    if (_1734)
    {
        float _1770 = _1764 * 6.283185482025146484375;
        float _1772 = sin(_1770);
        _1766 = _1772;
    }
    float _1774 = _1766;
    float _1776 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1778 = precise::max(0.0, _1776);
    float _1780 = _1520;
    float _1782 = _1778;
    if (_1734)
    {
        float _1784 = _1764 * 6.283185482025146484375;
        float _1786 = cos(_1784);
        _1780 = _1786;
    }
    float _1788 = _1780;
    float _1790 = -_1720;
    float _1792 = -_1778;
    float _1794 = fma(_1700, _1790, _1792);
    if (_1734)
    {
        float _1796 = _1794 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1782 = _1796;
    }
    float _1798 = _1782;
    float _1800 = _1798;
    if (!_1734)
    {
        _1768 = _1726;
    }
    float _1802 = _1768;
    float _1804 = _1774;
    float _1806 = _1802;
    if (_1734)
    {
        float _1808 = fma(_1774, _1798, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1804 = _1808;
    }
    float _1810 = _1804;
    float _1812 = _1810;
    if (_1734)
    {
        float _1814 = _1788 + (-1.0);
        _1800 = _1814;
    }
    float _1816 = _1800;
    float _1818 = _1816;
    if (_1734)
    {
        float _1820 = _1754 * _1810;
        _1196 = _1820;
    }
    float _1822 = _1196;
    if (!_1734)
    {
        _1756 = _1794;
    }
    float _1824 = _1756;
    float _1826 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1828 = fma(_1718, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1826);
    float _1830 = precise::clamp(_1828, 0.0, 1.0);
    float _1832 = _1824;
    if (_1734)
    {
        float _1834 = _1816 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1744 = _1834;
    }
    float _1836 = _1744;
    if (_1734)
    {
        float _1838 = _1722 * _1822;
        _1746 = _1838;
    }
    float _1840 = _1746;
    if (!_1734)
    {
        _1812 = _1724;
    }
    float _1842 = _1812;
    float _1844 = _1842;
    if (_1734)
    {
        float _1846 = _1724 * _1822;
        _1844 = _1846;
    }
    float _1848 = _1844;
    if (_1734)
    {
        float _1850 = fma(_1794, _1788, _1836);
        _1832 = _1850;
    }
    float _1852 = _1832;
    if (_1734)
    {
        float _1854 = _1840 * _1840;
        _1806 = _1854;
    }
    float _1856 = _1806;
    if (!_1734)
    {
        _1818 = _1728;
    }
    float _1858 = _1818;
    float _1860 = _1858;
    if (_1734)
    {
        float _1862 = _1848 * _1848;
        _1860 = _1862;
    }
    float _1864 = _1860;
    float _1866 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1868 = fma(_1852, _1852, _1856);
    float _1870 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1872 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1874 = -_1830;
    float _1876 = _1874 + 1.0;
    float _1878 = _1868 + _1864;
    float _1880 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1870);
    float _1882 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1884 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1872);
    float _1886 = rsqrt(_1878);
    float _1888 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1880);
    float _1890 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1882);
    float _1892 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1884);
    float _1894 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1896 = _1888 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1898 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1890);
    float _1900 = _1892 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1902 = abs(_1876);
    float _1904 = log2(_1902);
    float _1906 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1894);
    float _1908 = _1898 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1910 = _1896 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1912 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1906);
    float _1914 = _1908 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1916 = -_1910;
    float _1918 = fma(_1916, _1866, 1.0);
    float _1920 = _1886 * _1840;
    float _1922 = _1886 * _1852;
    float _1924 = fma(_1900, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1914);
    float _1926 = _1886 * _1848;
    float _1928 = _1920 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1930 = _1912 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1932 = fma(_1896, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1924);
    float _1934 = log2(_1918);
    float _1936 = -_1928;
    float _1938 = fma(_1922, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1936);
    float _1940 = _1904 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1942 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1932);
    float _1944 = _1908 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1946 = -_1926;
    float _1948 = fma(_1946, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1938);
    float _1950 = _1908 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1952 = exp2(_1940);
    float _1954 = fma(_1948, -0.5, 0.5);
    float _1956 = fma(_1900, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1944);
    float _1958 = fma(_1900, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1950);
    float _1960 = fma(_1948, 0.5, 0.5);
    float _1962 = fma(_1896, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1956);
    float _1964 = fma(_1896, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1958);
    float _1966 = 1.0 / _1942;
    float _1968 = _1922 + 1.0;
    float _1970 = fma(_1960, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1972 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1962);
    float _1974 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1964);
    float _1976 = _1934 * 0.693147182464599609375;
    float _1978 = fma(_1960, _1970, -0.212114393711090087890625);
    float _1980 = sqrt(_1954);
    float _1982 = -_1922;
    float _1984 = fma(_1952, _1968, _1982);
    float _1986 = fma(_1960, _1978, 1.570728778839111328125);
    float _1988 = _1976 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1990 = fma(_1984, 0.5, 0.5);
    float _1992 = _1972 * _1966;
    float _1994 = _1974 * _1966;
    float _1996 = fma(_1992, 0.5, 0.5);
    float _1998 = fma(_1994, -0.5, 0.5);
    float _2000 = _1980 * 0.636619746685028076171875;
    float3 _5305 = float3(_1996, _1998, _1988);
    float _2002 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5305, float3(0.0), isnan(_5305)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5305, float3(0.0), isnan(_5305)), level(0.0)).x;
    float3 _5316 = float3(_1996, _1998, _1988);
    float4 _2005 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5316, float3(0.0), isnan(_5316)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5316, float3(0.0), isnan(_5316)), level(0.0)).xyzw;
    float _2007 = _2005.x;
    float _2009 = _2005.y;
    float _2011 = _2005.z;
    float _2013 = _2005.w;
    float _2015 = -_1986;
    float _2017 = fma(_2000, _2015, 1.0);
    float2 _5338 = float2(_2017, _1990);
    float3 _2021 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5338, float2(0.0), isnan(_5338)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5338, float2(0.0), isnan(_5338)), level(0.0)).xyz;
    float _2023 = _2021.x;
    float _2025 = _2021.y;
    float _2027 = _2021.z;
    float _2029 = _1358 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2031 = _1358 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2033 = _1908 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_75.x = _1704;
    out.m_75.y = _1700;
    out.m_75.z = _1708;
    float _2035 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2029);
    float _2037 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2031);
    float _2039 = fma(_1900, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2033);
    float _2041 = _1942 * 0.5;
    float _2043 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2035);
    float _2045 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2037);
    float _2047 = fma(_1896, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2039);
    float _2049 = _2043 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2051 = _2045 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2053 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2047);
    float _2055 = 1.0 / _2049;
    bool _2057 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2059 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2061 = _2057 || _2059;
    bool _2063 = isnan(0.5);
    bool _2065 = _2061 || _2063;
    float _2067 = _2051 + _2049;
    float _2069 = fma(_1974, -0.5, _2041);
    float _2071 = _2053 + _1942;
    out.gl_Position.x = _1972;
    out.gl_Position.y = _1974;
    out.gl_Position.z = _2053;
    out.gl_Position.w = _1942;
    float _2073 = _2071 * 0.5;
    float _2075 = _1904 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2077 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _2079 = _1904;
    if (!_2065)
    {
        _1088 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2081 = _1088;
    float _2083 = exp2(_2075);
    float _2085 = _2067 * _2055;
    float _2087 = _2085 * 0.5;
    float _2089 = _2055;
    float _2091 = _2087;
    float _2093 = _2081;
    if (!_2065)
    {
        _2077 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2095 = _2077;
    if (!_2065)
    {
        float _2097 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2099 = fma(_2087, _2081, _2097);
        _2089 = _2099;
    }
    float _2101 = _2089;
    if (_2065)
    {
        _2091 = 1.0;
    }
    float _2103 = _2091;
    float _2105 = _2103;
    if (!_2065)
    {
        float _2107 = -_2095;
        float _2109 = _2107 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2093 = _2109;
    }
    float _2111 = _2093;
    float _2113 = _2101;
    if (!_2065)
    {
        float _2115 = 1.0 / _2101;
        _2113 = _2115;
    }
    float _2117 = _2113;
    float _2119 = -_2083;
    float _2121 = _2119 + 1.0;
    float _2123 = _2111;
    if (!_2065)
    {
        float _2125 = 1.0 / _2111;
        _2123 = _2125;
    }
    float _2127 = _2123;
    float _2129 = _2121 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_2065)
    {
        float _2131 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2133 = -_2095;
        float _2135 = fma(_2117, _2131, _2133);
        _2079 = _2135;
    }
    float _2137 = _2079;
    if (!_2065)
    {
        float _2139 = _2137 * _2127;
        float _2141 = precise::clamp(_2139, 0.0, 1.0);
        _2105 = _2141;
    }
    float _2143 = _2105;
    float _2145 = _1972 + _1942;
    float _2147 = _2143 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2149 = _2143 > 0.0;
    bool _2151 = isnan(_2143);
    bool _2153 = _2149 || _2151;
    bool _2155 = isnan(0.0);
    bool _2157 = _2153 || _2155;
    float _2159 = _2145 * 0.5;
    float _2161 = _2147 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_77.x = _2159;
    out.m_77.y = _2069;
    out.m_77.z = _2073;
    out.m_77.w = _1942;
    out.m_47.x = _2161;
    float _2163 = _2129 * _2002;
    float _2165 = -_2129;
    float _2167 = _2165 + 1.0;
    float _2169 = _2013 * _2163;
    float _2171 = _2027 * _2163;
    float _2173 = fma(_2023, _2169, _2007);
    float _2175 = fma(_2025, _2169, _2009);
    float _2177 = _2013 * _2167;
    float _2179 = fma(_2013, _2171, _2011);
    out.m_79.x = _2173;
    out.m_79.y = _2175;
    out.m_79.z = _2179;
    out.m_79.w = _2177;
    if (_2157)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2181 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2181;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

