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
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_24 [[id(7)]];
    sampler vp_t_tcb_24Smplr [[id(8)]];
    texture3d<float> vp_t_tcb_32 [[id(9)]];
    sampler vp_t_tcb_32Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_30 [[id(11)]];
    sampler vp_t_tcb_30Smplr [[id(12)]];
    texture2d<float> vp_t_tcb_1C [[id(13)]];
    sampler vp_t_tcb_1CSmplr [[id(14)]];
    sampler vp_t_tcb_24Smplr_w [[id(15)]];
    sampler vp_t_tcb_32Smplr_w [[id(16)]];
    sampler vp_t_tcb_30Smplr_w [[id(17)]];
    sampler vp_t_tcb_1CSmplr_w [[id(18)]];
    constant dm_border_t* dm_border [[id(19)]];
};

struct main0_out
{
    float4 m_73 [[user(locn0)]];
    float4 m_71 [[user(locn1)]];
    float4 m_51 [[user(locn2)]];
    float4 m_89 [[user(locn3)]];
    float4 m_69 [[user(locn4)]];
    float4 m_75 [[user(locn5)]];
    float4 m_81 [[user(locn6)]];
    float4 m_77 [[user(locn7)]];
    float4 m_87 [[user(locn8)]];
    float4 m_83 [[user(locn9)]];
    float4 m_85 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_79 [[attribute(0)]];
    float4 m_65 [[attribute(1)]];
    float4 m_55 [[attribute(2)]];
    float4 m_48 [[attribute(3)]];
    float4 m_53 [[attribute(4)]];
    float4 m_67 [[attribute(5)]];
    float4 m_63 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_61 [[attribute(8)]];
    float4 m_59 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2103 = false;
    bool _1332 = false;
    bool _326 = false;
    bool _212 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_48.w;
    float _105 = trunc(_103);
    int _108 = int(_105);
    bool _112 = _108 >= 1;
    float _114 = 0.0;
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _114;
    float _118 = _116;
    if (!_112)
    {
        out.m_51.x = 0.0;
    }
    int _120 = 0;
    if (!_112)
    {
        float _122 = _116 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2388 = as_type<float>(_124);
        out.gl_Position.z = _2388;
    }
    if (!_112)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _128 = in.m_53.w;
    bool _130 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_128);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = -_128;
    float _142 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _144 = 0.0;
    float _146 = _142;
    if (_138)
    {
        float _148 = float(_108);
        _144 = _148;
    }
    float _150 = _144;
    bool _152 = _142 >= _150;
    bool _154 = !_138;
    bool _156 = _152 || _154;
    if (_156)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _118;
    if (_156)
    {
        out.m_51.x = 0.0;
    }
    if (_156)
    {
        float _160 = _158 * 5.0;
        _126 = as_type<int>(_160);
    }
    int _162 = _126;
    if (_156)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2457 = as_type<float>(_162);
        out.gl_Position.z = _2457;
    }
    if (_156)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _164 = in.m_55.x;
    float _166 = in.m_55.y;
    float _168 = in.m_55.z;
    bool _170 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _172 = _166 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _174 = _166 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _176 = _166 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _178 = fma(_164, (*spvDescriptorSet0.vp_c10)._m0[4].x, _172);
    float _180 = fma(_164, (*spvDescriptorSet0.vp_c10)._m0[5].x, _174);
    float _182 = fma(_164, (*spvDescriptorSet0.vp_c10)._m0[6].x, _176);
    float _184 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[4].z, _178);
    float _186 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[5].z, _180);
    float _188 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[6].z, _182);
    bool _190 = !_170;
    float _192 = _168;
    float _210;
    if (!_190)
    {
        float _194 = in.m_57.x;
        float _196 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _198 = _194 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _200 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[12].x, _142);
        float _202 = _200 * _196;
        float _204 = floor(_202);
        float _206 = -_204;
        float _208 = _202 + _206;
        _210 = _208;
        _212 = true;
    }
    else
    {
        float _214 = float(_108);
        float _216 = 1.0 / _214;
        float _218 = _142 * _216;
        _210 = _218;
    }
    _212 = false;
    float _220 = _210;
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _224 = _220 + _222;
    bool _226 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _228 = isnan(_220);
    bool _230 = _226 || _228;
    bool _232 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _234 = _230 || _232;
    float _236 = float(_234);
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _240 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _238;
    bool _242 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _244 = 1.0 / _240;
    float _246 = -_236;
    float _248 = _246 + 1.0;
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _252 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _250;
    float _254 = _224 * _244;
    bool _256 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _258 = isnan(_220);
    bool _260 = _256 || _258;
    bool _262 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _264 = _260 || _262;
    float _266 = float(_264);
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _270 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _268;
    float _272 = fma(_252, _254, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _274;
    float _278 = _266 * _248;
    float _280 = fma(_270, _254, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _282 = fma(_276, _254, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _284 = -_266;
    float _286 = _284 + 1.0;
    float _288 = _272 * _278;
    float _290 = _280 * _278;
    float _292 = _282 * _278;
    float _294 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[143].z, _288);
    float _296 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[143].x, _290);
    float _298 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[143].y, _292);
    float _300 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[144].x, _296);
    float _302 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[144].y, _298);
    float _304 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[144].z, _294);
    bool _306 = !_242;
    float _324;
    if (!_306)
    {
        float _308 = in.m_57.x;
        float _310 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _312 = _308 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _314 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[11].y, _142);
        float _316 = _314 * _310;
        float _318 = floor(_316);
        float _320 = -_318;
        float _322 = _316 + _320;
        _324 = _322;
        _326 = true;
    }
    else
    {
        float _328 = float(_108);
        float _330 = 1.0 / _328;
        float _332 = _142 * _330;
        _324 = _332;
    }
    _326 = false;
    float _334 = _324;
    float _336 = in.m_57.z;
    float _338 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _340 = log2(_338);
    int _342 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _344 = _342 != 0;
    float _346 = in.m_57.x;
    float _348 = in.m_57.w;
    float _350 = in.m_59.x;
    float _352 = _254;
    float _354 = _334;
    if (!_344)
    {
        float _356 = in.m_57.y;
        _352 = _356;
    }
    float _358 = _352;
    float _360 = _340 * _142;
    float _362 = _336 * 2.0;
    float _364 = exp2(_360);
    float _366 = _340;
    if (!_344)
    {
        _366 = _336;
    }
    float _368 = _366;
    float _370 = _346 * 2.0;
    float _372 = floor(_362);
    float _374 = _368;
    if (!_344)
    {
        _192 = _358;
    }
    float _376 = _192;
    float _378 = floor(_370);
    float _380 = -_364;
    float _382 = _380 + 1.0;
    float _384 = _376;
    float _386 = _358;
    if (_344)
    {
        float _388 = in.m_57.x;
        float _390 = in.m_57.y;
        _384 = _388;
        _386 = _390;
    }
    float _392 = _384;
    float _394 = _386;
    bool _396 = _372 > 0.0;
    bool _398 = _372 >= 0.0;
    bool _400 = isnan(_372);
    bool _402 = _398 || _400;
    bool _404 = isnan(0.0);
    bool _406 = _402 || _404;
    int _408 = _406 ? 0 : 1;
    bool _410 = _348 > 0.5;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _414 = 1.0 + _412;
    int _416 = ~_408;
    int _418 = _416 + 1;
    int _420 = _418 + 1;
    float _422 = 1.0 / _414;
    int _424 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _426 = _424 != 0;
    int _428 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _430 = _428 != 0;
    int _432 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _434 = _432 != 0;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _438 = _420;
    bool _440 = _434;
    if (!_396)
    {
        int _442 = ~_408;
        int _444 = _442 + 1;
        _438 = _444;
    }
    int _446 = _438;
    bool _448 = _378 > 0.0;
    bool _450 = _378 >= 0.0;
    bool _452 = isnan(_378);
    bool _454 = _450 || _452;
    bool _456 = isnan(0.0);
    bool _458 = _454 || _456;
    float _460 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[83].z, _436);
    float _462 = _392 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_344)
    {
        _374 = _394;
    }
    float _464 = _374;
    float _466 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _468 = _458 ? 0 : 1;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _472 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _474 = isnan(1.0);
    bool _476 = _472 || _474;
    bool _478 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _480 = _476 || _478;
    float _482 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[83].w, _466);
    float _484 = _464;
    if (!_344)
    {
        _484 = _336;
    }
    float _486 = _484;
    float _488 = -_470;
    float _490 = fma(_462, 2.0, _488);
    float _492 = in.m_61.x;
    float _494 = in.m_61.y;
    float _496 = in.m_61.z;
    float _498 = _486;
    if (_344)
    {
        _498 = _394;
    }
    float _500 = _498;
    float _502 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[82].z, _460);
    bool _504 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _506 = isnan(0.0);
    bool _508 = _504 || _506;
    bool _510 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _512 = _508 || _510;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _516 = ~_468;
    int _518 = _516 + 1;
    int _520 = _518 + 1;
    float _522 = _500 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _524 = _520;
    if (!_448)
    {
        int _526 = ~_468;
        int _528 = _526 + 1;
        _524 = _528;
    }
    int _530 = _524;
    float _532 = -_142;
    float _534 = fma(_532, (*spvDescriptorSet0.vp_c9)._m0[81].x, _490);
    float _536 = _512 ? _382 : 0.0;
    float _538 = fma(_522, -2.0, _514);
    float _540 = in.m_48.x;
    float _542 = in.m_48.y;
    float _544 = in.m_48.z;
    float _546 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[82].w, _482);
    float _548 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[81].y, _538);
    if (_480)
    {
        float _550 = _536 * _422;
        _146 = _550;
    }
    float _552 = _146;
    float _554 = _394 * 2.0;
    float _556 = in.m_63.x;
    float _558 = in.m_63.y;
    float _560 = in.m_63.z;
    bool _562 = !_426;
    int _564 = _562 ? 0 : 1;
    int _566 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _568 = _566 != 0;
    float _570 = floor(_554);
    int _572 = abs(_564);
    float _574 = _304 * _496;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _578 = _576 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _580 = _302 * _494;
    float _582 = _300 * _492;
    float _584 = _346 + _336;
    float _586 = 1.0 / _578;
    float _588 = _582 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _590 = _584 + (-1.0);
    float _592 = _580 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _594 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _596 = _594 != 0;
    float _598 = _542 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _600 = _542 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _602 = _542 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _604 = fma(_590, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _606 = fma(_540, (*spvDescriptorSet0.vp_c10)._m0[4].x, _598);
    bool _608 = !_430;
    int _610 = _608 ? 0 : 1;
    float _612 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _556);
    float _614 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _558);
    bool _616 = _570 >= 0.0;
    bool _618 = isnan(_570);
    bool _620 = _616 || _618;
    bool _622 = isnan(0.0);
    bool _624 = _620 || _622;
    float _626 = fma(_540, (*spvDescriptorSet0.vp_c10)._m0[5].x, _600);
    float _628 = _588 * _612;
    float _630 = _592 * _614;
    int _632 = abs(_610);
    float _634 = fma(_540, (*spvDescriptorSet0.vp_c10)._m0[6].x, _602);
    float _636 = in.m_65.x;
    float _638 = in.m_65.y;
    float _640 = in.m_65.z;
    int _642 = _624 ? 0 : 1;
    float _644 = _346 + _394;
    int _646 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _648 = _646 != 0;
    float _650 = fma(_544, (*spvDescriptorSet0.vp_c10)._m0[6].z, _634);
    int _652 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _654 = _652 != 0;
    float _656 = _644 + (-1.0);
    bool _658 = _570 > 0.0;
    float _660 = _336 + _394;
    float _662 = float(_572);
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _666 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _664;
    float _668 = float(_446);
    float _670 = _660 + (-1.0);
    float _672 = _666 * _586;
    float _674 = float(_530);
    float _676 = _662 * _668;
    bool _678 = !_434;
    int _680 = _678 ? 0 : 1;
    float _682 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _684 = float(_632);
    float _686 = in.m_59.y;
    float _688 = _676 * (-2.0);
    int _690 = ~_642;
    int _692 = _690 + 1;
    int _694 = _692 + 1;
    float _696 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _698 = _694;
    bool _700 = _658;
    float _702 = _606;
    int _704 = as_type<int>(_558);
    if (_568)
    {
        bool _706 = _346 > 0.5;
        _440 = _706;
    }
    bool _708 = _440;
    float _710 = _346 + (-0.5);
    if (!_658)
    {
        int _712 = ~_642;
        int _714 = _712 + 1;
        _698 = _714;
    }
    int _716 = _698;
    float _718 = fma(_688, _636, _636);
    int _720 = abs(_680);
    float _722 = _684 * _674;
    float _724 = fma(_682, _688, _682);
    float _726 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[196].x, _718);
    float _728 = float(_720);
    float _730 = _722 * (-2.0);
    float _732 = float(_716);
    float _734 = fma(_724, _552, _726);
    if (_596)
    {
        bool _736 = _336 > 0.5;
        _700 = _736;
    }
    bool _738 = _700;
    float _740 = fma(_730, _638, _638);
    float _742 = fma(_696, _730, _696);
    float _744 = _728 * _732;
    float _746 = _394 + (-0.5);
    float _748 = _734 * 0.15915493667125701904296875;
    float _750 = _574 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _752 = _744 * (-2.0);
    float _754 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[196].y, _740);
    float _756 = -_686;
    float _758 = _756 + 1.0;
    float _760 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _762 = fma(_604, _752, _604);
    float _764 = fma(_742, _552, _754);
    float _766 = fma(_752, _640, _640);
    int _768 = _410 ? as_type<int>(_758) : as_type<int>(_686);
    float _770 = in.m_67.x;
    float _772 = in.m_67.y;
    float _774 = in.m_67.z;
    bool _776 = _558 != 0.0;
    bool _778 = isnan(_558);
    bool _780 = _776 || _778;
    bool _782 = isnan(0.0);
    bool _784 = _780 || _782;
    float _786 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _560);
    float _788 = _336 + (-0.5);
    float _790 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _792 = _334 + _790;
    bool _794 = _556 == 0.0;
    bool _796 = !_784;
    bool _798 = _794 && _796;
    float _800 = _750 * _786;
    float _802 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[196].z, _766);
    float _804 = _764 * 0.15915493667125701904296875;
    bool _806 = _560 == 0.0;
    bool _808 = _806 && _798;
    float _810 = fma(_672, _792, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _812 = fma(_762, _552, _802);
    float _814 = _748 * 6.283185482025146484375;
    float _816 = sin(_814);
    float _818 = _760 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _820 = _334 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _822 = isnan(_334);
    bool _824 = _820 || _822;
    bool _826 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _828 = _824 || _826;
    float _830 = float(_828);
    float _832 = _812 * 0.15915493667125701904296875;
    float _834 = fma(_544, (*spvDescriptorSet0.vp_c10)._m0[4].z, _606);
    int _836 = _648 ? _768 : as_type<int>(_686);
    float _838 = fma(_544, (*spvDescriptorSet0.vp_c10)._m0[5].z, _626);
    bool _840 = _334 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _842 = isnan(_334);
    bool _844 = _840 || _842;
    bool _846 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _848 = _844 || _846;
    float _850 = float(_848);
    float _852 = _748 * 6.283185482025146484375;
    float _854 = cos(_852);
    float _856 = -_830;
    float _858 = _856 + 1.0;
    float _860 = fma(_818, as_type<float>(_836), -0.5);
    float _862 = _770;
    float _864 = _772;
    float _866 = _774;
    float _868 = _748;
    float _870 = _686;
    int _872 = _836;
    if (!_808)
    {
        float _874 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[17].y, _770);
        _862 = _874;
    }
    float _876 = _862;
    if (!_808)
    {
        float _878 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[17].y, _772);
        _864 = _878;
    }
    float _880 = _864;
    float _882 = _850 * _858;
    if (!_808)
    {
        float _884 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[17].y, _774);
        _866 = _884;
    }
    float _886 = _866;
    float _888 = _804 * 6.283185482025146484375;
    float _890 = sin(_888);
    if (!_568)
    {
        _868 = _350;
    }
    float _892 = _868;
    float _894 = -_850;
    float _896 = _894 + 1.0;
    bool _898 = _394 > 0.5;
    float _900 = _892;
    if (!_568)
    {
        _702 = _892;
    }
    float _902 = _702;
    float _904 = _902;
    if (_568)
    {
        _900 = _350;
    }
    float _906 = _900;
    float _908 = _804 * 6.283185482025146484375;
    float _910 = cos(_908);
    if (_654)
    {
        float _912 = _898 ? _758 : _686;
        _870 = _912;
    }
    float _914 = _870;
    if (!_596)
    {
        _354 = _906;
    }
    float _916 = _354;
    float _918 = _916;
    if (_568)
    {
        float _920 = -_906;
        float _922 = _920 + 1.0;
        _704 = as_type<int>(_922);
    }
    int _924 = _704;
    if (_596)
    {
        float _926 = -_906;
        float _928 = _926 + 1.0;
        _872 = as_type<int>(_928);
    }
    int _930 = _872;
    float _932 = _832 * 6.283185482025146484375;
    float _934 = cos(_932);
    float _936 = _810 * _882;
    if (_568)
    {
        float _938 = _708 ? as_type<float>(_924) : _906;
        _904 = _938;
    }
    float _940 = _904;
    float _942 = _816 * _890;
    if (_596)
    {
        float _944 = _738 ? as_type<float>(_930) : _906;
        _918 = _944;
    }
    float _946 = _918;
    float _948 = _854 * _890;
    float _950 = fma(_896, (*spvDescriptorSet0.vp_c9)._m0[115].x, _936);
    float _952 = _832 * 6.283185482025146484375;
    float _954 = sin(_952);
    float _956 = _854 * _910;
    float _958 = _816 * _910;
    float _960 = fma(_830, (*spvDescriptorSet0.vp_c9)._m0[116].x, _950);
    float _962 = _854 * _934;
    float _964 = _890 * _934;
    float _966 = _816 * _934;
    float _968 = _910 * _934;
    float _970 = _962 * _630;
    float _972 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _974 = fma(_954, _956, _942);
    float _976 = -_948;
    float _978 = fma(_954, _958, _976);
    float _980 = -_958;
    float _982 = fma(_954, _948, _980);
    float _984 = -_630;
    float _986 = _954 * _984;
    float _988 = fma(_974, _628, _970);
    float _990 = _966 * _630;
    float _992 = fma(_954, _942, _956);
    float _994 = fma(_968, _628, _986);
    float _996 = fma(_982, _800, _988);
    float _998 = fma(_978, _628, _990);
    float _1000 = _982 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1002 = fma(_964, _800, _994);
    float _1004 = _996 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1006 = _996 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1008 = fma(_992, _800, _998);
    float _1010 = _972 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1012 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1004);
    float _1014 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1006);
    float _1016 = _650 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1018 = fma(_1010, _946, -0.5);
    float _1020 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1012);
    float _1022 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1014);
    float _1024 = _834 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1026 = -_548;
    float _1028 = fma(_546, _860, _1026);
    float _1030 = _1020 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1032 = _1022 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1034 = fma(_502, _1018, _534);
    float _1036 = _962 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1038 = _1024 + _1030;
    float _1040 = _1016 + _1032;
    float _1042 = _962 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1044 = _962 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1046 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1048 = _1038 + _1046;
    float _1050 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1052 = _1040 + _1050;
    float _1054 = _974 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1056 = _974 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1058 = _1048 * _1048;
    float _1060 = _1052 * _1052;
    float _1062 = _974 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1064 = _996 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1066 = -_954;
    float _1068 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1036);
    float _1070 = _1058 + _1060;
    float _1072 = -_954;
    float _1074 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1044);
    float _1076 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1054);
    float _1078 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1056);
    float _1080 = sqrt(_1070);
    float _1082 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1062);
    float _1084 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1064);
    float _1086 = _982 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1088 = _982 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1090 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1000);
    float _1092 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1068);
    float _1094 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1074);
    float _1096 = -_954;
    float _1098 = fma(_1096, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1042);
    float _1100 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1084);
    float _1102 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1076);
    float _1104 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1078);
    float _1106 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1082);
    float _1108 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1110 = _838 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1112 = _1100 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _1114 = _1080 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1116 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1086);
    float _1118 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1088);
    float _1120 = _1110 + _1112;
    float _1122 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1098);
    float _1124 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1126 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1116);
    float _1128 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1118);
    float _1130 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1090);
    float _1132 = _992;
    float _1134 = _966;
    float _1136 = _1058;
    float _1138 = _1060;
    float _1140 = _1040;
    float _1142 = _1028;
    if (!_1114)
    {
        _1132 = _1058;
    }
    float _1144 = _1132;
    float _1146 = _1144;
    if (!_1114)
    {
        _1134 = _1038;
    }
    float _1148 = _1134;
    float _1150 = _1148;
    if (!_1114)
    {
        _1136 = _1120;
    }
    float _1152 = _1136;
    bool _1154 = !_1114;
    float _1156 = _1152;
    if (!_1154)
    {
        float _1158 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1160 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1162 = _1080 + _1160;
        float _1164 = rsqrt(_1070);
        float _1166 = _1162 * _1158;
        float _1168 = _1120 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1170 = _1166 * 0.15915493667125701904296875;
        float _1172 = _1170 * 6.283185482025146484375;
        float _1174 = sin(_1172);
        float _1176 = _1170 * 6.283185482025146484375;
        float _1178 = cos(_1176);
        float _1180 = fma(_1174, _1168, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1182 = _1164 * _1180;
        float _1184 = _1178 + (-1.0);
        float _1186 = fma(_1048, _1182, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1188 = fma(_1052, _1182, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1190 = _1184 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1192 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1194 = _1186 + _1192;
        float _1196 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1198 = _1188 + _1196;
        float _1200 = fma(_1120, _1178, _1190);
        float _1202 = _1194 * _1194;
        float _1204 = _1198 * _1198;
        _1156 = _1200;
        _1146 = _1202;
        _1138 = _1204;
        _1150 = _1186;
        _1140 = _1188;
    }
    float _1206 = _1156;
    float _1208 = _1146;
    float _1210 = _1138;
    float _1212 = _1150;
    float _1214 = _1140;
    float _1216 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1218 = _1206 + _1216;
    float _1220 = _1122 * _880;
    float _1222 = _1092 * _880;
    float _1224 = _1094 * _880;
    float _1226 = fma(_1218, _1218, _1208);
    float _1228 = fma(_1102, _876, _1220);
    float _1230 = fma(_1104, _876, _1222);
    float _1232 = _940 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1234 = _914 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1236 = _1226 + _1210;
    float _1238 = fma(_1106, _876, _1224);
    float _1240 = _1232 * _1108;
    float _1242 = _1234 * _1124;
    float _1244 = fma(_1126, _886, _1228);
    float _1246 = fma(_1128, _886, _1230);
    float _1248 = sqrt(_1236);
    float _1250 = _960 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1252 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1254 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1256 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1258 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1260 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1262 = _1034 + 0.5;
    float _1264 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1266 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1268 = _1252 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1270 = _1254 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1272 = _1256 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1274 = _1258 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1276 = _1260 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1278 = _1264 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1280 = _1028 + 0.5;
    float _1282 = fma(_1130, _886, _1238);
    out.m_69.x = 1.0;
    out.m_69.y = 1.0;
    out.m_69.z = 1.0;
    bool _1284 = _1248 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1286 = isnan(_1248);
    bool _1288 = _1284 || _1286;
    bool _1290 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1292 = _1288 || _1290;
    out.m_71.x = _1274;
    out.m_71.y = _1276;
    out.m_71.z = _1278;
    out.m_71.w = _1266;
    out.m_73.x = _1268;
    out.m_73.y = _1270;
    out.m_73.z = _1272;
    out.m_73.w = _1250;
    out.m_75.x = _1240;
    out.m_75.y = _1242;
    out.m_75.z = _1262;
    out.m_75.w = _1280;
    float _1294 = _1274;
    float _1296 = _1278;
    if (!_1292)
    {
        _1142 = 1.0;
    }
    float _1298 = _1142;
    out.m_77.x = _1244;
    out.m_77.y = _1246;
    out.m_77.z = _1282;
    bool _1300 = !_1292;
    float _1302 = _1298;
    if (!_1300)
    {
        bool _1304 = _1248 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1306 = isnan(_1248);
        bool _1308 = _1304 || _1306;
        bool _1310 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1312 = _1308 || _1310;
        if (!_1312)
        {
            float _1314 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1316 = _1248 + _1314;
            float _1318 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1320 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1318;
            float _1322 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1324 = _1322 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1326 = 1.0 / _1320;
            float _1328 = _1316 * _1326;
            float _1330 = fma(_1328, _1324, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1302 = _1330;
            _1332 = true;
        }
        else
        {
            bool _1334 = _1248 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1336 = isnan(_1248);
            bool _1338 = _1334 || _1336;
            bool _1340 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1342 = _1338 || _1340;
            if (!_1342)
            {
                float _1344 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1346 = _1248 + _1344;
                float _1348 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1350 = _1348 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1352 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1354 = _1352 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1356 = 1.0 / _1350;
                float _1358 = _1346 * _1356;
                float _1360 = fma(_1358, _1354, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1302 = _1360;
                _1332 = true;
            }
            else
            {
                _1302 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1332 = false;
    float _1362 = _1302;
    float _1364 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1366 = _1206 + _1364;
    float _1368 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1370 = _1212 + _1368;
    float _1372 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1374 = _1214 + _1372;
    float _1376 = fma(_1366, _1362, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1378 = fma(_1370, _1362, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1380 = fma(_1374, _1362, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1382 = -_1110;
    float _1384 = _1382 + _1376;
    float _1386 = -_1024;
    float _1388 = _1386 + _1378;
    float _1390 = -_1016;
    float _1392 = _1390 + _1380;
    float _1394 = _1384 * _1384;
    float _1396 = fma(_1388, _1388, _1394);
    float _1398 = fma(_1392, _1392, _1396);
    float _1400 = sqrt(_1398);
    bool _1402 = _1400 > 0.0;
    float _1404 = _1366;
    float _1406 = _1378;
    float _1408 = _1376;
    if (!_1402)
    {
        _1294 = _1378;
    }
    float _1410 = _1294;
    float _1412 = _1410;
    if (!_1402)
    {
        _1404 = _1376;
    }
    float _1414 = _1404;
    float _1416 = _1414;
    float _1418 = _1414;
    if (!_1402)
    {
        _1296 = _1380;
    }
    float _1420 = _1296;
    bool _1422 = !_1402;
    float _1424 = _1420;
    float _1426 = _1420;
    if (!_1422)
    {
        float _1428 = _186 * _186;
        float _1430 = fma(_184, _184, _1428);
        float _1432 = fma(_188, _188, _1430);
        float _1434 = rsqrt(_1398);
        float _1436 = sqrt(_1432);
        float _1438 = _1388 * _1434;
        float _1440 = _1384 * _1434;
        float _1442 = _1392 * _1434;
        bool _1444 = _1436 > 0.0;
        float _1446 = _1436;
        if (!_1444)
        {
            _1446 = _1378;
        }
        float _1448 = _1446;
        _1412 = _1448;
        if (!_1444)
        {
            _1416 = _1376;
        }
        float _1450 = _1416;
        _1418 = _1450;
        if (!_1444)
        {
            _1424 = _1380;
        }
        float _1452 = _1424;
        bool _1454 = !_1444;
        _1426 = _1452;
        if (!_1454)
        {
            float _1456 = rsqrt(_1432);
            float _1458 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1460 = _186 * _1456;
            float _1462 = _184 * _1456;
            float _1464 = _188 * _1456;
            float _1466 = _1440 * _1460;
            float _1468 = fma(_1438, _1462, _1466);
            float _1470 = _1458 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1472 = fma(_1442, _1464, _1468);
            float _1474 = _1472 * _1470;
            float _1476 = fma(_184, _1474, _1378);
            float _1478 = fma(_186, _1474, _1376);
            float _1480 = fma(_188, _1474, _1380);
            _1418 = _1478;
            _1412 = _1476;
            _1426 = _1480;
        }
    }
    float _1482 = _1418;
    float _1484 = _1412;
    float _1486 = _1426;
    float _1488 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1490 = _1482 + _1488;
    float _1492 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1494 = _1484 + _1492;
    float _1496 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1498 = _1486 + _1496;
    float _1500 = _1490 * _1490;
    float _1502 = fma(_1494, _1494, _1500);
    float _1504 = fma(_1498, _1498, _1502);
    float _1506 = rsqrt(_1504);
    float _1508 = sqrt(_1504);
    float _1510 = _1506 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1512 = _1494 * _1510;
    float _1514 = _1498 * _1510;
    float _1516 = _1512 * _1512;
    float _1518 = _1514 * _1514;
    float _1520 = _1516 + _1518;
    float _1522 = sqrt(_1520);
    bool _1524 = _1522 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1526 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1528 = _1522 + _1526;
    float _1530 = _1506;
    float _1532 = _1528;
    float _1534 = _1490;
    float _1536 = _1510;
    if (_1524)
    {
        float _1538 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1530 = _1538;
    }
    float _1540 = _1530;
    if (_1524)
    {
        float _1542 = rsqrt(_1520);
        _1406 = _1542;
    }
    float _1544 = _1406;
    if (_1524)
    {
        float _1546 = _1528 * _1540;
        _1532 = _1546;
    }
    float _1548 = _1532;
    float _1550 = _1482 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_1524)
    {
        float _1552 = _1548 * 0.15915493667125701904296875;
        _1408 = _1552;
    }
    float _1554 = _1408;
    float _1556 = fma(_1484, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1550);
    float _1558 = _1540;
    float _1560 = _1554;
    if (_1524)
    {
        float _1562 = _1554 * 6.283185482025146484375;
        float _1564 = sin(_1562);
        _1558 = _1564;
    }
    float _1566 = _1558;
    float _1568 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1570 = precise::max(0.0, _1568);
    float _1572 = _1498;
    float _1574 = _1570;
    if (_1524)
    {
        float _1576 = _1554 * 6.283185482025146484375;
        float _1578 = cos(_1576);
        _1572 = _1578;
    }
    float _1580 = _1572;
    float _1582 = -_1510;
    float _1584 = -_1570;
    float _1586 = fma(_1490, _1582, _1584);
    if (_1524)
    {
        float _1588 = _1586 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1574 = _1588;
    }
    float _1590 = _1574;
    float _1592 = _1590;
    if (!_1524)
    {
        _1560 = _1512;
    }
    float _1594 = _1560;
    float _1596 = _1566;
    float _1598 = _1594;
    if (_1524)
    {
        float _1600 = fma(_1566, _1590, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1592 = _1600;
    }
    float _1602 = _1592;
    if (!_1524)
    {
        _1596 = _1586;
    }
    float _1604 = _1596;
    float _1606 = _1604;
    float _1608 = _1580;
    if (_1524)
    {
        float _1610 = _1580 + (-1.0);
        _1534 = _1610;
    }
    float _1612 = _1534;
    float _1614 = _1612;
    if (_1524)
    {
        float _1616 = _1544 * _1602;
        _1536 = _1616;
    }
    float _1618 = _1536;
    float _1620 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1524)
    {
        float _1622 = _1612 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1614 = _1622;
    }
    float _1624 = _1614;
    float _1626 = _1624;
    if (_1524)
    {
        float _1628 = _1512 * _1618;
        _1598 = _1628;
    }
    float _1630 = _1598;
    float _1632 = _1482 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1634 = fma(_1024, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (_1524)
    {
        float _1636 = fma(_1586, _1580, _1624);
        _1606 = _1636;
    }
    float _1638 = _1606;
    if (!_1524)
    {
        _1626 = _1514;
    }
    float _1640 = _1626;
    float _1642 = _1640;
    if (_1524)
    {
        float _1644 = _1514 * _1618;
        _1642 = _1644;
    }
    float _1646 = _1642;
    if (!_1524)
    {
        _1608 = _1516;
    }
    float _1648 = _1608;
    float _1650 = _1648;
    if (_1524)
    {
        float _1652 = _1630 * _1630;
        _1650 = _1652;
    }
    float _1654 = _1650;
    if (!_1524)
    {
        _1620 = _1518;
    }
    float _1656 = _1620;
    float _1658 = _1656;
    if (_1524)
    {
        float _1660 = _1646 * _1646;
        _1658 = _1660;
    }
    float _1662 = _1658;
    float _1664 = fma(_1484, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1632);
    float _1666 = fma(_1638, _1638, _1654);
    float _1668 = floor(_1634);
    float _1670 = _1666 + _1662;
    float _1672 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1664);
    float _1674 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1676 = fma(_1508, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1674);
    float _1678 = precise::clamp(_1676, 0.0, 1.0);
    float _1680 = fma(_1016, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1682 = _1672 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1684 = rsqrt(_1670);
    float _1686 = -_1678;
    float _1688 = _1686 + 1.0;
    float _1690 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1692 = _1682 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1694 = -_1692;
    float _1696 = fma(_1694, _1690, 1.0);
    float _1698 = _1482 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1700 = _1482 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1702 = abs(_1688);
    float _1704 = log2(_1702);
    float _1706 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1556);
    float _1708 = fma(_1484, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1698);
    float _1710 = fma(_1484, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1700);
    float _1712 = -_1668;
    float _1714 = _1634 + _1712;
    float _1716 = _1706 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1718 = _1684 * _1630;
    float _1720 = _1684 * _1638;
    float _1722 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1710);
    float _1724 = _1684 * _1646;
    float _1726 = _1718 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1728 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1708);
    float _1730 = _1722 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1732 = floor(_1680);
    float _1734 = -_1726;
    float _1736 = fma(_1720, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1734);
    float _1738 = _1728 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1740 = _1730 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1742 = _1704 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1744 = -_1724;
    float _1746 = fma(_1744, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1736);
    float _1748 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1740);
    float _1750 = exp2(_1742);
    float _1752 = fma(_1746, -0.5, 0.5);
    float _1754 = _1730 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1756 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1748);
    float _1758 = fma(_1746, 0.5, 0.5);
    float _1760 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1754);
    float _1762 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1756);
    float _1764 = log2(_1696);
    float _1766 = _1730 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1768 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1760);
    float _1770 = fma(_1758, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1772 = -_1732;
    float _1774 = _1680 + _1772;
    float _1776 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1766);
    float _1778 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1768);
    float _1780 = fma(_1758, _1770, -0.212114393711090087890625);
    float _1782 = 1.0 / _1762;
    float _1784 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1776);
    float _1786 = sqrt(_1752);
    float _1788 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1784);
    float _1790 = _1764 * 0.693147182464599609375;
    float2 _5147 = float2(_1714, _1774);
    float _1792 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5147, float2(0.0), isnan(_5147)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5147, float2(0.0), isnan(_5147)), level(0.0)).x;
    float _1794 = fma(_1758, _1780, 1.570728778839111328125);
    float _1796 = _1778 * _1782;
    float _1798 = _1720 + 1.0;
    float _1800 = _1788 * _1782;
    float _1802 = fma(_1796, 0.5, 0.5);
    float _1804 = -_1720;
    float _1806 = fma(_1750, _1798, _1804);
    float _1808 = _1790 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1810 = fma(_1800, -0.5, 0.5);
    float _1812 = _1786 * 0.636619746685028076171875;
    float _1814 = fma(_1806, 0.5, 0.5);
    float3 _5189 = float3(_1802, _1810, _1808);
    float _1816 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5189, float3(0.0), isnan(_5189)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5189, float3(0.0), isnan(_5189)), level(0.0)).x;
    float _1818 = -_1794;
    float _1820 = fma(_1812, _1818, 1.0);
    float3 _5205 = float3(_1802, _1810, _1808);
    float4 _1823 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5205, float3(0.0), isnan(_5205)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5205, float3(0.0), isnan(_5205)), level(0.0)).xyzw;
    float _1825 = _1823.x;
    float _1827 = _1823.y;
    float _1829 = _1823.z;
    float _1831 = _1823.w;
    float2 _5221 = float2(_1820, _1814);
    float3 _1835 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5221, float2(0.0), isnan(_5221)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5221, float2(0.0), isnan(_5221)), level(0.0)).xyz;
    float _1837 = _1835.x;
    float _1839 = _1835.y;
    float _1841 = _1835.z;
    float _1843 = _1110 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1845 = _1110 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1847 = _1730 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1849 = _1508 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1851 = isnan(_1508);
    bool _1853 = _1849 || _1851;
    bool _1855 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1857 = _1853 || _1855;
    float _1859 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1843);
    float _1861 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1845);
    float _1863 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1847);
    float _1865 = fma(_1016, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1859);
    float _1867 = fma(_1016, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1861);
    float _1869 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1863);
    float _1871 = _1865 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1873 = _1867 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1875 = _1778 + _1762;
    float _1877 = 1.0 / _1871;
    float _1879 = _1873 + _1871;
    float _1881 = _1875 * 0.5;
    float _1883 = _1879 * _1877;
    float _1885 = _1883 * 0.5;
    float _1887 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1889 = fma(_1885, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1887);
    float _1891 = 1.0 / _1889;
    float _1893 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1895 = _1891 * _1893;
    float _1897 = abs(_1895);
    float _1899 = log2(_1897);
    bool _1901 = _1895 <= 8000.0;
    bool _1903 = isnan(_1895);
    bool _1905 = _1901 || _1903;
    bool _1907 = isnan(8000.0);
    bool _1909 = _1905 || _1907;
    float _1911 = float(_1909);
    float _1913 = _1899 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1915 = exp2(_1913);
    float _1917 = fma(_1915, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1919 = precise::clamp(_1917, 0.0, 1.0);
    float _1921 = _1704 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1923 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1869);
    float _1925 = fma(_1919, -2.0, 3.0);
    float _1927 = _1919 * _1919;
    float _1929 = in.m_79.x;
    float _1931 = exp2(_1921);
    float _1933 = _1923 + _1762;
    float _1935 = _1927 * _1925;
    out.gl_Position.x = _1778;
    out.gl_Position.y = _1788;
    out.gl_Position.z = _1923;
    out.gl_Position.w = _1762;
    float _1937 = _1933 * 0.5;
    float _1939 = -_1935;
    float _1941 = _1939 + 1.0;
    float _1943 = fma(_1941, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1935);
    float _1945 = _1762 * 0.5;
    float _1947 = _1911 * _1943;
    float _1949 = fma(_1788, -0.5, _1945);
    float _1951 = -_1931;
    float _1953 = _1951 + 1.0;
    float _1955 = _1947 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1957 = _1762;
    float _1959 = _1923;
    float _1961 = _1788;
    float _1963 = _1881;
    if (!_1857)
    {
        _1957 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1965 = _1957;
    float _1967 = _1953 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_81.x = _1881;
    out.m_81.y = _1949;
    out.m_81.z = _1937;
    out.m_81.w = _1762;
    float _1969 = _1965;
    float _1971 = _1965;
    if (!_1857)
    {
        _1959 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1973 = _1959;
    float _1975 = -_1967;
    float _1977 = _1975 + 1.0;
    float _1979 = _1977;
    float _1981 = _1973;
    float _1983 = _1973;
    if (!_1857)
    {
        _1961 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1985 = _1961;
    float _1987 = _1985;
    float _1989 = _1985;
    if (!_1857)
    {
        _1963 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1991 = _1963;
    float _1993 = -_1792;
    float _1995 = _1993 + 1.0;
    float _1997 = _1995 * _1955;
    float _1999 = precise::clamp(_1997, 0.0, 1.0);
    float _2001 = -_1999;
    float _2003 = fma(_2001, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2005 = _2003 * _1929;
    float _2007 = _1967 * _1816;
    float _2009 = _2005 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2011 = _1831 * _2007;
    out.m_83.x = _2009;
    float _2013 = _1841 * _2007;
    float _2015 = fma(_1837, _2011, _1825);
    float _2017 = fma(_1839, _2011, _1827);
    float _2019 = _1831 * _1977;
    float _2021 = fma(_1831, _2013, _1829);
    float _2023 = _2011;
    float _2025 = _1991;
    float _2027 = _1991;
    if (!_1857)
    {
        _2023 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2029 = _2023;
    float _2031 = _2029;
    float _2033 = _2029;
    if (!_1857)
    {
        _1979 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2035 = _1979;
    out.m_85.x = _2015;
    out.m_85.y = _2017;
    out.m_85.z = _2021;
    out.m_85.w = _2019;
    bool _2037 = !_1857;
    float _2039 = _2035;
    float _2041 = _2035;
    if (!_2037)
    {
        bool _2043 = _1508 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2045 = isnan(_1508);
        bool _2047 = _2043 || _2045;
        bool _2049 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2051 = _2047 || _2049;
        if (!_2051)
        {
            float _2053 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2055 = _1508 + _2053;
            float _2057 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2059 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2057;
            float _2061 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2063 = _2061 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2065 = 1.0 / _2059;
            float _2067 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2069 = _2067 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2071 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2073 = _2071 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2075 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2077 = _2075 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2079 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2081 = _2079 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2083 = _2055 * _2065;
            float _2085 = precise::clamp(_2083, 0.0, 1.0);
            float _2087 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2089 = _2087 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2091 = fma(_2085, _2063, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2093 = fma(_2085, _2089, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2095 = fma(_2085, _2069, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2097 = fma(_2085, _2073, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2099 = fma(_2085, _2077, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2101 = fma(_2085, _2081, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2027 = _2095;
            _1989 = _2099;
            _2033 = _2091;
            _1983 = _2097;
            _1971 = _2093;
            _2041 = _2101;
            _2103 = true;
        }
        else
        {
            bool _2105 = _1508 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2107 = isnan(_1508);
            bool _2109 = _2105 || _2107;
            bool _2111 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2113 = _2109 || _2111;
            if (!_2113)
            {
                _2031 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2115 = _2031;
            _2033 = _2115;
            if (!_2113)
            {
                _2025 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2117 = _2025;
            _2027 = _2117;
            if (!_2113)
            {
                _1969 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2119 = _1969;
            _1971 = _2119;
            if (!_2113)
            {
                _1981 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2121 = _1981;
            _1983 = _2121;
            if (!_2113)
            {
                _1987 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2123 = _1987;
            _1989 = _2123;
            if (!_2113)
            {
                _2039 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2125 = _2039;
            bool _2127 = !_2113;
            _2041 = _2125;
            if (!_2127)
            {
                bool _2129 = _1508 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2131 = isnan(_1508);
                bool _2133 = _2129 || _2131;
                bool _2135 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2137 = _2133 || _2135;
                if (!_2137)
                {
                    float _2139 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2141 = _1508 + _2139;
                    float _2143 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2145 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2143;
                    float _2147 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2149 = _2147 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2151 = 1.0 / _2145;
                    float _2153 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2155 = _2153 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2157 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2159 = _2157 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2161 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2163 = _2161 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2165 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2167 = _2165 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2169 = _2141 * _2151;
                    float _2171 = precise::clamp(_2169, 0.0, 1.0);
                    float _2173 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2175 = _2173 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2177 = fma(_2171, _2149, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2179 = fma(_2171, _2175, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2181 = fma(_2171, _2155, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2183 = fma(_2171, _2159, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2185 = fma(_2171, _2163, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2187 = fma(_2171, _2167, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2027 = _2181;
                    _1989 = _2185;
                    _2033 = _2177;
                    _1983 = _2183;
                    _1971 = _2179;
                    _2041 = _2187;
                    _2103 = true;
                }
                else
                {
                    _2027 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1989 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2033 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1983 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1971 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2041 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2103 = false;
    float _2189 = _2027;
    float _2191 = _1989;
    float _2193 = _2033;
    float _2195 = _1983;
    float _2197 = _1971;
    float _2199 = _2041;
    float _2201 = fma(_1246, -0.5, 0.5);
    float _2203 = precise::clamp(_2201, 0.0, 1.0);
    float _2205 = -_2189;
    float _2207 = _2205 + _2191;
    float _2209 = -_2193;
    float _2211 = _2209 + _2195;
    float _2213 = -_2197;
    float _2215 = _2213 + _2199;
    bool _2217 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2219 = fma(_2203, _2207, _2189);
    float _2221 = fma(_2203, _2211, _2193);
    float _2223 = fma(_2203, _2215, _2197);
    float _2225 = _2219 * 0.586610972881317138671875;
    out.m_87.x = 0.0;
    float _2227 = fma(_2221, 0.298911988735198974609375, _2225);
    float _2229 = fma(_2223, 0.114477999508380889892578125, _2227);
    float _2231 = -_2229;
    float _2233 = _2221 + _2231;
    float _2235 = -_2229;
    float _2237 = _2219 + _2235;
    float _2239 = -_2229;
    float _2241 = _2223 + _2239;
    float _2243 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2245 = fma(_2233, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2229);
    float _2247 = fma(_2237, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2229);
    float _2249 = fma(_2241, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2229);
    out.m_51.x = _2243;
    out.m_89.x = _2245;
    out.m_89.y = _2247;
    out.m_89.z = _2249;
    if (!_2217)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2251 = -_1482;
    float _2253 = _2251 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2255 = -_1484;
    float _2257 = _2255 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2259 = -_1486;
    float _2261 = _2259 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2263 = _2253 * _2253;
    float _2265 = fma(_2257, _2257, _2263);
    float _2267 = fma(_2261, _2261, _2265);
    float _2269 = sqrt(_2267);
    float _2271 = rsqrt(_2267);
    float _2273 = -_2269;
    float _2275 = _2273 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2277 = _2275 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2279 = precise::clamp(_2277, 0.0, 1.0);
    float _2281 = _2257 * _2271;
    float _2283 = _2253 * _2271;
    float _2285 = abs(_2279);
    float _2287 = log2(_2285);
    float _2289 = _2261 * _2271;
    float _2291 = _2281 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2293 = _1246 * _2283;
    float _2295 = -_2283;
    float _2297 = -_2291;
    float _2299 = fma(_2295, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2297);
    float _2301 = fma(_1244, _2281, _2293);
    float _2303 = -_2289;
    float _2305 = fma(_2303, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2299);
    float _2307 = fma(_1282, _2289, _2301);
    float _2309 = precise::clamp(_2307, 0.0, 1.0);
    float _2311 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2313 = _2305 + _2311;
    float _2315 = _2287 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2317 = _2313 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2319 = precise::clamp(_2317, 0.0, 1.0);
    float _2321 = exp2(_2315);
    float _2323 = _2321 * _2319;
    float _2325 = _2309 * _2323;
    float _2327 = _2325 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2329 = _2325 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2331 = _2325 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_87.x = _2327;
    out.m_87.y = _2329;
    out.m_87.z = _2331;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2103 = false;
    bool _1332 = false;
    bool _326 = false;
    bool _212 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_48.w;
    float _105 = trunc(_103);
    int _108 = int(_105);
    bool _112 = _108 >= 1;
    float _114 = 0.0;
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _114;
    float _118 = _116;
    if (!_112)
    {
        out.m_51.x = 0.0;
    }
    int _120 = 0;
    if (!_112)
    {
        float _122 = _116 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2388 = as_type<float>(_124);
        out.gl_Position.z = _2388;
    }
    if (!_112)
    {
        return out;
    }
    float _128 = in.m_53.w;
    bool _130 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_128);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = -_128;
    float _142 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _144 = 0.0;
    float _146 = _142;
    if (_138)
    {
        float _148 = float(_108);
        _144 = _148;
    }
    float _150 = _144;
    bool _152 = _142 >= _150;
    bool _154 = !_138;
    bool _156 = _152 || _154;
    if (_156)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _118;
    if (_156)
    {
        out.m_51.x = 0.0;
    }
    if (_156)
    {
        float _160 = _158 * 5.0;
        _126 = as_type<int>(_160);
    }
    int _162 = _126;
    if (_156)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2457 = as_type<float>(_162);
        out.gl_Position.z = _2457;
    }
    if (_156)
    {
        return out;
    }
    float _164 = in.m_55.x;
    float _166 = in.m_55.y;
    float _168 = in.m_55.z;
    bool _170 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _172 = _166 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _174 = _166 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _176 = _166 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _178 = fma(_164, (*spvDescriptorSet0.vp_c10)._m0[4].x, _172);
    float _180 = fma(_164, (*spvDescriptorSet0.vp_c10)._m0[5].x, _174);
    float _182 = fma(_164, (*spvDescriptorSet0.vp_c10)._m0[6].x, _176);
    float _184 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[4].z, _178);
    float _186 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[5].z, _180);
    float _188 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[6].z, _182);
    bool _190 = !_170;
    float _192 = _168;
    float _210;
    if (!_190)
    {
        float _194 = in.m_57.x;
        float _196 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _198 = _194 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _200 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[12].x, _142);
        float _202 = _200 * _196;
        float _204 = floor(_202);
        float _206 = -_204;
        float _208 = _202 + _206;
        _210 = _208;
        _212 = true;
    }
    else
    {
        float _214 = float(_108);
        float _216 = 1.0 / _214;
        float _218 = _142 * _216;
        _210 = _218;
    }
    _212 = false;
    float _220 = _210;
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _224 = _220 + _222;
    bool _226 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _228 = isnan(_220);
    bool _230 = _226 || _228;
    bool _232 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _234 = _230 || _232;
    float _236 = float(_234);
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _240 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _238;
    bool _242 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _244 = 1.0 / _240;
    float _246 = -_236;
    float _248 = _246 + 1.0;
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _252 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _250;
    float _254 = _224 * _244;
    bool _256 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _258 = isnan(_220);
    bool _260 = _256 || _258;
    bool _262 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _264 = _260 || _262;
    float _266 = float(_264);
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _270 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _268;
    float _272 = fma(_252, _254, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _274;
    float _278 = _266 * _248;
    float _280 = fma(_270, _254, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _282 = fma(_276, _254, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _284 = -_266;
    float _286 = _284 + 1.0;
    float _288 = _272 * _278;
    float _290 = _280 * _278;
    float _292 = _282 * _278;
    float _294 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[143].z, _288);
    float _296 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[143].x, _290);
    float _298 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[143].y, _292);
    float _300 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[144].x, _296);
    float _302 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[144].y, _298);
    float _304 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[144].z, _294);
    bool _306 = !_242;
    float _324;
    if (!_306)
    {
        float _308 = in.m_57.x;
        float _310 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _312 = _308 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _314 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[11].y, _142);
        float _316 = _314 * _310;
        float _318 = floor(_316);
        float _320 = -_318;
        float _322 = _316 + _320;
        _324 = _322;
        _326 = true;
    }
    else
    {
        float _328 = float(_108);
        float _330 = 1.0 / _328;
        float _332 = _142 * _330;
        _324 = _332;
    }
    _326 = false;
    float _334 = _324;
    float _336 = in.m_57.z;
    float _338 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _340 = log2(_338);
    int _342 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _344 = _342 != 0;
    float _346 = in.m_57.x;
    float _348 = in.m_57.w;
    float _350 = in.m_59.x;
    float _352 = _254;
    float _354 = _334;
    if (!_344)
    {
        float _356 = in.m_57.y;
        _352 = _356;
    }
    float _358 = _352;
    float _360 = _340 * _142;
    float _362 = _336 * 2.0;
    float _364 = exp2(_360);
    float _366 = _340;
    if (!_344)
    {
        _366 = _336;
    }
    float _368 = _366;
    float _370 = _346 * 2.0;
    float _372 = floor(_362);
    float _374 = _368;
    if (!_344)
    {
        _192 = _358;
    }
    float _376 = _192;
    float _378 = floor(_370);
    float _380 = -_364;
    float _382 = _380 + 1.0;
    float _384 = _376;
    float _386 = _358;
    if (_344)
    {
        float _388 = in.m_57.x;
        float _390 = in.m_57.y;
        _384 = _388;
        _386 = _390;
    }
    float _392 = _384;
    float _394 = _386;
    bool _396 = _372 > 0.0;
    bool _398 = _372 >= 0.0;
    bool _400 = isnan(_372);
    bool _402 = _398 || _400;
    bool _404 = isnan(0.0);
    bool _406 = _402 || _404;
    int _408 = _406 ? 0 : 1;
    bool _410 = _348 > 0.5;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _414 = 1.0 + _412;
    int _416 = ~_408;
    int _418 = _416 + 1;
    int _420 = _418 + 1;
    float _422 = 1.0 / _414;
    int _424 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _426 = _424 != 0;
    int _428 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _430 = _428 != 0;
    int _432 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _434 = _432 != 0;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _438 = _420;
    bool _440 = _434;
    if (!_396)
    {
        int _442 = ~_408;
        int _444 = _442 + 1;
        _438 = _444;
    }
    int _446 = _438;
    bool _448 = _378 > 0.0;
    bool _450 = _378 >= 0.0;
    bool _452 = isnan(_378);
    bool _454 = _450 || _452;
    bool _456 = isnan(0.0);
    bool _458 = _454 || _456;
    float _460 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[83].z, _436);
    float _462 = _392 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_344)
    {
        _374 = _394;
    }
    float _464 = _374;
    float _466 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _468 = _458 ? 0 : 1;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _472 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _474 = isnan(1.0);
    bool _476 = _472 || _474;
    bool _478 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _480 = _476 || _478;
    float _482 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[83].w, _466);
    float _484 = _464;
    if (!_344)
    {
        _484 = _336;
    }
    float _486 = _484;
    float _488 = -_470;
    float _490 = fma(_462, 2.0, _488);
    float _492 = in.m_61.x;
    float _494 = in.m_61.y;
    float _496 = in.m_61.z;
    float _498 = _486;
    if (_344)
    {
        _498 = _394;
    }
    float _500 = _498;
    float _502 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[82].z, _460);
    bool _504 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _506 = isnan(0.0);
    bool _508 = _504 || _506;
    bool _510 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _512 = _508 || _510;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _516 = ~_468;
    int _518 = _516 + 1;
    int _520 = _518 + 1;
    float _522 = _500 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _524 = _520;
    if (!_448)
    {
        int _526 = ~_468;
        int _528 = _526 + 1;
        _524 = _528;
    }
    int _530 = _524;
    float _532 = -_142;
    float _534 = fma(_532, (*spvDescriptorSet0.vp_c9)._m0[81].x, _490);
    float _536 = _512 ? _382 : 0.0;
    float _538 = fma(_522, -2.0, _514);
    float _540 = in.m_48.x;
    float _542 = in.m_48.y;
    float _544 = in.m_48.z;
    float _546 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[82].w, _482);
    float _548 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[81].y, _538);
    if (_480)
    {
        float _550 = _536 * _422;
        _146 = _550;
    }
    float _552 = _146;
    float _554 = _394 * 2.0;
    float _556 = in.m_63.x;
    float _558 = in.m_63.y;
    float _560 = in.m_63.z;
    bool _562 = !_426;
    int _564 = _562 ? 0 : 1;
    int _566 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _568 = _566 != 0;
    float _570 = floor(_554);
    int _572 = abs(_564);
    float _574 = _304 * _496;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _578 = _576 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _580 = _302 * _494;
    float _582 = _300 * _492;
    float _584 = _346 + _336;
    float _586 = 1.0 / _578;
    float _588 = _582 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _590 = _584 + (-1.0);
    float _592 = _580 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _594 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _596 = _594 != 0;
    float _598 = _542 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _600 = _542 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _602 = _542 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _604 = fma(_590, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _606 = fma(_540, (*spvDescriptorSet0.vp_c10)._m0[4].x, _598);
    bool _608 = !_430;
    int _610 = _608 ? 0 : 1;
    float _612 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _556);
    float _614 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _558);
    bool _616 = _570 >= 0.0;
    bool _618 = isnan(_570);
    bool _620 = _616 || _618;
    bool _622 = isnan(0.0);
    bool _624 = _620 || _622;
    float _626 = fma(_540, (*spvDescriptorSet0.vp_c10)._m0[5].x, _600);
    float _628 = _588 * _612;
    float _630 = _592 * _614;
    int _632 = abs(_610);
    float _634 = fma(_540, (*spvDescriptorSet0.vp_c10)._m0[6].x, _602);
    float _636 = in.m_65.x;
    float _638 = in.m_65.y;
    float _640 = in.m_65.z;
    int _642 = _624 ? 0 : 1;
    float _644 = _346 + _394;
    int _646 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _648 = _646 != 0;
    float _650 = fma(_544, (*spvDescriptorSet0.vp_c10)._m0[6].z, _634);
    int _652 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _654 = _652 != 0;
    float _656 = _644 + (-1.0);
    bool _658 = _570 > 0.0;
    float _660 = _336 + _394;
    float _662 = float(_572);
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _666 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _664;
    float _668 = float(_446);
    float _670 = _660 + (-1.0);
    float _672 = _666 * _586;
    float _674 = float(_530);
    float _676 = _662 * _668;
    bool _678 = !_434;
    int _680 = _678 ? 0 : 1;
    float _682 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _684 = float(_632);
    float _686 = in.m_59.y;
    float _688 = _676 * (-2.0);
    int _690 = ~_642;
    int _692 = _690 + 1;
    int _694 = _692 + 1;
    float _696 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _698 = _694;
    bool _700 = _658;
    float _702 = _606;
    int _704 = as_type<int>(_558);
    if (_568)
    {
        bool _706 = _346 > 0.5;
        _440 = _706;
    }
    bool _708 = _440;
    float _710 = _346 + (-0.5);
    if (!_658)
    {
        int _712 = ~_642;
        int _714 = _712 + 1;
        _698 = _714;
    }
    int _716 = _698;
    float _718 = fma(_688, _636, _636);
    int _720 = abs(_680);
    float _722 = _684 * _674;
    float _724 = fma(_682, _688, _682);
    float _726 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[196].x, _718);
    float _728 = float(_720);
    float _730 = _722 * (-2.0);
    float _732 = float(_716);
    float _734 = fma(_724, _552, _726);
    if (_596)
    {
        bool _736 = _336 > 0.5;
        _700 = _736;
    }
    bool _738 = _700;
    float _740 = fma(_730, _638, _638);
    float _742 = fma(_696, _730, _696);
    float _744 = _728 * _732;
    float _746 = _394 + (-0.5);
    float _748 = _734 * 0.15915493667125701904296875;
    float _750 = _574 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _752 = _744 * (-2.0);
    float _754 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[196].y, _740);
    float _756 = -_686;
    float _758 = _756 + 1.0;
    float _760 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _762 = fma(_604, _752, _604);
    float _764 = fma(_742, _552, _754);
    float _766 = fma(_752, _640, _640);
    int _768 = _410 ? as_type<int>(_758) : as_type<int>(_686);
    float _770 = in.m_67.x;
    float _772 = in.m_67.y;
    float _774 = in.m_67.z;
    bool _776 = _558 != 0.0;
    bool _778 = isnan(_558);
    bool _780 = _776 || _778;
    bool _782 = isnan(0.0);
    bool _784 = _780 || _782;
    float _786 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _560);
    float _788 = _336 + (-0.5);
    float _790 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _792 = _334 + _790;
    bool _794 = _556 == 0.0;
    bool _796 = !_784;
    bool _798 = _794 && _796;
    float _800 = _750 * _786;
    float _802 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[196].z, _766);
    float _804 = _764 * 0.15915493667125701904296875;
    bool _806 = _560 == 0.0;
    bool _808 = _806 && _798;
    float _810 = fma(_672, _792, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _812 = fma(_762, _552, _802);
    float _814 = _748 * 6.283185482025146484375;
    float _816 = sin(_814);
    float _818 = _760 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _820 = _334 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _822 = isnan(_334);
    bool _824 = _820 || _822;
    bool _826 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _828 = _824 || _826;
    float _830 = float(_828);
    float _832 = _812 * 0.15915493667125701904296875;
    float _834 = fma(_544, (*spvDescriptorSet0.vp_c10)._m0[4].z, _606);
    int _836 = _648 ? _768 : as_type<int>(_686);
    float _838 = fma(_544, (*spvDescriptorSet0.vp_c10)._m0[5].z, _626);
    bool _840 = _334 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _842 = isnan(_334);
    bool _844 = _840 || _842;
    bool _846 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _848 = _844 || _846;
    float _850 = float(_848);
    float _852 = _748 * 6.283185482025146484375;
    float _854 = cos(_852);
    float _856 = -_830;
    float _858 = _856 + 1.0;
    float _860 = fma(_818, as_type<float>(_836), -0.5);
    float _862 = _770;
    float _864 = _772;
    float _866 = _774;
    float _868 = _748;
    float _870 = _686;
    int _872 = _836;
    if (!_808)
    {
        float _874 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[17].y, _770);
        _862 = _874;
    }
    float _876 = _862;
    if (!_808)
    {
        float _878 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[17].y, _772);
        _864 = _878;
    }
    float _880 = _864;
    float _882 = _850 * _858;
    if (!_808)
    {
        float _884 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[17].y, _774);
        _866 = _884;
    }
    float _886 = _866;
    float _888 = _804 * 6.283185482025146484375;
    float _890 = sin(_888);
    if (!_568)
    {
        _868 = _350;
    }
    float _892 = _868;
    float _894 = -_850;
    float _896 = _894 + 1.0;
    bool _898 = _394 > 0.5;
    float _900 = _892;
    if (!_568)
    {
        _702 = _892;
    }
    float _902 = _702;
    float _904 = _902;
    if (_568)
    {
        _900 = _350;
    }
    float _906 = _900;
    float _908 = _804 * 6.283185482025146484375;
    float _910 = cos(_908);
    if (_654)
    {
        float _912 = _898 ? _758 : _686;
        _870 = _912;
    }
    float _914 = _870;
    if (!_596)
    {
        _354 = _906;
    }
    float _916 = _354;
    float _918 = _916;
    if (_568)
    {
        float _920 = -_906;
        float _922 = _920 + 1.0;
        _704 = as_type<int>(_922);
    }
    int _924 = _704;
    if (_596)
    {
        float _926 = -_906;
        float _928 = _926 + 1.0;
        _872 = as_type<int>(_928);
    }
    int _930 = _872;
    float _932 = _832 * 6.283185482025146484375;
    float _934 = cos(_932);
    float _936 = _810 * _882;
    if (_568)
    {
        float _938 = _708 ? as_type<float>(_924) : _906;
        _904 = _938;
    }
    float _940 = _904;
    float _942 = _816 * _890;
    if (_596)
    {
        float _944 = _738 ? as_type<float>(_930) : _906;
        _918 = _944;
    }
    float _946 = _918;
    float _948 = _854 * _890;
    float _950 = fma(_896, (*spvDescriptorSet0.vp_c9)._m0[115].x, _936);
    float _952 = _832 * 6.283185482025146484375;
    float _954 = sin(_952);
    float _956 = _854 * _910;
    float _958 = _816 * _910;
    float _960 = fma(_830, (*spvDescriptorSet0.vp_c9)._m0[116].x, _950);
    float _962 = _854 * _934;
    float _964 = _890 * _934;
    float _966 = _816 * _934;
    float _968 = _910 * _934;
    float _970 = _962 * _630;
    float _972 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _974 = fma(_954, _956, _942);
    float _976 = -_948;
    float _978 = fma(_954, _958, _976);
    float _980 = -_958;
    float _982 = fma(_954, _948, _980);
    float _984 = -_630;
    float _986 = _954 * _984;
    float _988 = fma(_974, _628, _970);
    float _990 = _966 * _630;
    float _992 = fma(_954, _942, _956);
    float _994 = fma(_968, _628, _986);
    float _996 = fma(_982, _800, _988);
    float _998 = fma(_978, _628, _990);
    float _1000 = _982 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1002 = fma(_964, _800, _994);
    float _1004 = _996 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1006 = _996 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1008 = fma(_992, _800, _998);
    float _1010 = _972 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1012 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1004);
    float _1014 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1006);
    float _1016 = _650 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1018 = fma(_1010, _946, -0.5);
    float _1020 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1012);
    float _1022 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1014);
    float _1024 = _834 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1026 = -_548;
    float _1028 = fma(_546, _860, _1026);
    float _1030 = _1020 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1032 = _1022 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1034 = fma(_502, _1018, _534);
    float _1036 = _962 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1038 = _1024 + _1030;
    float _1040 = _1016 + _1032;
    float _1042 = _962 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1044 = _962 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1046 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1048 = _1038 + _1046;
    float _1050 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1052 = _1040 + _1050;
    float _1054 = _974 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1056 = _974 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1058 = _1048 * _1048;
    float _1060 = _1052 * _1052;
    float _1062 = _974 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1064 = _996 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1066 = -_954;
    float _1068 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1036);
    float _1070 = _1058 + _1060;
    float _1072 = -_954;
    float _1074 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1044);
    float _1076 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1054);
    float _1078 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1056);
    float _1080 = sqrt(_1070);
    float _1082 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1062);
    float _1084 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1064);
    float _1086 = _982 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1088 = _982 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1090 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1000);
    float _1092 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1068);
    float _1094 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1074);
    float _1096 = -_954;
    float _1098 = fma(_1096, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1042);
    float _1100 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1084);
    float _1102 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1076);
    float _1104 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1078);
    float _1106 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1082);
    float _1108 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1110 = _838 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1112 = _1100 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _1114 = _1080 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1116 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1086);
    float _1118 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1088);
    float _1120 = _1110 + _1112;
    float _1122 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1098);
    float _1124 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1126 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1116);
    float _1128 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1118);
    float _1130 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1090);
    float _1132 = _992;
    float _1134 = _966;
    float _1136 = _1058;
    float _1138 = _1060;
    float _1140 = _1040;
    float _1142 = _1028;
    if (!_1114)
    {
        _1132 = _1058;
    }
    float _1144 = _1132;
    float _1146 = _1144;
    if (!_1114)
    {
        _1134 = _1038;
    }
    float _1148 = _1134;
    float _1150 = _1148;
    if (!_1114)
    {
        _1136 = _1120;
    }
    float _1152 = _1136;
    bool _1154 = !_1114;
    float _1156 = _1152;
    if (!_1154)
    {
        float _1158 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1160 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1162 = _1080 + _1160;
        float _1164 = rsqrt(_1070);
        float _1166 = _1162 * _1158;
        float _1168 = _1120 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1170 = _1166 * 0.15915493667125701904296875;
        float _1172 = _1170 * 6.283185482025146484375;
        float _1174 = sin(_1172);
        float _1176 = _1170 * 6.283185482025146484375;
        float _1178 = cos(_1176);
        float _1180 = fma(_1174, _1168, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1182 = _1164 * _1180;
        float _1184 = _1178 + (-1.0);
        float _1186 = fma(_1048, _1182, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1188 = fma(_1052, _1182, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1190 = _1184 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1192 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1194 = _1186 + _1192;
        float _1196 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1198 = _1188 + _1196;
        float _1200 = fma(_1120, _1178, _1190);
        float _1202 = _1194 * _1194;
        float _1204 = _1198 * _1198;
        _1156 = _1200;
        _1146 = _1202;
        _1138 = _1204;
        _1150 = _1186;
        _1140 = _1188;
    }
    float _1206 = _1156;
    float _1208 = _1146;
    float _1210 = _1138;
    float _1212 = _1150;
    float _1214 = _1140;
    float _1216 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1218 = _1206 + _1216;
    float _1220 = _1122 * _880;
    float _1222 = _1092 * _880;
    float _1224 = _1094 * _880;
    float _1226 = fma(_1218, _1218, _1208);
    float _1228 = fma(_1102, _876, _1220);
    float _1230 = fma(_1104, _876, _1222);
    float _1232 = _940 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1234 = _914 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1236 = _1226 + _1210;
    float _1238 = fma(_1106, _876, _1224);
    float _1240 = _1232 * _1108;
    float _1242 = _1234 * _1124;
    float _1244 = fma(_1126, _886, _1228);
    float _1246 = fma(_1128, _886, _1230);
    float _1248 = sqrt(_1236);
    float _1250 = _960 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1252 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1254 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1256 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1258 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1260 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1262 = _1034 + 0.5;
    float _1264 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1266 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1268 = _1252 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1270 = _1254 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1272 = _1256 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1274 = _1258 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1276 = _1260 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1278 = _1264 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1280 = _1028 + 0.5;
    float _1282 = fma(_1130, _886, _1238);
    out.m_69.x = 1.0;
    out.m_69.y = 1.0;
    out.m_69.z = 1.0;
    bool _1284 = _1248 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1286 = isnan(_1248);
    bool _1288 = _1284 || _1286;
    bool _1290 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1292 = _1288 || _1290;
    out.m_71.x = _1274;
    out.m_71.y = _1276;
    out.m_71.z = _1278;
    out.m_71.w = _1266;
    out.m_73.x = _1268;
    out.m_73.y = _1270;
    out.m_73.z = _1272;
    out.m_73.w = _1250;
    out.m_75.x = _1240;
    out.m_75.y = _1242;
    out.m_75.z = _1262;
    out.m_75.w = _1280;
    float _1294 = _1274;
    float _1296 = _1278;
    if (!_1292)
    {
        _1142 = 1.0;
    }
    float _1298 = _1142;
    out.m_77.x = _1244;
    out.m_77.y = _1246;
    out.m_77.z = _1282;
    bool _1300 = !_1292;
    float _1302 = _1298;
    if (!_1300)
    {
        bool _1304 = _1248 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1306 = isnan(_1248);
        bool _1308 = _1304 || _1306;
        bool _1310 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1312 = _1308 || _1310;
        if (!_1312)
        {
            float _1314 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1316 = _1248 + _1314;
            float _1318 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1320 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1318;
            float _1322 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1324 = _1322 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1326 = 1.0 / _1320;
            float _1328 = _1316 * _1326;
            float _1330 = fma(_1328, _1324, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1302 = _1330;
            _1332 = true;
        }
        else
        {
            bool _1334 = _1248 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1336 = isnan(_1248);
            bool _1338 = _1334 || _1336;
            bool _1340 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1342 = _1338 || _1340;
            if (!_1342)
            {
                float _1344 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1346 = _1248 + _1344;
                float _1348 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1350 = _1348 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1352 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1354 = _1352 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1356 = 1.0 / _1350;
                float _1358 = _1346 * _1356;
                float _1360 = fma(_1358, _1354, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1302 = _1360;
                _1332 = true;
            }
            else
            {
                _1302 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1332 = false;
    float _1362 = _1302;
    float _1364 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1366 = _1206 + _1364;
    float _1368 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1370 = _1212 + _1368;
    float _1372 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1374 = _1214 + _1372;
    float _1376 = fma(_1366, _1362, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1378 = fma(_1370, _1362, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1380 = fma(_1374, _1362, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1382 = -_1110;
    float _1384 = _1382 + _1376;
    float _1386 = -_1024;
    float _1388 = _1386 + _1378;
    float _1390 = -_1016;
    float _1392 = _1390 + _1380;
    float _1394 = _1384 * _1384;
    float _1396 = fma(_1388, _1388, _1394);
    float _1398 = fma(_1392, _1392, _1396);
    float _1400 = sqrt(_1398);
    bool _1402 = _1400 > 0.0;
    float _1404 = _1366;
    float _1406 = _1378;
    float _1408 = _1376;
    if (!_1402)
    {
        _1294 = _1378;
    }
    float _1410 = _1294;
    float _1412 = _1410;
    if (!_1402)
    {
        _1404 = _1376;
    }
    float _1414 = _1404;
    float _1416 = _1414;
    float _1418 = _1414;
    if (!_1402)
    {
        _1296 = _1380;
    }
    float _1420 = _1296;
    bool _1422 = !_1402;
    float _1424 = _1420;
    float _1426 = _1420;
    if (!_1422)
    {
        float _1428 = _186 * _186;
        float _1430 = fma(_184, _184, _1428);
        float _1432 = fma(_188, _188, _1430);
        float _1434 = rsqrt(_1398);
        float _1436 = sqrt(_1432);
        float _1438 = _1388 * _1434;
        float _1440 = _1384 * _1434;
        float _1442 = _1392 * _1434;
        bool _1444 = _1436 > 0.0;
        float _1446 = _1436;
        if (!_1444)
        {
            _1446 = _1378;
        }
        float _1448 = _1446;
        _1412 = _1448;
        if (!_1444)
        {
            _1416 = _1376;
        }
        float _1450 = _1416;
        _1418 = _1450;
        if (!_1444)
        {
            _1424 = _1380;
        }
        float _1452 = _1424;
        bool _1454 = !_1444;
        _1426 = _1452;
        if (!_1454)
        {
            float _1456 = rsqrt(_1432);
            float _1458 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1460 = _186 * _1456;
            float _1462 = _184 * _1456;
            float _1464 = _188 * _1456;
            float _1466 = _1440 * _1460;
            float _1468 = fma(_1438, _1462, _1466);
            float _1470 = _1458 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1472 = fma(_1442, _1464, _1468);
            float _1474 = _1472 * _1470;
            float _1476 = fma(_184, _1474, _1378);
            float _1478 = fma(_186, _1474, _1376);
            float _1480 = fma(_188, _1474, _1380);
            _1418 = _1478;
            _1412 = _1476;
            _1426 = _1480;
        }
    }
    float _1482 = _1418;
    float _1484 = _1412;
    float _1486 = _1426;
    float _1488 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1490 = _1482 + _1488;
    float _1492 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1494 = _1484 + _1492;
    float _1496 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1498 = _1486 + _1496;
    float _1500 = _1490 * _1490;
    float _1502 = fma(_1494, _1494, _1500);
    float _1504 = fma(_1498, _1498, _1502);
    float _1506 = rsqrt(_1504);
    float _1508 = sqrt(_1504);
    float _1510 = _1506 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1512 = _1494 * _1510;
    float _1514 = _1498 * _1510;
    float _1516 = _1512 * _1512;
    float _1518 = _1514 * _1514;
    float _1520 = _1516 + _1518;
    float _1522 = sqrt(_1520);
    bool _1524 = _1522 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1526 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1528 = _1522 + _1526;
    float _1530 = _1506;
    float _1532 = _1528;
    float _1534 = _1490;
    float _1536 = _1510;
    if (_1524)
    {
        float _1538 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1530 = _1538;
    }
    float _1540 = _1530;
    if (_1524)
    {
        float _1542 = rsqrt(_1520);
        _1406 = _1542;
    }
    float _1544 = _1406;
    if (_1524)
    {
        float _1546 = _1528 * _1540;
        _1532 = _1546;
    }
    float _1548 = _1532;
    float _1550 = _1482 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_1524)
    {
        float _1552 = _1548 * 0.15915493667125701904296875;
        _1408 = _1552;
    }
    float _1554 = _1408;
    float _1556 = fma(_1484, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1550);
    float _1558 = _1540;
    float _1560 = _1554;
    if (_1524)
    {
        float _1562 = _1554 * 6.283185482025146484375;
        float _1564 = sin(_1562);
        _1558 = _1564;
    }
    float _1566 = _1558;
    float _1568 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1570 = precise::max(0.0, _1568);
    float _1572 = _1498;
    float _1574 = _1570;
    if (_1524)
    {
        float _1576 = _1554 * 6.283185482025146484375;
        float _1578 = cos(_1576);
        _1572 = _1578;
    }
    float _1580 = _1572;
    float _1582 = -_1510;
    float _1584 = -_1570;
    float _1586 = fma(_1490, _1582, _1584);
    if (_1524)
    {
        float _1588 = _1586 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1574 = _1588;
    }
    float _1590 = _1574;
    float _1592 = _1590;
    if (!_1524)
    {
        _1560 = _1512;
    }
    float _1594 = _1560;
    float _1596 = _1566;
    float _1598 = _1594;
    if (_1524)
    {
        float _1600 = fma(_1566, _1590, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1592 = _1600;
    }
    float _1602 = _1592;
    if (!_1524)
    {
        _1596 = _1586;
    }
    float _1604 = _1596;
    float _1606 = _1604;
    float _1608 = _1580;
    if (_1524)
    {
        float _1610 = _1580 + (-1.0);
        _1534 = _1610;
    }
    float _1612 = _1534;
    float _1614 = _1612;
    if (_1524)
    {
        float _1616 = _1544 * _1602;
        _1536 = _1616;
    }
    float _1618 = _1536;
    float _1620 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1524)
    {
        float _1622 = _1612 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1614 = _1622;
    }
    float _1624 = _1614;
    float _1626 = _1624;
    if (_1524)
    {
        float _1628 = _1512 * _1618;
        _1598 = _1628;
    }
    float _1630 = _1598;
    float _1632 = _1482 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1634 = fma(_1024, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (_1524)
    {
        float _1636 = fma(_1586, _1580, _1624);
        _1606 = _1636;
    }
    float _1638 = _1606;
    if (!_1524)
    {
        _1626 = _1514;
    }
    float _1640 = _1626;
    float _1642 = _1640;
    if (_1524)
    {
        float _1644 = _1514 * _1618;
        _1642 = _1644;
    }
    float _1646 = _1642;
    if (!_1524)
    {
        _1608 = _1516;
    }
    float _1648 = _1608;
    float _1650 = _1648;
    if (_1524)
    {
        float _1652 = _1630 * _1630;
        _1650 = _1652;
    }
    float _1654 = _1650;
    if (!_1524)
    {
        _1620 = _1518;
    }
    float _1656 = _1620;
    float _1658 = _1656;
    if (_1524)
    {
        float _1660 = _1646 * _1646;
        _1658 = _1660;
    }
    float _1662 = _1658;
    float _1664 = fma(_1484, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1632);
    float _1666 = fma(_1638, _1638, _1654);
    float _1668 = floor(_1634);
    float _1670 = _1666 + _1662;
    float _1672 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1664);
    float _1674 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1676 = fma(_1508, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1674);
    float _1678 = precise::clamp(_1676, 0.0, 1.0);
    float _1680 = fma(_1016, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1682 = _1672 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1684 = rsqrt(_1670);
    float _1686 = -_1678;
    float _1688 = _1686 + 1.0;
    float _1690 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1692 = _1682 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1694 = -_1692;
    float _1696 = fma(_1694, _1690, 1.0);
    float _1698 = _1482 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1700 = _1482 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1702 = abs(_1688);
    float _1704 = log2(_1702);
    float _1706 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1556);
    float _1708 = fma(_1484, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1698);
    float _1710 = fma(_1484, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1700);
    float _1712 = -_1668;
    float _1714 = _1634 + _1712;
    float _1716 = _1706 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1718 = _1684 * _1630;
    float _1720 = _1684 * _1638;
    float _1722 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1710);
    float _1724 = _1684 * _1646;
    float _1726 = _1718 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1728 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1708);
    float _1730 = _1722 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1732 = floor(_1680);
    float _1734 = -_1726;
    float _1736 = fma(_1720, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1734);
    float _1738 = _1728 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1740 = _1730 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1742 = _1704 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1744 = -_1724;
    float _1746 = fma(_1744, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1736);
    float _1748 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1740);
    float _1750 = exp2(_1742);
    float _1752 = fma(_1746, -0.5, 0.5);
    float _1754 = _1730 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1756 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1748);
    float _1758 = fma(_1746, 0.5, 0.5);
    float _1760 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1754);
    float _1762 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1756);
    float _1764 = log2(_1696);
    float _1766 = _1730 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1768 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1760);
    float _1770 = fma(_1758, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1772 = -_1732;
    float _1774 = _1680 + _1772;
    float _1776 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1766);
    float _1778 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1768);
    float _1780 = fma(_1758, _1770, -0.212114393711090087890625);
    float _1782 = 1.0 / _1762;
    float _1784 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1776);
    float _1786 = sqrt(_1752);
    float _1788 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1784);
    float _1790 = _1764 * 0.693147182464599609375;
    float2 _5147 = float2(_1714, _1774);
    float _1792 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5147, float2(0.0), isnan(_5147)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5147, float2(0.0), isnan(_5147)), level(0.0)).x;
    float _1794 = fma(_1758, _1780, 1.570728778839111328125);
    float _1796 = _1778 * _1782;
    float _1798 = _1720 + 1.0;
    float _1800 = _1788 * _1782;
    float _1802 = fma(_1796, 0.5, 0.5);
    float _1804 = -_1720;
    float _1806 = fma(_1750, _1798, _1804);
    float _1808 = _1790 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1810 = fma(_1800, -0.5, 0.5);
    float _1812 = _1786 * 0.636619746685028076171875;
    float _1814 = fma(_1806, 0.5, 0.5);
    float3 _5189 = float3(_1802, _1810, _1808);
    float _1816 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5189, float3(0.0), isnan(_5189)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5189, float3(0.0), isnan(_5189)), level(0.0)).x;
    float _1818 = -_1794;
    float _1820 = fma(_1812, _1818, 1.0);
    float3 _5205 = float3(_1802, _1810, _1808);
    float4 _1823 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5205, float3(0.0), isnan(_5205)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5205, float3(0.0), isnan(_5205)), level(0.0)).xyzw;
    float _1825 = _1823.x;
    float _1827 = _1823.y;
    float _1829 = _1823.z;
    float _1831 = _1823.w;
    float2 _5221 = float2(_1820, _1814);
    float3 _1835 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5221, float2(0.0), isnan(_5221)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5221, float2(0.0), isnan(_5221)), level(0.0)).xyz;
    float _1837 = _1835.x;
    float _1839 = _1835.y;
    float _1841 = _1835.z;
    float _1843 = _1110 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1845 = _1110 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1847 = _1730 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1849 = _1508 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1851 = isnan(_1508);
    bool _1853 = _1849 || _1851;
    bool _1855 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1857 = _1853 || _1855;
    float _1859 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1843);
    float _1861 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1845);
    float _1863 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1847);
    float _1865 = fma(_1016, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1859);
    float _1867 = fma(_1016, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1861);
    float _1869 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1863);
    float _1871 = _1865 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1873 = _1867 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1875 = _1778 + _1762;
    float _1877 = 1.0 / _1871;
    float _1879 = _1873 + _1871;
    float _1881 = _1875 * 0.5;
    float _1883 = _1879 * _1877;
    float _1885 = _1883 * 0.5;
    float _1887 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1889 = fma(_1885, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1887);
    float _1891 = 1.0 / _1889;
    float _1893 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1895 = _1891 * _1893;
    float _1897 = abs(_1895);
    float _1899 = log2(_1897);
    bool _1901 = _1895 <= 8000.0;
    bool _1903 = isnan(_1895);
    bool _1905 = _1901 || _1903;
    bool _1907 = isnan(8000.0);
    bool _1909 = _1905 || _1907;
    float _1911 = float(_1909);
    float _1913 = _1899 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1915 = exp2(_1913);
    float _1917 = fma(_1915, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1919 = precise::clamp(_1917, 0.0, 1.0);
    float _1921 = _1704 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1923 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1869);
    float _1925 = fma(_1919, -2.0, 3.0);
    float _1927 = _1919 * _1919;
    float _1929 = in.m_79.x;
    float _1931 = exp2(_1921);
    float _1933 = _1923 + _1762;
    float _1935 = _1927 * _1925;
    out.gl_Position.x = _1778;
    out.gl_Position.y = _1788;
    out.gl_Position.z = _1923;
    out.gl_Position.w = _1762;
    float _1937 = _1933 * 0.5;
    float _1939 = -_1935;
    float _1941 = _1939 + 1.0;
    float _1943 = fma(_1941, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1935);
    float _1945 = _1762 * 0.5;
    float _1947 = _1911 * _1943;
    float _1949 = fma(_1788, -0.5, _1945);
    float _1951 = -_1931;
    float _1953 = _1951 + 1.0;
    float _1955 = _1947 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1957 = _1762;
    float _1959 = _1923;
    float _1961 = _1788;
    float _1963 = _1881;
    if (!_1857)
    {
        _1957 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1965 = _1957;
    float _1967 = _1953 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_81.x = _1881;
    out.m_81.y = _1949;
    out.m_81.z = _1937;
    out.m_81.w = _1762;
    float _1969 = _1965;
    float _1971 = _1965;
    if (!_1857)
    {
        _1959 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1973 = _1959;
    float _1975 = -_1967;
    float _1977 = _1975 + 1.0;
    float _1979 = _1977;
    float _1981 = _1973;
    float _1983 = _1973;
    if (!_1857)
    {
        _1961 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1985 = _1961;
    float _1987 = _1985;
    float _1989 = _1985;
    if (!_1857)
    {
        _1963 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1991 = _1963;
    float _1993 = -_1792;
    float _1995 = _1993 + 1.0;
    float _1997 = _1995 * _1955;
    float _1999 = precise::clamp(_1997, 0.0, 1.0);
    float _2001 = -_1999;
    float _2003 = fma(_2001, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2005 = _2003 * _1929;
    float _2007 = _1967 * _1816;
    float _2009 = _2005 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2011 = _1831 * _2007;
    out.m_83.x = _2009;
    float _2013 = _1841 * _2007;
    float _2015 = fma(_1837, _2011, _1825);
    float _2017 = fma(_1839, _2011, _1827);
    float _2019 = _1831 * _1977;
    float _2021 = fma(_1831, _2013, _1829);
    float _2023 = _2011;
    float _2025 = _1991;
    float _2027 = _1991;
    if (!_1857)
    {
        _2023 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2029 = _2023;
    float _2031 = _2029;
    float _2033 = _2029;
    if (!_1857)
    {
        _1979 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2035 = _1979;
    out.m_85.x = _2015;
    out.m_85.y = _2017;
    out.m_85.z = _2021;
    out.m_85.w = _2019;
    bool _2037 = !_1857;
    float _2039 = _2035;
    float _2041 = _2035;
    if (!_2037)
    {
        bool _2043 = _1508 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2045 = isnan(_1508);
        bool _2047 = _2043 || _2045;
        bool _2049 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2051 = _2047 || _2049;
        if (!_2051)
        {
            float _2053 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2055 = _1508 + _2053;
            float _2057 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2059 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2057;
            float _2061 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2063 = _2061 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2065 = 1.0 / _2059;
            float _2067 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2069 = _2067 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2071 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2073 = _2071 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2075 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2077 = _2075 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2079 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2081 = _2079 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2083 = _2055 * _2065;
            float _2085 = precise::clamp(_2083, 0.0, 1.0);
            float _2087 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2089 = _2087 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2091 = fma(_2085, _2063, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2093 = fma(_2085, _2089, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2095 = fma(_2085, _2069, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2097 = fma(_2085, _2073, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2099 = fma(_2085, _2077, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2101 = fma(_2085, _2081, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2027 = _2095;
            _1989 = _2099;
            _2033 = _2091;
            _1983 = _2097;
            _1971 = _2093;
            _2041 = _2101;
            _2103 = true;
        }
        else
        {
            bool _2105 = _1508 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2107 = isnan(_1508);
            bool _2109 = _2105 || _2107;
            bool _2111 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2113 = _2109 || _2111;
            if (!_2113)
            {
                _2031 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2115 = _2031;
            _2033 = _2115;
            if (!_2113)
            {
                _2025 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2117 = _2025;
            _2027 = _2117;
            if (!_2113)
            {
                _1969 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2119 = _1969;
            _1971 = _2119;
            if (!_2113)
            {
                _1981 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2121 = _1981;
            _1983 = _2121;
            if (!_2113)
            {
                _1987 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2123 = _1987;
            _1989 = _2123;
            if (!_2113)
            {
                _2039 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2125 = _2039;
            bool _2127 = !_2113;
            _2041 = _2125;
            if (!_2127)
            {
                bool _2129 = _1508 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2131 = isnan(_1508);
                bool _2133 = _2129 || _2131;
                bool _2135 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2137 = _2133 || _2135;
                if (!_2137)
                {
                    float _2139 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2141 = _1508 + _2139;
                    float _2143 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2145 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2143;
                    float _2147 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2149 = _2147 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2151 = 1.0 / _2145;
                    float _2153 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2155 = _2153 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2157 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2159 = _2157 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2161 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2163 = _2161 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2165 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2167 = _2165 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2169 = _2141 * _2151;
                    float _2171 = precise::clamp(_2169, 0.0, 1.0);
                    float _2173 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2175 = _2173 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2177 = fma(_2171, _2149, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2179 = fma(_2171, _2175, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2181 = fma(_2171, _2155, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2183 = fma(_2171, _2159, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2185 = fma(_2171, _2163, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2187 = fma(_2171, _2167, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2027 = _2181;
                    _1989 = _2185;
                    _2033 = _2177;
                    _1983 = _2183;
                    _1971 = _2179;
                    _2041 = _2187;
                    _2103 = true;
                }
                else
                {
                    _2027 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1989 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2033 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1983 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1971 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2041 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2103 = false;
    float _2189 = _2027;
    float _2191 = _1989;
    float _2193 = _2033;
    float _2195 = _1983;
    float _2197 = _1971;
    float _2199 = _2041;
    float _2201 = fma(_1246, -0.5, 0.5);
    float _2203 = precise::clamp(_2201, 0.0, 1.0);
    float _2205 = -_2189;
    float _2207 = _2205 + _2191;
    float _2209 = -_2193;
    float _2211 = _2209 + _2195;
    float _2213 = -_2197;
    float _2215 = _2213 + _2199;
    bool _2217 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2219 = fma(_2203, _2207, _2189);
    float _2221 = fma(_2203, _2211, _2193);
    float _2223 = fma(_2203, _2215, _2197);
    float _2225 = _2219 * 0.586610972881317138671875;
    out.m_87.x = 0.0;
    float _2227 = fma(_2221, 0.298911988735198974609375, _2225);
    float _2229 = fma(_2223, 0.114477999508380889892578125, _2227);
    float _2231 = -_2229;
    float _2233 = _2221 + _2231;
    float _2235 = -_2229;
    float _2237 = _2219 + _2235;
    float _2239 = -_2229;
    float _2241 = _2223 + _2239;
    float _2243 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2245 = fma(_2233, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2229);
    float _2247 = fma(_2237, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2229);
    float _2249 = fma(_2241, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2229);
    out.m_51.x = _2243;
    out.m_89.x = _2245;
    out.m_89.y = _2247;
    out.m_89.z = _2249;
    if (!_2217)
    {
        return out;
    }
    float _2251 = -_1482;
    float _2253 = _2251 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2255 = -_1484;
    float _2257 = _2255 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2259 = -_1486;
    float _2261 = _2259 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2263 = _2253 * _2253;
    float _2265 = fma(_2257, _2257, _2263);
    float _2267 = fma(_2261, _2261, _2265);
    float _2269 = sqrt(_2267);
    float _2271 = rsqrt(_2267);
    float _2273 = -_2269;
    float _2275 = _2273 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2277 = _2275 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2279 = precise::clamp(_2277, 0.0, 1.0);
    float _2281 = _2257 * _2271;
    float _2283 = _2253 * _2271;
    float _2285 = abs(_2279);
    float _2287 = log2(_2285);
    float _2289 = _2261 * _2271;
    float _2291 = _2281 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2293 = _1246 * _2283;
    float _2295 = -_2283;
    float _2297 = -_2291;
    float _2299 = fma(_2295, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2297);
    float _2301 = fma(_1244, _2281, _2293);
    float _2303 = -_2289;
    float _2305 = fma(_2303, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2299);
    float _2307 = fma(_1282, _2289, _2301);
    float _2309 = precise::clamp(_2307, 0.0, 1.0);
    float _2311 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2313 = _2305 + _2311;
    float _2315 = _2287 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2317 = _2313 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2319 = precise::clamp(_2317, 0.0, 1.0);
    float _2321 = exp2(_2315);
    float _2323 = _2321 * _2319;
    float _2325 = _2309 * _2323;
    float _2327 = _2325 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2329 = _2325 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2331 = _2325 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_87.x = _2327;
    out.m_87.y = _2329;
    out.m_87.z = _2331;
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
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2103 = false;
    bool _1332 = false;
    bool _326 = false;
    bool _212 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_48.w;
    float _105 = trunc(_103);
    int _108 = int(_105);
    bool _112 = _108 >= 1;
    float _114 = 0.0;
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _114;
    float _118 = _116;
    if (!_112)
    {
        out.m_51.x = 0.0;
    }
    int _120 = 0;
    if (!_112)
    {
        float _122 = _116 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2388 = as_type<float>(_124);
        out.gl_Position.z = _2388;
    }
    if (!_112)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _128 = in.m_53.w;
    bool _130 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_128);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = -_128;
    float _142 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _144 = 0.0;
    float _146 = _142;
    if (_138)
    {
        float _148 = float(_108);
        _144 = _148;
    }
    float _150 = _144;
    bool _152 = _142 >= _150;
    bool _154 = !_138;
    bool _156 = _152 || _154;
    if (_156)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _118;
    if (_156)
    {
        out.m_51.x = 0.0;
    }
    if (_156)
    {
        float _160 = _158 * 5.0;
        _126 = as_type<int>(_160);
    }
    int _162 = _126;
    if (_156)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2457 = as_type<float>(_162);
        out.gl_Position.z = _2457;
    }
    if (_156)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _164 = in.m_55.x;
    float _166 = in.m_55.y;
    float _168 = in.m_55.z;
    bool _170 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _172 = _166 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _174 = _166 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _176 = _166 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _178 = fma(_164, (*spvDescriptorSet0.vp_c10)._m0[4].x, _172);
    float _180 = fma(_164, (*spvDescriptorSet0.vp_c10)._m0[5].x, _174);
    float _182 = fma(_164, (*spvDescriptorSet0.vp_c10)._m0[6].x, _176);
    float _184 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[4].z, _178);
    float _186 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[5].z, _180);
    float _188 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[6].z, _182);
    bool _190 = !_170;
    float _192 = _168;
    float _210;
    if (!_190)
    {
        float _194 = in.m_57.x;
        float _196 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _198 = _194 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _200 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[12].x, _142);
        float _202 = _200 * _196;
        float _204 = floor(_202);
        float _206 = -_204;
        float _208 = _202 + _206;
        _210 = _208;
        _212 = true;
    }
    else
    {
        float _214 = float(_108);
        float _216 = 1.0 / _214;
        float _218 = _142 * _216;
        _210 = _218;
    }
    _212 = false;
    float _220 = _210;
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _224 = _220 + _222;
    bool _226 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _228 = isnan(_220);
    bool _230 = _226 || _228;
    bool _232 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _234 = _230 || _232;
    float _236 = float(_234);
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _240 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _238;
    bool _242 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _244 = 1.0 / _240;
    float _246 = -_236;
    float _248 = _246 + 1.0;
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _252 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _250;
    float _254 = _224 * _244;
    bool _256 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _258 = isnan(_220);
    bool _260 = _256 || _258;
    bool _262 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _264 = _260 || _262;
    float _266 = float(_264);
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _270 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _268;
    float _272 = fma(_252, _254, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _274;
    float _278 = _266 * _248;
    float _280 = fma(_270, _254, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _282 = fma(_276, _254, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _284 = -_266;
    float _286 = _284 + 1.0;
    float _288 = _272 * _278;
    float _290 = _280 * _278;
    float _292 = _282 * _278;
    float _294 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[143].z, _288);
    float _296 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[143].x, _290);
    float _298 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[143].y, _292);
    float _300 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[144].x, _296);
    float _302 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[144].y, _298);
    float _304 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[144].z, _294);
    bool _306 = !_242;
    float _324;
    if (!_306)
    {
        float _308 = in.m_57.x;
        float _310 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _312 = _308 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _314 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[11].y, _142);
        float _316 = _314 * _310;
        float _318 = floor(_316);
        float _320 = -_318;
        float _322 = _316 + _320;
        _324 = _322;
        _326 = true;
    }
    else
    {
        float _328 = float(_108);
        float _330 = 1.0 / _328;
        float _332 = _142 * _330;
        _324 = _332;
    }
    _326 = false;
    float _334 = _324;
    float _336 = in.m_57.z;
    float _338 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _340 = log2(_338);
    int _342 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _344 = _342 != 0;
    float _346 = in.m_57.x;
    float _348 = in.m_57.w;
    float _350 = in.m_59.x;
    float _352 = _254;
    float _354 = _334;
    if (!_344)
    {
        float _356 = in.m_57.y;
        _352 = _356;
    }
    float _358 = _352;
    float _360 = _340 * _142;
    float _362 = _336 * 2.0;
    float _364 = exp2(_360);
    float _366 = _340;
    if (!_344)
    {
        _366 = _336;
    }
    float _368 = _366;
    float _370 = _346 * 2.0;
    float _372 = floor(_362);
    float _374 = _368;
    if (!_344)
    {
        _192 = _358;
    }
    float _376 = _192;
    float _378 = floor(_370);
    float _380 = -_364;
    float _382 = _380 + 1.0;
    float _384 = _376;
    float _386 = _358;
    if (_344)
    {
        float _388 = in.m_57.x;
        float _390 = in.m_57.y;
        _384 = _388;
        _386 = _390;
    }
    float _392 = _384;
    float _394 = _386;
    bool _396 = _372 > 0.0;
    bool _398 = _372 >= 0.0;
    bool _400 = isnan(_372);
    bool _402 = _398 || _400;
    bool _404 = isnan(0.0);
    bool _406 = _402 || _404;
    int _408 = _406 ? 0 : 1;
    bool _410 = _348 > 0.5;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _414 = 1.0 + _412;
    int _416 = ~_408;
    int _418 = _416 + 1;
    int _420 = _418 + 1;
    float _422 = 1.0 / _414;
    int _424 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _426 = _424 != 0;
    int _428 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _430 = _428 != 0;
    int _432 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _434 = _432 != 0;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _438 = _420;
    bool _440 = _434;
    if (!_396)
    {
        int _442 = ~_408;
        int _444 = _442 + 1;
        _438 = _444;
    }
    int _446 = _438;
    bool _448 = _378 > 0.0;
    bool _450 = _378 >= 0.0;
    bool _452 = isnan(_378);
    bool _454 = _450 || _452;
    bool _456 = isnan(0.0);
    bool _458 = _454 || _456;
    float _460 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[83].z, _436);
    float _462 = _392 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_344)
    {
        _374 = _394;
    }
    float _464 = _374;
    float _466 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _468 = _458 ? 0 : 1;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _472 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _474 = isnan(1.0);
    bool _476 = _472 || _474;
    bool _478 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _480 = _476 || _478;
    float _482 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[83].w, _466);
    float _484 = _464;
    if (!_344)
    {
        _484 = _336;
    }
    float _486 = _484;
    float _488 = -_470;
    float _490 = fma(_462, 2.0, _488);
    float _492 = in.m_61.x;
    float _494 = in.m_61.y;
    float _496 = in.m_61.z;
    float _498 = _486;
    if (_344)
    {
        _498 = _394;
    }
    float _500 = _498;
    float _502 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[82].z, _460);
    bool _504 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _506 = isnan(0.0);
    bool _508 = _504 || _506;
    bool _510 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _512 = _508 || _510;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _516 = ~_468;
    int _518 = _516 + 1;
    int _520 = _518 + 1;
    float _522 = _500 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _524 = _520;
    if (!_448)
    {
        int _526 = ~_468;
        int _528 = _526 + 1;
        _524 = _528;
    }
    int _530 = _524;
    float _532 = -_142;
    float _534 = fma(_532, (*spvDescriptorSet0.vp_c9)._m0[81].x, _490);
    float _536 = _512 ? _382 : 0.0;
    float _538 = fma(_522, -2.0, _514);
    float _540 = in.m_48.x;
    float _542 = in.m_48.y;
    float _544 = in.m_48.z;
    float _546 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[82].w, _482);
    float _548 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[81].y, _538);
    if (_480)
    {
        float _550 = _536 * _422;
        _146 = _550;
    }
    float _552 = _146;
    float _554 = _394 * 2.0;
    float _556 = in.m_63.x;
    float _558 = in.m_63.y;
    float _560 = in.m_63.z;
    bool _562 = !_426;
    int _564 = _562 ? 0 : 1;
    int _566 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _568 = _566 != 0;
    float _570 = floor(_554);
    int _572 = abs(_564);
    float _574 = _304 * _496;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _578 = _576 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _580 = _302 * _494;
    float _582 = _300 * _492;
    float _584 = _346 + _336;
    float _586 = 1.0 / _578;
    float _588 = _582 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _590 = _584 + (-1.0);
    float _592 = _580 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _594 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _596 = _594 != 0;
    float _598 = _542 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _600 = _542 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _602 = _542 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _604 = fma(_590, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _606 = fma(_540, (*spvDescriptorSet0.vp_c10)._m0[4].x, _598);
    bool _608 = !_430;
    int _610 = _608 ? 0 : 1;
    float _612 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _556);
    float _614 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _558);
    bool _616 = _570 >= 0.0;
    bool _618 = isnan(_570);
    bool _620 = _616 || _618;
    bool _622 = isnan(0.0);
    bool _624 = _620 || _622;
    float _626 = fma(_540, (*spvDescriptorSet0.vp_c10)._m0[5].x, _600);
    float _628 = _588 * _612;
    float _630 = _592 * _614;
    int _632 = abs(_610);
    float _634 = fma(_540, (*spvDescriptorSet0.vp_c10)._m0[6].x, _602);
    float _636 = in.m_65.x;
    float _638 = in.m_65.y;
    float _640 = in.m_65.z;
    int _642 = _624 ? 0 : 1;
    float _644 = _346 + _394;
    int _646 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _648 = _646 != 0;
    float _650 = fma(_544, (*spvDescriptorSet0.vp_c10)._m0[6].z, _634);
    int _652 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _654 = _652 != 0;
    float _656 = _644 + (-1.0);
    bool _658 = _570 > 0.0;
    float _660 = _336 + _394;
    float _662 = float(_572);
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _666 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _664;
    float _668 = float(_446);
    float _670 = _660 + (-1.0);
    float _672 = _666 * _586;
    float _674 = float(_530);
    float _676 = _662 * _668;
    bool _678 = !_434;
    int _680 = _678 ? 0 : 1;
    float _682 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _684 = float(_632);
    float _686 = in.m_59.y;
    float _688 = _676 * (-2.0);
    int _690 = ~_642;
    int _692 = _690 + 1;
    int _694 = _692 + 1;
    float _696 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _698 = _694;
    bool _700 = _658;
    float _702 = _606;
    int _704 = as_type<int>(_558);
    if (_568)
    {
        bool _706 = _346 > 0.5;
        _440 = _706;
    }
    bool _708 = _440;
    float _710 = _346 + (-0.5);
    if (!_658)
    {
        int _712 = ~_642;
        int _714 = _712 + 1;
        _698 = _714;
    }
    int _716 = _698;
    float _718 = fma(_688, _636, _636);
    int _720 = abs(_680);
    float _722 = _684 * _674;
    float _724 = fma(_682, _688, _682);
    float _726 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[196].x, _718);
    float _728 = float(_720);
    float _730 = _722 * (-2.0);
    float _732 = float(_716);
    float _734 = fma(_724, _552, _726);
    if (_596)
    {
        bool _736 = _336 > 0.5;
        _700 = _736;
    }
    bool _738 = _700;
    float _740 = fma(_730, _638, _638);
    float _742 = fma(_696, _730, _696);
    float _744 = _728 * _732;
    float _746 = _394 + (-0.5);
    float _748 = _734 * 0.15915493667125701904296875;
    float _750 = _574 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _752 = _744 * (-2.0);
    float _754 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[196].y, _740);
    float _756 = -_686;
    float _758 = _756 + 1.0;
    float _760 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _762 = fma(_604, _752, _604);
    float _764 = fma(_742, _552, _754);
    float _766 = fma(_752, _640, _640);
    int _768 = _410 ? as_type<int>(_758) : as_type<int>(_686);
    float _770 = in.m_67.x;
    float _772 = in.m_67.y;
    float _774 = in.m_67.z;
    bool _776 = _558 != 0.0;
    bool _778 = isnan(_558);
    bool _780 = _776 || _778;
    bool _782 = isnan(0.0);
    bool _784 = _780 || _782;
    float _786 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _560);
    float _788 = _336 + (-0.5);
    float _790 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _792 = _334 + _790;
    bool _794 = _556 == 0.0;
    bool _796 = !_784;
    bool _798 = _794 && _796;
    float _800 = _750 * _786;
    float _802 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[196].z, _766);
    float _804 = _764 * 0.15915493667125701904296875;
    bool _806 = _560 == 0.0;
    bool _808 = _806 && _798;
    float _810 = fma(_672, _792, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _812 = fma(_762, _552, _802);
    float _814 = _748 * 6.283185482025146484375;
    float _816 = sin(_814);
    float _818 = _760 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _820 = _334 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _822 = isnan(_334);
    bool _824 = _820 || _822;
    bool _826 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _828 = _824 || _826;
    float _830 = float(_828);
    float _832 = _812 * 0.15915493667125701904296875;
    float _834 = fma(_544, (*spvDescriptorSet0.vp_c10)._m0[4].z, _606);
    int _836 = _648 ? _768 : as_type<int>(_686);
    float _838 = fma(_544, (*spvDescriptorSet0.vp_c10)._m0[5].z, _626);
    bool _840 = _334 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _842 = isnan(_334);
    bool _844 = _840 || _842;
    bool _846 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _848 = _844 || _846;
    float _850 = float(_848);
    float _852 = _748 * 6.283185482025146484375;
    float _854 = cos(_852);
    float _856 = -_830;
    float _858 = _856 + 1.0;
    float _860 = fma(_818, as_type<float>(_836), -0.5);
    float _862 = _770;
    float _864 = _772;
    float _866 = _774;
    float _868 = _748;
    float _870 = _686;
    int _872 = _836;
    if (!_808)
    {
        float _874 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[17].y, _770);
        _862 = _874;
    }
    float _876 = _862;
    if (!_808)
    {
        float _878 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[17].y, _772);
        _864 = _878;
    }
    float _880 = _864;
    float _882 = _850 * _858;
    if (!_808)
    {
        float _884 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[17].y, _774);
        _866 = _884;
    }
    float _886 = _866;
    float _888 = _804 * 6.283185482025146484375;
    float _890 = sin(_888);
    if (!_568)
    {
        _868 = _350;
    }
    float _892 = _868;
    float _894 = -_850;
    float _896 = _894 + 1.0;
    bool _898 = _394 > 0.5;
    float _900 = _892;
    if (!_568)
    {
        _702 = _892;
    }
    float _902 = _702;
    float _904 = _902;
    if (_568)
    {
        _900 = _350;
    }
    float _906 = _900;
    float _908 = _804 * 6.283185482025146484375;
    float _910 = cos(_908);
    if (_654)
    {
        float _912 = _898 ? _758 : _686;
        _870 = _912;
    }
    float _914 = _870;
    if (!_596)
    {
        _354 = _906;
    }
    float _916 = _354;
    float _918 = _916;
    if (_568)
    {
        float _920 = -_906;
        float _922 = _920 + 1.0;
        _704 = as_type<int>(_922);
    }
    int _924 = _704;
    if (_596)
    {
        float _926 = -_906;
        float _928 = _926 + 1.0;
        _872 = as_type<int>(_928);
    }
    int _930 = _872;
    float _932 = _832 * 6.283185482025146484375;
    float _934 = cos(_932);
    float _936 = _810 * _882;
    if (_568)
    {
        float _938 = _708 ? as_type<float>(_924) : _906;
        _904 = _938;
    }
    float _940 = _904;
    float _942 = _816 * _890;
    if (_596)
    {
        float _944 = _738 ? as_type<float>(_930) : _906;
        _918 = _944;
    }
    float _946 = _918;
    float _948 = _854 * _890;
    float _950 = fma(_896, (*spvDescriptorSet0.vp_c9)._m0[115].x, _936);
    float _952 = _832 * 6.283185482025146484375;
    float _954 = sin(_952);
    float _956 = _854 * _910;
    float _958 = _816 * _910;
    float _960 = fma(_830, (*spvDescriptorSet0.vp_c9)._m0[116].x, _950);
    float _962 = _854 * _934;
    float _964 = _890 * _934;
    float _966 = _816 * _934;
    float _968 = _910 * _934;
    float _970 = _962 * _630;
    float _972 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _974 = fma(_954, _956, _942);
    float _976 = -_948;
    float _978 = fma(_954, _958, _976);
    float _980 = -_958;
    float _982 = fma(_954, _948, _980);
    float _984 = -_630;
    float _986 = _954 * _984;
    float _988 = fma(_974, _628, _970);
    float _990 = _966 * _630;
    float _992 = fma(_954, _942, _956);
    float _994 = fma(_968, _628, _986);
    float _996 = fma(_982, _800, _988);
    float _998 = fma(_978, _628, _990);
    float _1000 = _982 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1002 = fma(_964, _800, _994);
    float _1004 = _996 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1006 = _996 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1008 = fma(_992, _800, _998);
    float _1010 = _972 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1012 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1004);
    float _1014 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1006);
    float _1016 = _650 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1018 = fma(_1010, _946, -0.5);
    float _1020 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1012);
    float _1022 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1014);
    float _1024 = _834 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1026 = -_548;
    float _1028 = fma(_546, _860, _1026);
    float _1030 = _1020 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1032 = _1022 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1034 = fma(_502, _1018, _534);
    float _1036 = _962 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1038 = _1024 + _1030;
    float _1040 = _1016 + _1032;
    float _1042 = _962 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1044 = _962 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1046 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1048 = _1038 + _1046;
    float _1050 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1052 = _1040 + _1050;
    float _1054 = _974 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1056 = _974 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1058 = _1048 * _1048;
    float _1060 = _1052 * _1052;
    float _1062 = _974 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1064 = _996 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1066 = -_954;
    float _1068 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1036);
    float _1070 = _1058 + _1060;
    float _1072 = -_954;
    float _1074 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1044);
    float _1076 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1054);
    float _1078 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1056);
    float _1080 = sqrt(_1070);
    float _1082 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1062);
    float _1084 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1064);
    float _1086 = _982 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1088 = _982 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1090 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1000);
    float _1092 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1068);
    float _1094 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1074);
    float _1096 = -_954;
    float _1098 = fma(_1096, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1042);
    float _1100 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1084);
    float _1102 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1076);
    float _1104 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1078);
    float _1106 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1082);
    float _1108 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1110 = _838 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1112 = _1100 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _1114 = _1080 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1116 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1086);
    float _1118 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1088);
    float _1120 = _1110 + _1112;
    float _1122 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1098);
    float _1124 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1126 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1116);
    float _1128 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1118);
    float _1130 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1090);
    float _1132 = _992;
    float _1134 = _966;
    float _1136 = _1058;
    float _1138 = _1060;
    float _1140 = _1040;
    float _1142 = _1028;
    if (!_1114)
    {
        _1132 = _1058;
    }
    float _1144 = _1132;
    float _1146 = _1144;
    if (!_1114)
    {
        _1134 = _1038;
    }
    float _1148 = _1134;
    float _1150 = _1148;
    if (!_1114)
    {
        _1136 = _1120;
    }
    float _1152 = _1136;
    bool _1154 = !_1114;
    float _1156 = _1152;
    if (!_1154)
    {
        float _1158 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1160 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1162 = _1080 + _1160;
        float _1164 = rsqrt(_1070);
        float _1166 = _1162 * _1158;
        float _1168 = _1120 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1170 = _1166 * 0.15915493667125701904296875;
        float _1172 = _1170 * 6.283185482025146484375;
        float _1174 = sin(_1172);
        float _1176 = _1170 * 6.283185482025146484375;
        float _1178 = cos(_1176);
        float _1180 = fma(_1174, _1168, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1182 = _1164 * _1180;
        float _1184 = _1178 + (-1.0);
        float _1186 = fma(_1048, _1182, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1188 = fma(_1052, _1182, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1190 = _1184 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1192 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1194 = _1186 + _1192;
        float _1196 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1198 = _1188 + _1196;
        float _1200 = fma(_1120, _1178, _1190);
        float _1202 = _1194 * _1194;
        float _1204 = _1198 * _1198;
        _1156 = _1200;
        _1146 = _1202;
        _1138 = _1204;
        _1150 = _1186;
        _1140 = _1188;
    }
    float _1206 = _1156;
    float _1208 = _1146;
    float _1210 = _1138;
    float _1212 = _1150;
    float _1214 = _1140;
    float _1216 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1218 = _1206 + _1216;
    float _1220 = _1122 * _880;
    float _1222 = _1092 * _880;
    float _1224 = _1094 * _880;
    float _1226 = fma(_1218, _1218, _1208);
    float _1228 = fma(_1102, _876, _1220);
    float _1230 = fma(_1104, _876, _1222);
    float _1232 = _940 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1234 = _914 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1236 = _1226 + _1210;
    float _1238 = fma(_1106, _876, _1224);
    float _1240 = _1232 * _1108;
    float _1242 = _1234 * _1124;
    float _1244 = fma(_1126, _886, _1228);
    float _1246 = fma(_1128, _886, _1230);
    float _1248 = sqrt(_1236);
    float _1250 = _960 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1252 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1254 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1256 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1258 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1260 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1262 = _1034 + 0.5;
    float _1264 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1266 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1268 = _1252 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1270 = _1254 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1272 = _1256 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1274 = _1258 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1276 = _1260 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1278 = _1264 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1280 = _1028 + 0.5;
    float _1282 = fma(_1130, _886, _1238);
    out.m_69.x = 1.0;
    out.m_69.y = 1.0;
    out.m_69.z = 1.0;
    bool _1284 = _1248 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1286 = isnan(_1248);
    bool _1288 = _1284 || _1286;
    bool _1290 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1292 = _1288 || _1290;
    out.m_71.x = _1274;
    out.m_71.y = _1276;
    out.m_71.z = _1278;
    out.m_71.w = _1266;
    out.m_73.x = _1268;
    out.m_73.y = _1270;
    out.m_73.z = _1272;
    out.m_73.w = _1250;
    out.m_75.x = _1240;
    out.m_75.y = _1242;
    out.m_75.z = _1262;
    out.m_75.w = _1280;
    float _1294 = _1274;
    float _1296 = _1278;
    if (!_1292)
    {
        _1142 = 1.0;
    }
    float _1298 = _1142;
    out.m_77.x = _1244;
    out.m_77.y = _1246;
    out.m_77.z = _1282;
    bool _1300 = !_1292;
    float _1302 = _1298;
    if (!_1300)
    {
        bool _1304 = _1248 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1306 = isnan(_1248);
        bool _1308 = _1304 || _1306;
        bool _1310 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1312 = _1308 || _1310;
        if (!_1312)
        {
            float _1314 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1316 = _1248 + _1314;
            float _1318 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1320 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1318;
            float _1322 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1324 = _1322 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1326 = 1.0 / _1320;
            float _1328 = _1316 * _1326;
            float _1330 = fma(_1328, _1324, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1302 = _1330;
            _1332 = true;
        }
        else
        {
            bool _1334 = _1248 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1336 = isnan(_1248);
            bool _1338 = _1334 || _1336;
            bool _1340 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1342 = _1338 || _1340;
            if (!_1342)
            {
                float _1344 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1346 = _1248 + _1344;
                float _1348 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1350 = _1348 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1352 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1354 = _1352 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1356 = 1.0 / _1350;
                float _1358 = _1346 * _1356;
                float _1360 = fma(_1358, _1354, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1302 = _1360;
                _1332 = true;
            }
            else
            {
                _1302 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1332 = false;
    float _1362 = _1302;
    float _1364 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1366 = _1206 + _1364;
    float _1368 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1370 = _1212 + _1368;
    float _1372 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1374 = _1214 + _1372;
    float _1376 = fma(_1366, _1362, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1378 = fma(_1370, _1362, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1380 = fma(_1374, _1362, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1382 = -_1110;
    float _1384 = _1382 + _1376;
    float _1386 = -_1024;
    float _1388 = _1386 + _1378;
    float _1390 = -_1016;
    float _1392 = _1390 + _1380;
    float _1394 = _1384 * _1384;
    float _1396 = fma(_1388, _1388, _1394);
    float _1398 = fma(_1392, _1392, _1396);
    float _1400 = sqrt(_1398);
    bool _1402 = _1400 > 0.0;
    float _1404 = _1366;
    float _1406 = _1378;
    float _1408 = _1376;
    if (!_1402)
    {
        _1294 = _1378;
    }
    float _1410 = _1294;
    float _1412 = _1410;
    if (!_1402)
    {
        _1404 = _1376;
    }
    float _1414 = _1404;
    float _1416 = _1414;
    float _1418 = _1414;
    if (!_1402)
    {
        _1296 = _1380;
    }
    float _1420 = _1296;
    bool _1422 = !_1402;
    float _1424 = _1420;
    float _1426 = _1420;
    if (!_1422)
    {
        float _1428 = _186 * _186;
        float _1430 = fma(_184, _184, _1428);
        float _1432 = fma(_188, _188, _1430);
        float _1434 = rsqrt(_1398);
        float _1436 = sqrt(_1432);
        float _1438 = _1388 * _1434;
        float _1440 = _1384 * _1434;
        float _1442 = _1392 * _1434;
        bool _1444 = _1436 > 0.0;
        float _1446 = _1436;
        if (!_1444)
        {
            _1446 = _1378;
        }
        float _1448 = _1446;
        _1412 = _1448;
        if (!_1444)
        {
            _1416 = _1376;
        }
        float _1450 = _1416;
        _1418 = _1450;
        if (!_1444)
        {
            _1424 = _1380;
        }
        float _1452 = _1424;
        bool _1454 = !_1444;
        _1426 = _1452;
        if (!_1454)
        {
            float _1456 = rsqrt(_1432);
            float _1458 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1460 = _186 * _1456;
            float _1462 = _184 * _1456;
            float _1464 = _188 * _1456;
            float _1466 = _1440 * _1460;
            float _1468 = fma(_1438, _1462, _1466);
            float _1470 = _1458 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1472 = fma(_1442, _1464, _1468);
            float _1474 = _1472 * _1470;
            float _1476 = fma(_184, _1474, _1378);
            float _1478 = fma(_186, _1474, _1376);
            float _1480 = fma(_188, _1474, _1380);
            _1418 = _1478;
            _1412 = _1476;
            _1426 = _1480;
        }
    }
    float _1482 = _1418;
    float _1484 = _1412;
    float _1486 = _1426;
    float _1488 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1490 = _1482 + _1488;
    float _1492 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1494 = _1484 + _1492;
    float _1496 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1498 = _1486 + _1496;
    float _1500 = _1490 * _1490;
    float _1502 = fma(_1494, _1494, _1500);
    float _1504 = fma(_1498, _1498, _1502);
    float _1506 = rsqrt(_1504);
    float _1508 = sqrt(_1504);
    float _1510 = _1506 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1512 = _1494 * _1510;
    float _1514 = _1498 * _1510;
    float _1516 = _1512 * _1512;
    float _1518 = _1514 * _1514;
    float _1520 = _1516 + _1518;
    float _1522 = sqrt(_1520);
    bool _1524 = _1522 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1526 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1528 = _1522 + _1526;
    float _1530 = _1506;
    float _1532 = _1528;
    float _1534 = _1490;
    float _1536 = _1510;
    if (_1524)
    {
        float _1538 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1530 = _1538;
    }
    float _1540 = _1530;
    if (_1524)
    {
        float _1542 = rsqrt(_1520);
        _1406 = _1542;
    }
    float _1544 = _1406;
    if (_1524)
    {
        float _1546 = _1528 * _1540;
        _1532 = _1546;
    }
    float _1548 = _1532;
    float _1550 = _1482 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_1524)
    {
        float _1552 = _1548 * 0.15915493667125701904296875;
        _1408 = _1552;
    }
    float _1554 = _1408;
    float _1556 = fma(_1484, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1550);
    float _1558 = _1540;
    float _1560 = _1554;
    if (_1524)
    {
        float _1562 = _1554 * 6.283185482025146484375;
        float _1564 = sin(_1562);
        _1558 = _1564;
    }
    float _1566 = _1558;
    float _1568 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1570 = precise::max(0.0, _1568);
    float _1572 = _1498;
    float _1574 = _1570;
    if (_1524)
    {
        float _1576 = _1554 * 6.283185482025146484375;
        float _1578 = cos(_1576);
        _1572 = _1578;
    }
    float _1580 = _1572;
    float _1582 = -_1510;
    float _1584 = -_1570;
    float _1586 = fma(_1490, _1582, _1584);
    if (_1524)
    {
        float _1588 = _1586 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1574 = _1588;
    }
    float _1590 = _1574;
    float _1592 = _1590;
    if (!_1524)
    {
        _1560 = _1512;
    }
    float _1594 = _1560;
    float _1596 = _1566;
    float _1598 = _1594;
    if (_1524)
    {
        float _1600 = fma(_1566, _1590, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1592 = _1600;
    }
    float _1602 = _1592;
    if (!_1524)
    {
        _1596 = _1586;
    }
    float _1604 = _1596;
    float _1606 = _1604;
    float _1608 = _1580;
    if (_1524)
    {
        float _1610 = _1580 + (-1.0);
        _1534 = _1610;
    }
    float _1612 = _1534;
    float _1614 = _1612;
    if (_1524)
    {
        float _1616 = _1544 * _1602;
        _1536 = _1616;
    }
    float _1618 = _1536;
    float _1620 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1524)
    {
        float _1622 = _1612 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1614 = _1622;
    }
    float _1624 = _1614;
    float _1626 = _1624;
    if (_1524)
    {
        float _1628 = _1512 * _1618;
        _1598 = _1628;
    }
    float _1630 = _1598;
    float _1632 = _1482 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1634 = fma(_1024, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (_1524)
    {
        float _1636 = fma(_1586, _1580, _1624);
        _1606 = _1636;
    }
    float _1638 = _1606;
    if (!_1524)
    {
        _1626 = _1514;
    }
    float _1640 = _1626;
    float _1642 = _1640;
    if (_1524)
    {
        float _1644 = _1514 * _1618;
        _1642 = _1644;
    }
    float _1646 = _1642;
    if (!_1524)
    {
        _1608 = _1516;
    }
    float _1648 = _1608;
    float _1650 = _1648;
    if (_1524)
    {
        float _1652 = _1630 * _1630;
        _1650 = _1652;
    }
    float _1654 = _1650;
    if (!_1524)
    {
        _1620 = _1518;
    }
    float _1656 = _1620;
    float _1658 = _1656;
    if (_1524)
    {
        float _1660 = _1646 * _1646;
        _1658 = _1660;
    }
    float _1662 = _1658;
    float _1664 = fma(_1484, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1632);
    float _1666 = fma(_1638, _1638, _1654);
    float _1668 = floor(_1634);
    float _1670 = _1666 + _1662;
    float _1672 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1664);
    float _1674 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1676 = fma(_1508, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1674);
    float _1678 = precise::clamp(_1676, 0.0, 1.0);
    float _1680 = fma(_1016, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1682 = _1672 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1684 = rsqrt(_1670);
    float _1686 = -_1678;
    float _1688 = _1686 + 1.0;
    float _1690 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1692 = _1682 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1694 = -_1692;
    float _1696 = fma(_1694, _1690, 1.0);
    float _1698 = _1482 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1700 = _1482 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1702 = abs(_1688);
    float _1704 = log2(_1702);
    float _1706 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1556);
    float _1708 = fma(_1484, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1698);
    float _1710 = fma(_1484, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1700);
    float _1712 = -_1668;
    float _1714 = _1634 + _1712;
    float _1716 = _1706 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1718 = _1684 * _1630;
    float _1720 = _1684 * _1638;
    float _1722 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1710);
    float _1724 = _1684 * _1646;
    float _1726 = _1718 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1728 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1708);
    float _1730 = _1722 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1732 = floor(_1680);
    float _1734 = -_1726;
    float _1736 = fma(_1720, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1734);
    float _1738 = _1728 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1740 = _1730 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1742 = _1704 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1744 = -_1724;
    float _1746 = fma(_1744, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1736);
    float _1748 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1740);
    float _1750 = exp2(_1742);
    float _1752 = fma(_1746, -0.5, 0.5);
    float _1754 = _1730 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1756 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1748);
    float _1758 = fma(_1746, 0.5, 0.5);
    float _1760 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1754);
    float _1762 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1756);
    float _1764 = log2(_1696);
    float _1766 = _1730 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1768 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1760);
    float _1770 = fma(_1758, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1772 = -_1732;
    float _1774 = _1680 + _1772;
    float _1776 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1766);
    float _1778 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1768);
    float _1780 = fma(_1758, _1770, -0.212114393711090087890625);
    float _1782 = 1.0 / _1762;
    float _1784 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1776);
    float _1786 = sqrt(_1752);
    float _1788 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1784);
    float _1790 = _1764 * 0.693147182464599609375;
    float2 _5147 = float2(_1714, _1774);
    float _1792 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5147, float2(0.0), isnan(_5147)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5147, float2(0.0), isnan(_5147)), level(0.0)).x;
    float _1794 = fma(_1758, _1780, 1.570728778839111328125);
    float _1796 = _1778 * _1782;
    float _1798 = _1720 + 1.0;
    float _1800 = _1788 * _1782;
    float _1802 = fma(_1796, 0.5, 0.5);
    float _1804 = -_1720;
    float _1806 = fma(_1750, _1798, _1804);
    float _1808 = _1790 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1810 = fma(_1800, -0.5, 0.5);
    float _1812 = _1786 * 0.636619746685028076171875;
    float _1814 = fma(_1806, 0.5, 0.5);
    float3 _5189 = float3(_1802, _1810, _1808);
    float _1816 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5189, float3(0.0), isnan(_5189)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5189, float3(0.0), isnan(_5189)), level(0.0)).x;
    float _1818 = -_1794;
    float _1820 = fma(_1812, _1818, 1.0);
    float3 _5205 = float3(_1802, _1810, _1808);
    float4 _1823 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5205, float3(0.0), isnan(_5205)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5205, float3(0.0), isnan(_5205)), level(0.0)).xyzw;
    float _1825 = _1823.x;
    float _1827 = _1823.y;
    float _1829 = _1823.z;
    float _1831 = _1823.w;
    float2 _5221 = float2(_1820, _1814);
    float3 _1835 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5221, float2(0.0), isnan(_5221)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5221, float2(0.0), isnan(_5221)), level(0.0)).xyz;
    float _1837 = _1835.x;
    float _1839 = _1835.y;
    float _1841 = _1835.z;
    float _1843 = _1110 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1845 = _1110 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1847 = _1730 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1849 = _1508 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1851 = isnan(_1508);
    bool _1853 = _1849 || _1851;
    bool _1855 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1857 = _1853 || _1855;
    float _1859 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1843);
    float _1861 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1845);
    float _1863 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1847);
    float _1865 = fma(_1016, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1859);
    float _1867 = fma(_1016, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1861);
    float _1869 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1863);
    float _1871 = _1865 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1873 = _1867 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1875 = _1778 + _1762;
    float _1877 = 1.0 / _1871;
    float _1879 = _1873 + _1871;
    float _1881 = _1875 * 0.5;
    float _1883 = _1879 * _1877;
    float _1885 = _1883 * 0.5;
    float _1887 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1889 = fma(_1885, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1887);
    float _1891 = 1.0 / _1889;
    float _1893 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1895 = _1891 * _1893;
    float _1897 = abs(_1895);
    float _1899 = log2(_1897);
    bool _1901 = _1895 <= 8000.0;
    bool _1903 = isnan(_1895);
    bool _1905 = _1901 || _1903;
    bool _1907 = isnan(8000.0);
    bool _1909 = _1905 || _1907;
    float _1911 = float(_1909);
    float _1913 = _1899 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1915 = exp2(_1913);
    float _1917 = fma(_1915, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1919 = precise::clamp(_1917, 0.0, 1.0);
    float _1921 = _1704 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1923 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1869);
    float _1925 = fma(_1919, -2.0, 3.0);
    float _1927 = _1919 * _1919;
    float _1929 = in.m_79.x;
    float _1931 = exp2(_1921);
    float _1933 = _1923 + _1762;
    float _1935 = _1927 * _1925;
    out.gl_Position.x = _1778;
    out.gl_Position.y = _1788;
    out.gl_Position.z = _1923;
    out.gl_Position.w = _1762;
    float _1937 = _1933 * 0.5;
    float _1939 = -_1935;
    float _1941 = _1939 + 1.0;
    float _1943 = fma(_1941, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1935);
    float _1945 = _1762 * 0.5;
    float _1947 = _1911 * _1943;
    float _1949 = fma(_1788, -0.5, _1945);
    float _1951 = -_1931;
    float _1953 = _1951 + 1.0;
    float _1955 = _1947 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1957 = _1762;
    float _1959 = _1923;
    float _1961 = _1788;
    float _1963 = _1881;
    if (!_1857)
    {
        _1957 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1965 = _1957;
    float _1967 = _1953 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_81.x = _1881;
    out.m_81.y = _1949;
    out.m_81.z = _1937;
    out.m_81.w = _1762;
    float _1969 = _1965;
    float _1971 = _1965;
    if (!_1857)
    {
        _1959 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1973 = _1959;
    float _1975 = -_1967;
    float _1977 = _1975 + 1.0;
    float _1979 = _1977;
    float _1981 = _1973;
    float _1983 = _1973;
    if (!_1857)
    {
        _1961 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1985 = _1961;
    float _1987 = _1985;
    float _1989 = _1985;
    if (!_1857)
    {
        _1963 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1991 = _1963;
    float _1993 = -_1792;
    float _1995 = _1993 + 1.0;
    float _1997 = _1995 * _1955;
    float _1999 = precise::clamp(_1997, 0.0, 1.0);
    float _2001 = -_1999;
    float _2003 = fma(_2001, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2005 = _2003 * _1929;
    float _2007 = _1967 * _1816;
    float _2009 = _2005 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2011 = _1831 * _2007;
    out.m_83.x = _2009;
    float _2013 = _1841 * _2007;
    float _2015 = fma(_1837, _2011, _1825);
    float _2017 = fma(_1839, _2011, _1827);
    float _2019 = _1831 * _1977;
    float _2021 = fma(_1831, _2013, _1829);
    float _2023 = _2011;
    float _2025 = _1991;
    float _2027 = _1991;
    if (!_1857)
    {
        _2023 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2029 = _2023;
    float _2031 = _2029;
    float _2033 = _2029;
    if (!_1857)
    {
        _1979 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2035 = _1979;
    out.m_85.x = _2015;
    out.m_85.y = _2017;
    out.m_85.z = _2021;
    out.m_85.w = _2019;
    bool _2037 = !_1857;
    float _2039 = _2035;
    float _2041 = _2035;
    if (!_2037)
    {
        bool _2043 = _1508 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2045 = isnan(_1508);
        bool _2047 = _2043 || _2045;
        bool _2049 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2051 = _2047 || _2049;
        if (!_2051)
        {
            float _2053 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2055 = _1508 + _2053;
            float _2057 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2059 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2057;
            float _2061 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2063 = _2061 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2065 = 1.0 / _2059;
            float _2067 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2069 = _2067 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2071 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2073 = _2071 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2075 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2077 = _2075 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2079 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2081 = _2079 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2083 = _2055 * _2065;
            float _2085 = precise::clamp(_2083, 0.0, 1.0);
            float _2087 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2089 = _2087 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2091 = fma(_2085, _2063, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2093 = fma(_2085, _2089, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2095 = fma(_2085, _2069, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2097 = fma(_2085, _2073, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2099 = fma(_2085, _2077, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2101 = fma(_2085, _2081, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2027 = _2095;
            _1989 = _2099;
            _2033 = _2091;
            _1983 = _2097;
            _1971 = _2093;
            _2041 = _2101;
            _2103 = true;
        }
        else
        {
            bool _2105 = _1508 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2107 = isnan(_1508);
            bool _2109 = _2105 || _2107;
            bool _2111 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2113 = _2109 || _2111;
            if (!_2113)
            {
                _2031 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2115 = _2031;
            _2033 = _2115;
            if (!_2113)
            {
                _2025 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2117 = _2025;
            _2027 = _2117;
            if (!_2113)
            {
                _1969 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2119 = _1969;
            _1971 = _2119;
            if (!_2113)
            {
                _1981 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2121 = _1981;
            _1983 = _2121;
            if (!_2113)
            {
                _1987 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2123 = _1987;
            _1989 = _2123;
            if (!_2113)
            {
                _2039 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2125 = _2039;
            bool _2127 = !_2113;
            _2041 = _2125;
            if (!_2127)
            {
                bool _2129 = _1508 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2131 = isnan(_1508);
                bool _2133 = _2129 || _2131;
                bool _2135 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2137 = _2133 || _2135;
                if (!_2137)
                {
                    float _2139 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2141 = _1508 + _2139;
                    float _2143 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2145 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2143;
                    float _2147 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2149 = _2147 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2151 = 1.0 / _2145;
                    float _2153 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2155 = _2153 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2157 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2159 = _2157 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2161 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2163 = _2161 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2165 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2167 = _2165 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2169 = _2141 * _2151;
                    float _2171 = precise::clamp(_2169, 0.0, 1.0);
                    float _2173 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2175 = _2173 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2177 = fma(_2171, _2149, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2179 = fma(_2171, _2175, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2181 = fma(_2171, _2155, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2183 = fma(_2171, _2159, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2185 = fma(_2171, _2163, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2187 = fma(_2171, _2167, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2027 = _2181;
                    _1989 = _2185;
                    _2033 = _2177;
                    _1983 = _2183;
                    _1971 = _2179;
                    _2041 = _2187;
                    _2103 = true;
                }
                else
                {
                    _2027 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1989 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2033 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1983 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1971 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2041 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2103 = false;
    float _2189 = _2027;
    float _2191 = _1989;
    float _2193 = _2033;
    float _2195 = _1983;
    float _2197 = _1971;
    float _2199 = _2041;
    float _2201 = fma(_1246, -0.5, 0.5);
    float _2203 = precise::clamp(_2201, 0.0, 1.0);
    float _2205 = -_2189;
    float _2207 = _2205 + _2191;
    float _2209 = -_2193;
    float _2211 = _2209 + _2195;
    float _2213 = -_2197;
    float _2215 = _2213 + _2199;
    bool _2217 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2219 = fma(_2203, _2207, _2189);
    float _2221 = fma(_2203, _2211, _2193);
    float _2223 = fma(_2203, _2215, _2197);
    float _2225 = _2219 * 0.586610972881317138671875;
    out.m_87.x = 0.0;
    float _2227 = fma(_2221, 0.298911988735198974609375, _2225);
    float _2229 = fma(_2223, 0.114477999508380889892578125, _2227);
    float _2231 = -_2229;
    float _2233 = _2221 + _2231;
    float _2235 = -_2229;
    float _2237 = _2219 + _2235;
    float _2239 = -_2229;
    float _2241 = _2223 + _2239;
    float _2243 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2245 = fma(_2233, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2229);
    float _2247 = fma(_2237, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2229);
    float _2249 = fma(_2241, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2229);
    out.m_51.x = _2243;
    out.m_89.x = _2245;
    out.m_89.y = _2247;
    out.m_89.z = _2249;
    if (!_2217)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2251 = -_1482;
    float _2253 = _2251 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2255 = -_1484;
    float _2257 = _2255 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2259 = -_1486;
    float _2261 = _2259 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2263 = _2253 * _2253;
    float _2265 = fma(_2257, _2257, _2263);
    float _2267 = fma(_2261, _2261, _2265);
    float _2269 = sqrt(_2267);
    float _2271 = rsqrt(_2267);
    float _2273 = -_2269;
    float _2275 = _2273 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2277 = _2275 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2279 = precise::clamp(_2277, 0.0, 1.0);
    float _2281 = _2257 * _2271;
    float _2283 = _2253 * _2271;
    float _2285 = abs(_2279);
    float _2287 = log2(_2285);
    float _2289 = _2261 * _2271;
    float _2291 = _2281 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2293 = _1246 * _2283;
    float _2295 = -_2283;
    float _2297 = -_2291;
    float _2299 = fma(_2295, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2297);
    float _2301 = fma(_1244, _2281, _2293);
    float _2303 = -_2289;
    float _2305 = fma(_2303, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2299);
    float _2307 = fma(_1282, _2289, _2301);
    float _2309 = precise::clamp(_2307, 0.0, 1.0);
    float _2311 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2313 = _2305 + _2311;
    float _2315 = _2287 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2317 = _2313 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2319 = precise::clamp(_2317, 0.0, 1.0);
    float _2321 = exp2(_2315);
    float _2323 = _2321 * _2319;
    float _2325 = _2309 * _2323;
    float _2327 = _2325 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2329 = _2325 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2331 = _2325 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_87.x = _2327;
    out.m_87.y = _2329;
    out.m_87.z = _2331;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

