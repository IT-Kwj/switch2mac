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
    float4 m_69 [[user(locn0)]];
    float4 m_65 [[user(locn1)]];
    float4 m_77 [[user(locn2)]];
    float4 m_71 [[user(locn3)]];
    float4 m_67 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 m_79 [[user(locn6)]];
    float4 m_47 [[user(locn7)]];
    float4 m_73 [[user(locn8)]];
    float4 m_75 [[user(locn9)]];
    float4 m_81 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_59 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_63 [[attribute(4)]];
    float4 m_61 [[attribute(5)]];
    float4 m_55 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_57 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1378 = false;
    bool _472 = false;
    bool _298 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _95 = in.m_44.w;
    float _97 = trunc(_95);
    int _100 = int(_97);
    bool _104 = _100 >= 1;
    float _106 = 0.0;
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _108 = _106;
    if (!_104)
    {
        out.m_47.x = 0.0;
    }
    int _110 = 0;
    if (!_104)
    {
        float _112 = _108 * 5.0;
        _110 = as_type<int>(_112);
    }
    int _114 = _110;
    int _116 = _114;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2163 = as_type<float>(_114);
        out.gl_Position.z = _2163;
    }
    if (!_104)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _118 = in.m_49.w;
    float _120 = float(_100);
    float _122 = 1.0 / _120;
    float _124 = -_118;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _128 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_118);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = _126 * _122;
    bool _140 = _126 >= _120;
    bool _142 = !_136;
    bool _144 = _140 || _142;
    out.m_51.x = _138;
    float _146 = _118;
    float _148 = _126;
    if (_144)
    {
        _146 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _150 = _146;
    if (_144)
    {
        out.m_47.x = 0.0;
    }
    if (_144)
    {
        float _152 = _150 * 5.0;
        _116 = as_type<int>(_152);
    }
    int _154 = _116;
    if (_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2235 = as_type<float>(_154);
        out.gl_Position.z = _2235;
    }
    if (_144)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _156 = in.m_53.w;
    float _158 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _160 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _162 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _164 = _160 || _162;
    bool _166 = isnan(1.0);
    bool _168 = _164 || _166;
    float _170 = in.m_49.x;
    float _172 = in.m_49.y;
    float _174 = in.m_49.z;
    float _176 = in.m_44.x;
    float _178 = in.m_44.y;
    float _180 = in.m_44.z;
    float _182 = 0.0;
    float _184 = _158;
    if (!_168)
    {
        float _186 = _158 * _158;
        float _188 = _186 * 0.5;
        _182 = _188;
    }
    float _190 = _182;
    float _192 = _190;
    if (!_168)
    {
        float _194 = _190 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _192 = _194;
    }
    float _196 = _192;
    bool _198 = !_168;
    float _200 = _196;
    if (!_198)
    {
        float _202 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = log2(_202);
        float _206 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _208 = _206 + 1.0;
        float _210 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _212 = _158 * _204;
        float _214 = 1.0 / _208;
        float _216 = _210 * 0.693147182464599609375;
        float _218 = exp2(_212);
        float _220 = 1.0 / _216;
        float _222 = _218 + (-1.0);
        float _224 = -_222;
        float _226 = fma(_224, _220, _158);
        float _228 = _226 * _214;
        float _230 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _200 = _230;
    }
    float _232 = _200;
    bool _234 = !_168;
    if (!_234)
    {
        float _236 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _238 = log2(_236);
        float _240 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _242 = _240 + 1.0;
        float _244 = 1.0 / _242;
        float _246 = _158 * _238;
        float _248 = exp2(_246);
        float _250 = -_248;
        float _252 = _250 + 1.0;
        float _254 = _252 * _244;
        _184 = _254;
    }
    float _256 = _184;
    bool _258 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _260 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _262 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _264 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _266 = fma(_256, _170, _260);
    float _268 = fma(_256, _172, _262);
    float _270 = fma(_256, _174, _264);
    float _272 = fma(_266, _156, _176);
    float _274 = fma(_268, _156, _178);
    float _276 = fma(_270, _156, _180);
    bool _278 = !_258;
    float _296;
    if (!_278)
    {
        float _280 = in.m_55.x;
        float _282 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _284 = _280 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _286 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[12].x, _126);
        float _288 = _286 * _282;
        float _290 = floor(_288);
        float _292 = -_290;
        float _294 = _288 + _292;
        _296 = _294;
        _298 = true;
    }
    else
    {
        _296 = _138;
    }
    _298 = false;
    float _300 = _296;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _304 = _300 + _302;
    bool _306 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _308 = isnan(_300);
    bool _310 = _306 || _308;
    bool _312 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _314 = _310 || _312;
    float _316 = float(_314);
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _320 = _300 + _318;
    bool _322 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _324 = isnan(_300);
    bool _326 = _322 || _324;
    bool _328 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _330 = _326 || _328;
    float _332 = float(_330);
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _334;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _340 = _338 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _342 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _344 = isnan(_300);
    bool _346 = _342 || _344;
    bool _348 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _350 = _346 || _348;
    float _352 = float(_350);
    float _354 = -_316;
    float _356 = _354 + 1.0;
    float _358 = 1.0 / _340;
    float _360 = _352 * _356;
    float _362 = -_352;
    float _364 = _362 + 1.0;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _366;
    bool _370 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _372 = 1.0 / _336;
    float _374 = _332 * _364;
    float _376 = -_332;
    float _378 = _376 + 1.0;
    float _380 = _320 * _358;
    float _382 = _304 * _372;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _384;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _388;
    float _392 = fma(_368, _382, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _394 = fma(_386, _382, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _396 = fma(_390, _382, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _398 = in.m_53.x;
    float _400 = in.m_53.y;
    float _402 = in.m_53.z;
    float _404 = _392 * _374;
    float _406 = _394 * _374;
    float _408 = _396 * _374;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _416 = _414 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _420 = _418 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _422 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[143].y, _406);
    float _424 = fma(_412, _380, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _426 = fma(_416, _380, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _428 = fma(_420, _380, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _430 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[143].x, _404);
    float _432 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[143].z, _408);
    float _434 = fma(_426, _360, _422);
    float _436 = fma(_424, _360, _430);
    float _438 = fma(_428, _360, _432);
    float _440 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[145].y, _434);
    float _442 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[145].x, _436);
    float _444 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[145].z, _438);
    float _446 = _442 * _398;
    float _448 = _440 * _400;
    float _450 = _444 * _402;
    bool _452 = !_370;
    float _470;
    if (!_452)
    {
        float _454 = in.m_55.x;
        float _456 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _458 = _454 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _460 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[11].y, _126);
        float _462 = _460 * _456;
        float _464 = floor(_462);
        float _466 = -_464;
        float _468 = _462 + _466;
        _470 = _468;
        _472 = true;
    }
    else
    {
        _470 = _138;
    }
    _472 = false;
    float _474 = _470;
    float _476 = in.m_55.z;
    float _478 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _480 = log2(_478);
    float _482 = _274 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _484 = in.m_55.y;
    float _486 = _274 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _490 = 1.0 + _488;
    float _492 = in.m_55.x;
    bool _494 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _496 = isnan(1.0);
    bool _498 = _494 || _496;
    bool _500 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _502 = _498 || _500;
    float _504 = _274 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _506 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[4].x, _482);
    float _508 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[5].x, _486);
    int _510 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _512 = _510 != 0;
    int _514 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _516 = _514 != 0;
    int _518 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _520 = _518 != 0;
    float _522 = 1.0 / _490;
    float _524 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[6].x, _504);
    float _526 = _480 * _126;
    float _528 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[4].z, _506);
    float _530 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[5].z, _508);
    float _532 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[6].z, _524);
    bool _534 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _536 = isnan(0.0);
    bool _538 = _534 || _536;
    bool _540 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _542 = _538 || _540;
    float _544 = exp2(_526);
    float _546 = _476 * 2.0;
    bool _548 = !_516;
    int _550 = _548 ? 0 : 1;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _554 = _474 + _552;
    float _556 = _448 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _558 = _474 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _560 = isnan(_474);
    bool _562 = _558 || _560;
    bool _564 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _566 = _562 || _564;
    float _568 = float(_566);
    float _570 = floor(_546);
    float _572 = _484 + _476;
    float _574 = _492 * 2.0;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _578 = _576 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _580 = _474 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _582 = isnan(_474);
    bool _584 = _580 || _582;
    bool _586 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _588 = _584 || _586;
    float _590 = float(_588);
    float _592 = _572 + (-1.0);
    float _594 = in.m_57.x;
    float _596 = -_544;
    float _598 = _596 + 1.0;
    float _600 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _602 = _484 * 2.0;
    float _604 = floor(_574);
    float _606 = _492 + _484;
    float _608 = _542 ? _598 : 0.0;
    bool _610 = _570 > 0.0;
    float _612 = _606 + (-1.0);
    bool _614 = _570 >= 0.0;
    bool _616 = isnan(_570);
    bool _618 = _614 || _616;
    bool _620 = isnan(0.0);
    bool _622 = _618 || _620;
    float _624 = floor(_602);
    float _626 = _530 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    if (_502)
    {
        float _628 = _608 * _522;
        _148 = _628;
    }
    float _630 = _148;
    float _632 = _528 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _634 = _532 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _636 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _638 = _626 + _636;
    int _640 = _622 ? 0 : 1;
    float _642 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _644 = _632 + _642;
    float _646 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _648 = _634 + _646;
    float _650 = _638 * _638;
    bool _652 = _604 > 0.0;
    float _654 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _656 = _604 >= 0.0;
    bool _658 = isnan(_604);
    bool _660 = _656 || _658;
    bool _662 = isnan(0.0);
    bool _664 = _660 || _662;
    float _666 = fma(_644, _644, _650);
    bool _668 = !_512;
    int _670 = _668 ? 0 : 1;
    float _672 = 1.0 / _578;
    bool _674 = _624 > 0.0;
    float _676 = fma(_648, _648, _666);
    int _678 = _664 ? 0 : 1;
    bool _680 = _624 >= 0.0;
    bool _682 = isnan(_624);
    bool _684 = _680 || _682;
    bool _686 = isnan(0.0);
    bool _688 = _684 || _686;
    int _690 = ~_678;
    int _692 = _690 + 1;
    int _694 = _692 + 1;
    float _696 = rsqrt(_676);
    int _698 = _688 ? 0 : 1;
    int _700 = _694;
    bool _702 = _674;
    if (!_652)
    {
        int _704 = ~_678;
        int _706 = _704 + 1;
        _700 = _706;
    }
    int _708 = _700;
    int _710 = ~_698;
    int _712 = _710 + 1;
    int _714 = _712 + 1;
    int _716 = abs(_670);
    int _718 = _714;
    if (!_674)
    {
        int _720 = ~_698;
        int _722 = _720 + 1;
        _718 = _722;
    }
    int _724 = _718;
    float _726 = in.m_59.x;
    float _728 = in.m_59.y;
    float _730 = in.m_59.z;
    int _732 = ~_640;
    int _734 = _732 + 1;
    int _736 = _734 + 1;
    int _738 = _736;
    if (!_610)
    {
        int _740 = ~_640;
        int _742 = _740 + 1;
        _738 = _742;
    }
    int _744 = _738;
    float _746 = _638 * _696;
    float _748 = float(_716);
    float _750 = float(_744);
    float _752 = _644 * _696;
    float _754 = -_746;
    float _756 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[18].w, _638);
    float _758 = float(_724);
    float _760 = -_752;
    float _762 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[18].w, _644);
    float _764 = _756 * _756;
    float _766 = _748 * _750;
    int _768 = abs(_550);
    float _770 = _492 + (-0.5);
    float _772 = fma(_762, _762, _764);
    float _774 = _766 * (-2.0);
    bool _776 = !_520;
    int _778 = _776 ? 0 : 1;
    float _780 = _648 * _696;
    float _782 = float(_768);
    float _784 = fma(_654, _774, _654);
    float _786 = fma(_774, _726, _726);
    float _788 = float(_708);
    float _790 = _484 + (-0.5);
    int _792 = abs(_778);
    float _794 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[196].x, _786);
    float _796 = _782 * _788;
    float _798 = fma(_784, _630, _794);
    float _800 = -_780;
    float _802 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[18].w, _648);
    float _804 = _796 * (-2.0);
    float _806 = float(_792);
    float _808 = _798 * 0.15915493667125701904296875;
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _812 = _810 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _814 = fma(_804, _728, _728);
    float _816 = fma(_600, _804, _600);
    float _818 = _806 * _758;
    float _820 = _492 + _476;
    float _822 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[196].y, _814);
    float _824 = _818 * (-2.0);
    float _826 = _820 + (-1.0);
    float _828 = fma(_816, _630, _822);
    float _830 = in.m_55.w;
    float _832 = 1.0 / _812;
    float _834 = fma(_826, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _836 = _828 * 0.15915493667125701904296875;
    float _838 = fma(_824, _730, _730);
    float _840 = _476 + (-0.5);
    float _842 = fma(_834, _824, _834);
    float _844 = fma(_802, _802, _772);
    float _846 = fma(_840, (*spvDescriptorSet0.vp_c9)._m0[196].z, _838);
    float _848 = _808 * 6.283185482025146484375;
    float _850 = sin(_848);
    float _852 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _854 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _852;
    float _856 = fma(_842, _630, _846);
    int _858 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _860 = _858 != 0;
    float _862 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _864 = _862 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    int _866 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _868 = _866 != 0;
    float _870 = _856 * 0.15915493667125701904296875;
    int _872 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _874 = _872 != 0;
    float _876 = _854 * _832;
    int _878 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _880 = _878 != 0;
    float _882 = sqrt(_844);
    float _884 = in.m_61.x;
    float _886 = in.m_61.y;
    float _888 = in.m_61.z;
    bool _890 = _484 > 0.5;
    float _892 = _864 * _672;
    bool _894 = _830 > 0.5;
    float _896 = fma(_876, _554, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _898 = _808 * 6.283185482025146484375;
    float _900 = cos(_898);
    bool _902 = _874;
    if (_860)
    {
        bool _904 = _492 > 0.5;
        _702 = _904;
    }
    bool _906 = _702;
    float _908 = _836 * 6.283185482025146484375;
    float _910 = sin(_908);
    float _912 = _696 * _882;
    float _914 = _836 * 6.283185482025146484375;
    float _916 = cos(_914);
    float _918 = _870 * 6.283185482025146484375;
    float _920 = sin(_918);
    float _922 = _850 * _910;
    float _924 = _900 * _910;
    float _926 = _870 * 6.283185482025146484375;
    float _928 = cos(_926);
    float _930 = _900 * _916;
    float _932 = _850 * _916;
    float _934 = fma(_920, _930, _922);
    float _936 = fma(_920, _922, _930);
    float _938 = _446 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _940 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _886);
    float _942 = -_924;
    float _944 = fma(_920, _932, _942);
    float _946 = in.m_57.y;
    float _948 = _916 * _928;
    float _950 = _556 * _912;
    float _952 = _900 * _928;
    float _954 = _850 * _928;
    float _956 = _910 * _928;
    float _958 = -_932;
    float _960 = fma(_920, _924, _958);
    float _962 = _450 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _964 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _884);
    float _966 = _938 * _912;
    float _968 = _950 * _940;
    float _970 = _962 * _912;
    float _972 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _888);
    float _974 = _966 * _964;
    float _976 = _952 * _968;
    float _978 = -_968;
    float _980 = _920 * _978;
    float _982 = _970 * _972;
    float _984 = _954 * _968;
    float _986 = fma(_934, _974, _976);
    float _988 = fma(_948, _974, _980);
    float _990 = fma(_944, _974, _984);
    float _992 = fma(_960, _982, _986);
    float _994 = fma(_956, _982, _988);
    bool _996 = _474 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _998 = isnan(_474);
    bool _1000 = _996 || _998;
    bool _1002 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1004 = _1000 || _1002;
    float _1006 = float(_1004);
    float _1008 = fma(_936, _982, _990);
    float _1010 = _992 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1012 = _992 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1014 = -_946;
    float _1016 = _1014 + 1.0;
    float _1018 = -_1006;
    float _1020 = _1018 + 1.0;
    float _1022 = fma(_994, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1010);
    float _1024 = fma(_994, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1012);
    float _1026 = -_568;
    float _1028 = _1026 + 1.0;
    float _1030 = in.m_63.x;
    float _1032 = in.m_63.y;
    float _1034 = in.m_63.z;
    float _1036 = fma(_1008, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1022);
    float _1038 = fma(_1008, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1024);
    float _1040 = _1006 * _1028;
    int _1042 = _894 ? as_type<int>(_1016) : as_type<int>(_946);
    float _1044 = _632 + _1036;
    float _1046 = _634 + _1038;
    bool _1048 = _886 != 0.0;
    bool _1050 = isnan(_886);
    bool _1052 = _1048 || _1050;
    bool _1054 = isnan(0.0);
    bool _1056 = _1052 || _1054;
    float _1058 = _590 * _1020;
    float _1060 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1062 = _1044 + _1060;
    float _1064 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1066 = _1046 + _1064;
    bool _1068 = _884 == 0.0;
    bool _1070 = !_1056;
    bool _1072 = _1068 && _1070;
    float _1074 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1076 = _474 + _1074;
    float _1078 = _1062 * _1062;
    float _1080 = _1066 * _1066;
    bool _1082 = _888 == 0.0;
    bool _1084 = _1082 && _1072;
    float _1086 = _992 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1088 = _896 * _1058;
    float _1090 = _1078 + _1080;
    float _1092 = -_590;
    float _1094 = _1092 + 1.0;
    float _1096 = _874 ? as_type<float>(_1042) : _946;
    float _1098 = fma(_994, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1086);
    float _1100 = sqrt(_1090);
    float _1102 = _946;
    int _1104 = as_type<int>(_1016);
    float _1106 = _1006;
    float _1108 = _886;
    float _1110 = _1078;
    float _1112 = _1080;
    float _1114 = _1044;
    float _1116 = _1046;
    if (_868)
    {
        bool _1118 = _476 > 0.5;
        _902 = _1118;
    }
    bool _1120 = _902;
    float _1122 = fma(_892, _1076, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    if (_880)
    {
        float _1124 = _890 ? _1016 : _946;
        _1102 = _1124;
    }
    float _1126 = _1102;
    if (_860)
    {
        float _1128 = -_594;
        float _1130 = _1128 + 1.0;
        _1104 = as_type<int>(_1130);
    }
    int _1132 = _1104;
    float _1134 = fma(_1094, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1088);
    float _1136 = _1030;
    float _1138 = _1032;
    float _1140 = _1034;
    int _1142 = _1132;
    if (!_1084)
    {
        float _1144 = fma(_884, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1030);
        _1136 = _1144;
    }
    float _1146 = _1136;
    float _1148 = _1146;
    if (!_1084)
    {
        float _1150 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1032);
        _1138 = _1150;
    }
    float _1152 = _1138;
    if (!_1084)
    {
        float _1154 = fma(_888, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1034);
        _1140 = _1154;
    }
    float _1156 = _1140;
    float _1158 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1160 = fma(_1008, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1098);
    if (!_860)
    {
        _1106 = _594;
    }
    float _1162 = _1106;
    float _1164 = fma(_1122, _1040, _1134);
    float _1166 = _1162;
    if (_860)
    {
        float _1168 = _906 ? as_type<float>(_1132) : _594;
        _1166 = _1168;
    }
    float _1170 = _1166;
    float _1172 = _1170;
    if (_868)
    {
        float _1174 = -_594;
        float _1176 = _1174 + 1.0;
        _1142 = as_type<int>(_1176);
    }
    int _1178 = _1142;
    float _1180 = -_1152;
    float _1182 = _920 * _1180;
    bool _1184 = _1100 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1186 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1188 = _952 * _1152;
    float _1190 = _954 * _1152;
    float _1192 = _626 + _1160;
    if (!_868)
    {
        _1108 = _594;
    }
    float _1194 = _1108;
    float _1196 = fma(_948, _1146, _1182);
    float _1198 = fma(_934, _1146, _1188);
    float _1200 = fma(_944, _1146, _1190);
    float _1202 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1204 = _1194;
    if (_868)
    {
        float _1206 = _1120 ? as_type<float>(_1178) : _594;
        _1204 = _1206;
    }
    float _1208 = _1204;
    float _1210 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1164);
    if (!_1184)
    {
        _1148 = _1192;
    }
    float _1212 = _1148;
    bool _1214 = !_1184;
    float _1216 = _1212;
    if (!_1214)
    {
        float _1218 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1220 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1222 = _1100 + _1220;
        float _1224 = _1192 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1226 = rsqrt(_1090);
        float _1228 = _1222 * _1218;
        float _1230 = _1228 * 0.15915493667125701904296875;
        float _1232 = _1230 * 6.283185482025146484375;
        float _1234 = sin(_1232);
        float _1236 = _1230 * 6.283185482025146484375;
        float _1238 = cos(_1236);
        float _1240 = fma(_1234, _1224, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1242 = _1226 * _1240;
        float _1244 = fma(_1062, _1242, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1246 = _1238 + (-1.0);
        float _1248 = fma(_1066, _1242, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1250 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1252 = _1244 + _1250;
        float _1254 = _1246 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1256 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1258 = _1248 + _1256;
        float _1260 = _1252 * _1252;
        float _1262 = fma(_1192, _1238, _1254);
        float _1264 = _1258 * _1258;
        _1216 = _1262;
        _1110 = _1260;
        _1112 = _1264;
        _1114 = _1244;
        _1116 = _1248;
    }
    float _1266 = _1216;
    float _1268 = _1110;
    float _1270 = _1112;
    float _1272 = _1114;
    float _1274 = _1116;
    float _1276 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1278 = _1266 + _1276;
    float _1280 = fma(_956, _1156, _1196);
    float _1282 = fma(_960, _1156, _1198);
    float _1284 = fma(_936, _1156, _1200);
    float _1286 = fma(_1278, _1278, _1268);
    float _1288 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1290 = _1096 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1292 = _1282 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1294 = _1286 + _1270;
    float _1296 = _1282 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1298 = _1282 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1300 = _1290 * _1202;
    float _1302 = fma(_1280, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1292);
    float _1304 = _1208 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1306 = sqrt(_1294);
    float _1308 = fma(_1280, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1296);
    float _1310 = fma(_1280, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1298);
    float _1312 = _1126 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1314 = _1170 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1316 = _1210 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1318 = _1304 * _1288;
    float _1320 = _1312 * _1186;
    float _1322 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1324 = _1314 * _1158;
    float _1326 = fma(_1284, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1308);
    float _1328 = fma(_1284, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1310);
    float _1330 = fma(_1284, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1302);
    out.m_65.w = _1322;
    bool _1332 = _1306 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1334 = isnan(_1306);
    bool _1336 = _1332 || _1334;
    bool _1338 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1340 = _1336 || _1338;
    out.m_67.x = _1324;
    out.m_67.y = _1320;
    out.m_67.z = _1318;
    out.m_67.w = _1300;
    out.m_69.w = _1316;
    out.m_71.x = _966;
    out.m_73.x = _1326;
    out.m_73.y = _1328;
    out.m_73.z = _1330;
    float _1342 = _1308;
    if (!_1340)
    {
        _1342 = 1.0;
    }
    float _1344 = _1342;
    bool _1346 = !_1340;
    float _1348 = _1344;
    if (!_1346)
    {
        bool _1350 = _1306 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1352 = isnan(_1306);
        bool _1354 = _1350 || _1352;
        bool _1356 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1358 = _1354 || _1356;
        if (!_1358)
        {
            float _1360 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1362 = _1306 + _1360;
            float _1364 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1366 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1364;
            float _1368 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1370 = _1368 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1372 = 1.0 / _1366;
            float _1374 = _1362 * _1372;
            float _1376 = fma(_1374, _1370, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1348 = _1376;
            _1378 = true;
        }
        else
        {
            bool _1380 = _1306 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1382 = isnan(_1306);
            bool _1384 = _1380 || _1382;
            bool _1386 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1388 = _1384 || _1386;
            if (!_1388)
            {
                float _1390 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1392 = _1306 + _1390;
                float _1394 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1396 = _1394 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1398 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1400 = _1398 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1402 = 1.0 / _1396;
                float _1404 = _1392 * _1402;
                float _1406 = fma(_1404, _1400, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1348 = _1406;
                _1378 = true;
            }
            else
            {
                _1348 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1378 = false;
    float _1408 = _1348;
    float _1410 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1412 = _1272 + _1410;
    float _1414 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1416 = _1266 + _1414;
    float _1418 = -_752;
    float _1420 = fma(_1418, (*spvDescriptorSet0.vp_c9)._m0[18].w, _632);
    bool _1422 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1424 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1426 = _1422 || _1424;
    bool _1428 = isnan(0.5);
    bool _1430 = _1426 || _1428;
    float _1432 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1434 = _1274 + _1432;
    float _1436 = fma(_1412, _1408, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1438 = fma(_1416, _1408, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1440 = -_780;
    float _1442 = fma(_1440, (*spvDescriptorSet0.vp_c9)._m0[18].w, _634);
    float _1444 = fma(_1434, _1408, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1446 = -_752;
    float _1448 = fma(_1446, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1436);
    float _1450 = -_746;
    float _1452 = fma(_1450, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1438);
    float _1454 = -_746;
    float _1456 = fma(_1454, (*spvDescriptorSet0.vp_c9)._m0[18].w, _626);
    float _1458 = -_780;
    float _1460 = fma(_1458, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1444);
    float _1462 = _1452;
    float _1464 = _1448;
    float _1466 = _1460;
    float _1468 = _1416;
    float _1470 = _1408;
    float _1472 = _1444;
    float _1474 = _1438;
    if (!_1430)
    {
        float _1476 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1478 = _1456 + _1476;
        float _1480 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1482 = _1420 + _1480;
        float _1484 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1486 = -_634;
        float _1488 = _1486 + _1444;
        float _1490 = _1478 * _1478;
        float _1492 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1494 = _1442 + _1492;
        float _1496 = -_632;
        float _1498 = _1496 + _1436;
        float _1500 = fma(_1482, _1482, _1490);
        float _1502 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1504 = fma(_1494, _1494, _1500);
        float _1506 = sqrt(_1504);
        float _1508 = 1.0 / _912;
        float _1510 = _1502 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1512 = precise::min(_1506, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1514 = _1512 * _1484;
        float _1516 = _1514 * _1508;
        float _1518 = -_626;
        float _1520 = _1518 + _1438;
        float _1522 = _1510 * _1516;
        float _1524 = _1488 * _1516;
        float _1526 = fma(_1498, _1522, _1420);
        float _1528 = fma(_1520, _1522, _1456);
        float _1530 = fma(_1510, _1524, _1442);
        _1462 = _1528;
        _1464 = _1526;
        _1466 = _1530;
        _1468 = _1516;
        _1470 = _1522;
    }
    float _1532 = _1462;
    float _1534 = _1464;
    float _1536 = _1466;
    float _1538 = _1468;
    float _1540 = _1470;
    float _1542 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1544 = _1532 + _1542;
    float _1546 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1548 = _1534 + _1546;
    float _1550 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1552 = _1536 + _1550;
    float _1554 = _1544 * _1544;
    float _1556 = fma(_1548, _1548, _1554);
    float _1558 = fma(_1552, _1552, _1556);
    float _1560 = rsqrt(_1558);
    float _1562 = _1560 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1564 = _1548 * _1562;
    float _1566 = _1552 * _1562;
    float _1568 = _1564 * _1564;
    float _1570 = _1566 * _1566;
    float _1572 = _1568 + _1570;
    float _1574 = sqrt(_1572);
    bool _1576 = _1574 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1578 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1580 = _1574 + _1578;
    float _1582 = _1538;
    float _1584 = _1572;
    float _1586 = _1580;
    if (_1576)
    {
        float _1588 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1582 = _1588;
    }
    float _1590 = _1582;
    if (_1576)
    {
        float _1592 = rsqrt(_1572);
        _1584 = _1592;
    }
    float _1594 = _1584;
    float _1596 = _1594;
    if (_1576)
    {
        float _1598 = _1580 * _1590;
        _1586 = _1598;
    }
    float _1600 = _1586;
    if (_1576)
    {
        float _1602 = _1600 * 0.15915493667125701904296875;
        _1472 = _1602;
    }
    float _1604 = _1472;
    float _1606 = _1540;
    if (_1576)
    {
        float _1608 = _1604 * 6.283185482025146484375;
        float _1610 = sin(_1608);
        _1606 = _1610;
    }
    float _1612 = _1606;
    float _1614 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1616 = precise::max(0.0, _1614);
    float _1618 = _912;
    float _1620 = _1616;
    float _1622 = _1614;
    if (_1576)
    {
        float _1624 = _1604 * 6.283185482025146484375;
        float _1626 = cos(_1624);
        _1618 = _1626;
    }
    float _1628 = _1618;
    float _1630 = -_1562;
    float _1632 = -_1616;
    float _1634 = fma(_1544, _1630, _1632);
    if (_1576)
    {
        float _1636 = _1634 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1620 = _1636;
    }
    float _1638 = _1620;
    float _1640 = sqrt(_1558);
    float _1642 = _1638;
    float _1644 = _1612;
    if (_1576)
    {
        float _1646 = fma(_1612, _1638, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1642 = _1646;
    }
    float _1648 = _1642;
    float _1650 = _1648;
    if (!_1576)
    {
        _1644 = _1564;
    }
    float _1652 = _1644;
    float _1654 = _1652;
    float _1656 = _1628;
    if (_1576)
    {
        float _1658 = _1628 + (-1.0);
        _1622 = _1658;
    }
    float _1660 = _1622;
    float _1662 = _1660;
    if (_1576)
    {
        float _1664 = _1594 * _1648;
        _1172 = _1664;
    }
    float _1666 = _1172;
    if (!_1576)
    {
        _1650 = _1634;
    }
    float _1668 = _1650;
    float _1670 = _1668;
    if (_1576)
    {
        float _1672 = _1660 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1474 = _1672;
    }
    float _1674 = _1474;
    if (_1576)
    {
        float _1676 = _1564 * _1666;
        _1654 = _1676;
    }
    float _1678 = _1654;
    if (!_1576)
    {
        _1662 = _1566;
    }
    float _1680 = _1662;
    float _1682 = _1680;
    if (_1576)
    {
        float _1684 = _1566 * _1666;
        _1682 = _1684;
    }
    float _1686 = _1682;
    if (!_1576)
    {
        _1596 = _1568;
    }
    float _1688 = _1596;
    float _1690 = _1688;
    if (_1576)
    {
        float _1692 = fma(_1634, _1628, _1674);
        _1670 = _1692;
    }
    float _1694 = _1670;
    if (_1576)
    {
        float _1696 = _1678 * _1678;
        _1690 = _1696;
    }
    float _1698 = _1690;
    if (!_1576)
    {
        _1656 = _1570;
    }
    float _1700 = _1656;
    float _1702 = _1700;
    if (_1576)
    {
        float _1704 = _1686 * _1686;
        _1702 = _1704;
    }
    float _1706 = _1702;
    float _1708 = fma(_1694, _1694, _1698);
    float _1710 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1712 = _1708 + _1706;
    float _1714 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1716 = fma(_1640, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1714);
    float _1718 = precise::clamp(_1716, 0.0, 1.0);
    float _1720 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1710);
    float _1722 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1724 = rsqrt(_1712);
    float _1726 = -_1718;
    float _1728 = _1726 + 1.0;
    float _1730 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1720);
    float _1732 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1734 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1736 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1722);
    float _1738 = _1730 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1740 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1732);
    float _1742 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1734);
    float _1744 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1736);
    float _1746 = abs(_1728);
    float _1748 = log2(_1746);
    float _1750 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1740);
    float _1752 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1742);
    float _1754 = _1744 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1756 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1758 = _1750 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1760 = _1724 * _1678;
    float _1762 = _1752 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1764 = _1724 * _1694;
    float _1766 = _1754 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1768 = _1760 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1770 = _1738 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1772 = _1724 * _1686;
    float _1774 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1766);
    float _1776 = -_1768;
    float _1778 = fma(_1764, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1776);
    float _1780 = -_1770;
    float _1782 = fma(_1780, _1756, 1.0);
    float _1784 = _1748 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1786 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1774);
    float _1788 = -_1772;
    float _1790 = fma(_1788, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1778);
    float _1792 = log2(_1782);
    float _1794 = _1754 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1796 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1786);
    float _1798 = fma(_1790, -0.5, 0.5);
    float _1800 = _1754 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1802 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1794);
    float _1804 = fma(_1790, 0.5, 0.5);
    float _1806 = _1764 + 1.0;
    float _1808 = exp2(_1784);
    float _1810 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1800);
    float _1812 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1802);
    float _1814 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1810);
    float _1816 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1812);
    float _1818 = 1.0 / _1796;
    float _1820 = fma(_1804, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1822 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1814);
    float _1824 = fma(_1804, _1820, -0.212114393711090087890625);
    float _1826 = sqrt(_1798);
    float _1828 = -_1764;
    float _1830 = fma(_1808, _1806, _1828);
    float _1832 = _1792 * 0.693147182464599609375;
    float _1834 = fma(_1804, _1824, 1.570728778839111328125);
    float _1836 = _1832 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1838 = _1816 * _1818;
    float _1840 = _1822 * _1818;
    float _1842 = fma(_1838, -0.5, 0.5);
    float _1844 = fma(_1840, 0.5, 0.5);
    float _1846 = fma(_1830, 0.5, 0.5);
    float _1848 = _1826 * 0.636619746685028076171875;
    float _1850 = -_1834;
    float _1852 = fma(_1848, _1850, 1.0);
    float3 _4926 = float3(_1844, _1842, _1836);
    float _1854 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4926, float3(0.0), isnan(_4926)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4926, float3(0.0), isnan(_4926)), level(0.0)).x;
    float3 _4937 = float3(_1844, _1842, _1836);
    float4 _1857 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4937, float3(0.0), isnan(_4937)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4937, float3(0.0), isnan(_4937)), level(0.0)).xyzw;
    float _1859 = _1857.x;
    float _1861 = _1857.y;
    float _1863 = _1857.z;
    float _1865 = _1857.w;
    float2 _4954 = float2(_1852, _1846);
    float3 _1869 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4954, float2(0.0), isnan(_4954)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4954, float2(0.0), isnan(_4954)), level(0.0)).xyz;
    float _1871 = _1869.x;
    float _1873 = _1869.y;
    float _1875 = _1869.z;
    float _1877 = _1456 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    out.m_75.x = _1534;
    out.m_75.y = _1532;
    out.m_75.z = _1536;
    float _1879 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1877);
    float _1881 = _1456 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1883 = _1748 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1885 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1879);
    float _1887 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1881);
    float _1889 = _1885 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1891 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1887);
    float _1893 = exp2(_1883);
    float _1895 = _1891 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1897 = _1895 + _1889;
    float _1899 = 1.0 / _1889;
    float _1901 = _1897 * _1899;
    float _1903 = _1901 * 0.5;
    float _1905 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1907 = fma(_1903, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1905);
    float _1909 = _1754 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1911 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1913 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1915 = _1911 || _1913;
    bool _1917 = isnan(0.5);
    bool _1919 = _1915 || _1917;
    float _1921 = 1.0 / _1907;
    float _1923 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1909);
    float _1925 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1923);
    float _1927 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1925);
    float _1929 = _1762;
    float _1931 = _1923;
    if (_1919)
    {
        _1929 = 1.0;
    }
    float _1933 = _1929;
    float _1935 = _1933;
    if (_1919)
    {
        _1931 = 1.0;
    }
    float _1937 = _1931;
    float _1939 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1941 = _1921 * _1939;
    float _1943 = _1937;
    if (!_1919)
    {
        float _1945 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1947 = _1945 * 0.15915493667125701904296875;
        float _1949 = _1947 * 6.283185482025146484375;
        float _1951 = cos(_1949);
        float _1953 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1955 = _1953 * 0.15915493667125701904296875;
        float _1957 = _1947 * 6.283185482025146484375;
        float _1959 = sin(_1957);
        float _1961 = 1.0 / _1951;
        float _1963 = _1955 * 6.283185482025146484375;
        float _1965 = cos(_1963);
        float _1967 = _1959 * _1961;
        float _1969 = _1955 * 6.283185482025146484375;
        float _1971 = sin(_1969);
        float _1973 = _1965 * _1967;
        float _1975 = 1.0 / _1973;
        float _1977 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1979 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1977;
        float _1981 = 1.0 / _1979;
        float _1983 = _1971 * _1975;
        float _1985 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1987 = fma(_1941, _1983, _1985);
        float _1989 = _1987 * _1981;
        float _1991 = precise::clamp(_1989, 0.0, 1.0);
        _1935 = _1991;
    }
    float _1993 = _1935;
    if (!_1919)
    {
        float _1995 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1997 = _1995 * 0.15915493667125701904296875;
        float _1999 = _1997 * 6.283185482025146484375;
        float _2001 = cos(_1999);
        float _2003 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2005 = _2003 * 0.15915493667125701904296875;
        float _2007 = _1997 * 6.283185482025146484375;
        float _2009 = sin(_2007);
        float _2011 = 1.0 / _2001;
        float _2013 = _2005 * 6.283185482025146484375;
        float _2015 = cos(_2013);
        float _2017 = _2009 * _2011;
        float _2019 = _2005 * 6.283185482025146484375;
        float _2021 = sin(_2019);
        float _2023 = _2015 * _2017;
        float _2025 = 1.0 / _2023;
        float _2027 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2029 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2027;
        float _2031 = 1.0 / _2029;
        float _2033 = _2021 * _2025;
        float _2035 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2037 = fma(_1941, _2033, _2035);
        float _2039 = _2037 * _2031;
        float _2041 = precise::clamp(_2039, 0.0, 1.0);
        float _2043 = -_2041;
        float _2045 = _2043 + 1.0;
        _1943 = _2045;
    }
    float _2047 = _1943;
    float _2049 = -_1893;
    float _2051 = _2049 + 1.0;
    float _2053 = _1993 * _2047;
    float _2055 = _1796 * 0.5;
    bool _2057 = _1993 > 0.0;
    bool _2059 = isnan(_1993);
    bool _2061 = _2057 || _2059;
    bool _2063 = isnan(0.0);
    bool _2065 = _2061 || _2063;
    float _2067 = _2051 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2069 = _2053 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2071 = fma(_1816, -0.5, _2055);
    bool _2073 = _2047 <= 0.0;
    bool _2075 = !_2065;
    bool _2077 = _2073 || _2075;
    float _2079 = _2067 * _1854;
    float _2081 = _2069 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2083 = _1927 + _1796;
    float _2085 = _1822 + _1796;
    float _2087 = _1865 * _2079;
    float _2089 = _1875 * _2079;
    float _2091 = -_2067;
    float _2093 = _2091 + 1.0;
    out.gl_Position.x = _1822;
    out.gl_Position.y = _1816;
    out.gl_Position.z = _1927;
    out.gl_Position.w = _1796;
    float _2095 = fma(_1871, _2087, _1859);
    float _2097 = _2083 * 0.5;
    out.m_47.x = _2081;
    float _2099 = _2085 * 0.5;
    float _2101 = fma(_1873, _2087, _1861);
    float _2103 = _1865 * _2093;
    out.m_77.x = _1548;
    out.m_77.y = _1544;
    out.m_77.z = _1552;
    float _2105 = fma(_1865, _2089, _1863);
    out.m_79.x = _2099;
    out.m_79.y = _2071;
    out.m_79.z = _2097;
    out.m_79.w = _1796;
    out.m_81.x = _2095;
    out.m_81.y = _2101;
    out.m_81.z = _2105;
    out.m_81.w = _2103;
    if (!_2077)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2107 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2107;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1378 = false;
    bool _472 = false;
    bool _298 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _95 = in.m_44.w;
    float _97 = trunc(_95);
    int _100 = int(_97);
    bool _104 = _100 >= 1;
    float _106 = 0.0;
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _108 = _106;
    if (!_104)
    {
        out.m_47.x = 0.0;
    }
    int _110 = 0;
    if (!_104)
    {
        float _112 = _108 * 5.0;
        _110 = as_type<int>(_112);
    }
    int _114 = _110;
    int _116 = _114;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2163 = as_type<float>(_114);
        out.gl_Position.z = _2163;
    }
    if (!_104)
    {
        return out;
    }
    float _118 = in.m_49.w;
    float _120 = float(_100);
    float _122 = 1.0 / _120;
    float _124 = -_118;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _128 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_118);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = _126 * _122;
    bool _140 = _126 >= _120;
    bool _142 = !_136;
    bool _144 = _140 || _142;
    out.m_51.x = _138;
    float _146 = _118;
    float _148 = _126;
    if (_144)
    {
        _146 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _150 = _146;
    if (_144)
    {
        out.m_47.x = 0.0;
    }
    if (_144)
    {
        float _152 = _150 * 5.0;
        _116 = as_type<int>(_152);
    }
    int _154 = _116;
    if (_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2235 = as_type<float>(_154);
        out.gl_Position.z = _2235;
    }
    if (_144)
    {
        return out;
    }
    float _156 = in.m_53.w;
    float _158 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _160 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _162 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _164 = _160 || _162;
    bool _166 = isnan(1.0);
    bool _168 = _164 || _166;
    float _170 = in.m_49.x;
    float _172 = in.m_49.y;
    float _174 = in.m_49.z;
    float _176 = in.m_44.x;
    float _178 = in.m_44.y;
    float _180 = in.m_44.z;
    float _182 = 0.0;
    float _184 = _158;
    if (!_168)
    {
        float _186 = _158 * _158;
        float _188 = _186 * 0.5;
        _182 = _188;
    }
    float _190 = _182;
    float _192 = _190;
    if (!_168)
    {
        float _194 = _190 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _192 = _194;
    }
    float _196 = _192;
    bool _198 = !_168;
    float _200 = _196;
    if (!_198)
    {
        float _202 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = log2(_202);
        float _206 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _208 = _206 + 1.0;
        float _210 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _212 = _158 * _204;
        float _214 = 1.0 / _208;
        float _216 = _210 * 0.693147182464599609375;
        float _218 = exp2(_212);
        float _220 = 1.0 / _216;
        float _222 = _218 + (-1.0);
        float _224 = -_222;
        float _226 = fma(_224, _220, _158);
        float _228 = _226 * _214;
        float _230 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _200 = _230;
    }
    float _232 = _200;
    bool _234 = !_168;
    if (!_234)
    {
        float _236 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _238 = log2(_236);
        float _240 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _242 = _240 + 1.0;
        float _244 = 1.0 / _242;
        float _246 = _158 * _238;
        float _248 = exp2(_246);
        float _250 = -_248;
        float _252 = _250 + 1.0;
        float _254 = _252 * _244;
        _184 = _254;
    }
    float _256 = _184;
    bool _258 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _260 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _262 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _264 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _266 = fma(_256, _170, _260);
    float _268 = fma(_256, _172, _262);
    float _270 = fma(_256, _174, _264);
    float _272 = fma(_266, _156, _176);
    float _274 = fma(_268, _156, _178);
    float _276 = fma(_270, _156, _180);
    bool _278 = !_258;
    float _296;
    if (!_278)
    {
        float _280 = in.m_55.x;
        float _282 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _284 = _280 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _286 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[12].x, _126);
        float _288 = _286 * _282;
        float _290 = floor(_288);
        float _292 = -_290;
        float _294 = _288 + _292;
        _296 = _294;
        _298 = true;
    }
    else
    {
        _296 = _138;
    }
    _298 = false;
    float _300 = _296;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _304 = _300 + _302;
    bool _306 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _308 = isnan(_300);
    bool _310 = _306 || _308;
    bool _312 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _314 = _310 || _312;
    float _316 = float(_314);
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _320 = _300 + _318;
    bool _322 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _324 = isnan(_300);
    bool _326 = _322 || _324;
    bool _328 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _330 = _326 || _328;
    float _332 = float(_330);
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _334;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _340 = _338 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _342 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _344 = isnan(_300);
    bool _346 = _342 || _344;
    bool _348 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _350 = _346 || _348;
    float _352 = float(_350);
    float _354 = -_316;
    float _356 = _354 + 1.0;
    float _358 = 1.0 / _340;
    float _360 = _352 * _356;
    float _362 = -_352;
    float _364 = _362 + 1.0;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _366;
    bool _370 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _372 = 1.0 / _336;
    float _374 = _332 * _364;
    float _376 = -_332;
    float _378 = _376 + 1.0;
    float _380 = _320 * _358;
    float _382 = _304 * _372;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _384;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _388;
    float _392 = fma(_368, _382, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _394 = fma(_386, _382, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _396 = fma(_390, _382, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _398 = in.m_53.x;
    float _400 = in.m_53.y;
    float _402 = in.m_53.z;
    float _404 = _392 * _374;
    float _406 = _394 * _374;
    float _408 = _396 * _374;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _416 = _414 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _420 = _418 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _422 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[143].y, _406);
    float _424 = fma(_412, _380, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _426 = fma(_416, _380, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _428 = fma(_420, _380, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _430 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[143].x, _404);
    float _432 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[143].z, _408);
    float _434 = fma(_426, _360, _422);
    float _436 = fma(_424, _360, _430);
    float _438 = fma(_428, _360, _432);
    float _440 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[145].y, _434);
    float _442 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[145].x, _436);
    float _444 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[145].z, _438);
    float _446 = _442 * _398;
    float _448 = _440 * _400;
    float _450 = _444 * _402;
    bool _452 = !_370;
    float _470;
    if (!_452)
    {
        float _454 = in.m_55.x;
        float _456 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _458 = _454 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _460 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[11].y, _126);
        float _462 = _460 * _456;
        float _464 = floor(_462);
        float _466 = -_464;
        float _468 = _462 + _466;
        _470 = _468;
        _472 = true;
    }
    else
    {
        _470 = _138;
    }
    _472 = false;
    float _474 = _470;
    float _476 = in.m_55.z;
    float _478 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _480 = log2(_478);
    float _482 = _274 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _484 = in.m_55.y;
    float _486 = _274 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _490 = 1.0 + _488;
    float _492 = in.m_55.x;
    bool _494 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _496 = isnan(1.0);
    bool _498 = _494 || _496;
    bool _500 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _502 = _498 || _500;
    float _504 = _274 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _506 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[4].x, _482);
    float _508 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[5].x, _486);
    int _510 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _512 = _510 != 0;
    int _514 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _516 = _514 != 0;
    int _518 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _520 = _518 != 0;
    float _522 = 1.0 / _490;
    float _524 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[6].x, _504);
    float _526 = _480 * _126;
    float _528 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[4].z, _506);
    float _530 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[5].z, _508);
    float _532 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[6].z, _524);
    bool _534 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _536 = isnan(0.0);
    bool _538 = _534 || _536;
    bool _540 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _542 = _538 || _540;
    float _544 = exp2(_526);
    float _546 = _476 * 2.0;
    bool _548 = !_516;
    int _550 = _548 ? 0 : 1;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _554 = _474 + _552;
    float _556 = _448 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _558 = _474 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _560 = isnan(_474);
    bool _562 = _558 || _560;
    bool _564 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _566 = _562 || _564;
    float _568 = float(_566);
    float _570 = floor(_546);
    float _572 = _484 + _476;
    float _574 = _492 * 2.0;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _578 = _576 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _580 = _474 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _582 = isnan(_474);
    bool _584 = _580 || _582;
    bool _586 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _588 = _584 || _586;
    float _590 = float(_588);
    float _592 = _572 + (-1.0);
    float _594 = in.m_57.x;
    float _596 = -_544;
    float _598 = _596 + 1.0;
    float _600 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _602 = _484 * 2.0;
    float _604 = floor(_574);
    float _606 = _492 + _484;
    float _608 = _542 ? _598 : 0.0;
    bool _610 = _570 > 0.0;
    float _612 = _606 + (-1.0);
    bool _614 = _570 >= 0.0;
    bool _616 = isnan(_570);
    bool _618 = _614 || _616;
    bool _620 = isnan(0.0);
    bool _622 = _618 || _620;
    float _624 = floor(_602);
    float _626 = _530 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    if (_502)
    {
        float _628 = _608 * _522;
        _148 = _628;
    }
    float _630 = _148;
    float _632 = _528 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _634 = _532 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _636 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _638 = _626 + _636;
    int _640 = _622 ? 0 : 1;
    float _642 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _644 = _632 + _642;
    float _646 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _648 = _634 + _646;
    float _650 = _638 * _638;
    bool _652 = _604 > 0.0;
    float _654 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _656 = _604 >= 0.0;
    bool _658 = isnan(_604);
    bool _660 = _656 || _658;
    bool _662 = isnan(0.0);
    bool _664 = _660 || _662;
    float _666 = fma(_644, _644, _650);
    bool _668 = !_512;
    int _670 = _668 ? 0 : 1;
    float _672 = 1.0 / _578;
    bool _674 = _624 > 0.0;
    float _676 = fma(_648, _648, _666);
    int _678 = _664 ? 0 : 1;
    bool _680 = _624 >= 0.0;
    bool _682 = isnan(_624);
    bool _684 = _680 || _682;
    bool _686 = isnan(0.0);
    bool _688 = _684 || _686;
    int _690 = ~_678;
    int _692 = _690 + 1;
    int _694 = _692 + 1;
    float _696 = rsqrt(_676);
    int _698 = _688 ? 0 : 1;
    int _700 = _694;
    bool _702 = _674;
    if (!_652)
    {
        int _704 = ~_678;
        int _706 = _704 + 1;
        _700 = _706;
    }
    int _708 = _700;
    int _710 = ~_698;
    int _712 = _710 + 1;
    int _714 = _712 + 1;
    int _716 = abs(_670);
    int _718 = _714;
    if (!_674)
    {
        int _720 = ~_698;
        int _722 = _720 + 1;
        _718 = _722;
    }
    int _724 = _718;
    float _726 = in.m_59.x;
    float _728 = in.m_59.y;
    float _730 = in.m_59.z;
    int _732 = ~_640;
    int _734 = _732 + 1;
    int _736 = _734 + 1;
    int _738 = _736;
    if (!_610)
    {
        int _740 = ~_640;
        int _742 = _740 + 1;
        _738 = _742;
    }
    int _744 = _738;
    float _746 = _638 * _696;
    float _748 = float(_716);
    float _750 = float(_744);
    float _752 = _644 * _696;
    float _754 = -_746;
    float _756 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[18].w, _638);
    float _758 = float(_724);
    float _760 = -_752;
    float _762 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[18].w, _644);
    float _764 = _756 * _756;
    float _766 = _748 * _750;
    int _768 = abs(_550);
    float _770 = _492 + (-0.5);
    float _772 = fma(_762, _762, _764);
    float _774 = _766 * (-2.0);
    bool _776 = !_520;
    int _778 = _776 ? 0 : 1;
    float _780 = _648 * _696;
    float _782 = float(_768);
    float _784 = fma(_654, _774, _654);
    float _786 = fma(_774, _726, _726);
    float _788 = float(_708);
    float _790 = _484 + (-0.5);
    int _792 = abs(_778);
    float _794 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[196].x, _786);
    float _796 = _782 * _788;
    float _798 = fma(_784, _630, _794);
    float _800 = -_780;
    float _802 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[18].w, _648);
    float _804 = _796 * (-2.0);
    float _806 = float(_792);
    float _808 = _798 * 0.15915493667125701904296875;
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _812 = _810 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _814 = fma(_804, _728, _728);
    float _816 = fma(_600, _804, _600);
    float _818 = _806 * _758;
    float _820 = _492 + _476;
    float _822 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[196].y, _814);
    float _824 = _818 * (-2.0);
    float _826 = _820 + (-1.0);
    float _828 = fma(_816, _630, _822);
    float _830 = in.m_55.w;
    float _832 = 1.0 / _812;
    float _834 = fma(_826, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _836 = _828 * 0.15915493667125701904296875;
    float _838 = fma(_824, _730, _730);
    float _840 = _476 + (-0.5);
    float _842 = fma(_834, _824, _834);
    float _844 = fma(_802, _802, _772);
    float _846 = fma(_840, (*spvDescriptorSet0.vp_c9)._m0[196].z, _838);
    float _848 = _808 * 6.283185482025146484375;
    float _850 = sin(_848);
    float _852 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _854 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _852;
    float _856 = fma(_842, _630, _846);
    int _858 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _860 = _858 != 0;
    float _862 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _864 = _862 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    int _866 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _868 = _866 != 0;
    float _870 = _856 * 0.15915493667125701904296875;
    int _872 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _874 = _872 != 0;
    float _876 = _854 * _832;
    int _878 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _880 = _878 != 0;
    float _882 = sqrt(_844);
    float _884 = in.m_61.x;
    float _886 = in.m_61.y;
    float _888 = in.m_61.z;
    bool _890 = _484 > 0.5;
    float _892 = _864 * _672;
    bool _894 = _830 > 0.5;
    float _896 = fma(_876, _554, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _898 = _808 * 6.283185482025146484375;
    float _900 = cos(_898);
    bool _902 = _874;
    if (_860)
    {
        bool _904 = _492 > 0.5;
        _702 = _904;
    }
    bool _906 = _702;
    float _908 = _836 * 6.283185482025146484375;
    float _910 = sin(_908);
    float _912 = _696 * _882;
    float _914 = _836 * 6.283185482025146484375;
    float _916 = cos(_914);
    float _918 = _870 * 6.283185482025146484375;
    float _920 = sin(_918);
    float _922 = _850 * _910;
    float _924 = _900 * _910;
    float _926 = _870 * 6.283185482025146484375;
    float _928 = cos(_926);
    float _930 = _900 * _916;
    float _932 = _850 * _916;
    float _934 = fma(_920, _930, _922);
    float _936 = fma(_920, _922, _930);
    float _938 = _446 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _940 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _886);
    float _942 = -_924;
    float _944 = fma(_920, _932, _942);
    float _946 = in.m_57.y;
    float _948 = _916 * _928;
    float _950 = _556 * _912;
    float _952 = _900 * _928;
    float _954 = _850 * _928;
    float _956 = _910 * _928;
    float _958 = -_932;
    float _960 = fma(_920, _924, _958);
    float _962 = _450 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _964 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _884);
    float _966 = _938 * _912;
    float _968 = _950 * _940;
    float _970 = _962 * _912;
    float _972 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _888);
    float _974 = _966 * _964;
    float _976 = _952 * _968;
    float _978 = -_968;
    float _980 = _920 * _978;
    float _982 = _970 * _972;
    float _984 = _954 * _968;
    float _986 = fma(_934, _974, _976);
    float _988 = fma(_948, _974, _980);
    float _990 = fma(_944, _974, _984);
    float _992 = fma(_960, _982, _986);
    float _994 = fma(_956, _982, _988);
    bool _996 = _474 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _998 = isnan(_474);
    bool _1000 = _996 || _998;
    bool _1002 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1004 = _1000 || _1002;
    float _1006 = float(_1004);
    float _1008 = fma(_936, _982, _990);
    float _1010 = _992 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1012 = _992 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1014 = -_946;
    float _1016 = _1014 + 1.0;
    float _1018 = -_1006;
    float _1020 = _1018 + 1.0;
    float _1022 = fma(_994, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1010);
    float _1024 = fma(_994, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1012);
    float _1026 = -_568;
    float _1028 = _1026 + 1.0;
    float _1030 = in.m_63.x;
    float _1032 = in.m_63.y;
    float _1034 = in.m_63.z;
    float _1036 = fma(_1008, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1022);
    float _1038 = fma(_1008, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1024);
    float _1040 = _1006 * _1028;
    int _1042 = _894 ? as_type<int>(_1016) : as_type<int>(_946);
    float _1044 = _632 + _1036;
    float _1046 = _634 + _1038;
    bool _1048 = _886 != 0.0;
    bool _1050 = isnan(_886);
    bool _1052 = _1048 || _1050;
    bool _1054 = isnan(0.0);
    bool _1056 = _1052 || _1054;
    float _1058 = _590 * _1020;
    float _1060 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1062 = _1044 + _1060;
    float _1064 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1066 = _1046 + _1064;
    bool _1068 = _884 == 0.0;
    bool _1070 = !_1056;
    bool _1072 = _1068 && _1070;
    float _1074 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1076 = _474 + _1074;
    float _1078 = _1062 * _1062;
    float _1080 = _1066 * _1066;
    bool _1082 = _888 == 0.0;
    bool _1084 = _1082 && _1072;
    float _1086 = _992 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1088 = _896 * _1058;
    float _1090 = _1078 + _1080;
    float _1092 = -_590;
    float _1094 = _1092 + 1.0;
    float _1096 = _874 ? as_type<float>(_1042) : _946;
    float _1098 = fma(_994, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1086);
    float _1100 = sqrt(_1090);
    float _1102 = _946;
    int _1104 = as_type<int>(_1016);
    float _1106 = _1006;
    float _1108 = _886;
    float _1110 = _1078;
    float _1112 = _1080;
    float _1114 = _1044;
    float _1116 = _1046;
    if (_868)
    {
        bool _1118 = _476 > 0.5;
        _902 = _1118;
    }
    bool _1120 = _902;
    float _1122 = fma(_892, _1076, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    if (_880)
    {
        float _1124 = _890 ? _1016 : _946;
        _1102 = _1124;
    }
    float _1126 = _1102;
    if (_860)
    {
        float _1128 = -_594;
        float _1130 = _1128 + 1.0;
        _1104 = as_type<int>(_1130);
    }
    int _1132 = _1104;
    float _1134 = fma(_1094, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1088);
    float _1136 = _1030;
    float _1138 = _1032;
    float _1140 = _1034;
    int _1142 = _1132;
    if (!_1084)
    {
        float _1144 = fma(_884, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1030);
        _1136 = _1144;
    }
    float _1146 = _1136;
    float _1148 = _1146;
    if (!_1084)
    {
        float _1150 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1032);
        _1138 = _1150;
    }
    float _1152 = _1138;
    if (!_1084)
    {
        float _1154 = fma(_888, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1034);
        _1140 = _1154;
    }
    float _1156 = _1140;
    float _1158 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1160 = fma(_1008, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1098);
    if (!_860)
    {
        _1106 = _594;
    }
    float _1162 = _1106;
    float _1164 = fma(_1122, _1040, _1134);
    float _1166 = _1162;
    if (_860)
    {
        float _1168 = _906 ? as_type<float>(_1132) : _594;
        _1166 = _1168;
    }
    float _1170 = _1166;
    float _1172 = _1170;
    if (_868)
    {
        float _1174 = -_594;
        float _1176 = _1174 + 1.0;
        _1142 = as_type<int>(_1176);
    }
    int _1178 = _1142;
    float _1180 = -_1152;
    float _1182 = _920 * _1180;
    bool _1184 = _1100 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1186 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1188 = _952 * _1152;
    float _1190 = _954 * _1152;
    float _1192 = _626 + _1160;
    if (!_868)
    {
        _1108 = _594;
    }
    float _1194 = _1108;
    float _1196 = fma(_948, _1146, _1182);
    float _1198 = fma(_934, _1146, _1188);
    float _1200 = fma(_944, _1146, _1190);
    float _1202 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1204 = _1194;
    if (_868)
    {
        float _1206 = _1120 ? as_type<float>(_1178) : _594;
        _1204 = _1206;
    }
    float _1208 = _1204;
    float _1210 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1164);
    if (!_1184)
    {
        _1148 = _1192;
    }
    float _1212 = _1148;
    bool _1214 = !_1184;
    float _1216 = _1212;
    if (!_1214)
    {
        float _1218 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1220 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1222 = _1100 + _1220;
        float _1224 = _1192 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1226 = rsqrt(_1090);
        float _1228 = _1222 * _1218;
        float _1230 = _1228 * 0.15915493667125701904296875;
        float _1232 = _1230 * 6.283185482025146484375;
        float _1234 = sin(_1232);
        float _1236 = _1230 * 6.283185482025146484375;
        float _1238 = cos(_1236);
        float _1240 = fma(_1234, _1224, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1242 = _1226 * _1240;
        float _1244 = fma(_1062, _1242, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1246 = _1238 + (-1.0);
        float _1248 = fma(_1066, _1242, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1250 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1252 = _1244 + _1250;
        float _1254 = _1246 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1256 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1258 = _1248 + _1256;
        float _1260 = _1252 * _1252;
        float _1262 = fma(_1192, _1238, _1254);
        float _1264 = _1258 * _1258;
        _1216 = _1262;
        _1110 = _1260;
        _1112 = _1264;
        _1114 = _1244;
        _1116 = _1248;
    }
    float _1266 = _1216;
    float _1268 = _1110;
    float _1270 = _1112;
    float _1272 = _1114;
    float _1274 = _1116;
    float _1276 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1278 = _1266 + _1276;
    float _1280 = fma(_956, _1156, _1196);
    float _1282 = fma(_960, _1156, _1198);
    float _1284 = fma(_936, _1156, _1200);
    float _1286 = fma(_1278, _1278, _1268);
    float _1288 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1290 = _1096 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1292 = _1282 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1294 = _1286 + _1270;
    float _1296 = _1282 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1298 = _1282 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1300 = _1290 * _1202;
    float _1302 = fma(_1280, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1292);
    float _1304 = _1208 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1306 = sqrt(_1294);
    float _1308 = fma(_1280, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1296);
    float _1310 = fma(_1280, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1298);
    float _1312 = _1126 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1314 = _1170 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1316 = _1210 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1318 = _1304 * _1288;
    float _1320 = _1312 * _1186;
    float _1322 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1324 = _1314 * _1158;
    float _1326 = fma(_1284, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1308);
    float _1328 = fma(_1284, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1310);
    float _1330 = fma(_1284, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1302);
    out.m_65.w = _1322;
    bool _1332 = _1306 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1334 = isnan(_1306);
    bool _1336 = _1332 || _1334;
    bool _1338 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1340 = _1336 || _1338;
    out.m_67.x = _1324;
    out.m_67.y = _1320;
    out.m_67.z = _1318;
    out.m_67.w = _1300;
    out.m_69.w = _1316;
    out.m_71.x = _966;
    out.m_73.x = _1326;
    out.m_73.y = _1328;
    out.m_73.z = _1330;
    float _1342 = _1308;
    if (!_1340)
    {
        _1342 = 1.0;
    }
    float _1344 = _1342;
    bool _1346 = !_1340;
    float _1348 = _1344;
    if (!_1346)
    {
        bool _1350 = _1306 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1352 = isnan(_1306);
        bool _1354 = _1350 || _1352;
        bool _1356 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1358 = _1354 || _1356;
        if (!_1358)
        {
            float _1360 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1362 = _1306 + _1360;
            float _1364 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1366 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1364;
            float _1368 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1370 = _1368 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1372 = 1.0 / _1366;
            float _1374 = _1362 * _1372;
            float _1376 = fma(_1374, _1370, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1348 = _1376;
            _1378 = true;
        }
        else
        {
            bool _1380 = _1306 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1382 = isnan(_1306);
            bool _1384 = _1380 || _1382;
            bool _1386 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1388 = _1384 || _1386;
            if (!_1388)
            {
                float _1390 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1392 = _1306 + _1390;
                float _1394 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1396 = _1394 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1398 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1400 = _1398 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1402 = 1.0 / _1396;
                float _1404 = _1392 * _1402;
                float _1406 = fma(_1404, _1400, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1348 = _1406;
                _1378 = true;
            }
            else
            {
                _1348 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1378 = false;
    float _1408 = _1348;
    float _1410 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1412 = _1272 + _1410;
    float _1414 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1416 = _1266 + _1414;
    float _1418 = -_752;
    float _1420 = fma(_1418, (*spvDescriptorSet0.vp_c9)._m0[18].w, _632);
    bool _1422 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1424 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1426 = _1422 || _1424;
    bool _1428 = isnan(0.5);
    bool _1430 = _1426 || _1428;
    float _1432 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1434 = _1274 + _1432;
    float _1436 = fma(_1412, _1408, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1438 = fma(_1416, _1408, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1440 = -_780;
    float _1442 = fma(_1440, (*spvDescriptorSet0.vp_c9)._m0[18].w, _634);
    float _1444 = fma(_1434, _1408, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1446 = -_752;
    float _1448 = fma(_1446, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1436);
    float _1450 = -_746;
    float _1452 = fma(_1450, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1438);
    float _1454 = -_746;
    float _1456 = fma(_1454, (*spvDescriptorSet0.vp_c9)._m0[18].w, _626);
    float _1458 = -_780;
    float _1460 = fma(_1458, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1444);
    float _1462 = _1452;
    float _1464 = _1448;
    float _1466 = _1460;
    float _1468 = _1416;
    float _1470 = _1408;
    float _1472 = _1444;
    float _1474 = _1438;
    if (!_1430)
    {
        float _1476 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1478 = _1456 + _1476;
        float _1480 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1482 = _1420 + _1480;
        float _1484 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1486 = -_634;
        float _1488 = _1486 + _1444;
        float _1490 = _1478 * _1478;
        float _1492 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1494 = _1442 + _1492;
        float _1496 = -_632;
        float _1498 = _1496 + _1436;
        float _1500 = fma(_1482, _1482, _1490);
        float _1502 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1504 = fma(_1494, _1494, _1500);
        float _1506 = sqrt(_1504);
        float _1508 = 1.0 / _912;
        float _1510 = _1502 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1512 = precise::min(_1506, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1514 = _1512 * _1484;
        float _1516 = _1514 * _1508;
        float _1518 = -_626;
        float _1520 = _1518 + _1438;
        float _1522 = _1510 * _1516;
        float _1524 = _1488 * _1516;
        float _1526 = fma(_1498, _1522, _1420);
        float _1528 = fma(_1520, _1522, _1456);
        float _1530 = fma(_1510, _1524, _1442);
        _1462 = _1528;
        _1464 = _1526;
        _1466 = _1530;
        _1468 = _1516;
        _1470 = _1522;
    }
    float _1532 = _1462;
    float _1534 = _1464;
    float _1536 = _1466;
    float _1538 = _1468;
    float _1540 = _1470;
    float _1542 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1544 = _1532 + _1542;
    float _1546 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1548 = _1534 + _1546;
    float _1550 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1552 = _1536 + _1550;
    float _1554 = _1544 * _1544;
    float _1556 = fma(_1548, _1548, _1554);
    float _1558 = fma(_1552, _1552, _1556);
    float _1560 = rsqrt(_1558);
    float _1562 = _1560 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1564 = _1548 * _1562;
    float _1566 = _1552 * _1562;
    float _1568 = _1564 * _1564;
    float _1570 = _1566 * _1566;
    float _1572 = _1568 + _1570;
    float _1574 = sqrt(_1572);
    bool _1576 = _1574 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1578 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1580 = _1574 + _1578;
    float _1582 = _1538;
    float _1584 = _1572;
    float _1586 = _1580;
    if (_1576)
    {
        float _1588 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1582 = _1588;
    }
    float _1590 = _1582;
    if (_1576)
    {
        float _1592 = rsqrt(_1572);
        _1584 = _1592;
    }
    float _1594 = _1584;
    float _1596 = _1594;
    if (_1576)
    {
        float _1598 = _1580 * _1590;
        _1586 = _1598;
    }
    float _1600 = _1586;
    if (_1576)
    {
        float _1602 = _1600 * 0.15915493667125701904296875;
        _1472 = _1602;
    }
    float _1604 = _1472;
    float _1606 = _1540;
    if (_1576)
    {
        float _1608 = _1604 * 6.283185482025146484375;
        float _1610 = sin(_1608);
        _1606 = _1610;
    }
    float _1612 = _1606;
    float _1614 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1616 = precise::max(0.0, _1614);
    float _1618 = _912;
    float _1620 = _1616;
    float _1622 = _1614;
    if (_1576)
    {
        float _1624 = _1604 * 6.283185482025146484375;
        float _1626 = cos(_1624);
        _1618 = _1626;
    }
    float _1628 = _1618;
    float _1630 = -_1562;
    float _1632 = -_1616;
    float _1634 = fma(_1544, _1630, _1632);
    if (_1576)
    {
        float _1636 = _1634 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1620 = _1636;
    }
    float _1638 = _1620;
    float _1640 = sqrt(_1558);
    float _1642 = _1638;
    float _1644 = _1612;
    if (_1576)
    {
        float _1646 = fma(_1612, _1638, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1642 = _1646;
    }
    float _1648 = _1642;
    float _1650 = _1648;
    if (!_1576)
    {
        _1644 = _1564;
    }
    float _1652 = _1644;
    float _1654 = _1652;
    float _1656 = _1628;
    if (_1576)
    {
        float _1658 = _1628 + (-1.0);
        _1622 = _1658;
    }
    float _1660 = _1622;
    float _1662 = _1660;
    if (_1576)
    {
        float _1664 = _1594 * _1648;
        _1172 = _1664;
    }
    float _1666 = _1172;
    if (!_1576)
    {
        _1650 = _1634;
    }
    float _1668 = _1650;
    float _1670 = _1668;
    if (_1576)
    {
        float _1672 = _1660 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1474 = _1672;
    }
    float _1674 = _1474;
    if (_1576)
    {
        float _1676 = _1564 * _1666;
        _1654 = _1676;
    }
    float _1678 = _1654;
    if (!_1576)
    {
        _1662 = _1566;
    }
    float _1680 = _1662;
    float _1682 = _1680;
    if (_1576)
    {
        float _1684 = _1566 * _1666;
        _1682 = _1684;
    }
    float _1686 = _1682;
    if (!_1576)
    {
        _1596 = _1568;
    }
    float _1688 = _1596;
    float _1690 = _1688;
    if (_1576)
    {
        float _1692 = fma(_1634, _1628, _1674);
        _1670 = _1692;
    }
    float _1694 = _1670;
    if (_1576)
    {
        float _1696 = _1678 * _1678;
        _1690 = _1696;
    }
    float _1698 = _1690;
    if (!_1576)
    {
        _1656 = _1570;
    }
    float _1700 = _1656;
    float _1702 = _1700;
    if (_1576)
    {
        float _1704 = _1686 * _1686;
        _1702 = _1704;
    }
    float _1706 = _1702;
    float _1708 = fma(_1694, _1694, _1698);
    float _1710 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1712 = _1708 + _1706;
    float _1714 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1716 = fma(_1640, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1714);
    float _1718 = precise::clamp(_1716, 0.0, 1.0);
    float _1720 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1710);
    float _1722 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1724 = rsqrt(_1712);
    float _1726 = -_1718;
    float _1728 = _1726 + 1.0;
    float _1730 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1720);
    float _1732 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1734 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1736 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1722);
    float _1738 = _1730 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1740 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1732);
    float _1742 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1734);
    float _1744 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1736);
    float _1746 = abs(_1728);
    float _1748 = log2(_1746);
    float _1750 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1740);
    float _1752 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1742);
    float _1754 = _1744 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1756 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1758 = _1750 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1760 = _1724 * _1678;
    float _1762 = _1752 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1764 = _1724 * _1694;
    float _1766 = _1754 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1768 = _1760 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1770 = _1738 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1772 = _1724 * _1686;
    float _1774 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1766);
    float _1776 = -_1768;
    float _1778 = fma(_1764, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1776);
    float _1780 = -_1770;
    float _1782 = fma(_1780, _1756, 1.0);
    float _1784 = _1748 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1786 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1774);
    float _1788 = -_1772;
    float _1790 = fma(_1788, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1778);
    float _1792 = log2(_1782);
    float _1794 = _1754 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1796 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1786);
    float _1798 = fma(_1790, -0.5, 0.5);
    float _1800 = _1754 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1802 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1794);
    float _1804 = fma(_1790, 0.5, 0.5);
    float _1806 = _1764 + 1.0;
    float _1808 = exp2(_1784);
    float _1810 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1800);
    float _1812 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1802);
    float _1814 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1810);
    float _1816 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1812);
    float _1818 = 1.0 / _1796;
    float _1820 = fma(_1804, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1822 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1814);
    float _1824 = fma(_1804, _1820, -0.212114393711090087890625);
    float _1826 = sqrt(_1798);
    float _1828 = -_1764;
    float _1830 = fma(_1808, _1806, _1828);
    float _1832 = _1792 * 0.693147182464599609375;
    float _1834 = fma(_1804, _1824, 1.570728778839111328125);
    float _1836 = _1832 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1838 = _1816 * _1818;
    float _1840 = _1822 * _1818;
    float _1842 = fma(_1838, -0.5, 0.5);
    float _1844 = fma(_1840, 0.5, 0.5);
    float _1846 = fma(_1830, 0.5, 0.5);
    float _1848 = _1826 * 0.636619746685028076171875;
    float _1850 = -_1834;
    float _1852 = fma(_1848, _1850, 1.0);
    float3 _4926 = float3(_1844, _1842, _1836);
    float _1854 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4926, float3(0.0), isnan(_4926)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4926, float3(0.0), isnan(_4926)), level(0.0)).x;
    float3 _4937 = float3(_1844, _1842, _1836);
    float4 _1857 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4937, float3(0.0), isnan(_4937)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4937, float3(0.0), isnan(_4937)), level(0.0)).xyzw;
    float _1859 = _1857.x;
    float _1861 = _1857.y;
    float _1863 = _1857.z;
    float _1865 = _1857.w;
    float2 _4954 = float2(_1852, _1846);
    float3 _1869 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4954, float2(0.0), isnan(_4954)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4954, float2(0.0), isnan(_4954)), level(0.0)).xyz;
    float _1871 = _1869.x;
    float _1873 = _1869.y;
    float _1875 = _1869.z;
    float _1877 = _1456 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    out.m_75.x = _1534;
    out.m_75.y = _1532;
    out.m_75.z = _1536;
    float _1879 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1877);
    float _1881 = _1456 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1883 = _1748 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1885 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1879);
    float _1887 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1881);
    float _1889 = _1885 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1891 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1887);
    float _1893 = exp2(_1883);
    float _1895 = _1891 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1897 = _1895 + _1889;
    float _1899 = 1.0 / _1889;
    float _1901 = _1897 * _1899;
    float _1903 = _1901 * 0.5;
    float _1905 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1907 = fma(_1903, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1905);
    float _1909 = _1754 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1911 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1913 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1915 = _1911 || _1913;
    bool _1917 = isnan(0.5);
    bool _1919 = _1915 || _1917;
    float _1921 = 1.0 / _1907;
    float _1923 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1909);
    float _1925 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1923);
    float _1927 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1925);
    float _1929 = _1762;
    float _1931 = _1923;
    if (_1919)
    {
        _1929 = 1.0;
    }
    float _1933 = _1929;
    float _1935 = _1933;
    if (_1919)
    {
        _1931 = 1.0;
    }
    float _1937 = _1931;
    float _1939 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1941 = _1921 * _1939;
    float _1943 = _1937;
    if (!_1919)
    {
        float _1945 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1947 = _1945 * 0.15915493667125701904296875;
        float _1949 = _1947 * 6.283185482025146484375;
        float _1951 = cos(_1949);
        float _1953 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1955 = _1953 * 0.15915493667125701904296875;
        float _1957 = _1947 * 6.283185482025146484375;
        float _1959 = sin(_1957);
        float _1961 = 1.0 / _1951;
        float _1963 = _1955 * 6.283185482025146484375;
        float _1965 = cos(_1963);
        float _1967 = _1959 * _1961;
        float _1969 = _1955 * 6.283185482025146484375;
        float _1971 = sin(_1969);
        float _1973 = _1965 * _1967;
        float _1975 = 1.0 / _1973;
        float _1977 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1979 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1977;
        float _1981 = 1.0 / _1979;
        float _1983 = _1971 * _1975;
        float _1985 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1987 = fma(_1941, _1983, _1985);
        float _1989 = _1987 * _1981;
        float _1991 = precise::clamp(_1989, 0.0, 1.0);
        _1935 = _1991;
    }
    float _1993 = _1935;
    if (!_1919)
    {
        float _1995 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1997 = _1995 * 0.15915493667125701904296875;
        float _1999 = _1997 * 6.283185482025146484375;
        float _2001 = cos(_1999);
        float _2003 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2005 = _2003 * 0.15915493667125701904296875;
        float _2007 = _1997 * 6.283185482025146484375;
        float _2009 = sin(_2007);
        float _2011 = 1.0 / _2001;
        float _2013 = _2005 * 6.283185482025146484375;
        float _2015 = cos(_2013);
        float _2017 = _2009 * _2011;
        float _2019 = _2005 * 6.283185482025146484375;
        float _2021 = sin(_2019);
        float _2023 = _2015 * _2017;
        float _2025 = 1.0 / _2023;
        float _2027 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2029 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2027;
        float _2031 = 1.0 / _2029;
        float _2033 = _2021 * _2025;
        float _2035 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2037 = fma(_1941, _2033, _2035);
        float _2039 = _2037 * _2031;
        float _2041 = precise::clamp(_2039, 0.0, 1.0);
        float _2043 = -_2041;
        float _2045 = _2043 + 1.0;
        _1943 = _2045;
    }
    float _2047 = _1943;
    float _2049 = -_1893;
    float _2051 = _2049 + 1.0;
    float _2053 = _1993 * _2047;
    float _2055 = _1796 * 0.5;
    bool _2057 = _1993 > 0.0;
    bool _2059 = isnan(_1993);
    bool _2061 = _2057 || _2059;
    bool _2063 = isnan(0.0);
    bool _2065 = _2061 || _2063;
    float _2067 = _2051 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2069 = _2053 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2071 = fma(_1816, -0.5, _2055);
    bool _2073 = _2047 <= 0.0;
    bool _2075 = !_2065;
    bool _2077 = _2073 || _2075;
    float _2079 = _2067 * _1854;
    float _2081 = _2069 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2083 = _1927 + _1796;
    float _2085 = _1822 + _1796;
    float _2087 = _1865 * _2079;
    float _2089 = _1875 * _2079;
    float _2091 = -_2067;
    float _2093 = _2091 + 1.0;
    out.gl_Position.x = _1822;
    out.gl_Position.y = _1816;
    out.gl_Position.z = _1927;
    out.gl_Position.w = _1796;
    float _2095 = fma(_1871, _2087, _1859);
    float _2097 = _2083 * 0.5;
    out.m_47.x = _2081;
    float _2099 = _2085 * 0.5;
    float _2101 = fma(_1873, _2087, _1861);
    float _2103 = _1865 * _2093;
    out.m_77.x = _1548;
    out.m_77.y = _1544;
    out.m_77.z = _1552;
    float _2105 = fma(_1865, _2089, _1863);
    out.m_79.x = _2099;
    out.m_79.y = _2071;
    out.m_79.z = _2097;
    out.m_79.w = _1796;
    out.m_81.x = _2095;
    out.m_81.y = _2101;
    out.m_81.z = _2105;
    out.m_81.w = _2103;
    if (!_2077)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2107 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2107;
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
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1378 = false;
    bool _472 = false;
    bool _298 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _95 = in.m_44.w;
    float _97 = trunc(_95);
    int _100 = int(_97);
    bool _104 = _100 >= 1;
    float _106 = 0.0;
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _108 = _106;
    if (!_104)
    {
        out.m_47.x = 0.0;
    }
    int _110 = 0;
    if (!_104)
    {
        float _112 = _108 * 5.0;
        _110 = as_type<int>(_112);
    }
    int _114 = _110;
    int _116 = _114;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2163 = as_type<float>(_114);
        out.gl_Position.z = _2163;
    }
    if (!_104)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _118 = in.m_49.w;
    float _120 = float(_100);
    float _122 = 1.0 / _120;
    float _124 = -_118;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _128 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_118);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = _126 * _122;
    bool _140 = _126 >= _120;
    bool _142 = !_136;
    bool _144 = _140 || _142;
    out.m_51.x = _138;
    float _146 = _118;
    float _148 = _126;
    if (_144)
    {
        _146 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _150 = _146;
    if (_144)
    {
        out.m_47.x = 0.0;
    }
    if (_144)
    {
        float _152 = _150 * 5.0;
        _116 = as_type<int>(_152);
    }
    int _154 = _116;
    if (_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2235 = as_type<float>(_154);
        out.gl_Position.z = _2235;
    }
    if (_144)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _156 = in.m_53.w;
    float _158 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _160 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _162 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _164 = _160 || _162;
    bool _166 = isnan(1.0);
    bool _168 = _164 || _166;
    float _170 = in.m_49.x;
    float _172 = in.m_49.y;
    float _174 = in.m_49.z;
    float _176 = in.m_44.x;
    float _178 = in.m_44.y;
    float _180 = in.m_44.z;
    float _182 = 0.0;
    float _184 = _158;
    if (!_168)
    {
        float _186 = _158 * _158;
        float _188 = _186 * 0.5;
        _182 = _188;
    }
    float _190 = _182;
    float _192 = _190;
    if (!_168)
    {
        float _194 = _190 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _192 = _194;
    }
    float _196 = _192;
    bool _198 = !_168;
    float _200 = _196;
    if (!_198)
    {
        float _202 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = log2(_202);
        float _206 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _208 = _206 + 1.0;
        float _210 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _212 = _158 * _204;
        float _214 = 1.0 / _208;
        float _216 = _210 * 0.693147182464599609375;
        float _218 = exp2(_212);
        float _220 = 1.0 / _216;
        float _222 = _218 + (-1.0);
        float _224 = -_222;
        float _226 = fma(_224, _220, _158);
        float _228 = _226 * _214;
        float _230 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _200 = _230;
    }
    float _232 = _200;
    bool _234 = !_168;
    if (!_234)
    {
        float _236 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _238 = log2(_236);
        float _240 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _242 = _240 + 1.0;
        float _244 = 1.0 / _242;
        float _246 = _158 * _238;
        float _248 = exp2(_246);
        float _250 = -_248;
        float _252 = _250 + 1.0;
        float _254 = _252 * _244;
        _184 = _254;
    }
    float _256 = _184;
    bool _258 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _260 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _262 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _264 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _266 = fma(_256, _170, _260);
    float _268 = fma(_256, _172, _262);
    float _270 = fma(_256, _174, _264);
    float _272 = fma(_266, _156, _176);
    float _274 = fma(_268, _156, _178);
    float _276 = fma(_270, _156, _180);
    bool _278 = !_258;
    float _296;
    if (!_278)
    {
        float _280 = in.m_55.x;
        float _282 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _284 = _280 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _286 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[12].x, _126);
        float _288 = _286 * _282;
        float _290 = floor(_288);
        float _292 = -_290;
        float _294 = _288 + _292;
        _296 = _294;
        _298 = true;
    }
    else
    {
        _296 = _138;
    }
    _298 = false;
    float _300 = _296;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _304 = _300 + _302;
    bool _306 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _308 = isnan(_300);
    bool _310 = _306 || _308;
    bool _312 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _314 = _310 || _312;
    float _316 = float(_314);
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _320 = _300 + _318;
    bool _322 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _324 = isnan(_300);
    bool _326 = _322 || _324;
    bool _328 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _330 = _326 || _328;
    float _332 = float(_330);
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _334;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _340 = _338 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _342 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _344 = isnan(_300);
    bool _346 = _342 || _344;
    bool _348 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _350 = _346 || _348;
    float _352 = float(_350);
    float _354 = -_316;
    float _356 = _354 + 1.0;
    float _358 = 1.0 / _340;
    float _360 = _352 * _356;
    float _362 = -_352;
    float _364 = _362 + 1.0;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _366;
    bool _370 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _372 = 1.0 / _336;
    float _374 = _332 * _364;
    float _376 = -_332;
    float _378 = _376 + 1.0;
    float _380 = _320 * _358;
    float _382 = _304 * _372;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _384;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _388;
    float _392 = fma(_368, _382, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _394 = fma(_386, _382, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _396 = fma(_390, _382, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _398 = in.m_53.x;
    float _400 = in.m_53.y;
    float _402 = in.m_53.z;
    float _404 = _392 * _374;
    float _406 = _394 * _374;
    float _408 = _396 * _374;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _416 = _414 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _420 = _418 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _422 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[143].y, _406);
    float _424 = fma(_412, _380, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _426 = fma(_416, _380, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _428 = fma(_420, _380, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _430 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[143].x, _404);
    float _432 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[143].z, _408);
    float _434 = fma(_426, _360, _422);
    float _436 = fma(_424, _360, _430);
    float _438 = fma(_428, _360, _432);
    float _440 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[145].y, _434);
    float _442 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[145].x, _436);
    float _444 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[145].z, _438);
    float _446 = _442 * _398;
    float _448 = _440 * _400;
    float _450 = _444 * _402;
    bool _452 = !_370;
    float _470;
    if (!_452)
    {
        float _454 = in.m_55.x;
        float _456 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _458 = _454 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _460 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[11].y, _126);
        float _462 = _460 * _456;
        float _464 = floor(_462);
        float _466 = -_464;
        float _468 = _462 + _466;
        _470 = _468;
        _472 = true;
    }
    else
    {
        _470 = _138;
    }
    _472 = false;
    float _474 = _470;
    float _476 = in.m_55.z;
    float _478 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _480 = log2(_478);
    float _482 = _274 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _484 = in.m_55.y;
    float _486 = _274 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _490 = 1.0 + _488;
    float _492 = in.m_55.x;
    bool _494 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _496 = isnan(1.0);
    bool _498 = _494 || _496;
    bool _500 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _502 = _498 || _500;
    float _504 = _274 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _506 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[4].x, _482);
    float _508 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[5].x, _486);
    int _510 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _512 = _510 != 0;
    int _514 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _516 = _514 != 0;
    int _518 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _520 = _518 != 0;
    float _522 = 1.0 / _490;
    float _524 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[6].x, _504);
    float _526 = _480 * _126;
    float _528 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[4].z, _506);
    float _530 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[5].z, _508);
    float _532 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[6].z, _524);
    bool _534 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _536 = isnan(0.0);
    bool _538 = _534 || _536;
    bool _540 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _542 = _538 || _540;
    float _544 = exp2(_526);
    float _546 = _476 * 2.0;
    bool _548 = !_516;
    int _550 = _548 ? 0 : 1;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _554 = _474 + _552;
    float _556 = _448 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _558 = _474 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _560 = isnan(_474);
    bool _562 = _558 || _560;
    bool _564 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _566 = _562 || _564;
    float _568 = float(_566);
    float _570 = floor(_546);
    float _572 = _484 + _476;
    float _574 = _492 * 2.0;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _578 = _576 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _580 = _474 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _582 = isnan(_474);
    bool _584 = _580 || _582;
    bool _586 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _588 = _584 || _586;
    float _590 = float(_588);
    float _592 = _572 + (-1.0);
    float _594 = in.m_57.x;
    float _596 = -_544;
    float _598 = _596 + 1.0;
    float _600 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _602 = _484 * 2.0;
    float _604 = floor(_574);
    float _606 = _492 + _484;
    float _608 = _542 ? _598 : 0.0;
    bool _610 = _570 > 0.0;
    float _612 = _606 + (-1.0);
    bool _614 = _570 >= 0.0;
    bool _616 = isnan(_570);
    bool _618 = _614 || _616;
    bool _620 = isnan(0.0);
    bool _622 = _618 || _620;
    float _624 = floor(_602);
    float _626 = _530 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    if (_502)
    {
        float _628 = _608 * _522;
        _148 = _628;
    }
    float _630 = _148;
    float _632 = _528 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _634 = _532 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _636 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _638 = _626 + _636;
    int _640 = _622 ? 0 : 1;
    float _642 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _644 = _632 + _642;
    float _646 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _648 = _634 + _646;
    float _650 = _638 * _638;
    bool _652 = _604 > 0.0;
    float _654 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _656 = _604 >= 0.0;
    bool _658 = isnan(_604);
    bool _660 = _656 || _658;
    bool _662 = isnan(0.0);
    bool _664 = _660 || _662;
    float _666 = fma(_644, _644, _650);
    bool _668 = !_512;
    int _670 = _668 ? 0 : 1;
    float _672 = 1.0 / _578;
    bool _674 = _624 > 0.0;
    float _676 = fma(_648, _648, _666);
    int _678 = _664 ? 0 : 1;
    bool _680 = _624 >= 0.0;
    bool _682 = isnan(_624);
    bool _684 = _680 || _682;
    bool _686 = isnan(0.0);
    bool _688 = _684 || _686;
    int _690 = ~_678;
    int _692 = _690 + 1;
    int _694 = _692 + 1;
    float _696 = rsqrt(_676);
    int _698 = _688 ? 0 : 1;
    int _700 = _694;
    bool _702 = _674;
    if (!_652)
    {
        int _704 = ~_678;
        int _706 = _704 + 1;
        _700 = _706;
    }
    int _708 = _700;
    int _710 = ~_698;
    int _712 = _710 + 1;
    int _714 = _712 + 1;
    int _716 = abs(_670);
    int _718 = _714;
    if (!_674)
    {
        int _720 = ~_698;
        int _722 = _720 + 1;
        _718 = _722;
    }
    int _724 = _718;
    float _726 = in.m_59.x;
    float _728 = in.m_59.y;
    float _730 = in.m_59.z;
    int _732 = ~_640;
    int _734 = _732 + 1;
    int _736 = _734 + 1;
    int _738 = _736;
    if (!_610)
    {
        int _740 = ~_640;
        int _742 = _740 + 1;
        _738 = _742;
    }
    int _744 = _738;
    float _746 = _638 * _696;
    float _748 = float(_716);
    float _750 = float(_744);
    float _752 = _644 * _696;
    float _754 = -_746;
    float _756 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[18].w, _638);
    float _758 = float(_724);
    float _760 = -_752;
    float _762 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[18].w, _644);
    float _764 = _756 * _756;
    float _766 = _748 * _750;
    int _768 = abs(_550);
    float _770 = _492 + (-0.5);
    float _772 = fma(_762, _762, _764);
    float _774 = _766 * (-2.0);
    bool _776 = !_520;
    int _778 = _776 ? 0 : 1;
    float _780 = _648 * _696;
    float _782 = float(_768);
    float _784 = fma(_654, _774, _654);
    float _786 = fma(_774, _726, _726);
    float _788 = float(_708);
    float _790 = _484 + (-0.5);
    int _792 = abs(_778);
    float _794 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[196].x, _786);
    float _796 = _782 * _788;
    float _798 = fma(_784, _630, _794);
    float _800 = -_780;
    float _802 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[18].w, _648);
    float _804 = _796 * (-2.0);
    float _806 = float(_792);
    float _808 = _798 * 0.15915493667125701904296875;
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _812 = _810 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _814 = fma(_804, _728, _728);
    float _816 = fma(_600, _804, _600);
    float _818 = _806 * _758;
    float _820 = _492 + _476;
    float _822 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[196].y, _814);
    float _824 = _818 * (-2.0);
    float _826 = _820 + (-1.0);
    float _828 = fma(_816, _630, _822);
    float _830 = in.m_55.w;
    float _832 = 1.0 / _812;
    float _834 = fma(_826, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _836 = _828 * 0.15915493667125701904296875;
    float _838 = fma(_824, _730, _730);
    float _840 = _476 + (-0.5);
    float _842 = fma(_834, _824, _834);
    float _844 = fma(_802, _802, _772);
    float _846 = fma(_840, (*spvDescriptorSet0.vp_c9)._m0[196].z, _838);
    float _848 = _808 * 6.283185482025146484375;
    float _850 = sin(_848);
    float _852 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _854 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _852;
    float _856 = fma(_842, _630, _846);
    int _858 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _860 = _858 != 0;
    float _862 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _864 = _862 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    int _866 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _868 = _866 != 0;
    float _870 = _856 * 0.15915493667125701904296875;
    int _872 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _874 = _872 != 0;
    float _876 = _854 * _832;
    int _878 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _880 = _878 != 0;
    float _882 = sqrt(_844);
    float _884 = in.m_61.x;
    float _886 = in.m_61.y;
    float _888 = in.m_61.z;
    bool _890 = _484 > 0.5;
    float _892 = _864 * _672;
    bool _894 = _830 > 0.5;
    float _896 = fma(_876, _554, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _898 = _808 * 6.283185482025146484375;
    float _900 = cos(_898);
    bool _902 = _874;
    if (_860)
    {
        bool _904 = _492 > 0.5;
        _702 = _904;
    }
    bool _906 = _702;
    float _908 = _836 * 6.283185482025146484375;
    float _910 = sin(_908);
    float _912 = _696 * _882;
    float _914 = _836 * 6.283185482025146484375;
    float _916 = cos(_914);
    float _918 = _870 * 6.283185482025146484375;
    float _920 = sin(_918);
    float _922 = _850 * _910;
    float _924 = _900 * _910;
    float _926 = _870 * 6.283185482025146484375;
    float _928 = cos(_926);
    float _930 = _900 * _916;
    float _932 = _850 * _916;
    float _934 = fma(_920, _930, _922);
    float _936 = fma(_920, _922, _930);
    float _938 = _446 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _940 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _886);
    float _942 = -_924;
    float _944 = fma(_920, _932, _942);
    float _946 = in.m_57.y;
    float _948 = _916 * _928;
    float _950 = _556 * _912;
    float _952 = _900 * _928;
    float _954 = _850 * _928;
    float _956 = _910 * _928;
    float _958 = -_932;
    float _960 = fma(_920, _924, _958);
    float _962 = _450 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _964 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _884);
    float _966 = _938 * _912;
    float _968 = _950 * _940;
    float _970 = _962 * _912;
    float _972 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _888);
    float _974 = _966 * _964;
    float _976 = _952 * _968;
    float _978 = -_968;
    float _980 = _920 * _978;
    float _982 = _970 * _972;
    float _984 = _954 * _968;
    float _986 = fma(_934, _974, _976);
    float _988 = fma(_948, _974, _980);
    float _990 = fma(_944, _974, _984);
    float _992 = fma(_960, _982, _986);
    float _994 = fma(_956, _982, _988);
    bool _996 = _474 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _998 = isnan(_474);
    bool _1000 = _996 || _998;
    bool _1002 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1004 = _1000 || _1002;
    float _1006 = float(_1004);
    float _1008 = fma(_936, _982, _990);
    float _1010 = _992 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1012 = _992 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1014 = -_946;
    float _1016 = _1014 + 1.0;
    float _1018 = -_1006;
    float _1020 = _1018 + 1.0;
    float _1022 = fma(_994, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1010);
    float _1024 = fma(_994, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1012);
    float _1026 = -_568;
    float _1028 = _1026 + 1.0;
    float _1030 = in.m_63.x;
    float _1032 = in.m_63.y;
    float _1034 = in.m_63.z;
    float _1036 = fma(_1008, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1022);
    float _1038 = fma(_1008, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1024);
    float _1040 = _1006 * _1028;
    int _1042 = _894 ? as_type<int>(_1016) : as_type<int>(_946);
    float _1044 = _632 + _1036;
    float _1046 = _634 + _1038;
    bool _1048 = _886 != 0.0;
    bool _1050 = isnan(_886);
    bool _1052 = _1048 || _1050;
    bool _1054 = isnan(0.0);
    bool _1056 = _1052 || _1054;
    float _1058 = _590 * _1020;
    float _1060 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1062 = _1044 + _1060;
    float _1064 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1066 = _1046 + _1064;
    bool _1068 = _884 == 0.0;
    bool _1070 = !_1056;
    bool _1072 = _1068 && _1070;
    float _1074 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1076 = _474 + _1074;
    float _1078 = _1062 * _1062;
    float _1080 = _1066 * _1066;
    bool _1082 = _888 == 0.0;
    bool _1084 = _1082 && _1072;
    float _1086 = _992 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1088 = _896 * _1058;
    float _1090 = _1078 + _1080;
    float _1092 = -_590;
    float _1094 = _1092 + 1.0;
    float _1096 = _874 ? as_type<float>(_1042) : _946;
    float _1098 = fma(_994, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1086);
    float _1100 = sqrt(_1090);
    float _1102 = _946;
    int _1104 = as_type<int>(_1016);
    float _1106 = _1006;
    float _1108 = _886;
    float _1110 = _1078;
    float _1112 = _1080;
    float _1114 = _1044;
    float _1116 = _1046;
    if (_868)
    {
        bool _1118 = _476 > 0.5;
        _902 = _1118;
    }
    bool _1120 = _902;
    float _1122 = fma(_892, _1076, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    if (_880)
    {
        float _1124 = _890 ? _1016 : _946;
        _1102 = _1124;
    }
    float _1126 = _1102;
    if (_860)
    {
        float _1128 = -_594;
        float _1130 = _1128 + 1.0;
        _1104 = as_type<int>(_1130);
    }
    int _1132 = _1104;
    float _1134 = fma(_1094, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1088);
    float _1136 = _1030;
    float _1138 = _1032;
    float _1140 = _1034;
    int _1142 = _1132;
    if (!_1084)
    {
        float _1144 = fma(_884, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1030);
        _1136 = _1144;
    }
    float _1146 = _1136;
    float _1148 = _1146;
    if (!_1084)
    {
        float _1150 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1032);
        _1138 = _1150;
    }
    float _1152 = _1138;
    if (!_1084)
    {
        float _1154 = fma(_888, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1034);
        _1140 = _1154;
    }
    float _1156 = _1140;
    float _1158 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1160 = fma(_1008, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1098);
    if (!_860)
    {
        _1106 = _594;
    }
    float _1162 = _1106;
    float _1164 = fma(_1122, _1040, _1134);
    float _1166 = _1162;
    if (_860)
    {
        float _1168 = _906 ? as_type<float>(_1132) : _594;
        _1166 = _1168;
    }
    float _1170 = _1166;
    float _1172 = _1170;
    if (_868)
    {
        float _1174 = -_594;
        float _1176 = _1174 + 1.0;
        _1142 = as_type<int>(_1176);
    }
    int _1178 = _1142;
    float _1180 = -_1152;
    float _1182 = _920 * _1180;
    bool _1184 = _1100 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1186 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1188 = _952 * _1152;
    float _1190 = _954 * _1152;
    float _1192 = _626 + _1160;
    if (!_868)
    {
        _1108 = _594;
    }
    float _1194 = _1108;
    float _1196 = fma(_948, _1146, _1182);
    float _1198 = fma(_934, _1146, _1188);
    float _1200 = fma(_944, _1146, _1190);
    float _1202 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1204 = _1194;
    if (_868)
    {
        float _1206 = _1120 ? as_type<float>(_1178) : _594;
        _1204 = _1206;
    }
    float _1208 = _1204;
    float _1210 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1164);
    if (!_1184)
    {
        _1148 = _1192;
    }
    float _1212 = _1148;
    bool _1214 = !_1184;
    float _1216 = _1212;
    if (!_1214)
    {
        float _1218 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1220 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1222 = _1100 + _1220;
        float _1224 = _1192 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1226 = rsqrt(_1090);
        float _1228 = _1222 * _1218;
        float _1230 = _1228 * 0.15915493667125701904296875;
        float _1232 = _1230 * 6.283185482025146484375;
        float _1234 = sin(_1232);
        float _1236 = _1230 * 6.283185482025146484375;
        float _1238 = cos(_1236);
        float _1240 = fma(_1234, _1224, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1242 = _1226 * _1240;
        float _1244 = fma(_1062, _1242, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1246 = _1238 + (-1.0);
        float _1248 = fma(_1066, _1242, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1250 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1252 = _1244 + _1250;
        float _1254 = _1246 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1256 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1258 = _1248 + _1256;
        float _1260 = _1252 * _1252;
        float _1262 = fma(_1192, _1238, _1254);
        float _1264 = _1258 * _1258;
        _1216 = _1262;
        _1110 = _1260;
        _1112 = _1264;
        _1114 = _1244;
        _1116 = _1248;
    }
    float _1266 = _1216;
    float _1268 = _1110;
    float _1270 = _1112;
    float _1272 = _1114;
    float _1274 = _1116;
    float _1276 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1278 = _1266 + _1276;
    float _1280 = fma(_956, _1156, _1196);
    float _1282 = fma(_960, _1156, _1198);
    float _1284 = fma(_936, _1156, _1200);
    float _1286 = fma(_1278, _1278, _1268);
    float _1288 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1290 = _1096 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1292 = _1282 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1294 = _1286 + _1270;
    float _1296 = _1282 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1298 = _1282 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1300 = _1290 * _1202;
    float _1302 = fma(_1280, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1292);
    float _1304 = _1208 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1306 = sqrt(_1294);
    float _1308 = fma(_1280, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1296);
    float _1310 = fma(_1280, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1298);
    float _1312 = _1126 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1314 = _1170 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1316 = _1210 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1318 = _1304 * _1288;
    float _1320 = _1312 * _1186;
    float _1322 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1324 = _1314 * _1158;
    float _1326 = fma(_1284, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1308);
    float _1328 = fma(_1284, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1310);
    float _1330 = fma(_1284, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1302);
    out.m_65.w = _1322;
    bool _1332 = _1306 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1334 = isnan(_1306);
    bool _1336 = _1332 || _1334;
    bool _1338 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1340 = _1336 || _1338;
    out.m_67.x = _1324;
    out.m_67.y = _1320;
    out.m_67.z = _1318;
    out.m_67.w = _1300;
    out.m_69.w = _1316;
    out.m_71.x = _966;
    out.m_73.x = _1326;
    out.m_73.y = _1328;
    out.m_73.z = _1330;
    float _1342 = _1308;
    if (!_1340)
    {
        _1342 = 1.0;
    }
    float _1344 = _1342;
    bool _1346 = !_1340;
    float _1348 = _1344;
    if (!_1346)
    {
        bool _1350 = _1306 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1352 = isnan(_1306);
        bool _1354 = _1350 || _1352;
        bool _1356 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1358 = _1354 || _1356;
        if (!_1358)
        {
            float _1360 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1362 = _1306 + _1360;
            float _1364 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1366 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1364;
            float _1368 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1370 = _1368 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1372 = 1.0 / _1366;
            float _1374 = _1362 * _1372;
            float _1376 = fma(_1374, _1370, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1348 = _1376;
            _1378 = true;
        }
        else
        {
            bool _1380 = _1306 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1382 = isnan(_1306);
            bool _1384 = _1380 || _1382;
            bool _1386 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1388 = _1384 || _1386;
            if (!_1388)
            {
                float _1390 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1392 = _1306 + _1390;
                float _1394 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1396 = _1394 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1398 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1400 = _1398 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1402 = 1.0 / _1396;
                float _1404 = _1392 * _1402;
                float _1406 = fma(_1404, _1400, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1348 = _1406;
                _1378 = true;
            }
            else
            {
                _1348 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1378 = false;
    float _1408 = _1348;
    float _1410 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1412 = _1272 + _1410;
    float _1414 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1416 = _1266 + _1414;
    float _1418 = -_752;
    float _1420 = fma(_1418, (*spvDescriptorSet0.vp_c9)._m0[18].w, _632);
    bool _1422 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1424 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1426 = _1422 || _1424;
    bool _1428 = isnan(0.5);
    bool _1430 = _1426 || _1428;
    float _1432 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1434 = _1274 + _1432;
    float _1436 = fma(_1412, _1408, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1438 = fma(_1416, _1408, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1440 = -_780;
    float _1442 = fma(_1440, (*spvDescriptorSet0.vp_c9)._m0[18].w, _634);
    float _1444 = fma(_1434, _1408, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1446 = -_752;
    float _1448 = fma(_1446, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1436);
    float _1450 = -_746;
    float _1452 = fma(_1450, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1438);
    float _1454 = -_746;
    float _1456 = fma(_1454, (*spvDescriptorSet0.vp_c9)._m0[18].w, _626);
    float _1458 = -_780;
    float _1460 = fma(_1458, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1444);
    float _1462 = _1452;
    float _1464 = _1448;
    float _1466 = _1460;
    float _1468 = _1416;
    float _1470 = _1408;
    float _1472 = _1444;
    float _1474 = _1438;
    if (!_1430)
    {
        float _1476 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1478 = _1456 + _1476;
        float _1480 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1482 = _1420 + _1480;
        float _1484 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1486 = -_634;
        float _1488 = _1486 + _1444;
        float _1490 = _1478 * _1478;
        float _1492 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1494 = _1442 + _1492;
        float _1496 = -_632;
        float _1498 = _1496 + _1436;
        float _1500 = fma(_1482, _1482, _1490);
        float _1502 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1504 = fma(_1494, _1494, _1500);
        float _1506 = sqrt(_1504);
        float _1508 = 1.0 / _912;
        float _1510 = _1502 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1512 = precise::min(_1506, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1514 = _1512 * _1484;
        float _1516 = _1514 * _1508;
        float _1518 = -_626;
        float _1520 = _1518 + _1438;
        float _1522 = _1510 * _1516;
        float _1524 = _1488 * _1516;
        float _1526 = fma(_1498, _1522, _1420);
        float _1528 = fma(_1520, _1522, _1456);
        float _1530 = fma(_1510, _1524, _1442);
        _1462 = _1528;
        _1464 = _1526;
        _1466 = _1530;
        _1468 = _1516;
        _1470 = _1522;
    }
    float _1532 = _1462;
    float _1534 = _1464;
    float _1536 = _1466;
    float _1538 = _1468;
    float _1540 = _1470;
    float _1542 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1544 = _1532 + _1542;
    float _1546 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1548 = _1534 + _1546;
    float _1550 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1552 = _1536 + _1550;
    float _1554 = _1544 * _1544;
    float _1556 = fma(_1548, _1548, _1554);
    float _1558 = fma(_1552, _1552, _1556);
    float _1560 = rsqrt(_1558);
    float _1562 = _1560 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1564 = _1548 * _1562;
    float _1566 = _1552 * _1562;
    float _1568 = _1564 * _1564;
    float _1570 = _1566 * _1566;
    float _1572 = _1568 + _1570;
    float _1574 = sqrt(_1572);
    bool _1576 = _1574 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1578 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1580 = _1574 + _1578;
    float _1582 = _1538;
    float _1584 = _1572;
    float _1586 = _1580;
    if (_1576)
    {
        float _1588 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1582 = _1588;
    }
    float _1590 = _1582;
    if (_1576)
    {
        float _1592 = rsqrt(_1572);
        _1584 = _1592;
    }
    float _1594 = _1584;
    float _1596 = _1594;
    if (_1576)
    {
        float _1598 = _1580 * _1590;
        _1586 = _1598;
    }
    float _1600 = _1586;
    if (_1576)
    {
        float _1602 = _1600 * 0.15915493667125701904296875;
        _1472 = _1602;
    }
    float _1604 = _1472;
    float _1606 = _1540;
    if (_1576)
    {
        float _1608 = _1604 * 6.283185482025146484375;
        float _1610 = sin(_1608);
        _1606 = _1610;
    }
    float _1612 = _1606;
    float _1614 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1616 = precise::max(0.0, _1614);
    float _1618 = _912;
    float _1620 = _1616;
    float _1622 = _1614;
    if (_1576)
    {
        float _1624 = _1604 * 6.283185482025146484375;
        float _1626 = cos(_1624);
        _1618 = _1626;
    }
    float _1628 = _1618;
    float _1630 = -_1562;
    float _1632 = -_1616;
    float _1634 = fma(_1544, _1630, _1632);
    if (_1576)
    {
        float _1636 = _1634 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1620 = _1636;
    }
    float _1638 = _1620;
    float _1640 = sqrt(_1558);
    float _1642 = _1638;
    float _1644 = _1612;
    if (_1576)
    {
        float _1646 = fma(_1612, _1638, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1642 = _1646;
    }
    float _1648 = _1642;
    float _1650 = _1648;
    if (!_1576)
    {
        _1644 = _1564;
    }
    float _1652 = _1644;
    float _1654 = _1652;
    float _1656 = _1628;
    if (_1576)
    {
        float _1658 = _1628 + (-1.0);
        _1622 = _1658;
    }
    float _1660 = _1622;
    float _1662 = _1660;
    if (_1576)
    {
        float _1664 = _1594 * _1648;
        _1172 = _1664;
    }
    float _1666 = _1172;
    if (!_1576)
    {
        _1650 = _1634;
    }
    float _1668 = _1650;
    float _1670 = _1668;
    if (_1576)
    {
        float _1672 = _1660 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1474 = _1672;
    }
    float _1674 = _1474;
    if (_1576)
    {
        float _1676 = _1564 * _1666;
        _1654 = _1676;
    }
    float _1678 = _1654;
    if (!_1576)
    {
        _1662 = _1566;
    }
    float _1680 = _1662;
    float _1682 = _1680;
    if (_1576)
    {
        float _1684 = _1566 * _1666;
        _1682 = _1684;
    }
    float _1686 = _1682;
    if (!_1576)
    {
        _1596 = _1568;
    }
    float _1688 = _1596;
    float _1690 = _1688;
    if (_1576)
    {
        float _1692 = fma(_1634, _1628, _1674);
        _1670 = _1692;
    }
    float _1694 = _1670;
    if (_1576)
    {
        float _1696 = _1678 * _1678;
        _1690 = _1696;
    }
    float _1698 = _1690;
    if (!_1576)
    {
        _1656 = _1570;
    }
    float _1700 = _1656;
    float _1702 = _1700;
    if (_1576)
    {
        float _1704 = _1686 * _1686;
        _1702 = _1704;
    }
    float _1706 = _1702;
    float _1708 = fma(_1694, _1694, _1698);
    float _1710 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1712 = _1708 + _1706;
    float _1714 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1716 = fma(_1640, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1714);
    float _1718 = precise::clamp(_1716, 0.0, 1.0);
    float _1720 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1710);
    float _1722 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1724 = rsqrt(_1712);
    float _1726 = -_1718;
    float _1728 = _1726 + 1.0;
    float _1730 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1720);
    float _1732 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1734 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1736 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1722);
    float _1738 = _1730 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1740 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1732);
    float _1742 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1734);
    float _1744 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1736);
    float _1746 = abs(_1728);
    float _1748 = log2(_1746);
    float _1750 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1740);
    float _1752 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1742);
    float _1754 = _1744 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1756 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1758 = _1750 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1760 = _1724 * _1678;
    float _1762 = _1752 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1764 = _1724 * _1694;
    float _1766 = _1754 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1768 = _1760 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1770 = _1738 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1772 = _1724 * _1686;
    float _1774 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1766);
    float _1776 = -_1768;
    float _1778 = fma(_1764, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1776);
    float _1780 = -_1770;
    float _1782 = fma(_1780, _1756, 1.0);
    float _1784 = _1748 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1786 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1774);
    float _1788 = -_1772;
    float _1790 = fma(_1788, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1778);
    float _1792 = log2(_1782);
    float _1794 = _1754 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1796 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1786);
    float _1798 = fma(_1790, -0.5, 0.5);
    float _1800 = _1754 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1802 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1794);
    float _1804 = fma(_1790, 0.5, 0.5);
    float _1806 = _1764 + 1.0;
    float _1808 = exp2(_1784);
    float _1810 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1800);
    float _1812 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1802);
    float _1814 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1810);
    float _1816 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1812);
    float _1818 = 1.0 / _1796;
    float _1820 = fma(_1804, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1822 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1814);
    float _1824 = fma(_1804, _1820, -0.212114393711090087890625);
    float _1826 = sqrt(_1798);
    float _1828 = -_1764;
    float _1830 = fma(_1808, _1806, _1828);
    float _1832 = _1792 * 0.693147182464599609375;
    float _1834 = fma(_1804, _1824, 1.570728778839111328125);
    float _1836 = _1832 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1838 = _1816 * _1818;
    float _1840 = _1822 * _1818;
    float _1842 = fma(_1838, -0.5, 0.5);
    float _1844 = fma(_1840, 0.5, 0.5);
    float _1846 = fma(_1830, 0.5, 0.5);
    float _1848 = _1826 * 0.636619746685028076171875;
    float _1850 = -_1834;
    float _1852 = fma(_1848, _1850, 1.0);
    float3 _4926 = float3(_1844, _1842, _1836);
    float _1854 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4926, float3(0.0), isnan(_4926)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4926, float3(0.0), isnan(_4926)), level(0.0)).x;
    float3 _4937 = float3(_1844, _1842, _1836);
    float4 _1857 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4937, float3(0.0), isnan(_4937)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4937, float3(0.0), isnan(_4937)), level(0.0)).xyzw;
    float _1859 = _1857.x;
    float _1861 = _1857.y;
    float _1863 = _1857.z;
    float _1865 = _1857.w;
    float2 _4954 = float2(_1852, _1846);
    float3 _1869 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4954, float2(0.0), isnan(_4954)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4954, float2(0.0), isnan(_4954)), level(0.0)).xyz;
    float _1871 = _1869.x;
    float _1873 = _1869.y;
    float _1875 = _1869.z;
    float _1877 = _1456 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    out.m_75.x = _1534;
    out.m_75.y = _1532;
    out.m_75.z = _1536;
    float _1879 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1877);
    float _1881 = _1456 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1883 = _1748 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1885 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1879);
    float _1887 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1881);
    float _1889 = _1885 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1891 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1887);
    float _1893 = exp2(_1883);
    float _1895 = _1891 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1897 = _1895 + _1889;
    float _1899 = 1.0 / _1889;
    float _1901 = _1897 * _1899;
    float _1903 = _1901 * 0.5;
    float _1905 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1907 = fma(_1903, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1905);
    float _1909 = _1754 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1911 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1913 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1915 = _1911 || _1913;
    bool _1917 = isnan(0.5);
    bool _1919 = _1915 || _1917;
    float _1921 = 1.0 / _1907;
    float _1923 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1909);
    float _1925 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1923);
    float _1927 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1925);
    float _1929 = _1762;
    float _1931 = _1923;
    if (_1919)
    {
        _1929 = 1.0;
    }
    float _1933 = _1929;
    float _1935 = _1933;
    if (_1919)
    {
        _1931 = 1.0;
    }
    float _1937 = _1931;
    float _1939 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1941 = _1921 * _1939;
    float _1943 = _1937;
    if (!_1919)
    {
        float _1945 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1947 = _1945 * 0.15915493667125701904296875;
        float _1949 = _1947 * 6.283185482025146484375;
        float _1951 = cos(_1949);
        float _1953 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1955 = _1953 * 0.15915493667125701904296875;
        float _1957 = _1947 * 6.283185482025146484375;
        float _1959 = sin(_1957);
        float _1961 = 1.0 / _1951;
        float _1963 = _1955 * 6.283185482025146484375;
        float _1965 = cos(_1963);
        float _1967 = _1959 * _1961;
        float _1969 = _1955 * 6.283185482025146484375;
        float _1971 = sin(_1969);
        float _1973 = _1965 * _1967;
        float _1975 = 1.0 / _1973;
        float _1977 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1979 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1977;
        float _1981 = 1.0 / _1979;
        float _1983 = _1971 * _1975;
        float _1985 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1987 = fma(_1941, _1983, _1985);
        float _1989 = _1987 * _1981;
        float _1991 = precise::clamp(_1989, 0.0, 1.0);
        _1935 = _1991;
    }
    float _1993 = _1935;
    if (!_1919)
    {
        float _1995 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1997 = _1995 * 0.15915493667125701904296875;
        float _1999 = _1997 * 6.283185482025146484375;
        float _2001 = cos(_1999);
        float _2003 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2005 = _2003 * 0.15915493667125701904296875;
        float _2007 = _1997 * 6.283185482025146484375;
        float _2009 = sin(_2007);
        float _2011 = 1.0 / _2001;
        float _2013 = _2005 * 6.283185482025146484375;
        float _2015 = cos(_2013);
        float _2017 = _2009 * _2011;
        float _2019 = _2005 * 6.283185482025146484375;
        float _2021 = sin(_2019);
        float _2023 = _2015 * _2017;
        float _2025 = 1.0 / _2023;
        float _2027 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2029 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2027;
        float _2031 = 1.0 / _2029;
        float _2033 = _2021 * _2025;
        float _2035 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2037 = fma(_1941, _2033, _2035);
        float _2039 = _2037 * _2031;
        float _2041 = precise::clamp(_2039, 0.0, 1.0);
        float _2043 = -_2041;
        float _2045 = _2043 + 1.0;
        _1943 = _2045;
    }
    float _2047 = _1943;
    float _2049 = -_1893;
    float _2051 = _2049 + 1.0;
    float _2053 = _1993 * _2047;
    float _2055 = _1796 * 0.5;
    bool _2057 = _1993 > 0.0;
    bool _2059 = isnan(_1993);
    bool _2061 = _2057 || _2059;
    bool _2063 = isnan(0.0);
    bool _2065 = _2061 || _2063;
    float _2067 = _2051 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2069 = _2053 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2071 = fma(_1816, -0.5, _2055);
    bool _2073 = _2047 <= 0.0;
    bool _2075 = !_2065;
    bool _2077 = _2073 || _2075;
    float _2079 = _2067 * _1854;
    float _2081 = _2069 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2083 = _1927 + _1796;
    float _2085 = _1822 + _1796;
    float _2087 = _1865 * _2079;
    float _2089 = _1875 * _2079;
    float _2091 = -_2067;
    float _2093 = _2091 + 1.0;
    out.gl_Position.x = _1822;
    out.gl_Position.y = _1816;
    out.gl_Position.z = _1927;
    out.gl_Position.w = _1796;
    float _2095 = fma(_1871, _2087, _1859);
    float _2097 = _2083 * 0.5;
    out.m_47.x = _2081;
    float _2099 = _2085 * 0.5;
    float _2101 = fma(_1873, _2087, _1861);
    float _2103 = _1865 * _2093;
    out.m_77.x = _1548;
    out.m_77.y = _1544;
    out.m_77.z = _1552;
    float _2105 = fma(_1865, _2089, _1863);
    out.m_79.x = _2099;
    out.m_79.y = _2071;
    out.m_79.z = _2097;
    out.m_79.w = _1796;
    out.m_81.x = _2095;
    out.m_81.y = _2101;
    out.m_81.z = _2105;
    out.m_81.w = _2103;
    if (!_2077)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2107 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2107;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

