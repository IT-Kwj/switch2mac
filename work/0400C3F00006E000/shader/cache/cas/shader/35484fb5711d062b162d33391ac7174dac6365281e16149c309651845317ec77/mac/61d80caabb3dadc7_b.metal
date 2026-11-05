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
    float4 m_69 [[user(locn1)]];
    float4 m_75 [[user(locn2)]];
    float4 m_65 [[user(locn3)]];
    float4 m_73 [[user(locn4)]];
    float4 m_71 [[user(locn5)]];
    float4 m_77 [[user(locn6)]];
    float4 m_47 [[user(locn7)]];
    float4 m_67 [[user(locn8)]];
    float4 m_79 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_59 [[attribute(4)]];
    float4 m_57 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_61 [[attribute(8)]];
    float4 m_63 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1440 = false;
    bool _444 = false;
    bool _294 = false;
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
        float _2052 = as_type<float>(_114);
        out.gl_Position.z = _2052;
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
    if (_128)
    {
        float _134 = float(_98);
        _108 = _134;
    }
    float _136 = _108;
    bool _138 = _132 >= _136;
    bool _140 = !_128;
    bool _142 = _138 || _140;
    float _144 = _136;
    if (_142)
    {
        _144 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _146 = _144;
    if (_142)
    {
        out.m_47.x = 0.0;
    }
    if (_142)
    {
        float _148 = _146 * 5.0;
        _116 = as_type<int>(_148);
    }
    int _150 = _116;
    if (_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2121 = as_type<float>(_150);
        out.gl_Position.z = _2121;
    }
    if (_142)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _152 = in.m_51.w;
    float _154 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _156 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _158 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _160 = _156 || _158;
    bool _162 = isnan(1.0);
    bool _164 = _160 || _162;
    float _166 = in.m_49.x;
    float _168 = in.m_49.y;
    float _170 = in.m_49.z;
    float _172 = in.m_44.x;
    float _174 = in.m_44.y;
    float _176 = in.m_44.z;
    float _178 = 0.0;
    float _180 = _154;
    if (!_164)
    {
        float _182 = _154 * _154;
        float _184 = _182 * 0.5;
        _178 = _184;
    }
    float _186 = _178;
    float _188 = _186;
    if (!_164)
    {
        float _190 = _186 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _188 = _190;
    }
    float _192 = _188;
    bool _194 = !_164;
    float _196 = _192;
    if (!_194)
    {
        float _198 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _200 = log2(_198);
        float _202 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _204 = _202 + 1.0;
        float _206 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _208 = _154 * _200;
        float _210 = 1.0 / _204;
        float _212 = _206 * 0.693147182464599609375;
        float _214 = exp2(_208);
        float _216 = 1.0 / _212;
        float _218 = _214 + (-1.0);
        float _220 = -_218;
        float _222 = fma(_220, _216, _154);
        float _224 = _222 * _210;
        float _226 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _196 = _226;
    }
    float _228 = _196;
    bool _230 = !_164;
    if (!_230)
    {
        float _232 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _234 = log2(_232);
        float _236 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _238 = _236 + 1.0;
        float _240 = 1.0 / _238;
        float _242 = _154 * _234;
        float _244 = exp2(_242);
        float _246 = -_244;
        float _248 = _246 + 1.0;
        float _250 = _248 * _240;
        _180 = _250;
    }
    float _252 = _180;
    bool _254 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _256 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _258 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _260 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _262 = fma(_252, _166, _256);
    float _264 = fma(_252, _168, _258);
    float _266 = fma(_252, _170, _260);
    float _268 = fma(_262, _152, _172);
    float _270 = fma(_264, _152, _174);
    float _272 = fma(_266, _152, _176);
    bool _274 = !_254;
    float _292;
    if (!_274)
    {
        float _276 = in.m_53.x;
        float _278 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _280 = _276 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _282 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[11].y, _132);
        float _284 = _282 * _278;
        float _286 = floor(_284);
        float _288 = -_286;
        float _290 = _284 + _288;
        _292 = _290;
        _294 = true;
    }
    else
    {
        float _296 = float(_98);
        float _298 = 1.0 / _296;
        float _300 = _132 * _298;
        _292 = _300;
    }
    _294 = false;
    float _302 = _292;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _306 = _304 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _308 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _310 = isnan(_302);
    bool _312 = _308 || _310;
    bool _314 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _316 = _312 || _314;
    float _318 = float(_316);
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _322 = _320 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _324 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _326 = isnan(_302);
    bool _328 = _324 || _326;
    bool _330 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _332 = _328 || _330;
    float _334 = float(_332);
    float _336 = 1.0 / _306;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _338;
    float _342 = -_318;
    float _344 = _342 + 1.0;
    bool _346 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _348 = isnan(_302);
    bool _350 = _346 || _348;
    bool _352 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _354 = _350 || _352;
    float _356 = float(_354);
    bool _358 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _360 = _334 * _344;
    float _362 = -_334;
    float _364 = _362 + 1.0;
    float _366 = 1.0 / _322;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _370 = _368 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _372 = _340 * _336;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _376 = _302 + _374;
    float _378 = -_356;
    float _380 = _378 + 1.0;
    float _382 = fma(_372, _376, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _386 = _302 + _384;
    float _388 = _318 * _380;
    float _390 = _370 * _366;
    float _392 = _382 * _360;
    float _394 = fma(_390, _386, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _396 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[115].x, _392);
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _400 = fma(_394, _388, _396);
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _404 = _398 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _408 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[117].x, _400);
    float _410 = _402 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _412 = _406 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _414 = _408 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _404;
    out.m_55.y = _410;
    out.m_55.z = _412;
    out.m_55.w = _414;
    bool _416 = !_358;
    float _440;
    float _442;
    if (!_416)
    {
        float _418 = in.m_53.x;
        float _420 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _422 = float(_98);
        float _424 = 1.0 / _422;
        float _426 = _418 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _428 = _132 * _424;
        float _430 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[11].w, _132);
        float _432 = _430 * _420;
        float _434 = floor(_432);
        float _436 = -_434;
        float _438 = _432 + _436;
        _440 = _438;
        _442 = _428;
        _444 = true;
    }
    else
    {
        float _446 = float(_98);
        float _448 = 1.0 / _446;
        float _450 = _132 * _448;
        _440 = _450;
        _442 = _450;
    }
    _444 = false;
    float _452 = _440;
    float _454 = _442;
    float _456 = in.m_53.w;
    float _458 = _270 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _460 = in.m_57.x;
    float _462 = in.m_57.y;
    float _464 = in.m_57.z;
    int _466 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _468 = _466 != 0;
    float _470 = _270 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _472 = in.m_51.x;
    float _474 = in.m_51.y;
    float _476 = in.m_51.z;
    float _478 = _270 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _482 = _480 != 0;
    float _484 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[4].x, _458);
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _488 = _486 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    int _490 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _492 = _490 != 0;
    float _494 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[5].x, _470);
    int _496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _498 = _496 != 0;
    float _500 = 1.0 / _488;
    int _502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _504 = _502 != 0;
    float _506 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[6].x, _478);
    float _508 = in.m_53.y;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _512 = _452 + _510;
    float _514 = in.m_53.x;
    bool _516 = _456 > 0.5;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _522 = in.m_59.x;
    float _524 = in.m_59.y;
    float _526 = in.m_59.z;
    bool _528 = _462 != 0.0;
    bool _530 = isnan(_462);
    bool _532 = _528 || _530;
    bool _534 = isnan(0.0);
    bool _536 = _532 || _534;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _540 = _538 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _542 = _474 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    bool _544 = _460 == 0.0;
    bool _546 = !_536;
    bool _548 = _544 && _546;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _552 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _550;
    float _554 = _476 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _556 = 1.0 / _520;
    bool _558 = _464 == 0.0;
    bool _560 = _558 && _548;
    float _562 = _552 * _500;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _566 = _564 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _570 = _568 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _572 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _460);
    float _574 = 1.0 / _540;
    float _576 = in.m_61.y;
    float _578 = _472 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _582 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _464);
    float _584 = _522;
    float _586 = _526;
    float _588 = _524;
    bool _590 = _498;
    bool _592 = _560;
    if (!_560)
    {
        float _594 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[17].y, _522);
        _584 = _594;
    }
    float _596 = _584;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _600 = _598 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _602 = 1.0 / _566;
    if (!_560)
    {
        float _604 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[17].y, _526);
        _586 = _604;
    }
    float _606 = _586;
    if (!_560)
    {
        float _608 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[17].y, _524);
        _588 = _608;
    }
    float _610 = _588;
    float _612 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _462);
    float _614 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[4].z, _484);
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _618 = _616 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _622 = 1.0 / _570;
    float _624 = _508 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _626 = _514 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _628 = 0.0;
    if (_492)
    {
        float _630 = in.m_53.z;
        _628 = _630;
    }
    float _632 = _628;
    float _634 = fma(_624, -2.0, _580);
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _636;
    float _640 = 1.0 / _618;
    float _642 = _638 * _556;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _646 = _644 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _648 = -_620;
    float _650 = fma(_626, 2.0, _648);
    float _652 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[5].z, _494);
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _656 = _654 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _658 = _646 * _574;
    float _660 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[6].z, _506);
    float _662 = 1.0 / _656;
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _666 = _664 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _668 = 0.0;
    if (!_468)
    {
        float _670 = in.m_53.z;
        _668 = _670;
    }
    float _672 = _668;
    float _674 = _652 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _678 = _676 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _680 = 0.0;
    float _682 = _576;
    if (!_468)
    {
        _680 = _508;
    }
    float _684 = _680;
    float _686 = 1.0 / _600;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _688;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _694 = _692 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _696 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _698 = _684;
    if (_468)
    {
        _698 = _514;
    }
    float _700 = _698;
    float _702 = _690 * _622;
    float _704 = _694 * _602;
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _706;
    float _710 = 1.0 / _666;
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _714 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _712;
    float _716 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _718 = _716 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _720 = -_576;
    float _722 = _720 + 1.0;
    float _724 = _708 * _640;
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _728 = _454 + _726;
    float _730 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[78].z, _696);
    float _732 = _614 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _734 = _714 * _686;
    float _736 = _678 * _662;
    int _738 = _516 ? as_type<int>(_722) : as_type<int>(_576);
    float _740 = fma(_702, _728, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    bool _742 = _508 > 0.5;
    float _744 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _746 = _498 ? as_type<float>(_738) : _576;
    float _748 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _750 = _674 + _748;
    float _752 = _640;
    if (_482)
    {
        bool _754 = _514 > 0.5;
        _590 = _754;
    }
    bool _756 = _590;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _760 = _454 + _758;
    float _762 = _718 * _710;
    float _764 = fma(_642, _512, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    if (_504)
    {
        float _766 = _742 ? _722 : _576;
        _682 = _766;
    }
    float _768 = _682;
    float _770 = fma(_734, _760, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    if (_492)
    {
        bool _772 = _632 > 0.5;
        _592 = _772;
    }
    bool _774 = _592;
    float _776 = _660 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _778 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _780 = _732 + _778;
    float _782 = _750 * _750;
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _786 = _454 + _784;
    float _788 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _790 = _776 + _788;
    float _792 = fma(_780, _780, _782);
    float _794 = fma(_704, _786, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    bool _796 = _452 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _798 = isnan(_452);
    bool _800 = _796 || _798;
    bool _802 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _804 = _800 || _802;
    float _806 = float(_804);
    float _808 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _810 = _744 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _812 = fma(_790, _790, _792);
    float _814 = 0.0;
    float _816 = _672;
    if (!_468)
    {
        _814 = _672;
    }
    float _818 = _814;
    float _820 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _822 = _452 + _820;
    float _824 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _826 = _454 + _824;
    float _828 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[78].w, _808);
    float _830 = _818;
    if (_468)
    {
        _830 = _508;
    }
    float _832 = _830;
    float _834 = fma(_746, _810, -0.5);
    if (_468)
    {
        _816 = _508;
    }
    float _836 = _816;
    float _838 = -_806;
    float _840 = _838 + 1.0;
    bool _842 = _452 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _844 = isnan(_452);
    bool _846 = _842 || _844;
    bool _848 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _850 = _846 || _848;
    float _852 = float(_850);
    float _854 = fma(_658, _822, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _856 = _454 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _858 = isnan(_454);
    bool _860 = _856 || _858;
    bool _862 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _864 = _860 || _862;
    float _866 = float(_864);
    float _868 = fma(_762, _826, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _870 = rsqrt(_812);
    float _872 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _874 = _454 + _872;
    bool _876 = _452 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _878 = isnan(_452);
    bool _880 = _876 || _878;
    bool _882 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _884 = _880 || _882;
    float _886 = float(_884);
    float _888 = _852 * _840;
    float _890 = -_852;
    float _892 = _890 + 1.0;
    bool _894 = _454 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _896 = isnan(_454);
    bool _898 = _894 || _896;
    bool _900 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _902 = _898 || _900;
    float _904 = float(_902);
    float _906 = -_866;
    float _908 = _906 + 1.0;
    float _910 = fma(_736, _874, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    bool _912 = _454 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _914 = isnan(_454);
    bool _916 = _912 || _914;
    bool _918 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _920 = _916 || _918;
    float _922 = float(_920);
    float _924 = _886 * _892;
    float _926 = _904 * _908;
    float _928 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _930 = _454 + _928;
    float _932 = -_904;
    float _934 = _932 + 1.0;
    float _936 = _764 * _924;
    bool _938 = _454 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _940 = isnan(_454);
    bool _942 = _938 || _940;
    bool _944 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _946 = _942 || _944;
    float _948 = float(_946);
    float _950 = -_922;
    float _952 = _950 + 1.0;
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _956 = _454 + _954;
    float _958 = fma(_562, _930, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _960 = _922 * _934;
    float _962 = _948 * _952;
    float _964 = fma(_724, _956, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _966 = _750 * _870;
    bool _968 = _454 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _970 = isnan(_454);
    bool _972 = _968 || _970;
    bool _974 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _976 = _972 || _974;
    float _978 = float(_976);
    float _980 = -_948;
    float _982 = _980 + 1.0;
    float _984 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _986 = _780 * _870;
    bool _988 = _454 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _990 = isnan(_454);
    bool _992 = _988 || _990;
    bool _994 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _996 = _992 || _994;
    float _998 = float(_996);
    float _1000 = -_966;
    float _1002 = fma(_1000, (*spvDescriptorSet0.vp_c9)._m0[18].w, _750);
    float _1004 = _978 * _982;
    float _1006 = -_978;
    float _1008 = _1006 + 1.0;
    float _1010 = -_986;
    float _1012 = fma(_1010, (*spvDescriptorSet0.vp_c9)._m0[18].w, _780);
    bool _1014 = _454 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1016 = isnan(_454);
    bool _1018 = _1014 || _1016;
    bool _1020 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1022 = _1018 || _1020;
    float _1024 = float(_1022);
    float _1026 = _1002 * _1002;
    float _1028 = _790 * _870;
    float _1030 = -_998;
    float _1032 = _1030 + 1.0;
    float _1034 = _998 * _1008;
    float _1036 = fma(_1012, _1012, _1026);
    float _1038 = -_1028;
    float _1040 = fma(_1038, (*spvDescriptorSet0.vp_c9)._m0[18].w, _790);
    bool _1042 = _454 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1044 = isnan(_454);
    bool _1046 = _1042 || _1044;
    bool _1048 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1050 = _1046 || _1048;
    float _1052 = float(_1050);
    float _1054 = _1024 * _1032;
    float _1056 = -_1024;
    float _1058 = _1056 + 1.0;
    float _1060 = fma(_1040, _1040, _1036);
    float _1062 = _554 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1064 = _1052 * _1058;
    float _1066 = _984 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1068 = sqrt(_1060);
    float _1070 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1072 = fma(_1066, _768, -0.5);
    float _1074 = _740 * _1064;
    float _1076 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1070);
    float _1078 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1080 = _700 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1082 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1084 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[76].y, _634);
    float _1086 = in.m_61.x;
    float _1088 = -_1078;
    float _1090 = fma(_1080, 2.0, _1088);
    float _1092 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1082);
    float _1094 = _542 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1096 = _578 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1098 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].w, _828);
    float _1100 = _870 * _1068;
    float _1102 = _610 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1104 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].z, _730);
    float _1106 = -_1084;
    float _1108 = fma(_1098, _1072, _1106);
    float _1110 = _1094 * _1100;
    float _1112 = _1096 * _1100;
    float _1114 = _1062 * _1100;
    float _1116 = -_132;
    float _1118 = fma(_1116, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1090);
    float _1120 = _1110 * _612;
    float _1122 = _1112 * _572;
    float _1124 = _1114 * _582;
    float _1126 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1128 = _1120 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1130 = _1120 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1132 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1092);
    float _1134 = fma(_1122, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1128);
    float _1136 = fma(_1122, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1130);
    float _1138 = -_1052;
    float _1140 = _1138 + 1.0;
    float _1142 = -_886;
    float _1144 = _1142 + 1.0;
    float _1146 = fma(_1124, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1134);
    float _1148 = fma(_1124, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1136);
    float _1150 = _832 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1152 = fma(_1144, (*spvDescriptorSet0.vp_c9)._m0[131].x, _936);
    float _1154 = _732 + _1146;
    float _1156 = _776 + _1148;
    float _1158 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1160 = _610 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1162 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1164 = _1154 + _1162;
    float _1166 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1168 = _1156 + _1166;
    float _1170 = fma(_1150, -2.0, _1158);
    float _1172 = _1126 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1174 = _1164 * _1164;
    float _1176 = _1168 * _1168;
    float _1178 = fma(_1140, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1074);
    float _1180 = _610 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    int _1182 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[82].x);
    float _1184 = _1086;
    float _1186 = _1174;
    float _1188 = _1176;
    float _1190 = _1154;
    float _1192 = _1156;
    float _1194 = _868;
    if (_482)
    {
        float _1196 = -_1086;
        float _1198 = _1196 + 1.0;
        _1182 = as_type<int>(_1198);
    }
    int _1200 = _1182;
    float _1202 = _1174 + _1176;
    float _1204 = fma(_596, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1160);
    if (!_482)
    {
        _752 = _1086;
    }
    float _1206 = _752;
    float _1208 = fma(_854, _888, _1152);
    float _1210 = sqrt(_1202);
    float _1212 = _1206;
    if (_482)
    {
        float _1214 = _756 ? as_type<float>(_1200) : _1086;
        _1212 = _1214;
    }
    float _1216 = _1212;
    int _1218 = 0;
    if (_492)
    {
        float _1220 = -_1086;
        float _1222 = _1220 + 1.0;
        _1218 = as_type<int>(_1222);
    }
    int _1224 = _1218;
    float _1226 = -_132;
    float _1228 = fma(_1226, (*spvDescriptorSet0.vp_c9)._m0[76].x, _650);
    float _1230 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1170);
    float _1232 = _1120 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1234 = fma(_1172, _1216, -0.5);
    float _1236 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1076);
    float _1238 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1240 = in.m_63.w;
    if (_492)
    {
        float _1242 = _774 ? as_type<float>(_1224) : _1086;
        _1184 = _1242;
    }
    float _1244 = _1184;
    float _1246 = fma(_794, _1054, _1178);
    float _1248 = fma(_1122, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1232);
    float _1250 = fma(_596, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1180);
    float _1252 = fma(_596, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1102);
    float _1254 = fma(_770, _1034, _1246);
    bool _1256 = _1210 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1258 = fma(_1124, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1248);
    float _1260 = fma(_910, _1004, _1254);
    float _1262 = -_1230;
    float _1264 = fma(_1132, _834, _1262);
    float _1266 = fma(_806, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1208);
    float _1268 = _674 + _1258;
    float _1270 = fma(_606, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1250);
    float _1272 = _1238 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1274 = fma(_606, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1204);
    float _1276 = fma(_1104, _1234, _1228);
    float _1278 = fma(_964, _962, _1260);
    float _1280 = fma(_1272, _1244, -0.5);
    float _1282 = fma(_606, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1252);
    float _1284 = _1260;
    float _1286 = _1268;
    if (!_1256)
    {
        _1284 = _1268;
    }
    float _1288 = _1284;
    float _1290 = fma(_1236, _1280, _1118);
    bool _1292 = !_1256;
    float _1294 = _1288;
    if (!_1292)
    {
        float _1296 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1298 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1300 = _1210 + _1298;
        float _1302 = _1268 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1304 = rsqrt(_1202);
        float _1306 = _1300 * _1296;
        float _1308 = _1306 * 0.15915493667125701904296875;
        float _1310 = _1308 * 6.283185482025146484375;
        float _1312 = sin(_1310);
        float _1314 = _1308 * 6.283185482025146484375;
        float _1316 = cos(_1314);
        float _1318 = fma(_1312, _1302, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1320 = _1304 * _1318;
        float _1322 = _1316 + (-1.0);
        float _1324 = fma(_1164, _1320, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1326 = fma(_1168, _1320, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1328 = _1322 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1330 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1332 = _1324 + _1330;
        float _1334 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1336 = _1326 + _1334;
        float _1338 = fma(_1268, _1316, _1328);
        float _1340 = _1332 * _1332;
        float _1342 = _1336 * _1336;
        _1294 = _1338;
        _1186 = _1340;
        _1188 = _1342;
        _1190 = _1324;
        _1192 = _1326;
    }
    float _1344 = _1294;
    float _1346 = _1186;
    float _1348 = _1188;
    float _1350 = _1190;
    float _1352 = _1192;
    float _1354 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1356 = _1344 + _1354;
    float _1358 = fma(_868, _960, _1278);
    float _1360 = _1108 + 0.5;
    float _1362 = fma(_1356, _1356, _1346);
    float _1364 = fma(_958, _926, _1358);
    float _1366 = _1362 + _1348;
    float _1368 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1370 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1372 = _1266 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1374 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1376 = _1368 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1378 = sqrt(_1366);
    float _1380 = _1370 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1382 = _1374 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1384 = _1276 + 0.5;
    float _1386 = _1290 + 0.5;
    float _1388 = _1264 + 0.5;
    float _1390 = fma(_866, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1364);
    out.m_65.w = _1240;
    out.m_67.x = _1270;
    out.m_67.y = _1274;
    out.m_67.z = _1282;
    out.m_69.x = _1376;
    out.m_69.y = _1380;
    out.m_69.z = _1382;
    out.m_69.w = _1372;
    bool _1392 = _1378 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1394 = isnan(_1378);
    bool _1396 = _1392 || _1394;
    bool _1398 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1400 = _1396 || _1398;
    out.m_71.x = _1384;
    out.m_71.y = _1360;
    out.m_71.z = _1386;
    out.m_71.w = _1388;
    out.m_73.x = _1390;
    float _1402 = _1376;
    float _1404 = _1372;
    if (!_1400)
    {
        _1194 = 1.0;
    }
    float _1406 = _1194;
    bool _1408 = !_1400;
    float _1410 = _1406;
    if (!_1408)
    {
        bool _1412 = _1378 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1414 = isnan(_1378);
        bool _1416 = _1412 || _1414;
        bool _1418 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1420 = _1416 || _1418;
        if (!_1420)
        {
            float _1422 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1424 = _1378 + _1422;
            float _1426 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1428 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1426;
            float _1430 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1432 = _1430 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1434 = 1.0 / _1428;
            float _1436 = _1424 * _1434;
            float _1438 = fma(_1436, _1432, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1410 = _1438;
            _1440 = true;
        }
        else
        {
            bool _1442 = _1378 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1444 = isnan(_1378);
            bool _1446 = _1442 || _1444;
            bool _1448 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1450 = _1446 || _1448;
            if (!_1450)
            {
                float _1452 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1454 = _1378 + _1452;
                float _1456 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1458 = _1456 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1460 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1462 = _1460 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1464 = 1.0 / _1458;
                float _1466 = _1454 * _1464;
                float _1468 = fma(_1466, _1462, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1410 = _1468;
                _1440 = true;
            }
            else
            {
                _1410 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1440 = false;
    float _1470 = _1410;
    float _1472 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1474 = _1344 + _1472;
    float _1476 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1478 = _1350 + _1476;
    float _1480 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1482 = _1352 + _1480;
    float _1484 = fma(_1474, _1470, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1486 = fma(_1478, _1470, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1488 = fma(_1482, _1470, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1490 = -_966;
    float _1492 = fma(_1490, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1484);
    float _1494 = -_986;
    float _1496 = fma(_1494, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1486);
    float _1498 = -_1028;
    float _1500 = fma(_1498, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1488);
    float _1502 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1504 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1506 = _1492 + _1504;
    float _1508 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1510 = _1496 + _1508;
    float _1512 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1514 = _1500 + _1512;
    float _1516 = _1506 * _1506;
    float _1518 = fma(_1510, _1510, _1516);
    float _1520 = fma(_1514, _1514, _1518);
    float _1522 = rsqrt(_1520);
    float _1524 = _1522 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1526 = _1510 * _1524;
    float _1528 = _1514 * _1524;
    float _1530 = _1526 * _1526;
    float _1532 = _1528 * _1528;
    float _1534 = _1530 + _1532;
    float _1536 = sqrt(_1534);
    bool _1538 = _1536 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1540 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1542 = _1536 + _1540;
    float _1544 = _1518;
    float _1546 = _1542;
    float _1548 = _1526;
    if (_1538)
    {
        float _1550 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1544 = _1550;
    }
    float _1552 = _1544;
    if (_1538)
    {
        float _1554 = rsqrt(_1534);
        _1402 = _1554;
    }
    float _1556 = _1402;
    float _1558 = _1556;
    if (_1538)
    {
        float _1560 = _1542 * _1552;
        _1546 = _1560;
    }
    float _1562 = _1546;
    if (_1538)
    {
        float _1564 = _1562 * 0.15915493667125701904296875;
        _1404 = _1564;
    }
    float _1566 = _1404;
    float _1568 = _1552;
    if (_1538)
    {
        float _1570 = _1566 * 6.283185482025146484375;
        float _1572 = sin(_1570);
        _1568 = _1572;
    }
    float _1574 = _1568;
    float _1576 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1578 = precise::max(0.0, _1576);
    float _1580 = _866;
    float _1582 = _1578;
    if (_1538)
    {
        float _1584 = _1566 * 6.283185482025146484375;
        float _1586 = cos(_1584);
        _1580 = _1586;
    }
    float _1588 = _1580;
    float _1590 = -_1524;
    float _1592 = -_1578;
    float _1594 = fma(_1506, _1590, _1592);
    float _1596 = _1594;
    if (_1538)
    {
        float _1598 = _1594 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1582 = _1598;
    }
    float _1600 = _1582;
    float _1602 = sqrt(_1520);
    float _1604 = _1574;
    float _1606 = _1600;
    if (_1538)
    {
        float _1608 = fma(_1574, _1600, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1604 = _1608;
    }
    float _1610 = _1604;
    float _1612 = _1610;
    float _1614 = _1588;
    if (_1538)
    {
        float _1616 = _1588 + (-1.0);
        _1606 = _1616;
    }
    float _1618 = _1606;
    float _1620 = _1618;
    if (_1538)
    {
        float _1622 = _1556 * _1610;
        _1286 = _1622;
    }
    float _1624 = _1286;
    if (!_1538)
    {
        _1558 = _1528;
    }
    float _1626 = _1558;
    float _1628 = _1626;
    if (_1538)
    {
        float _1630 = _1618 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1612 = _1630;
    }
    float _1632 = _1612;
    if (_1538)
    {
        float _1634 = _1526 * _1624;
        _1548 = _1634;
    }
    float _1636 = _1548;
    if (!_1538)
    {
        _1620 = _1530;
    }
    float _1638 = _1620;
    float _1640 = _1638;
    if (_1538)
    {
        float _1642 = _1528 * _1624;
        _1628 = _1642;
    }
    float _1644 = _1628;
    if (_1538)
    {
        float _1646 = fma(_1594, _1588, _1632);
        _1596 = _1646;
    }
    float _1648 = _1596;
    if (_1538)
    {
        float _1650 = _1636 * _1636;
        _1640 = _1650;
    }
    float _1652 = _1640;
    if (!_1538)
    {
        _1614 = _1532;
    }
    float _1654 = _1614;
    float _1656 = _1654;
    if (_1538)
    {
        float _1658 = _1644 * _1644;
        _1656 = _1658;
    }
    float _1660 = _1656;
    float _1662 = fma(_1648, _1648, _1652);
    float _1664 = _1662 + _1660;
    float _1666 = _1492 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1668 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1670 = fma(_1602, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1668);
    float _1672 = precise::clamp(_1670, 0.0, 1.0);
    float _1674 = _1492 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1676 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1666);
    float _1678 = rsqrt(_1664);
    float _1680 = _1492 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1682 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1674);
    float _1684 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1676);
    float _1686 = _1492 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1688 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1680);
    float _1690 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1682);
    float _1692 = _1684 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1694 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1686);
    float _1696 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1688);
    float _1698 = _1690 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1700 = _1692 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1702 = -_1672;
    float _1704 = _1702 + 1.0;
    float _1706 = _1696 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1708 = -_1700;
    float _1710 = fma(_1708, _1502, 1.0);
    float _1712 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1694);
    float _1714 = _1698 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1716 = _1678 * _1636;
    float _1718 = abs(_1704);
    float _1720 = log2(_1718);
    float _1722 = _1678 * _1648;
    float _1724 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1714);
    float _1726 = _1716 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1728 = _1678 * _1644;
    float _1730 = _1712 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1732 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1724);
    float _1734 = -_1726;
    float _1736 = fma(_1722, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1734);
    float _1738 = log2(_1710);
    float _1740 = _1698 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1742 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1732);
    float _1744 = -_1728;
    float _1746 = fma(_1744, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1736);
    float _1748 = _1698 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1750 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1740);
    float _1752 = _1722 + 1.0;
    float _1754 = fma(_1746, -0.5, 0.5);
    float _1756 = _1720 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1758 = 1.0 / _1742;
    float _1760 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1748);
    float _1762 = fma(_1746, 0.5, 0.5);
    float _1764 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1750);
    float _1766 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1760);
    float _1768 = fma(_1762, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1770 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1764);
    float _1772 = exp2(_1756);
    float _1774 = _1738 * 0.693147182464599609375;
    float _1776 = fma(_1762, _1768, -0.212114393711090087890625);
    float _1778 = _1774 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1780 = fma(_1762, _1776, 1.570728778839111328125);
    float _1782 = sqrt(_1754);
    float _1784 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1766);
    float _1786 = _1770 * _1758;
    float _1788 = _1784 * _1758;
    float _1790 = fma(_1786, -0.5, 0.5);
    float _1792 = -_1722;
    float _1794 = fma(_1772, _1752, _1792);
    float _1796 = fma(_1788, 0.5, 0.5);
    float _1798 = fma(_1794, 0.5, 0.5);
    float _1800 = _1782 * 0.636619746685028076171875;
    float3 _4849 = float3(_1796, _1790, _1778);
    float _1802 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4849, float3(0.0), isnan(_4849)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4849, float3(0.0), isnan(_4849)), level(0.0)).x;
    float3 _4860 = float3(_1796, _1790, _1778);
    float4 _1805 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4860, float3(0.0), isnan(_4860)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4860, float3(0.0), isnan(_4860)), level(0.0)).xyzw;
    float _1807 = _1805.x;
    float _1809 = _1805.y;
    float _1811 = _1805.z;
    float _1813 = _1805.w;
    float _1815 = -_1780;
    float _1817 = fma(_1800, _1815, 1.0);
    float2 _4882 = float2(_1817, _1798);
    float3 _1821 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4882, float2(0.0), isnan(_4882)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4882, float2(0.0), isnan(_4882)), level(0.0)).xyz;
    float _1823 = _1821.x;
    float _1825 = _1821.y;
    float _1827 = _1821.z;
    float _1829 = -_966;
    float _1831 = fma(_1829, (*spvDescriptorSet0.vp_c9)._m0[18].w, _674);
    float _1833 = -_986;
    float _1835 = fma(_1833, (*spvDescriptorSet0.vp_c9)._m0[18].w, _732);
    float _1837 = -_1028;
    float _1839 = fma(_1837, (*spvDescriptorSet0.vp_c9)._m0[18].w, _776);
    out.m_75.x = _1510;
    out.m_75.y = _1506;
    out.m_75.z = _1514;
    float _1841 = _1831 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1843 = _1831 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1845 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1841);
    float _1847 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1843);
    float _1849 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1845);
    float _1851 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1847);
    float _1853 = _1849 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1855 = _1851 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1857 = 1.0 / _1853;
    bool _1859 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1861 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1863 = _1859 || _1861;
    bool _1865 = isnan(0.5);
    bool _1867 = _1863 || _1865;
    float _1869 = _1855 + _1853;
    float _1871 = _1720 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1873 = _1839;
    float _1875 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1877 = _1692;
    if (!_1867)
    {
        _1873 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1879 = _1873;
    float _1881 = exp2(_1871);
    float _1883 = _1869 * _1857;
    float _1885 = _1883 * 0.5;
    float _1887 = _1698 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1889 = _1885;
    float _1891 = _1879;
    if (!_1867)
    {
        float _1893 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1895 = fma(_1885, _1879, _1893);
        _1889 = _1895;
    }
    float _1897 = _1889;
    if (!_1867)
    {
        _1891 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _1899 = _1891;
    float _1901 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1887);
    float _1903 = _1899;
    if (!_1867)
    {
        float _1905 = -_1899;
        float _1907 = _1905 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1875 = _1907;
    }
    float _1909 = _1875;
    float _1911 = _1897;
    if (!_1867)
    {
        float _1913 = 1.0 / _1897;
        _1911 = _1913;
    }
    float _1915 = _1911;
    float _1917 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1901);
    if (_1867)
    {
        _1877 = 1.0;
    }
    float _1919 = _1877;
    float _1921 = -_1881;
    float _1923 = _1921 + 1.0;
    float _1925 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1917);
    float _1927 = _1909;
    float _1929 = _1919;
    if (!_1867)
    {
        float _1931 = 1.0 / _1909;
        _1927 = _1931;
    }
    float _1933 = _1927;
    float _1935 = _1925 + _1742;
    out.gl_Position.x = _1784;
    out.gl_Position.y = _1770;
    out.gl_Position.z = _1925;
    out.gl_Position.w = _1742;
    if (!_1867)
    {
        float _1937 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1939 = -_1899;
        float _1941 = fma(_1915, _1937, _1939);
        _1903 = _1941;
    }
    float _1943 = _1903;
    float _1945 = _1935 * 0.5;
    float _1947 = _1943;
    if (!_1867)
    {
        float _1949 = _1943 * _1933;
        float _1951 = precise::clamp(_1949, 0.0, 1.0);
        _1947 = _1951;
    }
    float _1953 = _1947;
    float _1955 = _1923 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_1867)
    {
        float _1957 = -_1953;
        float _1959 = _1957 + 1.0;
        _1929 = _1959;
    }
    float _1961 = _1929;
    float _1963 = _1961 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1965 = _1961 > 0.0;
    bool _1967 = isnan(_1961);
    bool _1969 = _1965 || _1967;
    bool _1971 = isnan(0.0);
    bool _1973 = _1969 || _1971;
    out.m_77.z = _1945;
    out.m_77.w = _1742;
    float _1975 = _1963 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_47.x = _1975;
    float _1977 = _1955 * _1802;
    float _1979 = -_1955;
    float _1981 = _1979 + 1.0;
    float _1983 = _1813 * _1977;
    float _1985 = _1813 * _1981;
    float _1987 = _1827 * _1977;
    float _1989 = fma(_1823, _1983, _1807);
    float _1991 = fma(_1825, _1983, _1809);
    float _1993 = fma(_1813, _1987, _1811);
    out.m_79.x = _1989;
    out.m_79.y = _1991;
    out.m_79.z = _1993;
    out.m_79.w = _1985;
    if (_1973)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _1995 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1995;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1440 = false;
    bool _444 = false;
    bool _294 = false;
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
        float _2052 = as_type<float>(_114);
        out.gl_Position.z = _2052;
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
    if (_128)
    {
        float _134 = float(_98);
        _108 = _134;
    }
    float _136 = _108;
    bool _138 = _132 >= _136;
    bool _140 = !_128;
    bool _142 = _138 || _140;
    float _144 = _136;
    if (_142)
    {
        _144 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _146 = _144;
    if (_142)
    {
        out.m_47.x = 0.0;
    }
    if (_142)
    {
        float _148 = _146 * 5.0;
        _116 = as_type<int>(_148);
    }
    int _150 = _116;
    if (_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2121 = as_type<float>(_150);
        out.gl_Position.z = _2121;
    }
    if (_142)
    {
        return out;
    }
    float _152 = in.m_51.w;
    float _154 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _156 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _158 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _160 = _156 || _158;
    bool _162 = isnan(1.0);
    bool _164 = _160 || _162;
    float _166 = in.m_49.x;
    float _168 = in.m_49.y;
    float _170 = in.m_49.z;
    float _172 = in.m_44.x;
    float _174 = in.m_44.y;
    float _176 = in.m_44.z;
    float _178 = 0.0;
    float _180 = _154;
    if (!_164)
    {
        float _182 = _154 * _154;
        float _184 = _182 * 0.5;
        _178 = _184;
    }
    float _186 = _178;
    float _188 = _186;
    if (!_164)
    {
        float _190 = _186 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _188 = _190;
    }
    float _192 = _188;
    bool _194 = !_164;
    float _196 = _192;
    if (!_194)
    {
        float _198 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _200 = log2(_198);
        float _202 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _204 = _202 + 1.0;
        float _206 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _208 = _154 * _200;
        float _210 = 1.0 / _204;
        float _212 = _206 * 0.693147182464599609375;
        float _214 = exp2(_208);
        float _216 = 1.0 / _212;
        float _218 = _214 + (-1.0);
        float _220 = -_218;
        float _222 = fma(_220, _216, _154);
        float _224 = _222 * _210;
        float _226 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _196 = _226;
    }
    float _228 = _196;
    bool _230 = !_164;
    if (!_230)
    {
        float _232 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _234 = log2(_232);
        float _236 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _238 = _236 + 1.0;
        float _240 = 1.0 / _238;
        float _242 = _154 * _234;
        float _244 = exp2(_242);
        float _246 = -_244;
        float _248 = _246 + 1.0;
        float _250 = _248 * _240;
        _180 = _250;
    }
    float _252 = _180;
    bool _254 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _256 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _258 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _260 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _262 = fma(_252, _166, _256);
    float _264 = fma(_252, _168, _258);
    float _266 = fma(_252, _170, _260);
    float _268 = fma(_262, _152, _172);
    float _270 = fma(_264, _152, _174);
    float _272 = fma(_266, _152, _176);
    bool _274 = !_254;
    float _292;
    if (!_274)
    {
        float _276 = in.m_53.x;
        float _278 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _280 = _276 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _282 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[11].y, _132);
        float _284 = _282 * _278;
        float _286 = floor(_284);
        float _288 = -_286;
        float _290 = _284 + _288;
        _292 = _290;
        _294 = true;
    }
    else
    {
        float _296 = float(_98);
        float _298 = 1.0 / _296;
        float _300 = _132 * _298;
        _292 = _300;
    }
    _294 = false;
    float _302 = _292;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _306 = _304 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _308 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _310 = isnan(_302);
    bool _312 = _308 || _310;
    bool _314 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _316 = _312 || _314;
    float _318 = float(_316);
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _322 = _320 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _324 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _326 = isnan(_302);
    bool _328 = _324 || _326;
    bool _330 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _332 = _328 || _330;
    float _334 = float(_332);
    float _336 = 1.0 / _306;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _338;
    float _342 = -_318;
    float _344 = _342 + 1.0;
    bool _346 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _348 = isnan(_302);
    bool _350 = _346 || _348;
    bool _352 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _354 = _350 || _352;
    float _356 = float(_354);
    bool _358 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _360 = _334 * _344;
    float _362 = -_334;
    float _364 = _362 + 1.0;
    float _366 = 1.0 / _322;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _370 = _368 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _372 = _340 * _336;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _376 = _302 + _374;
    float _378 = -_356;
    float _380 = _378 + 1.0;
    float _382 = fma(_372, _376, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _386 = _302 + _384;
    float _388 = _318 * _380;
    float _390 = _370 * _366;
    float _392 = _382 * _360;
    float _394 = fma(_390, _386, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _396 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[115].x, _392);
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _400 = fma(_394, _388, _396);
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _404 = _398 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _408 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[117].x, _400);
    float _410 = _402 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _412 = _406 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _414 = _408 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _404;
    out.m_55.y = _410;
    out.m_55.z = _412;
    out.m_55.w = _414;
    bool _416 = !_358;
    float _440;
    float _442;
    if (!_416)
    {
        float _418 = in.m_53.x;
        float _420 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _422 = float(_98);
        float _424 = 1.0 / _422;
        float _426 = _418 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _428 = _132 * _424;
        float _430 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[11].w, _132);
        float _432 = _430 * _420;
        float _434 = floor(_432);
        float _436 = -_434;
        float _438 = _432 + _436;
        _440 = _438;
        _442 = _428;
        _444 = true;
    }
    else
    {
        float _446 = float(_98);
        float _448 = 1.0 / _446;
        float _450 = _132 * _448;
        _440 = _450;
        _442 = _450;
    }
    _444 = false;
    float _452 = _440;
    float _454 = _442;
    float _456 = in.m_53.w;
    float _458 = _270 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _460 = in.m_57.x;
    float _462 = in.m_57.y;
    float _464 = in.m_57.z;
    int _466 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _468 = _466 != 0;
    float _470 = _270 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _472 = in.m_51.x;
    float _474 = in.m_51.y;
    float _476 = in.m_51.z;
    float _478 = _270 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _482 = _480 != 0;
    float _484 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[4].x, _458);
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _488 = _486 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    int _490 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _492 = _490 != 0;
    float _494 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[5].x, _470);
    int _496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _498 = _496 != 0;
    float _500 = 1.0 / _488;
    int _502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _504 = _502 != 0;
    float _506 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[6].x, _478);
    float _508 = in.m_53.y;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _512 = _452 + _510;
    float _514 = in.m_53.x;
    bool _516 = _456 > 0.5;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _522 = in.m_59.x;
    float _524 = in.m_59.y;
    float _526 = in.m_59.z;
    bool _528 = _462 != 0.0;
    bool _530 = isnan(_462);
    bool _532 = _528 || _530;
    bool _534 = isnan(0.0);
    bool _536 = _532 || _534;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _540 = _538 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _542 = _474 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    bool _544 = _460 == 0.0;
    bool _546 = !_536;
    bool _548 = _544 && _546;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _552 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _550;
    float _554 = _476 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _556 = 1.0 / _520;
    bool _558 = _464 == 0.0;
    bool _560 = _558 && _548;
    float _562 = _552 * _500;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _566 = _564 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _570 = _568 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _572 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _460);
    float _574 = 1.0 / _540;
    float _576 = in.m_61.y;
    float _578 = _472 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _582 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _464);
    float _584 = _522;
    float _586 = _526;
    float _588 = _524;
    bool _590 = _498;
    bool _592 = _560;
    if (!_560)
    {
        float _594 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[17].y, _522);
        _584 = _594;
    }
    float _596 = _584;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _600 = _598 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _602 = 1.0 / _566;
    if (!_560)
    {
        float _604 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[17].y, _526);
        _586 = _604;
    }
    float _606 = _586;
    if (!_560)
    {
        float _608 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[17].y, _524);
        _588 = _608;
    }
    float _610 = _588;
    float _612 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _462);
    float _614 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[4].z, _484);
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _618 = _616 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _622 = 1.0 / _570;
    float _624 = _508 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _626 = _514 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _628 = 0.0;
    if (_492)
    {
        float _630 = in.m_53.z;
        _628 = _630;
    }
    float _632 = _628;
    float _634 = fma(_624, -2.0, _580);
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _636;
    float _640 = 1.0 / _618;
    float _642 = _638 * _556;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _646 = _644 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _648 = -_620;
    float _650 = fma(_626, 2.0, _648);
    float _652 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[5].z, _494);
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _656 = _654 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _658 = _646 * _574;
    float _660 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[6].z, _506);
    float _662 = 1.0 / _656;
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _666 = _664 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _668 = 0.0;
    if (!_468)
    {
        float _670 = in.m_53.z;
        _668 = _670;
    }
    float _672 = _668;
    float _674 = _652 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _678 = _676 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _680 = 0.0;
    float _682 = _576;
    if (!_468)
    {
        _680 = _508;
    }
    float _684 = _680;
    float _686 = 1.0 / _600;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _688;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _694 = _692 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _696 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _698 = _684;
    if (_468)
    {
        _698 = _514;
    }
    float _700 = _698;
    float _702 = _690 * _622;
    float _704 = _694 * _602;
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _706;
    float _710 = 1.0 / _666;
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _714 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _712;
    float _716 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _718 = _716 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _720 = -_576;
    float _722 = _720 + 1.0;
    float _724 = _708 * _640;
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _728 = _454 + _726;
    float _730 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[78].z, _696);
    float _732 = _614 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _734 = _714 * _686;
    float _736 = _678 * _662;
    int _738 = _516 ? as_type<int>(_722) : as_type<int>(_576);
    float _740 = fma(_702, _728, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    bool _742 = _508 > 0.5;
    float _744 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _746 = _498 ? as_type<float>(_738) : _576;
    float _748 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _750 = _674 + _748;
    float _752 = _640;
    if (_482)
    {
        bool _754 = _514 > 0.5;
        _590 = _754;
    }
    bool _756 = _590;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _760 = _454 + _758;
    float _762 = _718 * _710;
    float _764 = fma(_642, _512, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    if (_504)
    {
        float _766 = _742 ? _722 : _576;
        _682 = _766;
    }
    float _768 = _682;
    float _770 = fma(_734, _760, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    if (_492)
    {
        bool _772 = _632 > 0.5;
        _592 = _772;
    }
    bool _774 = _592;
    float _776 = _660 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _778 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _780 = _732 + _778;
    float _782 = _750 * _750;
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _786 = _454 + _784;
    float _788 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _790 = _776 + _788;
    float _792 = fma(_780, _780, _782);
    float _794 = fma(_704, _786, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    bool _796 = _452 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _798 = isnan(_452);
    bool _800 = _796 || _798;
    bool _802 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _804 = _800 || _802;
    float _806 = float(_804);
    float _808 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _810 = _744 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _812 = fma(_790, _790, _792);
    float _814 = 0.0;
    float _816 = _672;
    if (!_468)
    {
        _814 = _672;
    }
    float _818 = _814;
    float _820 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _822 = _452 + _820;
    float _824 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _826 = _454 + _824;
    float _828 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[78].w, _808);
    float _830 = _818;
    if (_468)
    {
        _830 = _508;
    }
    float _832 = _830;
    float _834 = fma(_746, _810, -0.5);
    if (_468)
    {
        _816 = _508;
    }
    float _836 = _816;
    float _838 = -_806;
    float _840 = _838 + 1.0;
    bool _842 = _452 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _844 = isnan(_452);
    bool _846 = _842 || _844;
    bool _848 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _850 = _846 || _848;
    float _852 = float(_850);
    float _854 = fma(_658, _822, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _856 = _454 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _858 = isnan(_454);
    bool _860 = _856 || _858;
    bool _862 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _864 = _860 || _862;
    float _866 = float(_864);
    float _868 = fma(_762, _826, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _870 = rsqrt(_812);
    float _872 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _874 = _454 + _872;
    bool _876 = _452 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _878 = isnan(_452);
    bool _880 = _876 || _878;
    bool _882 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _884 = _880 || _882;
    float _886 = float(_884);
    float _888 = _852 * _840;
    float _890 = -_852;
    float _892 = _890 + 1.0;
    bool _894 = _454 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _896 = isnan(_454);
    bool _898 = _894 || _896;
    bool _900 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _902 = _898 || _900;
    float _904 = float(_902);
    float _906 = -_866;
    float _908 = _906 + 1.0;
    float _910 = fma(_736, _874, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    bool _912 = _454 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _914 = isnan(_454);
    bool _916 = _912 || _914;
    bool _918 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _920 = _916 || _918;
    float _922 = float(_920);
    float _924 = _886 * _892;
    float _926 = _904 * _908;
    float _928 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _930 = _454 + _928;
    float _932 = -_904;
    float _934 = _932 + 1.0;
    float _936 = _764 * _924;
    bool _938 = _454 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _940 = isnan(_454);
    bool _942 = _938 || _940;
    bool _944 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _946 = _942 || _944;
    float _948 = float(_946);
    float _950 = -_922;
    float _952 = _950 + 1.0;
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _956 = _454 + _954;
    float _958 = fma(_562, _930, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _960 = _922 * _934;
    float _962 = _948 * _952;
    float _964 = fma(_724, _956, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _966 = _750 * _870;
    bool _968 = _454 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _970 = isnan(_454);
    bool _972 = _968 || _970;
    bool _974 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _976 = _972 || _974;
    float _978 = float(_976);
    float _980 = -_948;
    float _982 = _980 + 1.0;
    float _984 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _986 = _780 * _870;
    bool _988 = _454 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _990 = isnan(_454);
    bool _992 = _988 || _990;
    bool _994 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _996 = _992 || _994;
    float _998 = float(_996);
    float _1000 = -_966;
    float _1002 = fma(_1000, (*spvDescriptorSet0.vp_c9)._m0[18].w, _750);
    float _1004 = _978 * _982;
    float _1006 = -_978;
    float _1008 = _1006 + 1.0;
    float _1010 = -_986;
    float _1012 = fma(_1010, (*spvDescriptorSet0.vp_c9)._m0[18].w, _780);
    bool _1014 = _454 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1016 = isnan(_454);
    bool _1018 = _1014 || _1016;
    bool _1020 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1022 = _1018 || _1020;
    float _1024 = float(_1022);
    float _1026 = _1002 * _1002;
    float _1028 = _790 * _870;
    float _1030 = -_998;
    float _1032 = _1030 + 1.0;
    float _1034 = _998 * _1008;
    float _1036 = fma(_1012, _1012, _1026);
    float _1038 = -_1028;
    float _1040 = fma(_1038, (*spvDescriptorSet0.vp_c9)._m0[18].w, _790);
    bool _1042 = _454 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1044 = isnan(_454);
    bool _1046 = _1042 || _1044;
    bool _1048 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1050 = _1046 || _1048;
    float _1052 = float(_1050);
    float _1054 = _1024 * _1032;
    float _1056 = -_1024;
    float _1058 = _1056 + 1.0;
    float _1060 = fma(_1040, _1040, _1036);
    float _1062 = _554 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1064 = _1052 * _1058;
    float _1066 = _984 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1068 = sqrt(_1060);
    float _1070 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1072 = fma(_1066, _768, -0.5);
    float _1074 = _740 * _1064;
    float _1076 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1070);
    float _1078 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1080 = _700 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1082 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1084 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[76].y, _634);
    float _1086 = in.m_61.x;
    float _1088 = -_1078;
    float _1090 = fma(_1080, 2.0, _1088);
    float _1092 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1082);
    float _1094 = _542 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1096 = _578 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1098 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].w, _828);
    float _1100 = _870 * _1068;
    float _1102 = _610 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1104 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].z, _730);
    float _1106 = -_1084;
    float _1108 = fma(_1098, _1072, _1106);
    float _1110 = _1094 * _1100;
    float _1112 = _1096 * _1100;
    float _1114 = _1062 * _1100;
    float _1116 = -_132;
    float _1118 = fma(_1116, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1090);
    float _1120 = _1110 * _612;
    float _1122 = _1112 * _572;
    float _1124 = _1114 * _582;
    float _1126 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1128 = _1120 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1130 = _1120 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1132 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1092);
    float _1134 = fma(_1122, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1128);
    float _1136 = fma(_1122, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1130);
    float _1138 = -_1052;
    float _1140 = _1138 + 1.0;
    float _1142 = -_886;
    float _1144 = _1142 + 1.0;
    float _1146 = fma(_1124, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1134);
    float _1148 = fma(_1124, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1136);
    float _1150 = _832 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1152 = fma(_1144, (*spvDescriptorSet0.vp_c9)._m0[131].x, _936);
    float _1154 = _732 + _1146;
    float _1156 = _776 + _1148;
    float _1158 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1160 = _610 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1162 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1164 = _1154 + _1162;
    float _1166 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1168 = _1156 + _1166;
    float _1170 = fma(_1150, -2.0, _1158);
    float _1172 = _1126 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1174 = _1164 * _1164;
    float _1176 = _1168 * _1168;
    float _1178 = fma(_1140, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1074);
    float _1180 = _610 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    int _1182 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[82].x);
    float _1184 = _1086;
    float _1186 = _1174;
    float _1188 = _1176;
    float _1190 = _1154;
    float _1192 = _1156;
    float _1194 = _868;
    if (_482)
    {
        float _1196 = -_1086;
        float _1198 = _1196 + 1.0;
        _1182 = as_type<int>(_1198);
    }
    int _1200 = _1182;
    float _1202 = _1174 + _1176;
    float _1204 = fma(_596, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1160);
    if (!_482)
    {
        _752 = _1086;
    }
    float _1206 = _752;
    float _1208 = fma(_854, _888, _1152);
    float _1210 = sqrt(_1202);
    float _1212 = _1206;
    if (_482)
    {
        float _1214 = _756 ? as_type<float>(_1200) : _1086;
        _1212 = _1214;
    }
    float _1216 = _1212;
    int _1218 = 0;
    if (_492)
    {
        float _1220 = -_1086;
        float _1222 = _1220 + 1.0;
        _1218 = as_type<int>(_1222);
    }
    int _1224 = _1218;
    float _1226 = -_132;
    float _1228 = fma(_1226, (*spvDescriptorSet0.vp_c9)._m0[76].x, _650);
    float _1230 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1170);
    float _1232 = _1120 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1234 = fma(_1172, _1216, -0.5);
    float _1236 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1076);
    float _1238 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1240 = in.m_63.w;
    if (_492)
    {
        float _1242 = _774 ? as_type<float>(_1224) : _1086;
        _1184 = _1242;
    }
    float _1244 = _1184;
    float _1246 = fma(_794, _1054, _1178);
    float _1248 = fma(_1122, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1232);
    float _1250 = fma(_596, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1180);
    float _1252 = fma(_596, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1102);
    float _1254 = fma(_770, _1034, _1246);
    bool _1256 = _1210 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1258 = fma(_1124, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1248);
    float _1260 = fma(_910, _1004, _1254);
    float _1262 = -_1230;
    float _1264 = fma(_1132, _834, _1262);
    float _1266 = fma(_806, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1208);
    float _1268 = _674 + _1258;
    float _1270 = fma(_606, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1250);
    float _1272 = _1238 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1274 = fma(_606, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1204);
    float _1276 = fma(_1104, _1234, _1228);
    float _1278 = fma(_964, _962, _1260);
    float _1280 = fma(_1272, _1244, -0.5);
    float _1282 = fma(_606, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1252);
    float _1284 = _1260;
    float _1286 = _1268;
    if (!_1256)
    {
        _1284 = _1268;
    }
    float _1288 = _1284;
    float _1290 = fma(_1236, _1280, _1118);
    bool _1292 = !_1256;
    float _1294 = _1288;
    if (!_1292)
    {
        float _1296 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1298 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1300 = _1210 + _1298;
        float _1302 = _1268 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1304 = rsqrt(_1202);
        float _1306 = _1300 * _1296;
        float _1308 = _1306 * 0.15915493667125701904296875;
        float _1310 = _1308 * 6.283185482025146484375;
        float _1312 = sin(_1310);
        float _1314 = _1308 * 6.283185482025146484375;
        float _1316 = cos(_1314);
        float _1318 = fma(_1312, _1302, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1320 = _1304 * _1318;
        float _1322 = _1316 + (-1.0);
        float _1324 = fma(_1164, _1320, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1326 = fma(_1168, _1320, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1328 = _1322 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1330 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1332 = _1324 + _1330;
        float _1334 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1336 = _1326 + _1334;
        float _1338 = fma(_1268, _1316, _1328);
        float _1340 = _1332 * _1332;
        float _1342 = _1336 * _1336;
        _1294 = _1338;
        _1186 = _1340;
        _1188 = _1342;
        _1190 = _1324;
        _1192 = _1326;
    }
    float _1344 = _1294;
    float _1346 = _1186;
    float _1348 = _1188;
    float _1350 = _1190;
    float _1352 = _1192;
    float _1354 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1356 = _1344 + _1354;
    float _1358 = fma(_868, _960, _1278);
    float _1360 = _1108 + 0.5;
    float _1362 = fma(_1356, _1356, _1346);
    float _1364 = fma(_958, _926, _1358);
    float _1366 = _1362 + _1348;
    float _1368 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1370 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1372 = _1266 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1374 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1376 = _1368 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1378 = sqrt(_1366);
    float _1380 = _1370 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1382 = _1374 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1384 = _1276 + 0.5;
    float _1386 = _1290 + 0.5;
    float _1388 = _1264 + 0.5;
    float _1390 = fma(_866, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1364);
    out.m_65.w = _1240;
    out.m_67.x = _1270;
    out.m_67.y = _1274;
    out.m_67.z = _1282;
    out.m_69.x = _1376;
    out.m_69.y = _1380;
    out.m_69.z = _1382;
    out.m_69.w = _1372;
    bool _1392 = _1378 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1394 = isnan(_1378);
    bool _1396 = _1392 || _1394;
    bool _1398 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1400 = _1396 || _1398;
    out.m_71.x = _1384;
    out.m_71.y = _1360;
    out.m_71.z = _1386;
    out.m_71.w = _1388;
    out.m_73.x = _1390;
    float _1402 = _1376;
    float _1404 = _1372;
    if (!_1400)
    {
        _1194 = 1.0;
    }
    float _1406 = _1194;
    bool _1408 = !_1400;
    float _1410 = _1406;
    if (!_1408)
    {
        bool _1412 = _1378 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1414 = isnan(_1378);
        bool _1416 = _1412 || _1414;
        bool _1418 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1420 = _1416 || _1418;
        if (!_1420)
        {
            float _1422 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1424 = _1378 + _1422;
            float _1426 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1428 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1426;
            float _1430 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1432 = _1430 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1434 = 1.0 / _1428;
            float _1436 = _1424 * _1434;
            float _1438 = fma(_1436, _1432, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1410 = _1438;
            _1440 = true;
        }
        else
        {
            bool _1442 = _1378 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1444 = isnan(_1378);
            bool _1446 = _1442 || _1444;
            bool _1448 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1450 = _1446 || _1448;
            if (!_1450)
            {
                float _1452 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1454 = _1378 + _1452;
                float _1456 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1458 = _1456 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1460 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1462 = _1460 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1464 = 1.0 / _1458;
                float _1466 = _1454 * _1464;
                float _1468 = fma(_1466, _1462, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1410 = _1468;
                _1440 = true;
            }
            else
            {
                _1410 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1440 = false;
    float _1470 = _1410;
    float _1472 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1474 = _1344 + _1472;
    float _1476 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1478 = _1350 + _1476;
    float _1480 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1482 = _1352 + _1480;
    float _1484 = fma(_1474, _1470, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1486 = fma(_1478, _1470, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1488 = fma(_1482, _1470, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1490 = -_966;
    float _1492 = fma(_1490, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1484);
    float _1494 = -_986;
    float _1496 = fma(_1494, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1486);
    float _1498 = -_1028;
    float _1500 = fma(_1498, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1488);
    float _1502 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1504 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1506 = _1492 + _1504;
    float _1508 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1510 = _1496 + _1508;
    float _1512 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1514 = _1500 + _1512;
    float _1516 = _1506 * _1506;
    float _1518 = fma(_1510, _1510, _1516);
    float _1520 = fma(_1514, _1514, _1518);
    float _1522 = rsqrt(_1520);
    float _1524 = _1522 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1526 = _1510 * _1524;
    float _1528 = _1514 * _1524;
    float _1530 = _1526 * _1526;
    float _1532 = _1528 * _1528;
    float _1534 = _1530 + _1532;
    float _1536 = sqrt(_1534);
    bool _1538 = _1536 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1540 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1542 = _1536 + _1540;
    float _1544 = _1518;
    float _1546 = _1542;
    float _1548 = _1526;
    if (_1538)
    {
        float _1550 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1544 = _1550;
    }
    float _1552 = _1544;
    if (_1538)
    {
        float _1554 = rsqrt(_1534);
        _1402 = _1554;
    }
    float _1556 = _1402;
    float _1558 = _1556;
    if (_1538)
    {
        float _1560 = _1542 * _1552;
        _1546 = _1560;
    }
    float _1562 = _1546;
    if (_1538)
    {
        float _1564 = _1562 * 0.15915493667125701904296875;
        _1404 = _1564;
    }
    float _1566 = _1404;
    float _1568 = _1552;
    if (_1538)
    {
        float _1570 = _1566 * 6.283185482025146484375;
        float _1572 = sin(_1570);
        _1568 = _1572;
    }
    float _1574 = _1568;
    float _1576 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1578 = precise::max(0.0, _1576);
    float _1580 = _866;
    float _1582 = _1578;
    if (_1538)
    {
        float _1584 = _1566 * 6.283185482025146484375;
        float _1586 = cos(_1584);
        _1580 = _1586;
    }
    float _1588 = _1580;
    float _1590 = -_1524;
    float _1592 = -_1578;
    float _1594 = fma(_1506, _1590, _1592);
    float _1596 = _1594;
    if (_1538)
    {
        float _1598 = _1594 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1582 = _1598;
    }
    float _1600 = _1582;
    float _1602 = sqrt(_1520);
    float _1604 = _1574;
    float _1606 = _1600;
    if (_1538)
    {
        float _1608 = fma(_1574, _1600, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1604 = _1608;
    }
    float _1610 = _1604;
    float _1612 = _1610;
    float _1614 = _1588;
    if (_1538)
    {
        float _1616 = _1588 + (-1.0);
        _1606 = _1616;
    }
    float _1618 = _1606;
    float _1620 = _1618;
    if (_1538)
    {
        float _1622 = _1556 * _1610;
        _1286 = _1622;
    }
    float _1624 = _1286;
    if (!_1538)
    {
        _1558 = _1528;
    }
    float _1626 = _1558;
    float _1628 = _1626;
    if (_1538)
    {
        float _1630 = _1618 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1612 = _1630;
    }
    float _1632 = _1612;
    if (_1538)
    {
        float _1634 = _1526 * _1624;
        _1548 = _1634;
    }
    float _1636 = _1548;
    if (!_1538)
    {
        _1620 = _1530;
    }
    float _1638 = _1620;
    float _1640 = _1638;
    if (_1538)
    {
        float _1642 = _1528 * _1624;
        _1628 = _1642;
    }
    float _1644 = _1628;
    if (_1538)
    {
        float _1646 = fma(_1594, _1588, _1632);
        _1596 = _1646;
    }
    float _1648 = _1596;
    if (_1538)
    {
        float _1650 = _1636 * _1636;
        _1640 = _1650;
    }
    float _1652 = _1640;
    if (!_1538)
    {
        _1614 = _1532;
    }
    float _1654 = _1614;
    float _1656 = _1654;
    if (_1538)
    {
        float _1658 = _1644 * _1644;
        _1656 = _1658;
    }
    float _1660 = _1656;
    float _1662 = fma(_1648, _1648, _1652);
    float _1664 = _1662 + _1660;
    float _1666 = _1492 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1668 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1670 = fma(_1602, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1668);
    float _1672 = precise::clamp(_1670, 0.0, 1.0);
    float _1674 = _1492 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1676 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1666);
    float _1678 = rsqrt(_1664);
    float _1680 = _1492 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1682 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1674);
    float _1684 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1676);
    float _1686 = _1492 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1688 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1680);
    float _1690 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1682);
    float _1692 = _1684 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1694 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1686);
    float _1696 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1688);
    float _1698 = _1690 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1700 = _1692 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1702 = -_1672;
    float _1704 = _1702 + 1.0;
    float _1706 = _1696 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1708 = -_1700;
    float _1710 = fma(_1708, _1502, 1.0);
    float _1712 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1694);
    float _1714 = _1698 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1716 = _1678 * _1636;
    float _1718 = abs(_1704);
    float _1720 = log2(_1718);
    float _1722 = _1678 * _1648;
    float _1724 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1714);
    float _1726 = _1716 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1728 = _1678 * _1644;
    float _1730 = _1712 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1732 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1724);
    float _1734 = -_1726;
    float _1736 = fma(_1722, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1734);
    float _1738 = log2(_1710);
    float _1740 = _1698 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1742 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1732);
    float _1744 = -_1728;
    float _1746 = fma(_1744, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1736);
    float _1748 = _1698 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1750 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1740);
    float _1752 = _1722 + 1.0;
    float _1754 = fma(_1746, -0.5, 0.5);
    float _1756 = _1720 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1758 = 1.0 / _1742;
    float _1760 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1748);
    float _1762 = fma(_1746, 0.5, 0.5);
    float _1764 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1750);
    float _1766 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1760);
    float _1768 = fma(_1762, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1770 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1764);
    float _1772 = exp2(_1756);
    float _1774 = _1738 * 0.693147182464599609375;
    float _1776 = fma(_1762, _1768, -0.212114393711090087890625);
    float _1778 = _1774 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1780 = fma(_1762, _1776, 1.570728778839111328125);
    float _1782 = sqrt(_1754);
    float _1784 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1766);
    float _1786 = _1770 * _1758;
    float _1788 = _1784 * _1758;
    float _1790 = fma(_1786, -0.5, 0.5);
    float _1792 = -_1722;
    float _1794 = fma(_1772, _1752, _1792);
    float _1796 = fma(_1788, 0.5, 0.5);
    float _1798 = fma(_1794, 0.5, 0.5);
    float _1800 = _1782 * 0.636619746685028076171875;
    float3 _4849 = float3(_1796, _1790, _1778);
    float _1802 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4849, float3(0.0), isnan(_4849)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4849, float3(0.0), isnan(_4849)), level(0.0)).x;
    float3 _4860 = float3(_1796, _1790, _1778);
    float4 _1805 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4860, float3(0.0), isnan(_4860)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4860, float3(0.0), isnan(_4860)), level(0.0)).xyzw;
    float _1807 = _1805.x;
    float _1809 = _1805.y;
    float _1811 = _1805.z;
    float _1813 = _1805.w;
    float _1815 = -_1780;
    float _1817 = fma(_1800, _1815, 1.0);
    float2 _4882 = float2(_1817, _1798);
    float3 _1821 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4882, float2(0.0), isnan(_4882)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4882, float2(0.0), isnan(_4882)), level(0.0)).xyz;
    float _1823 = _1821.x;
    float _1825 = _1821.y;
    float _1827 = _1821.z;
    float _1829 = -_966;
    float _1831 = fma(_1829, (*spvDescriptorSet0.vp_c9)._m0[18].w, _674);
    float _1833 = -_986;
    float _1835 = fma(_1833, (*spvDescriptorSet0.vp_c9)._m0[18].w, _732);
    float _1837 = -_1028;
    float _1839 = fma(_1837, (*spvDescriptorSet0.vp_c9)._m0[18].w, _776);
    out.m_75.x = _1510;
    out.m_75.y = _1506;
    out.m_75.z = _1514;
    float _1841 = _1831 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1843 = _1831 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1845 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1841);
    float _1847 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1843);
    float _1849 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1845);
    float _1851 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1847);
    float _1853 = _1849 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1855 = _1851 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1857 = 1.0 / _1853;
    bool _1859 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1861 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1863 = _1859 || _1861;
    bool _1865 = isnan(0.5);
    bool _1867 = _1863 || _1865;
    float _1869 = _1855 + _1853;
    float _1871 = _1720 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1873 = _1839;
    float _1875 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1877 = _1692;
    if (!_1867)
    {
        _1873 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1879 = _1873;
    float _1881 = exp2(_1871);
    float _1883 = _1869 * _1857;
    float _1885 = _1883 * 0.5;
    float _1887 = _1698 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1889 = _1885;
    float _1891 = _1879;
    if (!_1867)
    {
        float _1893 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1895 = fma(_1885, _1879, _1893);
        _1889 = _1895;
    }
    float _1897 = _1889;
    if (!_1867)
    {
        _1891 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _1899 = _1891;
    float _1901 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1887);
    float _1903 = _1899;
    if (!_1867)
    {
        float _1905 = -_1899;
        float _1907 = _1905 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1875 = _1907;
    }
    float _1909 = _1875;
    float _1911 = _1897;
    if (!_1867)
    {
        float _1913 = 1.0 / _1897;
        _1911 = _1913;
    }
    float _1915 = _1911;
    float _1917 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1901);
    if (_1867)
    {
        _1877 = 1.0;
    }
    float _1919 = _1877;
    float _1921 = -_1881;
    float _1923 = _1921 + 1.0;
    float _1925 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1917);
    float _1927 = _1909;
    float _1929 = _1919;
    if (!_1867)
    {
        float _1931 = 1.0 / _1909;
        _1927 = _1931;
    }
    float _1933 = _1927;
    float _1935 = _1925 + _1742;
    out.gl_Position.x = _1784;
    out.gl_Position.y = _1770;
    out.gl_Position.z = _1925;
    out.gl_Position.w = _1742;
    if (!_1867)
    {
        float _1937 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1939 = -_1899;
        float _1941 = fma(_1915, _1937, _1939);
        _1903 = _1941;
    }
    float _1943 = _1903;
    float _1945 = _1935 * 0.5;
    float _1947 = _1943;
    if (!_1867)
    {
        float _1949 = _1943 * _1933;
        float _1951 = precise::clamp(_1949, 0.0, 1.0);
        _1947 = _1951;
    }
    float _1953 = _1947;
    float _1955 = _1923 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_1867)
    {
        float _1957 = -_1953;
        float _1959 = _1957 + 1.0;
        _1929 = _1959;
    }
    float _1961 = _1929;
    float _1963 = _1961 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1965 = _1961 > 0.0;
    bool _1967 = isnan(_1961);
    bool _1969 = _1965 || _1967;
    bool _1971 = isnan(0.0);
    bool _1973 = _1969 || _1971;
    out.m_77.z = _1945;
    out.m_77.w = _1742;
    float _1975 = _1963 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_47.x = _1975;
    float _1977 = _1955 * _1802;
    float _1979 = -_1955;
    float _1981 = _1979 + 1.0;
    float _1983 = _1813 * _1977;
    float _1985 = _1813 * _1981;
    float _1987 = _1827 * _1977;
    float _1989 = fma(_1823, _1983, _1807);
    float _1991 = fma(_1825, _1983, _1809);
    float _1993 = fma(_1813, _1987, _1811);
    out.m_79.x = _1989;
    out.m_79.y = _1991;
    out.m_79.z = _1993;
    out.m_79.w = _1985;
    if (_1973)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _1995 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1995;
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
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1440 = false;
    bool _444 = false;
    bool _294 = false;
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
        float _2052 = as_type<float>(_114);
        out.gl_Position.z = _2052;
    }
    if (!_102)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _118 = in.m_49.w;
    bool _120 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _122 = isnan(_118);
    bool _124 = _120 || _122;
    bool _126 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _128 = _124 || _126;
    float _130 = -_118;
    float _132 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_128)
    {
        float _134 = float(_98);
        _108 = _134;
    }
    float _136 = _108;
    bool _138 = _132 >= _136;
    bool _140 = !_128;
    bool _142 = _138 || _140;
    float _144 = _136;
    if (_142)
    {
        _144 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _146 = _144;
    if (_142)
    {
        out.m_47.x = 0.0;
    }
    if (_142)
    {
        float _148 = _146 * 5.0;
        _116 = as_type<int>(_148);
    }
    int _150 = _116;
    if (_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2121 = as_type<float>(_150);
        out.gl_Position.z = _2121;
    }
    if (_142)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _152 = in.m_51.w;
    float _154 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _156 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _158 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _160 = _156 || _158;
    bool _162 = isnan(1.0);
    bool _164 = _160 || _162;
    float _166 = in.m_49.x;
    float _168 = in.m_49.y;
    float _170 = in.m_49.z;
    float _172 = in.m_44.x;
    float _174 = in.m_44.y;
    float _176 = in.m_44.z;
    float _178 = 0.0;
    float _180 = _154;
    if (!_164)
    {
        float _182 = _154 * _154;
        float _184 = _182 * 0.5;
        _178 = _184;
    }
    float _186 = _178;
    float _188 = _186;
    if (!_164)
    {
        float _190 = _186 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _188 = _190;
    }
    float _192 = _188;
    bool _194 = !_164;
    float _196 = _192;
    if (!_194)
    {
        float _198 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _200 = log2(_198);
        float _202 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _204 = _202 + 1.0;
        float _206 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _208 = _154 * _200;
        float _210 = 1.0 / _204;
        float _212 = _206 * 0.693147182464599609375;
        float _214 = exp2(_208);
        float _216 = 1.0 / _212;
        float _218 = _214 + (-1.0);
        float _220 = -_218;
        float _222 = fma(_220, _216, _154);
        float _224 = _222 * _210;
        float _226 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _196 = _226;
    }
    float _228 = _196;
    bool _230 = !_164;
    if (!_230)
    {
        float _232 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _234 = log2(_232);
        float _236 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _238 = _236 + 1.0;
        float _240 = 1.0 / _238;
        float _242 = _154 * _234;
        float _244 = exp2(_242);
        float _246 = -_244;
        float _248 = _246 + 1.0;
        float _250 = _248 * _240;
        _180 = _250;
    }
    float _252 = _180;
    bool _254 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _256 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _258 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _260 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _262 = fma(_252, _166, _256);
    float _264 = fma(_252, _168, _258);
    float _266 = fma(_252, _170, _260);
    float _268 = fma(_262, _152, _172);
    float _270 = fma(_264, _152, _174);
    float _272 = fma(_266, _152, _176);
    bool _274 = !_254;
    float _292;
    if (!_274)
    {
        float _276 = in.m_53.x;
        float _278 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _280 = _276 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _282 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[11].y, _132);
        float _284 = _282 * _278;
        float _286 = floor(_284);
        float _288 = -_286;
        float _290 = _284 + _288;
        _292 = _290;
        _294 = true;
    }
    else
    {
        float _296 = float(_98);
        float _298 = 1.0 / _296;
        float _300 = _132 * _298;
        _292 = _300;
    }
    _294 = false;
    float _302 = _292;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _306 = _304 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _308 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _310 = isnan(_302);
    bool _312 = _308 || _310;
    bool _314 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _316 = _312 || _314;
    float _318 = float(_316);
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _322 = _320 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _324 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _326 = isnan(_302);
    bool _328 = _324 || _326;
    bool _330 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _332 = _328 || _330;
    float _334 = float(_332);
    float _336 = 1.0 / _306;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _338;
    float _342 = -_318;
    float _344 = _342 + 1.0;
    bool _346 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _348 = isnan(_302);
    bool _350 = _346 || _348;
    bool _352 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _354 = _350 || _352;
    float _356 = float(_354);
    bool _358 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _360 = _334 * _344;
    float _362 = -_334;
    float _364 = _362 + 1.0;
    float _366 = 1.0 / _322;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _370 = _368 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _372 = _340 * _336;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _376 = _302 + _374;
    float _378 = -_356;
    float _380 = _378 + 1.0;
    float _382 = fma(_372, _376, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _386 = _302 + _384;
    float _388 = _318 * _380;
    float _390 = _370 * _366;
    float _392 = _382 * _360;
    float _394 = fma(_390, _386, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _396 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[115].x, _392);
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _400 = fma(_394, _388, _396);
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _404 = _398 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _408 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[117].x, _400);
    float _410 = _402 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _412 = _406 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _414 = _408 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _404;
    out.m_55.y = _410;
    out.m_55.z = _412;
    out.m_55.w = _414;
    bool _416 = !_358;
    float _440;
    float _442;
    if (!_416)
    {
        float _418 = in.m_53.x;
        float _420 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _422 = float(_98);
        float _424 = 1.0 / _422;
        float _426 = _418 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _428 = _132 * _424;
        float _430 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[11].w, _132);
        float _432 = _430 * _420;
        float _434 = floor(_432);
        float _436 = -_434;
        float _438 = _432 + _436;
        _440 = _438;
        _442 = _428;
        _444 = true;
    }
    else
    {
        float _446 = float(_98);
        float _448 = 1.0 / _446;
        float _450 = _132 * _448;
        _440 = _450;
        _442 = _450;
    }
    _444 = false;
    float _452 = _440;
    float _454 = _442;
    float _456 = in.m_53.w;
    float _458 = _270 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _460 = in.m_57.x;
    float _462 = in.m_57.y;
    float _464 = in.m_57.z;
    int _466 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _468 = _466 != 0;
    float _470 = _270 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _472 = in.m_51.x;
    float _474 = in.m_51.y;
    float _476 = in.m_51.z;
    float _478 = _270 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _482 = _480 != 0;
    float _484 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[4].x, _458);
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _488 = _486 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    int _490 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _492 = _490 != 0;
    float _494 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[5].x, _470);
    int _496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _498 = _496 != 0;
    float _500 = 1.0 / _488;
    int _502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _504 = _502 != 0;
    float _506 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[6].x, _478);
    float _508 = in.m_53.y;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _512 = _452 + _510;
    float _514 = in.m_53.x;
    bool _516 = _456 > 0.5;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _522 = in.m_59.x;
    float _524 = in.m_59.y;
    float _526 = in.m_59.z;
    bool _528 = _462 != 0.0;
    bool _530 = isnan(_462);
    bool _532 = _528 || _530;
    bool _534 = isnan(0.0);
    bool _536 = _532 || _534;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _540 = _538 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _542 = _474 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    bool _544 = _460 == 0.0;
    bool _546 = !_536;
    bool _548 = _544 && _546;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _552 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _550;
    float _554 = _476 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _556 = 1.0 / _520;
    bool _558 = _464 == 0.0;
    bool _560 = _558 && _548;
    float _562 = _552 * _500;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _566 = _564 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _570 = _568 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _572 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _460);
    float _574 = 1.0 / _540;
    float _576 = in.m_61.y;
    float _578 = _472 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _582 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _464);
    float _584 = _522;
    float _586 = _526;
    float _588 = _524;
    bool _590 = _498;
    bool _592 = _560;
    if (!_560)
    {
        float _594 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[17].y, _522);
        _584 = _594;
    }
    float _596 = _584;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _600 = _598 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _602 = 1.0 / _566;
    if (!_560)
    {
        float _604 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[17].y, _526);
        _586 = _604;
    }
    float _606 = _586;
    if (!_560)
    {
        float _608 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[17].y, _524);
        _588 = _608;
    }
    float _610 = _588;
    float _612 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _462);
    float _614 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[4].z, _484);
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _618 = _616 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _622 = 1.0 / _570;
    float _624 = _508 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _626 = _514 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _628 = 0.0;
    if (_492)
    {
        float _630 = in.m_53.z;
        _628 = _630;
    }
    float _632 = _628;
    float _634 = fma(_624, -2.0, _580);
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _636;
    float _640 = 1.0 / _618;
    float _642 = _638 * _556;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _646 = _644 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _648 = -_620;
    float _650 = fma(_626, 2.0, _648);
    float _652 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[5].z, _494);
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _656 = _654 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _658 = _646 * _574;
    float _660 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[6].z, _506);
    float _662 = 1.0 / _656;
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _666 = _664 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _668 = 0.0;
    if (!_468)
    {
        float _670 = in.m_53.z;
        _668 = _670;
    }
    float _672 = _668;
    float _674 = _652 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _678 = _676 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _680 = 0.0;
    float _682 = _576;
    if (!_468)
    {
        _680 = _508;
    }
    float _684 = _680;
    float _686 = 1.0 / _600;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _688;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _694 = _692 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _696 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _698 = _684;
    if (_468)
    {
        _698 = _514;
    }
    float _700 = _698;
    float _702 = _690 * _622;
    float _704 = _694 * _602;
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _706;
    float _710 = 1.0 / _666;
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _714 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _712;
    float _716 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _718 = _716 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _720 = -_576;
    float _722 = _720 + 1.0;
    float _724 = _708 * _640;
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _728 = _454 + _726;
    float _730 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[78].z, _696);
    float _732 = _614 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _734 = _714 * _686;
    float _736 = _678 * _662;
    int _738 = _516 ? as_type<int>(_722) : as_type<int>(_576);
    float _740 = fma(_702, _728, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    bool _742 = _508 > 0.5;
    float _744 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _746 = _498 ? as_type<float>(_738) : _576;
    float _748 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _750 = _674 + _748;
    float _752 = _640;
    if (_482)
    {
        bool _754 = _514 > 0.5;
        _590 = _754;
    }
    bool _756 = _590;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _760 = _454 + _758;
    float _762 = _718 * _710;
    float _764 = fma(_642, _512, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    if (_504)
    {
        float _766 = _742 ? _722 : _576;
        _682 = _766;
    }
    float _768 = _682;
    float _770 = fma(_734, _760, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    if (_492)
    {
        bool _772 = _632 > 0.5;
        _592 = _772;
    }
    bool _774 = _592;
    float _776 = _660 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _778 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _780 = _732 + _778;
    float _782 = _750 * _750;
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _786 = _454 + _784;
    float _788 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _790 = _776 + _788;
    float _792 = fma(_780, _780, _782);
    float _794 = fma(_704, _786, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    bool _796 = _452 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _798 = isnan(_452);
    bool _800 = _796 || _798;
    bool _802 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _804 = _800 || _802;
    float _806 = float(_804);
    float _808 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _810 = _744 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _812 = fma(_790, _790, _792);
    float _814 = 0.0;
    float _816 = _672;
    if (!_468)
    {
        _814 = _672;
    }
    float _818 = _814;
    float _820 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _822 = _452 + _820;
    float _824 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _826 = _454 + _824;
    float _828 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[78].w, _808);
    float _830 = _818;
    if (_468)
    {
        _830 = _508;
    }
    float _832 = _830;
    float _834 = fma(_746, _810, -0.5);
    if (_468)
    {
        _816 = _508;
    }
    float _836 = _816;
    float _838 = -_806;
    float _840 = _838 + 1.0;
    bool _842 = _452 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _844 = isnan(_452);
    bool _846 = _842 || _844;
    bool _848 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _850 = _846 || _848;
    float _852 = float(_850);
    float _854 = fma(_658, _822, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _856 = _454 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _858 = isnan(_454);
    bool _860 = _856 || _858;
    bool _862 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _864 = _860 || _862;
    float _866 = float(_864);
    float _868 = fma(_762, _826, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _870 = rsqrt(_812);
    float _872 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _874 = _454 + _872;
    bool _876 = _452 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _878 = isnan(_452);
    bool _880 = _876 || _878;
    bool _882 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _884 = _880 || _882;
    float _886 = float(_884);
    float _888 = _852 * _840;
    float _890 = -_852;
    float _892 = _890 + 1.0;
    bool _894 = _454 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _896 = isnan(_454);
    bool _898 = _894 || _896;
    bool _900 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _902 = _898 || _900;
    float _904 = float(_902);
    float _906 = -_866;
    float _908 = _906 + 1.0;
    float _910 = fma(_736, _874, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    bool _912 = _454 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _914 = isnan(_454);
    bool _916 = _912 || _914;
    bool _918 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _920 = _916 || _918;
    float _922 = float(_920);
    float _924 = _886 * _892;
    float _926 = _904 * _908;
    float _928 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _930 = _454 + _928;
    float _932 = -_904;
    float _934 = _932 + 1.0;
    float _936 = _764 * _924;
    bool _938 = _454 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _940 = isnan(_454);
    bool _942 = _938 || _940;
    bool _944 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _946 = _942 || _944;
    float _948 = float(_946);
    float _950 = -_922;
    float _952 = _950 + 1.0;
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _956 = _454 + _954;
    float _958 = fma(_562, _930, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _960 = _922 * _934;
    float _962 = _948 * _952;
    float _964 = fma(_724, _956, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _966 = _750 * _870;
    bool _968 = _454 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _970 = isnan(_454);
    bool _972 = _968 || _970;
    bool _974 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _976 = _972 || _974;
    float _978 = float(_976);
    float _980 = -_948;
    float _982 = _980 + 1.0;
    float _984 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _986 = _780 * _870;
    bool _988 = _454 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _990 = isnan(_454);
    bool _992 = _988 || _990;
    bool _994 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _996 = _992 || _994;
    float _998 = float(_996);
    float _1000 = -_966;
    float _1002 = fma(_1000, (*spvDescriptorSet0.vp_c9)._m0[18].w, _750);
    float _1004 = _978 * _982;
    float _1006 = -_978;
    float _1008 = _1006 + 1.0;
    float _1010 = -_986;
    float _1012 = fma(_1010, (*spvDescriptorSet0.vp_c9)._m0[18].w, _780);
    bool _1014 = _454 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1016 = isnan(_454);
    bool _1018 = _1014 || _1016;
    bool _1020 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1022 = _1018 || _1020;
    float _1024 = float(_1022);
    float _1026 = _1002 * _1002;
    float _1028 = _790 * _870;
    float _1030 = -_998;
    float _1032 = _1030 + 1.0;
    float _1034 = _998 * _1008;
    float _1036 = fma(_1012, _1012, _1026);
    float _1038 = -_1028;
    float _1040 = fma(_1038, (*spvDescriptorSet0.vp_c9)._m0[18].w, _790);
    bool _1042 = _454 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1044 = isnan(_454);
    bool _1046 = _1042 || _1044;
    bool _1048 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1050 = _1046 || _1048;
    float _1052 = float(_1050);
    float _1054 = _1024 * _1032;
    float _1056 = -_1024;
    float _1058 = _1056 + 1.0;
    float _1060 = fma(_1040, _1040, _1036);
    float _1062 = _554 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1064 = _1052 * _1058;
    float _1066 = _984 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1068 = sqrt(_1060);
    float _1070 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1072 = fma(_1066, _768, -0.5);
    float _1074 = _740 * _1064;
    float _1076 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1070);
    float _1078 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1080 = _700 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1082 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1084 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[76].y, _634);
    float _1086 = in.m_61.x;
    float _1088 = -_1078;
    float _1090 = fma(_1080, 2.0, _1088);
    float _1092 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1082);
    float _1094 = _542 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1096 = _578 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1098 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].w, _828);
    float _1100 = _870 * _1068;
    float _1102 = _610 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1104 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].z, _730);
    float _1106 = -_1084;
    float _1108 = fma(_1098, _1072, _1106);
    float _1110 = _1094 * _1100;
    float _1112 = _1096 * _1100;
    float _1114 = _1062 * _1100;
    float _1116 = -_132;
    float _1118 = fma(_1116, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1090);
    float _1120 = _1110 * _612;
    float _1122 = _1112 * _572;
    float _1124 = _1114 * _582;
    float _1126 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1128 = _1120 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1130 = _1120 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1132 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1092);
    float _1134 = fma(_1122, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1128);
    float _1136 = fma(_1122, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1130);
    float _1138 = -_1052;
    float _1140 = _1138 + 1.0;
    float _1142 = -_886;
    float _1144 = _1142 + 1.0;
    float _1146 = fma(_1124, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1134);
    float _1148 = fma(_1124, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1136);
    float _1150 = _832 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1152 = fma(_1144, (*spvDescriptorSet0.vp_c9)._m0[131].x, _936);
    float _1154 = _732 + _1146;
    float _1156 = _776 + _1148;
    float _1158 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1160 = _610 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1162 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1164 = _1154 + _1162;
    float _1166 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1168 = _1156 + _1166;
    float _1170 = fma(_1150, -2.0, _1158);
    float _1172 = _1126 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1174 = _1164 * _1164;
    float _1176 = _1168 * _1168;
    float _1178 = fma(_1140, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1074);
    float _1180 = _610 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    int _1182 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[82].x);
    float _1184 = _1086;
    float _1186 = _1174;
    float _1188 = _1176;
    float _1190 = _1154;
    float _1192 = _1156;
    float _1194 = _868;
    if (_482)
    {
        float _1196 = -_1086;
        float _1198 = _1196 + 1.0;
        _1182 = as_type<int>(_1198);
    }
    int _1200 = _1182;
    float _1202 = _1174 + _1176;
    float _1204 = fma(_596, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1160);
    if (!_482)
    {
        _752 = _1086;
    }
    float _1206 = _752;
    float _1208 = fma(_854, _888, _1152);
    float _1210 = sqrt(_1202);
    float _1212 = _1206;
    if (_482)
    {
        float _1214 = _756 ? as_type<float>(_1200) : _1086;
        _1212 = _1214;
    }
    float _1216 = _1212;
    int _1218 = 0;
    if (_492)
    {
        float _1220 = -_1086;
        float _1222 = _1220 + 1.0;
        _1218 = as_type<int>(_1222);
    }
    int _1224 = _1218;
    float _1226 = -_132;
    float _1228 = fma(_1226, (*spvDescriptorSet0.vp_c9)._m0[76].x, _650);
    float _1230 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1170);
    float _1232 = _1120 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1234 = fma(_1172, _1216, -0.5);
    float _1236 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1076);
    float _1238 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1240 = in.m_63.w;
    if (_492)
    {
        float _1242 = _774 ? as_type<float>(_1224) : _1086;
        _1184 = _1242;
    }
    float _1244 = _1184;
    float _1246 = fma(_794, _1054, _1178);
    float _1248 = fma(_1122, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1232);
    float _1250 = fma(_596, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1180);
    float _1252 = fma(_596, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1102);
    float _1254 = fma(_770, _1034, _1246);
    bool _1256 = _1210 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1258 = fma(_1124, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1248);
    float _1260 = fma(_910, _1004, _1254);
    float _1262 = -_1230;
    float _1264 = fma(_1132, _834, _1262);
    float _1266 = fma(_806, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1208);
    float _1268 = _674 + _1258;
    float _1270 = fma(_606, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1250);
    float _1272 = _1238 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1274 = fma(_606, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1204);
    float _1276 = fma(_1104, _1234, _1228);
    float _1278 = fma(_964, _962, _1260);
    float _1280 = fma(_1272, _1244, -0.5);
    float _1282 = fma(_606, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1252);
    float _1284 = _1260;
    float _1286 = _1268;
    if (!_1256)
    {
        _1284 = _1268;
    }
    float _1288 = _1284;
    float _1290 = fma(_1236, _1280, _1118);
    bool _1292 = !_1256;
    float _1294 = _1288;
    if (!_1292)
    {
        float _1296 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1298 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1300 = _1210 + _1298;
        float _1302 = _1268 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1304 = rsqrt(_1202);
        float _1306 = _1300 * _1296;
        float _1308 = _1306 * 0.15915493667125701904296875;
        float _1310 = _1308 * 6.283185482025146484375;
        float _1312 = sin(_1310);
        float _1314 = _1308 * 6.283185482025146484375;
        float _1316 = cos(_1314);
        float _1318 = fma(_1312, _1302, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1320 = _1304 * _1318;
        float _1322 = _1316 + (-1.0);
        float _1324 = fma(_1164, _1320, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1326 = fma(_1168, _1320, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1328 = _1322 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1330 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1332 = _1324 + _1330;
        float _1334 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1336 = _1326 + _1334;
        float _1338 = fma(_1268, _1316, _1328);
        float _1340 = _1332 * _1332;
        float _1342 = _1336 * _1336;
        _1294 = _1338;
        _1186 = _1340;
        _1188 = _1342;
        _1190 = _1324;
        _1192 = _1326;
    }
    float _1344 = _1294;
    float _1346 = _1186;
    float _1348 = _1188;
    float _1350 = _1190;
    float _1352 = _1192;
    float _1354 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1356 = _1344 + _1354;
    float _1358 = fma(_868, _960, _1278);
    float _1360 = _1108 + 0.5;
    float _1362 = fma(_1356, _1356, _1346);
    float _1364 = fma(_958, _926, _1358);
    float _1366 = _1362 + _1348;
    float _1368 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1370 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1372 = _1266 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1374 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1376 = _1368 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1378 = sqrt(_1366);
    float _1380 = _1370 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1382 = _1374 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1384 = _1276 + 0.5;
    float _1386 = _1290 + 0.5;
    float _1388 = _1264 + 0.5;
    float _1390 = fma(_866, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1364);
    out.m_65.w = _1240;
    out.m_67.x = _1270;
    out.m_67.y = _1274;
    out.m_67.z = _1282;
    out.m_69.x = _1376;
    out.m_69.y = _1380;
    out.m_69.z = _1382;
    out.m_69.w = _1372;
    bool _1392 = _1378 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1394 = isnan(_1378);
    bool _1396 = _1392 || _1394;
    bool _1398 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1400 = _1396 || _1398;
    out.m_71.x = _1384;
    out.m_71.y = _1360;
    out.m_71.z = _1386;
    out.m_71.w = _1388;
    out.m_73.x = _1390;
    float _1402 = _1376;
    float _1404 = _1372;
    if (!_1400)
    {
        _1194 = 1.0;
    }
    float _1406 = _1194;
    bool _1408 = !_1400;
    float _1410 = _1406;
    if (!_1408)
    {
        bool _1412 = _1378 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1414 = isnan(_1378);
        bool _1416 = _1412 || _1414;
        bool _1418 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1420 = _1416 || _1418;
        if (!_1420)
        {
            float _1422 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1424 = _1378 + _1422;
            float _1426 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1428 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1426;
            float _1430 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1432 = _1430 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1434 = 1.0 / _1428;
            float _1436 = _1424 * _1434;
            float _1438 = fma(_1436, _1432, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1410 = _1438;
            _1440 = true;
        }
        else
        {
            bool _1442 = _1378 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1444 = isnan(_1378);
            bool _1446 = _1442 || _1444;
            bool _1448 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1450 = _1446 || _1448;
            if (!_1450)
            {
                float _1452 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1454 = _1378 + _1452;
                float _1456 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1458 = _1456 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1460 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1462 = _1460 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1464 = 1.0 / _1458;
                float _1466 = _1454 * _1464;
                float _1468 = fma(_1466, _1462, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1410 = _1468;
                _1440 = true;
            }
            else
            {
                _1410 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1440 = false;
    float _1470 = _1410;
    float _1472 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1474 = _1344 + _1472;
    float _1476 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1478 = _1350 + _1476;
    float _1480 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1482 = _1352 + _1480;
    float _1484 = fma(_1474, _1470, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1486 = fma(_1478, _1470, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1488 = fma(_1482, _1470, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1490 = -_966;
    float _1492 = fma(_1490, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1484);
    float _1494 = -_986;
    float _1496 = fma(_1494, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1486);
    float _1498 = -_1028;
    float _1500 = fma(_1498, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1488);
    float _1502 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1504 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1506 = _1492 + _1504;
    float _1508 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1510 = _1496 + _1508;
    float _1512 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1514 = _1500 + _1512;
    float _1516 = _1506 * _1506;
    float _1518 = fma(_1510, _1510, _1516);
    float _1520 = fma(_1514, _1514, _1518);
    float _1522 = rsqrt(_1520);
    float _1524 = _1522 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1526 = _1510 * _1524;
    float _1528 = _1514 * _1524;
    float _1530 = _1526 * _1526;
    float _1532 = _1528 * _1528;
    float _1534 = _1530 + _1532;
    float _1536 = sqrt(_1534);
    bool _1538 = _1536 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1540 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1542 = _1536 + _1540;
    float _1544 = _1518;
    float _1546 = _1542;
    float _1548 = _1526;
    if (_1538)
    {
        float _1550 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1544 = _1550;
    }
    float _1552 = _1544;
    if (_1538)
    {
        float _1554 = rsqrt(_1534);
        _1402 = _1554;
    }
    float _1556 = _1402;
    float _1558 = _1556;
    if (_1538)
    {
        float _1560 = _1542 * _1552;
        _1546 = _1560;
    }
    float _1562 = _1546;
    if (_1538)
    {
        float _1564 = _1562 * 0.15915493667125701904296875;
        _1404 = _1564;
    }
    float _1566 = _1404;
    float _1568 = _1552;
    if (_1538)
    {
        float _1570 = _1566 * 6.283185482025146484375;
        float _1572 = sin(_1570);
        _1568 = _1572;
    }
    float _1574 = _1568;
    float _1576 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1578 = precise::max(0.0, _1576);
    float _1580 = _866;
    float _1582 = _1578;
    if (_1538)
    {
        float _1584 = _1566 * 6.283185482025146484375;
        float _1586 = cos(_1584);
        _1580 = _1586;
    }
    float _1588 = _1580;
    float _1590 = -_1524;
    float _1592 = -_1578;
    float _1594 = fma(_1506, _1590, _1592);
    float _1596 = _1594;
    if (_1538)
    {
        float _1598 = _1594 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1582 = _1598;
    }
    float _1600 = _1582;
    float _1602 = sqrt(_1520);
    float _1604 = _1574;
    float _1606 = _1600;
    if (_1538)
    {
        float _1608 = fma(_1574, _1600, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1604 = _1608;
    }
    float _1610 = _1604;
    float _1612 = _1610;
    float _1614 = _1588;
    if (_1538)
    {
        float _1616 = _1588 + (-1.0);
        _1606 = _1616;
    }
    float _1618 = _1606;
    float _1620 = _1618;
    if (_1538)
    {
        float _1622 = _1556 * _1610;
        _1286 = _1622;
    }
    float _1624 = _1286;
    if (!_1538)
    {
        _1558 = _1528;
    }
    float _1626 = _1558;
    float _1628 = _1626;
    if (_1538)
    {
        float _1630 = _1618 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1612 = _1630;
    }
    float _1632 = _1612;
    if (_1538)
    {
        float _1634 = _1526 * _1624;
        _1548 = _1634;
    }
    float _1636 = _1548;
    if (!_1538)
    {
        _1620 = _1530;
    }
    float _1638 = _1620;
    float _1640 = _1638;
    if (_1538)
    {
        float _1642 = _1528 * _1624;
        _1628 = _1642;
    }
    float _1644 = _1628;
    if (_1538)
    {
        float _1646 = fma(_1594, _1588, _1632);
        _1596 = _1646;
    }
    float _1648 = _1596;
    if (_1538)
    {
        float _1650 = _1636 * _1636;
        _1640 = _1650;
    }
    float _1652 = _1640;
    if (!_1538)
    {
        _1614 = _1532;
    }
    float _1654 = _1614;
    float _1656 = _1654;
    if (_1538)
    {
        float _1658 = _1644 * _1644;
        _1656 = _1658;
    }
    float _1660 = _1656;
    float _1662 = fma(_1648, _1648, _1652);
    float _1664 = _1662 + _1660;
    float _1666 = _1492 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1668 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1670 = fma(_1602, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1668);
    float _1672 = precise::clamp(_1670, 0.0, 1.0);
    float _1674 = _1492 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1676 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1666);
    float _1678 = rsqrt(_1664);
    float _1680 = _1492 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1682 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1674);
    float _1684 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1676);
    float _1686 = _1492 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1688 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1680);
    float _1690 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1682);
    float _1692 = _1684 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1694 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1686);
    float _1696 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1688);
    float _1698 = _1690 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1700 = _1692 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1702 = -_1672;
    float _1704 = _1702 + 1.0;
    float _1706 = _1696 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1708 = -_1700;
    float _1710 = fma(_1708, _1502, 1.0);
    float _1712 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1694);
    float _1714 = _1698 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1716 = _1678 * _1636;
    float _1718 = abs(_1704);
    float _1720 = log2(_1718);
    float _1722 = _1678 * _1648;
    float _1724 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1714);
    float _1726 = _1716 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1728 = _1678 * _1644;
    float _1730 = _1712 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1732 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1724);
    float _1734 = -_1726;
    float _1736 = fma(_1722, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1734);
    float _1738 = log2(_1710);
    float _1740 = _1698 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1742 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1732);
    float _1744 = -_1728;
    float _1746 = fma(_1744, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1736);
    float _1748 = _1698 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1750 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1740);
    float _1752 = _1722 + 1.0;
    float _1754 = fma(_1746, -0.5, 0.5);
    float _1756 = _1720 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1758 = 1.0 / _1742;
    float _1760 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1748);
    float _1762 = fma(_1746, 0.5, 0.5);
    float _1764 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1750);
    float _1766 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1760);
    float _1768 = fma(_1762, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1770 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1764);
    float _1772 = exp2(_1756);
    float _1774 = _1738 * 0.693147182464599609375;
    float _1776 = fma(_1762, _1768, -0.212114393711090087890625);
    float _1778 = _1774 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1780 = fma(_1762, _1776, 1.570728778839111328125);
    float _1782 = sqrt(_1754);
    float _1784 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1766);
    float _1786 = _1770 * _1758;
    float _1788 = _1784 * _1758;
    float _1790 = fma(_1786, -0.5, 0.5);
    float _1792 = -_1722;
    float _1794 = fma(_1772, _1752, _1792);
    float _1796 = fma(_1788, 0.5, 0.5);
    float _1798 = fma(_1794, 0.5, 0.5);
    float _1800 = _1782 * 0.636619746685028076171875;
    float3 _4849 = float3(_1796, _1790, _1778);
    float _1802 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4849, float3(0.0), isnan(_4849)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4849, float3(0.0), isnan(_4849)), level(0.0)).x;
    float3 _4860 = float3(_1796, _1790, _1778);
    float4 _1805 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4860, float3(0.0), isnan(_4860)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4860, float3(0.0), isnan(_4860)), level(0.0)).xyzw;
    float _1807 = _1805.x;
    float _1809 = _1805.y;
    float _1811 = _1805.z;
    float _1813 = _1805.w;
    float _1815 = -_1780;
    float _1817 = fma(_1800, _1815, 1.0);
    float2 _4882 = float2(_1817, _1798);
    float3 _1821 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4882, float2(0.0), isnan(_4882)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4882, float2(0.0), isnan(_4882)), level(0.0)).xyz;
    float _1823 = _1821.x;
    float _1825 = _1821.y;
    float _1827 = _1821.z;
    float _1829 = -_966;
    float _1831 = fma(_1829, (*spvDescriptorSet0.vp_c9)._m0[18].w, _674);
    float _1833 = -_986;
    float _1835 = fma(_1833, (*spvDescriptorSet0.vp_c9)._m0[18].w, _732);
    float _1837 = -_1028;
    float _1839 = fma(_1837, (*spvDescriptorSet0.vp_c9)._m0[18].w, _776);
    out.m_75.x = _1510;
    out.m_75.y = _1506;
    out.m_75.z = _1514;
    float _1841 = _1831 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1843 = _1831 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1845 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1841);
    float _1847 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1843);
    float _1849 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1845);
    float _1851 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1847);
    float _1853 = _1849 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1855 = _1851 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1857 = 1.0 / _1853;
    bool _1859 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1861 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1863 = _1859 || _1861;
    bool _1865 = isnan(0.5);
    bool _1867 = _1863 || _1865;
    float _1869 = _1855 + _1853;
    float _1871 = _1720 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1873 = _1839;
    float _1875 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1877 = _1692;
    if (!_1867)
    {
        _1873 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1879 = _1873;
    float _1881 = exp2(_1871);
    float _1883 = _1869 * _1857;
    float _1885 = _1883 * 0.5;
    float _1887 = _1698 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1889 = _1885;
    float _1891 = _1879;
    if (!_1867)
    {
        float _1893 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1895 = fma(_1885, _1879, _1893);
        _1889 = _1895;
    }
    float _1897 = _1889;
    if (!_1867)
    {
        _1891 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _1899 = _1891;
    float _1901 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1887);
    float _1903 = _1899;
    if (!_1867)
    {
        float _1905 = -_1899;
        float _1907 = _1905 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1875 = _1907;
    }
    float _1909 = _1875;
    float _1911 = _1897;
    if (!_1867)
    {
        float _1913 = 1.0 / _1897;
        _1911 = _1913;
    }
    float _1915 = _1911;
    float _1917 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1901);
    if (_1867)
    {
        _1877 = 1.0;
    }
    float _1919 = _1877;
    float _1921 = -_1881;
    float _1923 = _1921 + 1.0;
    float _1925 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1917);
    float _1927 = _1909;
    float _1929 = _1919;
    if (!_1867)
    {
        float _1931 = 1.0 / _1909;
        _1927 = _1931;
    }
    float _1933 = _1927;
    float _1935 = _1925 + _1742;
    out.gl_Position.x = _1784;
    out.gl_Position.y = _1770;
    out.gl_Position.z = _1925;
    out.gl_Position.w = _1742;
    if (!_1867)
    {
        float _1937 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1939 = -_1899;
        float _1941 = fma(_1915, _1937, _1939);
        _1903 = _1941;
    }
    float _1943 = _1903;
    float _1945 = _1935 * 0.5;
    float _1947 = _1943;
    if (!_1867)
    {
        float _1949 = _1943 * _1933;
        float _1951 = precise::clamp(_1949, 0.0, 1.0);
        _1947 = _1951;
    }
    float _1953 = _1947;
    float _1955 = _1923 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_1867)
    {
        float _1957 = -_1953;
        float _1959 = _1957 + 1.0;
        _1929 = _1959;
    }
    float _1961 = _1929;
    float _1963 = _1961 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1965 = _1961 > 0.0;
    bool _1967 = isnan(_1961);
    bool _1969 = _1965 || _1967;
    bool _1971 = isnan(0.0);
    bool _1973 = _1969 || _1971;
    out.m_77.z = _1945;
    out.m_77.w = _1742;
    float _1975 = _1963 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_47.x = _1975;
    float _1977 = _1955 * _1802;
    float _1979 = -_1955;
    float _1981 = _1979 + 1.0;
    float _1983 = _1813 * _1977;
    float _1985 = _1813 * _1981;
    float _1987 = _1827 * _1977;
    float _1989 = fma(_1823, _1983, _1807);
    float _1991 = fma(_1825, _1983, _1809);
    float _1993 = fma(_1813, _1987, _1811);
    out.m_79.x = _1989;
    out.m_79.y = _1991;
    out.m_79.z = _1993;
    out.m_79.w = _1985;
    if (_1973)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _1995 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1995;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

