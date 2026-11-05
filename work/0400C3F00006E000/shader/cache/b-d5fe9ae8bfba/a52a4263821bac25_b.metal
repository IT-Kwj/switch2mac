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
    constant _16* vp_c15 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c9 [[id(3)]];
    constant _16* vp_c12 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_22 [[id(7)]];
    sampler vp_t_tcb_22Smplr [[id(8)]];
    texture2d_array<float> vp_t_tcb_14 [[id(9)]];
    sampler vp_t_tcb_14Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_32 [[id(11)]];
    sampler vp_t_tcb_32Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_30 [[id(13)]];
    sampler vp_t_tcb_30Smplr [[id(14)]];
    texture2d<float> vp_t_tcb_1C [[id(15)]];
    sampler vp_t_tcb_1CSmplr [[id(16)]];
    sampler vp_t_tcb_22Smplr_w [[id(17)]];
    sampler vp_t_tcb_14Smplr_w [[id(18)]];
    sampler vp_t_tcb_32Smplr_w [[id(19)]];
    sampler vp_t_tcb_30Smplr_w [[id(20)]];
    sampler vp_t_tcb_1CSmplr_w [[id(21)]];
    constant dm_border_t* dm_border [[id(22)]];
};

struct main0_out
{
    float4 m_67 [[user(locn0)]];
    float4 m_77 [[user(locn1)]];
    float4 m_79 [[user(locn2)]];
    float4 m_81 [[user(locn3)]];
    float4 m_87 [[user(locn4)]];
    float4 m_56 [[user(locn5)]];
    float4 m_75 [[user(locn6)]];
    float4 m_85 [[user(locn7)]];
    float4 m_83 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_69 [[attribute(1)]];
    float4 m_71 [[attribute(2)]];
    float4 m_73 [[attribute(3)]];
    float4 m_53 [[attribute(5)]];
    float4 m_58 [[attribute(6)]];
    float4 m_63 [[attribute(7)]];
    float4 m_65 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2288 = false;
    bool _1182 = false;
    bool _1170 = false;
    bool _626 = false;
    bool _478 = false;
    bool _286 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_53.w;
    float _103 = trunc(_101);
    int _106 = int(_103);
    bool _110 = _106 >= 1;
    float _112 = 0.0;
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _112;
    float _116 = _114;
    if (!_110)
    {
        out.m_56.x = 0.0;
    }
    int _118 = 0;
    if (!_110)
    {
        float _120 = _114 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2535 = as_type<float>(_122);
        out.gl_Position.z = _2535;
    }
    if (!_110)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _126 = in.m_58.w;
    bool _128 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_126);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = -_126;
    float _140 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _142 = 0.0;
    if (_136)
    {
        float _144 = float(_106);
        _142 = _144;
    }
    float _146 = _142;
    bool _148 = _140 >= _146;
    bool _150 = !_136;
    bool _152 = _148 || _150;
    if (_152)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _116;
    if (_152)
    {
        out.m_56.x = 0.0;
    }
    if (_152)
    {
        float _156 = _154 * 5.0;
        _124 = as_type<int>(_156);
    }
    int _158 = _124;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2603 = as_type<float>(_158);
        out.gl_Position.z = _2603;
    }
    if (_152)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _160 = as_type<float>(int(gl_VertexIndex));
    float _162 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _164 = _140 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _166 = in.m_63.x;
    float _168 = _164 * _162;
    int _170 = as_type<int>(_160) & 1;
    bool _172 = _170 != 0;
    int _174 = as_type<int>(_160) & 2;
    bool _176 = _174 != 0;
    float _178 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[20].x, _168);
    bool _180 = !_176;
    float _182 = _180 ? (-0.5) : 0.5;
    int _184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _186 = _184 != 0;
    int _188 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _190 = _188 != 0;
    float _192 = _178 * 6.283185482025146484375;
    float _194 = floor(_178);
    float _196 = _192 * 0.15915493667125701904296875;
    bool _198 = !_172;
    float _200 = _198 ? (-0.5) : 0.5;
    int _202 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _204 = _202 != 0;
    bool _206 = !_186;
    int _208 = _206 ? 0 : 1;
    float _210 = _196 * 6.283185482025146484375;
    float _212 = cos(_210);
    bool _214 = !_204;
    int _216 = _214 ? 0 : 1;
    int _218 = abs(_208);
    int _220 = abs(_216);
    float _222 = -_194;
    float _224 = _178 + _222;
    float _226 = float(_218);
    float _228 = -_224;
    float _230 = fma(_228, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _232 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _234 = !_190;
    int _236 = _234 ? 0 : 1;
    float _238 = fma(_212, 0.5, 0.5);
    float _240 = abs(_230);
    float _242 = _226 * _240;
    bool _244 = _224 < 0.5;
    float _246 = float(_244);
    int _248 = abs(_236);
    float _250 = -_238;
    float _252 = fma(_250, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _254 = float(_220);
    float _256 = -_246;
    float _258 = fma(_256, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _260 = float(_248);
    float _262 = fma(_254, _252, _242);
    float _264 = abs(_258);
    float _266 = fma(_260, _264, _262);
    bool _268 = !_232;
    float _284;
    if (!_268)
    {
        float _270 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _272 = _166 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _274 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[12].x, _140);
        float _276 = _274 * _270;
        float _278 = floor(_276);
        float _280 = -_278;
        float _282 = _276 + _280;
        _284 = _282;
        _286 = true;
    }
    else
    {
        float _288 = float(_106);
        float _290 = 1.0 / _288;
        float _292 = _140 * _290;
        _284 = _292;
    }
    _286 = false;
    float _294 = _284;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _298 = _294 + _296;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _302 = _294 + _300;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _306 = _294 + _304;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _308;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _314 = _312 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _318 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _316;
    bool _320 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _322 = isnan(_294);
    bool _324 = _320 || _322;
    bool _326 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _328 = _324 || _326;
    float _330 = float(_328);
    bool _332 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _334 = 1.0 / _310;
    float _336 = 1.0 / _318;
    float _338 = 1.0 / _314;
    float _340 = _298 * _334;
    bool _342 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _344 = isnan(_294);
    bool _346 = _342 || _344;
    bool _348 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _350 = _346 || _348;
    float _352 = float(_350);
    float _354 = -_330;
    float _356 = _354 + 1.0;
    bool _358 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _360 = isnan(_294);
    bool _362 = _358 || _360;
    bool _364 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _366 = _362 || _364;
    float _368 = float(_366);
    float _370 = _352 * _356;
    float _372 = _302 * _336;
    float _374 = -_352;
    float _376 = _374 + 1.0;
    float _378 = _368 * _376;
    float _380 = -_368;
    float _382 = _380 + 1.0;
    float _384 = _306 * _338;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _388 = _386 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _390 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _392 = isnan(_294);
    bool _394 = _390 || _392;
    bool _396 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _398 = _394 || _396;
    float _400 = float(_398);
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _402;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _406;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _414 = fma(_404, _340, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _416 = _400 * _382;
    float _418 = fma(_408, _340, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _420 = fma(_388, _384, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _422 = fma(_412, _384, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _424 = -_400;
    float _426 = _424 + 1.0;
    float _428 = _414 * _416;
    float _430 = _418 * _416;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _432;
    float _436 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[143].x, _428);
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _438;
    float _442 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[143].y, _430);
    float _444 = fma(_434, _372, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _446 = fma(_420, _378, _436);
    float _448 = fma(_440, _372, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _450 = fma(_422, _378, _442);
    float _452 = fma(_444, _370, _446);
    float _454 = fma(_448, _370, _450);
    float _456 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[146].x, _452);
    float _458 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[146].y, _454);
    bool _460 = !_332;
    float _476;
    if (!_460)
    {
        float _462 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _464 = _166 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _466 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[11].y, _140);
        float _468 = _466 * _462;
        float _470 = floor(_468);
        float _472 = -_470;
        float _474 = _468 + _472;
        _476 = _474;
        _478 = true;
    }
    else
    {
        float _480 = float(_106);
        float _482 = 1.0 / _480;
        float _484 = _140 * _482;
        _476 = _484;
    }
    _478 = false;
    float _486 = _476;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _490 = _486 + _488;
    float _492 = in.m_65.x;
    float _494 = in.m_65.y;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _498 = _496 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _500 = _486 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _502 = isnan(_486);
    bool _504 = _500 || _502;
    bool _506 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _508 = _504 || _506;
    float _510 = float(_508);
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _514 = _512 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _516 = _486 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _518 = isnan(_486);
    bool _520 = _516 || _518;
    bool _522 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _524 = _520 || _522;
    float _526 = float(_524);
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _528;
    bool _532 = _486 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _534 = isnan(_486);
    bool _536 = _532 || _534;
    bool _538 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _540 = _536 || _538;
    float _542 = float(_540);
    float _544 = 1.0 / _498;
    float _546 = -_510;
    float _548 = _546 + 1.0;
    bool _550 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _552 = _526 * _548;
    float _554 = -_526;
    float _556 = _554 + 1.0;
    float _558 = 1.0 / _514;
    float _560 = _530 * _544;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _564 = _562 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _566 = _458 * _494;
    float _568 = _456 * _492;
    float _570 = fma(_560, _490, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _572 = -_542;
    float _574 = _572 + 1.0;
    float _576 = _570 * _552;
    float _578 = _564 * _558;
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _582 = _486 + _580;
    float _584 = _510 * _574;
    float _586 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[115].x, _576);
    float _588 = fma(_578, _582, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _590 = fma(_588, _584, _586);
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _594 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _596 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[117].x, _590);
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _600 = _592 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _602 = _594 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _604 = _596 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _606 = _598 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_67.x = _600;
    out.m_67.y = _602;
    out.m_67.z = _606;
    out.m_67.w = _604;
    bool _608 = !_550;
    float _624;
    if (!_608)
    {
        float _610 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _612 = _166 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _614 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[11].w, _140);
        float _616 = _614 * _610;
        float _618 = floor(_616);
        float _620 = -_618;
        float _622 = _616 + _620;
        _624 = _622;
        _626 = true;
    }
    else
    {
        float _628 = float(_106);
        float _630 = 1.0 / _628;
        float _632 = _140 * _630;
        _624 = _632;
    }
    _626 = false;
    float _634 = _624;
    float _636 = in.m_53.x;
    float _638 = in.m_53.y;
    float _640 = in.m_53.z;
    float _642 = in.m_69.x;
    float _644 = in.m_69.y;
    float _646 = in.m_69.z;
    float _648 = in.m_69.w;
    int _650 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _652 = _650 != 0;
    int _654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _656 = _654 != 0;
    float _658 = in.m_71.x;
    float _660 = in.m_71.y;
    float _662 = in.m_71.z;
    float _664 = in.m_71.w;
    float _666 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _668 = _166 > 0.5;
    float _670 = in.m_73.x;
    float _672 = in.m_73.y;
    float _674 = in.m_73.z;
    float _676 = in.m_73.w;
    float _678 = in.m_63.y;
    float _680 = in.m_63.z;
    float _682 = _638 * _644;
    float _684 = _566 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _686 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _182);
    float _688 = _638 * _660;
    float _690 = _166 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _692 = fma(_636, _642, _682);
    float _694 = _684 * _686;
    float _696 = _638 * _672;
    float _698 = _568 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _700 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _200);
    float _702 = -_666;
    float _704 = fma(_690, 2.0, _702);
    float _706 = fma(_636, _670, _696);
    float _708 = _698 * _700;
    float _710 = fma(_636, _658, _688);
    float _712 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _714 = _678 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _716 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _718 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _720 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[78].z, _712);
    float _722 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[79].z, _716);
    float _724 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _726 = fma(_714, -2.0, _718);
    float _728 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _730 = _728 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _732 = -_200;
    int _734 = _668 ? as_type<int>(_732) : as_type<int>(_200);
    float _736 = fma(_640, _662, _710);
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _740 = _738 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _742 = _678 > 0.5;
    float _744 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[78].w, _724);
    bool _746 = !_652;
    float _748 = _746 ? _200 : as_type<float>(_734);
    float _750 = _200 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _752 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _754 = _752 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _756 = 1.0 / _730;
    float _758 = _182 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _760 = fma(_640, _646, _692);
    float _762 = fma(_640, _674, _706);
    float _764 = _758 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _766 = _758 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _768 = _758 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _770 = 1.0 / _740;
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _774 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _772;
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _778 = _776 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _780 = -_182;
    int _782 = _742 ? as_type<int>(_780) : as_type<int>(_182);
    float _784 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[24].x, _764);
    bool _786 = _634 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _788 = isnan(_634);
    bool _790 = _786 || _788;
    bool _792 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _794 = _790 || _792;
    float _796 = float(_794);
    float _798 = _736 + _664;
    bool _800 = !_656;
    float _802 = _800 ? _182 : as_type<float>(_782);
    float _804 = 1.0 / _754;
    float _806 = _774 * _756;
    float _808 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[79].x, _722);
    float _810 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[25].x, _766);
    bool _812 = _634 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _814 = isnan(_634);
    bool _816 = _812 || _814;
    bool _818 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _820 = _816 || _818;
    float _822 = float(_820);
    float _824 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].z, _720);
    float _826 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[76].y, _726);
    float _828 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _830 = _634 + _828;
    float _832 = _778 * _770;
    float _834 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _836 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _834;
    bool _838 = _634 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _840 = isnan(_634);
    bool _842 = _838 || _840;
    bool _844 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _846 = _842 || _844;
    float _848 = float(_846);
    float _850 = -_140;
    float _852 = fma(_850, (*spvDescriptorSet0.vp_c9)._m0[76].x, _704);
    float _854 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].w, _744);
    bool _856 = _634 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _858 = isnan(_634);
    bool _860 = _856 || _858;
    bool _862 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _864 = _860 || _862;
    float _866 = float(_864);
    float _868 = _808 * (-0.15915493667125701904296875);
    float _870 = -_848;
    float _872 = _870 + 1.0;
    float _874 = _836 * _804;
    float _876 = -_796;
    float _878 = _876 + 1.0;
    float _880 = fma(_806, _830, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _882 = _866 * _872;
    float _884 = _760 + _648;
    float _886 = _822 * _878;
    float _888 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _890 = _634 + _888;
    float _892 = _798 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    float _894 = _868 * 6.283185482025146484375;
    float _896 = sin(_894);
    float _898 = _880 * _882;
    float _900 = fma(_832, _890, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _902 = _762 + _676;
    float _904 = _884 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    float _906 = _892 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _908 = _892 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _910 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[26].x, _768);
    float _912 = _868 * 6.283185482025146484375;
    float _914 = cos(_912);
    float _916 = _902 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    float _918 = fma(_904, (*spvDescriptorSet0.vp_c12)._m0[6].y, _906);
    float _920 = -_822;
    float _922 = _920 + 1.0;
    float _924 = _694 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _926 = _694 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _928 = _694 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _930 = -_866;
    float _932 = _930 + 1.0;
    float _934 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _936 = fma(_904, (*spvDescriptorSet0.vp_c12)._m0[6].x, _908);
    float _938 = fma(_916, (*spvDescriptorSet0.vp_c12)._m0[8].y, _918);
    float _940 = _848 * _922;
    float _942 = fma(_708, (*spvDescriptorSet0.vp_c8)._m0[24].x, _924);
    float _944 = fma(_708, (*spvDescriptorSet0.vp_c8)._m0[25].x, _926);
    float _946 = fma(_708, (*spvDescriptorSet0.vp_c8)._m0[26].x, _928);
    float _948 = fma(_932, (*spvDescriptorSet0.vp_c9)._m0[131].x, _898);
    float _950 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _952 = fma(_916, (*spvDescriptorSet0.vp_c12)._m0[8].x, _936);
    float _954 = _938 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _956 = fma(_900, _940, _948);
    float _958 = _802 * _896;
    float _960 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _962 = _634 + _960;
    float _964 = _802 * _914;
    float _966 = _892 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    float _968 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _970 = _952 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _972 = _954 * _934;
    float _974 = -_958;
    float _976 = fma(_748, _914, _974);
    float _978 = fma(_874, _962, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _980 = fma(_904, (*spvDescriptorSet0.vp_c12)._m0[6].z, _966);
    float _982 = fma(_748, _896, _964);
    float _984 = fma(_972, 0.5, 0.5);
    float _986 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _988 = _970 * _950;
    float _990 = fma(_916, (*spvDescriptorSet0.vp_c12)._m0[8].z, _980);
    float _992 = fma(_978, _886, _956);
    float _994 = fma(_988, 0.5, 0.5);
    float _996 = _990 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    float _998 = fma(_796, (*spvDescriptorSet0.vp_c9)._m0[134].x, _992);
    float _1000 = floor(_984);
    float _1002 = _996 * _968;
    float _1004 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1006 = -_824;
    float _1008 = _1006 + 1.0;
    float _1010 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1012 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1014 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1016 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1018 = fma(_1002, 0.5, 0.5);
    float _1020 = _986 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1022 = _1010 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1024 = _1012 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1026 = _1016 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1028 = _976 + 0.5;
    float _1030 = floor(_994);
    float _1032 = -_1000;
    float _1034 = _984 + _1032;
    float _1036 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[24].z, _942);
    float _1038 = _982 + (-0.5);
    float _1040 = fma(_1020, _1028, _852);
    float _1042 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[25].z, _944);
    float _1044 = fma(_1034, 2.0, -1.0);
    float _1046 = floor(_1018);
    float _1048 = _1014 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1050 = -_854;
    float _1052 = _1050 + 1.0;
    float _1054 = _784 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _1056 = _810 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _1058 = -_1048;
    float _1060 = -_826;
    float _1062 = fma(_1058, _1038, _1060);
    float _1064 = -_1008;
    float _1066 = fma(_976, _1064, _1040);
    float _1068 = _910 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _1070 = -_1030;
    float _1072 = _994 + _1070;
    float _1074 = _1044 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _1076 = _998 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1078 = fma(_982, _1052, _1062);
    float _1080 = fma(_1072, 2.0, -1.0);
    float _1082 = _1074 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    out.m_75.x = _1054;
    out.m_75.y = _1056;
    out.m_75.z = _1068;
    float _1084 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[26].z, _946);
    float _1086 = _1080 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _1088 = -_1046;
    float _1090 = _1018 + _1088;
    out.m_77.x = _1022;
    out.m_77.y = _1024;
    out.m_77.z = _1026;
    out.m_77.w = _1076;
    float _1092 = _1036 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1094 = fma(_1086, (*spvDescriptorSet0.vp_c12)._m0[2].x, _1082);
    float _1096 = fma(_1090, 2.0, -1.0);
    float _1098 = _1084 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    out.m_79.x = _1066;
    out.m_79.y = _1078;
    bool _1100 = (*spvDescriptorSet0.vp_c12)._m0[10].x != 1.0;
    bool _1102 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _1104 = _1100 || _1102;
    bool _1106 = isnan(1.0);
    bool _1108 = _1104 || _1106;
    float _1110 = _1074 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _1112 = _1074 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    float _1114 = _1096 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _1116 = fma(_1086, (*spvDescriptorSet0.vp_c12)._m0[2].y, _1110);
    float _1118 = fma(_1086, (*spvDescriptorSet0.vp_c12)._m0[2].z, _1112);
    float _1120 = fma(_1114, (*spvDescriptorSet0.vp_c12)._m0[4].x, _1094);
    float _1122 = fma(_1114, (*spvDescriptorSet0.vp_c12)._m0[4].y, _1116);
    float _1124 = fma(_1114, (*spvDescriptorSet0.vp_c12)._m0[4].z, _1118);
    float _1126 = _1042 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1128 = _1120 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _1130 = _1122 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _1132 = _1124 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _1134 = _1092 + _1128;
    float _1136 = _1126 + _1130;
    float _1138 = _1098 + _1132;
    float _1140 = _1062;
    float _1142 = _1112;
    float _1144 = _1126;
    float _1146 = _1114;
    float _1148 = _1112;
    float _1150 = _1126;
    float _1152 = _1114;
    float _1154 = _1080;
    float _1156 = _1044;
    float _1158 = _1096;
    float _1160 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
    float _1162 = _1020;
    float _1164 = _994;
    float _1174;
    float _1176;
    float _1178;
    float _1180;
    if (!_1108)
    {
        bool _1166 = _1130 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _1168 = !_1166;
        _1170 = _1168;
        if (!_1170)
        {
            float _1172 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _1174 = _1172;
            _1176 = 0.0;
            _1178 = 0.0;
            _1180 = 0.0;
            _1182 = true;
        }
    }
    if ((!_1182) || _1170)
    {
        bool _1218;
        if (!_1170)
        {
            bool _1184 = _1130 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _1186 = isnan(_1130);
            bool _1188 = _1184 || _1186;
            bool _1190 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _1192 = _1188 || _1190;
            bool _1194 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _1196 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _1198 = !_1192;
            bool _1200 = _1196 && _1198;
            if (_1200)
            {
                _1140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _1202 = _1140;
            float _1204 = _1202;
            if (_1200)
            {
                _1142 = 0.0;
            }
            float _1206 = _1142;
            _1148 = _1206;
            _1176 = _1206;
            if (_1200)
            {
                _1144 = 0.0;
            }
            float _1208 = _1144;
            _1150 = _1208;
            _1178 = _1208;
            if (_1200)
            {
                float _1210 = _1202 * 5.0;
                _1204 = _1210;
            }
            float _1212 = _1204;
            _1174 = _1212;
            if (_1200)
            {
                _1146 = 0.0;
            }
            float _1214 = _1146;
            bool _1216 = !_1192;
            _1218 = _1216 && _1194;
            _1152 = _1214;
            _1180 = _1214;
        }
        if ((!_1218) || _1170)
        {
            _1170 = false;
            float _1220 = _1148;
            float _1222 = _1150;
            float _1224 = _1152;
            bool _1226 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _1228 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _1230 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _1232 = _1118;
            float _1234 = _1222;
            float _1236 = _1224;
            _1174 = _1138;
            if (_1226)
            {
                float _1238 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _1232 = _1238;
            }
            float _1240 = _1232;
            if (_1226)
            {
                float _1242 = abs(_1080);
                float _1244 = -_1242;
                float _1246 = _1244 + 1.0;
                _1154 = _1246;
            }
            float _1248 = _1154;
            if (_1228)
            {
                float _1250 = abs(_1044);
                float _1252 = -_1250;
                float _1254 = _1252 + 1.0;
                _1156 = _1254;
            }
            float _1256 = _1156;
            if (!_1226)
            {
                _1234 = 1.0;
            }
            float _1258 = _1234;
            float _1260 = _1258;
            if (_1230)
            {
                float _1262 = abs(_1096);
                float _1264 = -_1262;
                float _1266 = _1264 + 1.0;
                _1158 = _1266;
            }
            float _1268 = _1158;
            if (!_1228)
            {
                _1160 = 1.0;
            }
            float _1270 = _1160;
            float _1272 = _1270;
            if (!_1230)
            {
                _1236 = 1.0;
            }
            float _1274 = _1236;
            float _1276 = _1220;
            float _1278 = _1274;
            if (_1228)
            {
                float _1280 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _1276 = _1280;
            }
            float _1282 = _1276;
            float _1284 = _1066;
            if (_1230)
            {
                float _1286 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _1284 = _1286;
            }
            float _1288 = _1284;
            if (_1226)
            {
                float _1290 = _1248 * _1240;
                float _1292 = precise::clamp(_1290, 0.0, 1.0);
                _1260 = _1292;
            }
            float _1294 = _1260;
            if (_1228)
            {
                float _1296 = _1256 * _1282;
                float _1298 = precise::clamp(_1296, 0.0, 1.0);
                _1272 = _1298;
            }
            float _1300 = _1272;
            float _1302 = _1294 * _1300;
            _1176 = _1134;
            _1178 = _1136;
            if (_1230)
            {
                float _1304 = _1268 * _1288;
                float _1306 = precise::clamp(_1304, 0.0, 1.0);
                _1278 = _1306;
            }
            float _1308 = _1278;
            float _1310 = _1302 * _1308;
            _1180 = _1310;
        }
    }
    _1182 = false;
    float _1312 = _1174;
    float _1314 = _1176;
    float _1316 = _1178;
    float _1318 = _1180;
    float _1320 = _1130 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1322 = _1320 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1324 = _1320 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1326 = fma(_1132, 6.2500002968590706586837768554688e-05, 0.5);
    float _1328 = fma(_1128, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1322);
    float _1330 = fma(_1128, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1324);
    float _1332 = fma(_1132, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1328);
    float _1334 = fma(_1132, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1330);
    float _1336 = _1332 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1338 = _1334 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1340 = trunc(_1336);
    int _1342 = int(_1340);
    float _1344 = trunc(_1338);
    int _1346 = int(_1344);
    int _1348 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1350 = _1342 + _1348;
    int _1352 = _1350 + 1;
    bool _1354 = _1352 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1356 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1358 = _1346 + _1356;
    int _1360 = _1358 + 1;
    int _1362 = _1352 | _1360;
    bool _1364 = _1362 < 0;
    bool _1366 = _1364 || _1354;
    bool _1368 = _1360 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1370 = _1368 || _1366;
    int _1372 = _1352;
    int _1374 = _1362;
    int _1376 = _1360;
    float _1378 = _1314;
    float _1380 = _1316;
    float _1382 = _1312;
    float _1384 = _1326;
    if (!_1370)
    {
        int _1386 = _1360 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1388 = _1386 + _1352;
        _1372 = _1388;
    }
    int _1390 = _1372;
    float _1392 = _1134;
    if (!_1370)
    {
        float _1394 = floor(_1336);
        _1392 = _1394;
    }
    float _1396 = _1392;
    if (!_1370)
    {
        int _1398 = _1390 << 2;
        _1374 = _1398;
    }
    int _1400 = _1374;
    int _1402 = _1400;
    if (!_1370)
    {
        uint _1405 = uint(int(uint(_1390) >> uint(2)));
        _1376 = int(_1405);
    }
    int _1407 = _1376;
    float _1409 = as_type<float>(_1407);
    if (!_1370)
    {
        int _1411 = 12 & _1400;
        _1402 = _1411;
    }
    int _1413 = _1402;
    if (!_1370)
    {
        int _1415 = _1407 << 4;
        int _1417 = _1415 + _1413;
        _1162 = as_type<float>(_1417);
    }
    float _1419 = _1162;
    float _1421 = as_type<float>(_1413);
    if (!_1370)
    {
        float _1423 = floor(_1338);
        _1421 = _1423;
    }
    float _1425 = _1421;
    if (!_1370)
    {
        float _1427 = -_1396;
        float _1429 = _1336 + _1427;
        _1164 = _1429;
    }
    float _1431 = _1164;
    float _1433 = _1419;
    if (!_1370)
    {
        int _1435 = as_type<int>(_1419) + 400;
        uint _1437 = uint(int(uint(_1435) >> uint(2)));
        uint _1439 = uint(int(uint(int(_1437)) >> uint(2)));
        int _1441 = int(_1437) & 3;
        float _1443 = (*spvDescriptorSet0.vp_c15)._m0[int(_1439)][_1441];
        _1433 = _1443;
    }
    float _1445 = _1433;
    if (!_1370)
    {
        float _1447 = -_1425;
        float _1449 = _1338 + _1447;
        _1409 = _1449;
    }
    float _1451 = _1409;
    float _1453 = fma(_1128, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _4708 = float2(_1453, _1326);
    float _1455 = dm_bs(spvDescriptorSet0.vp_t_tcb_22.sample(spvDescriptorSet0.vp_t_tcb_22Smplr, select(_4708, float2(0.0), isnan(_4708)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_22, spvDescriptorSet0.vp_t_tcb_22Smplr_w, select(_4708, float2(0.0), isnan(_4708)), level(0.0)).x;
    float _1457 = 2.0;
    if (!_1370)
    {
        float _1459 = rint(_1445);
        float _1461 = precise::max(_1459, 0.0);
        uint _1463 = uint(_1461);
        uint _1465 = clamp(_1463, 0u, 65535u);
        _1457 = as_type<float>(_1465);
    }
    float _1467 = _1457;
    float _1469 = _1451;
    if (!_1370)
    {
        float3 _4742 = float3(_1431, _1451, float(as_type<int>(_1467)));
        float3 _4746 = select(_4742, float3(0.0), isnan(_4742));
        float _1471 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4746.xy, uint(rint(_4746.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4746.xy, uint(rint(_4746.z)), level(0.0)).x;
        _1469 = _1471;
    }
    float _1473 = _1469;
    float _1475 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1477 = _1312 + _1475;
    float _1479 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1481 = _1314 + _1479;
    float _1483 = _1130 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1485 = _1130 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1487 = _1477 * _1477;
    float _1489 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1483);
    float _1491 = fma(_1481, _1481, _1487);
    float _1493 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1485);
    bool _1495 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1497 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1499 = _1495 || _1497;
    bool _1501 = isnan(0.5);
    bool _1503 = _1499 || _1501;
    float _1505 = sqrt(_1491);
    bool _1507 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1509 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1511 = _1507 || _1509;
    bool _1513 = isnan(0.5);
    bool _1515 = _1511 || _1513;
    float _1517 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1489);
    float _1519 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1493);
    bool _1521 = _1505 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1523 = !_1521;
    float _1525 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1527 = _1455;
    if (!_1523)
    {
        float _1529 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1531 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1533 = _1505 + _1531;
        float _1535 = _1316 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1537 = rsqrt(_1491);
        float _1539 = _1533 * _1529;
        float _1541 = _1539 * 0.15915493667125701904296875;
        float _1543 = _1541 * 6.283185482025146484375;
        float _1545 = cos(_1543);
        float _1547 = _1541 * 6.283185482025146484375;
        float _1549 = sin(_1547);
        float _1551 = _1545 + (-1.0);
        float _1553 = _1551 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1555 = fma(_1549, _1535, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1557 = fma(_1545, _1316, _1553);
        float _1559 = _1537 * _1555;
        float _1561 = fma(_1481, _1559, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1563 = fma(_1477, _1559, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1378 = _1561;
        _1380 = _1557;
        _1525 = _1537;
        _1382 = _1563;
        _1384 = _1553;
    }
    float _1565 = _1378;
    float _1567 = _1380;
    float _1569 = _1525;
    float _1571 = _1382;
    float _1573 = _1384;
    float _1575 = _1517 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1577 = _1519 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1579 = _1569;
    float _1581 = _1573;
    float _1583 = _1571;
    if (_1503)
    {
        _1579 = _1565;
    }
    float _1585 = _1579;
    float _1587 = _1585;
    if (_1503)
    {
        _1581 = _1567;
    }
    float _1589 = _1581;
    float _1591 = _1589;
    if (!_1503)
    {
        float _1593 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1595 = _1130 + _1593;
        float _1597 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1599 = _1128 + _1597;
        float _1601 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1603 = -_1130;
        float _1605 = _1603 + _1567;
        float _1607 = _1595 * _1595;
        float _1609 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1611 = _1132 + _1609;
        float _1613 = -_1128;
        float _1615 = _1613 + _1565;
        float _1617 = -_1132;
        float _1619 = _1617 + _1571;
        float _1621 = fma(_1599, _1599, _1607);
        float _1623 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1625 = fma(_1611, _1611, _1621);
        float _1627 = sqrt(_1625);
        float _1629 = _1601 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1631 = precise::min(_1627, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1633 = _1631 * _1623;
        float _1635 = _1629 * _1633;
        float _1637 = fma(_1605, _1635, _1130);
        float _1639 = fma(_1615, _1635, _1128);
        float _1641 = fma(_1619, _1635, _1132);
        _1591 = _1637;
        _1587 = _1639;
        _1583 = _1641;
    }
    float _1643 = _1591;
    float _1645 = _1587;
    float _1647 = _1583;
    float _1649 = _1643 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1651 = _1643 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1653 = _1643 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1655 = _1575 + _1577;
    float _1657 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1649);
    float _1659 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1651);
    float _1661 = _1643 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1663 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1653);
    float _1665 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1657);
    float _1667 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1659);
    float _1669 = 1.0 / _1577;
    float _1671 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1661);
    float _1673 = _1665 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1675 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1663);
    float _1677 = _1667 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1679 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1671);
    float _1681 = _1673 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1683 = _1673 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1685 = _1673 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1687 = _1673 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1689 = _1675 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1691 = fma(_1677, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1681);
    float _1693 = fma(_1677, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1683);
    float _1695 = fma(_1677, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1685);
    float _1697 = fma(_1677, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1687);
    float _1699 = _1679 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1701 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1691);
    float _1703 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1693);
    float _1705 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1695);
    float _1707 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1697);
    float _1709 = fma(_1699, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1701);
    float _1711 = fma(_1699, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1703);
    float _1713 = fma(_1699, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1705);
    float _1715 = fma(_1699, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1707);
    float _1717 = _1655 * _1669;
    float _1719 = _1717 * 0.5;
    float _1721 = _1699;
    float _1723 = _1669;
    float _1725 = _1705;
    if (_1515)
    {
        _1721 = 1.0;
    }
    float _1727 = _1721;
    float _1729 = _1727;
    if (!_1515)
    {
        float _1731 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1733 = _1731 * 0.15915493667125701904296875;
        float _1735 = _1733 * 6.283185482025146484375;
        float _1737 = cos(_1735);
        float _1739 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1741 = _1739 * 0.15915493667125701904296875;
        float _1743 = _1733 * 6.283185482025146484375;
        float _1745 = sin(_1743);
        float _1747 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1749 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1747);
        float _1751 = 1.0 / _1737;
        float _1753 = _1741 * 6.283185482025146484375;
        float _1755 = cos(_1753);
        float _1757 = _1745 * _1751;
        float _1759 = 1.0 / _1749;
        float _1761 = _1755 * _1757;
        float _1763 = _1741 * 6.283185482025146484375;
        float _1765 = sin(_1763);
        float _1767 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1769 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1767;
        float _1771 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1773 = _1759 * _1771;
        float _1775 = 1.0 / _1761;
        float _1777 = 1.0 / _1769;
        float _1779 = _1765 * _1775;
        float _1781 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1783 = fma(_1779, _1773, _1781);
        float _1785 = _1783 * _1777;
        float _1787 = precise::clamp(_1785, 0.0, 1.0);
        _1723 = _1777;
        _1725 = _1779;
        _1729 = _1787;
    }
    float _1789 = _1723;
    float _1791 = _1725;
    float _1793 = _1729;
    float _1795 = abs(_1455);
    bool _1797 = _1795 != 0.0;
    bool _1799 = isnan(_1795);
    bool _1801 = _1797 || _1799;
    bool _1803 = isnan(0.0);
    bool _1805 = _1801 || _1803;
    out.gl_Position.x = _1711;
    out.gl_Position.y = _1709;
    out.gl_Position.z = _1713;
    out.gl_Position.w = _1715;
    float _1807 = _1789;
    if (!_1805)
    {
        out.gl_Position.w = 0.0;
    }
    if (_1805)
    {
        _1527 = _1715;
    }
    float _1809 = _1527;
    float _1811 = _1809;
    if (!_1805)
    {
        _1811 = 0.0;
    }
    float _1813 = _1811;
    float _1815 = _1813;
    if (!_1370)
    {
        int _1817 = _1390 << 4;
        int _1819 = _1817 + 2048;
        uint _1821 = uint(int(uint(_1819) >> uint(2)));
        uint _1823 = uint(int(uint(int(_1821)) >> uint(2)));
        int _1825 = int(_1821) & 3;
        float _1827 = (*spvDescriptorSet0.vp_c15)._m0[int(_1823)][_1825];
        int _1829 = int(_1821) + 1;
        uint _1831 = uint(int(uint(_1829) >> uint(2)));
        int _1833 = _1829 & 3;
        float _1835 = (*spvDescriptorSet0.vp_c15)._m0[int(_1831)][_1833];
        int _1837 = _1819 + 8;
        uint _1839 = uint(int(uint(_1837) >> uint(2)));
        uint _1841 = uint(int(uint(int(_1839)) >> uint(2)));
        int _1843 = int(_1839) & 3;
        float _1845 = (*spvDescriptorSet0.vp_c15)._m0[int(_1841)][_1843];
        int _1847 = int(_1839) + 1;
        uint _1849 = uint(int(uint(_1847) >> uint(2)));
        int _1851 = _1847 & 3;
        float _1853 = (*spvDescriptorSet0.vp_c15)._m0[int(_1849)][_1851];
        float _1855 = _1320 * _1835;
        float _1857 = fma(_1128, _1827, _1855);
        float _1859 = fma(_1132, _1845, _1857);
        float _1861 = _1859 + _1853;
        float _1863 = precise::clamp(_1861, 0.0, 1.0);
        float _1865 = -_1863;
        float _1867 = _1865 + _1473;
        float _1869 = fma(_1867, 500.0, 1.5);
        float _1871 = exp2(_1869);
        float _1873 = 0.0 + _1871;
        float _1875 = precise::clamp(_1873, 0.0, 1.0);
        bool _1877 = _1875 >= 1.0;
        bool _1879 = isnan(_1875);
        bool _1881 = _1877 || _1879;
        bool _1883 = isnan(1.0);
        bool _1885 = _1881 || _1883;
        _1807 = _1845;
        if (!_1885)
        {
            out.gl_Position.w = 0.0;
        }
        if (!_1885)
        {
            _1815 = 0.0;
        }
    }
    float _1887 = _1815;
    float _1889 = _1807;
    float _1891 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1893 = _1643 + _1891;
    float _1895 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1897 = _1645 + _1895;
    float _1899 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1901 = _1647 + _1899;
    float _1903 = _1689 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1905 = _1893 * _1893;
    float _1907 = 1.0 / _1887;
    float _1909 = fma(_1897, _1897, _1905);
    float _1911 = fma(_1901, _1901, _1909);
    float _1913 = rsqrt(_1911);
    float _1915 = _1709 * _1907;
    float _1917 = _1913 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1919 = _1897 * _1917;
    float _1921 = _1901 * _1917;
    float _1923 = _1919 * _1919;
    float _1925 = _1921 * _1921;
    float _1927 = _1923 + _1925;
    float _1929 = sqrt(_1927);
    bool _1931 = _1929 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1933 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1935 = _1929 + _1933;
    float _1937 = _1901;
    float _1939 = _1927;
    float _1941 = _1935;
    float _1943 = _1889;
    float _1945 = _1893;
    float _1947 = _1919;
    if (_1931)
    {
        float _1949 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1937 = _1949;
    }
    float _1951 = _1937;
    if (_1931)
    {
        float _1953 = rsqrt(_1927);
        _1939 = _1953;
    }
    float _1955 = _1939;
    if (_1931)
    {
        float _1957 = _1935 * _1951;
        _1941 = _1957;
    }
    float _1959 = _1941;
    if (_1931)
    {
        float _1961 = _1959 * 0.15915493667125701904296875;
        _1943 = _1961;
    }
    float _1963 = _1943;
    float _1965 = _1913;
    float _1967 = _1963;
    if (_1931)
    {
        float _1969 = _1963 * 6.283185482025146484375;
        float _1971 = sin(_1969);
        _1965 = _1971;
    }
    float _1973 = _1965;
    float _1975 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1977 = precise::max(0.0, _1975);
    float _1979 = _1791;
    float _1981 = _1975;
    float _1983 = _1977;
    if (_1931)
    {
        float _1985 = _1963 * 6.283185482025146484375;
        float _1987 = cos(_1985);
        _1979 = _1987;
    }
    float _1989 = _1979;
    float _1991 = -_1917;
    float _1993 = -_1977;
    float _1995 = fma(_1893, _1991, _1993);
    if (_1931)
    {
        float _1997 = _1995 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1981 = _1997;
    }
    float _1999 = _1981;
    float _2001 = _1973;
    if (_1931)
    {
        float _2003 = fma(_1973, _1999, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1983 = _2003;
    }
    float _2005 = _1983;
    float _2007 = _2005;
    if (!_1931)
    {
        _2001 = _1995;
    }
    float _2009 = _2001;
    float _2011 = sqrt(_1911);
    float _2013 = _2009;
    float _2015 = _1989;
    if (_1931)
    {
        float _2017 = _1989 + (-1.0);
        _1945 = _2017;
    }
    float _2019 = _1945;
    float _2021 = _2019;
    if (_1931)
    {
        float _2023 = _1955 * _2005;
        _1967 = _2023;
    }
    float _2025 = _1967;
    if (!_1931)
    {
        _2007 = _1921;
    }
    float _2027 = _2007;
    float _2029 = _2027;
    if (_1931)
    {
        float _2031 = _2019 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2021 = _2031;
    }
    float _2033 = _2021;
    float _2035 = _2033;
    if (_1931)
    {
        float _2037 = _1919 * _2025;
        _1947 = _2037;
    }
    float _2039 = _1947;
    if (_1931)
    {
        float _2041 = _1921 * _2025;
        _2029 = _2041;
    }
    float _2043 = _2029;
    if (_1931)
    {
        float _2045 = fma(_1995, _1989, _2033);
        _2013 = _2045;
    }
    float _2047 = _2013;
    if (!_1931)
    {
        _2035 = _1923;
    }
    float _2049 = _2035;
    float _2051 = _2049;
    if (_1931)
    {
        float _2053 = _2039 * _2039;
        _2051 = _2053;
    }
    float _2055 = _2051;
    if (!_1931)
    {
        _2015 = _1925;
    }
    float _2057 = _2015;
    float _2059 = _2057;
    if (_1931)
    {
        float _2061 = _2043 * _2043;
        _2059 = _2061;
    }
    float _2063 = _2059;
    float _2065 = fma(_2047, _2047, _2055);
    float _2067 = fma(_1915, -0.5, 0.5);
    float _2069 = _2065 + _2063;
    float _2071 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2073 = fma(_2011, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2071);
    float _2075 = precise::clamp(_2073, 0.0, 1.0);
    float _2077 = -_2075;
    float _2079 = _2077 + 1.0;
    float _2081 = rsqrt(_2069);
    float _2083 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2085 = -_1903;
    float _2087 = fma(_2085, _2083, 1.0);
    float _2089 = abs(_2079);
    float _2091 = log2(_2089);
    float _2093 = _2081 * _2039;
    float _2095 = _2081 * _2047;
    float _2097 = _2081 * _2043;
    float _2099 = log2(_2087);
    float _2101 = _2093 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2103 = -_2101;
    float _2105 = fma(_2095, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2103);
    float _2107 = _2091 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2109 = -_2097;
    float _2111 = fma(_2109, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2105);
    float _2113 = exp2(_2107);
    float _2115 = _2095 + 1.0;
    float _2117 = fma(_2111, -0.5, 0.5);
    float _2119 = fma(_2111, 0.5, 0.5);
    float _2121 = _2099 * 0.693147182464599609375;
    float _2123 = fma(_2119, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2125 = sqrt(_2117);
    float _2127 = _2121 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2129 = fma(_2119, _2123, -0.212114393711090087890625);
    float _2131 = _1711 * _1907;
    float _2133 = -_2095;
    float _2135 = fma(_2113, _2115, _2133);
    float _2137 = fma(_2119, _2129, 1.570728778839111328125);
    float _2139 = fma(_2131, 0.5, 0.5);
    float _2141 = fma(_2135, 0.5, 0.5);
    float _2143 = _2125 * 0.636619746685028076171875;
    float3 _5819 = float3(_2139, _2067, _2127);
    float _2145 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5819, float3(0.0), isnan(_5819)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5819, float3(0.0), isnan(_5819)), level(0.0)).x;
    float3 _5828 = float3(_2139, _2067, _2127);
    float4 _2148 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5828, float3(0.0), isnan(_5828)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5828, float3(0.0), isnan(_5828)), level(0.0)).xyzw;
    float _2150 = _2148.x;
    float _2152 = _2148.y;
    float _2154 = _2148.z;
    float _2156 = _2148.w;
    float _2158 = -_2137;
    float _2160 = fma(_2143, _2158, 1.0);
    float2 _5849 = float2(_2160, _2141);
    float3 _2164 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5849, float2(0.0), isnan(_5849)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5849, float2(0.0), isnan(_5849)), level(0.0)).xyz;
    float _2166 = _2164.x;
    float _2168 = _2164.y;
    float _2170 = _2164.z;
    float _2172 = _2091 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2174 = _1318 * _1793;
    float _2176 = _1713 + _1715;
    bool _2178 = _2011 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2180 = isnan(_2011);
    bool _2182 = _2178 || _2180;
    bool _2184 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2186 = _2182 || _2184;
    float _2188 = _2174 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2190 = exp2(_2172);
    float _2192 = _2176 * 0.5;
    float _2194 = _266 * _2188;
    out.m_81.z = _2192;
    out.m_81.w = _1715;
    float _2196 = -_2190;
    float _2198 = _2196 + 1.0;
    float _2200 = _2190;
    if (!_2186)
    {
        _2200 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2202 = _2200;
    float _2204 = _2198 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2206 = _2204 * _2145;
    float _2208 = -_2204;
    float _2210 = _2208 + 1.0;
    float _2212 = _2156 * _2206;
    float _2214 = _2156 * _2210;
    float _2216 = _2210;
    float _2218 = _2212;
    float _2220 = _2202;
    float _2222 = _2202;
    if (!_2186)
    {
        _2216 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2224 = _2216;
    float _2226 = _2170 * _2206;
    float _2228 = fma(_2166, _2212, _2150);
    float _2230 = fma(_2168, _2212, _2152);
    float _2232 = _2224;
    float _2234 = _2224;
    if (!_2186)
    {
        _2218 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2236 = _2218;
    float _2238 = fma(_2156, _2226, _2154);
    out.m_83.x = _2228;
    out.m_83.y = _2230;
    out.m_83.z = _2238;
    out.m_83.w = _2214;
    bool _2240 = !_2186;
    float _2242 = _2236;
    float _2244 = _2236;
    if (!_2240)
    {
        bool _2246 = _2011 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2248 = isnan(_2011);
        bool _2250 = _2246 || _2248;
        bool _2252 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2254 = _2250 || _2252;
        if (!_2254)
        {
            float _2256 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2258 = _2011 + _2256;
            float _2260 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2262 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2260;
            float _2264 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2266 = _2264 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2268 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2270 = _2268 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2272 = 1.0 / _2262;
            float _2274 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2276 = _2274 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2278 = _2258 * _2272;
            float _2280 = precise::clamp(_2278, 0.0, 1.0);
            float _2282 = fma(_2280, _2266, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2284 = fma(_2280, _2270, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2286 = fma(_2280, _2276, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _2222 = _2284;
            _2244 = _2282;
            _2234 = _2286;
            _2288 = true;
        }
        else
        {
            bool _2290 = _2011 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2292 = isnan(_2011);
            bool _2294 = _2290 || _2292;
            bool _2296 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2298 = _2294 || _2296;
            if (!_2298)
            {
                _2242 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2300 = _2242;
            _2244 = _2300;
            if (!_2298)
            {
                _2220 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2302 = _2220;
            _2222 = _2302;
            if (!_2298)
            {
                _2232 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2304 = _2232;
            bool _2306 = !_2298;
            _2234 = _2304;
            if (!_2306)
            {
                bool _2308 = _2011 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2310 = isnan(_2011);
                bool _2312 = _2308 || _2310;
                bool _2314 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2316 = _2312 || _2314;
                if (!_2316)
                {
                    float _2318 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2320 = _2011 + _2318;
                    float _2322 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2324 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2322;
                    float _2326 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2328 = _2326 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2330 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2332 = _2330 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2334 = 1.0 / _2324;
                    float _2336 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2338 = _2336 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2340 = _2320 * _2334;
                    float _2342 = precise::clamp(_2340, 0.0, 1.0);
                    float _2344 = fma(_2342, _2328, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2346 = fma(_2342, _2332, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2348 = fma(_2342, _2338, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _2222 = _2346;
                    _2244 = _2344;
                    _2234 = _2348;
                    _2288 = true;
                }
                else
                {
                    _2222 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2244 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2234 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _2288 = false;
    float _2350 = _2222;
    float _2352 = _2244;
    float _2354 = _2234;
    float _2356 = _2194 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_85.x = 0.0;
    float _2358 = _2350 * 0.586610972881317138671875;
    bool _2360 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_56.x = _2356;
    float _2362 = fma(_2352, 0.298911988735198974609375, _2358);
    bool _2364 = _1793 > 0.0;
    bool _2366 = isnan(_1793);
    bool _2368 = _2364 || _2366;
    bool _2370 = isnan(0.0);
    bool _2372 = _2368 || _2370;
    float _2374 = fma(_2354, 0.114477999508380889892578125, _2362);
    float _2376 = -_2374;
    float _2378 = _2376 + _2352;
    float _2380 = -_2374;
    float _2382 = _2380 + _2350;
    float _2384 = -_2374;
    float _2386 = _2384 + _2354;
    float _2388 = fma(_2378, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2374);
    float _2390 = fma(_2382, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2374);
    float _2392 = fma(_2386, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2374);
    bool _2394 = !_2360;
    if (!_2394)
    {
        float _2396 = -_1643;
        float _2398 = _2396 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2400 = -_1645;
        float _2402 = _2400 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2404 = -_1647;
        float _2406 = _2404 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2408 = _2398 * _2398;
        float _2410 = fma(_2402, _2402, _2408);
        float _2412 = fma(_2406, _2406, _2410);
        float _2414 = sqrt(_2412);
        float _2416 = rsqrt(_2412);
        float _2418 = -_2414;
        float _2420 = _2418 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2422 = _2420 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2424 = precise::clamp(_2422, 0.0, 1.0);
        float _2426 = _2402 * _2416;
        float _2428 = _2398 * _2416;
        float _2430 = abs(_2424);
        float _2432 = log2(_2430);
        float _2434 = _2406 * _2416;
        float _2436 = _2426 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2438 = _1056 * _2428;
        float _2440 = -_2428;
        float _2442 = -_2436;
        float _2444 = fma(_2440, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2442);
        float _2446 = fma(_1054, _2426, _2438);
        float _2448 = -_2434;
        float _2450 = fma(_2448, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2444);
        float _2452 = fma(_1068, _2434, _2446);
        float _2454 = precise::clamp(_2452, 0.0, 1.0);
        float _2456 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2458 = _2450 + _2456;
        float _2460 = _2432 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2462 = _2458 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2464 = precise::clamp(_2462, 0.0, 1.0);
        float _2466 = exp2(_2460);
        float _2468 = _2466 * _2464;
        float _2470 = _2454 * _2468;
        float _2472 = _2470 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2474 = _2470 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2476 = _2470 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_85.x = _2472;
        out.m_85.y = _2474;
        out.m_85.z = _2476;
    }
    out.m_87.x = _2388;
    out.m_87.y = _2390;
    out.m_87.z = _2392;
    if (_2372)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_56.x = 0.0;
    float _2478 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2478;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2288 = false;
    bool _1182 = false;
    bool _1170 = false;
    bool _626 = false;
    bool _478 = false;
    bool _286 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_53.w;
    float _103 = trunc(_101);
    int _106 = int(_103);
    bool _110 = _106 >= 1;
    float _112 = 0.0;
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _112;
    float _116 = _114;
    if (!_110)
    {
        out.m_56.x = 0.0;
    }
    int _118 = 0;
    if (!_110)
    {
        float _120 = _114 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2535 = as_type<float>(_122);
        out.gl_Position.z = _2535;
    }
    if (!_110)
    {
        return out;
    }
    float _126 = in.m_58.w;
    bool _128 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_126);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = -_126;
    float _140 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _142 = 0.0;
    if (_136)
    {
        float _144 = float(_106);
        _142 = _144;
    }
    float _146 = _142;
    bool _148 = _140 >= _146;
    bool _150 = !_136;
    bool _152 = _148 || _150;
    if (_152)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _116;
    if (_152)
    {
        out.m_56.x = 0.0;
    }
    if (_152)
    {
        float _156 = _154 * 5.0;
        _124 = as_type<int>(_156);
    }
    int _158 = _124;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2603 = as_type<float>(_158);
        out.gl_Position.z = _2603;
    }
    if (_152)
    {
        return out;
    }
    float _160 = as_type<float>(int(gl_VertexIndex));
    float _162 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _164 = _140 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _166 = in.m_63.x;
    float _168 = _164 * _162;
    int _170 = as_type<int>(_160) & 1;
    bool _172 = _170 != 0;
    int _174 = as_type<int>(_160) & 2;
    bool _176 = _174 != 0;
    float _178 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[20].x, _168);
    bool _180 = !_176;
    float _182 = _180 ? (-0.5) : 0.5;
    int _184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _186 = _184 != 0;
    int _188 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _190 = _188 != 0;
    float _192 = _178 * 6.283185482025146484375;
    float _194 = floor(_178);
    float _196 = _192 * 0.15915493667125701904296875;
    bool _198 = !_172;
    float _200 = _198 ? (-0.5) : 0.5;
    int _202 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _204 = _202 != 0;
    bool _206 = !_186;
    int _208 = _206 ? 0 : 1;
    float _210 = _196 * 6.283185482025146484375;
    float _212 = cos(_210);
    bool _214 = !_204;
    int _216 = _214 ? 0 : 1;
    int _218 = abs(_208);
    int _220 = abs(_216);
    float _222 = -_194;
    float _224 = _178 + _222;
    float _226 = float(_218);
    float _228 = -_224;
    float _230 = fma(_228, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _232 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _234 = !_190;
    int _236 = _234 ? 0 : 1;
    float _238 = fma(_212, 0.5, 0.5);
    float _240 = abs(_230);
    float _242 = _226 * _240;
    bool _244 = _224 < 0.5;
    float _246 = float(_244);
    int _248 = abs(_236);
    float _250 = -_238;
    float _252 = fma(_250, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _254 = float(_220);
    float _256 = -_246;
    float _258 = fma(_256, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _260 = float(_248);
    float _262 = fma(_254, _252, _242);
    float _264 = abs(_258);
    float _266 = fma(_260, _264, _262);
    bool _268 = !_232;
    float _284;
    if (!_268)
    {
        float _270 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _272 = _166 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _274 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[12].x, _140);
        float _276 = _274 * _270;
        float _278 = floor(_276);
        float _280 = -_278;
        float _282 = _276 + _280;
        _284 = _282;
        _286 = true;
    }
    else
    {
        float _288 = float(_106);
        float _290 = 1.0 / _288;
        float _292 = _140 * _290;
        _284 = _292;
    }
    _286 = false;
    float _294 = _284;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _298 = _294 + _296;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _302 = _294 + _300;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _306 = _294 + _304;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _308;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _314 = _312 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _318 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _316;
    bool _320 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _322 = isnan(_294);
    bool _324 = _320 || _322;
    bool _326 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _328 = _324 || _326;
    float _330 = float(_328);
    bool _332 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _334 = 1.0 / _310;
    float _336 = 1.0 / _318;
    float _338 = 1.0 / _314;
    float _340 = _298 * _334;
    bool _342 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _344 = isnan(_294);
    bool _346 = _342 || _344;
    bool _348 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _350 = _346 || _348;
    float _352 = float(_350);
    float _354 = -_330;
    float _356 = _354 + 1.0;
    bool _358 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _360 = isnan(_294);
    bool _362 = _358 || _360;
    bool _364 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _366 = _362 || _364;
    float _368 = float(_366);
    float _370 = _352 * _356;
    float _372 = _302 * _336;
    float _374 = -_352;
    float _376 = _374 + 1.0;
    float _378 = _368 * _376;
    float _380 = -_368;
    float _382 = _380 + 1.0;
    float _384 = _306 * _338;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _388 = _386 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _390 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _392 = isnan(_294);
    bool _394 = _390 || _392;
    bool _396 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _398 = _394 || _396;
    float _400 = float(_398);
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _402;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _406;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _414 = fma(_404, _340, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _416 = _400 * _382;
    float _418 = fma(_408, _340, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _420 = fma(_388, _384, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _422 = fma(_412, _384, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _424 = -_400;
    float _426 = _424 + 1.0;
    float _428 = _414 * _416;
    float _430 = _418 * _416;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _432;
    float _436 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[143].x, _428);
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _438;
    float _442 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[143].y, _430);
    float _444 = fma(_434, _372, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _446 = fma(_420, _378, _436);
    float _448 = fma(_440, _372, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _450 = fma(_422, _378, _442);
    float _452 = fma(_444, _370, _446);
    float _454 = fma(_448, _370, _450);
    float _456 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[146].x, _452);
    float _458 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[146].y, _454);
    bool _460 = !_332;
    float _476;
    if (!_460)
    {
        float _462 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _464 = _166 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _466 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[11].y, _140);
        float _468 = _466 * _462;
        float _470 = floor(_468);
        float _472 = -_470;
        float _474 = _468 + _472;
        _476 = _474;
        _478 = true;
    }
    else
    {
        float _480 = float(_106);
        float _482 = 1.0 / _480;
        float _484 = _140 * _482;
        _476 = _484;
    }
    _478 = false;
    float _486 = _476;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _490 = _486 + _488;
    float _492 = in.m_65.x;
    float _494 = in.m_65.y;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _498 = _496 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _500 = _486 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _502 = isnan(_486);
    bool _504 = _500 || _502;
    bool _506 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _508 = _504 || _506;
    float _510 = float(_508);
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _514 = _512 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _516 = _486 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _518 = isnan(_486);
    bool _520 = _516 || _518;
    bool _522 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _524 = _520 || _522;
    float _526 = float(_524);
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _528;
    bool _532 = _486 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _534 = isnan(_486);
    bool _536 = _532 || _534;
    bool _538 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _540 = _536 || _538;
    float _542 = float(_540);
    float _544 = 1.0 / _498;
    float _546 = -_510;
    float _548 = _546 + 1.0;
    bool _550 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _552 = _526 * _548;
    float _554 = -_526;
    float _556 = _554 + 1.0;
    float _558 = 1.0 / _514;
    float _560 = _530 * _544;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _564 = _562 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _566 = _458 * _494;
    float _568 = _456 * _492;
    float _570 = fma(_560, _490, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _572 = -_542;
    float _574 = _572 + 1.0;
    float _576 = _570 * _552;
    float _578 = _564 * _558;
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _582 = _486 + _580;
    float _584 = _510 * _574;
    float _586 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[115].x, _576);
    float _588 = fma(_578, _582, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _590 = fma(_588, _584, _586);
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _594 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _596 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[117].x, _590);
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _600 = _592 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _602 = _594 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _604 = _596 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _606 = _598 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_67.x = _600;
    out.m_67.y = _602;
    out.m_67.z = _606;
    out.m_67.w = _604;
    bool _608 = !_550;
    float _624;
    if (!_608)
    {
        float _610 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _612 = _166 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _614 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[11].w, _140);
        float _616 = _614 * _610;
        float _618 = floor(_616);
        float _620 = -_618;
        float _622 = _616 + _620;
        _624 = _622;
        _626 = true;
    }
    else
    {
        float _628 = float(_106);
        float _630 = 1.0 / _628;
        float _632 = _140 * _630;
        _624 = _632;
    }
    _626 = false;
    float _634 = _624;
    float _636 = in.m_53.x;
    float _638 = in.m_53.y;
    float _640 = in.m_53.z;
    float _642 = in.m_69.x;
    float _644 = in.m_69.y;
    float _646 = in.m_69.z;
    float _648 = in.m_69.w;
    int _650 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _652 = _650 != 0;
    int _654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _656 = _654 != 0;
    float _658 = in.m_71.x;
    float _660 = in.m_71.y;
    float _662 = in.m_71.z;
    float _664 = in.m_71.w;
    float _666 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _668 = _166 > 0.5;
    float _670 = in.m_73.x;
    float _672 = in.m_73.y;
    float _674 = in.m_73.z;
    float _676 = in.m_73.w;
    float _678 = in.m_63.y;
    float _680 = in.m_63.z;
    float _682 = _638 * _644;
    float _684 = _566 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _686 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _182);
    float _688 = _638 * _660;
    float _690 = _166 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _692 = fma(_636, _642, _682);
    float _694 = _684 * _686;
    float _696 = _638 * _672;
    float _698 = _568 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _700 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _200);
    float _702 = -_666;
    float _704 = fma(_690, 2.0, _702);
    float _706 = fma(_636, _670, _696);
    float _708 = _698 * _700;
    float _710 = fma(_636, _658, _688);
    float _712 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _714 = _678 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _716 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _718 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _720 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[78].z, _712);
    float _722 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[79].z, _716);
    float _724 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _726 = fma(_714, -2.0, _718);
    float _728 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _730 = _728 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _732 = -_200;
    int _734 = _668 ? as_type<int>(_732) : as_type<int>(_200);
    float _736 = fma(_640, _662, _710);
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _740 = _738 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _742 = _678 > 0.5;
    float _744 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[78].w, _724);
    bool _746 = !_652;
    float _748 = _746 ? _200 : as_type<float>(_734);
    float _750 = _200 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _752 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _754 = _752 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _756 = 1.0 / _730;
    float _758 = _182 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _760 = fma(_640, _646, _692);
    float _762 = fma(_640, _674, _706);
    float _764 = _758 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _766 = _758 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _768 = _758 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _770 = 1.0 / _740;
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _774 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _772;
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _778 = _776 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _780 = -_182;
    int _782 = _742 ? as_type<int>(_780) : as_type<int>(_182);
    float _784 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[24].x, _764);
    bool _786 = _634 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _788 = isnan(_634);
    bool _790 = _786 || _788;
    bool _792 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _794 = _790 || _792;
    float _796 = float(_794);
    float _798 = _736 + _664;
    bool _800 = !_656;
    float _802 = _800 ? _182 : as_type<float>(_782);
    float _804 = 1.0 / _754;
    float _806 = _774 * _756;
    float _808 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[79].x, _722);
    float _810 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[25].x, _766);
    bool _812 = _634 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _814 = isnan(_634);
    bool _816 = _812 || _814;
    bool _818 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _820 = _816 || _818;
    float _822 = float(_820);
    float _824 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].z, _720);
    float _826 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[76].y, _726);
    float _828 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _830 = _634 + _828;
    float _832 = _778 * _770;
    float _834 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _836 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _834;
    bool _838 = _634 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _840 = isnan(_634);
    bool _842 = _838 || _840;
    bool _844 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _846 = _842 || _844;
    float _848 = float(_846);
    float _850 = -_140;
    float _852 = fma(_850, (*spvDescriptorSet0.vp_c9)._m0[76].x, _704);
    float _854 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].w, _744);
    bool _856 = _634 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _858 = isnan(_634);
    bool _860 = _856 || _858;
    bool _862 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _864 = _860 || _862;
    float _866 = float(_864);
    float _868 = _808 * (-0.15915493667125701904296875);
    float _870 = -_848;
    float _872 = _870 + 1.0;
    float _874 = _836 * _804;
    float _876 = -_796;
    float _878 = _876 + 1.0;
    float _880 = fma(_806, _830, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _882 = _866 * _872;
    float _884 = _760 + _648;
    float _886 = _822 * _878;
    float _888 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _890 = _634 + _888;
    float _892 = _798 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    float _894 = _868 * 6.283185482025146484375;
    float _896 = sin(_894);
    float _898 = _880 * _882;
    float _900 = fma(_832, _890, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _902 = _762 + _676;
    float _904 = _884 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    float _906 = _892 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _908 = _892 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _910 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[26].x, _768);
    float _912 = _868 * 6.283185482025146484375;
    float _914 = cos(_912);
    float _916 = _902 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    float _918 = fma(_904, (*spvDescriptorSet0.vp_c12)._m0[6].y, _906);
    float _920 = -_822;
    float _922 = _920 + 1.0;
    float _924 = _694 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _926 = _694 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _928 = _694 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _930 = -_866;
    float _932 = _930 + 1.0;
    float _934 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _936 = fma(_904, (*spvDescriptorSet0.vp_c12)._m0[6].x, _908);
    float _938 = fma(_916, (*spvDescriptorSet0.vp_c12)._m0[8].y, _918);
    float _940 = _848 * _922;
    float _942 = fma(_708, (*spvDescriptorSet0.vp_c8)._m0[24].x, _924);
    float _944 = fma(_708, (*spvDescriptorSet0.vp_c8)._m0[25].x, _926);
    float _946 = fma(_708, (*spvDescriptorSet0.vp_c8)._m0[26].x, _928);
    float _948 = fma(_932, (*spvDescriptorSet0.vp_c9)._m0[131].x, _898);
    float _950 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _952 = fma(_916, (*spvDescriptorSet0.vp_c12)._m0[8].x, _936);
    float _954 = _938 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _956 = fma(_900, _940, _948);
    float _958 = _802 * _896;
    float _960 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _962 = _634 + _960;
    float _964 = _802 * _914;
    float _966 = _892 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    float _968 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _970 = _952 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _972 = _954 * _934;
    float _974 = -_958;
    float _976 = fma(_748, _914, _974);
    float _978 = fma(_874, _962, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _980 = fma(_904, (*spvDescriptorSet0.vp_c12)._m0[6].z, _966);
    float _982 = fma(_748, _896, _964);
    float _984 = fma(_972, 0.5, 0.5);
    float _986 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _988 = _970 * _950;
    float _990 = fma(_916, (*spvDescriptorSet0.vp_c12)._m0[8].z, _980);
    float _992 = fma(_978, _886, _956);
    float _994 = fma(_988, 0.5, 0.5);
    float _996 = _990 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    float _998 = fma(_796, (*spvDescriptorSet0.vp_c9)._m0[134].x, _992);
    float _1000 = floor(_984);
    float _1002 = _996 * _968;
    float _1004 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1006 = -_824;
    float _1008 = _1006 + 1.0;
    float _1010 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1012 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1014 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1016 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1018 = fma(_1002, 0.5, 0.5);
    float _1020 = _986 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1022 = _1010 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1024 = _1012 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1026 = _1016 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1028 = _976 + 0.5;
    float _1030 = floor(_994);
    float _1032 = -_1000;
    float _1034 = _984 + _1032;
    float _1036 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[24].z, _942);
    float _1038 = _982 + (-0.5);
    float _1040 = fma(_1020, _1028, _852);
    float _1042 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[25].z, _944);
    float _1044 = fma(_1034, 2.0, -1.0);
    float _1046 = floor(_1018);
    float _1048 = _1014 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1050 = -_854;
    float _1052 = _1050 + 1.0;
    float _1054 = _784 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _1056 = _810 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _1058 = -_1048;
    float _1060 = -_826;
    float _1062 = fma(_1058, _1038, _1060);
    float _1064 = -_1008;
    float _1066 = fma(_976, _1064, _1040);
    float _1068 = _910 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _1070 = -_1030;
    float _1072 = _994 + _1070;
    float _1074 = _1044 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _1076 = _998 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1078 = fma(_982, _1052, _1062);
    float _1080 = fma(_1072, 2.0, -1.0);
    float _1082 = _1074 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    out.m_75.x = _1054;
    out.m_75.y = _1056;
    out.m_75.z = _1068;
    float _1084 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[26].z, _946);
    float _1086 = _1080 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _1088 = -_1046;
    float _1090 = _1018 + _1088;
    out.m_77.x = _1022;
    out.m_77.y = _1024;
    out.m_77.z = _1026;
    out.m_77.w = _1076;
    float _1092 = _1036 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1094 = fma(_1086, (*spvDescriptorSet0.vp_c12)._m0[2].x, _1082);
    float _1096 = fma(_1090, 2.0, -1.0);
    float _1098 = _1084 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    out.m_79.x = _1066;
    out.m_79.y = _1078;
    bool _1100 = (*spvDescriptorSet0.vp_c12)._m0[10].x != 1.0;
    bool _1102 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _1104 = _1100 || _1102;
    bool _1106 = isnan(1.0);
    bool _1108 = _1104 || _1106;
    float _1110 = _1074 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _1112 = _1074 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    float _1114 = _1096 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _1116 = fma(_1086, (*spvDescriptorSet0.vp_c12)._m0[2].y, _1110);
    float _1118 = fma(_1086, (*spvDescriptorSet0.vp_c12)._m0[2].z, _1112);
    float _1120 = fma(_1114, (*spvDescriptorSet0.vp_c12)._m0[4].x, _1094);
    float _1122 = fma(_1114, (*spvDescriptorSet0.vp_c12)._m0[4].y, _1116);
    float _1124 = fma(_1114, (*spvDescriptorSet0.vp_c12)._m0[4].z, _1118);
    float _1126 = _1042 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1128 = _1120 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _1130 = _1122 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _1132 = _1124 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _1134 = _1092 + _1128;
    float _1136 = _1126 + _1130;
    float _1138 = _1098 + _1132;
    float _1140 = _1062;
    float _1142 = _1112;
    float _1144 = _1126;
    float _1146 = _1114;
    float _1148 = _1112;
    float _1150 = _1126;
    float _1152 = _1114;
    float _1154 = _1080;
    float _1156 = _1044;
    float _1158 = _1096;
    float _1160 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
    float _1162 = _1020;
    float _1164 = _994;
    float _1174;
    float _1176;
    float _1178;
    float _1180;
    if (!_1108)
    {
        bool _1166 = _1130 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _1168 = !_1166;
        _1170 = _1168;
        if (!_1170)
        {
            float _1172 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _1174 = _1172;
            _1176 = 0.0;
            _1178 = 0.0;
            _1180 = 0.0;
            _1182 = true;
        }
    }
    if ((!_1182) || _1170)
    {
        bool _1218;
        if (!_1170)
        {
            bool _1184 = _1130 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _1186 = isnan(_1130);
            bool _1188 = _1184 || _1186;
            bool _1190 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _1192 = _1188 || _1190;
            bool _1194 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _1196 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _1198 = !_1192;
            bool _1200 = _1196 && _1198;
            if (_1200)
            {
                _1140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _1202 = _1140;
            float _1204 = _1202;
            if (_1200)
            {
                _1142 = 0.0;
            }
            float _1206 = _1142;
            _1148 = _1206;
            _1176 = _1206;
            if (_1200)
            {
                _1144 = 0.0;
            }
            float _1208 = _1144;
            _1150 = _1208;
            _1178 = _1208;
            if (_1200)
            {
                float _1210 = _1202 * 5.0;
                _1204 = _1210;
            }
            float _1212 = _1204;
            _1174 = _1212;
            if (_1200)
            {
                _1146 = 0.0;
            }
            float _1214 = _1146;
            bool _1216 = !_1192;
            _1218 = _1216 && _1194;
            _1152 = _1214;
            _1180 = _1214;
        }
        if ((!_1218) || _1170)
        {
            _1170 = false;
            float _1220 = _1148;
            float _1222 = _1150;
            float _1224 = _1152;
            bool _1226 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _1228 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _1230 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _1232 = _1118;
            float _1234 = _1222;
            float _1236 = _1224;
            _1174 = _1138;
            if (_1226)
            {
                float _1238 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _1232 = _1238;
            }
            float _1240 = _1232;
            if (_1226)
            {
                float _1242 = abs(_1080);
                float _1244 = -_1242;
                float _1246 = _1244 + 1.0;
                _1154 = _1246;
            }
            float _1248 = _1154;
            if (_1228)
            {
                float _1250 = abs(_1044);
                float _1252 = -_1250;
                float _1254 = _1252 + 1.0;
                _1156 = _1254;
            }
            float _1256 = _1156;
            if (!_1226)
            {
                _1234 = 1.0;
            }
            float _1258 = _1234;
            float _1260 = _1258;
            if (_1230)
            {
                float _1262 = abs(_1096);
                float _1264 = -_1262;
                float _1266 = _1264 + 1.0;
                _1158 = _1266;
            }
            float _1268 = _1158;
            if (!_1228)
            {
                _1160 = 1.0;
            }
            float _1270 = _1160;
            float _1272 = _1270;
            if (!_1230)
            {
                _1236 = 1.0;
            }
            float _1274 = _1236;
            float _1276 = _1220;
            float _1278 = _1274;
            if (_1228)
            {
                float _1280 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _1276 = _1280;
            }
            float _1282 = _1276;
            float _1284 = _1066;
            if (_1230)
            {
                float _1286 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _1284 = _1286;
            }
            float _1288 = _1284;
            if (_1226)
            {
                float _1290 = _1248 * _1240;
                float _1292 = precise::clamp(_1290, 0.0, 1.0);
                _1260 = _1292;
            }
            float _1294 = _1260;
            if (_1228)
            {
                float _1296 = _1256 * _1282;
                float _1298 = precise::clamp(_1296, 0.0, 1.0);
                _1272 = _1298;
            }
            float _1300 = _1272;
            float _1302 = _1294 * _1300;
            _1176 = _1134;
            _1178 = _1136;
            if (_1230)
            {
                float _1304 = _1268 * _1288;
                float _1306 = precise::clamp(_1304, 0.0, 1.0);
                _1278 = _1306;
            }
            float _1308 = _1278;
            float _1310 = _1302 * _1308;
            _1180 = _1310;
        }
    }
    _1182 = false;
    float _1312 = _1174;
    float _1314 = _1176;
    float _1316 = _1178;
    float _1318 = _1180;
    float _1320 = _1130 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1322 = _1320 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1324 = _1320 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1326 = fma(_1132, 6.2500002968590706586837768554688e-05, 0.5);
    float _1328 = fma(_1128, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1322);
    float _1330 = fma(_1128, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1324);
    float _1332 = fma(_1132, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1328);
    float _1334 = fma(_1132, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1330);
    float _1336 = _1332 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1338 = _1334 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1340 = trunc(_1336);
    int _1342 = int(_1340);
    float _1344 = trunc(_1338);
    int _1346 = int(_1344);
    int _1348 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1350 = _1342 + _1348;
    int _1352 = _1350 + 1;
    bool _1354 = _1352 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1356 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1358 = _1346 + _1356;
    int _1360 = _1358 + 1;
    int _1362 = _1352 | _1360;
    bool _1364 = _1362 < 0;
    bool _1366 = _1364 || _1354;
    bool _1368 = _1360 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1370 = _1368 || _1366;
    int _1372 = _1352;
    int _1374 = _1362;
    int _1376 = _1360;
    float _1378 = _1314;
    float _1380 = _1316;
    float _1382 = _1312;
    float _1384 = _1326;
    if (!_1370)
    {
        int _1386 = _1360 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1388 = _1386 + _1352;
        _1372 = _1388;
    }
    int _1390 = _1372;
    float _1392 = _1134;
    if (!_1370)
    {
        float _1394 = floor(_1336);
        _1392 = _1394;
    }
    float _1396 = _1392;
    if (!_1370)
    {
        int _1398 = _1390 << 2;
        _1374 = _1398;
    }
    int _1400 = _1374;
    int _1402 = _1400;
    if (!_1370)
    {
        uint _1405 = uint(int(uint(_1390) >> uint(2)));
        _1376 = int(_1405);
    }
    int _1407 = _1376;
    float _1409 = as_type<float>(_1407);
    if (!_1370)
    {
        int _1411 = 12 & _1400;
        _1402 = _1411;
    }
    int _1413 = _1402;
    if (!_1370)
    {
        int _1415 = _1407 << 4;
        int _1417 = _1415 + _1413;
        _1162 = as_type<float>(_1417);
    }
    float _1419 = _1162;
    float _1421 = as_type<float>(_1413);
    if (!_1370)
    {
        float _1423 = floor(_1338);
        _1421 = _1423;
    }
    float _1425 = _1421;
    if (!_1370)
    {
        float _1427 = -_1396;
        float _1429 = _1336 + _1427;
        _1164 = _1429;
    }
    float _1431 = _1164;
    float _1433 = _1419;
    if (!_1370)
    {
        int _1435 = as_type<int>(_1419) + 400;
        uint _1437 = uint(int(uint(_1435) >> uint(2)));
        uint _1439 = uint(int(uint(int(_1437)) >> uint(2)));
        int _1441 = int(_1437) & 3;
        float _1443 = (*spvDescriptorSet0.vp_c15)._m0[int(_1439)][_1441];
        _1433 = _1443;
    }
    float _1445 = _1433;
    if (!_1370)
    {
        float _1447 = -_1425;
        float _1449 = _1338 + _1447;
        _1409 = _1449;
    }
    float _1451 = _1409;
    float _1453 = fma(_1128, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _4708 = float2(_1453, _1326);
    float _1455 = dm_bs(spvDescriptorSet0.vp_t_tcb_22.sample(spvDescriptorSet0.vp_t_tcb_22Smplr, select(_4708, float2(0.0), isnan(_4708)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_22, spvDescriptorSet0.vp_t_tcb_22Smplr_w, select(_4708, float2(0.0), isnan(_4708)), level(0.0)).x;
    float _1457 = 2.0;
    if (!_1370)
    {
        float _1459 = rint(_1445);
        float _1461 = precise::max(_1459, 0.0);
        uint _1463 = uint(_1461);
        uint _1465 = clamp(_1463, 0u, 65535u);
        _1457 = as_type<float>(_1465);
    }
    float _1467 = _1457;
    float _1469 = _1451;
    if (!_1370)
    {
        float3 _4742 = float3(_1431, _1451, float(as_type<int>(_1467)));
        float3 _4746 = select(_4742, float3(0.0), isnan(_4742));
        float _1471 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4746.xy, uint(rint(_4746.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4746.xy, uint(rint(_4746.z)), level(0.0)).x;
        _1469 = _1471;
    }
    float _1473 = _1469;
    float _1475 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1477 = _1312 + _1475;
    float _1479 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1481 = _1314 + _1479;
    float _1483 = _1130 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1485 = _1130 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1487 = _1477 * _1477;
    float _1489 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1483);
    float _1491 = fma(_1481, _1481, _1487);
    float _1493 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1485);
    bool _1495 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1497 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1499 = _1495 || _1497;
    bool _1501 = isnan(0.5);
    bool _1503 = _1499 || _1501;
    float _1505 = sqrt(_1491);
    bool _1507 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1509 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1511 = _1507 || _1509;
    bool _1513 = isnan(0.5);
    bool _1515 = _1511 || _1513;
    float _1517 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1489);
    float _1519 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1493);
    bool _1521 = _1505 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1523 = !_1521;
    float _1525 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1527 = _1455;
    if (!_1523)
    {
        float _1529 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1531 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1533 = _1505 + _1531;
        float _1535 = _1316 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1537 = rsqrt(_1491);
        float _1539 = _1533 * _1529;
        float _1541 = _1539 * 0.15915493667125701904296875;
        float _1543 = _1541 * 6.283185482025146484375;
        float _1545 = cos(_1543);
        float _1547 = _1541 * 6.283185482025146484375;
        float _1549 = sin(_1547);
        float _1551 = _1545 + (-1.0);
        float _1553 = _1551 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1555 = fma(_1549, _1535, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1557 = fma(_1545, _1316, _1553);
        float _1559 = _1537 * _1555;
        float _1561 = fma(_1481, _1559, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1563 = fma(_1477, _1559, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1378 = _1561;
        _1380 = _1557;
        _1525 = _1537;
        _1382 = _1563;
        _1384 = _1553;
    }
    float _1565 = _1378;
    float _1567 = _1380;
    float _1569 = _1525;
    float _1571 = _1382;
    float _1573 = _1384;
    float _1575 = _1517 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1577 = _1519 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1579 = _1569;
    float _1581 = _1573;
    float _1583 = _1571;
    if (_1503)
    {
        _1579 = _1565;
    }
    float _1585 = _1579;
    float _1587 = _1585;
    if (_1503)
    {
        _1581 = _1567;
    }
    float _1589 = _1581;
    float _1591 = _1589;
    if (!_1503)
    {
        float _1593 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1595 = _1130 + _1593;
        float _1597 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1599 = _1128 + _1597;
        float _1601 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1603 = -_1130;
        float _1605 = _1603 + _1567;
        float _1607 = _1595 * _1595;
        float _1609 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1611 = _1132 + _1609;
        float _1613 = -_1128;
        float _1615 = _1613 + _1565;
        float _1617 = -_1132;
        float _1619 = _1617 + _1571;
        float _1621 = fma(_1599, _1599, _1607);
        float _1623 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1625 = fma(_1611, _1611, _1621);
        float _1627 = sqrt(_1625);
        float _1629 = _1601 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1631 = precise::min(_1627, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1633 = _1631 * _1623;
        float _1635 = _1629 * _1633;
        float _1637 = fma(_1605, _1635, _1130);
        float _1639 = fma(_1615, _1635, _1128);
        float _1641 = fma(_1619, _1635, _1132);
        _1591 = _1637;
        _1587 = _1639;
        _1583 = _1641;
    }
    float _1643 = _1591;
    float _1645 = _1587;
    float _1647 = _1583;
    float _1649 = _1643 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1651 = _1643 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1653 = _1643 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1655 = _1575 + _1577;
    float _1657 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1649);
    float _1659 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1651);
    float _1661 = _1643 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1663 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1653);
    float _1665 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1657);
    float _1667 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1659);
    float _1669 = 1.0 / _1577;
    float _1671 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1661);
    float _1673 = _1665 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1675 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1663);
    float _1677 = _1667 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1679 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1671);
    float _1681 = _1673 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1683 = _1673 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1685 = _1673 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1687 = _1673 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1689 = _1675 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1691 = fma(_1677, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1681);
    float _1693 = fma(_1677, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1683);
    float _1695 = fma(_1677, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1685);
    float _1697 = fma(_1677, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1687);
    float _1699 = _1679 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1701 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1691);
    float _1703 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1693);
    float _1705 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1695);
    float _1707 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1697);
    float _1709 = fma(_1699, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1701);
    float _1711 = fma(_1699, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1703);
    float _1713 = fma(_1699, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1705);
    float _1715 = fma(_1699, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1707);
    float _1717 = _1655 * _1669;
    float _1719 = _1717 * 0.5;
    float _1721 = _1699;
    float _1723 = _1669;
    float _1725 = _1705;
    if (_1515)
    {
        _1721 = 1.0;
    }
    float _1727 = _1721;
    float _1729 = _1727;
    if (!_1515)
    {
        float _1731 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1733 = _1731 * 0.15915493667125701904296875;
        float _1735 = _1733 * 6.283185482025146484375;
        float _1737 = cos(_1735);
        float _1739 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1741 = _1739 * 0.15915493667125701904296875;
        float _1743 = _1733 * 6.283185482025146484375;
        float _1745 = sin(_1743);
        float _1747 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1749 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1747);
        float _1751 = 1.0 / _1737;
        float _1753 = _1741 * 6.283185482025146484375;
        float _1755 = cos(_1753);
        float _1757 = _1745 * _1751;
        float _1759 = 1.0 / _1749;
        float _1761 = _1755 * _1757;
        float _1763 = _1741 * 6.283185482025146484375;
        float _1765 = sin(_1763);
        float _1767 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1769 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1767;
        float _1771 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1773 = _1759 * _1771;
        float _1775 = 1.0 / _1761;
        float _1777 = 1.0 / _1769;
        float _1779 = _1765 * _1775;
        float _1781 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1783 = fma(_1779, _1773, _1781);
        float _1785 = _1783 * _1777;
        float _1787 = precise::clamp(_1785, 0.0, 1.0);
        _1723 = _1777;
        _1725 = _1779;
        _1729 = _1787;
    }
    float _1789 = _1723;
    float _1791 = _1725;
    float _1793 = _1729;
    float _1795 = abs(_1455);
    bool _1797 = _1795 != 0.0;
    bool _1799 = isnan(_1795);
    bool _1801 = _1797 || _1799;
    bool _1803 = isnan(0.0);
    bool _1805 = _1801 || _1803;
    out.gl_Position.x = _1711;
    out.gl_Position.y = _1709;
    out.gl_Position.z = _1713;
    out.gl_Position.w = _1715;
    float _1807 = _1789;
    if (!_1805)
    {
        out.gl_Position.w = 0.0;
    }
    if (_1805)
    {
        _1527 = _1715;
    }
    float _1809 = _1527;
    float _1811 = _1809;
    if (!_1805)
    {
        _1811 = 0.0;
    }
    float _1813 = _1811;
    float _1815 = _1813;
    if (!_1370)
    {
        int _1817 = _1390 << 4;
        int _1819 = _1817 + 2048;
        uint _1821 = uint(int(uint(_1819) >> uint(2)));
        uint _1823 = uint(int(uint(int(_1821)) >> uint(2)));
        int _1825 = int(_1821) & 3;
        float _1827 = (*spvDescriptorSet0.vp_c15)._m0[int(_1823)][_1825];
        int _1829 = int(_1821) + 1;
        uint _1831 = uint(int(uint(_1829) >> uint(2)));
        int _1833 = _1829 & 3;
        float _1835 = (*spvDescriptorSet0.vp_c15)._m0[int(_1831)][_1833];
        int _1837 = _1819 + 8;
        uint _1839 = uint(int(uint(_1837) >> uint(2)));
        uint _1841 = uint(int(uint(int(_1839)) >> uint(2)));
        int _1843 = int(_1839) & 3;
        float _1845 = (*spvDescriptorSet0.vp_c15)._m0[int(_1841)][_1843];
        int _1847 = int(_1839) + 1;
        uint _1849 = uint(int(uint(_1847) >> uint(2)));
        int _1851 = _1847 & 3;
        float _1853 = (*spvDescriptorSet0.vp_c15)._m0[int(_1849)][_1851];
        float _1855 = _1320 * _1835;
        float _1857 = fma(_1128, _1827, _1855);
        float _1859 = fma(_1132, _1845, _1857);
        float _1861 = _1859 + _1853;
        float _1863 = precise::clamp(_1861, 0.0, 1.0);
        float _1865 = -_1863;
        float _1867 = _1865 + _1473;
        float _1869 = fma(_1867, 500.0, 1.5);
        float _1871 = exp2(_1869);
        float _1873 = 0.0 + _1871;
        float _1875 = precise::clamp(_1873, 0.0, 1.0);
        bool _1877 = _1875 >= 1.0;
        bool _1879 = isnan(_1875);
        bool _1881 = _1877 || _1879;
        bool _1883 = isnan(1.0);
        bool _1885 = _1881 || _1883;
        _1807 = _1845;
        if (!_1885)
        {
            out.gl_Position.w = 0.0;
        }
        if (!_1885)
        {
            _1815 = 0.0;
        }
    }
    float _1887 = _1815;
    float _1889 = _1807;
    float _1891 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1893 = _1643 + _1891;
    float _1895 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1897 = _1645 + _1895;
    float _1899 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1901 = _1647 + _1899;
    float _1903 = _1689 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1905 = _1893 * _1893;
    float _1907 = 1.0 / _1887;
    float _1909 = fma(_1897, _1897, _1905);
    float _1911 = fma(_1901, _1901, _1909);
    float _1913 = rsqrt(_1911);
    float _1915 = _1709 * _1907;
    float _1917 = _1913 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1919 = _1897 * _1917;
    float _1921 = _1901 * _1917;
    float _1923 = _1919 * _1919;
    float _1925 = _1921 * _1921;
    float _1927 = _1923 + _1925;
    float _1929 = sqrt(_1927);
    bool _1931 = _1929 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1933 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1935 = _1929 + _1933;
    float _1937 = _1901;
    float _1939 = _1927;
    float _1941 = _1935;
    float _1943 = _1889;
    float _1945 = _1893;
    float _1947 = _1919;
    if (_1931)
    {
        float _1949 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1937 = _1949;
    }
    float _1951 = _1937;
    if (_1931)
    {
        float _1953 = rsqrt(_1927);
        _1939 = _1953;
    }
    float _1955 = _1939;
    if (_1931)
    {
        float _1957 = _1935 * _1951;
        _1941 = _1957;
    }
    float _1959 = _1941;
    if (_1931)
    {
        float _1961 = _1959 * 0.15915493667125701904296875;
        _1943 = _1961;
    }
    float _1963 = _1943;
    float _1965 = _1913;
    float _1967 = _1963;
    if (_1931)
    {
        float _1969 = _1963 * 6.283185482025146484375;
        float _1971 = sin(_1969);
        _1965 = _1971;
    }
    float _1973 = _1965;
    float _1975 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1977 = precise::max(0.0, _1975);
    float _1979 = _1791;
    float _1981 = _1975;
    float _1983 = _1977;
    if (_1931)
    {
        float _1985 = _1963 * 6.283185482025146484375;
        float _1987 = cos(_1985);
        _1979 = _1987;
    }
    float _1989 = _1979;
    float _1991 = -_1917;
    float _1993 = -_1977;
    float _1995 = fma(_1893, _1991, _1993);
    if (_1931)
    {
        float _1997 = _1995 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1981 = _1997;
    }
    float _1999 = _1981;
    float _2001 = _1973;
    if (_1931)
    {
        float _2003 = fma(_1973, _1999, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1983 = _2003;
    }
    float _2005 = _1983;
    float _2007 = _2005;
    if (!_1931)
    {
        _2001 = _1995;
    }
    float _2009 = _2001;
    float _2011 = sqrt(_1911);
    float _2013 = _2009;
    float _2015 = _1989;
    if (_1931)
    {
        float _2017 = _1989 + (-1.0);
        _1945 = _2017;
    }
    float _2019 = _1945;
    float _2021 = _2019;
    if (_1931)
    {
        float _2023 = _1955 * _2005;
        _1967 = _2023;
    }
    float _2025 = _1967;
    if (!_1931)
    {
        _2007 = _1921;
    }
    float _2027 = _2007;
    float _2029 = _2027;
    if (_1931)
    {
        float _2031 = _2019 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2021 = _2031;
    }
    float _2033 = _2021;
    float _2035 = _2033;
    if (_1931)
    {
        float _2037 = _1919 * _2025;
        _1947 = _2037;
    }
    float _2039 = _1947;
    if (_1931)
    {
        float _2041 = _1921 * _2025;
        _2029 = _2041;
    }
    float _2043 = _2029;
    if (_1931)
    {
        float _2045 = fma(_1995, _1989, _2033);
        _2013 = _2045;
    }
    float _2047 = _2013;
    if (!_1931)
    {
        _2035 = _1923;
    }
    float _2049 = _2035;
    float _2051 = _2049;
    if (_1931)
    {
        float _2053 = _2039 * _2039;
        _2051 = _2053;
    }
    float _2055 = _2051;
    if (!_1931)
    {
        _2015 = _1925;
    }
    float _2057 = _2015;
    float _2059 = _2057;
    if (_1931)
    {
        float _2061 = _2043 * _2043;
        _2059 = _2061;
    }
    float _2063 = _2059;
    float _2065 = fma(_2047, _2047, _2055);
    float _2067 = fma(_1915, -0.5, 0.5);
    float _2069 = _2065 + _2063;
    float _2071 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2073 = fma(_2011, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2071);
    float _2075 = precise::clamp(_2073, 0.0, 1.0);
    float _2077 = -_2075;
    float _2079 = _2077 + 1.0;
    float _2081 = rsqrt(_2069);
    float _2083 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2085 = -_1903;
    float _2087 = fma(_2085, _2083, 1.0);
    float _2089 = abs(_2079);
    float _2091 = log2(_2089);
    float _2093 = _2081 * _2039;
    float _2095 = _2081 * _2047;
    float _2097 = _2081 * _2043;
    float _2099 = log2(_2087);
    float _2101 = _2093 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2103 = -_2101;
    float _2105 = fma(_2095, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2103);
    float _2107 = _2091 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2109 = -_2097;
    float _2111 = fma(_2109, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2105);
    float _2113 = exp2(_2107);
    float _2115 = _2095 + 1.0;
    float _2117 = fma(_2111, -0.5, 0.5);
    float _2119 = fma(_2111, 0.5, 0.5);
    float _2121 = _2099 * 0.693147182464599609375;
    float _2123 = fma(_2119, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2125 = sqrt(_2117);
    float _2127 = _2121 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2129 = fma(_2119, _2123, -0.212114393711090087890625);
    float _2131 = _1711 * _1907;
    float _2133 = -_2095;
    float _2135 = fma(_2113, _2115, _2133);
    float _2137 = fma(_2119, _2129, 1.570728778839111328125);
    float _2139 = fma(_2131, 0.5, 0.5);
    float _2141 = fma(_2135, 0.5, 0.5);
    float _2143 = _2125 * 0.636619746685028076171875;
    float3 _5819 = float3(_2139, _2067, _2127);
    float _2145 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5819, float3(0.0), isnan(_5819)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5819, float3(0.0), isnan(_5819)), level(0.0)).x;
    float3 _5828 = float3(_2139, _2067, _2127);
    float4 _2148 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5828, float3(0.0), isnan(_5828)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5828, float3(0.0), isnan(_5828)), level(0.0)).xyzw;
    float _2150 = _2148.x;
    float _2152 = _2148.y;
    float _2154 = _2148.z;
    float _2156 = _2148.w;
    float _2158 = -_2137;
    float _2160 = fma(_2143, _2158, 1.0);
    float2 _5849 = float2(_2160, _2141);
    float3 _2164 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5849, float2(0.0), isnan(_5849)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5849, float2(0.0), isnan(_5849)), level(0.0)).xyz;
    float _2166 = _2164.x;
    float _2168 = _2164.y;
    float _2170 = _2164.z;
    float _2172 = _2091 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2174 = _1318 * _1793;
    float _2176 = _1713 + _1715;
    bool _2178 = _2011 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2180 = isnan(_2011);
    bool _2182 = _2178 || _2180;
    bool _2184 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2186 = _2182 || _2184;
    float _2188 = _2174 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2190 = exp2(_2172);
    float _2192 = _2176 * 0.5;
    float _2194 = _266 * _2188;
    out.m_81.z = _2192;
    out.m_81.w = _1715;
    float _2196 = -_2190;
    float _2198 = _2196 + 1.0;
    float _2200 = _2190;
    if (!_2186)
    {
        _2200 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2202 = _2200;
    float _2204 = _2198 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2206 = _2204 * _2145;
    float _2208 = -_2204;
    float _2210 = _2208 + 1.0;
    float _2212 = _2156 * _2206;
    float _2214 = _2156 * _2210;
    float _2216 = _2210;
    float _2218 = _2212;
    float _2220 = _2202;
    float _2222 = _2202;
    if (!_2186)
    {
        _2216 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2224 = _2216;
    float _2226 = _2170 * _2206;
    float _2228 = fma(_2166, _2212, _2150);
    float _2230 = fma(_2168, _2212, _2152);
    float _2232 = _2224;
    float _2234 = _2224;
    if (!_2186)
    {
        _2218 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2236 = _2218;
    float _2238 = fma(_2156, _2226, _2154);
    out.m_83.x = _2228;
    out.m_83.y = _2230;
    out.m_83.z = _2238;
    out.m_83.w = _2214;
    bool _2240 = !_2186;
    float _2242 = _2236;
    float _2244 = _2236;
    if (!_2240)
    {
        bool _2246 = _2011 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2248 = isnan(_2011);
        bool _2250 = _2246 || _2248;
        bool _2252 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2254 = _2250 || _2252;
        if (!_2254)
        {
            float _2256 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2258 = _2011 + _2256;
            float _2260 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2262 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2260;
            float _2264 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2266 = _2264 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2268 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2270 = _2268 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2272 = 1.0 / _2262;
            float _2274 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2276 = _2274 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2278 = _2258 * _2272;
            float _2280 = precise::clamp(_2278, 0.0, 1.0);
            float _2282 = fma(_2280, _2266, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2284 = fma(_2280, _2270, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2286 = fma(_2280, _2276, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _2222 = _2284;
            _2244 = _2282;
            _2234 = _2286;
            _2288 = true;
        }
        else
        {
            bool _2290 = _2011 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2292 = isnan(_2011);
            bool _2294 = _2290 || _2292;
            bool _2296 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2298 = _2294 || _2296;
            if (!_2298)
            {
                _2242 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2300 = _2242;
            _2244 = _2300;
            if (!_2298)
            {
                _2220 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2302 = _2220;
            _2222 = _2302;
            if (!_2298)
            {
                _2232 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2304 = _2232;
            bool _2306 = !_2298;
            _2234 = _2304;
            if (!_2306)
            {
                bool _2308 = _2011 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2310 = isnan(_2011);
                bool _2312 = _2308 || _2310;
                bool _2314 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2316 = _2312 || _2314;
                if (!_2316)
                {
                    float _2318 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2320 = _2011 + _2318;
                    float _2322 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2324 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2322;
                    float _2326 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2328 = _2326 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2330 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2332 = _2330 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2334 = 1.0 / _2324;
                    float _2336 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2338 = _2336 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2340 = _2320 * _2334;
                    float _2342 = precise::clamp(_2340, 0.0, 1.0);
                    float _2344 = fma(_2342, _2328, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2346 = fma(_2342, _2332, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2348 = fma(_2342, _2338, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _2222 = _2346;
                    _2244 = _2344;
                    _2234 = _2348;
                    _2288 = true;
                }
                else
                {
                    _2222 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2244 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2234 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _2288 = false;
    float _2350 = _2222;
    float _2352 = _2244;
    float _2354 = _2234;
    float _2356 = _2194 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_85.x = 0.0;
    float _2358 = _2350 * 0.586610972881317138671875;
    bool _2360 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_56.x = _2356;
    float _2362 = fma(_2352, 0.298911988735198974609375, _2358);
    bool _2364 = _1793 > 0.0;
    bool _2366 = isnan(_1793);
    bool _2368 = _2364 || _2366;
    bool _2370 = isnan(0.0);
    bool _2372 = _2368 || _2370;
    float _2374 = fma(_2354, 0.114477999508380889892578125, _2362);
    float _2376 = -_2374;
    float _2378 = _2376 + _2352;
    float _2380 = -_2374;
    float _2382 = _2380 + _2350;
    float _2384 = -_2374;
    float _2386 = _2384 + _2354;
    float _2388 = fma(_2378, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2374);
    float _2390 = fma(_2382, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2374);
    float _2392 = fma(_2386, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2374);
    bool _2394 = !_2360;
    if (!_2394)
    {
        float _2396 = -_1643;
        float _2398 = _2396 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2400 = -_1645;
        float _2402 = _2400 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2404 = -_1647;
        float _2406 = _2404 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2408 = _2398 * _2398;
        float _2410 = fma(_2402, _2402, _2408);
        float _2412 = fma(_2406, _2406, _2410);
        float _2414 = sqrt(_2412);
        float _2416 = rsqrt(_2412);
        float _2418 = -_2414;
        float _2420 = _2418 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2422 = _2420 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2424 = precise::clamp(_2422, 0.0, 1.0);
        float _2426 = _2402 * _2416;
        float _2428 = _2398 * _2416;
        float _2430 = abs(_2424);
        float _2432 = log2(_2430);
        float _2434 = _2406 * _2416;
        float _2436 = _2426 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2438 = _1056 * _2428;
        float _2440 = -_2428;
        float _2442 = -_2436;
        float _2444 = fma(_2440, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2442);
        float _2446 = fma(_1054, _2426, _2438);
        float _2448 = -_2434;
        float _2450 = fma(_2448, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2444);
        float _2452 = fma(_1068, _2434, _2446);
        float _2454 = precise::clamp(_2452, 0.0, 1.0);
        float _2456 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2458 = _2450 + _2456;
        float _2460 = _2432 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2462 = _2458 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2464 = precise::clamp(_2462, 0.0, 1.0);
        float _2466 = exp2(_2460);
        float _2468 = _2466 * _2464;
        float _2470 = _2454 * _2468;
        float _2472 = _2470 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2474 = _2470 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2476 = _2470 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_85.x = _2472;
        out.m_85.y = _2474;
        out.m_85.z = _2476;
    }
    out.m_87.x = _2388;
    out.m_87.y = _2390;
    out.m_87.z = _2392;
    if (_2372)
    {
        return out;
    }
    out.m_56.x = 0.0;
    float _2478 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2478;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint dm_vid = gl_VertexIndex;
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2288 = false;
    bool _1182 = false;
    bool _1170 = false;
    bool _626 = false;
    bool _478 = false;
    bool _286 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_53.w;
    float _103 = trunc(_101);
    int _106 = int(_103);
    bool _110 = _106 >= 1;
    float _112 = 0.0;
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _112;
    float _116 = _114;
    if (!_110)
    {
        out.m_56.x = 0.0;
    }
    int _118 = 0;
    if (!_110)
    {
        float _120 = _114 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2535 = as_type<float>(_122);
        out.gl_Position.z = _2535;
    }
    if (!_110)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _126 = in.m_58.w;
    bool _128 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_126);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = -_126;
    float _140 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _142 = 0.0;
    if (_136)
    {
        float _144 = float(_106);
        _142 = _144;
    }
    float _146 = _142;
    bool _148 = _140 >= _146;
    bool _150 = !_136;
    bool _152 = _148 || _150;
    if (_152)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _116;
    if (_152)
    {
        out.m_56.x = 0.0;
    }
    if (_152)
    {
        float _156 = _154 * 5.0;
        _124 = as_type<int>(_156);
    }
    int _158 = _124;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2603 = as_type<float>(_158);
        out.gl_Position.z = _2603;
    }
    if (_152)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _160 = as_type<float>(int(gl_VertexIndex));
    float _162 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _164 = _140 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _166 = in.m_63.x;
    float _168 = _164 * _162;
    int _170 = as_type<int>(_160) & 1;
    bool _172 = _170 != 0;
    int _174 = as_type<int>(_160) & 2;
    bool _176 = _174 != 0;
    float _178 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[20].x, _168);
    bool _180 = !_176;
    float _182 = _180 ? (-0.5) : 0.5;
    int _184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _186 = _184 != 0;
    int _188 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _190 = _188 != 0;
    float _192 = _178 * 6.283185482025146484375;
    float _194 = floor(_178);
    float _196 = _192 * 0.15915493667125701904296875;
    bool _198 = !_172;
    float _200 = _198 ? (-0.5) : 0.5;
    int _202 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _204 = _202 != 0;
    bool _206 = !_186;
    int _208 = _206 ? 0 : 1;
    float _210 = _196 * 6.283185482025146484375;
    float _212 = cos(_210);
    bool _214 = !_204;
    int _216 = _214 ? 0 : 1;
    int _218 = abs(_208);
    int _220 = abs(_216);
    float _222 = -_194;
    float _224 = _178 + _222;
    float _226 = float(_218);
    float _228 = -_224;
    float _230 = fma(_228, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _232 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _234 = !_190;
    int _236 = _234 ? 0 : 1;
    float _238 = fma(_212, 0.5, 0.5);
    float _240 = abs(_230);
    float _242 = _226 * _240;
    bool _244 = _224 < 0.5;
    float _246 = float(_244);
    int _248 = abs(_236);
    float _250 = -_238;
    float _252 = fma(_250, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _254 = float(_220);
    float _256 = -_246;
    float _258 = fma(_256, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _260 = float(_248);
    float _262 = fma(_254, _252, _242);
    float _264 = abs(_258);
    float _266 = fma(_260, _264, _262);
    bool _268 = !_232;
    float _284;
    if (!_268)
    {
        float _270 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _272 = _166 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _274 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[12].x, _140);
        float _276 = _274 * _270;
        float _278 = floor(_276);
        float _280 = -_278;
        float _282 = _276 + _280;
        _284 = _282;
        _286 = true;
    }
    else
    {
        float _288 = float(_106);
        float _290 = 1.0 / _288;
        float _292 = _140 * _290;
        _284 = _292;
    }
    _286 = false;
    float _294 = _284;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _298 = _294 + _296;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _302 = _294 + _300;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _306 = _294 + _304;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _308;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _314 = _312 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _318 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _316;
    bool _320 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _322 = isnan(_294);
    bool _324 = _320 || _322;
    bool _326 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _328 = _324 || _326;
    float _330 = float(_328);
    bool _332 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _334 = 1.0 / _310;
    float _336 = 1.0 / _318;
    float _338 = 1.0 / _314;
    float _340 = _298 * _334;
    bool _342 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _344 = isnan(_294);
    bool _346 = _342 || _344;
    bool _348 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _350 = _346 || _348;
    float _352 = float(_350);
    float _354 = -_330;
    float _356 = _354 + 1.0;
    bool _358 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _360 = isnan(_294);
    bool _362 = _358 || _360;
    bool _364 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _366 = _362 || _364;
    float _368 = float(_366);
    float _370 = _352 * _356;
    float _372 = _302 * _336;
    float _374 = -_352;
    float _376 = _374 + 1.0;
    float _378 = _368 * _376;
    float _380 = -_368;
    float _382 = _380 + 1.0;
    float _384 = _306 * _338;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _388 = _386 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _390 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _392 = isnan(_294);
    bool _394 = _390 || _392;
    bool _396 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _398 = _394 || _396;
    float _400 = float(_398);
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _402;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _406;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _414 = fma(_404, _340, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _416 = _400 * _382;
    float _418 = fma(_408, _340, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _420 = fma(_388, _384, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _422 = fma(_412, _384, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _424 = -_400;
    float _426 = _424 + 1.0;
    float _428 = _414 * _416;
    float _430 = _418 * _416;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _432;
    float _436 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[143].x, _428);
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _438;
    float _442 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[143].y, _430);
    float _444 = fma(_434, _372, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _446 = fma(_420, _378, _436);
    float _448 = fma(_440, _372, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _450 = fma(_422, _378, _442);
    float _452 = fma(_444, _370, _446);
    float _454 = fma(_448, _370, _450);
    float _456 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[146].x, _452);
    float _458 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[146].y, _454);
    bool _460 = !_332;
    float _476;
    if (!_460)
    {
        float _462 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _464 = _166 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _466 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[11].y, _140);
        float _468 = _466 * _462;
        float _470 = floor(_468);
        float _472 = -_470;
        float _474 = _468 + _472;
        _476 = _474;
        _478 = true;
    }
    else
    {
        float _480 = float(_106);
        float _482 = 1.0 / _480;
        float _484 = _140 * _482;
        _476 = _484;
    }
    _478 = false;
    float _486 = _476;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _490 = _486 + _488;
    float _492 = in.m_65.x;
    float _494 = in.m_65.y;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _498 = _496 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _500 = _486 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _502 = isnan(_486);
    bool _504 = _500 || _502;
    bool _506 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _508 = _504 || _506;
    float _510 = float(_508);
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _514 = _512 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _516 = _486 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _518 = isnan(_486);
    bool _520 = _516 || _518;
    bool _522 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _524 = _520 || _522;
    float _526 = float(_524);
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _528;
    bool _532 = _486 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _534 = isnan(_486);
    bool _536 = _532 || _534;
    bool _538 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _540 = _536 || _538;
    float _542 = float(_540);
    float _544 = 1.0 / _498;
    float _546 = -_510;
    float _548 = _546 + 1.0;
    bool _550 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _552 = _526 * _548;
    float _554 = -_526;
    float _556 = _554 + 1.0;
    float _558 = 1.0 / _514;
    float _560 = _530 * _544;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _564 = _562 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _566 = _458 * _494;
    float _568 = _456 * _492;
    float _570 = fma(_560, _490, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _572 = -_542;
    float _574 = _572 + 1.0;
    float _576 = _570 * _552;
    float _578 = _564 * _558;
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _582 = _486 + _580;
    float _584 = _510 * _574;
    float _586 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[115].x, _576);
    float _588 = fma(_578, _582, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _590 = fma(_588, _584, _586);
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _594 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _596 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[117].x, _590);
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _600 = _592 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _602 = _594 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _604 = _596 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _606 = _598 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_67.x = _600;
    out.m_67.y = _602;
    out.m_67.z = _606;
    out.m_67.w = _604;
    bool _608 = !_550;
    float _624;
    if (!_608)
    {
        float _610 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _612 = _166 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _614 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[11].w, _140);
        float _616 = _614 * _610;
        float _618 = floor(_616);
        float _620 = -_618;
        float _622 = _616 + _620;
        _624 = _622;
        _626 = true;
    }
    else
    {
        float _628 = float(_106);
        float _630 = 1.0 / _628;
        float _632 = _140 * _630;
        _624 = _632;
    }
    _626 = false;
    float _634 = _624;
    float _636 = in.m_53.x;
    float _638 = in.m_53.y;
    float _640 = in.m_53.z;
    float _642 = in.m_69.x;
    float _644 = in.m_69.y;
    float _646 = in.m_69.z;
    float _648 = in.m_69.w;
    int _650 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _652 = _650 != 0;
    int _654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _656 = _654 != 0;
    float _658 = in.m_71.x;
    float _660 = in.m_71.y;
    float _662 = in.m_71.z;
    float _664 = in.m_71.w;
    float _666 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _668 = _166 > 0.5;
    float _670 = in.m_73.x;
    float _672 = in.m_73.y;
    float _674 = in.m_73.z;
    float _676 = in.m_73.w;
    float _678 = in.m_63.y;
    float _680 = in.m_63.z;
    float _682 = _638 * _644;
    float _684 = _566 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _686 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _182);
    float _688 = _638 * _660;
    float _690 = _166 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _692 = fma(_636, _642, _682);
    float _694 = _684 * _686;
    float _696 = _638 * _672;
    float _698 = _568 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _700 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _200);
    float _702 = -_666;
    float _704 = fma(_690, 2.0, _702);
    float _706 = fma(_636, _670, _696);
    float _708 = _698 * _700;
    float _710 = fma(_636, _658, _688);
    float _712 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _714 = _678 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _716 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _718 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _720 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[78].z, _712);
    float _722 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[79].z, _716);
    float _724 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _726 = fma(_714, -2.0, _718);
    float _728 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _730 = _728 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _732 = -_200;
    int _734 = _668 ? as_type<int>(_732) : as_type<int>(_200);
    float _736 = fma(_640, _662, _710);
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _740 = _738 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _742 = _678 > 0.5;
    float _744 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[78].w, _724);
    bool _746 = !_652;
    float _748 = _746 ? _200 : as_type<float>(_734);
    float _750 = _200 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _752 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _754 = _752 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _756 = 1.0 / _730;
    float _758 = _182 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _760 = fma(_640, _646, _692);
    float _762 = fma(_640, _674, _706);
    float _764 = _758 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _766 = _758 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _768 = _758 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _770 = 1.0 / _740;
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _774 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _772;
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _778 = _776 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _780 = -_182;
    int _782 = _742 ? as_type<int>(_780) : as_type<int>(_182);
    float _784 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[24].x, _764);
    bool _786 = _634 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _788 = isnan(_634);
    bool _790 = _786 || _788;
    bool _792 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _794 = _790 || _792;
    float _796 = float(_794);
    float _798 = _736 + _664;
    bool _800 = !_656;
    float _802 = _800 ? _182 : as_type<float>(_782);
    float _804 = 1.0 / _754;
    float _806 = _774 * _756;
    float _808 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[79].x, _722);
    float _810 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[25].x, _766);
    bool _812 = _634 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _814 = isnan(_634);
    bool _816 = _812 || _814;
    bool _818 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _820 = _816 || _818;
    float _822 = float(_820);
    float _824 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].z, _720);
    float _826 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[76].y, _726);
    float _828 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _830 = _634 + _828;
    float _832 = _778 * _770;
    float _834 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _836 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _834;
    bool _838 = _634 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _840 = isnan(_634);
    bool _842 = _838 || _840;
    bool _844 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _846 = _842 || _844;
    float _848 = float(_846);
    float _850 = -_140;
    float _852 = fma(_850, (*spvDescriptorSet0.vp_c9)._m0[76].x, _704);
    float _854 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].w, _744);
    bool _856 = _634 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _858 = isnan(_634);
    bool _860 = _856 || _858;
    bool _862 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _864 = _860 || _862;
    float _866 = float(_864);
    float _868 = _808 * (-0.15915493667125701904296875);
    float _870 = -_848;
    float _872 = _870 + 1.0;
    float _874 = _836 * _804;
    float _876 = -_796;
    float _878 = _876 + 1.0;
    float _880 = fma(_806, _830, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _882 = _866 * _872;
    float _884 = _760 + _648;
    float _886 = _822 * _878;
    float _888 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _890 = _634 + _888;
    float _892 = _798 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    float _894 = _868 * 6.283185482025146484375;
    float _896 = sin(_894);
    float _898 = _880 * _882;
    float _900 = fma(_832, _890, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _902 = _762 + _676;
    float _904 = _884 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    float _906 = _892 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _908 = _892 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _910 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[26].x, _768);
    float _912 = _868 * 6.283185482025146484375;
    float _914 = cos(_912);
    float _916 = _902 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    float _918 = fma(_904, (*spvDescriptorSet0.vp_c12)._m0[6].y, _906);
    float _920 = -_822;
    float _922 = _920 + 1.0;
    float _924 = _694 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _926 = _694 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _928 = _694 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _930 = -_866;
    float _932 = _930 + 1.0;
    float _934 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _936 = fma(_904, (*spvDescriptorSet0.vp_c12)._m0[6].x, _908);
    float _938 = fma(_916, (*spvDescriptorSet0.vp_c12)._m0[8].y, _918);
    float _940 = _848 * _922;
    float _942 = fma(_708, (*spvDescriptorSet0.vp_c8)._m0[24].x, _924);
    float _944 = fma(_708, (*spvDescriptorSet0.vp_c8)._m0[25].x, _926);
    float _946 = fma(_708, (*spvDescriptorSet0.vp_c8)._m0[26].x, _928);
    float _948 = fma(_932, (*spvDescriptorSet0.vp_c9)._m0[131].x, _898);
    float _950 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _952 = fma(_916, (*spvDescriptorSet0.vp_c12)._m0[8].x, _936);
    float _954 = _938 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _956 = fma(_900, _940, _948);
    float _958 = _802 * _896;
    float _960 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _962 = _634 + _960;
    float _964 = _802 * _914;
    float _966 = _892 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    float _968 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _970 = _952 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _972 = _954 * _934;
    float _974 = -_958;
    float _976 = fma(_748, _914, _974);
    float _978 = fma(_874, _962, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _980 = fma(_904, (*spvDescriptorSet0.vp_c12)._m0[6].z, _966);
    float _982 = fma(_748, _896, _964);
    float _984 = fma(_972, 0.5, 0.5);
    float _986 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _988 = _970 * _950;
    float _990 = fma(_916, (*spvDescriptorSet0.vp_c12)._m0[8].z, _980);
    float _992 = fma(_978, _886, _956);
    float _994 = fma(_988, 0.5, 0.5);
    float _996 = _990 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    float _998 = fma(_796, (*spvDescriptorSet0.vp_c9)._m0[134].x, _992);
    float _1000 = floor(_984);
    float _1002 = _996 * _968;
    float _1004 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1006 = -_824;
    float _1008 = _1006 + 1.0;
    float _1010 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1012 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1014 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1016 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1018 = fma(_1002, 0.5, 0.5);
    float _1020 = _986 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1022 = _1010 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1024 = _1012 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1026 = _1016 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1028 = _976 + 0.5;
    float _1030 = floor(_994);
    float _1032 = -_1000;
    float _1034 = _984 + _1032;
    float _1036 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[24].z, _942);
    float _1038 = _982 + (-0.5);
    float _1040 = fma(_1020, _1028, _852);
    float _1042 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[25].z, _944);
    float _1044 = fma(_1034, 2.0, -1.0);
    float _1046 = floor(_1018);
    float _1048 = _1014 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1050 = -_854;
    float _1052 = _1050 + 1.0;
    float _1054 = _784 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _1056 = _810 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _1058 = -_1048;
    float _1060 = -_826;
    float _1062 = fma(_1058, _1038, _1060);
    float _1064 = -_1008;
    float _1066 = fma(_976, _1064, _1040);
    float _1068 = _910 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _1070 = -_1030;
    float _1072 = _994 + _1070;
    float _1074 = _1044 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _1076 = _998 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1078 = fma(_982, _1052, _1062);
    float _1080 = fma(_1072, 2.0, -1.0);
    float _1082 = _1074 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    out.m_75.x = _1054;
    out.m_75.y = _1056;
    out.m_75.z = _1068;
    float _1084 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[26].z, _946);
    float _1086 = _1080 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _1088 = -_1046;
    float _1090 = _1018 + _1088;
    out.m_77.x = _1022;
    out.m_77.y = _1024;
    out.m_77.z = _1026;
    out.m_77.w = _1076;
    float _1092 = _1036 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1094 = fma(_1086, (*spvDescriptorSet0.vp_c12)._m0[2].x, _1082);
    float _1096 = fma(_1090, 2.0, -1.0);
    float _1098 = _1084 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    out.m_79.x = _1066;
    out.m_79.y = _1078;
    bool _1100 = (*spvDescriptorSet0.vp_c12)._m0[10].x != 1.0;
    bool _1102 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _1104 = _1100 || _1102;
    bool _1106 = isnan(1.0);
    bool _1108 = _1104 || _1106;
    float _1110 = _1074 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _1112 = _1074 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    float _1114 = _1096 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _1116 = fma(_1086, (*spvDescriptorSet0.vp_c12)._m0[2].y, _1110);
    float _1118 = fma(_1086, (*spvDescriptorSet0.vp_c12)._m0[2].z, _1112);
    float _1120 = fma(_1114, (*spvDescriptorSet0.vp_c12)._m0[4].x, _1094);
    float _1122 = fma(_1114, (*spvDescriptorSet0.vp_c12)._m0[4].y, _1116);
    float _1124 = fma(_1114, (*spvDescriptorSet0.vp_c12)._m0[4].z, _1118);
    float _1126 = _1042 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1128 = _1120 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _1130 = _1122 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _1132 = _1124 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _1134 = _1092 + _1128;
    float _1136 = _1126 + _1130;
    float _1138 = _1098 + _1132;
    float _1140 = _1062;
    float _1142 = _1112;
    float _1144 = _1126;
    float _1146 = _1114;
    float _1148 = _1112;
    float _1150 = _1126;
    float _1152 = _1114;
    float _1154 = _1080;
    float _1156 = _1044;
    float _1158 = _1096;
    float _1160 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
    float _1162 = _1020;
    float _1164 = _994;
    float _1174;
    float _1176;
    float _1178;
    float _1180;
    if (!_1108)
    {
        bool _1166 = _1130 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _1168 = !_1166;
        _1170 = _1168;
        if (!_1170)
        {
            float _1172 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _1174 = _1172;
            _1176 = 0.0;
            _1178 = 0.0;
            _1180 = 0.0;
            _1182 = true;
        }
    }
    if ((!_1182) || _1170)
    {
        bool _1218;
        if (!_1170)
        {
            bool _1184 = _1130 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _1186 = isnan(_1130);
            bool _1188 = _1184 || _1186;
            bool _1190 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _1192 = _1188 || _1190;
            bool _1194 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _1196 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _1198 = !_1192;
            bool _1200 = _1196 && _1198;
            if (_1200)
            {
                _1140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _1202 = _1140;
            float _1204 = _1202;
            if (_1200)
            {
                _1142 = 0.0;
            }
            float _1206 = _1142;
            _1148 = _1206;
            _1176 = _1206;
            if (_1200)
            {
                _1144 = 0.0;
            }
            float _1208 = _1144;
            _1150 = _1208;
            _1178 = _1208;
            if (_1200)
            {
                float _1210 = _1202 * 5.0;
                _1204 = _1210;
            }
            float _1212 = _1204;
            _1174 = _1212;
            if (_1200)
            {
                _1146 = 0.0;
            }
            float _1214 = _1146;
            bool _1216 = !_1192;
            _1218 = _1216 && _1194;
            _1152 = _1214;
            _1180 = _1214;
        }
        if ((!_1218) || _1170)
        {
            _1170 = false;
            float _1220 = _1148;
            float _1222 = _1150;
            float _1224 = _1152;
            bool _1226 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _1228 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _1230 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _1232 = _1118;
            float _1234 = _1222;
            float _1236 = _1224;
            _1174 = _1138;
            if (_1226)
            {
                float _1238 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _1232 = _1238;
            }
            float _1240 = _1232;
            if (_1226)
            {
                float _1242 = abs(_1080);
                float _1244 = -_1242;
                float _1246 = _1244 + 1.0;
                _1154 = _1246;
            }
            float _1248 = _1154;
            if (_1228)
            {
                float _1250 = abs(_1044);
                float _1252 = -_1250;
                float _1254 = _1252 + 1.0;
                _1156 = _1254;
            }
            float _1256 = _1156;
            if (!_1226)
            {
                _1234 = 1.0;
            }
            float _1258 = _1234;
            float _1260 = _1258;
            if (_1230)
            {
                float _1262 = abs(_1096);
                float _1264 = -_1262;
                float _1266 = _1264 + 1.0;
                _1158 = _1266;
            }
            float _1268 = _1158;
            if (!_1228)
            {
                _1160 = 1.0;
            }
            float _1270 = _1160;
            float _1272 = _1270;
            if (!_1230)
            {
                _1236 = 1.0;
            }
            float _1274 = _1236;
            float _1276 = _1220;
            float _1278 = _1274;
            if (_1228)
            {
                float _1280 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _1276 = _1280;
            }
            float _1282 = _1276;
            float _1284 = _1066;
            if (_1230)
            {
                float _1286 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _1284 = _1286;
            }
            float _1288 = _1284;
            if (_1226)
            {
                float _1290 = _1248 * _1240;
                float _1292 = precise::clamp(_1290, 0.0, 1.0);
                _1260 = _1292;
            }
            float _1294 = _1260;
            if (_1228)
            {
                float _1296 = _1256 * _1282;
                float _1298 = precise::clamp(_1296, 0.0, 1.0);
                _1272 = _1298;
            }
            float _1300 = _1272;
            float _1302 = _1294 * _1300;
            _1176 = _1134;
            _1178 = _1136;
            if (_1230)
            {
                float _1304 = _1268 * _1288;
                float _1306 = precise::clamp(_1304, 0.0, 1.0);
                _1278 = _1306;
            }
            float _1308 = _1278;
            float _1310 = _1302 * _1308;
            _1180 = _1310;
        }
    }
    _1182 = false;
    float _1312 = _1174;
    float _1314 = _1176;
    float _1316 = _1178;
    float _1318 = _1180;
    float _1320 = _1130 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1322 = _1320 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1324 = _1320 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1326 = fma(_1132, 6.2500002968590706586837768554688e-05, 0.5);
    float _1328 = fma(_1128, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1322);
    float _1330 = fma(_1128, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1324);
    float _1332 = fma(_1132, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1328);
    float _1334 = fma(_1132, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1330);
    float _1336 = _1332 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1338 = _1334 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1340 = trunc(_1336);
    int _1342 = int(_1340);
    float _1344 = trunc(_1338);
    int _1346 = int(_1344);
    int _1348 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1350 = _1342 + _1348;
    int _1352 = _1350 + 1;
    bool _1354 = _1352 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1356 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1358 = _1346 + _1356;
    int _1360 = _1358 + 1;
    int _1362 = _1352 | _1360;
    bool _1364 = _1362 < 0;
    bool _1366 = _1364 || _1354;
    bool _1368 = _1360 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1370 = _1368 || _1366;
    int _1372 = _1352;
    int _1374 = _1362;
    int _1376 = _1360;
    float _1378 = _1314;
    float _1380 = _1316;
    float _1382 = _1312;
    float _1384 = _1326;
    if (!_1370)
    {
        int _1386 = _1360 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1388 = _1386 + _1352;
        _1372 = _1388;
    }
    int _1390 = _1372;
    float _1392 = _1134;
    if (!_1370)
    {
        float _1394 = floor(_1336);
        _1392 = _1394;
    }
    float _1396 = _1392;
    if (!_1370)
    {
        int _1398 = _1390 << 2;
        _1374 = _1398;
    }
    int _1400 = _1374;
    int _1402 = _1400;
    if (!_1370)
    {
        uint _1405 = uint(int(uint(_1390) >> uint(2)));
        _1376 = int(_1405);
    }
    int _1407 = _1376;
    float _1409 = as_type<float>(_1407);
    if (!_1370)
    {
        int _1411 = 12 & _1400;
        _1402 = _1411;
    }
    int _1413 = _1402;
    if (!_1370)
    {
        int _1415 = _1407 << 4;
        int _1417 = _1415 + _1413;
        _1162 = as_type<float>(_1417);
    }
    float _1419 = _1162;
    float _1421 = as_type<float>(_1413);
    if (!_1370)
    {
        float _1423 = floor(_1338);
        _1421 = _1423;
    }
    float _1425 = _1421;
    if (!_1370)
    {
        float _1427 = -_1396;
        float _1429 = _1336 + _1427;
        _1164 = _1429;
    }
    float _1431 = _1164;
    float _1433 = _1419;
    if (!_1370)
    {
        int _1435 = as_type<int>(_1419) + 400;
        uint _1437 = uint(int(uint(_1435) >> uint(2)));
        uint _1439 = uint(int(uint(int(_1437)) >> uint(2)));
        int _1441 = int(_1437) & 3;
        float _1443 = (*spvDescriptorSet0.vp_c15)._m0[int(_1439)][_1441];
        _1433 = _1443;
    }
    float _1445 = _1433;
    if (!_1370)
    {
        float _1447 = -_1425;
        float _1449 = _1338 + _1447;
        _1409 = _1449;
    }
    float _1451 = _1409;
    float _1453 = fma(_1128, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _4708 = float2(_1453, _1326);
    float _1455 = dm_bs(spvDescriptorSet0.vp_t_tcb_22.sample(spvDescriptorSet0.vp_t_tcb_22Smplr, select(_4708, float2(0.0), isnan(_4708)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_22, spvDescriptorSet0.vp_t_tcb_22Smplr_w, select(_4708, float2(0.0), isnan(_4708)), level(0.0)).x;
    float _1457 = 2.0;
    if (!_1370)
    {
        float _1459 = rint(_1445);
        float _1461 = precise::max(_1459, 0.0);
        uint _1463 = uint(_1461);
        uint _1465 = clamp(_1463, 0u, 65535u);
        _1457 = as_type<float>(_1465);
    }
    float _1467 = _1457;
    float _1469 = _1451;
    if (!_1370)
    {
        float3 _4742 = float3(_1431, _1451, float(as_type<int>(_1467)));
        float3 _4746 = select(_4742, float3(0.0), isnan(_4742));
        float _1471 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4746.xy, uint(rint(_4746.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4746.xy, uint(rint(_4746.z)), level(0.0)).x;
        _1469 = _1471;
    }
    float _1473 = _1469;
    float _1475 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1477 = _1312 + _1475;
    float _1479 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1481 = _1314 + _1479;
    float _1483 = _1130 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1485 = _1130 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1487 = _1477 * _1477;
    float _1489 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1483);
    float _1491 = fma(_1481, _1481, _1487);
    float _1493 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1485);
    bool _1495 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1497 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1499 = _1495 || _1497;
    bool _1501 = isnan(0.5);
    bool _1503 = _1499 || _1501;
    float _1505 = sqrt(_1491);
    bool _1507 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1509 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1511 = _1507 || _1509;
    bool _1513 = isnan(0.5);
    bool _1515 = _1511 || _1513;
    float _1517 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1489);
    float _1519 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1493);
    bool _1521 = _1505 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1523 = !_1521;
    float _1525 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1527 = _1455;
    if (!_1523)
    {
        float _1529 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1531 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1533 = _1505 + _1531;
        float _1535 = _1316 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1537 = rsqrt(_1491);
        float _1539 = _1533 * _1529;
        float _1541 = _1539 * 0.15915493667125701904296875;
        float _1543 = _1541 * 6.283185482025146484375;
        float _1545 = cos(_1543);
        float _1547 = _1541 * 6.283185482025146484375;
        float _1549 = sin(_1547);
        float _1551 = _1545 + (-1.0);
        float _1553 = _1551 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1555 = fma(_1549, _1535, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1557 = fma(_1545, _1316, _1553);
        float _1559 = _1537 * _1555;
        float _1561 = fma(_1481, _1559, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1563 = fma(_1477, _1559, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1378 = _1561;
        _1380 = _1557;
        _1525 = _1537;
        _1382 = _1563;
        _1384 = _1553;
    }
    float _1565 = _1378;
    float _1567 = _1380;
    float _1569 = _1525;
    float _1571 = _1382;
    float _1573 = _1384;
    float _1575 = _1517 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1577 = _1519 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1579 = _1569;
    float _1581 = _1573;
    float _1583 = _1571;
    if (_1503)
    {
        _1579 = _1565;
    }
    float _1585 = _1579;
    float _1587 = _1585;
    if (_1503)
    {
        _1581 = _1567;
    }
    float _1589 = _1581;
    float _1591 = _1589;
    if (!_1503)
    {
        float _1593 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1595 = _1130 + _1593;
        float _1597 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1599 = _1128 + _1597;
        float _1601 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1603 = -_1130;
        float _1605 = _1603 + _1567;
        float _1607 = _1595 * _1595;
        float _1609 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1611 = _1132 + _1609;
        float _1613 = -_1128;
        float _1615 = _1613 + _1565;
        float _1617 = -_1132;
        float _1619 = _1617 + _1571;
        float _1621 = fma(_1599, _1599, _1607);
        float _1623 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1625 = fma(_1611, _1611, _1621);
        float _1627 = sqrt(_1625);
        float _1629 = _1601 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1631 = precise::min(_1627, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1633 = _1631 * _1623;
        float _1635 = _1629 * _1633;
        float _1637 = fma(_1605, _1635, _1130);
        float _1639 = fma(_1615, _1635, _1128);
        float _1641 = fma(_1619, _1635, _1132);
        _1591 = _1637;
        _1587 = _1639;
        _1583 = _1641;
    }
    float _1643 = _1591;
    float _1645 = _1587;
    float _1647 = _1583;
    float _1649 = _1643 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1651 = _1643 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1653 = _1643 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1655 = _1575 + _1577;
    float _1657 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1649);
    float _1659 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1651);
    float _1661 = _1643 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1663 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1653);
    float _1665 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1657);
    float _1667 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1659);
    float _1669 = 1.0 / _1577;
    float _1671 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1661);
    float _1673 = _1665 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1675 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1663);
    float _1677 = _1667 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1679 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1671);
    float _1681 = _1673 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1683 = _1673 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1685 = _1673 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1687 = _1673 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1689 = _1675 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1691 = fma(_1677, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1681);
    float _1693 = fma(_1677, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1683);
    float _1695 = fma(_1677, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1685);
    float _1697 = fma(_1677, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1687);
    float _1699 = _1679 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1701 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1691);
    float _1703 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1693);
    float _1705 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1695);
    float _1707 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1697);
    float _1709 = fma(_1699, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1701);
    float _1711 = fma(_1699, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1703);
    float _1713 = fma(_1699, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1705);
    float _1715 = fma(_1699, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1707);
    float _1717 = _1655 * _1669;
    float _1719 = _1717 * 0.5;
    float _1721 = _1699;
    float _1723 = _1669;
    float _1725 = _1705;
    if (_1515)
    {
        _1721 = 1.0;
    }
    float _1727 = _1721;
    float _1729 = _1727;
    if (!_1515)
    {
        float _1731 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1733 = _1731 * 0.15915493667125701904296875;
        float _1735 = _1733 * 6.283185482025146484375;
        float _1737 = cos(_1735);
        float _1739 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1741 = _1739 * 0.15915493667125701904296875;
        float _1743 = _1733 * 6.283185482025146484375;
        float _1745 = sin(_1743);
        float _1747 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1749 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1747);
        float _1751 = 1.0 / _1737;
        float _1753 = _1741 * 6.283185482025146484375;
        float _1755 = cos(_1753);
        float _1757 = _1745 * _1751;
        float _1759 = 1.0 / _1749;
        float _1761 = _1755 * _1757;
        float _1763 = _1741 * 6.283185482025146484375;
        float _1765 = sin(_1763);
        float _1767 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1769 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1767;
        float _1771 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1773 = _1759 * _1771;
        float _1775 = 1.0 / _1761;
        float _1777 = 1.0 / _1769;
        float _1779 = _1765 * _1775;
        float _1781 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1783 = fma(_1779, _1773, _1781);
        float _1785 = _1783 * _1777;
        float _1787 = precise::clamp(_1785, 0.0, 1.0);
        _1723 = _1777;
        _1725 = _1779;
        _1729 = _1787;
    }
    float _1789 = _1723;
    float _1791 = _1725;
    float _1793 = _1729;
    float _1795 = abs(_1455);
    bool _1797 = _1795 != 0.0;
    bool _1799 = isnan(_1795);
    bool _1801 = _1797 || _1799;
    bool _1803 = isnan(0.0);
    bool _1805 = _1801 || _1803;
    out.gl_Position.x = _1711;
    out.gl_Position.y = _1709;
    out.gl_Position.z = _1713;
    out.gl_Position.w = _1715;
    float _1807 = _1789;
    if (!_1805)
    {
        out.gl_Position.w = 0.0;
    }
    if (_1805)
    {
        _1527 = _1715;
    }
    float _1809 = _1527;
    float _1811 = _1809;
    if (!_1805)
    {
        _1811 = 0.0;
    }
    float _1813 = _1811;
    float _1815 = _1813;
    if (!_1370)
    {
        int _1817 = _1390 << 4;
        int _1819 = _1817 + 2048;
        uint _1821 = uint(int(uint(_1819) >> uint(2)));
        uint _1823 = uint(int(uint(int(_1821)) >> uint(2)));
        int _1825 = int(_1821) & 3;
        float _1827 = (*spvDescriptorSet0.vp_c15)._m0[int(_1823)][_1825];
        int _1829 = int(_1821) + 1;
        uint _1831 = uint(int(uint(_1829) >> uint(2)));
        int _1833 = _1829 & 3;
        float _1835 = (*spvDescriptorSet0.vp_c15)._m0[int(_1831)][_1833];
        int _1837 = _1819 + 8;
        uint _1839 = uint(int(uint(_1837) >> uint(2)));
        uint _1841 = uint(int(uint(int(_1839)) >> uint(2)));
        int _1843 = int(_1839) & 3;
        float _1845 = (*spvDescriptorSet0.vp_c15)._m0[int(_1841)][_1843];
        int _1847 = int(_1839) + 1;
        uint _1849 = uint(int(uint(_1847) >> uint(2)));
        int _1851 = _1847 & 3;
        float _1853 = (*spvDescriptorSet0.vp_c15)._m0[int(_1849)][_1851];
        float _1855 = _1320 * _1835;
        float _1857 = fma(_1128, _1827, _1855);
        float _1859 = fma(_1132, _1845, _1857);
        float _1861 = _1859 + _1853;
        float _1863 = precise::clamp(_1861, 0.0, 1.0);
        float _1865 = -_1863;
        float _1867 = _1865 + _1473;
        float _1869 = fma(_1867, 500.0, 1.5);
        float _1871 = exp2(_1869);
        float _1873 = 0.0 + _1871;
        float _1875 = precise::clamp(_1873, 0.0, 1.0);
        bool _1877 = _1875 >= 1.0;
        bool _1879 = isnan(_1875);
        bool _1881 = _1877 || _1879;
        bool _1883 = isnan(1.0);
        bool _1885 = _1881 || _1883;
        _1807 = _1845;
        if (!_1885)
        {
            out.gl_Position.w = 0.0;
        }
        if (!_1885)
        {
            _1815 = 0.0;
        }
    }
    float _1887 = _1815;
    float _1889 = _1807;
    float _1891 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1893 = _1643 + _1891;
    float _1895 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1897 = _1645 + _1895;
    float _1899 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1901 = _1647 + _1899;
    float _1903 = _1689 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1905 = _1893 * _1893;
    float _1907 = 1.0 / _1887;
    float _1909 = fma(_1897, _1897, _1905);
    float _1911 = fma(_1901, _1901, _1909);
    float _1913 = rsqrt(_1911);
    float _1915 = _1709 * _1907;
    float _1917 = _1913 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1919 = _1897 * _1917;
    float _1921 = _1901 * _1917;
    float _1923 = _1919 * _1919;
    float _1925 = _1921 * _1921;
    float _1927 = _1923 + _1925;
    float _1929 = sqrt(_1927);
    bool _1931 = _1929 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1933 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1935 = _1929 + _1933;
    float _1937 = _1901;
    float _1939 = _1927;
    float _1941 = _1935;
    float _1943 = _1889;
    float _1945 = _1893;
    float _1947 = _1919;
    if (_1931)
    {
        float _1949 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1937 = _1949;
    }
    float _1951 = _1937;
    if (_1931)
    {
        float _1953 = rsqrt(_1927);
        _1939 = _1953;
    }
    float _1955 = _1939;
    if (_1931)
    {
        float _1957 = _1935 * _1951;
        _1941 = _1957;
    }
    float _1959 = _1941;
    if (_1931)
    {
        float _1961 = _1959 * 0.15915493667125701904296875;
        _1943 = _1961;
    }
    float _1963 = _1943;
    float _1965 = _1913;
    float _1967 = _1963;
    if (_1931)
    {
        float _1969 = _1963 * 6.283185482025146484375;
        float _1971 = sin(_1969);
        _1965 = _1971;
    }
    float _1973 = _1965;
    float _1975 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1977 = precise::max(0.0, _1975);
    float _1979 = _1791;
    float _1981 = _1975;
    float _1983 = _1977;
    if (_1931)
    {
        float _1985 = _1963 * 6.283185482025146484375;
        float _1987 = cos(_1985);
        _1979 = _1987;
    }
    float _1989 = _1979;
    float _1991 = -_1917;
    float _1993 = -_1977;
    float _1995 = fma(_1893, _1991, _1993);
    if (_1931)
    {
        float _1997 = _1995 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1981 = _1997;
    }
    float _1999 = _1981;
    float _2001 = _1973;
    if (_1931)
    {
        float _2003 = fma(_1973, _1999, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1983 = _2003;
    }
    float _2005 = _1983;
    float _2007 = _2005;
    if (!_1931)
    {
        _2001 = _1995;
    }
    float _2009 = _2001;
    float _2011 = sqrt(_1911);
    float _2013 = _2009;
    float _2015 = _1989;
    if (_1931)
    {
        float _2017 = _1989 + (-1.0);
        _1945 = _2017;
    }
    float _2019 = _1945;
    float _2021 = _2019;
    if (_1931)
    {
        float _2023 = _1955 * _2005;
        _1967 = _2023;
    }
    float _2025 = _1967;
    if (!_1931)
    {
        _2007 = _1921;
    }
    float _2027 = _2007;
    float _2029 = _2027;
    if (_1931)
    {
        float _2031 = _2019 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2021 = _2031;
    }
    float _2033 = _2021;
    float _2035 = _2033;
    if (_1931)
    {
        float _2037 = _1919 * _2025;
        _1947 = _2037;
    }
    float _2039 = _1947;
    if (_1931)
    {
        float _2041 = _1921 * _2025;
        _2029 = _2041;
    }
    float _2043 = _2029;
    if (_1931)
    {
        float _2045 = fma(_1995, _1989, _2033);
        _2013 = _2045;
    }
    float _2047 = _2013;
    if (!_1931)
    {
        _2035 = _1923;
    }
    float _2049 = _2035;
    float _2051 = _2049;
    if (_1931)
    {
        float _2053 = _2039 * _2039;
        _2051 = _2053;
    }
    float _2055 = _2051;
    if (!_1931)
    {
        _2015 = _1925;
    }
    float _2057 = _2015;
    float _2059 = _2057;
    if (_1931)
    {
        float _2061 = _2043 * _2043;
        _2059 = _2061;
    }
    float _2063 = _2059;
    float _2065 = fma(_2047, _2047, _2055);
    float _2067 = fma(_1915, -0.5, 0.5);
    float _2069 = _2065 + _2063;
    float _2071 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2073 = fma(_2011, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2071);
    float _2075 = precise::clamp(_2073, 0.0, 1.0);
    float _2077 = -_2075;
    float _2079 = _2077 + 1.0;
    float _2081 = rsqrt(_2069);
    float _2083 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2085 = -_1903;
    float _2087 = fma(_2085, _2083, 1.0);
    float _2089 = abs(_2079);
    float _2091 = log2(_2089);
    float _2093 = _2081 * _2039;
    float _2095 = _2081 * _2047;
    float _2097 = _2081 * _2043;
    float _2099 = log2(_2087);
    float _2101 = _2093 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2103 = -_2101;
    float _2105 = fma(_2095, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2103);
    float _2107 = _2091 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2109 = -_2097;
    float _2111 = fma(_2109, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2105);
    float _2113 = exp2(_2107);
    float _2115 = _2095 + 1.0;
    float _2117 = fma(_2111, -0.5, 0.5);
    float _2119 = fma(_2111, 0.5, 0.5);
    float _2121 = _2099 * 0.693147182464599609375;
    float _2123 = fma(_2119, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2125 = sqrt(_2117);
    float _2127 = _2121 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2129 = fma(_2119, _2123, -0.212114393711090087890625);
    float _2131 = _1711 * _1907;
    float _2133 = -_2095;
    float _2135 = fma(_2113, _2115, _2133);
    float _2137 = fma(_2119, _2129, 1.570728778839111328125);
    float _2139 = fma(_2131, 0.5, 0.5);
    float _2141 = fma(_2135, 0.5, 0.5);
    float _2143 = _2125 * 0.636619746685028076171875;
    float3 _5819 = float3(_2139, _2067, _2127);
    float _2145 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5819, float3(0.0), isnan(_5819)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5819, float3(0.0), isnan(_5819)), level(0.0)).x;
    float3 _5828 = float3(_2139, _2067, _2127);
    float4 _2148 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5828, float3(0.0), isnan(_5828)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5828, float3(0.0), isnan(_5828)), level(0.0)).xyzw;
    float _2150 = _2148.x;
    float _2152 = _2148.y;
    float _2154 = _2148.z;
    float _2156 = _2148.w;
    float _2158 = -_2137;
    float _2160 = fma(_2143, _2158, 1.0);
    float2 _5849 = float2(_2160, _2141);
    float3 _2164 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5849, float2(0.0), isnan(_5849)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5849, float2(0.0), isnan(_5849)), level(0.0)).xyz;
    float _2166 = _2164.x;
    float _2168 = _2164.y;
    float _2170 = _2164.z;
    float _2172 = _2091 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2174 = _1318 * _1793;
    float _2176 = _1713 + _1715;
    bool _2178 = _2011 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2180 = isnan(_2011);
    bool _2182 = _2178 || _2180;
    bool _2184 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2186 = _2182 || _2184;
    float _2188 = _2174 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2190 = exp2(_2172);
    float _2192 = _2176 * 0.5;
    float _2194 = _266 * _2188;
    out.m_81.z = _2192;
    out.m_81.w = _1715;
    float _2196 = -_2190;
    float _2198 = _2196 + 1.0;
    float _2200 = _2190;
    if (!_2186)
    {
        _2200 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2202 = _2200;
    float _2204 = _2198 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2206 = _2204 * _2145;
    float _2208 = -_2204;
    float _2210 = _2208 + 1.0;
    float _2212 = _2156 * _2206;
    float _2214 = _2156 * _2210;
    float _2216 = _2210;
    float _2218 = _2212;
    float _2220 = _2202;
    float _2222 = _2202;
    if (!_2186)
    {
        _2216 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2224 = _2216;
    float _2226 = _2170 * _2206;
    float _2228 = fma(_2166, _2212, _2150);
    float _2230 = fma(_2168, _2212, _2152);
    float _2232 = _2224;
    float _2234 = _2224;
    if (!_2186)
    {
        _2218 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2236 = _2218;
    float _2238 = fma(_2156, _2226, _2154);
    out.m_83.x = _2228;
    out.m_83.y = _2230;
    out.m_83.z = _2238;
    out.m_83.w = _2214;
    bool _2240 = !_2186;
    float _2242 = _2236;
    float _2244 = _2236;
    if (!_2240)
    {
        bool _2246 = _2011 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2248 = isnan(_2011);
        bool _2250 = _2246 || _2248;
        bool _2252 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2254 = _2250 || _2252;
        if (!_2254)
        {
            float _2256 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2258 = _2011 + _2256;
            float _2260 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2262 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2260;
            float _2264 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2266 = _2264 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2268 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2270 = _2268 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2272 = 1.0 / _2262;
            float _2274 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2276 = _2274 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2278 = _2258 * _2272;
            float _2280 = precise::clamp(_2278, 0.0, 1.0);
            float _2282 = fma(_2280, _2266, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2284 = fma(_2280, _2270, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2286 = fma(_2280, _2276, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _2222 = _2284;
            _2244 = _2282;
            _2234 = _2286;
            _2288 = true;
        }
        else
        {
            bool _2290 = _2011 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2292 = isnan(_2011);
            bool _2294 = _2290 || _2292;
            bool _2296 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2298 = _2294 || _2296;
            if (!_2298)
            {
                _2242 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2300 = _2242;
            _2244 = _2300;
            if (!_2298)
            {
                _2220 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2302 = _2220;
            _2222 = _2302;
            if (!_2298)
            {
                _2232 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2304 = _2232;
            bool _2306 = !_2298;
            _2234 = _2304;
            if (!_2306)
            {
                bool _2308 = _2011 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2310 = isnan(_2011);
                bool _2312 = _2308 || _2310;
                bool _2314 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2316 = _2312 || _2314;
                if (!_2316)
                {
                    float _2318 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2320 = _2011 + _2318;
                    float _2322 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2324 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2322;
                    float _2326 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2328 = _2326 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2330 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2332 = _2330 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2334 = 1.0 / _2324;
                    float _2336 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2338 = _2336 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2340 = _2320 * _2334;
                    float _2342 = precise::clamp(_2340, 0.0, 1.0);
                    float _2344 = fma(_2342, _2328, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2346 = fma(_2342, _2332, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2348 = fma(_2342, _2338, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _2222 = _2346;
                    _2244 = _2344;
                    _2234 = _2348;
                    _2288 = true;
                }
                else
                {
                    _2222 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2244 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2234 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _2288 = false;
    float _2350 = _2222;
    float _2352 = _2244;
    float _2354 = _2234;
    float _2356 = _2194 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_85.x = 0.0;
    float _2358 = _2350 * 0.586610972881317138671875;
    bool _2360 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_56.x = _2356;
    float _2362 = fma(_2352, 0.298911988735198974609375, _2358);
    bool _2364 = _1793 > 0.0;
    bool _2366 = isnan(_1793);
    bool _2368 = _2364 || _2366;
    bool _2370 = isnan(0.0);
    bool _2372 = _2368 || _2370;
    float _2374 = fma(_2354, 0.114477999508380889892578125, _2362);
    float _2376 = -_2374;
    float _2378 = _2376 + _2352;
    float _2380 = -_2374;
    float _2382 = _2380 + _2350;
    float _2384 = -_2374;
    float _2386 = _2384 + _2354;
    float _2388 = fma(_2378, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2374);
    float _2390 = fma(_2382, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2374);
    float _2392 = fma(_2386, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2374);
    bool _2394 = !_2360;
    if (!_2394)
    {
        float _2396 = -_1643;
        float _2398 = _2396 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2400 = -_1645;
        float _2402 = _2400 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2404 = -_1647;
        float _2406 = _2404 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2408 = _2398 * _2398;
        float _2410 = fma(_2402, _2402, _2408);
        float _2412 = fma(_2406, _2406, _2410);
        float _2414 = sqrt(_2412);
        float _2416 = rsqrt(_2412);
        float _2418 = -_2414;
        float _2420 = _2418 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2422 = _2420 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2424 = precise::clamp(_2422, 0.0, 1.0);
        float _2426 = _2402 * _2416;
        float _2428 = _2398 * _2416;
        float _2430 = abs(_2424);
        float _2432 = log2(_2430);
        float _2434 = _2406 * _2416;
        float _2436 = _2426 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2438 = _1056 * _2428;
        float _2440 = -_2428;
        float _2442 = -_2436;
        float _2444 = fma(_2440, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2442);
        float _2446 = fma(_1054, _2426, _2438);
        float _2448 = -_2434;
        float _2450 = fma(_2448, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2444);
        float _2452 = fma(_1068, _2434, _2446);
        float _2454 = precise::clamp(_2452, 0.0, 1.0);
        float _2456 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2458 = _2450 + _2456;
        float _2460 = _2432 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2462 = _2458 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2464 = precise::clamp(_2462, 0.0, 1.0);
        float _2466 = exp2(_2460);
        float _2468 = _2466 * _2464;
        float _2470 = _2454 * _2468;
        float _2472 = _2470 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2474 = _2470 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2476 = _2470 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_85.x = _2472;
        out.m_85.y = _2474;
        out.m_85.z = _2476;
    }
    out.m_87.x = _2388;
    out.m_87.y = _2390;
    out.m_87.z = _2392;
    if (_2372)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_56.x = 0.0;
    float _2478 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2478;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

