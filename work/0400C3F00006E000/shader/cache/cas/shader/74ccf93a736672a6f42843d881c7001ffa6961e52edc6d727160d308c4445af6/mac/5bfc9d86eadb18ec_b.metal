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
    float4 m_61 [[attribute(4)]];
    float4 m_59 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_63 [[attribute(9)]];
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
    bool _1618 = false;
    bool _532 = false;
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
        float _2312 = as_type<float>(_114);
        out.gl_Position.z = _2312;
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
        float _2382 = as_type<float>(_152);
        out.gl_Position.z = _2382;
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
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _336 = _304 + _334;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _340 = _326 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _342 = _328 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _344 = 1.0 / _320;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _348 = _304 + _346;
    float _350 = _336 * _322;
    bool _352 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _354 = isnan(_304);
    bool _356 = _352 || _354;
    bool _358 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _360 = _356 || _358;
    float _362 = float(_360);
    out.m_55.x = _330;
    out.m_55.y = _340;
    out.m_55.z = _342;
    out.m_55.w = _338;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _364;
    bool _368 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _370 = _348 * _332;
    bool _372 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _374 = isnan(_304);
    bool _376 = _372 || _374;
    bool _378 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _380 = _376 || _378;
    float _382 = float(_380);
    float _384 = -_362;
    float _386 = _384 + 1.0;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _388;
    float _392 = fma(_366, _350, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _394 = _382 * _386;
    float _396 = -_382;
    float _398 = _396 + 1.0;
    float _400 = _308 * _344;
    bool _402 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _404 = isnan(_304);
    bool _406 = _402 || _404;
    bool _408 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _410 = _406 || _408;
    float _412 = float(_410);
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _414;
    bool _418 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _420 = isnan(_304);
    bool _422 = _418 || _420;
    bool _424 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _426 = _422 || _424;
    float _428 = float(_426);
    float _430 = fma(_390, _350, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _434 = _432 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _436 = -_412;
    float _438 = _436 + 1.0;
    float _440 = _412 * _398;
    float _442 = fma(_416, _350, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _444 = _428 * _438;
    float _446 = -_428;
    float _448 = _446 + 1.0;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _452 = _450 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _456 = _454 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _458 = _430 * _444;
    float _460 = _392 * _444;
    float _462 = _442 * _444;
    float _464 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[143].y, _458);
    float _466 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[143].x, _460);
    float _468 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[143].z, _462);
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _470;
    float _474 = fma(_434, _370, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _476 = fma(_452, _370, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _478 = fma(_456, _370, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _480;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _484;
    float _488 = fma(_474, _440, _466);
    float _490 = fma(_472, _400, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _492 = fma(_482, _400, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _494 = fma(_486, _400, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _496 = fma(_476, _440, _464);
    float _498 = fma(_478, _440, _468);
    float _500 = fma(_490, _394, _488);
    float _502 = fma(_492, _394, _496);
    float _504 = fma(_494, _394, _498);
    float _506 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[146].x, _500);
    float _508 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[146].y, _502);
    float _510 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[146].z, _504);
    bool _512 = !_368;
    float _530;
    if (!_512)
    {
        float _514 = in.m_53.x;
        float _516 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _518 = _514 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _520 = fma(_518, (*spvDescriptorSet0.vp_c9)._m0[11].w, _132);
        float _522 = _520 * _516;
        float _524 = floor(_522);
        float _526 = -_524;
        float _528 = _522 + _526;
        _530 = _528;
        _532 = true;
    }
    else
    {
        float _534 = float(_98);
        float _536 = 1.0 / _534;
        float _538 = _132 * _536;
        _530 = _538;
    }
    _532 = false;
    float _540 = _530;
    float _542 = in.m_53.z;
    float _544 = _272 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _546 = in.m_53.x;
    int _548 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _550 = _548 != 0;
    float _552 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[5].x, _544);
    float _554 = in.m_53.y;
    float _556 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _558 = log2(_556);
    float _560 = in.m_53.w;
    float _562 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _570 = _540 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _572 = isnan(_540);
    bool _574 = _570 || _572;
    bool _576 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _578 = _574 || _576;
    float _580 = float(_578);
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _584 = _582 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _586 = _542 * 2.0;
    float _588 = 1.0 / _568;
    float _590 = _546 * 2.0;
    float _592 = _554 * 2.0;
    float _594 = floor(_586);
    float _596 = fma(_554, (*spvDescriptorSet0.vp_c9)._m0[78].w, _564);
    float _598 = floor(_590);
    float _600 = floor(_592);
    bool _602 = _594 > 0.0;
    bool _604 = _594 >= 0.0;
    bool _606 = isnan(_594);
    bool _608 = _604 || _606;
    bool _610 = isnan(0.0);
    bool _612 = _608 || _610;
    float _614 = _612 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _616 = 1.0 / _584;
    bool _618 = _598 >= 0.0;
    bool _620 = isnan(_598);
    bool _622 = _618 || _620;
    bool _624 = isnan(0.0);
    bool _626 = _622 || _624;
    bool _628 = _598 > 0.0;
    float _630 = _626 ? 0.0 : 1.4012984643248170709237295832899e-45;
    int _632 = ~as_type<int>(_614);
    int _634 = _632 + 1;
    int _636 = _634 + 1;
    bool _638 = _600 >= 0.0;
    bool _640 = isnan(_600);
    bool _642 = _638 || _640;
    bool _644 = isnan(0.0);
    bool _646 = _642 || _644;
    bool _648 = _600 > 0.0;
    float _650 = _646 ? 0.0 : 1.4012984643248170709237295832899e-45;
    int _652 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _654 = _652 != 0;
    int _656 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _658 = _656 != 0;
    int _660 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _662 = _660 != 0;
    float _664 = in.m_51.x;
    float _666 = in.m_51.y;
    float _668 = in.m_51.z;
    int _670 = ~as_type<int>(_630);
    int _672 = _670 + 1;
    int _674 = _672 + 1;
    int _676 = ~as_type<int>(_650);
    int _678 = _676 + 1;
    int _680 = _678 + 1;
    int _682 = _636;
    int _684 = _674;
    int _686 = _680;
    float _688 = _630;
    float _690 = _650;
    float _692 = _614;
    if (!_602)
    {
        int _694 = ~as_type<int>(_614);
        int _696 = _694 + 1;
        _682 = _696;
    }
    int _698 = _682;
    if (!_628)
    {
        int _700 = ~as_type<int>(_630);
        int _702 = _700 + 1;
        _684 = _702;
    }
    int _704 = _684;
    if (!_648)
    {
        int _706 = ~as_type<int>(_650);
        int _708 = _706 + 1;
        _686 = _708;
    }
    int _710 = _686;
    if (!_550)
    {
        _688 = _554;
    }
    float _712 = _688;
    float _714 = _712;
    if (!_550)
    {
        _690 = _542;
    }
    float _716 = _690;
    float _718 = _716;
    if (!_550)
    {
        _692 = _542;
    }
    float _720 = _692;
    float _722 = _720;
    if (_550)
    {
        _714 = _546;
    }
    float _724 = _714;
    if (_550)
    {
        _718 = _554;
    }
    float _726 = _718;
    if (_550)
    {
        _722 = _554;
    }
    float _728 = _722;
    int _730 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _732 = _730 != 0;
    float _734 = _508 * _666;
    int _736 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _738 = _736 != 0;
    float _740 = _506 * _664;
    int _742 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _744 = _742 != 0;
    float _746 = _554 + _542;
    int _748 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _750 = _748 != 0;
    float _752 = _272 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _754 = !_654;
    int _756 = _754 ? 0 : 1;
    float _758 = _272 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _760 = _560 > 0.5;
    float _762 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[4].x, _752);
    float _764 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[6].x, _758);
    float _766 = _546 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _768 = _546 + _554;
    float _770 = _510 * _668;
    float _772 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _774 = _554 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _776 = _746 + (-1.0);
    float _778 = -_772;
    float _780 = fma(_766, 2.0, _778);
    float _782 = _768 + (-1.0);
    float _784 = fma(_774, -2.0, _562);
    float _786 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[4].z, _762);
    float _788 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[5].z, _552);
    float _790 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[6].z, _764);
    float _792 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _794 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _796 = _788 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _798 = _786 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _800 = abs(_756);
    float _802 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _804 = _724 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _806 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _808 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _810 = _796 + _808;
    float _812 = -_806;
    float _814 = fma(_804, 2.0, _812);
    float _816 = _558 * _132;
    float _818 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _820 = !_658;
    int _822 = _820 ? 0 : 1;
    float _824 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _826 = !_662;
    int _828 = _826 ? 0 : 1;
    float _830 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[83].w, _818);
    float _832 = exp2(_816);
    float _834 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[83].z, _824);
    float _836 = _790 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _838 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _840 = isnan(1.0);
    bool _842 = _838 || _840;
    bool _844 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _846 = _842 || _844;
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _850 = 1.0 + _848;
    float _852 = float(_800);
    float _854 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _856 = float(_698);
    float _858 = 1.0 / _850;
    float _860 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _862 = _798 + _860;
    float _864 = fma(_546, (*spvDescriptorSet0.vp_c9)._m0[78].z, _854);
    float _866 = _726 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _868 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _870 = isnan(0.0);
    bool _872 = _868 || _870;
    bool _874 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _876 = _872 || _874;
    float _878 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _880 = _836 + _878;
    float _882 = -_832;
    float _884 = _882 + 1.0;
    float _886 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].z, _864);
    float _888 = _852 * _856;
    int _890 = abs(_822);
    float _892 = _810 * _810;
    float _894 = fma(_866, -2.0, _802);
    float _896 = in.m_57.x;
    float _898 = in.m_57.y;
    float _900 = in.m_57.z;
    float _902 = _876 ? _884 : 0.0;
    float _904 = fma(_862, _862, _892);
    float _906 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].w, _596);
    float _908 = -_132;
    float _910 = fma(_908, (*spvDescriptorSet0.vp_c9)._m0[76].x, _780);
    float _912 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[76].y, _784);
    float _914 = fma(_880, _880, _904);
    float _916 = float(_890);
    float _918 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].z, _834);
    float _920 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].w, _830);
    float _922 = -_132;
    float _924 = fma(_922, (*spvDescriptorSet0.vp_c9)._m0[81].x, _814);
    float _926 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[81].y, _894);
    bool _928 = _760;
    bool _930 = _744;
    float _932 = _798;
    if (_846)
    {
        float _934 = _902 * _858;
        _134 = _934;
    }
    float _936 = _134;
    float _938 = rsqrt(_914);
    float _940 = in.m_59.x;
    float _942 = in.m_59.y;
    float _944 = in.m_59.z;
    float _946 = float(_704);
    float _948 = _770 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _950 = abs(_828);
    float _952 = float(_710);
    float _954 = _916 * _946;
    float _956 = float(_950);
    float _958 = _888 * (-2.0);
    bool _960 = _554 > 0.5;
    float _962 = _954 * (-2.0);
    float _964 = _554 + (-0.5);
    float _966 = fma(_958, _896, _896);
    float _968 = _956 * _952;
    float _970 = fma(_794, _958, _794);
    float _972 = _810 * _938;
    float _974 = fma(_792, _962, _792);
    float _976 = _862 * _938;
    float _978 = in.m_61.x;
    float _980 = in.m_61.y;
    float _982 = in.m_61.z;
    float _984 = -_972;
    float _986 = fma(_984, (*spvDescriptorSet0.vp_c9)._m0[18].w, _810);
    float _988 = fma(_962, _898, _898);
    float _990 = -_976;
    float _992 = fma(_990, (*spvDescriptorSet0.vp_c9)._m0[18].w, _862);
    float _994 = in.m_63.y;
    float _996 = _986 * _986;
    bool _998 = _942 != 0.0;
    bool _1000 = isnan(_942);
    bool _1002 = _998 || _1000;
    bool _1004 = isnan(0.0);
    bool _1006 = _1002 || _1004;
    float _1008 = _968 * (-2.0);
    float _1010 = fma(_992, _992, _996);
    bool _1012 = _940 == 0.0;
    bool _1014 = !_1006;
    bool _1016 = _1012 && _1014;
    float _1018 = _546 + (-0.5);
    float _1020 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[196].y, _988);
    float _1022 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1024 = _1022 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1026 = _944 == 0.0;
    bool _1028 = _1026 && _1016;
    float _1030 = fma(_1018, (*spvDescriptorSet0.vp_c9)._m0[196].x, _966);
    float _1032 = _546 + _542;
    float _1034 = _880 * _938;
    float _1036 = fma(_1008, _900, _900);
    float _1038 = fma(_970, _936, _1030);
    float _1040 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _942);
    float _1042 = -_1034;
    float _1044 = fma(_1042, (*spvDescriptorSet0.vp_c9)._m0[18].w, _880);
    float _1046 = 1.0 / _1024;
    float _1048 = _1038 * 0.15915493667125701904296875;
    float _1050 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _940);
    float _1052 = fma(_1044, _1044, _1010);
    float _1054 = fma(_974, _936, _1020);
    float _1056 = _978;
    float _1058 = _980;
    float _1060 = _982;
    float _1062 = _972;
    if (!_1028)
    {
        float _1064 = fma(_940, (*spvDescriptorSet0.vp_c9)._m0[17].y, _978);
        _1056 = _1064;
    }
    float _1066 = _1056;
    float _1068 = _1032 + (-1.0);
    if (!_1028)
    {
        float _1070 = fma(_942, (*spvDescriptorSet0.vp_c9)._m0[17].y, _980);
        _1058 = _1070;
    }
    float _1072 = _1058;
    float _1074 = _542 + (-0.5);
    float _1076 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1078 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1080 = -_994;
    float _1082 = _1080 + 1.0;
    float _1084 = fma(_1074, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1036);
    float _1086 = fma(_1078, _1008, _1078);
    float _1088 = _1054 * 0.15915493667125701904296875;
    int _1090 = _760 ? as_type<int>(_1082) : as_type<int>(_994);
    float _1092 = sqrt(_1052);
    float _1094 = fma(_1086, _936, _1084);
    float _1096 = _994;
    if (_732)
    {
        bool _1098 = _546 > 0.5;
        _928 = _1098;
    }
    bool _1100 = _928;
    float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1104 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1102;
    float _1106 = _744 ? as_type<float>(_1090) : _994;
    float _1108 = _1094 * 0.15915493667125701904296875;
    if (_738)
    {
        bool _1110 = _542 > 0.5;
        _930 = _1110;
    }
    bool _1112 = _930;
    float _1114 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1116 = _1114 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1118 = _1048 * 6.283185482025146484375;
    float _1120 = sin(_1118);
    float _1122 = _1104 * _1046;
    float _1124 = _1116 * _588;
    float _1126 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1128 = _540 + _1126;
    float _1130 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1132 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1130;
    float _1134 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1136 = _540 + _1134;
    if (_750)
    {
        float _1138 = _960 ? _1082 : _994;
        _1096 = _1138;
    }
    float _1140 = _1096;
    float _1142 = fma(_1122, _1128, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1144 = _1048 * 6.283185482025146484375;
    float _1146 = cos(_1144);
    float _1148 = _1132 * _616;
    float _1150 = _938 * _1092;
    float _1152 = _734 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1154 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _944);
    float _1156 = fma(_1148, _1136, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1158 = _1076 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1160 = _740 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1162 = _1088 * 6.283185482025146484375;
    float _1164 = sin(_1162);
    float _1166 = _948 * _1150;
    float _1168 = fma(_1106, _1158, -0.5);
    float _1170 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1172 = _540 + _1170;
    float _1174 = _1172;
    if (!_1028)
    {
        float _1176 = fma(_944, (*spvDescriptorSet0.vp_c9)._m0[17].y, _982);
        _1060 = _1176;
    }
    float _1178 = _1060;
    float _1180 = _1166 * _1154;
    float _1182 = in.m_63.x;
    float _1184 = fma(_1124, _1172, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1186 = _1088 * 6.283185482025146484375;
    float _1188 = cos(_1186);
    float _1190 = -_926;
    float _1192 = fma(_920, _1168, _1190);
    float _1194 = _1108 * 6.283185482025146484375;
    float _1196 = cos(_1194);
    float _1198 = _1120 * _1164;
    float _1200 = _1108 * 6.283185482025146484375;
    float _1202 = sin(_1200);
    float _1204 = _1120 * _1188;
    float _1206 = _1146 * _1188;
    int _1208 = 0;
    float _1210 = _1182;
    if (_732)
    {
        float _1212 = -_1182;
        float _1214 = _1212 + 1.0;
        _1208 = as_type<int>(_1214);
    }
    int _1216 = _1208;
    int _1218 = 0;
    if (_738)
    {
        float _1220 = -_1182;
        float _1222 = _1220 + 1.0;
        _1218 = as_type<int>(_1222);
    }
    int _1224 = _1218;
    float _1226 = _1188 * _1196;
    float _1228 = _1146 * _1164;
    float _1230 = _1164 * _1196;
    float _1232 = _1120 * _1196;
    float _1234 = _1152 * _1150;
    float _1236 = _1146 * _1196;
    if (!_732)
    {
        _1174 = _1182;
    }
    float _1238 = _1174;
    float _1240 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1242 = fma(_1202, _1206, _1198);
    float _1244 = fma(_1202, _1198, _1206);
    float _1246 = _1160 * _1150;
    float _1248 = _1234 * _1040;
    float _1250 = -_1204;
    float _1252 = fma(_1202, _1228, _1250);
    float _1254 = -_1228;
    float _1256 = fma(_1202, _1204, _1254);
    float _1258 = _1246 * _1050;
    float _1260 = _1236 * _1248;
    float _1262 = -_1248;
    float _1264 = _1202 * _1262;
    float _1266 = _1232 * _1248;
    bool _1268 = _540 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1270 = isnan(_540);
    bool _1272 = _1268 || _1270;
    bool _1274 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1276 = _1272 || _1274;
    float _1278 = float(_1276);
    float _1280 = fma(_1242, _1258, _1260);
    float _1282 = fma(_1226, _1258, _1264);
    float _1284 = fma(_1256, _1258, _1266);
    float _1286 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1288 = fma(_1252, _1180, _1280);
    float _1290 = fma(_1230, _1180, _1282);
    bool _1292 = _540 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1294 = isnan(_540);
    bool _1296 = _1292 || _1294;
    bool _1298 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1300 = _1296 || _1298;
    float _1302 = float(_1300);
    float _1304 = -_1278;
    float _1306 = _1304 + 1.0;
    float _1308 = _1288 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1310 = _1288 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1312 = fma(_1244, _1180, _1284);
    bool _1314 = _540 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1316 = isnan(_540);
    bool _1318 = _1314 || _1316;
    bool _1320 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1322 = _1318 || _1320;
    float _1324 = float(_1322);
    float _1326 = fma(_1290, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1308);
    float _1328 = fma(_1290, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1310);
    float _1330 = _1302 * _1306;
    float _1332 = -_1302;
    float _1334 = _1332 + 1.0;
    float _1336 = fma(_1312, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1326);
    float _1338 = fma(_1312, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1328);
    float _1340 = _1240 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1342 = _1324 * _1334;
    float _1344 = _798 + _1336;
    float _1346 = _836 + _1338;
    float _1348 = -_1324;
    float _1350 = _1348 + 1.0;
    float _1352 = fma(_1340, _1140, -0.5);
    float _1354 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1356 = _1344 + _1354;
    float _1358 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1360 = _1346 + _1358;
    float _1362 = _580 * _1350;
    float _1364 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1366 = _1356 * _1356;
    float _1368 = _1360 * _1360;
    float _1370 = _1142 * _1362;
    float _1372 = -_912;
    float _1374 = fma(_906, _1352, _1372);
    float _1376 = _1288 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1378 = _1366 + _1368;
    float _1380 = -_580;
    float _1382 = _1380 + 1.0;
    float _1384 = _1238;
    float _1386 = _1366;
    float _1388 = _1368;
    float _1390 = _1344;
    float _1392 = _1346;
    float _1394 = _1374;
    if (_732)
    {
        float _1396 = _1100 ? as_type<float>(_1216) : _1182;
        _1384 = _1396;
    }
    float _1398 = _1384;
    float _1400 = fma(_1290, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1376);
    float _1402 = sqrt(_1378);
    float _1404 = fma(_1382, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1370);
    if (_738)
    {
        float _1406 = _1112 ? as_type<float>(_1224) : _1182;
        _1210 = _1406;
    }
    float _1408 = _1210;
    float _1410 = _1286 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1412 = -_1072;
    float _1414 = _1202 * _1412;
    float _1416 = _1236 * _1072;
    float _1418 = _1364 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1420 = fma(_1312, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1400);
    float _1422 = fma(_1184, _1342, _1404);
    float _1424 = _1232 * _1072;
    float _1426 = fma(_1418, _1408, -0.5);
    float _1428 = fma(_1226, _1066, _1414);
    float _1430 = fma(_1242, _1066, _1416);
    float _1432 = _796 + _1420;
    float _1434 = fma(_1410, _1398, -0.5);
    float _1436 = fma(_1156, _1330, _1422);
    bool _1438 = _1402 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1440 = fma(_1256, _1066, _1424);
    float _1442 = fma(_918, _1426, _924);
    float _1444 = fma(_1230, _1178, _1428);
    float _1446 = fma(_1252, _1178, _1430);
    float _1448 = fma(_886, _1434, _910);
    float _1450 = fma(_1278, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1436);
    float _1452 = fma(_1244, _1178, _1440);
    float _1454 = _1426;
    float _1456 = _1448;
    if (!_1438)
    {
        _1454 = _1432;
    }
    float _1458 = _1454;
    bool _1460 = !_1438;
    float _1462 = _1458;
    if (!_1460)
    {
        float _1464 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1466 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1468 = _1402 + _1466;
        float _1470 = _1432 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1472 = rsqrt(_1378);
        float _1474 = _1468 * _1464;
        float _1476 = _1474 * 0.15915493667125701904296875;
        float _1478 = _1476 * 6.283185482025146484375;
        float _1480 = sin(_1478);
        float _1482 = _1476 * 6.283185482025146484375;
        float _1484 = cos(_1482);
        float _1486 = fma(_1480, _1470, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1488 = _1472 * _1486;
        float _1490 = _1484 + (-1.0);
        float _1492 = fma(_1356, _1488, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1494 = fma(_1360, _1488, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1496 = _1490 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1498 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1500 = _1492 + _1498;
        float _1502 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1504 = _1494 + _1502;
        float _1506 = fma(_1432, _1484, _1496);
        float _1508 = _1500 * _1500;
        float _1510 = _1504 * _1504;
        _1462 = _1506;
        _1386 = _1508;
        _1388 = _1510;
        _1390 = _1492;
        _1392 = _1494;
    }
    float _1512 = _1462;
    float _1514 = _1386;
    float _1516 = _1388;
    float _1518 = _1390;
    float _1520 = _1392;
    float _1522 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1524 = _1512 + _1522;
    float _1526 = in.m_65.w;
    float _1528 = _1446 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1530 = fma(_1524, _1524, _1514);
    float _1532 = _1446 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1534 = _1530 + _1516;
    float _1536 = _1446 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1538 = fma(_1444, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1528);
    float _1540 = fma(_1444, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1532);
    float _1542 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1544 = fma(_1444, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1536);
    float _1546 = sqrt(_1534);
    float _1548 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1550 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1552 = fma(_1452, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1538);
    float _1554 = _1192 + 0.5;
    float _1556 = fma(_1452, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1540);
    float _1558 = _1542 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1560 = _1548 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1562 = _1550 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1564 = _1374 + 0.5;
    float _1566 = _1448 + 0.5;
    float _1568 = _1442 + 0.5;
    float _1570 = _1450 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1572 = fma(_1452, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1544);
    out.m_67.w = _1526;
    bool _1574 = _1546 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1576 = isnan(_1546);
    bool _1578 = _1574 || _1576;
    bool _1580 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1582 = _1578 || _1580;
    out.m_69.x = _1566;
    out.m_69.y = _1564;
    out.m_69.z = _1568;
    out.m_69.w = _1554;
    out.m_71.x = _1558;
    out.m_71.y = _1560;
    out.m_71.z = _1562;
    out.m_71.w = _1570;
    out.m_73.x = _1552;
    out.m_73.y = _1556;
    out.m_73.z = _1572;
    if (!_1582)
    {
        _1456 = 1.0;
    }
    float _1584 = _1456;
    bool _1586 = !_1582;
    float _1588 = _1584;
    if (!_1586)
    {
        bool _1590 = _1546 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1592 = isnan(_1546);
        bool _1594 = _1590 || _1592;
        bool _1596 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1598 = _1594 || _1596;
        if (!_1598)
        {
            float _1600 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1602 = _1546 + _1600;
            float _1604 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1606 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1604;
            float _1608 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1610 = _1608 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1612 = 1.0 / _1606;
            float _1614 = _1602 * _1612;
            float _1616 = fma(_1614, _1610, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1588 = _1616;
            _1618 = true;
        }
        else
        {
            bool _1620 = _1546 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1622 = isnan(_1546);
            bool _1624 = _1620 || _1622;
            bool _1626 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1628 = _1624 || _1626;
            if (!_1628)
            {
                float _1630 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1632 = _1546 + _1630;
                float _1634 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1636 = _1634 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1638 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1640 = _1638 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1642 = 1.0 / _1636;
                float _1644 = _1632 * _1642;
                float _1646 = fma(_1644, _1640, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1588 = _1646;
                _1618 = true;
            }
            else
            {
                _1588 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1618 = false;
    float _1648 = _1588;
    float _1650 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1652 = _1518 + _1650;
    float _1654 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1656 = _1512 + _1654;
    float _1658 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1660 = _1520 + _1658;
    bool _1662 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1664 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1666 = _1662 || _1664;
    bool _1668 = isnan(0.5);
    bool _1670 = _1666 || _1668;
    float _1672 = fma(_1652, _1648, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1674 = -_976;
    float _1676 = fma(_1674, (*spvDescriptorSet0.vp_c9)._m0[18].w, _798);
    float _1678 = fma(_1656, _1648, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1680 = fma(_1660, _1648, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1682 = -_976;
    float _1684 = fma(_1682, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1672);
    float _1686 = -_972;
    float _1688 = fma(_1686, (*spvDescriptorSet0.vp_c9)._m0[18].w, _796);
    float _1690 = -_972;
    float _1692 = fma(_1690, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1678);
    float _1694 = -_1034;
    float _1696 = fma(_1694, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1680);
    float _1698 = -_1034;
    float _1700 = fma(_1698, (*spvDescriptorSet0.vp_c9)._m0[18].w, _836);
    float _1702 = _1692;
    float _1704 = _1696;
    float _1706 = _1684;
    float _1708 = _1700;
    if (_1670)
    {
        _1062 = _1684;
    }
    float _1710 = _1062;
    float _1712 = _1710;
    if (!_1670)
    {
        float _1714 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1716 = _1688 + _1714;
        float _1718 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1720 = _1676 + _1718;
        float _1722 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1724 = -_836;
        float _1726 = _1724 + _1680;
        float _1728 = _1716 * _1716;
        float _1730 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1732 = _1700 + _1730;
        float _1734 = fma(_1720, _1720, _1728);
        float _1736 = 1.0 / _1150;
        float _1738 = fma(_1732, _1732, _1734);
        float _1740 = sqrt(_1738);
        float _1742 = precise::min(_1740, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1744 = _1742 * _1722;
        float _1746 = -_798;
        float _1748 = _1746 + _1672;
        float _1750 = _1744 * _1736;
        float _1752 = -_796;
        float _1754 = _1752 + _1678;
        float _1756 = fma(_1748, _1750, _1676);
        float _1758 = fma(_1754, _1750, _1688);
        float _1760 = fma(_1726, _1750, _1700);
        _1702 = _1758;
        _1712 = _1756;
        _1704 = _1760;
        _1706 = _1750;
    }
    float _1762 = _1702;
    float _1764 = _1712;
    float _1766 = _1704;
    float _1768 = _1706;
    float _1770 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1772 = _1762 + _1770;
    float _1774 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1776 = _1764 + _1774;
    float _1778 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1780 = _1766 + _1778;
    float _1782 = _1772 * _1772;
    float _1784 = fma(_1776, _1776, _1782);
    float _1786 = fma(_1780, _1780, _1784);
    float _1788 = rsqrt(_1786);
    float _1790 = sqrt(_1786);
    float _1792 = _1788 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1794 = _1776 * _1792;
    float _1796 = _1780 * _1792;
    float _1798 = _1794 * _1794;
    float _1800 = _1796 * _1796;
    float _1802 = _1798 + _1800;
    float _1804 = sqrt(_1802);
    bool _1806 = _1804 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1808 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1810 = _1804 + _1808;
    float _1812 = _1784;
    float _1814 = _1810;
    float _1816 = _1768;
    float _1818 = _1792;
    float _1820 = _1794;
    if (_1806)
    {
        float _1822 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1812 = _1822;
    }
    float _1824 = _1812;
    if (_1806)
    {
        float _1826 = rsqrt(_1802);
        _932 = _1826;
    }
    float _1828 = _932;
    float _1830 = _1828;
    if (_1806)
    {
        float _1832 = _1810 * _1824;
        _1814 = _1832;
    }
    float _1834 = _1814;
    if (_1806)
    {
        float _1836 = _1834 * 0.15915493667125701904296875;
        _1816 = _1836;
    }
    float _1838 = _1816;
    float _1840 = _1824;
    float _1842 = _1838;
    if (_1806)
    {
        float _1844 = _1838 * 6.283185482025146484375;
        float _1846 = sin(_1844);
        _1840 = _1846;
    }
    float _1848 = _1840;
    float _1850 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1852 = precise::max(0.0, _1850);
    float _1854 = _1558;
    float _1856 = _1852;
    if (_1806)
    {
        float _1858 = _1838 * 6.283185482025146484375;
        float _1860 = cos(_1858);
        _1854 = _1860;
    }
    float _1862 = _1854;
    float _1864 = -_1792;
    float _1866 = -_1852;
    float _1868 = fma(_1772, _1864, _1866);
    if (_1806)
    {
        float _1870 = _1868 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1856 = _1870;
    }
    float _1872 = _1856;
    float _1874 = _1872;
    if (!_1806)
    {
        _1842 = _1798;
    }
    float _1876 = _1842;
    float _1878 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1880 = _1762 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1882 = _1848;
    float _1884 = _1876;
    if (_1806)
    {
        float _1886 = fma(_1848, _1872, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1882 = _1886;
    }
    float _1888 = _1882;
    float _1890 = _1888;
    if (_1806)
    {
        float _1892 = _1862 + (-1.0);
        _1874 = _1892;
    }
    float _1894 = _1874;
    float _1896 = _1894;
    if (_1806)
    {
        float _1898 = _1828 * _1888;
        _1394 = _1898;
    }
    float _1900 = _1394;
    if (!_1806)
    {
        _1830 = _1868;
    }
    float _1902 = _1830;
    float _1904 = _1902;
    if (_1806)
    {
        float _1906 = _1894 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1818 = _1906;
    }
    float _1908 = _1818;
    if (_1806)
    {
        float _1910 = _1794 * _1900;
        _1820 = _1910;
    }
    float _1912 = _1820;
    if (!_1806)
    {
        _1890 = _1796;
    }
    float _1914 = _1890;
    float _1916 = _1914;
    if (_1806)
    {
        float _1918 = _1796 * _1900;
        _1916 = _1918;
    }
    float _1920 = _1916;
    if (_1806)
    {
        float _1922 = fma(_1868, _1862, _1908);
        _1904 = _1922;
    }
    float _1924 = _1904;
    if (_1806)
    {
        float _1926 = _1912 * _1912;
        _1884 = _1926;
    }
    float _1928 = _1884;
    if (!_1806)
    {
        _1896 = _1800;
    }
    float _1930 = _1896;
    float _1932 = _1930;
    if (_1806)
    {
        float _1934 = _1920 * _1920;
        _1932 = _1934;
    }
    float _1936 = _1932;
    float _1938 = fma(_1924, _1924, _1928);
    float _1940 = _1762 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1942 = _1938 + _1936;
    float _1944 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1940);
    float _1946 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1948 = fma(_1790, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1946);
    float _1950 = precise::clamp(_1948, 0.0, 1.0);
    float _1952 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1880);
    float _1954 = rsqrt(_1942);
    float _1956 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1944);
    float _1958 = -_1950;
    float _1960 = _1958 + 1.0;
    float _1962 = _1762 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1964 = _1762 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1966 = _1956 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1968 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1952);
    float _1970 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1962);
    float _1972 = abs(_1960);
    float _1974 = log2(_1972);
    float _1976 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1964);
    float _1978 = _1966 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1980 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1970);
    float _1982 = _1968 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1984 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1976);
    float _1986 = -_1978;
    float _1988 = fma(_1986, _1878, 1.0);
    float _1990 = _1980 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1992 = _1954 * _1912;
    float _1994 = _1982 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1996 = _1954 * _1924;
    float _1998 = _1954 * _1920;
    float _2000 = _1992 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2002 = fma(_1990, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1994);
    float _2004 = _1984 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2006 = log2(_1988);
    float _2008 = _1974 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2010 = -_2000;
    float _2012 = fma(_1996, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2010);
    float _2014 = fma(_1966, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2002);
    float _2016 = _1982 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2018 = _1982 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2020 = -_1998;
    float _2022 = fma(_2020, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2012);
    float _2024 = fma(_2004, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2014);
    float _2026 = exp2(_2008);
    float _2028 = fma(_1990, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2016);
    float _2030 = fma(_2022, -0.5, 0.5);
    float _2032 = fma(_2022, 0.5, 0.5);
    float _2034 = fma(_1990, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2018);
    float _2036 = _1996 + 1.0;
    float _2038 = fma(_1966, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2028);
    float _2040 = fma(_2032, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2042 = 1.0 / _2024;
    float _2044 = fma(_1966, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2034);
    float _2046 = fma(_2004, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2038);
    float _2048 = _2006 * 0.693147182464599609375;
    float _2050 = fma(_2004, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2044);
    float _2052 = sqrt(_2030);
    float _2054 = -_1996;
    float _2056 = fma(_2026, _2036, _2054);
    float _2058 = fma(_2032, _2040, -0.212114393711090087890625);
    float _2060 = fma(_2032, _2058, 1.570728778839111328125);
    float _2062 = _2046 * _2042;
    float _2064 = _2050 * _2042;
    float _2066 = _2048 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2068 = fma(_2056, 0.5, 0.5);
    float _2070 = fma(_2062, 0.5, 0.5);
    float _2072 = fma(_2064, -0.5, 0.5);
    float _2074 = _2052 * 0.636619746685028076171875;
    float3 _5498 = float3(_2070, _2072, _2066);
    float _2076 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5498, float3(0.0), isnan(_5498)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5498, float3(0.0), isnan(_5498)), level(0.0)).x;
    float3 _5509 = float3(_2070, _2072, _2066);
    float4 _2079 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5509, float3(0.0), isnan(_5509)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5509, float3(0.0), isnan(_5509)), level(0.0)).xyzw;
    float _2081 = _2079.x;
    float _2083 = _2079.y;
    float _2085 = _2079.z;
    float _2087 = _2079.w;
    float _2089 = -_2060;
    float _2091 = fma(_2074, _2089, 1.0);
    float2 _5531 = float2(_2091, _2068);
    float3 _2095 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5531, float2(0.0), isnan(_5531)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5531, float2(0.0), isnan(_5531)), level(0.0)).xyz;
    float _2097 = _2095.x;
    float _2099 = _2095.y;
    float _2101 = _2095.z;
    float _2103 = _1688 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2105 = _1688 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    out.m_75.x = _1776;
    out.m_75.y = _1772;
    out.m_75.z = _1780;
    float _2107 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2103);
    float _2109 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2105);
    float _2111 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2107);
    float _2113 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2109);
    float _2115 = _2111 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2117 = _2113 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2119 = 1.0 / _2115;
    bool _2121 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2123 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2125 = _2121 || _2123;
    bool _2127 = isnan(0.5);
    bool _2129 = _2125 || _2127;
    float _2131 = _2117 + _2115;
    float _2133 = _2046 + _2024;
    float _2135 = _2133 * 0.5;
    float _2137 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (!_2129)
    {
        _1708 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2139 = _1708;
    float _2141 = _2131 * _2119;
    float _2143 = _2141 * 0.5;
    float _2145 = _1982 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2147 = _1974 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2149 = _2143;
    float _2151 = _2139;
    float _2153 = _2145;
    if (!_2129)
    {
        float _2155 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2157 = fma(_2143, _2139, _2155);
        _2149 = _2157;
    }
    float _2159 = _2149;
    if (!_2129)
    {
        _2151 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2161 = _2151;
    float _2163 = fma(_1990, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2145);
    float _2165 = _2161;
    if (_2129)
    {
        _2153 = 1.0;
    }
    float _2167 = _2153;
    float _2169 = exp2(_2147);
    float _2171 = _2167;
    if (!_2129)
    {
        float _2173 = -_2161;
        float _2175 = _2173 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2137 = _2175;
    }
    float _2177 = _2137;
    float _2179 = fma(_1966, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2163);
    float _2181 = fma(_2004, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2179);
    float _2183 = _2159;
    if (!_2129)
    {
        float _2185 = 1.0 / _2159;
        _2183 = _2185;
    }
    float _2187 = _2183;
    float _2189 = _2181 + _2024;
    out.gl_Position.x = _2046;
    out.gl_Position.y = _2050;
    out.gl_Position.z = _2181;
    out.gl_Position.w = _2024;
    float _2191 = _2189 * 0.5;
    float _2193 = _2177;
    if (!_2129)
    {
        float _2195 = 1.0 / _2177;
        _2193 = _2195;
    }
    float _2197 = _2193;
    float _2199 = -_2169;
    float _2201 = _2199 + 1.0;
    float _2203 = _2201 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_2129)
    {
        float _2205 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2207 = -_2161;
        float _2209 = fma(_2187, _2205, _2207);
        _2165 = _2209;
    }
    float _2211 = _2165;
    if (!_2129)
    {
        float _2213 = _2211 * _2197;
        float _2215 = precise::clamp(_2213, 0.0, 1.0);
        _2171 = _2215;
    }
    float _2217 = _2171;
    float _2219 = _2024 * 0.5;
    float _2221 = _2217 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2223 = _2217 > 0.0;
    bool _2225 = isnan(_2217);
    bool _2227 = _2223 || _2225;
    bool _2229 = isnan(0.0);
    bool _2231 = _2227 || _2229;
    float _2233 = -_2203;
    float _2235 = _2233 + 1.0;
    float _2237 = fma(_2050, -0.5, _2219);
    float _2239 = _2221 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_77.x = _2135;
    out.m_77.y = _2237;
    out.m_77.z = _2191;
    out.m_77.w = _2024;
    out.m_47.x = _2239;
    float _2241 = _2203 * _2076;
    float _2243 = _2087 * _2235;
    float _2245 = _2087 * _2241;
    float _2247 = _2101 * _2241;
    float _2249 = fma(_2097, _2245, _2081);
    float _2251 = fma(_2099, _2245, _2083);
    float _2253 = fma(_2087, _2247, _2085);
    out.m_79.x = _2249;
    out.m_79.y = _2251;
    out.m_79.z = _2253;
    out.m_79.w = _2243;
    if (_2231)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2255 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2255;
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
    bool _1618 = false;
    bool _532 = false;
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
        float _2312 = as_type<float>(_114);
        out.gl_Position.z = _2312;
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
        float _2382 = as_type<float>(_152);
        out.gl_Position.z = _2382;
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
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _336 = _304 + _334;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _340 = _326 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _342 = _328 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _344 = 1.0 / _320;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _348 = _304 + _346;
    float _350 = _336 * _322;
    bool _352 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _354 = isnan(_304);
    bool _356 = _352 || _354;
    bool _358 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _360 = _356 || _358;
    float _362 = float(_360);
    out.m_55.x = _330;
    out.m_55.y = _340;
    out.m_55.z = _342;
    out.m_55.w = _338;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _364;
    bool _368 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _370 = _348 * _332;
    bool _372 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _374 = isnan(_304);
    bool _376 = _372 || _374;
    bool _378 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _380 = _376 || _378;
    float _382 = float(_380);
    float _384 = -_362;
    float _386 = _384 + 1.0;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _388;
    float _392 = fma(_366, _350, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _394 = _382 * _386;
    float _396 = -_382;
    float _398 = _396 + 1.0;
    float _400 = _308 * _344;
    bool _402 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _404 = isnan(_304);
    bool _406 = _402 || _404;
    bool _408 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _410 = _406 || _408;
    float _412 = float(_410);
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _414;
    bool _418 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _420 = isnan(_304);
    bool _422 = _418 || _420;
    bool _424 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _426 = _422 || _424;
    float _428 = float(_426);
    float _430 = fma(_390, _350, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _434 = _432 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _436 = -_412;
    float _438 = _436 + 1.0;
    float _440 = _412 * _398;
    float _442 = fma(_416, _350, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _444 = _428 * _438;
    float _446 = -_428;
    float _448 = _446 + 1.0;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _452 = _450 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _456 = _454 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _458 = _430 * _444;
    float _460 = _392 * _444;
    float _462 = _442 * _444;
    float _464 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[143].y, _458);
    float _466 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[143].x, _460);
    float _468 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[143].z, _462);
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _470;
    float _474 = fma(_434, _370, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _476 = fma(_452, _370, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _478 = fma(_456, _370, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _480;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _484;
    float _488 = fma(_474, _440, _466);
    float _490 = fma(_472, _400, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _492 = fma(_482, _400, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _494 = fma(_486, _400, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _496 = fma(_476, _440, _464);
    float _498 = fma(_478, _440, _468);
    float _500 = fma(_490, _394, _488);
    float _502 = fma(_492, _394, _496);
    float _504 = fma(_494, _394, _498);
    float _506 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[146].x, _500);
    float _508 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[146].y, _502);
    float _510 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[146].z, _504);
    bool _512 = !_368;
    float _530;
    if (!_512)
    {
        float _514 = in.m_53.x;
        float _516 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _518 = _514 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _520 = fma(_518, (*spvDescriptorSet0.vp_c9)._m0[11].w, _132);
        float _522 = _520 * _516;
        float _524 = floor(_522);
        float _526 = -_524;
        float _528 = _522 + _526;
        _530 = _528;
        _532 = true;
    }
    else
    {
        float _534 = float(_98);
        float _536 = 1.0 / _534;
        float _538 = _132 * _536;
        _530 = _538;
    }
    _532 = false;
    float _540 = _530;
    float _542 = in.m_53.z;
    float _544 = _272 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _546 = in.m_53.x;
    int _548 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _550 = _548 != 0;
    float _552 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[5].x, _544);
    float _554 = in.m_53.y;
    float _556 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _558 = log2(_556);
    float _560 = in.m_53.w;
    float _562 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _570 = _540 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _572 = isnan(_540);
    bool _574 = _570 || _572;
    bool _576 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _578 = _574 || _576;
    float _580 = float(_578);
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _584 = _582 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _586 = _542 * 2.0;
    float _588 = 1.0 / _568;
    float _590 = _546 * 2.0;
    float _592 = _554 * 2.0;
    float _594 = floor(_586);
    float _596 = fma(_554, (*spvDescriptorSet0.vp_c9)._m0[78].w, _564);
    float _598 = floor(_590);
    float _600 = floor(_592);
    bool _602 = _594 > 0.0;
    bool _604 = _594 >= 0.0;
    bool _606 = isnan(_594);
    bool _608 = _604 || _606;
    bool _610 = isnan(0.0);
    bool _612 = _608 || _610;
    float _614 = _612 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _616 = 1.0 / _584;
    bool _618 = _598 >= 0.0;
    bool _620 = isnan(_598);
    bool _622 = _618 || _620;
    bool _624 = isnan(0.0);
    bool _626 = _622 || _624;
    bool _628 = _598 > 0.0;
    float _630 = _626 ? 0.0 : 1.4012984643248170709237295832899e-45;
    int _632 = ~as_type<int>(_614);
    int _634 = _632 + 1;
    int _636 = _634 + 1;
    bool _638 = _600 >= 0.0;
    bool _640 = isnan(_600);
    bool _642 = _638 || _640;
    bool _644 = isnan(0.0);
    bool _646 = _642 || _644;
    bool _648 = _600 > 0.0;
    float _650 = _646 ? 0.0 : 1.4012984643248170709237295832899e-45;
    int _652 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _654 = _652 != 0;
    int _656 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _658 = _656 != 0;
    int _660 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _662 = _660 != 0;
    float _664 = in.m_51.x;
    float _666 = in.m_51.y;
    float _668 = in.m_51.z;
    int _670 = ~as_type<int>(_630);
    int _672 = _670 + 1;
    int _674 = _672 + 1;
    int _676 = ~as_type<int>(_650);
    int _678 = _676 + 1;
    int _680 = _678 + 1;
    int _682 = _636;
    int _684 = _674;
    int _686 = _680;
    float _688 = _630;
    float _690 = _650;
    float _692 = _614;
    if (!_602)
    {
        int _694 = ~as_type<int>(_614);
        int _696 = _694 + 1;
        _682 = _696;
    }
    int _698 = _682;
    if (!_628)
    {
        int _700 = ~as_type<int>(_630);
        int _702 = _700 + 1;
        _684 = _702;
    }
    int _704 = _684;
    if (!_648)
    {
        int _706 = ~as_type<int>(_650);
        int _708 = _706 + 1;
        _686 = _708;
    }
    int _710 = _686;
    if (!_550)
    {
        _688 = _554;
    }
    float _712 = _688;
    float _714 = _712;
    if (!_550)
    {
        _690 = _542;
    }
    float _716 = _690;
    float _718 = _716;
    if (!_550)
    {
        _692 = _542;
    }
    float _720 = _692;
    float _722 = _720;
    if (_550)
    {
        _714 = _546;
    }
    float _724 = _714;
    if (_550)
    {
        _718 = _554;
    }
    float _726 = _718;
    if (_550)
    {
        _722 = _554;
    }
    float _728 = _722;
    int _730 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _732 = _730 != 0;
    float _734 = _508 * _666;
    int _736 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _738 = _736 != 0;
    float _740 = _506 * _664;
    int _742 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _744 = _742 != 0;
    float _746 = _554 + _542;
    int _748 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _750 = _748 != 0;
    float _752 = _272 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _754 = !_654;
    int _756 = _754 ? 0 : 1;
    float _758 = _272 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _760 = _560 > 0.5;
    float _762 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[4].x, _752);
    float _764 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[6].x, _758);
    float _766 = _546 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _768 = _546 + _554;
    float _770 = _510 * _668;
    float _772 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _774 = _554 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _776 = _746 + (-1.0);
    float _778 = -_772;
    float _780 = fma(_766, 2.0, _778);
    float _782 = _768 + (-1.0);
    float _784 = fma(_774, -2.0, _562);
    float _786 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[4].z, _762);
    float _788 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[5].z, _552);
    float _790 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[6].z, _764);
    float _792 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _794 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _796 = _788 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _798 = _786 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _800 = abs(_756);
    float _802 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _804 = _724 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _806 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _808 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _810 = _796 + _808;
    float _812 = -_806;
    float _814 = fma(_804, 2.0, _812);
    float _816 = _558 * _132;
    float _818 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _820 = !_658;
    int _822 = _820 ? 0 : 1;
    float _824 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _826 = !_662;
    int _828 = _826 ? 0 : 1;
    float _830 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[83].w, _818);
    float _832 = exp2(_816);
    float _834 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[83].z, _824);
    float _836 = _790 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _838 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _840 = isnan(1.0);
    bool _842 = _838 || _840;
    bool _844 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _846 = _842 || _844;
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _850 = 1.0 + _848;
    float _852 = float(_800);
    float _854 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _856 = float(_698);
    float _858 = 1.0 / _850;
    float _860 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _862 = _798 + _860;
    float _864 = fma(_546, (*spvDescriptorSet0.vp_c9)._m0[78].z, _854);
    float _866 = _726 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _868 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _870 = isnan(0.0);
    bool _872 = _868 || _870;
    bool _874 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _876 = _872 || _874;
    float _878 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _880 = _836 + _878;
    float _882 = -_832;
    float _884 = _882 + 1.0;
    float _886 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].z, _864);
    float _888 = _852 * _856;
    int _890 = abs(_822);
    float _892 = _810 * _810;
    float _894 = fma(_866, -2.0, _802);
    float _896 = in.m_57.x;
    float _898 = in.m_57.y;
    float _900 = in.m_57.z;
    float _902 = _876 ? _884 : 0.0;
    float _904 = fma(_862, _862, _892);
    float _906 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].w, _596);
    float _908 = -_132;
    float _910 = fma(_908, (*spvDescriptorSet0.vp_c9)._m0[76].x, _780);
    float _912 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[76].y, _784);
    float _914 = fma(_880, _880, _904);
    float _916 = float(_890);
    float _918 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].z, _834);
    float _920 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].w, _830);
    float _922 = -_132;
    float _924 = fma(_922, (*spvDescriptorSet0.vp_c9)._m0[81].x, _814);
    float _926 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[81].y, _894);
    bool _928 = _760;
    bool _930 = _744;
    float _932 = _798;
    if (_846)
    {
        float _934 = _902 * _858;
        _134 = _934;
    }
    float _936 = _134;
    float _938 = rsqrt(_914);
    float _940 = in.m_59.x;
    float _942 = in.m_59.y;
    float _944 = in.m_59.z;
    float _946 = float(_704);
    float _948 = _770 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _950 = abs(_828);
    float _952 = float(_710);
    float _954 = _916 * _946;
    float _956 = float(_950);
    float _958 = _888 * (-2.0);
    bool _960 = _554 > 0.5;
    float _962 = _954 * (-2.0);
    float _964 = _554 + (-0.5);
    float _966 = fma(_958, _896, _896);
    float _968 = _956 * _952;
    float _970 = fma(_794, _958, _794);
    float _972 = _810 * _938;
    float _974 = fma(_792, _962, _792);
    float _976 = _862 * _938;
    float _978 = in.m_61.x;
    float _980 = in.m_61.y;
    float _982 = in.m_61.z;
    float _984 = -_972;
    float _986 = fma(_984, (*spvDescriptorSet0.vp_c9)._m0[18].w, _810);
    float _988 = fma(_962, _898, _898);
    float _990 = -_976;
    float _992 = fma(_990, (*spvDescriptorSet0.vp_c9)._m0[18].w, _862);
    float _994 = in.m_63.y;
    float _996 = _986 * _986;
    bool _998 = _942 != 0.0;
    bool _1000 = isnan(_942);
    bool _1002 = _998 || _1000;
    bool _1004 = isnan(0.0);
    bool _1006 = _1002 || _1004;
    float _1008 = _968 * (-2.0);
    float _1010 = fma(_992, _992, _996);
    bool _1012 = _940 == 0.0;
    bool _1014 = !_1006;
    bool _1016 = _1012 && _1014;
    float _1018 = _546 + (-0.5);
    float _1020 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[196].y, _988);
    float _1022 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1024 = _1022 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1026 = _944 == 0.0;
    bool _1028 = _1026 && _1016;
    float _1030 = fma(_1018, (*spvDescriptorSet0.vp_c9)._m0[196].x, _966);
    float _1032 = _546 + _542;
    float _1034 = _880 * _938;
    float _1036 = fma(_1008, _900, _900);
    float _1038 = fma(_970, _936, _1030);
    float _1040 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _942);
    float _1042 = -_1034;
    float _1044 = fma(_1042, (*spvDescriptorSet0.vp_c9)._m0[18].w, _880);
    float _1046 = 1.0 / _1024;
    float _1048 = _1038 * 0.15915493667125701904296875;
    float _1050 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _940);
    float _1052 = fma(_1044, _1044, _1010);
    float _1054 = fma(_974, _936, _1020);
    float _1056 = _978;
    float _1058 = _980;
    float _1060 = _982;
    float _1062 = _972;
    if (!_1028)
    {
        float _1064 = fma(_940, (*spvDescriptorSet0.vp_c9)._m0[17].y, _978);
        _1056 = _1064;
    }
    float _1066 = _1056;
    float _1068 = _1032 + (-1.0);
    if (!_1028)
    {
        float _1070 = fma(_942, (*spvDescriptorSet0.vp_c9)._m0[17].y, _980);
        _1058 = _1070;
    }
    float _1072 = _1058;
    float _1074 = _542 + (-0.5);
    float _1076 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1078 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1080 = -_994;
    float _1082 = _1080 + 1.0;
    float _1084 = fma(_1074, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1036);
    float _1086 = fma(_1078, _1008, _1078);
    float _1088 = _1054 * 0.15915493667125701904296875;
    int _1090 = _760 ? as_type<int>(_1082) : as_type<int>(_994);
    float _1092 = sqrt(_1052);
    float _1094 = fma(_1086, _936, _1084);
    float _1096 = _994;
    if (_732)
    {
        bool _1098 = _546 > 0.5;
        _928 = _1098;
    }
    bool _1100 = _928;
    float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1104 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1102;
    float _1106 = _744 ? as_type<float>(_1090) : _994;
    float _1108 = _1094 * 0.15915493667125701904296875;
    if (_738)
    {
        bool _1110 = _542 > 0.5;
        _930 = _1110;
    }
    bool _1112 = _930;
    float _1114 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1116 = _1114 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1118 = _1048 * 6.283185482025146484375;
    float _1120 = sin(_1118);
    float _1122 = _1104 * _1046;
    float _1124 = _1116 * _588;
    float _1126 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1128 = _540 + _1126;
    float _1130 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1132 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1130;
    float _1134 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1136 = _540 + _1134;
    if (_750)
    {
        float _1138 = _960 ? _1082 : _994;
        _1096 = _1138;
    }
    float _1140 = _1096;
    float _1142 = fma(_1122, _1128, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1144 = _1048 * 6.283185482025146484375;
    float _1146 = cos(_1144);
    float _1148 = _1132 * _616;
    float _1150 = _938 * _1092;
    float _1152 = _734 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1154 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _944);
    float _1156 = fma(_1148, _1136, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1158 = _1076 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1160 = _740 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1162 = _1088 * 6.283185482025146484375;
    float _1164 = sin(_1162);
    float _1166 = _948 * _1150;
    float _1168 = fma(_1106, _1158, -0.5);
    float _1170 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1172 = _540 + _1170;
    float _1174 = _1172;
    if (!_1028)
    {
        float _1176 = fma(_944, (*spvDescriptorSet0.vp_c9)._m0[17].y, _982);
        _1060 = _1176;
    }
    float _1178 = _1060;
    float _1180 = _1166 * _1154;
    float _1182 = in.m_63.x;
    float _1184 = fma(_1124, _1172, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1186 = _1088 * 6.283185482025146484375;
    float _1188 = cos(_1186);
    float _1190 = -_926;
    float _1192 = fma(_920, _1168, _1190);
    float _1194 = _1108 * 6.283185482025146484375;
    float _1196 = cos(_1194);
    float _1198 = _1120 * _1164;
    float _1200 = _1108 * 6.283185482025146484375;
    float _1202 = sin(_1200);
    float _1204 = _1120 * _1188;
    float _1206 = _1146 * _1188;
    int _1208 = 0;
    float _1210 = _1182;
    if (_732)
    {
        float _1212 = -_1182;
        float _1214 = _1212 + 1.0;
        _1208 = as_type<int>(_1214);
    }
    int _1216 = _1208;
    int _1218 = 0;
    if (_738)
    {
        float _1220 = -_1182;
        float _1222 = _1220 + 1.0;
        _1218 = as_type<int>(_1222);
    }
    int _1224 = _1218;
    float _1226 = _1188 * _1196;
    float _1228 = _1146 * _1164;
    float _1230 = _1164 * _1196;
    float _1232 = _1120 * _1196;
    float _1234 = _1152 * _1150;
    float _1236 = _1146 * _1196;
    if (!_732)
    {
        _1174 = _1182;
    }
    float _1238 = _1174;
    float _1240 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1242 = fma(_1202, _1206, _1198);
    float _1244 = fma(_1202, _1198, _1206);
    float _1246 = _1160 * _1150;
    float _1248 = _1234 * _1040;
    float _1250 = -_1204;
    float _1252 = fma(_1202, _1228, _1250);
    float _1254 = -_1228;
    float _1256 = fma(_1202, _1204, _1254);
    float _1258 = _1246 * _1050;
    float _1260 = _1236 * _1248;
    float _1262 = -_1248;
    float _1264 = _1202 * _1262;
    float _1266 = _1232 * _1248;
    bool _1268 = _540 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1270 = isnan(_540);
    bool _1272 = _1268 || _1270;
    bool _1274 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1276 = _1272 || _1274;
    float _1278 = float(_1276);
    float _1280 = fma(_1242, _1258, _1260);
    float _1282 = fma(_1226, _1258, _1264);
    float _1284 = fma(_1256, _1258, _1266);
    float _1286 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1288 = fma(_1252, _1180, _1280);
    float _1290 = fma(_1230, _1180, _1282);
    bool _1292 = _540 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1294 = isnan(_540);
    bool _1296 = _1292 || _1294;
    bool _1298 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1300 = _1296 || _1298;
    float _1302 = float(_1300);
    float _1304 = -_1278;
    float _1306 = _1304 + 1.0;
    float _1308 = _1288 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1310 = _1288 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1312 = fma(_1244, _1180, _1284);
    bool _1314 = _540 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1316 = isnan(_540);
    bool _1318 = _1314 || _1316;
    bool _1320 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1322 = _1318 || _1320;
    float _1324 = float(_1322);
    float _1326 = fma(_1290, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1308);
    float _1328 = fma(_1290, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1310);
    float _1330 = _1302 * _1306;
    float _1332 = -_1302;
    float _1334 = _1332 + 1.0;
    float _1336 = fma(_1312, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1326);
    float _1338 = fma(_1312, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1328);
    float _1340 = _1240 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1342 = _1324 * _1334;
    float _1344 = _798 + _1336;
    float _1346 = _836 + _1338;
    float _1348 = -_1324;
    float _1350 = _1348 + 1.0;
    float _1352 = fma(_1340, _1140, -0.5);
    float _1354 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1356 = _1344 + _1354;
    float _1358 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1360 = _1346 + _1358;
    float _1362 = _580 * _1350;
    float _1364 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1366 = _1356 * _1356;
    float _1368 = _1360 * _1360;
    float _1370 = _1142 * _1362;
    float _1372 = -_912;
    float _1374 = fma(_906, _1352, _1372);
    float _1376 = _1288 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1378 = _1366 + _1368;
    float _1380 = -_580;
    float _1382 = _1380 + 1.0;
    float _1384 = _1238;
    float _1386 = _1366;
    float _1388 = _1368;
    float _1390 = _1344;
    float _1392 = _1346;
    float _1394 = _1374;
    if (_732)
    {
        float _1396 = _1100 ? as_type<float>(_1216) : _1182;
        _1384 = _1396;
    }
    float _1398 = _1384;
    float _1400 = fma(_1290, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1376);
    float _1402 = sqrt(_1378);
    float _1404 = fma(_1382, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1370);
    if (_738)
    {
        float _1406 = _1112 ? as_type<float>(_1224) : _1182;
        _1210 = _1406;
    }
    float _1408 = _1210;
    float _1410 = _1286 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1412 = -_1072;
    float _1414 = _1202 * _1412;
    float _1416 = _1236 * _1072;
    float _1418 = _1364 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1420 = fma(_1312, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1400);
    float _1422 = fma(_1184, _1342, _1404);
    float _1424 = _1232 * _1072;
    float _1426 = fma(_1418, _1408, -0.5);
    float _1428 = fma(_1226, _1066, _1414);
    float _1430 = fma(_1242, _1066, _1416);
    float _1432 = _796 + _1420;
    float _1434 = fma(_1410, _1398, -0.5);
    float _1436 = fma(_1156, _1330, _1422);
    bool _1438 = _1402 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1440 = fma(_1256, _1066, _1424);
    float _1442 = fma(_918, _1426, _924);
    float _1444 = fma(_1230, _1178, _1428);
    float _1446 = fma(_1252, _1178, _1430);
    float _1448 = fma(_886, _1434, _910);
    float _1450 = fma(_1278, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1436);
    float _1452 = fma(_1244, _1178, _1440);
    float _1454 = _1426;
    float _1456 = _1448;
    if (!_1438)
    {
        _1454 = _1432;
    }
    float _1458 = _1454;
    bool _1460 = !_1438;
    float _1462 = _1458;
    if (!_1460)
    {
        float _1464 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1466 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1468 = _1402 + _1466;
        float _1470 = _1432 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1472 = rsqrt(_1378);
        float _1474 = _1468 * _1464;
        float _1476 = _1474 * 0.15915493667125701904296875;
        float _1478 = _1476 * 6.283185482025146484375;
        float _1480 = sin(_1478);
        float _1482 = _1476 * 6.283185482025146484375;
        float _1484 = cos(_1482);
        float _1486 = fma(_1480, _1470, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1488 = _1472 * _1486;
        float _1490 = _1484 + (-1.0);
        float _1492 = fma(_1356, _1488, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1494 = fma(_1360, _1488, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1496 = _1490 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1498 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1500 = _1492 + _1498;
        float _1502 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1504 = _1494 + _1502;
        float _1506 = fma(_1432, _1484, _1496);
        float _1508 = _1500 * _1500;
        float _1510 = _1504 * _1504;
        _1462 = _1506;
        _1386 = _1508;
        _1388 = _1510;
        _1390 = _1492;
        _1392 = _1494;
    }
    float _1512 = _1462;
    float _1514 = _1386;
    float _1516 = _1388;
    float _1518 = _1390;
    float _1520 = _1392;
    float _1522 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1524 = _1512 + _1522;
    float _1526 = in.m_65.w;
    float _1528 = _1446 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1530 = fma(_1524, _1524, _1514);
    float _1532 = _1446 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1534 = _1530 + _1516;
    float _1536 = _1446 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1538 = fma(_1444, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1528);
    float _1540 = fma(_1444, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1532);
    float _1542 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1544 = fma(_1444, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1536);
    float _1546 = sqrt(_1534);
    float _1548 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1550 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1552 = fma(_1452, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1538);
    float _1554 = _1192 + 0.5;
    float _1556 = fma(_1452, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1540);
    float _1558 = _1542 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1560 = _1548 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1562 = _1550 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1564 = _1374 + 0.5;
    float _1566 = _1448 + 0.5;
    float _1568 = _1442 + 0.5;
    float _1570 = _1450 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1572 = fma(_1452, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1544);
    out.m_67.w = _1526;
    bool _1574 = _1546 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1576 = isnan(_1546);
    bool _1578 = _1574 || _1576;
    bool _1580 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1582 = _1578 || _1580;
    out.m_69.x = _1566;
    out.m_69.y = _1564;
    out.m_69.z = _1568;
    out.m_69.w = _1554;
    out.m_71.x = _1558;
    out.m_71.y = _1560;
    out.m_71.z = _1562;
    out.m_71.w = _1570;
    out.m_73.x = _1552;
    out.m_73.y = _1556;
    out.m_73.z = _1572;
    if (!_1582)
    {
        _1456 = 1.0;
    }
    float _1584 = _1456;
    bool _1586 = !_1582;
    float _1588 = _1584;
    if (!_1586)
    {
        bool _1590 = _1546 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1592 = isnan(_1546);
        bool _1594 = _1590 || _1592;
        bool _1596 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1598 = _1594 || _1596;
        if (!_1598)
        {
            float _1600 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1602 = _1546 + _1600;
            float _1604 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1606 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1604;
            float _1608 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1610 = _1608 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1612 = 1.0 / _1606;
            float _1614 = _1602 * _1612;
            float _1616 = fma(_1614, _1610, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1588 = _1616;
            _1618 = true;
        }
        else
        {
            bool _1620 = _1546 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1622 = isnan(_1546);
            bool _1624 = _1620 || _1622;
            bool _1626 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1628 = _1624 || _1626;
            if (!_1628)
            {
                float _1630 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1632 = _1546 + _1630;
                float _1634 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1636 = _1634 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1638 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1640 = _1638 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1642 = 1.0 / _1636;
                float _1644 = _1632 * _1642;
                float _1646 = fma(_1644, _1640, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1588 = _1646;
                _1618 = true;
            }
            else
            {
                _1588 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1618 = false;
    float _1648 = _1588;
    float _1650 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1652 = _1518 + _1650;
    float _1654 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1656 = _1512 + _1654;
    float _1658 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1660 = _1520 + _1658;
    bool _1662 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1664 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1666 = _1662 || _1664;
    bool _1668 = isnan(0.5);
    bool _1670 = _1666 || _1668;
    float _1672 = fma(_1652, _1648, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1674 = -_976;
    float _1676 = fma(_1674, (*spvDescriptorSet0.vp_c9)._m0[18].w, _798);
    float _1678 = fma(_1656, _1648, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1680 = fma(_1660, _1648, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1682 = -_976;
    float _1684 = fma(_1682, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1672);
    float _1686 = -_972;
    float _1688 = fma(_1686, (*spvDescriptorSet0.vp_c9)._m0[18].w, _796);
    float _1690 = -_972;
    float _1692 = fma(_1690, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1678);
    float _1694 = -_1034;
    float _1696 = fma(_1694, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1680);
    float _1698 = -_1034;
    float _1700 = fma(_1698, (*spvDescriptorSet0.vp_c9)._m0[18].w, _836);
    float _1702 = _1692;
    float _1704 = _1696;
    float _1706 = _1684;
    float _1708 = _1700;
    if (_1670)
    {
        _1062 = _1684;
    }
    float _1710 = _1062;
    float _1712 = _1710;
    if (!_1670)
    {
        float _1714 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1716 = _1688 + _1714;
        float _1718 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1720 = _1676 + _1718;
        float _1722 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1724 = -_836;
        float _1726 = _1724 + _1680;
        float _1728 = _1716 * _1716;
        float _1730 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1732 = _1700 + _1730;
        float _1734 = fma(_1720, _1720, _1728);
        float _1736 = 1.0 / _1150;
        float _1738 = fma(_1732, _1732, _1734);
        float _1740 = sqrt(_1738);
        float _1742 = precise::min(_1740, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1744 = _1742 * _1722;
        float _1746 = -_798;
        float _1748 = _1746 + _1672;
        float _1750 = _1744 * _1736;
        float _1752 = -_796;
        float _1754 = _1752 + _1678;
        float _1756 = fma(_1748, _1750, _1676);
        float _1758 = fma(_1754, _1750, _1688);
        float _1760 = fma(_1726, _1750, _1700);
        _1702 = _1758;
        _1712 = _1756;
        _1704 = _1760;
        _1706 = _1750;
    }
    float _1762 = _1702;
    float _1764 = _1712;
    float _1766 = _1704;
    float _1768 = _1706;
    float _1770 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1772 = _1762 + _1770;
    float _1774 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1776 = _1764 + _1774;
    float _1778 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1780 = _1766 + _1778;
    float _1782 = _1772 * _1772;
    float _1784 = fma(_1776, _1776, _1782);
    float _1786 = fma(_1780, _1780, _1784);
    float _1788 = rsqrt(_1786);
    float _1790 = sqrt(_1786);
    float _1792 = _1788 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1794 = _1776 * _1792;
    float _1796 = _1780 * _1792;
    float _1798 = _1794 * _1794;
    float _1800 = _1796 * _1796;
    float _1802 = _1798 + _1800;
    float _1804 = sqrt(_1802);
    bool _1806 = _1804 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1808 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1810 = _1804 + _1808;
    float _1812 = _1784;
    float _1814 = _1810;
    float _1816 = _1768;
    float _1818 = _1792;
    float _1820 = _1794;
    if (_1806)
    {
        float _1822 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1812 = _1822;
    }
    float _1824 = _1812;
    if (_1806)
    {
        float _1826 = rsqrt(_1802);
        _932 = _1826;
    }
    float _1828 = _932;
    float _1830 = _1828;
    if (_1806)
    {
        float _1832 = _1810 * _1824;
        _1814 = _1832;
    }
    float _1834 = _1814;
    if (_1806)
    {
        float _1836 = _1834 * 0.15915493667125701904296875;
        _1816 = _1836;
    }
    float _1838 = _1816;
    float _1840 = _1824;
    float _1842 = _1838;
    if (_1806)
    {
        float _1844 = _1838 * 6.283185482025146484375;
        float _1846 = sin(_1844);
        _1840 = _1846;
    }
    float _1848 = _1840;
    float _1850 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1852 = precise::max(0.0, _1850);
    float _1854 = _1558;
    float _1856 = _1852;
    if (_1806)
    {
        float _1858 = _1838 * 6.283185482025146484375;
        float _1860 = cos(_1858);
        _1854 = _1860;
    }
    float _1862 = _1854;
    float _1864 = -_1792;
    float _1866 = -_1852;
    float _1868 = fma(_1772, _1864, _1866);
    if (_1806)
    {
        float _1870 = _1868 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1856 = _1870;
    }
    float _1872 = _1856;
    float _1874 = _1872;
    if (!_1806)
    {
        _1842 = _1798;
    }
    float _1876 = _1842;
    float _1878 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1880 = _1762 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1882 = _1848;
    float _1884 = _1876;
    if (_1806)
    {
        float _1886 = fma(_1848, _1872, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1882 = _1886;
    }
    float _1888 = _1882;
    float _1890 = _1888;
    if (_1806)
    {
        float _1892 = _1862 + (-1.0);
        _1874 = _1892;
    }
    float _1894 = _1874;
    float _1896 = _1894;
    if (_1806)
    {
        float _1898 = _1828 * _1888;
        _1394 = _1898;
    }
    float _1900 = _1394;
    if (!_1806)
    {
        _1830 = _1868;
    }
    float _1902 = _1830;
    float _1904 = _1902;
    if (_1806)
    {
        float _1906 = _1894 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1818 = _1906;
    }
    float _1908 = _1818;
    if (_1806)
    {
        float _1910 = _1794 * _1900;
        _1820 = _1910;
    }
    float _1912 = _1820;
    if (!_1806)
    {
        _1890 = _1796;
    }
    float _1914 = _1890;
    float _1916 = _1914;
    if (_1806)
    {
        float _1918 = _1796 * _1900;
        _1916 = _1918;
    }
    float _1920 = _1916;
    if (_1806)
    {
        float _1922 = fma(_1868, _1862, _1908);
        _1904 = _1922;
    }
    float _1924 = _1904;
    if (_1806)
    {
        float _1926 = _1912 * _1912;
        _1884 = _1926;
    }
    float _1928 = _1884;
    if (!_1806)
    {
        _1896 = _1800;
    }
    float _1930 = _1896;
    float _1932 = _1930;
    if (_1806)
    {
        float _1934 = _1920 * _1920;
        _1932 = _1934;
    }
    float _1936 = _1932;
    float _1938 = fma(_1924, _1924, _1928);
    float _1940 = _1762 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1942 = _1938 + _1936;
    float _1944 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1940);
    float _1946 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1948 = fma(_1790, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1946);
    float _1950 = precise::clamp(_1948, 0.0, 1.0);
    float _1952 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1880);
    float _1954 = rsqrt(_1942);
    float _1956 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1944);
    float _1958 = -_1950;
    float _1960 = _1958 + 1.0;
    float _1962 = _1762 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1964 = _1762 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1966 = _1956 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1968 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1952);
    float _1970 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1962);
    float _1972 = abs(_1960);
    float _1974 = log2(_1972);
    float _1976 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1964);
    float _1978 = _1966 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1980 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1970);
    float _1982 = _1968 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1984 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1976);
    float _1986 = -_1978;
    float _1988 = fma(_1986, _1878, 1.0);
    float _1990 = _1980 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1992 = _1954 * _1912;
    float _1994 = _1982 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1996 = _1954 * _1924;
    float _1998 = _1954 * _1920;
    float _2000 = _1992 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2002 = fma(_1990, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1994);
    float _2004 = _1984 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2006 = log2(_1988);
    float _2008 = _1974 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2010 = -_2000;
    float _2012 = fma(_1996, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2010);
    float _2014 = fma(_1966, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2002);
    float _2016 = _1982 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2018 = _1982 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2020 = -_1998;
    float _2022 = fma(_2020, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2012);
    float _2024 = fma(_2004, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2014);
    float _2026 = exp2(_2008);
    float _2028 = fma(_1990, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2016);
    float _2030 = fma(_2022, -0.5, 0.5);
    float _2032 = fma(_2022, 0.5, 0.5);
    float _2034 = fma(_1990, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2018);
    float _2036 = _1996 + 1.0;
    float _2038 = fma(_1966, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2028);
    float _2040 = fma(_2032, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2042 = 1.0 / _2024;
    float _2044 = fma(_1966, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2034);
    float _2046 = fma(_2004, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2038);
    float _2048 = _2006 * 0.693147182464599609375;
    float _2050 = fma(_2004, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2044);
    float _2052 = sqrt(_2030);
    float _2054 = -_1996;
    float _2056 = fma(_2026, _2036, _2054);
    float _2058 = fma(_2032, _2040, -0.212114393711090087890625);
    float _2060 = fma(_2032, _2058, 1.570728778839111328125);
    float _2062 = _2046 * _2042;
    float _2064 = _2050 * _2042;
    float _2066 = _2048 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2068 = fma(_2056, 0.5, 0.5);
    float _2070 = fma(_2062, 0.5, 0.5);
    float _2072 = fma(_2064, -0.5, 0.5);
    float _2074 = _2052 * 0.636619746685028076171875;
    float3 _5498 = float3(_2070, _2072, _2066);
    float _2076 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5498, float3(0.0), isnan(_5498)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5498, float3(0.0), isnan(_5498)), level(0.0)).x;
    float3 _5509 = float3(_2070, _2072, _2066);
    float4 _2079 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5509, float3(0.0), isnan(_5509)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5509, float3(0.0), isnan(_5509)), level(0.0)).xyzw;
    float _2081 = _2079.x;
    float _2083 = _2079.y;
    float _2085 = _2079.z;
    float _2087 = _2079.w;
    float _2089 = -_2060;
    float _2091 = fma(_2074, _2089, 1.0);
    float2 _5531 = float2(_2091, _2068);
    float3 _2095 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5531, float2(0.0), isnan(_5531)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5531, float2(0.0), isnan(_5531)), level(0.0)).xyz;
    float _2097 = _2095.x;
    float _2099 = _2095.y;
    float _2101 = _2095.z;
    float _2103 = _1688 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2105 = _1688 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    out.m_75.x = _1776;
    out.m_75.y = _1772;
    out.m_75.z = _1780;
    float _2107 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2103);
    float _2109 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2105);
    float _2111 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2107);
    float _2113 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2109);
    float _2115 = _2111 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2117 = _2113 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2119 = 1.0 / _2115;
    bool _2121 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2123 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2125 = _2121 || _2123;
    bool _2127 = isnan(0.5);
    bool _2129 = _2125 || _2127;
    float _2131 = _2117 + _2115;
    float _2133 = _2046 + _2024;
    float _2135 = _2133 * 0.5;
    float _2137 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (!_2129)
    {
        _1708 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2139 = _1708;
    float _2141 = _2131 * _2119;
    float _2143 = _2141 * 0.5;
    float _2145 = _1982 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2147 = _1974 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2149 = _2143;
    float _2151 = _2139;
    float _2153 = _2145;
    if (!_2129)
    {
        float _2155 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2157 = fma(_2143, _2139, _2155);
        _2149 = _2157;
    }
    float _2159 = _2149;
    if (!_2129)
    {
        _2151 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2161 = _2151;
    float _2163 = fma(_1990, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2145);
    float _2165 = _2161;
    if (_2129)
    {
        _2153 = 1.0;
    }
    float _2167 = _2153;
    float _2169 = exp2(_2147);
    float _2171 = _2167;
    if (!_2129)
    {
        float _2173 = -_2161;
        float _2175 = _2173 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2137 = _2175;
    }
    float _2177 = _2137;
    float _2179 = fma(_1966, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2163);
    float _2181 = fma(_2004, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2179);
    float _2183 = _2159;
    if (!_2129)
    {
        float _2185 = 1.0 / _2159;
        _2183 = _2185;
    }
    float _2187 = _2183;
    float _2189 = _2181 + _2024;
    out.gl_Position.x = _2046;
    out.gl_Position.y = _2050;
    out.gl_Position.z = _2181;
    out.gl_Position.w = _2024;
    float _2191 = _2189 * 0.5;
    float _2193 = _2177;
    if (!_2129)
    {
        float _2195 = 1.0 / _2177;
        _2193 = _2195;
    }
    float _2197 = _2193;
    float _2199 = -_2169;
    float _2201 = _2199 + 1.0;
    float _2203 = _2201 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_2129)
    {
        float _2205 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2207 = -_2161;
        float _2209 = fma(_2187, _2205, _2207);
        _2165 = _2209;
    }
    float _2211 = _2165;
    if (!_2129)
    {
        float _2213 = _2211 * _2197;
        float _2215 = precise::clamp(_2213, 0.0, 1.0);
        _2171 = _2215;
    }
    float _2217 = _2171;
    float _2219 = _2024 * 0.5;
    float _2221 = _2217 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2223 = _2217 > 0.0;
    bool _2225 = isnan(_2217);
    bool _2227 = _2223 || _2225;
    bool _2229 = isnan(0.0);
    bool _2231 = _2227 || _2229;
    float _2233 = -_2203;
    float _2235 = _2233 + 1.0;
    float _2237 = fma(_2050, -0.5, _2219);
    float _2239 = _2221 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_77.x = _2135;
    out.m_77.y = _2237;
    out.m_77.z = _2191;
    out.m_77.w = _2024;
    out.m_47.x = _2239;
    float _2241 = _2203 * _2076;
    float _2243 = _2087 * _2235;
    float _2245 = _2087 * _2241;
    float _2247 = _2101 * _2241;
    float _2249 = fma(_2097, _2245, _2081);
    float _2251 = fma(_2099, _2245, _2083);
    float _2253 = fma(_2087, _2247, _2085);
    out.m_79.x = _2249;
    out.m_79.y = _2251;
    out.m_79.z = _2253;
    out.m_79.w = _2243;
    if (_2231)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2255 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2255;
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
    bool _1618 = false;
    bool _532 = false;
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
        float _2312 = as_type<float>(_114);
        out.gl_Position.z = _2312;
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
        float _2382 = as_type<float>(_152);
        out.gl_Position.z = _2382;
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
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _336 = _304 + _334;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _340 = _326 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _342 = _328 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _344 = 1.0 / _320;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _348 = _304 + _346;
    float _350 = _336 * _322;
    bool _352 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _354 = isnan(_304);
    bool _356 = _352 || _354;
    bool _358 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _360 = _356 || _358;
    float _362 = float(_360);
    out.m_55.x = _330;
    out.m_55.y = _340;
    out.m_55.z = _342;
    out.m_55.w = _338;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _364;
    bool _368 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _370 = _348 * _332;
    bool _372 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _374 = isnan(_304);
    bool _376 = _372 || _374;
    bool _378 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _380 = _376 || _378;
    float _382 = float(_380);
    float _384 = -_362;
    float _386 = _384 + 1.0;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _388;
    float _392 = fma(_366, _350, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _394 = _382 * _386;
    float _396 = -_382;
    float _398 = _396 + 1.0;
    float _400 = _308 * _344;
    bool _402 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _404 = isnan(_304);
    bool _406 = _402 || _404;
    bool _408 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _410 = _406 || _408;
    float _412 = float(_410);
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _414;
    bool _418 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _420 = isnan(_304);
    bool _422 = _418 || _420;
    bool _424 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _426 = _422 || _424;
    float _428 = float(_426);
    float _430 = fma(_390, _350, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _434 = _432 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _436 = -_412;
    float _438 = _436 + 1.0;
    float _440 = _412 * _398;
    float _442 = fma(_416, _350, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _444 = _428 * _438;
    float _446 = -_428;
    float _448 = _446 + 1.0;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _452 = _450 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _456 = _454 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _458 = _430 * _444;
    float _460 = _392 * _444;
    float _462 = _442 * _444;
    float _464 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[143].y, _458);
    float _466 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[143].x, _460);
    float _468 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[143].z, _462);
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _470;
    float _474 = fma(_434, _370, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _476 = fma(_452, _370, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _478 = fma(_456, _370, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _480;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _484;
    float _488 = fma(_474, _440, _466);
    float _490 = fma(_472, _400, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _492 = fma(_482, _400, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _494 = fma(_486, _400, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _496 = fma(_476, _440, _464);
    float _498 = fma(_478, _440, _468);
    float _500 = fma(_490, _394, _488);
    float _502 = fma(_492, _394, _496);
    float _504 = fma(_494, _394, _498);
    float _506 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[146].x, _500);
    float _508 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[146].y, _502);
    float _510 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[146].z, _504);
    bool _512 = !_368;
    float _530;
    if (!_512)
    {
        float _514 = in.m_53.x;
        float _516 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _518 = _514 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _520 = fma(_518, (*spvDescriptorSet0.vp_c9)._m0[11].w, _132);
        float _522 = _520 * _516;
        float _524 = floor(_522);
        float _526 = -_524;
        float _528 = _522 + _526;
        _530 = _528;
        _532 = true;
    }
    else
    {
        float _534 = float(_98);
        float _536 = 1.0 / _534;
        float _538 = _132 * _536;
        _530 = _538;
    }
    _532 = false;
    float _540 = _530;
    float _542 = in.m_53.z;
    float _544 = _272 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _546 = in.m_53.x;
    int _548 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _550 = _548 != 0;
    float _552 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[5].x, _544);
    float _554 = in.m_53.y;
    float _556 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _558 = log2(_556);
    float _560 = in.m_53.w;
    float _562 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _570 = _540 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _572 = isnan(_540);
    bool _574 = _570 || _572;
    bool _576 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _578 = _574 || _576;
    float _580 = float(_578);
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _584 = _582 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _586 = _542 * 2.0;
    float _588 = 1.0 / _568;
    float _590 = _546 * 2.0;
    float _592 = _554 * 2.0;
    float _594 = floor(_586);
    float _596 = fma(_554, (*spvDescriptorSet0.vp_c9)._m0[78].w, _564);
    float _598 = floor(_590);
    float _600 = floor(_592);
    bool _602 = _594 > 0.0;
    bool _604 = _594 >= 0.0;
    bool _606 = isnan(_594);
    bool _608 = _604 || _606;
    bool _610 = isnan(0.0);
    bool _612 = _608 || _610;
    float _614 = _612 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _616 = 1.0 / _584;
    bool _618 = _598 >= 0.0;
    bool _620 = isnan(_598);
    bool _622 = _618 || _620;
    bool _624 = isnan(0.0);
    bool _626 = _622 || _624;
    bool _628 = _598 > 0.0;
    float _630 = _626 ? 0.0 : 1.4012984643248170709237295832899e-45;
    int _632 = ~as_type<int>(_614);
    int _634 = _632 + 1;
    int _636 = _634 + 1;
    bool _638 = _600 >= 0.0;
    bool _640 = isnan(_600);
    bool _642 = _638 || _640;
    bool _644 = isnan(0.0);
    bool _646 = _642 || _644;
    bool _648 = _600 > 0.0;
    float _650 = _646 ? 0.0 : 1.4012984643248170709237295832899e-45;
    int _652 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _654 = _652 != 0;
    int _656 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _658 = _656 != 0;
    int _660 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _662 = _660 != 0;
    float _664 = in.m_51.x;
    float _666 = in.m_51.y;
    float _668 = in.m_51.z;
    int _670 = ~as_type<int>(_630);
    int _672 = _670 + 1;
    int _674 = _672 + 1;
    int _676 = ~as_type<int>(_650);
    int _678 = _676 + 1;
    int _680 = _678 + 1;
    int _682 = _636;
    int _684 = _674;
    int _686 = _680;
    float _688 = _630;
    float _690 = _650;
    float _692 = _614;
    if (!_602)
    {
        int _694 = ~as_type<int>(_614);
        int _696 = _694 + 1;
        _682 = _696;
    }
    int _698 = _682;
    if (!_628)
    {
        int _700 = ~as_type<int>(_630);
        int _702 = _700 + 1;
        _684 = _702;
    }
    int _704 = _684;
    if (!_648)
    {
        int _706 = ~as_type<int>(_650);
        int _708 = _706 + 1;
        _686 = _708;
    }
    int _710 = _686;
    if (!_550)
    {
        _688 = _554;
    }
    float _712 = _688;
    float _714 = _712;
    if (!_550)
    {
        _690 = _542;
    }
    float _716 = _690;
    float _718 = _716;
    if (!_550)
    {
        _692 = _542;
    }
    float _720 = _692;
    float _722 = _720;
    if (_550)
    {
        _714 = _546;
    }
    float _724 = _714;
    if (_550)
    {
        _718 = _554;
    }
    float _726 = _718;
    if (_550)
    {
        _722 = _554;
    }
    float _728 = _722;
    int _730 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _732 = _730 != 0;
    float _734 = _508 * _666;
    int _736 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _738 = _736 != 0;
    float _740 = _506 * _664;
    int _742 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _744 = _742 != 0;
    float _746 = _554 + _542;
    int _748 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _750 = _748 != 0;
    float _752 = _272 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _754 = !_654;
    int _756 = _754 ? 0 : 1;
    float _758 = _272 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _760 = _560 > 0.5;
    float _762 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[4].x, _752);
    float _764 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[6].x, _758);
    float _766 = _546 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _768 = _546 + _554;
    float _770 = _510 * _668;
    float _772 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _774 = _554 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _776 = _746 + (-1.0);
    float _778 = -_772;
    float _780 = fma(_766, 2.0, _778);
    float _782 = _768 + (-1.0);
    float _784 = fma(_774, -2.0, _562);
    float _786 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[4].z, _762);
    float _788 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[5].z, _552);
    float _790 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[6].z, _764);
    float _792 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _794 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _796 = _788 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _798 = _786 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _800 = abs(_756);
    float _802 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _804 = _724 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _806 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _808 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _810 = _796 + _808;
    float _812 = -_806;
    float _814 = fma(_804, 2.0, _812);
    float _816 = _558 * _132;
    float _818 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _820 = !_658;
    int _822 = _820 ? 0 : 1;
    float _824 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _826 = !_662;
    int _828 = _826 ? 0 : 1;
    float _830 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[83].w, _818);
    float _832 = exp2(_816);
    float _834 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[83].z, _824);
    float _836 = _790 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _838 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _840 = isnan(1.0);
    bool _842 = _838 || _840;
    bool _844 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _846 = _842 || _844;
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _850 = 1.0 + _848;
    float _852 = float(_800);
    float _854 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _856 = float(_698);
    float _858 = 1.0 / _850;
    float _860 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _862 = _798 + _860;
    float _864 = fma(_546, (*spvDescriptorSet0.vp_c9)._m0[78].z, _854);
    float _866 = _726 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _868 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _870 = isnan(0.0);
    bool _872 = _868 || _870;
    bool _874 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _876 = _872 || _874;
    float _878 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _880 = _836 + _878;
    float _882 = -_832;
    float _884 = _882 + 1.0;
    float _886 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].z, _864);
    float _888 = _852 * _856;
    int _890 = abs(_822);
    float _892 = _810 * _810;
    float _894 = fma(_866, -2.0, _802);
    float _896 = in.m_57.x;
    float _898 = in.m_57.y;
    float _900 = in.m_57.z;
    float _902 = _876 ? _884 : 0.0;
    float _904 = fma(_862, _862, _892);
    float _906 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].w, _596);
    float _908 = -_132;
    float _910 = fma(_908, (*spvDescriptorSet0.vp_c9)._m0[76].x, _780);
    float _912 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[76].y, _784);
    float _914 = fma(_880, _880, _904);
    float _916 = float(_890);
    float _918 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].z, _834);
    float _920 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].w, _830);
    float _922 = -_132;
    float _924 = fma(_922, (*spvDescriptorSet0.vp_c9)._m0[81].x, _814);
    float _926 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[81].y, _894);
    bool _928 = _760;
    bool _930 = _744;
    float _932 = _798;
    if (_846)
    {
        float _934 = _902 * _858;
        _134 = _934;
    }
    float _936 = _134;
    float _938 = rsqrt(_914);
    float _940 = in.m_59.x;
    float _942 = in.m_59.y;
    float _944 = in.m_59.z;
    float _946 = float(_704);
    float _948 = _770 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _950 = abs(_828);
    float _952 = float(_710);
    float _954 = _916 * _946;
    float _956 = float(_950);
    float _958 = _888 * (-2.0);
    bool _960 = _554 > 0.5;
    float _962 = _954 * (-2.0);
    float _964 = _554 + (-0.5);
    float _966 = fma(_958, _896, _896);
    float _968 = _956 * _952;
    float _970 = fma(_794, _958, _794);
    float _972 = _810 * _938;
    float _974 = fma(_792, _962, _792);
    float _976 = _862 * _938;
    float _978 = in.m_61.x;
    float _980 = in.m_61.y;
    float _982 = in.m_61.z;
    float _984 = -_972;
    float _986 = fma(_984, (*spvDescriptorSet0.vp_c9)._m0[18].w, _810);
    float _988 = fma(_962, _898, _898);
    float _990 = -_976;
    float _992 = fma(_990, (*spvDescriptorSet0.vp_c9)._m0[18].w, _862);
    float _994 = in.m_63.y;
    float _996 = _986 * _986;
    bool _998 = _942 != 0.0;
    bool _1000 = isnan(_942);
    bool _1002 = _998 || _1000;
    bool _1004 = isnan(0.0);
    bool _1006 = _1002 || _1004;
    float _1008 = _968 * (-2.0);
    float _1010 = fma(_992, _992, _996);
    bool _1012 = _940 == 0.0;
    bool _1014 = !_1006;
    bool _1016 = _1012 && _1014;
    float _1018 = _546 + (-0.5);
    float _1020 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[196].y, _988);
    float _1022 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1024 = _1022 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1026 = _944 == 0.0;
    bool _1028 = _1026 && _1016;
    float _1030 = fma(_1018, (*spvDescriptorSet0.vp_c9)._m0[196].x, _966);
    float _1032 = _546 + _542;
    float _1034 = _880 * _938;
    float _1036 = fma(_1008, _900, _900);
    float _1038 = fma(_970, _936, _1030);
    float _1040 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _942);
    float _1042 = -_1034;
    float _1044 = fma(_1042, (*spvDescriptorSet0.vp_c9)._m0[18].w, _880);
    float _1046 = 1.0 / _1024;
    float _1048 = _1038 * 0.15915493667125701904296875;
    float _1050 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _940);
    float _1052 = fma(_1044, _1044, _1010);
    float _1054 = fma(_974, _936, _1020);
    float _1056 = _978;
    float _1058 = _980;
    float _1060 = _982;
    float _1062 = _972;
    if (!_1028)
    {
        float _1064 = fma(_940, (*spvDescriptorSet0.vp_c9)._m0[17].y, _978);
        _1056 = _1064;
    }
    float _1066 = _1056;
    float _1068 = _1032 + (-1.0);
    if (!_1028)
    {
        float _1070 = fma(_942, (*spvDescriptorSet0.vp_c9)._m0[17].y, _980);
        _1058 = _1070;
    }
    float _1072 = _1058;
    float _1074 = _542 + (-0.5);
    float _1076 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1078 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1080 = -_994;
    float _1082 = _1080 + 1.0;
    float _1084 = fma(_1074, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1036);
    float _1086 = fma(_1078, _1008, _1078);
    float _1088 = _1054 * 0.15915493667125701904296875;
    int _1090 = _760 ? as_type<int>(_1082) : as_type<int>(_994);
    float _1092 = sqrt(_1052);
    float _1094 = fma(_1086, _936, _1084);
    float _1096 = _994;
    if (_732)
    {
        bool _1098 = _546 > 0.5;
        _928 = _1098;
    }
    bool _1100 = _928;
    float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1104 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1102;
    float _1106 = _744 ? as_type<float>(_1090) : _994;
    float _1108 = _1094 * 0.15915493667125701904296875;
    if (_738)
    {
        bool _1110 = _542 > 0.5;
        _930 = _1110;
    }
    bool _1112 = _930;
    float _1114 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1116 = _1114 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1118 = _1048 * 6.283185482025146484375;
    float _1120 = sin(_1118);
    float _1122 = _1104 * _1046;
    float _1124 = _1116 * _588;
    float _1126 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1128 = _540 + _1126;
    float _1130 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1132 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1130;
    float _1134 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1136 = _540 + _1134;
    if (_750)
    {
        float _1138 = _960 ? _1082 : _994;
        _1096 = _1138;
    }
    float _1140 = _1096;
    float _1142 = fma(_1122, _1128, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1144 = _1048 * 6.283185482025146484375;
    float _1146 = cos(_1144);
    float _1148 = _1132 * _616;
    float _1150 = _938 * _1092;
    float _1152 = _734 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1154 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _944);
    float _1156 = fma(_1148, _1136, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1158 = _1076 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1160 = _740 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1162 = _1088 * 6.283185482025146484375;
    float _1164 = sin(_1162);
    float _1166 = _948 * _1150;
    float _1168 = fma(_1106, _1158, -0.5);
    float _1170 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1172 = _540 + _1170;
    float _1174 = _1172;
    if (!_1028)
    {
        float _1176 = fma(_944, (*spvDescriptorSet0.vp_c9)._m0[17].y, _982);
        _1060 = _1176;
    }
    float _1178 = _1060;
    float _1180 = _1166 * _1154;
    float _1182 = in.m_63.x;
    float _1184 = fma(_1124, _1172, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1186 = _1088 * 6.283185482025146484375;
    float _1188 = cos(_1186);
    float _1190 = -_926;
    float _1192 = fma(_920, _1168, _1190);
    float _1194 = _1108 * 6.283185482025146484375;
    float _1196 = cos(_1194);
    float _1198 = _1120 * _1164;
    float _1200 = _1108 * 6.283185482025146484375;
    float _1202 = sin(_1200);
    float _1204 = _1120 * _1188;
    float _1206 = _1146 * _1188;
    int _1208 = 0;
    float _1210 = _1182;
    if (_732)
    {
        float _1212 = -_1182;
        float _1214 = _1212 + 1.0;
        _1208 = as_type<int>(_1214);
    }
    int _1216 = _1208;
    int _1218 = 0;
    if (_738)
    {
        float _1220 = -_1182;
        float _1222 = _1220 + 1.0;
        _1218 = as_type<int>(_1222);
    }
    int _1224 = _1218;
    float _1226 = _1188 * _1196;
    float _1228 = _1146 * _1164;
    float _1230 = _1164 * _1196;
    float _1232 = _1120 * _1196;
    float _1234 = _1152 * _1150;
    float _1236 = _1146 * _1196;
    if (!_732)
    {
        _1174 = _1182;
    }
    float _1238 = _1174;
    float _1240 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1242 = fma(_1202, _1206, _1198);
    float _1244 = fma(_1202, _1198, _1206);
    float _1246 = _1160 * _1150;
    float _1248 = _1234 * _1040;
    float _1250 = -_1204;
    float _1252 = fma(_1202, _1228, _1250);
    float _1254 = -_1228;
    float _1256 = fma(_1202, _1204, _1254);
    float _1258 = _1246 * _1050;
    float _1260 = _1236 * _1248;
    float _1262 = -_1248;
    float _1264 = _1202 * _1262;
    float _1266 = _1232 * _1248;
    bool _1268 = _540 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1270 = isnan(_540);
    bool _1272 = _1268 || _1270;
    bool _1274 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1276 = _1272 || _1274;
    float _1278 = float(_1276);
    float _1280 = fma(_1242, _1258, _1260);
    float _1282 = fma(_1226, _1258, _1264);
    float _1284 = fma(_1256, _1258, _1266);
    float _1286 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1288 = fma(_1252, _1180, _1280);
    float _1290 = fma(_1230, _1180, _1282);
    bool _1292 = _540 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1294 = isnan(_540);
    bool _1296 = _1292 || _1294;
    bool _1298 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1300 = _1296 || _1298;
    float _1302 = float(_1300);
    float _1304 = -_1278;
    float _1306 = _1304 + 1.0;
    float _1308 = _1288 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1310 = _1288 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1312 = fma(_1244, _1180, _1284);
    bool _1314 = _540 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1316 = isnan(_540);
    bool _1318 = _1314 || _1316;
    bool _1320 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1322 = _1318 || _1320;
    float _1324 = float(_1322);
    float _1326 = fma(_1290, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1308);
    float _1328 = fma(_1290, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1310);
    float _1330 = _1302 * _1306;
    float _1332 = -_1302;
    float _1334 = _1332 + 1.0;
    float _1336 = fma(_1312, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1326);
    float _1338 = fma(_1312, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1328);
    float _1340 = _1240 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1342 = _1324 * _1334;
    float _1344 = _798 + _1336;
    float _1346 = _836 + _1338;
    float _1348 = -_1324;
    float _1350 = _1348 + 1.0;
    float _1352 = fma(_1340, _1140, -0.5);
    float _1354 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1356 = _1344 + _1354;
    float _1358 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1360 = _1346 + _1358;
    float _1362 = _580 * _1350;
    float _1364 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1366 = _1356 * _1356;
    float _1368 = _1360 * _1360;
    float _1370 = _1142 * _1362;
    float _1372 = -_912;
    float _1374 = fma(_906, _1352, _1372);
    float _1376 = _1288 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1378 = _1366 + _1368;
    float _1380 = -_580;
    float _1382 = _1380 + 1.0;
    float _1384 = _1238;
    float _1386 = _1366;
    float _1388 = _1368;
    float _1390 = _1344;
    float _1392 = _1346;
    float _1394 = _1374;
    if (_732)
    {
        float _1396 = _1100 ? as_type<float>(_1216) : _1182;
        _1384 = _1396;
    }
    float _1398 = _1384;
    float _1400 = fma(_1290, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1376);
    float _1402 = sqrt(_1378);
    float _1404 = fma(_1382, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1370);
    if (_738)
    {
        float _1406 = _1112 ? as_type<float>(_1224) : _1182;
        _1210 = _1406;
    }
    float _1408 = _1210;
    float _1410 = _1286 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1412 = -_1072;
    float _1414 = _1202 * _1412;
    float _1416 = _1236 * _1072;
    float _1418 = _1364 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1420 = fma(_1312, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1400);
    float _1422 = fma(_1184, _1342, _1404);
    float _1424 = _1232 * _1072;
    float _1426 = fma(_1418, _1408, -0.5);
    float _1428 = fma(_1226, _1066, _1414);
    float _1430 = fma(_1242, _1066, _1416);
    float _1432 = _796 + _1420;
    float _1434 = fma(_1410, _1398, -0.5);
    float _1436 = fma(_1156, _1330, _1422);
    bool _1438 = _1402 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1440 = fma(_1256, _1066, _1424);
    float _1442 = fma(_918, _1426, _924);
    float _1444 = fma(_1230, _1178, _1428);
    float _1446 = fma(_1252, _1178, _1430);
    float _1448 = fma(_886, _1434, _910);
    float _1450 = fma(_1278, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1436);
    float _1452 = fma(_1244, _1178, _1440);
    float _1454 = _1426;
    float _1456 = _1448;
    if (!_1438)
    {
        _1454 = _1432;
    }
    float _1458 = _1454;
    bool _1460 = !_1438;
    float _1462 = _1458;
    if (!_1460)
    {
        float _1464 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1466 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1468 = _1402 + _1466;
        float _1470 = _1432 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1472 = rsqrt(_1378);
        float _1474 = _1468 * _1464;
        float _1476 = _1474 * 0.15915493667125701904296875;
        float _1478 = _1476 * 6.283185482025146484375;
        float _1480 = sin(_1478);
        float _1482 = _1476 * 6.283185482025146484375;
        float _1484 = cos(_1482);
        float _1486 = fma(_1480, _1470, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1488 = _1472 * _1486;
        float _1490 = _1484 + (-1.0);
        float _1492 = fma(_1356, _1488, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1494 = fma(_1360, _1488, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1496 = _1490 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1498 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1500 = _1492 + _1498;
        float _1502 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1504 = _1494 + _1502;
        float _1506 = fma(_1432, _1484, _1496);
        float _1508 = _1500 * _1500;
        float _1510 = _1504 * _1504;
        _1462 = _1506;
        _1386 = _1508;
        _1388 = _1510;
        _1390 = _1492;
        _1392 = _1494;
    }
    float _1512 = _1462;
    float _1514 = _1386;
    float _1516 = _1388;
    float _1518 = _1390;
    float _1520 = _1392;
    float _1522 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1524 = _1512 + _1522;
    float _1526 = in.m_65.w;
    float _1528 = _1446 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1530 = fma(_1524, _1524, _1514);
    float _1532 = _1446 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1534 = _1530 + _1516;
    float _1536 = _1446 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1538 = fma(_1444, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1528);
    float _1540 = fma(_1444, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1532);
    float _1542 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1544 = fma(_1444, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1536);
    float _1546 = sqrt(_1534);
    float _1548 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1550 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1552 = fma(_1452, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1538);
    float _1554 = _1192 + 0.5;
    float _1556 = fma(_1452, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1540);
    float _1558 = _1542 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1560 = _1548 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1562 = _1550 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1564 = _1374 + 0.5;
    float _1566 = _1448 + 0.5;
    float _1568 = _1442 + 0.5;
    float _1570 = _1450 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1572 = fma(_1452, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1544);
    out.m_67.w = _1526;
    bool _1574 = _1546 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1576 = isnan(_1546);
    bool _1578 = _1574 || _1576;
    bool _1580 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1582 = _1578 || _1580;
    out.m_69.x = _1566;
    out.m_69.y = _1564;
    out.m_69.z = _1568;
    out.m_69.w = _1554;
    out.m_71.x = _1558;
    out.m_71.y = _1560;
    out.m_71.z = _1562;
    out.m_71.w = _1570;
    out.m_73.x = _1552;
    out.m_73.y = _1556;
    out.m_73.z = _1572;
    if (!_1582)
    {
        _1456 = 1.0;
    }
    float _1584 = _1456;
    bool _1586 = !_1582;
    float _1588 = _1584;
    if (!_1586)
    {
        bool _1590 = _1546 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1592 = isnan(_1546);
        bool _1594 = _1590 || _1592;
        bool _1596 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1598 = _1594 || _1596;
        if (!_1598)
        {
            float _1600 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1602 = _1546 + _1600;
            float _1604 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1606 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1604;
            float _1608 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1610 = _1608 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1612 = 1.0 / _1606;
            float _1614 = _1602 * _1612;
            float _1616 = fma(_1614, _1610, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1588 = _1616;
            _1618 = true;
        }
        else
        {
            bool _1620 = _1546 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1622 = isnan(_1546);
            bool _1624 = _1620 || _1622;
            bool _1626 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1628 = _1624 || _1626;
            if (!_1628)
            {
                float _1630 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1632 = _1546 + _1630;
                float _1634 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1636 = _1634 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1638 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1640 = _1638 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1642 = 1.0 / _1636;
                float _1644 = _1632 * _1642;
                float _1646 = fma(_1644, _1640, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1588 = _1646;
                _1618 = true;
            }
            else
            {
                _1588 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1618 = false;
    float _1648 = _1588;
    float _1650 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1652 = _1518 + _1650;
    float _1654 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1656 = _1512 + _1654;
    float _1658 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1660 = _1520 + _1658;
    bool _1662 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1664 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1666 = _1662 || _1664;
    bool _1668 = isnan(0.5);
    bool _1670 = _1666 || _1668;
    float _1672 = fma(_1652, _1648, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1674 = -_976;
    float _1676 = fma(_1674, (*spvDescriptorSet0.vp_c9)._m0[18].w, _798);
    float _1678 = fma(_1656, _1648, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1680 = fma(_1660, _1648, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1682 = -_976;
    float _1684 = fma(_1682, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1672);
    float _1686 = -_972;
    float _1688 = fma(_1686, (*spvDescriptorSet0.vp_c9)._m0[18].w, _796);
    float _1690 = -_972;
    float _1692 = fma(_1690, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1678);
    float _1694 = -_1034;
    float _1696 = fma(_1694, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1680);
    float _1698 = -_1034;
    float _1700 = fma(_1698, (*spvDescriptorSet0.vp_c9)._m0[18].w, _836);
    float _1702 = _1692;
    float _1704 = _1696;
    float _1706 = _1684;
    float _1708 = _1700;
    if (_1670)
    {
        _1062 = _1684;
    }
    float _1710 = _1062;
    float _1712 = _1710;
    if (!_1670)
    {
        float _1714 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1716 = _1688 + _1714;
        float _1718 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1720 = _1676 + _1718;
        float _1722 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1724 = -_836;
        float _1726 = _1724 + _1680;
        float _1728 = _1716 * _1716;
        float _1730 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1732 = _1700 + _1730;
        float _1734 = fma(_1720, _1720, _1728);
        float _1736 = 1.0 / _1150;
        float _1738 = fma(_1732, _1732, _1734);
        float _1740 = sqrt(_1738);
        float _1742 = precise::min(_1740, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1744 = _1742 * _1722;
        float _1746 = -_798;
        float _1748 = _1746 + _1672;
        float _1750 = _1744 * _1736;
        float _1752 = -_796;
        float _1754 = _1752 + _1678;
        float _1756 = fma(_1748, _1750, _1676);
        float _1758 = fma(_1754, _1750, _1688);
        float _1760 = fma(_1726, _1750, _1700);
        _1702 = _1758;
        _1712 = _1756;
        _1704 = _1760;
        _1706 = _1750;
    }
    float _1762 = _1702;
    float _1764 = _1712;
    float _1766 = _1704;
    float _1768 = _1706;
    float _1770 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1772 = _1762 + _1770;
    float _1774 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1776 = _1764 + _1774;
    float _1778 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1780 = _1766 + _1778;
    float _1782 = _1772 * _1772;
    float _1784 = fma(_1776, _1776, _1782);
    float _1786 = fma(_1780, _1780, _1784);
    float _1788 = rsqrt(_1786);
    float _1790 = sqrt(_1786);
    float _1792 = _1788 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1794 = _1776 * _1792;
    float _1796 = _1780 * _1792;
    float _1798 = _1794 * _1794;
    float _1800 = _1796 * _1796;
    float _1802 = _1798 + _1800;
    float _1804 = sqrt(_1802);
    bool _1806 = _1804 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1808 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1810 = _1804 + _1808;
    float _1812 = _1784;
    float _1814 = _1810;
    float _1816 = _1768;
    float _1818 = _1792;
    float _1820 = _1794;
    if (_1806)
    {
        float _1822 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1812 = _1822;
    }
    float _1824 = _1812;
    if (_1806)
    {
        float _1826 = rsqrt(_1802);
        _932 = _1826;
    }
    float _1828 = _932;
    float _1830 = _1828;
    if (_1806)
    {
        float _1832 = _1810 * _1824;
        _1814 = _1832;
    }
    float _1834 = _1814;
    if (_1806)
    {
        float _1836 = _1834 * 0.15915493667125701904296875;
        _1816 = _1836;
    }
    float _1838 = _1816;
    float _1840 = _1824;
    float _1842 = _1838;
    if (_1806)
    {
        float _1844 = _1838 * 6.283185482025146484375;
        float _1846 = sin(_1844);
        _1840 = _1846;
    }
    float _1848 = _1840;
    float _1850 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1852 = precise::max(0.0, _1850);
    float _1854 = _1558;
    float _1856 = _1852;
    if (_1806)
    {
        float _1858 = _1838 * 6.283185482025146484375;
        float _1860 = cos(_1858);
        _1854 = _1860;
    }
    float _1862 = _1854;
    float _1864 = -_1792;
    float _1866 = -_1852;
    float _1868 = fma(_1772, _1864, _1866);
    if (_1806)
    {
        float _1870 = _1868 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1856 = _1870;
    }
    float _1872 = _1856;
    float _1874 = _1872;
    if (!_1806)
    {
        _1842 = _1798;
    }
    float _1876 = _1842;
    float _1878 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1880 = _1762 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1882 = _1848;
    float _1884 = _1876;
    if (_1806)
    {
        float _1886 = fma(_1848, _1872, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1882 = _1886;
    }
    float _1888 = _1882;
    float _1890 = _1888;
    if (_1806)
    {
        float _1892 = _1862 + (-1.0);
        _1874 = _1892;
    }
    float _1894 = _1874;
    float _1896 = _1894;
    if (_1806)
    {
        float _1898 = _1828 * _1888;
        _1394 = _1898;
    }
    float _1900 = _1394;
    if (!_1806)
    {
        _1830 = _1868;
    }
    float _1902 = _1830;
    float _1904 = _1902;
    if (_1806)
    {
        float _1906 = _1894 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1818 = _1906;
    }
    float _1908 = _1818;
    if (_1806)
    {
        float _1910 = _1794 * _1900;
        _1820 = _1910;
    }
    float _1912 = _1820;
    if (!_1806)
    {
        _1890 = _1796;
    }
    float _1914 = _1890;
    float _1916 = _1914;
    if (_1806)
    {
        float _1918 = _1796 * _1900;
        _1916 = _1918;
    }
    float _1920 = _1916;
    if (_1806)
    {
        float _1922 = fma(_1868, _1862, _1908);
        _1904 = _1922;
    }
    float _1924 = _1904;
    if (_1806)
    {
        float _1926 = _1912 * _1912;
        _1884 = _1926;
    }
    float _1928 = _1884;
    if (!_1806)
    {
        _1896 = _1800;
    }
    float _1930 = _1896;
    float _1932 = _1930;
    if (_1806)
    {
        float _1934 = _1920 * _1920;
        _1932 = _1934;
    }
    float _1936 = _1932;
    float _1938 = fma(_1924, _1924, _1928);
    float _1940 = _1762 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1942 = _1938 + _1936;
    float _1944 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1940);
    float _1946 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1948 = fma(_1790, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1946);
    float _1950 = precise::clamp(_1948, 0.0, 1.0);
    float _1952 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1880);
    float _1954 = rsqrt(_1942);
    float _1956 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1944);
    float _1958 = -_1950;
    float _1960 = _1958 + 1.0;
    float _1962 = _1762 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1964 = _1762 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1966 = _1956 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1968 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1952);
    float _1970 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1962);
    float _1972 = abs(_1960);
    float _1974 = log2(_1972);
    float _1976 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1964);
    float _1978 = _1966 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1980 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1970);
    float _1982 = _1968 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1984 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1976);
    float _1986 = -_1978;
    float _1988 = fma(_1986, _1878, 1.0);
    float _1990 = _1980 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1992 = _1954 * _1912;
    float _1994 = _1982 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1996 = _1954 * _1924;
    float _1998 = _1954 * _1920;
    float _2000 = _1992 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2002 = fma(_1990, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1994);
    float _2004 = _1984 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2006 = log2(_1988);
    float _2008 = _1974 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2010 = -_2000;
    float _2012 = fma(_1996, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2010);
    float _2014 = fma(_1966, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2002);
    float _2016 = _1982 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2018 = _1982 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2020 = -_1998;
    float _2022 = fma(_2020, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2012);
    float _2024 = fma(_2004, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2014);
    float _2026 = exp2(_2008);
    float _2028 = fma(_1990, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2016);
    float _2030 = fma(_2022, -0.5, 0.5);
    float _2032 = fma(_2022, 0.5, 0.5);
    float _2034 = fma(_1990, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2018);
    float _2036 = _1996 + 1.0;
    float _2038 = fma(_1966, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2028);
    float _2040 = fma(_2032, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2042 = 1.0 / _2024;
    float _2044 = fma(_1966, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2034);
    float _2046 = fma(_2004, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2038);
    float _2048 = _2006 * 0.693147182464599609375;
    float _2050 = fma(_2004, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2044);
    float _2052 = sqrt(_2030);
    float _2054 = -_1996;
    float _2056 = fma(_2026, _2036, _2054);
    float _2058 = fma(_2032, _2040, -0.212114393711090087890625);
    float _2060 = fma(_2032, _2058, 1.570728778839111328125);
    float _2062 = _2046 * _2042;
    float _2064 = _2050 * _2042;
    float _2066 = _2048 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2068 = fma(_2056, 0.5, 0.5);
    float _2070 = fma(_2062, 0.5, 0.5);
    float _2072 = fma(_2064, -0.5, 0.5);
    float _2074 = _2052 * 0.636619746685028076171875;
    float3 _5498 = float3(_2070, _2072, _2066);
    float _2076 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5498, float3(0.0), isnan(_5498)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5498, float3(0.0), isnan(_5498)), level(0.0)).x;
    float3 _5509 = float3(_2070, _2072, _2066);
    float4 _2079 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5509, float3(0.0), isnan(_5509)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5509, float3(0.0), isnan(_5509)), level(0.0)).xyzw;
    float _2081 = _2079.x;
    float _2083 = _2079.y;
    float _2085 = _2079.z;
    float _2087 = _2079.w;
    float _2089 = -_2060;
    float _2091 = fma(_2074, _2089, 1.0);
    float2 _5531 = float2(_2091, _2068);
    float3 _2095 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5531, float2(0.0), isnan(_5531)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5531, float2(0.0), isnan(_5531)), level(0.0)).xyz;
    float _2097 = _2095.x;
    float _2099 = _2095.y;
    float _2101 = _2095.z;
    float _2103 = _1688 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2105 = _1688 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    out.m_75.x = _1776;
    out.m_75.y = _1772;
    out.m_75.z = _1780;
    float _2107 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2103);
    float _2109 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2105);
    float _2111 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2107);
    float _2113 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2109);
    float _2115 = _2111 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2117 = _2113 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2119 = 1.0 / _2115;
    bool _2121 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2123 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2125 = _2121 || _2123;
    bool _2127 = isnan(0.5);
    bool _2129 = _2125 || _2127;
    float _2131 = _2117 + _2115;
    float _2133 = _2046 + _2024;
    float _2135 = _2133 * 0.5;
    float _2137 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (!_2129)
    {
        _1708 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2139 = _1708;
    float _2141 = _2131 * _2119;
    float _2143 = _2141 * 0.5;
    float _2145 = _1982 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2147 = _1974 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2149 = _2143;
    float _2151 = _2139;
    float _2153 = _2145;
    if (!_2129)
    {
        float _2155 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2157 = fma(_2143, _2139, _2155);
        _2149 = _2157;
    }
    float _2159 = _2149;
    if (!_2129)
    {
        _2151 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2161 = _2151;
    float _2163 = fma(_1990, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2145);
    float _2165 = _2161;
    if (_2129)
    {
        _2153 = 1.0;
    }
    float _2167 = _2153;
    float _2169 = exp2(_2147);
    float _2171 = _2167;
    if (!_2129)
    {
        float _2173 = -_2161;
        float _2175 = _2173 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2137 = _2175;
    }
    float _2177 = _2137;
    float _2179 = fma(_1966, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2163);
    float _2181 = fma(_2004, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2179);
    float _2183 = _2159;
    if (!_2129)
    {
        float _2185 = 1.0 / _2159;
        _2183 = _2185;
    }
    float _2187 = _2183;
    float _2189 = _2181 + _2024;
    out.gl_Position.x = _2046;
    out.gl_Position.y = _2050;
    out.gl_Position.z = _2181;
    out.gl_Position.w = _2024;
    float _2191 = _2189 * 0.5;
    float _2193 = _2177;
    if (!_2129)
    {
        float _2195 = 1.0 / _2177;
        _2193 = _2195;
    }
    float _2197 = _2193;
    float _2199 = -_2169;
    float _2201 = _2199 + 1.0;
    float _2203 = _2201 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_2129)
    {
        float _2205 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2207 = -_2161;
        float _2209 = fma(_2187, _2205, _2207);
        _2165 = _2209;
    }
    float _2211 = _2165;
    if (!_2129)
    {
        float _2213 = _2211 * _2197;
        float _2215 = precise::clamp(_2213, 0.0, 1.0);
        _2171 = _2215;
    }
    float _2217 = _2171;
    float _2219 = _2024 * 0.5;
    float _2221 = _2217 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2223 = _2217 > 0.0;
    bool _2225 = isnan(_2217);
    bool _2227 = _2223 || _2225;
    bool _2229 = isnan(0.0);
    bool _2231 = _2227 || _2229;
    float _2233 = -_2203;
    float _2235 = _2233 + 1.0;
    float _2237 = fma(_2050, -0.5, _2219);
    float _2239 = _2221 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_77.x = _2135;
    out.m_77.y = _2237;
    out.m_77.z = _2191;
    out.m_77.w = _2024;
    out.m_47.x = _2239;
    float _2241 = _2203 * _2076;
    float _2243 = _2087 * _2235;
    float _2245 = _2087 * _2241;
    float _2247 = _2101 * _2241;
    float _2249 = fma(_2097, _2245, _2081);
    float _2251 = fma(_2099, _2245, _2083);
    float _2253 = fma(_2087, _2247, _2085);
    out.m_79.x = _2249;
    out.m_79.y = _2251;
    out.m_79.z = _2253;
    out.m_79.w = _2243;
    if (_2231)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2255 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2255;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

