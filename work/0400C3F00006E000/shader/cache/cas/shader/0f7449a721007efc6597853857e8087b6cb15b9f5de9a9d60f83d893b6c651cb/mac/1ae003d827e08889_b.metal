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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
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
    float4 m_61 [[user(locn0)]];
    float4 m_75 [[user(locn1)]];
    float4 m_51 [[user(locn2)]];
    float4 m_91 [[user(locn3)]];
    float4 m_67 [[user(locn4)]];
    float4 m_77 [[user(locn5)]];
    float4 m_83 [[user(locn6)]];
    float4 m_79 [[user(locn7)]];
    float4 m_89 [[user(locn8)]];
    float4 m_85 [[user(locn9)]];
    float4 m_87 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_81 [[attribute(0)]];
    float4 m_73 [[attribute(1)]];
    float4 m_55 [[attribute(2)]];
    float4 m_48 [[attribute(3)]];
    float4 m_53 [[attribute(4)]];
    float4 m_71 [[attribute(5)]];
    float4 m_69 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_59 [[attribute(8)]];
    float4 m_63 [[attribute(10)]];
    float4 m_65 [[attribute(11)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3614 = false;
    bool _2633 = false;
    bool _706 = false;
    bool _564 = false;
    bool _438 = false;
    bool _216 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_48.w;
    float _107 = trunc(_105);
    int _110 = int(_107);
    bool _114 = _110 >= 1;
    float _116 = 0.0;
    if (!_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _116;
    float _120 = _118;
    if (!_114)
    {
        out.m_51.x = 0.0;
    }
    int _122 = 0;
    if (!_114)
    {
        float _124 = _118 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    int _128 = _126;
    if (!_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3919 = as_type<float>(_126);
        out.gl_Position.z = _3919;
    }
    if (!_114)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _130 = in.m_53.w;
    bool _132 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_130);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    float _142 = -_130;
    float _144 = _142 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _146 = _144;
    if (_140)
    {
        float _148 = float(_110);
        _120 = _148;
    }
    float _150 = _120;
    bool _152 = _144 >= _150;
    bool _154 = !_140;
    bool _156 = _152 || _154;
    float _158 = _150;
    if (_156)
    {
        _158 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _158;
    if (_156)
    {
        out.m_51.x = 0.0;
    }
    if (_156)
    {
        float _162 = _160 * 5.0;
        _128 = as_type<int>(_162);
    }
    int _164 = _128;
    if (_156)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3989 = as_type<float>(_164);
        out.gl_Position.z = _3989;
    }
    if (_156)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _166 = in.m_55.x;
    float _168 = in.m_55.y;
    float _170 = in.m_55.z;
    bool _172 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _174 = _168 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _176 = _168 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _178 = _168 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _180 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[4].x, _174);
    float _182 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[5].x, _176);
    float _184 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[6].x, _178);
    float _186 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[4].z, _180);
    float _188 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[5].z, _182);
    float _190 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[6].z, _184);
    bool _192 = !_172;
    float _194 = _188;
    float _196 = _190;
    float _214;
    if (!_192)
    {
        float _198 = in.m_57.x;
        float _200 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _202 = _198 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _204 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[12].x, _144);
        float _206 = _204 * _200;
        float _208 = floor(_206);
        float _210 = -_208;
        float _212 = _206 + _210;
        _214 = _212;
        _216 = true;
    }
    else
    {
        float _218 = float(_110);
        float _220 = 1.0 / _218;
        float _222 = _144 * _220;
        _214 = _222;
    }
    _216 = false;
    float _224 = _214;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _228 = _224 + _226;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _232 = _224 + _230;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _236 = _224 + _234;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _240 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _238;
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _244 = _242 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _246;
    float _250 = 1.0 / _240;
    bool _252 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _254 = 1.0 / _248;
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _258 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _256;
    float _260 = 1.0 / _244;
    float _262 = _228 * _250;
    bool _264 = _224 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _266 = isnan(_224);
    bool _268 = _264 || _266;
    bool _270 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _272 = _268 || _270;
    float _274 = float(_272);
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _278 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _276;
    float _280 = fma(_258, _262, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _282 = fma(_278, _262, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _284 = _232 * _254;
    bool _286 = _224 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _288 = isnan(_224);
    bool _290 = _286 || _288;
    bool _292 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _294 = _290 || _292;
    float _296 = float(_294);
    float _298 = -_274;
    float _300 = _298 + 1.0;
    float _302 = _296 * _300;
    float _304 = -_296;
    float _306 = _304 + 1.0;
    float _308 = _236 * _260;
    bool _310 = _224 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _312 = isnan(_224);
    bool _314 = _310 || _312;
    bool _316 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _318 = _314 || _316;
    float _320 = float(_318);
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _324 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _322;
    bool _326 = _224 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _328 = isnan(_224);
    bool _330 = _326 || _328;
    bool _332 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _334 = _330 || _332;
    float _336 = float(_334);
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _340 = _338 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _344 = _342 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _346 = -_320;
    float _348 = _346 + 1.0;
    float _350 = fma(_324, _262, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _352 = _320 * _306;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _356 = _354 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _358 = _336 * _348;
    float _360 = -_336;
    float _362 = _360 + 1.0;
    float _364 = fma(_344, _308, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _366 = _350 * _358;
    float _368 = _280 * _358;
    float _370 = _282 * _358;
    float _372 = fma(_356, _308, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _374 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[143].x, _368);
    float _376 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[143].y, _370);
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _378;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _382;
    float _386 = fma(_340, _308, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _388 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[143].z, _366);
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _392 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _390;
    float _394 = fma(_364, _352, _374);
    float _396 = fma(_380, _284, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _398 = fma(_384, _284, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _400 = fma(_372, _352, _376);
    float _402 = fma(_392, _284, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _404 = fma(_386, _352, _388);
    float _406 = fma(_396, _302, _394);
    float _408 = fma(_398, _302, _400);
    float _410 = fma(_402, _302, _404);
    float _412 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[146].x, _406);
    float _414 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[146].y, _408);
    float _416 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[146].z, _410);
    bool _418 = !_252;
    float _436;
    if (!_418)
    {
        float _420 = in.m_57.x;
        float _422 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _424 = _420 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _426 = fma(_424, (*spvDescriptorSet0.vp_c9)._m0[11].x, _144);
        float _428 = _426 * _422;
        float _430 = floor(_428);
        float _432 = -_430;
        float _434 = _428 + _432;
        _436 = _434;
        _438 = true;
    }
    else
    {
        float _440 = float(_110);
        float _442 = 1.0 / _440;
        float _444 = _144 * _442;
        _436 = _444;
    }
    _438 = false;
    float _446 = _436;
    float _448 = in.m_59.x;
    float _450 = in.m_59.y;
    float _452 = in.m_59.z;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _456 = _446 + _454;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _458;
    bool _462 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _464 = 1.0 / _460;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _466;
    float _470 = _414 * _450;
    float _472 = _456 * _464;
    float _474 = _416 * _452;
    bool _476 = _446 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _478 = isnan(_446);
    bool _480 = _476 || _478;
    bool _482 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _484 = _480 || _482;
    float _486 = float(_484);
    float _488 = _412 * _448;
    float _490 = fma(_468, _472, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _492 = -_486;
    float _494 = _492 + 1.0;
    bool _496 = _446 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _498 = isnan(_446);
    bool _500 = _496 || _498;
    bool _502 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _504 = _500 || _502;
    float _506 = float(_504);
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _510 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _508;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _512;
    float _516 = _506 * _494;
    float _518 = fma(_510, _472, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _520 = fma(_514, _472, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _522 = -_506;
    float _524 = _522 + 1.0;
    float _526 = _490 * _516;
    float _528 = _518 * _516;
    float _530 = _520 * _516;
    float _532 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[107].y, _526);
    float _534 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[107].x, _528);
    float _536 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[107].z, _530);
    float _538 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[108].y, _532);
    float _540 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[108].x, _534);
    float _542 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[108].z, _536);
    bool _544 = !_462;
    float _562;
    if (!_544)
    {
        float _546 = in.m_57.x;
        float _548 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _550 = _546 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _552 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[11].y, _144);
        float _554 = _552 * _548;
        float _556 = floor(_554);
        float _558 = -_556;
        float _560 = _554 + _558;
        _562 = _560;
        _564 = true;
    }
    else
    {
        float _566 = float(_110);
        float _568 = 1.0 / _566;
        float _570 = _144 * _568;
        _562 = _570;
    }
    _564 = false;
    float _572 = _562;
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _576 = _574 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _578 = _572 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _580 = isnan(_572);
    bool _582 = _578 || _580;
    bool _584 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _586 = _582 || _584;
    float _588 = float(_586);
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _592 = _590 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _594 = _572 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _596 = isnan(_572);
    bool _598 = _594 || _596;
    bool _600 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _602 = _598 || _600;
    float _604 = float(_602);
    float _606 = 1.0 / _576;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _610 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _608;
    float _612 = -_588;
    float _614 = _612 + 1.0;
    bool _616 = _572 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _618 = isnan(_572);
    bool _620 = _616 || _618;
    bool _622 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _624 = _620 || _622;
    float _626 = float(_624);
    bool _628 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _630 = _604 * _614;
    float _632 = -_604;
    float _634 = _632 + 1.0;
    float _636 = 1.0 / _592;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _640 = _638 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _642 = _610 * _606;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _646 = _572 + _644;
    float _648 = -_626;
    float _650 = _648 + 1.0;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _654 = _572 + _652;
    float _656 = fma(_642, _646, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _658 = _588 * _650;
    float _660 = _640 * _636;
    float _662 = _656 * _630;
    float _664 = _538 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _666 = fma(_660, _654, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _668 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[115].x, _662);
    float _670 = _542 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _672 = _664 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _674 = fma(_666, _658, _668);
    float _676 = _540 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _678 = _670 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _680 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[117].x, _674);
    float _682 = _676 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _684 = _680 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_61.x = _682;
    out.m_61.y = _672;
    out.m_61.z = _678;
    out.m_61.w = _684;
    bool _686 = !_628;
    float _704;
    if (!_686)
    {
        float _688 = in.m_57.x;
        float _690 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _692 = _688 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _694 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[11].w, _144);
        float _696 = _694 * _690;
        float _698 = floor(_696);
        float _700 = -_698;
        float _702 = _696 + _700;
        _704 = _702;
        _706 = true;
    }
    else
    {
        float _708 = float(_110);
        float _710 = 1.0 / _708;
        float _712 = _144 * _710;
        _704 = _712;
    }
    _706 = false;
    float _714 = _704;
    float _716 = in.m_63.y;
    float _718 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _720 = int(_718);
    float _722 = _488 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _724 = in.m_57.x;
    float _726 = in.m_57.y;
    float _728 = _470 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _730 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _732 = _730 != 0;
    float _734 = in.m_65.x;
    float _736 = float(_110);
    float _738 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _740 = int(_738);
    float _742 = in.m_65.y;
    int _744 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _746 = _744 != 0;
    float _748 = _474 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _752 = float(_720);
    float _754 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _756 = log2(_754);
    float _758 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _760 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _762 = -_716;
    float _764 = _762 + 1.0;
    int _766 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _768 = _766 != 0;
    float _770 = 1.0 / _752;
    int _772 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _774 = _772 != 0;
    float _776 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _778 = _726 > 0.5;
    float _780 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    int _782 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _784 = _782 != 0;
    out.m_67.x = _734;
    float _786 = _716;
    if (_732)
    {
        float _788 = _778 ? _764 : _716;
        _786 = _788;
    }
    float _790 = _786;
    float _792 = _726 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    out.m_67.y = _742;
    float _794 = _724 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _796 = fma(_792, -2.0, _750);
    float _798 = in.m_48.x;
    float _800 = in.m_48.y;
    float _802 = in.m_48.z;
    float _804 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _806 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _808 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _812 = _810 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _814 = -_776;
    float _816 = fma(_794, 2.0, _814);
    float _818 = -_758;
    float _820 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _818);
    float _822 = -_760;
    float _824 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _822);
    float _826 = -_780;
    float _828 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _826);
    float _830 = _770 * _144;
    float _832 = in.m_69.x;
    float _834 = in.m_69.y;
    float _836 = in.m_69.z;
    float _838 = -_806;
    float _840 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _838);
    float _842 = -_808;
    float _844 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _842);
    float _846 = float(uint(_740));
    float _848 = 1.0 / _812;
    float _850 = -_804;
    float _852 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _850);
    float _854 = _488;
    if (_768)
    {
        float _856 = in.m_57.x;
        _854 = _856;
    }
    float _858 = _854;
    float _860 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _862 = _860 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _864 = 1.0 / _846;
    float _866 = _800 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _868 = _800 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _870 = _800 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _872 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _874 = _872 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _876 = fma(_798, (*spvDescriptorSet0.vp_c10)._m0[5].x, _866);
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _880 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _878;
    float _882 = trunc(_830);
    int _884 = int(_882);
    bool _886 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _888 = isnan(0.0);
    bool _890 = _886 || _888;
    bool _892 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _894 = _890 || _892;
    float _896 = _880 * _848;
    float _898 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _900 = _898 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _902 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _834);
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _906 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _904;
    float _908 = float(_740);
    float _910 = fma(_798, (*spvDescriptorSet0.vp_c10)._m0[4].x, _868);
    float _912 = 1.0 / _862;
    int _914 = as_type<int>(_864) + (-2);
    float _916 = fma(_798, (*spvDescriptorSet0.vp_c10)._m0[6].x, _870);
    float _918 = _908 * _144;
    bool _920 = _858 > 0.5;
    bool _922 = _920 && _768;
    float _924 = _726 * 2.0;
    int _926 = ~_740;
    int _928 = _926 + 1;
    float _930 = -_144;
    float _932 = fma(_930, (*spvDescriptorSet0.vp_c9)._m0[76].x, _816);
    float _934 = float(uint(_884));
    float _936 = _756 * _144;
    float _938 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _832);
    float _940 = 1.0 / _736;
    float _942 = as_type<float>(_914) * _934;
    float _944 = _722 * _938;
    float _946 = _728 * _902;
    float _948 = _724 * 2.0;
    float _950 = _906 * _912;
    float _952 = in.m_57.z;
    float _954 = exp2(_936);
    float _956 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[76].y, _796);
    bool _958 = !_746;
    float _960 = _958 ? 7.345489978790283203125 : 1.0;
    float _962 = fma(_802, (*spvDescriptorSet0.vp_c10)._m0[4].z, _910);
    bool _964 = !_784;
    int _966 = _964 ? 0 : 1;
    float _968 = fma(_802, (*spvDescriptorSet0.vp_c10)._m0[5].z, _876);
    float _970 = fma(_802, (*spvDescriptorSet0.vp_c10)._m0[6].z, _916);
    float _972 = _960 * _724;
    float _974 = trunc(_942);
    float _976 = precise::max(_974, 0.0);
    uint _979 = uint(_976);
    float _981 = _918 * _940;
    float _983 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _985 = _714 + _983;
    float _987 = _828 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _989 = _828 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _991 = _828 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _993 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _995 = floor(_948);
    float _997 = -_954;
    float _999 = _997 + 1.0;
    float _1001 = fma(_896, _985, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1003 = -_987;
    float _1005 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1003);
    float _1007 = _828 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1009 = _968 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1011 = _894 ? _999 : 0.0;
    float _1013 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1015 = _714 + _1013;
    float _1017 = 1.0 / _874;
    float _1019 = _824 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1021 = _748 * _836;
    bool _1023 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1025 = isnan(1.0);
    bool _1027 = _1023 || _1025;
    bool _1029 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1031 = _1027 || _1029;
    float _1033 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1035 = 1.0 + _1033;
    float _1037 = _962 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1039 = _928 * int(_979);
    int _1041 = _1039 + _884;
    bool _1043 = _995 >= 0.0;
    bool _1045 = isnan(_995);
    bool _1047 = _1043 || _1045;
    bool _1049 = isnan(0.0);
    bool _1051 = _1047 || _1049;
    float _1053 = 1.0 / _1035;
    float _1055 = -_1009;
    float _1057 = _1055 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1059 = -_1019;
    float _1061 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[0].y, _1059);
    int _1063 = _1051 ? 0 : 1;
    float _1065 = _970 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1067 = float(uint(_1041));
    float _1069 = _900 * _1017;
    float _1071 = floor(_924);
    bool _1073 = _995 > 0.0;
    float _1075 = as_type<float>(_914) * _1067;
    float _1077 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[78].w, _993);
    float _1079 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1081 = fma(_1069, _1015, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1083 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1077);
    float _1085 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1079);
    float _1087 = trunc(_1075);
    float _1089 = precise::max(_1087, 0.0);
    uint _1091 = uint(_1089);
    float _1093 = _952 * 2.0;
    int _1095 = ~_1063;
    int _1097 = _1095 + 1;
    int _1099 = _1097 + 1;
    float _1101 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1085);
    int _1103 = _1099;
    if (_1031)
    {
        float _1105 = _1011 * _1053;
        _146 = _1105;
    }
    float _1107 = _146;
    if (!_1073)
    {
        int _1109 = ~_1063;
        int _1111 = _1109 + 1;
        _1103 = _1111;
    }
    int _1113 = _1103;
    float _1115 = _726 + _724;
    int _1117 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1119 = _1117 != 0;
    int _1121 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1123 = _1121 != 0;
    int _1125 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1127 = _1125 != 0;
    float _1129 = floor(_1093);
    float _1131 = _952 + _724;
    float _1133 = _1115 + (-1.0);
    bool _1135 = !_1123;
    int _1137 = _1135 ? 0 : 1;
    float _1139 = -_1037;
    float _1141 = _1139 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1143 = _1131 + (-1.0);
    bool _1145 = _1071 > 0.0;
    float _1147 = fma(_1133, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1149 = ~_740;
    int _1151 = _1149 + 1;
    float _1153 = fma(_1143, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1155 = _1071 >= 0.0;
    bool _1157 = isnan(_1071);
    bool _1159 = _1155 || _1157;
    bool _1161 = isnan(0.0);
    bool _1163 = _1159 || _1161;
    float _1165 = floor(_972);
    int _1167 = int(_979) + int(_1091);
    float _1169 = fma(_852, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1061);
    float _1171 = _726 + _952;
    int _1173 = _1163 ? 0 : 1;
    float _1175 = fma(_840, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1005);
    bool _1177 = _1129 > 0.0;
    int _1179 = _1151 * _1167;
    int _1181 = _1179 + _884;
    int _1183 = ~_1173;
    int _1185 = _1183 + 1;
    int _1187 = _1185 + 1;
    float _1189 = _1171 + (-1.0);
    bool _1191 = !_1119;
    int _1193 = _1191 ? 0 : 1;
    float _1195 = _724 + (-0.5);
    int _1197 = _1187;
    if (!_1145)
    {
        int _1199 = ~_1173;
        int _1201 = _1199 + 1;
        _1197 = _1201;
    }
    int _1203 = _1197;
    float _1205 = _952 + (-0.5);
    bool _1207 = _1129 >= 0.0;
    bool _1209 = isnan(_1129);
    bool _1211 = _1207 || _1209;
    bool _1213 = isnan(0.0);
    bool _1215 = _1211 || _1213;
    float _1217 = -_1165;
    float _1219 = _972 + _1217;
    bool _1221 = !_1127;
    int _1223 = _1221 ? 0 : 1;
    float _1225 = _1219 * _908;
    int _1227 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1229 = _1227 != 0;
    float _1231 = fma(_1189, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1233 = uint(_1181) >= uint(_740);
    int _1235 = _1215 ? 0 : 1;
    float _1237 = trunc(_1225);
    int _1239 = int(_1237);
    bool _1241 = !_1229;
    int _1243 = _1241 ? 0 : 1;
    bool _1245 = !_1233;
    int _1247 = _1245 ? 0 : (-1);
    int _1249 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1251 = _1249 != 0;
    int _1253 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1255 = _1253 != 0;
    int _1257 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1259 = _1257 != 0;
    float _1261 = in.m_71.x;
    float _1263 = in.m_71.y;
    float _1265 = in.m_71.z;
    int _1267 = ~_1235;
    int _1269 = _1267 + 1;
    int _1271 = _1269 + 1;
    int _1273 = _1271;
    if (!_1177)
    {
        int _1275 = ~_1235;
        int _1277 = _1275 + 1;
        _1273 = _1277;
    }
    int _1279 = _1273;
    float _1281 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1283 = _714 + _1281;
    bool _1285 = _834 != 0.0;
    bool _1287 = isnan(_834);
    bool _1289 = _1285 || _1287;
    bool _1291 = isnan(0.0);
    bool _1293 = _1289 || _1291;
    int _1295 = ~_1167;
    int _1297 = _1295 + _1247;
    int _1299 = _1297 + 1;
    float _1301 = fma(_950, _1283, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    bool _1303 = _832 == 0.0;
    bool _1305 = !_1293;
    bool _1307 = _1303 && _1305;
    float _1309 = _824 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1311 = float(_884);
    int _1313 = _740 * _1299;
    int _1315 = _1313 + _884;
    bool _1317 = _836 == 0.0;
    bool _1319 = _1317 && _1307;
    float _1321 = -_1309;
    float _1323 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[1].y, _1321);
    bool _1325 = _714 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1327 = isnan(_714);
    bool _1329 = _1325 || _1327;
    bool _1331 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1333 = _1329 || _1331;
    float _1335 = float(_1333);
    float _1337 = -_989;
    float _1339 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1337);
    float _1341 = _1057 * _1057;
    float _1343 = -_1007;
    float _1345 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1343);
    float _1347 = -_991;
    float _1349 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1347);
    float _1351 = -_1335;
    float _1353 = _1351 + 1.0;
    float _1355 = fma(_1141, _1141, _1341);
    int _1357 = _740 + (-1);
    float _1359 = fma(_852, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1323);
    int _1361 = abs(_1137);
    float _1363 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1339);
    float _1365 = _1263;
    float _1367 = _1265;
    float _1369 = _1261;
    if (!_1319)
    {
        float _1371 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1263);
        _1365 = _1371;
    }
    float _1373 = _1365;
    if (!_1319)
    {
        float _1375 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1265);
        _1367 = _1375;
    }
    float _1377 = _1367;
    bool _1379 = _1311 >= _908;
    bool _1381 = isnan(_1311);
    bool _1383 = _1379 || _1381;
    bool _1385 = isnan(_908);
    bool _1387 = _1383 || _1385;
    float _1389 = float(_1387);
    if (!_1319)
    {
        float _1391 = fma(_832, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1261);
        _1369 = _1391;
    }
    float _1393 = _1369;
    bool _1395 = _714 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1397 = isnan(_714);
    bool _1399 = _1395 || _1397;
    bool _1401 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1403 = _1399 || _1401;
    float _1405 = float(_1403);
    float _1407 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1345);
    bool _1409 = _714 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1411 = isnan(_714);
    bool _1413 = _1409 || _1411;
    bool _1415 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1417 = _1413 || _1415;
    float _1419 = float(_1417);
    float _1421 = fma(_840, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1349);
    float _1423 = trunc(_1389);
    int _1425 = int(_1423);
    float _1427 = _1405 * _1353;
    float _1429 = -_1405;
    float _1431 = _1429 + 1.0;
    float _1433 = -_1065;
    float _1435 = _1433 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    bool _1437 = _740 == 0;
    float _1439 = -_1419;
    float _1441 = _1439 + 1.0;
    bool _1443 = _714 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1445 = isnan(_714);
    bool _1447 = _1443 || _1445;
    bool _1449 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1451 = _1447 || _1449;
    float _1453 = float(_1451);
    float _1455 = fma(_1435, _1435, _1355);
    bool _1457 = !_1437;
    int _1459 = _1457 ? _1315 : (-1);
    float _1461 = _1419 * _1431;
    int _1463 = abs(_966);
    float _1465 = _1453 * _1441;
    bool _1467 = !_1251;
    int _1469 = _1467 ? 0 : 1;
    float _1471 = rsqrt(_1455);
    int _1473 = abs(_1223);
    float _1475 = _1001 * _1465;
    int _1477 = ~_1425;
    int _1479 = _1477 + 1;
    int _1481 = _1479 + 1;
    float _1483 = _840 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    int _1485 = _1239 * _1463;
    int _1487 = _1485 + _884;
    int _1489 = abs(_1469);
    float _1491 = in.m_63.x;
    int _1493 = _1459 * _1481;
    float _1495 = -_1483;
    float _1497 = fma(_852, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1495);
    float _1499 = float(_1279);
    int _1501 = _1425 * _1357;
    int _1503 = _1501 + _1493;
    int _1505 = abs(_1193);
    float _1507 = trunc(_981);
    int _1509 = int(_1507);
    float _1511 = float(_1113);
    float _1513 = _1141 * _1471;
    float _1515 = _1435 * _1471;
    float _1517 = _1175 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1519 = _1513 * _1513;
    int _1521 = abs(_1243);
    float _1523 = _1057 * _1471;
    float _1525 = -_1517;
    float _1527 = fma(_1359, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1525);
    float _1529 = fma(_1515, _1515, _1519);
    int _1531 = _1503 * _1361;
    float _1533 = float(_1489);
    float _1535 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1527);
    float _1537 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1497);
    int _1539 = _1509 * _1505;
    int _1541 = _1539 + _1531;
    float _1543 = rsqrt(_1529);
    float _1545 = in.m_73.x;
    float _1547 = in.m_73.y;
    float _1549 = in.m_73.z;
    float _1551 = _1533 * _1499;
    int _1553 = _1487 * _1473;
    int _1555 = _1553 + _1541;
    float _1557 = -_1537;
    float _1559 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1535);
    float _1561 = _1551 * (-2.0);
    int _1563 = _1239 * _1521;
    int _1565 = _1563 + _1555;
    float _1567 = 1.0 / _1559;
    float _1569 = float(uint(_1565));
    float _1571 = _1515 * _1543;
    float _1573 = _1513 * _1543;
    float _1575 = fma(_1147, _1561, _1147);
    float _1577 = as_type<float>(_914) * _1569;
    float _1579 = -_1571;
    float _1581 = _1515 * _1579;
    float _1583 = float(uint(_1487));
    float _1585 = -_1571;
    float _1587 = _1523 * _1585;
    float _1589 = -_1581;
    float _1591 = fma(_1513, _1573, _1589);
    float _1593 = fma(_1561, _1545, _1545);
    float _1595 = trunc(_1577);
    float _1597 = precise::max(_1595, 0.0);
    uint _1599 = uint(_1597);
    bool _1601 = !_1255;
    int _1603 = _1601 ? 0 : 1;
    float _1605 = _1523 * _1573;
    float _1607 = _1591 * _1591;
    float _1609 = fma(_1195, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1593);
    int _1611 = abs(_1603);
    float _1613 = fma(_1605, _1605, _1607);
    float _1615 = as_type<float>(_914) * _1583;
    float _1617 = fma(_1575, _1107, _1609);
    int _1619 = ~_740;
    int _1621 = _1619 + 1;
    float _1623 = fma(_1587, _1587, _1613);
    float _1625 = float(_1611);
    float _1627 = trunc(_1615);
    float _1629 = precise::max(_1627, 0.0);
    uint _1631 = uint(_1629);
    bool _1633 = !_1259;
    int _1635 = _1633 ? 0 : 1;
    int _1637 = _1621 * int(_1599);
    int _1639 = _1637 + _1565;
    float _1641 = _1625 * _1511;
    int _1643 = abs(_1635);
    float _1645 = _1617 * 0.15915493667125701904296875;
    float _1647 = float(uint(_1639));
    float _1649 = rsqrt(_1623);
    float _1651 = _1641 * (-2.0);
    float _1653 = _726 + (-0.5);
    float _1655 = as_type<float>(_914) * _1647;
    float _1657 = fma(_1651, _1547, _1547);
    float _1659 = float(_1203);
    float _1661 = fma(_1231, _1651, _1231);
    float _1663 = float(_1643);
    float _1665 = fma(_1653, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1657);
    float _1667 = trunc(_1655);
    float _1669 = precise::max(_1667, 0.0);
    uint _1671 = uint(_1669);
    float _1673 = _1663 * _1659;
    float _1675 = fma(_1661, _1107, _1665);
    float _1677 = _1591 * _1649;
    float _1679 = precise::clamp(_1677, 0.0, 1.0);
    float _1681 = _1673 * (-2.0);
    float _1683 = _1675 * 0.15915493667125701904296875;
    float _1685 = _1645 * 6.283185482025146484375;
    float _1687 = sin(_1685);
    float _1689 = -_1679;
    float _1691 = _1689 + 1.0;
    float _1693 = fma(_1153, _1681, _1153);
    float _1695 = fma(_1421, _1567, -1.0);
    float _1697 = fma(_1681, _1549, _1549);
    float _1699 = _1691 * _1567;
    int _1701 = ~_740;
    int _1703 = _1701 + 1;
    float _1705 = fma(_1691, _1695, 1.0);
    int _1707 = int(_1599) + int(_1671);
    float _1709 = _1169 * _1699;
    int _1711 = ~_740;
    int _1713 = _1711 + 1;
    float _1715 = _1705 * _1705;
    float _1717 = fma(_1205, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1697);
    float _1719 = _1407 * _1699;
    float _1721 = _1645 * 6.283185482025146484375;
    float _1723 = cos(_1721);
    float _1725 = fma(_1709, _1709, _1715);
    float _1727 = -_1453;
    float _1729 = _1727 + 1.0;
    float _1731 = fma(_1693, _1107, _1717);
    float _1733 = fma(_1719, _1719, _1725);
    int _1735 = _1713 * _1707;
    int _1737 = _1735 + _1565;
    float _1739 = fma(_1729, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1475);
    float _1741 = rsqrt(_1733);
    float _1743 = as_type<float>(_1703);
    float _1745 = _1731;
    if (_768)
    {
        _1743 = _1491;
    }
    float _1747 = _1743;
    int _1749 = _1703 * int(_1631);
    int _1751 = _1749 + _1487;
    bool _1753 = uint(_1737) >= uint(_740);
    float _1755 = fma(_1081, _1461, _1739);
    float _1757 = _1731 * 0.15915493667125701904296875;
    float _1759 = _1747;
    if (_922)
    {
        float _1761 = -_1747;
        float _1763 = _1761 + 1.0;
        _1759 = _1763;
    }
    float _1765 = _1759;
    bool _1767 = !_1753;
    int _1769 = _1767 ? 0 : (-1);
    float _1771 = _1683 * 6.283185482025146484375;
    float _1773 = sin(_1771);
    float _1775 = float(uint(_1751));
    float _1777 = fma(_1301, _1427, _1755);
    int _1779 = ~_1707;
    int _1781 = _1779 + _1769;
    int _1783 = _1781 + 1;
    if (!_768)
    {
        _1745 = _1491;
    }
    float _1785 = _1745;
    float _1787 = as_type<float>(_914) * _1775;
    float _1789 = _1785;
    if (_768)
    {
        _1789 = _1765;
    }
    float _1791 = _1789;
    float _1793 = _1683 * 6.283185482025146484375;
    float _1795 = cos(_1793);
    int _1797 = _740 * _1783;
    int _1799 = _1797 + _1565;
    float _1801 = _1719 * _1741;
    float _1803 = _1709 * _1741;
    float _1805 = _1705 * _1741;
    float _1807 = fma(_1335, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1777);
    bool _1809 = !_1437;
    int _1811 = _1809 ? _1799 : (-1);
    float _1813 = _1757 * 6.283185482025146484375;
    float _1815 = cos(_1813);
    float _1817 = _1723 * _1773;
    int _1819 = _1811 >> 31;
    float _1821 = _1687 * _1773;
    int _1823 = _1811 & 3;
    bool _1825 = _1823 != 0;
    int _1827 = ~_740;
    int _1829 = _1827 + 1;
    float _1831 = _1757 * 6.283185482025146484375;
    float _1833 = sin(_1831);
    float _1835 = _1723 * _1795;
    float _1837 = _1687 * _1795;
    float _1839 = _1687 * _1815;
    int _1841 = _1819 & 3;
    float _1843 = _1723 * _1815;
    float _1845 = -_1801;
    float _1847 = _1513 * _1845;
    float _1849 = trunc(_1787);
    float _1851 = precise::max(_1849, 0.0);
    uint _1853 = uint(_1851);
    int _1855 = _1811 + _1841;
    float _1857 = _1773 * _1815;
    float _1859 = -_1803;
    float _1861 = -_1847;
    float _1863 = fma(_1515, _1859, _1861);
    float _1865 = -_1803;
    float _1867 = _1523 * _1865;
    int _1869 = _1855 >> 2;
    float _1871 = _1795 * _1815;
    float _1873 = _1839 * _946;
    float _1875 = -_1867;
    float _1877 = fma(_1513, _1805, _1875);
    int _1879 = _1869 << 4;
    int _1881 = _1879 + 368;
    float _1883 = _1515 * _1805;
    uint _1885 = uint(int(uint(_1881) >> uint(2)));
    uint _1887 = uint(int(uint(int(_1885)) >> uint(2)));
    int _1889 = int(_1885) & 3;
    float _1891 = (*spvDescriptorSet0.vp_c9)._m0[int(_1887)][_1889];
    int _1893 = int(_1885) + 1;
    uint _1895 = uint(int(uint(_1893) >> uint(2)));
    int _1897 = _1893 & 3;
    float _1899 = (*spvDescriptorSet0.vp_c9)._m0[int(_1895)][_1897];
    float _1901 = -_1801;
    float _1903 = -_1883;
    float _1905 = fma(_1523, _1901, _1903);
    float _1907 = _1863 * _1863;
    int _1909 = int(_1631) + int(_1853);
    float _1911 = fma(_1833, _1835, _1821);
    float _1913 = fma(_1833, _1821, _1835);
    float _1915 = fma(_1905, _1905, _1907);
    int _1917 = _1811 & 3;
    bool _1919 = _1917 != 0;
    float _1921 = -_1817;
    float _1923 = fma(_1833, _1837, _1921);
    float _1925 = -_1837;
    float _1927 = fma(_1833, _1817, _1925);
    float _1929 = fma(_1877, _1877, _1915);
    bool _1931 = uint(_1917) > 1u;
    int _1933 = _1881 + 8;
    uint _1935 = uint(int(uint(_1933) >> uint(2)));
    uint _1937 = uint(int(uint(int(_1935)) >> uint(2)));
    int _1939 = int(_1935) & 3;
    float _1941 = (*spvDescriptorSet0.vp_c9)._m0[int(_1937)][_1939];
    int _1943 = int(_1935) + 1;
    uint _1945 = uint(int(uint(_1943) >> uint(2)));
    int _1947 = _1943 & 3;
    float _1949 = (*spvDescriptorSet0.vp_c9)._m0[int(_1945)][_1947];
    float _1951 = -_946;
    float _1953 = _1833 * _1951;
    float _1955 = rsqrt(_1929);
    float _1957 = _1843 * _946;
    int _1959 = _1825 ? 0 : 1;
    int _1961 = _1829 * _1909;
    int _1963 = _1961 + _1487;
    bool _1965 = uint(_1917) >= 2u;
    float _1967 = fma(_1871, _944, _1953);
    float _1969 = fma(_1911, _944, _1957);
    float _1971 = fma(_1923, _944, _1873);
    bool _1973 = uint(_1963) >= uint(_740);
    int _1975 = ~_1959;
    int _1977 = _1975 + 1;
    int _1979 = _1977 + 1;
    int _1981 = _1979;
    if (!_1931)
    {
        int _1983 = ~_1959;
        int _1985 = _1983 + 1;
        _1981 = _1985;
    }
    int _1987 = _1981;
    bool _1989 = _1917 != 3;
    float _1991 = _1905 * _1955;
    float _1993 = _1863 * _1955;
    float _1995 = _1877 * _1955;
    int _1997 = _1965 ? 0 : 1;
    float _1999 = _1515 * _1991;
    float _2001 = _1513 * _1993;
    float _2003 = _1523 * _1995;
    int _2005 = abs(_1987);
    float _2007 = -_1999;
    float _2009 = fma(_1513, _1995, _2007);
    float _2011 = -_2001;
    float _2013 = fma(_1523, _1991, _2011);
    float _2015 = -_2003;
    float _2017 = fma(_1515, _1993, _2015);
    int _2019 = ~_1997;
    int _2021 = _2019 + 1;
    int _2023 = _2021 + 1;
    bool _2025 = !_1919;
    int _2027 = _2025 ? 0 : 1;
    int _2029 = _2023;
    if (_1989)
    {
        int _2031 = ~_1997;
        int _2033 = _2031 + 1;
        _2029 = _2033;
    }
    int _2035 = _2029;
    int _2037 = ~_2005;
    int _2039 = _2037 + 1;
    int _2041 = _2039 + 1;
    bool _2043 = _1917 != 3;
    float _2045 = _2009 * _2009;
    int _2047 = abs(_2035);
    int _2049 = _2041 * as_type<int>(_1899);
    int _2051 = abs(_2027);
    float _2053 = fma(_2017, _2017, _2045);
    float _2055 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2057 = int(_2055);
    int _2059 = ~_2051;
    int _2061 = _2059 + 1;
    int _2063 = _2061 + 1;
    float _2065 = fma(_2013, _2013, _2053);
    bool _2067 = !_2043;
    int _2069 = _2067 ? 0 : (-1);
    int _2071 = ~_2047;
    int _2073 = _2071 + 1;
    int _2075 = _2073 + 1;
    int _2077 = _2063 * as_type<int>(_1891);
    int _2079 = _2077 + _2049;
    int _2081 = abs(_2069);
    float _2083 = rsqrt(_2065);
    bool _2085 = !_1973;
    int _2087 = _2085 ? 0 : (-1);
    int _2089 = _2075 * as_type<int>(_1941);
    int _2091 = _2089 + _2079;
    bool _2093 = !_774;
    int _2095 = _2093 ? 0 : 1;
    int _2097 = ~_1909;
    int _2099 = _2097 + _2087;
    int _2101 = _2099 + 1;
    int _2103 = ~_2081;
    int _2105 = _2103 + 1;
    int _2107 = _2105 + 1;
    int _2109 = abs(_2057);
    int _2111 = _740 * _2101;
    int _2113 = _2111 + _1487;
    int _2115 = abs(_2095);
    int _2117 = _2107 * as_type<int>(_1949);
    int _2119 = _2117 + _2091;
    float _2121 = float(uint(_2057));
    float _2123 = _2013 * _2083;
    float _2125 = _2017 * _2083;
    int _2127 = ~_2115;
    int _2129 = _2127 + 1;
    int _2131 = _2129 + 1;
    float _2133 = _2009 * _2083;
    float _2135 = _1513 * _2123;
    float _2137 = fma(_1857, _1021, _1967);
    float _2139 = 1.0 / _2121;
    float _2141 = float(uint(_2109));
    float _2143 = _1515 * _2133;
    float _2145 = -_2135;
    float _2147 = fma(_1515, _2125, _2145);
    int _2149 = _2119 * _2131;
    bool _2151 = !_1437;
    int _2153 = _2151 ? _2113 : (-1);
    float _2155 = _1523 * _2125;
    float _2157 = -_2143;
    float _2159 = fma(_1523, _2123, _2157);
    float _2161 = _2147 * _2147;
    float _2163 = 1.0 / _2141;
    float _2165 = fma(_1927, _1021, _1969);
    float _2167 = fma(_1913, _1021, _1971);
    float _2169 = -_2155;
    float _2171 = fma(_1513, _2133, _2169);
    float _2173 = fma(_2159, _2159, _2161);
    int _2175 = _2153 * _2115;
    int _2177 = _2175 + _2149;
    float _2179 = _1843 * _2125;
    int _2181 = as_type<int>(_2139) + (-2);
    float _2183 = fma(_2171, _2171, _2173);
    float _2185 = _1843 * _2123;
    float _2187 = float(uint(_2177));
    float _2189 = _1911 * _2125;
    float _2191 = rsqrt(_2183);
    int _2193 = abs(_2177);
    float _2195 = _1911 * _2133;
    float _2197 = as_type<float>(_2181) * _2187;
    int _2199 = as_type<int>(_2163) + (-2);
    float _2201 = _1843 * _2133;
    float _2203 = float(uint(_2193));
    float _2205 = _1927 * _2125;
    float _2207 = _1911 * _2123;
    float _2209 = trunc(_2197);
    float _2211 = precise::max(_2209, 0.0);
    uint _2213 = uint(_2211);
    float _2215 = _2125 * _2165;
    float _2217 = as_type<float>(_2199) * _2203;
    float _2219 = _2133 * _2165;
    float _2221 = _1927 * _2123;
    float _2223 = _2123 * _2165;
    float _2225 = _1927 * _2133;
    float _2227 = _2159 * _2191;
    float _2229 = trunc(_2217);
    float _2231 = precise::max(_2229, 0.0);
    uint _2233 = uint(_2231);
    float _2235 = _2147 * _2191;
    float _2237 = _2171 * _2191;
    int _2239 = ~_2057;
    int _2241 = _2239 + 1;
    float _2243 = -_1833;
    float _2245 = fma(_2243, _2227, _2179);
    float _2247 = -_1833;
    float _2249 = fma(_2247, _2235, _2201);
    float _2251 = -_1833;
    float _2253 = fma(_2251, _2237, _2185);
    float _2255 = fma(_1871, _2227, _2189);
    int _2257 = ~_2109;
    int _2259 = _2257 + 1;
    float _2261 = fma(_1871, _2235, _2195);
    float _2263 = fma(_1871, _2237, _2207);
    int _2265 = _2241 * int(_2213);
    int _2267 = _2265 + _2177;
    float _2269 = fma(_2227, _2137, _2215);
    float _2271 = fma(_2235, _2137, _2219);
    float _2273 = fma(_2237, _2137, _2223);
    int _2275 = _2259 * int(_2233);
    int _2277 = _2275 + _2193;
    float _2279 = float(uint(_2267));
    float _2281 = fma(_1857, _2227, _2205);
    float _2283 = fma(_1857, _2235, _2225);
    float _2285 = fma(_1857, _2237, _2221);
    float _2287 = float(uint(_2277));
    float _2289 = as_type<float>(_2181) * _2279;
    float _2291 = fma(_1513, _2167, _2269);
    float _2293 = fma(_1515, _2167, _2273);
    float _2295 = fma(_1839, _1513, _2245);
    float _2297 = as_type<float>(_2199) * _2287;
    float _2299 = trunc(_2289);
    float _2301 = precise::max(_2299, 0.0);
    uint _2303 = uint(_2301);
    float _2305 = _1037 + _2291;
    float _2307 = _1065 + _2293;
    float _2309 = fma(_1839, _1523, _2249);
    float _2311 = fma(_1839, _1515, _2253);
    float _2313 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2315 = _2305 + _2313;
    float _2317 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2319 = _2307 + _2317;
    float _2321 = fma(_1923, _1513, _2255);
    float _2323 = fma(_1923, _1523, _2261);
    float _2325 = trunc(_2297);
    float _2327 = precise::max(_2325, 0.0);
    uint _2329 = uint(_2327);
    float _2331 = _2315 * _2315;
    float _2333 = _2319 * _2319;
    float _2335 = fma(_1923, _1515, _2263);
    int _2337 = ~_2057;
    int _2339 = _2337 + 1;
    float _2341 = fma(_1913, _1513, _2281);
    float _2343 = _2331 + _2333;
    int _2345 = int(_2213) + int(_2303);
    float _2347 = fma(_1913, _1515, _2285);
    float _2349 = fma(_1913, _1523, _2283);
    float _2351 = sqrt(_2343);
    int _2353 = ~_2109;
    int _2355 = _2353 + 1;
    int _2357 = _2339 * _2345;
    int _2359 = _2357 + _2177;
    float _2361 = fma(_1523, _2167, _2271);
    float _2363 = _2311 * _1373;
    float _2365 = _2309 * _1373;
    int _2367 = int(_2233) + int(_2329);
    float _2369 = _2295 * _1373;
    bool _2371 = uint(_2359) >= uint(_2057);
    float _2373 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2375 = _2057 == 0;
    int _2377 = _2355 * _2367;
    int _2379 = _2377 + _2193;
    bool _2381 = !_2371;
    int _2383 = _2381 ? 0 : (-1);
    float _2385 = _1009 + _2361;
    float _2387 = fma(_2321, _1393, _2369);
    bool _2389 = _2351 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2391 = fma(_2323, _1393, _2365);
    bool _2393 = uint(_2379) >= uint(_2109);
    float _2395 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2397 = _2177 ^ _2057;
    int _2399 = ~_2345;
    int _2401 = _2399 + _2383;
    int _2403 = _2401 + 1;
    bool _2405 = !_2393;
    float _2407 = _2405 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    uint _2409 = uint(int(uint(_2397) >> uint(31)));
    int _2411 = _2057 * _2403;
    int _2413 = _2411 + _2177;
    bool _2415 = _2057 == 0;
    int _2417 = ~as_type<int>(_2407);
    int _2419 = _2367 + _2417;
    int _2421 = _2419 + 1;
    int _2423 = ~int(_2409);
    int _2425 = _2423 + 1;
    float _2427 = as_type<float>(_2409);
    float _2429 = _2407;
    float _2431 = as_type<float>(_2177);
    float _2433 = _2331;
    float _2435 = _2333;
    if (!_2389)
    {
        _2427 = _2305;
    }
    float _2437 = _2427;
    float _2439 = _2437;
    if (!_2389)
    {
        _2429 = _2307;
    }
    float _2441 = _2429;
    int _2443 = _2421 ^ _2425;
    float _2445 = _2441;
    if (!_2389)
    {
        _2431 = _2385;
    }
    float _2447 = _2431;
    bool _2449 = !_2389;
    float _2451 = _2447;
    if (!_2449)
    {
        float _2453 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2455 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2457 = _2351 + _2455;
        float _2459 = _2385 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2461 = rsqrt(_2343);
        float _2463 = _2457 * _2453;
        float _2465 = _2463 * 0.15915493667125701904296875;
        float _2467 = _2465 * 6.283185482025146484375;
        float _2469 = sin(_2467);
        float _2471 = _2465 * 6.283185482025146484375;
        float _2473 = cos(_2471);
        float _2475 = fma(_2469, _2459, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2477 = _2461 * _2475;
        float _2479 = fma(_2315, _2477, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2481 = _2473 + (-1.0);
        float _2483 = fma(_2319, _2477, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2485 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2487 = _2479 + _2485;
        float _2489 = _2481 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2491 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2493 = _2483 + _2491;
        float _2495 = _2487 * _2487;
        float _2497 = fma(_2385, _2473, _2489);
        float _2499 = _2493 * _2493;
        _2451 = _2497;
        _2433 = _2495;
        _2435 = _2499;
        _2439 = _2479;
        _2445 = _2483;
    }
    float _2501 = _2451;
    float _2503 = _2433;
    float _2505 = _2435;
    float _2507 = _2439;
    float _2509 = _2445;
    bool _2511 = !_2375;
    int _2513 = _2511 ? _2413 : (-1);
    float _2515 = _2373 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2517 = ~_2425;
    int _2519 = _2517 + _2443;
    int _2521 = _2519 + 1;
    float _2523 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2525 = _2501 + _2523;
    float _2527 = float(_2513);
    float _2529 = in.m_65.z;
    bool _2531 = !_2415;
    int _2533 = _2531 ? _2521 : (-1);
    float _2535 = fma(_2525, _2525, _2503);
    float _2537 = _2395 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2539 = fma(_2515, _2527, _932);
    float _2541 = fma(_2515, _1791, -0.5);
    float _2543 = in.m_65.w;
    float _2545 = float(_2533);
    float _2547 = _2535 + _2505;
    float _2549 = fma(_1101, _2541, _2539);
    float _2551 = fma(_2537, _790, -0.5);
    float _2553 = -_956;
    float _2555 = fma(_2537, _2545, _2553);
    float _2557 = sqrt(_2547);
    float _2559 = fma(_2335, _1393, _2363);
    float _2561 = fma(_1083, _2551, _2555);
    float _2563 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2565 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2567 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2569 = fma(_2341, _1377, _2387);
    float _2571 = fma(_2349, _1377, _2391);
    float _2573 = _2563 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2575 = _2565 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2577 = _2567 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2579 = _1807 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2581 = _2549 + 0.5;
    float _2583 = _2561 + 0.5;
    float _2585 = fma(_2347, _1377, _2559);
    out.m_67.z = _2529;
    bool _2587 = _2557 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2589 = isnan(_2557);
    bool _2591 = _2587 || _2589;
    bool _2593 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2595 = _2591 || _2593;
    out.m_67.w = _2543;
    out.m_75.x = _2573;
    out.m_75.y = _2575;
    out.m_75.z = _2577;
    out.m_75.w = _2579;
    out.m_77.x = _2581;
    out.m_77.y = _2583;
    float _2597 = _2545;
    if (!_2595)
    {
        _2597 = 1.0;
    }
    float _2599 = _2597;
    out.m_79.x = _2569;
    out.m_79.y = _2571;
    out.m_79.z = _2585;
    bool _2601 = !_2595;
    float _2603 = _2599;
    if (!_2601)
    {
        bool _2605 = _2557 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2607 = isnan(_2557);
        bool _2609 = _2605 || _2607;
        bool _2611 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2613 = _2609 || _2611;
        if (!_2613)
        {
            float _2615 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2617 = _2557 + _2615;
            float _2619 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2621 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2619;
            float _2623 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2625 = _2623 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2627 = 1.0 / _2621;
            float _2629 = _2617 * _2627;
            float _2631 = fma(_2629, _2625, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2603 = _2631;
            _2633 = true;
        }
        else
        {
            bool _2635 = _2557 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2637 = isnan(_2557);
            bool _2639 = _2635 || _2637;
            bool _2641 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2643 = _2639 || _2641;
            if (!_2643)
            {
                float _2645 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2647 = _2557 + _2645;
                float _2649 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2651 = _2649 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2653 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2655 = _2653 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2657 = 1.0 / _2651;
                float _2659 = _2647 * _2657;
                float _2661 = fma(_2659, _2655, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2603 = _2661;
                _2633 = true;
            }
            else
            {
                _2603 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2633 = false;
    float _2663 = _2603;
    float _2665 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2667 = _2501 + _2665;
    float _2669 = _1009 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2671 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2673 = _2507 + _2671;
    float _2675 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2677 = _2509 + _2675;
    float _2679 = fma(_2667, _2663, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2681 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2669);
    float _2683 = fma(_2673, _2663, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2685 = fma(_2677, _2663, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2687 = -_1009;
    float _2689 = _2687 + _2679;
    float _2691 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2681);
    float _2693 = -_1037;
    float _2695 = _2693 + _2683;
    float _2697 = _1009 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2699 = _2689 * _2689;
    float _2701 = _2691 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2703 = -_1065;
    float _2705 = _2703 + _2685;
    float _2707 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2697);
    float _2709 = fma(_2695, _2695, _2699);
    float _2711 = 1.0 / _2701;
    float _2713 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2707);
    float _2715 = fma(_2705, _2705, _2709);
    float _2717 = _2713 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2719 = sqrt(_2715);
    float _2721 = _2717 + _2701;
    float _2723 = _2721 * _2711;
    float _2725 = _2723 * 0.5;
    float _2727 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2729 = fma(_2725, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2727);
    bool _2731 = _2719 > 0.0;
    float _2733 = 1.0 / _2729;
    bool _2735 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2737 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2739 = _2735 || _2737;
    bool _2741 = isnan(0.5);
    bool _2743 = _2739 || _2741;
    bool _2745 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2747 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2749 = _2745 || _2747;
    bool _2751 = isnan(0.5);
    bool _2753 = _2749 || _2751;
    float _2755 = _2701;
    float _2757 = _2691;
    float _2759 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _2761 = _2683;
    float _2763 = _2685;
    float _2765 = _2679;
    if (!_2731)
    {
        _2755 = _2683;
    }
    float _2767 = _2755;
    float _2769 = _2767;
    float _2771 = _2767;
    if (!_2731)
    {
        _2757 = _2679;
    }
    float _2773 = _2757;
    float _2775 = _2773;
    float _2777 = _2773;
    if (!_2731)
    {
        _2759 = _2685;
    }
    float _2779 = _2759;
    bool _2781 = !_2731;
    float _2783 = _2779;
    if (!_2781)
    {
        float _2785 = _188 * _188;
        float _2787 = fma(_186, _186, _2785);
        float _2789 = rsqrt(_2715);
        float _2791 = fma(_190, _190, _2787);
        float _2793 = sqrt(_2791);
        float _2795 = _2695 * _2789;
        float _2797 = _2689 * _2789;
        float _2799 = _2705 * _2789;
        bool _2801 = _2793 > 0.0;
        float _2803 = _2789;
        if (!_2801)
        {
            _2769 = _2683;
        }
        float _2805 = _2769;
        _2771 = _2805;
        if (!_2801)
        {
            _2775 = _2679;
        }
        float _2807 = _2775;
        _2777 = _2807;
        if (!_2801)
        {
            _2803 = _2685;
        }
        float _2809 = _2803;
        bool _2811 = !_2801;
        _2783 = _2809;
        if (!_2811)
        {
            float _2813 = rsqrt(_2791);
            float _2815 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2817 = _188 * _2813;
            float _2819 = _186 * _2813;
            float _2821 = _190 * _2813;
            float _2823 = _2797 * _2817;
            float _2825 = fma(_2795, _2819, _2823);
            float _2827 = _2815 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2829 = fma(_2799, _2821, _2825);
            float _2831 = _2829 * _2827;
            float _2833 = fma(_186, _2831, _2683);
            float _2835 = fma(_188, _2831, _2679);
            float _2837 = fma(_190, _2831, _2685);
            _2783 = _2837;
            _2771 = _2833;
            _2777 = _2835;
        }
    }
    float _2839 = _2783;
    float _2841 = _2771;
    float _2843 = _2777;
    float _2845 = _2843;
    float _2847 = _2841;
    if (_2743)
    {
        _194 = 1.0;
    }
    float _2849 = _194;
    float _2851 = _2849;
    if (_2753)
    {
        _196 = _2839;
    }
    float _2853 = _196;
    float _2855 = _2853;
    if (!_2753)
    {
        float _2857 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2859 = _1009 + _2857;
        float _2861 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2863 = _1037 + _2861;
        float _2865 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2867 = -_1037;
        float _2869 = _2867 + _2841;
        float _2871 = _2859 * _2859;
        float _2873 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2875 = _1065 + _2873;
        float _2877 = -_1065;
        float _2879 = _2877 + _2839;
        float _2881 = fma(_2863, _2863, _2871);
        float _2883 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2885 = fma(_2875, _2875, _2881);
        float _2887 = sqrt(_2885);
        float _2889 = _2865 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2891 = precise::min(_2887, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2893 = _2891 * _2883;
        float _2895 = -_1009;
        float _2897 = _2895 + _2843;
        float _2899 = _2889 * _2893;
        float _2901 = fma(_2897, _2899, _1009);
        float _2903 = fma(_2869, _2899, _1037);
        float _2905 = fma(_2879, _2899, _1065);
        _2845 = _2901;
        _2847 = _2903;
        _2855 = _2905;
    }
    float _2907 = _2845;
    float _2909 = _2847;
    float _2911 = _2855;
    if (_2743)
    {
        _2761 = 1.0;
    }
    float _2913 = _2761;
    float _2915 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2917 = _2733 * _2915;
    float _2919 = _2913;
    if (!_2743)
    {
        float _2921 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2923 = _2921 * 0.15915493667125701904296875;
        float _2925 = _2923 * 6.283185482025146484375;
        float _2927 = cos(_2925);
        float _2929 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2931 = _2929 * 0.15915493667125701904296875;
        float _2933 = _2923 * 6.283185482025146484375;
        float _2935 = sin(_2933);
        float _2937 = 1.0 / _2927;
        float _2939 = _2931 * 6.283185482025146484375;
        float _2941 = cos(_2939);
        float _2943 = _2935 * _2937;
        float _2945 = _2931 * 6.283185482025146484375;
        float _2947 = sin(_2945);
        float _2949 = _2941 * _2943;
        float _2951 = 1.0 / _2949;
        float _2953 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2955 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2953;
        float _2957 = 1.0 / _2955;
        float _2959 = _2947 * _2951;
        float _2961 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2963 = fma(_2917, _2959, _2961);
        float _2965 = _2963 * _2957;
        float _2967 = precise::clamp(_2965, 0.0, 1.0);
        _2851 = _2967;
    }
    float _2969 = _2851;
    if (!_2743)
    {
        float _2971 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2973 = _2971 * 0.15915493667125701904296875;
        float _2975 = _2973 * 6.283185482025146484375;
        float _2977 = cos(_2975);
        float _2979 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2981 = _2979 * 0.15915493667125701904296875;
        float _2983 = _2973 * 6.283185482025146484375;
        float _2985 = sin(_2983);
        float _2987 = 1.0 / _2977;
        float _2989 = _2981 * 6.283185482025146484375;
        float _2991 = cos(_2989);
        float _2993 = _2985 * _2987;
        float _2995 = _2981 * 6.283185482025146484375;
        float _2997 = sin(_2995);
        float _2999 = _2991 * _2993;
        float _3001 = 1.0 / _2999;
        float _3003 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3005 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3003;
        float _3007 = 1.0 / _3005;
        float _3009 = _2997 * _3001;
        float _3011 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3013 = fma(_2917, _3009, _3011);
        float _3015 = _3013 * _3007;
        float _3017 = precise::clamp(_3015, 0.0, 1.0);
        float _3019 = -_3017;
        float _3021 = _3019 + 1.0;
        _2763 = _3001;
        _2919 = _3021;
    }
    float _3023 = _2763;
    float _3025 = _2919;
    float _3027 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3029 = _2907 + _3027;
    float _3031 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3033 = _2909 + _3031;
    float _3035 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3037 = _2911 + _3035;
    float _3039 = _3029 * _3029;
    float _3041 = fma(_3033, _3033, _3039);
    float _3043 = fma(_1037, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3045 = fma(_3037, _3037, _3041);
    float _3047 = rsqrt(_3045);
    float _3049 = sqrt(_3045);
    float _3051 = _3047 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3053 = _3033 * _3051;
    float _3055 = _3037 * _3051;
    float _3057 = _3053 * _3053;
    float _3059 = _3055 * _3055;
    float _3061 = _3057 + _3059;
    float _3063 = sqrt(_3061);
    bool _3065 = _3063 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3067 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3069 = _3063 + _3067;
    float _3071 = _3047;
    float _3073 = _3069;
    float _3075 = _3029;
    float _3077 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_3065)
    {
        float _3079 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3071 = _3079;
    }
    float _3081 = _3071;
    float _3083 = _3081;
    if (_3065)
    {
        float _3085 = _3069 * _3081;
        _3073 = _3085;
    }
    float _3087 = _3073;
    if (_3065)
    {
        float _3089 = rsqrt(_3061);
        _3083 = _3089;
    }
    float _3091 = _3083;
    float _3093 = _3091;
    if (_3065)
    {
        float _3095 = _3087 * 0.15915493667125701904296875;
        _2765 = _3095;
    }
    float _3097 = _2765;
    float _3099 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3101 = _3037;
    float _3103 = _3097;
    if (_3065)
    {
        float _3105 = _3097 * 6.283185482025146484375;
        float _3107 = sin(_3105);
        _3101 = _3107;
    }
    float _3109 = _3101;
    float _3111 = precise::max(0.0, _3099);
    float _3113 = _3023;
    float _3115 = _3111;
    if (_3065)
    {
        float _3117 = _3097 * 6.283185482025146484375;
        float _3119 = cos(_3117);
        _3113 = _3119;
    }
    float _3121 = _3113;
    float _3123 = -_3051;
    float _3125 = -_3111;
    float _3127 = fma(_3029, _3123, _3125);
    if (_3065)
    {
        float _3129 = _3127 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3075 = _3129;
    }
    float _3131 = _3075;
    float _3133 = _3109;
    float _3135 = _3131;
    if (_3065)
    {
        float _3137 = fma(_3109, _3131, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3133 = _3137;
    }
    float _3139 = _3133;
    float _3141 = _3139;
    if (!_3065)
    {
        _3135 = _3127;
    }
    float _3143 = _3135;
    float _3145 = _3143;
    if (_3065)
    {
        float _3147 = _3091 * _3139;
        _3077 = _3147;
    }
    float _3149 = _3077;
    if (!_3065)
    {
        _3093 = _3053;
    }
    float _3151 = _3093;
    float _3153 = _3151;
    float _3155 = _3121;
    if (_3065)
    {
        float _3157 = _3121 + (-1.0);
        _3115 = _3157;
    }
    float _3159 = _3115;
    float _3161 = _3159;
    if (_3065)
    {
        float _3163 = _3053 * _3149;
        _3153 = _3163;
    }
    float _3165 = _3153;
    if (!_3065)
    {
        _3141 = _3057;
    }
    float _3167 = _3141;
    float _3169 = _3167;
    if (_3065)
    {
        float _3171 = _3159 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3103 = _3171;
    }
    float _3173 = _3103;
    if (!_3065)
    {
        _3161 = _3055;
    }
    float _3175 = _3161;
    float _3177 = _3175;
    if (_3065)
    {
        float _3179 = _3055 * _3149;
        _3177 = _3179;
    }
    float _3181 = _3177;
    if (_3065)
    {
        float _3183 = _3165 * _3165;
        _3169 = _3183;
    }
    float _3185 = _3169;
    if (_3065)
    {
        float _3187 = fma(_3127, _3121, _3173);
        _3145 = _3187;
    }
    float _3189 = _3145;
    if (!_3065)
    {
        _3155 = _3059;
    }
    float _3191 = _3155;
    float _3193 = _3191;
    if (_3065)
    {
        float _3195 = _3181 * _3181;
        _3193 = _3195;
    }
    float _3197 = _3193;
    float _3199 = fma(_3189, _3189, _3185);
    float _3201 = _2907 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3203 = floor(_3043);
    float _3205 = _3199 + _3197;
    float _3207 = fma(_2909, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3201);
    float _3209 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3211 = fma(_3049, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3209);
    float _3213 = precise::clamp(_3211, 0.0, 1.0);
    float _3215 = fma(_1065, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3217 = fma(_2911, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3207);
    float _3219 = -_3213;
    float _3221 = _3219 + 1.0;
    float _3223 = rsqrt(_3205);
    float _3225 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3227 = _3217 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3229 = _2907 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3231 = _3227 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3233 = abs(_3221);
    float _3235 = log2(_3233);
    float _3237 = _2907 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3239 = -_3231;
    float _3241 = fma(_3239, _3225, 1.0);
    float _3243 = _2907 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3245 = -_3203;
    float _3247 = _3043 + _3245;
    float _3249 = fma(_2909, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3237);
    float _3251 = _3223 * _3189;
    float _3253 = fma(_2909, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3243);
    float _3255 = fma(_2911, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3249);
    float _3257 = _3223 * _3165;
    float _3259 = _3223 * _3181;
    float _3261 = fma(_2911, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3253);
    float _3263 = _3255 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3265 = _3257 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3267 = fma(_2909, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3229);
    float _3269 = _3261 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3271 = _3263 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3273 = -_3265;
    float _3275 = fma(_3251, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3273);
    float _3277 = fma(_2911, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3267);
    float _3279 = _3235 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3281 = fma(_3269, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3271);
    float _3283 = -_3259;
    float _3285 = fma(_3283, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3275);
    float _3287 = _3277 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3289 = floor(_3215);
    float _3291 = fma(_3227, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3281);
    float _3293 = fma(_3285, -0.5, 0.5);
    float _3295 = _3263 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3297 = fma(_3285, 0.5, 0.5);
    float _3299 = fma(_3287, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3291);
    float _3301 = _3263 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3303 = exp2(_3279);
    float _3305 = fma(_3269, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3295);
    float _3307 = fma(_3269, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3301);
    float _3309 = _3251 + 1.0;
    float _3311 = fma(_3297, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3313 = fma(_3227, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3307);
    float _3315 = sqrt(_3293);
    float _3317 = -_3289;
    float _3319 = _3215 + _3317;
    float _3321 = fma(_3297, _3311, -0.212114393711090087890625);
    float _3323 = fma(_3297, _3321, 1.570728778839111328125);
    float _3325 = log2(_3241);
    float _3327 = fma(_3227, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3305);
    float _3329 = -_3251;
    float _3331 = fma(_3303, _3309, _3329);
    float _3333 = fma(_3287, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3327);
    float _3335 = fma(_3287, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3313);
    float _3337 = 1.0 / _3299;
    float _3339 = _3315 * 0.636619746685028076171875;
    float2 _8895 = float2(_3247, _3319);
    float _3341 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8895, float2(0.0), isnan(_8895)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8895, float2(0.0), isnan(_8895)), level(0.0)).x;
    float _3343 = fma(_3331, 0.5, 0.5);
    float _3345 = _3325 * 0.693147182464599609375;
    float _3347 = _3333 * _3337;
    float _3349 = _3335 * _3337;
    float _3351 = -_3323;
    float _3353 = fma(_3339, _3351, 1.0);
    float _3355 = _3345 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3357 = fma(_3347, 0.5, 0.5);
    float _3359 = fma(_3349, -0.5, 0.5);
    float3 _8930 = float3(_3357, _3359, _3355);
    float _3361 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8930, float3(0.0), isnan(_8930)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8930, float3(0.0), isnan(_8930)), level(0.0)).x;
    float3 _8941 = float3(_3357, _3359, _3355);
    float4 _3364 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8941, float3(0.0), isnan(_8941)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8941, float3(0.0), isnan(_8941)), level(0.0)).xyzw;
    float _3366 = _3364.x;
    float _3368 = _3364.y;
    float _3370 = _3364.z;
    float _3372 = _3364.w;
    float2 _8957 = float2(_3353, _3343);
    float3 _3376 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8957, float2(0.0), isnan(_8957)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8957, float2(0.0), isnan(_8957)), level(0.0)).xyz;
    float _3378 = _3376.x;
    float _3380 = _3376.y;
    float _3382 = _3376.z;
    float _3384 = abs(_2917);
    float _3386 = log2(_3384);
    float _3388 = _3235 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3390 = _3263 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3392 = _3049 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3394 = isnan(_3049);
    bool _3396 = _3392 || _3394;
    bool _3398 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3400 = _3396 || _3398;
    float _3402 = exp2(_3388);
    float _3404 = fma(_3269, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3390);
    bool _3406 = _2917 <= 8000.0;
    bool _3408 = isnan(_2917);
    bool _3410 = _3406 || _3408;
    bool _3412 = isnan(8000.0);
    bool _3414 = _3410 || _3412;
    float _3416 = float(_3414);
    float _3418 = in.m_81.x;
    float _3420 = fma(_3227, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3404);
    float _3422 = _3299 * 0.5;
    float _3424 = _3386 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3426 = fma(_3287, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3420);
    float _3428 = _3333 + _3299;
    float _3430 = exp2(_3424);
    float _3432 = _3428 * 0.5;
    float _3434 = -_3402;
    float _3436 = _3434 + 1.0;
    out.gl_Position.x = _3333;
    out.gl_Position.y = _3335;
    out.gl_Position.z = _3426;
    out.gl_Position.w = _3299;
    float _3438 = _3436 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3440 = fma(_3430, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3442 = precise::clamp(_3440, 0.0, 1.0);
    float _3444 = fma(_3335, -0.5, _3422);
    float _3446 = _2969 * _3025;
    float _3448 = fma(_3442, -2.0, 3.0);
    float _3450 = _3442 * _3442;
    float _3452 = _3335;
    float _3454 = _3299;
    float _3456 = _3426;
    float _3458 = _3446;
    if (!_3400)
    {
        _3452 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3460 = _3452;
    float _3462 = _3450 * _3448;
    float _3464 = -_3462;
    float _3466 = _3464 + 1.0;
    float _3468 = fma(_3466, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3462);
    float _3470 = _3426 + _3299;
    float _3472 = _3460;
    float _3474 = _3460;
    if (!_3400)
    {
        _3454 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3476 = _3454;
    float _3478 = _3416 * _3468;
    float _3480 = _3470 * 0.5;
    float _3482 = _3476;
    float _3484 = _3476;
    if (!_3400)
    {
        _3456 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3486 = _3456;
    float _3488 = _3478 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_83.x = _3432;
    out.m_83.y = _3444;
    out.m_83.z = _3480;
    out.m_83.w = _3299;
    float _3490 = -_3341;
    float _3492 = _3490 + 1.0;
    float _3494 = _3492 * _3488;
    float _3496 = precise::clamp(_3494, 0.0, 1.0);
    float _3498 = -_3496;
    float _3500 = fma(_3498, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3502 = _3500 * _3418;
    float _3504 = _3438 * _3361;
    float _3506 = -_3438;
    float _3508 = _3506 + 1.0;
    float _3510 = _3372 * _3504;
    float _3512 = _3382 * _3504;
    float _3514 = _3372 * _3508;
    float _3516 = fma(_3378, _3510, _3366);
    float _3518 = fma(_3380, _3510, _3368);
    float _3520 = _3502 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3522 = fma(_3372, _3512, _3370);
    float _3524 = _3446 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3526 = _3502;
    float _3528 = _3366;
    float _3530 = _3486;
    float _3532 = _3486;
    if (!_3400)
    {
        _3526 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3534 = _3526;
    out.m_85.x = _3520;
    float _3536 = _3534;
    float _3538 = _3534;
    if (!_3400)
    {
        _3528 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3540 = _3528;
    float _3542 = _3540;
    float _3544 = _3540;
    if (!_3400)
    {
        _3458 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3546 = _3458;
    out.m_87.x = _3516;
    out.m_87.y = _3518;
    out.m_87.z = _3522;
    out.m_87.w = _3514;
    bool _3548 = !_3400;
    float _3550 = _3546;
    float _3552 = _3546;
    if (!_3548)
    {
        bool _3554 = _3049 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3556 = isnan(_3049);
        bool _3558 = _3554 || _3556;
        bool _3560 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3562 = _3558 || _3560;
        if (!_3562)
        {
            float _3564 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3566 = _3049 + _3564;
            float _3568 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3570 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3568;
            float _3572 = 1.0 / _3570;
            float _3574 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3576 = _3574 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3578 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3580 = _3578 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3582 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3584 = _3582 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3586 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3588 = _3586 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3590 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3592 = _3590 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3594 = _3566 * _3572;
            float _3596 = precise::clamp(_3594, 0.0, 1.0);
            float _3598 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3600 = _3598 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3602 = fma(_3596, _3576, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3604 = fma(_3596, _3600, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3606 = fma(_3596, _3580, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3608 = fma(_3596, _3584, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3610 = fma(_3596, _3588, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3612 = fma(_3596, _3592, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3544 = _3604;
            _3474 = _3610;
            _3538 = _3602;
            _3532 = _3608;
            _3484 = _3606;
            _3552 = _3612;
            _3614 = true;
        }
        else
        {
            bool _3616 = _3049 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3618 = isnan(_3049);
            bool _3620 = _3616 || _3618;
            bool _3622 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3624 = _3620 || _3622;
            if (!_3624)
            {
                _3536 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3626 = _3536;
            _3538 = _3626;
            if (!_3624)
            {
                _3542 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3628 = _3542;
            _3544 = _3628;
            if (!_3624)
            {
                _3482 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3630 = _3482;
            _3484 = _3630;
            if (!_3624)
            {
                _3530 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3632 = _3530;
            _3532 = _3632;
            if (!_3624)
            {
                _3472 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3634 = _3472;
            _3474 = _3634;
            if (!_3624)
            {
                _3550 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3636 = _3550;
            bool _3638 = !_3624;
            _3552 = _3636;
            if (!_3638)
            {
                bool _3640 = _3049 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3642 = isnan(_3049);
                bool _3644 = _3640 || _3642;
                bool _3646 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3648 = _3644 || _3646;
                if (!_3648)
                {
                    float _3650 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3652 = _3049 + _3650;
                    float _3654 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3656 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3654;
                    float _3658 = 1.0 / _3656;
                    float _3660 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3662 = _3660 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3664 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3666 = _3664 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3668 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3670 = _3668 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3672 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3674 = _3672 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3676 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3678 = _3676 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3680 = _3652 * _3658;
                    float _3682 = precise::clamp(_3680, 0.0, 1.0);
                    float _3684 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3686 = _3684 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3688 = fma(_3682, _3662, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3690 = fma(_3682, _3686, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3692 = fma(_3682, _3666, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3694 = fma(_3682, _3670, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3696 = fma(_3682, _3674, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3698 = fma(_3682, _3678, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3544 = _3690;
                    _3474 = _3696;
                    _3538 = _3688;
                    _3532 = _3694;
                    _3484 = _3692;
                    _3552 = _3698;
                    _3614 = true;
                }
                else
                {
                    _3544 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3474 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3538 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3532 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3484 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3552 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3614 = false;
    float _3700 = _3544;
    float _3702 = _3474;
    float _3704 = _3538;
    float _3706 = _3532;
    float _3708 = _3484;
    float _3710 = _3552;
    float _3712 = fma(_2571, -0.5, 0.5);
    float _3714 = precise::clamp(_3712, 0.0, 1.0);
    float _3716 = -_3700;
    float _3718 = _3716 + _3702;
    float _3720 = _3524 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3722 = -_3704;
    float _3724 = _3722 + _3706;
    float _3726 = fma(_3714, _3718, _3700);
    out.m_89.x = 0.0;
    float _3728 = -_3708;
    float _3730 = _3728 + _3710;
    float _3732 = fma(_3714, _3724, _3704);
    float _3734 = _3726 * 0.586610972881317138671875;
    out.m_51.x = _3720;
    bool _3736 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3738 = fma(_3714, _3730, _3708);
    float _3740 = fma(_3732, 0.298911988735198974609375, _3734);
    bool _3742 = _2969 > 0.0;
    bool _3744 = isnan(_2969);
    bool _3746 = _3742 || _3744;
    bool _3748 = isnan(0.0);
    bool _3750 = _3746 || _3748;
    float _3752 = fma(_3738, 0.114477999508380889892578125, _3740);
    bool _3754 = _3025 <= 0.0;
    bool _3756 = !_3750;
    bool _3758 = _3754 || _3756;
    float _3760 = -_3752;
    float _3762 = _3732 + _3760;
    float _3764 = -_3752;
    float _3766 = _3726 + _3764;
    float _3768 = -_3752;
    float _3770 = _3738 + _3768;
    float _3772 = fma(_3762, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3752);
    float _3774 = fma(_3766, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3752);
    float _3776 = fma(_3770, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3752);
    bool _3778 = !_3736;
    if (!_3778)
    {
        float _3780 = -_2907;
        float _3782 = _3780 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3784 = -_2909;
        float _3786 = _3784 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3788 = -_2911;
        float _3790 = _3788 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3792 = _3782 * _3782;
        float _3794 = fma(_3786, _3786, _3792);
        float _3796 = fma(_3790, _3790, _3794);
        float _3798 = sqrt(_3796);
        float _3800 = rsqrt(_3796);
        float _3802 = -_3798;
        float _3804 = _3802 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3806 = _3804 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3808 = precise::clamp(_3806, 0.0, 1.0);
        float _3810 = _3786 * _3800;
        float _3812 = _3782 * _3800;
        float _3814 = abs(_3808);
        float _3816 = log2(_3814);
        float _3818 = _3790 * _3800;
        float _3820 = _3810 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3822 = _2571 * _3812;
        float _3824 = -_3812;
        float _3826 = -_3820;
        float _3828 = fma(_3824, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3826);
        float _3830 = fma(_2569, _3810, _3822);
        float _3832 = -_3818;
        float _3834 = fma(_3832, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3828);
        float _3836 = fma(_2585, _3818, _3830);
        float _3838 = precise::clamp(_3836, 0.0, 1.0);
        float _3840 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3842 = _3834 + _3840;
        float _3844 = _3816 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3846 = _3842 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3848 = precise::clamp(_3846, 0.0, 1.0);
        float _3850 = exp2(_3844);
        float _3852 = _3850 * _3848;
        float _3854 = _3838 * _3852;
        float _3856 = _3854 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3858 = _3854 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3860 = _3854 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _3856;
        out.m_89.y = _3858;
        out.m_89.z = _3860;
    }
    out.m_91.x = _3772;
    out.m_91.y = _3774;
    out.m_91.z = _3776;
    if (!_3758)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_51.x = 0.0;
    float _3862 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3862;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3614 = false;
    bool _2633 = false;
    bool _706 = false;
    bool _564 = false;
    bool _438 = false;
    bool _216 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_48.w;
    float _107 = trunc(_105);
    int _110 = int(_107);
    bool _114 = _110 >= 1;
    float _116 = 0.0;
    if (!_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _116;
    float _120 = _118;
    if (!_114)
    {
        out.m_51.x = 0.0;
    }
    int _122 = 0;
    if (!_114)
    {
        float _124 = _118 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    int _128 = _126;
    if (!_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3919 = as_type<float>(_126);
        out.gl_Position.z = _3919;
    }
    if (!_114)
    {
        return out;
    }
    float _130 = in.m_53.w;
    bool _132 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_130);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    float _142 = -_130;
    float _144 = _142 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _146 = _144;
    if (_140)
    {
        float _148 = float(_110);
        _120 = _148;
    }
    float _150 = _120;
    bool _152 = _144 >= _150;
    bool _154 = !_140;
    bool _156 = _152 || _154;
    float _158 = _150;
    if (_156)
    {
        _158 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _158;
    if (_156)
    {
        out.m_51.x = 0.0;
    }
    if (_156)
    {
        float _162 = _160 * 5.0;
        _128 = as_type<int>(_162);
    }
    int _164 = _128;
    if (_156)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3989 = as_type<float>(_164);
        out.gl_Position.z = _3989;
    }
    if (_156)
    {
        return out;
    }
    float _166 = in.m_55.x;
    float _168 = in.m_55.y;
    float _170 = in.m_55.z;
    bool _172 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _174 = _168 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _176 = _168 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _178 = _168 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _180 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[4].x, _174);
    float _182 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[5].x, _176);
    float _184 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[6].x, _178);
    float _186 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[4].z, _180);
    float _188 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[5].z, _182);
    float _190 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[6].z, _184);
    bool _192 = !_172;
    float _194 = _188;
    float _196 = _190;
    float _214;
    if (!_192)
    {
        float _198 = in.m_57.x;
        float _200 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _202 = _198 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _204 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[12].x, _144);
        float _206 = _204 * _200;
        float _208 = floor(_206);
        float _210 = -_208;
        float _212 = _206 + _210;
        _214 = _212;
        _216 = true;
    }
    else
    {
        float _218 = float(_110);
        float _220 = 1.0 / _218;
        float _222 = _144 * _220;
        _214 = _222;
    }
    _216 = false;
    float _224 = _214;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _228 = _224 + _226;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _232 = _224 + _230;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _236 = _224 + _234;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _240 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _238;
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _244 = _242 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _246;
    float _250 = 1.0 / _240;
    bool _252 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _254 = 1.0 / _248;
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _258 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _256;
    float _260 = 1.0 / _244;
    float _262 = _228 * _250;
    bool _264 = _224 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _266 = isnan(_224);
    bool _268 = _264 || _266;
    bool _270 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _272 = _268 || _270;
    float _274 = float(_272);
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _278 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _276;
    float _280 = fma(_258, _262, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _282 = fma(_278, _262, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _284 = _232 * _254;
    bool _286 = _224 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _288 = isnan(_224);
    bool _290 = _286 || _288;
    bool _292 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _294 = _290 || _292;
    float _296 = float(_294);
    float _298 = -_274;
    float _300 = _298 + 1.0;
    float _302 = _296 * _300;
    float _304 = -_296;
    float _306 = _304 + 1.0;
    float _308 = _236 * _260;
    bool _310 = _224 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _312 = isnan(_224);
    bool _314 = _310 || _312;
    bool _316 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _318 = _314 || _316;
    float _320 = float(_318);
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _324 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _322;
    bool _326 = _224 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _328 = isnan(_224);
    bool _330 = _326 || _328;
    bool _332 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _334 = _330 || _332;
    float _336 = float(_334);
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _340 = _338 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _344 = _342 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _346 = -_320;
    float _348 = _346 + 1.0;
    float _350 = fma(_324, _262, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _352 = _320 * _306;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _356 = _354 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _358 = _336 * _348;
    float _360 = -_336;
    float _362 = _360 + 1.0;
    float _364 = fma(_344, _308, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _366 = _350 * _358;
    float _368 = _280 * _358;
    float _370 = _282 * _358;
    float _372 = fma(_356, _308, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _374 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[143].x, _368);
    float _376 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[143].y, _370);
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _378;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _382;
    float _386 = fma(_340, _308, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _388 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[143].z, _366);
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _392 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _390;
    float _394 = fma(_364, _352, _374);
    float _396 = fma(_380, _284, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _398 = fma(_384, _284, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _400 = fma(_372, _352, _376);
    float _402 = fma(_392, _284, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _404 = fma(_386, _352, _388);
    float _406 = fma(_396, _302, _394);
    float _408 = fma(_398, _302, _400);
    float _410 = fma(_402, _302, _404);
    float _412 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[146].x, _406);
    float _414 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[146].y, _408);
    float _416 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[146].z, _410);
    bool _418 = !_252;
    float _436;
    if (!_418)
    {
        float _420 = in.m_57.x;
        float _422 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _424 = _420 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _426 = fma(_424, (*spvDescriptorSet0.vp_c9)._m0[11].x, _144);
        float _428 = _426 * _422;
        float _430 = floor(_428);
        float _432 = -_430;
        float _434 = _428 + _432;
        _436 = _434;
        _438 = true;
    }
    else
    {
        float _440 = float(_110);
        float _442 = 1.0 / _440;
        float _444 = _144 * _442;
        _436 = _444;
    }
    _438 = false;
    float _446 = _436;
    float _448 = in.m_59.x;
    float _450 = in.m_59.y;
    float _452 = in.m_59.z;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _456 = _446 + _454;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _458;
    bool _462 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _464 = 1.0 / _460;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _466;
    float _470 = _414 * _450;
    float _472 = _456 * _464;
    float _474 = _416 * _452;
    bool _476 = _446 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _478 = isnan(_446);
    bool _480 = _476 || _478;
    bool _482 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _484 = _480 || _482;
    float _486 = float(_484);
    float _488 = _412 * _448;
    float _490 = fma(_468, _472, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _492 = -_486;
    float _494 = _492 + 1.0;
    bool _496 = _446 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _498 = isnan(_446);
    bool _500 = _496 || _498;
    bool _502 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _504 = _500 || _502;
    float _506 = float(_504);
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _510 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _508;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _512;
    float _516 = _506 * _494;
    float _518 = fma(_510, _472, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _520 = fma(_514, _472, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _522 = -_506;
    float _524 = _522 + 1.0;
    float _526 = _490 * _516;
    float _528 = _518 * _516;
    float _530 = _520 * _516;
    float _532 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[107].y, _526);
    float _534 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[107].x, _528);
    float _536 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[107].z, _530);
    float _538 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[108].y, _532);
    float _540 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[108].x, _534);
    float _542 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[108].z, _536);
    bool _544 = !_462;
    float _562;
    if (!_544)
    {
        float _546 = in.m_57.x;
        float _548 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _550 = _546 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _552 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[11].y, _144);
        float _554 = _552 * _548;
        float _556 = floor(_554);
        float _558 = -_556;
        float _560 = _554 + _558;
        _562 = _560;
        _564 = true;
    }
    else
    {
        float _566 = float(_110);
        float _568 = 1.0 / _566;
        float _570 = _144 * _568;
        _562 = _570;
    }
    _564 = false;
    float _572 = _562;
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _576 = _574 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _578 = _572 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _580 = isnan(_572);
    bool _582 = _578 || _580;
    bool _584 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _586 = _582 || _584;
    float _588 = float(_586);
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _592 = _590 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _594 = _572 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _596 = isnan(_572);
    bool _598 = _594 || _596;
    bool _600 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _602 = _598 || _600;
    float _604 = float(_602);
    float _606 = 1.0 / _576;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _610 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _608;
    float _612 = -_588;
    float _614 = _612 + 1.0;
    bool _616 = _572 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _618 = isnan(_572);
    bool _620 = _616 || _618;
    bool _622 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _624 = _620 || _622;
    float _626 = float(_624);
    bool _628 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _630 = _604 * _614;
    float _632 = -_604;
    float _634 = _632 + 1.0;
    float _636 = 1.0 / _592;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _640 = _638 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _642 = _610 * _606;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _646 = _572 + _644;
    float _648 = -_626;
    float _650 = _648 + 1.0;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _654 = _572 + _652;
    float _656 = fma(_642, _646, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _658 = _588 * _650;
    float _660 = _640 * _636;
    float _662 = _656 * _630;
    float _664 = _538 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _666 = fma(_660, _654, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _668 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[115].x, _662);
    float _670 = _542 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _672 = _664 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _674 = fma(_666, _658, _668);
    float _676 = _540 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _678 = _670 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _680 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[117].x, _674);
    float _682 = _676 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _684 = _680 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_61.x = _682;
    out.m_61.y = _672;
    out.m_61.z = _678;
    out.m_61.w = _684;
    bool _686 = !_628;
    float _704;
    if (!_686)
    {
        float _688 = in.m_57.x;
        float _690 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _692 = _688 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _694 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[11].w, _144);
        float _696 = _694 * _690;
        float _698 = floor(_696);
        float _700 = -_698;
        float _702 = _696 + _700;
        _704 = _702;
        _706 = true;
    }
    else
    {
        float _708 = float(_110);
        float _710 = 1.0 / _708;
        float _712 = _144 * _710;
        _704 = _712;
    }
    _706 = false;
    float _714 = _704;
    float _716 = in.m_63.y;
    float _718 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _720 = int(_718);
    float _722 = _488 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _724 = in.m_57.x;
    float _726 = in.m_57.y;
    float _728 = _470 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _730 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _732 = _730 != 0;
    float _734 = in.m_65.x;
    float _736 = float(_110);
    float _738 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _740 = int(_738);
    float _742 = in.m_65.y;
    int _744 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _746 = _744 != 0;
    float _748 = _474 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _752 = float(_720);
    float _754 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _756 = log2(_754);
    float _758 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _760 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _762 = -_716;
    float _764 = _762 + 1.0;
    int _766 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _768 = _766 != 0;
    float _770 = 1.0 / _752;
    int _772 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _774 = _772 != 0;
    float _776 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _778 = _726 > 0.5;
    float _780 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    int _782 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _784 = _782 != 0;
    out.m_67.x = _734;
    float _786 = _716;
    if (_732)
    {
        float _788 = _778 ? _764 : _716;
        _786 = _788;
    }
    float _790 = _786;
    float _792 = _726 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    out.m_67.y = _742;
    float _794 = _724 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _796 = fma(_792, -2.0, _750);
    float _798 = in.m_48.x;
    float _800 = in.m_48.y;
    float _802 = in.m_48.z;
    float _804 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _806 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _808 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _812 = _810 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _814 = -_776;
    float _816 = fma(_794, 2.0, _814);
    float _818 = -_758;
    float _820 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _818);
    float _822 = -_760;
    float _824 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _822);
    float _826 = -_780;
    float _828 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _826);
    float _830 = _770 * _144;
    float _832 = in.m_69.x;
    float _834 = in.m_69.y;
    float _836 = in.m_69.z;
    float _838 = -_806;
    float _840 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _838);
    float _842 = -_808;
    float _844 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _842);
    float _846 = float(uint(_740));
    float _848 = 1.0 / _812;
    float _850 = -_804;
    float _852 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _850);
    float _854 = _488;
    if (_768)
    {
        float _856 = in.m_57.x;
        _854 = _856;
    }
    float _858 = _854;
    float _860 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _862 = _860 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _864 = 1.0 / _846;
    float _866 = _800 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _868 = _800 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _870 = _800 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _872 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _874 = _872 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _876 = fma(_798, (*spvDescriptorSet0.vp_c10)._m0[5].x, _866);
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _880 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _878;
    float _882 = trunc(_830);
    int _884 = int(_882);
    bool _886 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _888 = isnan(0.0);
    bool _890 = _886 || _888;
    bool _892 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _894 = _890 || _892;
    float _896 = _880 * _848;
    float _898 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _900 = _898 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _902 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _834);
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _906 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _904;
    float _908 = float(_740);
    float _910 = fma(_798, (*spvDescriptorSet0.vp_c10)._m0[4].x, _868);
    float _912 = 1.0 / _862;
    int _914 = as_type<int>(_864) + (-2);
    float _916 = fma(_798, (*spvDescriptorSet0.vp_c10)._m0[6].x, _870);
    float _918 = _908 * _144;
    bool _920 = _858 > 0.5;
    bool _922 = _920 && _768;
    float _924 = _726 * 2.0;
    int _926 = ~_740;
    int _928 = _926 + 1;
    float _930 = -_144;
    float _932 = fma(_930, (*spvDescriptorSet0.vp_c9)._m0[76].x, _816);
    float _934 = float(uint(_884));
    float _936 = _756 * _144;
    float _938 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _832);
    float _940 = 1.0 / _736;
    float _942 = as_type<float>(_914) * _934;
    float _944 = _722 * _938;
    float _946 = _728 * _902;
    float _948 = _724 * 2.0;
    float _950 = _906 * _912;
    float _952 = in.m_57.z;
    float _954 = exp2(_936);
    float _956 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[76].y, _796);
    bool _958 = !_746;
    float _960 = _958 ? 7.345489978790283203125 : 1.0;
    float _962 = fma(_802, (*spvDescriptorSet0.vp_c10)._m0[4].z, _910);
    bool _964 = !_784;
    int _966 = _964 ? 0 : 1;
    float _968 = fma(_802, (*spvDescriptorSet0.vp_c10)._m0[5].z, _876);
    float _970 = fma(_802, (*spvDescriptorSet0.vp_c10)._m0[6].z, _916);
    float _972 = _960 * _724;
    float _974 = trunc(_942);
    float _976 = precise::max(_974, 0.0);
    uint _979 = uint(_976);
    float _981 = _918 * _940;
    float _983 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _985 = _714 + _983;
    float _987 = _828 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _989 = _828 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _991 = _828 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _993 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _995 = floor(_948);
    float _997 = -_954;
    float _999 = _997 + 1.0;
    float _1001 = fma(_896, _985, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1003 = -_987;
    float _1005 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1003);
    float _1007 = _828 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1009 = _968 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1011 = _894 ? _999 : 0.0;
    float _1013 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1015 = _714 + _1013;
    float _1017 = 1.0 / _874;
    float _1019 = _824 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1021 = _748 * _836;
    bool _1023 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1025 = isnan(1.0);
    bool _1027 = _1023 || _1025;
    bool _1029 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1031 = _1027 || _1029;
    float _1033 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1035 = 1.0 + _1033;
    float _1037 = _962 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1039 = _928 * int(_979);
    int _1041 = _1039 + _884;
    bool _1043 = _995 >= 0.0;
    bool _1045 = isnan(_995);
    bool _1047 = _1043 || _1045;
    bool _1049 = isnan(0.0);
    bool _1051 = _1047 || _1049;
    float _1053 = 1.0 / _1035;
    float _1055 = -_1009;
    float _1057 = _1055 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1059 = -_1019;
    float _1061 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[0].y, _1059);
    int _1063 = _1051 ? 0 : 1;
    float _1065 = _970 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1067 = float(uint(_1041));
    float _1069 = _900 * _1017;
    float _1071 = floor(_924);
    bool _1073 = _995 > 0.0;
    float _1075 = as_type<float>(_914) * _1067;
    float _1077 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[78].w, _993);
    float _1079 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1081 = fma(_1069, _1015, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1083 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1077);
    float _1085 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1079);
    float _1087 = trunc(_1075);
    float _1089 = precise::max(_1087, 0.0);
    uint _1091 = uint(_1089);
    float _1093 = _952 * 2.0;
    int _1095 = ~_1063;
    int _1097 = _1095 + 1;
    int _1099 = _1097 + 1;
    float _1101 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1085);
    int _1103 = _1099;
    if (_1031)
    {
        float _1105 = _1011 * _1053;
        _146 = _1105;
    }
    float _1107 = _146;
    if (!_1073)
    {
        int _1109 = ~_1063;
        int _1111 = _1109 + 1;
        _1103 = _1111;
    }
    int _1113 = _1103;
    float _1115 = _726 + _724;
    int _1117 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1119 = _1117 != 0;
    int _1121 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1123 = _1121 != 0;
    int _1125 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1127 = _1125 != 0;
    float _1129 = floor(_1093);
    float _1131 = _952 + _724;
    float _1133 = _1115 + (-1.0);
    bool _1135 = !_1123;
    int _1137 = _1135 ? 0 : 1;
    float _1139 = -_1037;
    float _1141 = _1139 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1143 = _1131 + (-1.0);
    bool _1145 = _1071 > 0.0;
    float _1147 = fma(_1133, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1149 = ~_740;
    int _1151 = _1149 + 1;
    float _1153 = fma(_1143, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1155 = _1071 >= 0.0;
    bool _1157 = isnan(_1071);
    bool _1159 = _1155 || _1157;
    bool _1161 = isnan(0.0);
    bool _1163 = _1159 || _1161;
    float _1165 = floor(_972);
    int _1167 = int(_979) + int(_1091);
    float _1169 = fma(_852, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1061);
    float _1171 = _726 + _952;
    int _1173 = _1163 ? 0 : 1;
    float _1175 = fma(_840, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1005);
    bool _1177 = _1129 > 0.0;
    int _1179 = _1151 * _1167;
    int _1181 = _1179 + _884;
    int _1183 = ~_1173;
    int _1185 = _1183 + 1;
    int _1187 = _1185 + 1;
    float _1189 = _1171 + (-1.0);
    bool _1191 = !_1119;
    int _1193 = _1191 ? 0 : 1;
    float _1195 = _724 + (-0.5);
    int _1197 = _1187;
    if (!_1145)
    {
        int _1199 = ~_1173;
        int _1201 = _1199 + 1;
        _1197 = _1201;
    }
    int _1203 = _1197;
    float _1205 = _952 + (-0.5);
    bool _1207 = _1129 >= 0.0;
    bool _1209 = isnan(_1129);
    bool _1211 = _1207 || _1209;
    bool _1213 = isnan(0.0);
    bool _1215 = _1211 || _1213;
    float _1217 = -_1165;
    float _1219 = _972 + _1217;
    bool _1221 = !_1127;
    int _1223 = _1221 ? 0 : 1;
    float _1225 = _1219 * _908;
    int _1227 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1229 = _1227 != 0;
    float _1231 = fma(_1189, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1233 = uint(_1181) >= uint(_740);
    int _1235 = _1215 ? 0 : 1;
    float _1237 = trunc(_1225);
    int _1239 = int(_1237);
    bool _1241 = !_1229;
    int _1243 = _1241 ? 0 : 1;
    bool _1245 = !_1233;
    int _1247 = _1245 ? 0 : (-1);
    int _1249 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1251 = _1249 != 0;
    int _1253 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1255 = _1253 != 0;
    int _1257 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1259 = _1257 != 0;
    float _1261 = in.m_71.x;
    float _1263 = in.m_71.y;
    float _1265 = in.m_71.z;
    int _1267 = ~_1235;
    int _1269 = _1267 + 1;
    int _1271 = _1269 + 1;
    int _1273 = _1271;
    if (!_1177)
    {
        int _1275 = ~_1235;
        int _1277 = _1275 + 1;
        _1273 = _1277;
    }
    int _1279 = _1273;
    float _1281 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1283 = _714 + _1281;
    bool _1285 = _834 != 0.0;
    bool _1287 = isnan(_834);
    bool _1289 = _1285 || _1287;
    bool _1291 = isnan(0.0);
    bool _1293 = _1289 || _1291;
    int _1295 = ~_1167;
    int _1297 = _1295 + _1247;
    int _1299 = _1297 + 1;
    float _1301 = fma(_950, _1283, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    bool _1303 = _832 == 0.0;
    bool _1305 = !_1293;
    bool _1307 = _1303 && _1305;
    float _1309 = _824 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1311 = float(_884);
    int _1313 = _740 * _1299;
    int _1315 = _1313 + _884;
    bool _1317 = _836 == 0.0;
    bool _1319 = _1317 && _1307;
    float _1321 = -_1309;
    float _1323 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[1].y, _1321);
    bool _1325 = _714 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1327 = isnan(_714);
    bool _1329 = _1325 || _1327;
    bool _1331 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1333 = _1329 || _1331;
    float _1335 = float(_1333);
    float _1337 = -_989;
    float _1339 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1337);
    float _1341 = _1057 * _1057;
    float _1343 = -_1007;
    float _1345 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1343);
    float _1347 = -_991;
    float _1349 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1347);
    float _1351 = -_1335;
    float _1353 = _1351 + 1.0;
    float _1355 = fma(_1141, _1141, _1341);
    int _1357 = _740 + (-1);
    float _1359 = fma(_852, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1323);
    int _1361 = abs(_1137);
    float _1363 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1339);
    float _1365 = _1263;
    float _1367 = _1265;
    float _1369 = _1261;
    if (!_1319)
    {
        float _1371 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1263);
        _1365 = _1371;
    }
    float _1373 = _1365;
    if (!_1319)
    {
        float _1375 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1265);
        _1367 = _1375;
    }
    float _1377 = _1367;
    bool _1379 = _1311 >= _908;
    bool _1381 = isnan(_1311);
    bool _1383 = _1379 || _1381;
    bool _1385 = isnan(_908);
    bool _1387 = _1383 || _1385;
    float _1389 = float(_1387);
    if (!_1319)
    {
        float _1391 = fma(_832, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1261);
        _1369 = _1391;
    }
    float _1393 = _1369;
    bool _1395 = _714 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1397 = isnan(_714);
    bool _1399 = _1395 || _1397;
    bool _1401 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1403 = _1399 || _1401;
    float _1405 = float(_1403);
    float _1407 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1345);
    bool _1409 = _714 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1411 = isnan(_714);
    bool _1413 = _1409 || _1411;
    bool _1415 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1417 = _1413 || _1415;
    float _1419 = float(_1417);
    float _1421 = fma(_840, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1349);
    float _1423 = trunc(_1389);
    int _1425 = int(_1423);
    float _1427 = _1405 * _1353;
    float _1429 = -_1405;
    float _1431 = _1429 + 1.0;
    float _1433 = -_1065;
    float _1435 = _1433 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    bool _1437 = _740 == 0;
    float _1439 = -_1419;
    float _1441 = _1439 + 1.0;
    bool _1443 = _714 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1445 = isnan(_714);
    bool _1447 = _1443 || _1445;
    bool _1449 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1451 = _1447 || _1449;
    float _1453 = float(_1451);
    float _1455 = fma(_1435, _1435, _1355);
    bool _1457 = !_1437;
    int _1459 = _1457 ? _1315 : (-1);
    float _1461 = _1419 * _1431;
    int _1463 = abs(_966);
    float _1465 = _1453 * _1441;
    bool _1467 = !_1251;
    int _1469 = _1467 ? 0 : 1;
    float _1471 = rsqrt(_1455);
    int _1473 = abs(_1223);
    float _1475 = _1001 * _1465;
    int _1477 = ~_1425;
    int _1479 = _1477 + 1;
    int _1481 = _1479 + 1;
    float _1483 = _840 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    int _1485 = _1239 * _1463;
    int _1487 = _1485 + _884;
    int _1489 = abs(_1469);
    float _1491 = in.m_63.x;
    int _1493 = _1459 * _1481;
    float _1495 = -_1483;
    float _1497 = fma(_852, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1495);
    float _1499 = float(_1279);
    int _1501 = _1425 * _1357;
    int _1503 = _1501 + _1493;
    int _1505 = abs(_1193);
    float _1507 = trunc(_981);
    int _1509 = int(_1507);
    float _1511 = float(_1113);
    float _1513 = _1141 * _1471;
    float _1515 = _1435 * _1471;
    float _1517 = _1175 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1519 = _1513 * _1513;
    int _1521 = abs(_1243);
    float _1523 = _1057 * _1471;
    float _1525 = -_1517;
    float _1527 = fma(_1359, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1525);
    float _1529 = fma(_1515, _1515, _1519);
    int _1531 = _1503 * _1361;
    float _1533 = float(_1489);
    float _1535 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1527);
    float _1537 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1497);
    int _1539 = _1509 * _1505;
    int _1541 = _1539 + _1531;
    float _1543 = rsqrt(_1529);
    float _1545 = in.m_73.x;
    float _1547 = in.m_73.y;
    float _1549 = in.m_73.z;
    float _1551 = _1533 * _1499;
    int _1553 = _1487 * _1473;
    int _1555 = _1553 + _1541;
    float _1557 = -_1537;
    float _1559 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1535);
    float _1561 = _1551 * (-2.0);
    int _1563 = _1239 * _1521;
    int _1565 = _1563 + _1555;
    float _1567 = 1.0 / _1559;
    float _1569 = float(uint(_1565));
    float _1571 = _1515 * _1543;
    float _1573 = _1513 * _1543;
    float _1575 = fma(_1147, _1561, _1147);
    float _1577 = as_type<float>(_914) * _1569;
    float _1579 = -_1571;
    float _1581 = _1515 * _1579;
    float _1583 = float(uint(_1487));
    float _1585 = -_1571;
    float _1587 = _1523 * _1585;
    float _1589 = -_1581;
    float _1591 = fma(_1513, _1573, _1589);
    float _1593 = fma(_1561, _1545, _1545);
    float _1595 = trunc(_1577);
    float _1597 = precise::max(_1595, 0.0);
    uint _1599 = uint(_1597);
    bool _1601 = !_1255;
    int _1603 = _1601 ? 0 : 1;
    float _1605 = _1523 * _1573;
    float _1607 = _1591 * _1591;
    float _1609 = fma(_1195, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1593);
    int _1611 = abs(_1603);
    float _1613 = fma(_1605, _1605, _1607);
    float _1615 = as_type<float>(_914) * _1583;
    float _1617 = fma(_1575, _1107, _1609);
    int _1619 = ~_740;
    int _1621 = _1619 + 1;
    float _1623 = fma(_1587, _1587, _1613);
    float _1625 = float(_1611);
    float _1627 = trunc(_1615);
    float _1629 = precise::max(_1627, 0.0);
    uint _1631 = uint(_1629);
    bool _1633 = !_1259;
    int _1635 = _1633 ? 0 : 1;
    int _1637 = _1621 * int(_1599);
    int _1639 = _1637 + _1565;
    float _1641 = _1625 * _1511;
    int _1643 = abs(_1635);
    float _1645 = _1617 * 0.15915493667125701904296875;
    float _1647 = float(uint(_1639));
    float _1649 = rsqrt(_1623);
    float _1651 = _1641 * (-2.0);
    float _1653 = _726 + (-0.5);
    float _1655 = as_type<float>(_914) * _1647;
    float _1657 = fma(_1651, _1547, _1547);
    float _1659 = float(_1203);
    float _1661 = fma(_1231, _1651, _1231);
    float _1663 = float(_1643);
    float _1665 = fma(_1653, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1657);
    float _1667 = trunc(_1655);
    float _1669 = precise::max(_1667, 0.0);
    uint _1671 = uint(_1669);
    float _1673 = _1663 * _1659;
    float _1675 = fma(_1661, _1107, _1665);
    float _1677 = _1591 * _1649;
    float _1679 = precise::clamp(_1677, 0.0, 1.0);
    float _1681 = _1673 * (-2.0);
    float _1683 = _1675 * 0.15915493667125701904296875;
    float _1685 = _1645 * 6.283185482025146484375;
    float _1687 = sin(_1685);
    float _1689 = -_1679;
    float _1691 = _1689 + 1.0;
    float _1693 = fma(_1153, _1681, _1153);
    float _1695 = fma(_1421, _1567, -1.0);
    float _1697 = fma(_1681, _1549, _1549);
    float _1699 = _1691 * _1567;
    int _1701 = ~_740;
    int _1703 = _1701 + 1;
    float _1705 = fma(_1691, _1695, 1.0);
    int _1707 = int(_1599) + int(_1671);
    float _1709 = _1169 * _1699;
    int _1711 = ~_740;
    int _1713 = _1711 + 1;
    float _1715 = _1705 * _1705;
    float _1717 = fma(_1205, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1697);
    float _1719 = _1407 * _1699;
    float _1721 = _1645 * 6.283185482025146484375;
    float _1723 = cos(_1721);
    float _1725 = fma(_1709, _1709, _1715);
    float _1727 = -_1453;
    float _1729 = _1727 + 1.0;
    float _1731 = fma(_1693, _1107, _1717);
    float _1733 = fma(_1719, _1719, _1725);
    int _1735 = _1713 * _1707;
    int _1737 = _1735 + _1565;
    float _1739 = fma(_1729, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1475);
    float _1741 = rsqrt(_1733);
    float _1743 = as_type<float>(_1703);
    float _1745 = _1731;
    if (_768)
    {
        _1743 = _1491;
    }
    float _1747 = _1743;
    int _1749 = _1703 * int(_1631);
    int _1751 = _1749 + _1487;
    bool _1753 = uint(_1737) >= uint(_740);
    float _1755 = fma(_1081, _1461, _1739);
    float _1757 = _1731 * 0.15915493667125701904296875;
    float _1759 = _1747;
    if (_922)
    {
        float _1761 = -_1747;
        float _1763 = _1761 + 1.0;
        _1759 = _1763;
    }
    float _1765 = _1759;
    bool _1767 = !_1753;
    int _1769 = _1767 ? 0 : (-1);
    float _1771 = _1683 * 6.283185482025146484375;
    float _1773 = sin(_1771);
    float _1775 = float(uint(_1751));
    float _1777 = fma(_1301, _1427, _1755);
    int _1779 = ~_1707;
    int _1781 = _1779 + _1769;
    int _1783 = _1781 + 1;
    if (!_768)
    {
        _1745 = _1491;
    }
    float _1785 = _1745;
    float _1787 = as_type<float>(_914) * _1775;
    float _1789 = _1785;
    if (_768)
    {
        _1789 = _1765;
    }
    float _1791 = _1789;
    float _1793 = _1683 * 6.283185482025146484375;
    float _1795 = cos(_1793);
    int _1797 = _740 * _1783;
    int _1799 = _1797 + _1565;
    float _1801 = _1719 * _1741;
    float _1803 = _1709 * _1741;
    float _1805 = _1705 * _1741;
    float _1807 = fma(_1335, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1777);
    bool _1809 = !_1437;
    int _1811 = _1809 ? _1799 : (-1);
    float _1813 = _1757 * 6.283185482025146484375;
    float _1815 = cos(_1813);
    float _1817 = _1723 * _1773;
    int _1819 = _1811 >> 31;
    float _1821 = _1687 * _1773;
    int _1823 = _1811 & 3;
    bool _1825 = _1823 != 0;
    int _1827 = ~_740;
    int _1829 = _1827 + 1;
    float _1831 = _1757 * 6.283185482025146484375;
    float _1833 = sin(_1831);
    float _1835 = _1723 * _1795;
    float _1837 = _1687 * _1795;
    float _1839 = _1687 * _1815;
    int _1841 = _1819 & 3;
    float _1843 = _1723 * _1815;
    float _1845 = -_1801;
    float _1847 = _1513 * _1845;
    float _1849 = trunc(_1787);
    float _1851 = precise::max(_1849, 0.0);
    uint _1853 = uint(_1851);
    int _1855 = _1811 + _1841;
    float _1857 = _1773 * _1815;
    float _1859 = -_1803;
    float _1861 = -_1847;
    float _1863 = fma(_1515, _1859, _1861);
    float _1865 = -_1803;
    float _1867 = _1523 * _1865;
    int _1869 = _1855 >> 2;
    float _1871 = _1795 * _1815;
    float _1873 = _1839 * _946;
    float _1875 = -_1867;
    float _1877 = fma(_1513, _1805, _1875);
    int _1879 = _1869 << 4;
    int _1881 = _1879 + 368;
    float _1883 = _1515 * _1805;
    uint _1885 = uint(int(uint(_1881) >> uint(2)));
    uint _1887 = uint(int(uint(int(_1885)) >> uint(2)));
    int _1889 = int(_1885) & 3;
    float _1891 = (*spvDescriptorSet0.vp_c9)._m0[int(_1887)][_1889];
    int _1893 = int(_1885) + 1;
    uint _1895 = uint(int(uint(_1893) >> uint(2)));
    int _1897 = _1893 & 3;
    float _1899 = (*spvDescriptorSet0.vp_c9)._m0[int(_1895)][_1897];
    float _1901 = -_1801;
    float _1903 = -_1883;
    float _1905 = fma(_1523, _1901, _1903);
    float _1907 = _1863 * _1863;
    int _1909 = int(_1631) + int(_1853);
    float _1911 = fma(_1833, _1835, _1821);
    float _1913 = fma(_1833, _1821, _1835);
    float _1915 = fma(_1905, _1905, _1907);
    int _1917 = _1811 & 3;
    bool _1919 = _1917 != 0;
    float _1921 = -_1817;
    float _1923 = fma(_1833, _1837, _1921);
    float _1925 = -_1837;
    float _1927 = fma(_1833, _1817, _1925);
    float _1929 = fma(_1877, _1877, _1915);
    bool _1931 = uint(_1917) > 1u;
    int _1933 = _1881 + 8;
    uint _1935 = uint(int(uint(_1933) >> uint(2)));
    uint _1937 = uint(int(uint(int(_1935)) >> uint(2)));
    int _1939 = int(_1935) & 3;
    float _1941 = (*spvDescriptorSet0.vp_c9)._m0[int(_1937)][_1939];
    int _1943 = int(_1935) + 1;
    uint _1945 = uint(int(uint(_1943) >> uint(2)));
    int _1947 = _1943 & 3;
    float _1949 = (*spvDescriptorSet0.vp_c9)._m0[int(_1945)][_1947];
    float _1951 = -_946;
    float _1953 = _1833 * _1951;
    float _1955 = rsqrt(_1929);
    float _1957 = _1843 * _946;
    int _1959 = _1825 ? 0 : 1;
    int _1961 = _1829 * _1909;
    int _1963 = _1961 + _1487;
    bool _1965 = uint(_1917) >= 2u;
    float _1967 = fma(_1871, _944, _1953);
    float _1969 = fma(_1911, _944, _1957);
    float _1971 = fma(_1923, _944, _1873);
    bool _1973 = uint(_1963) >= uint(_740);
    int _1975 = ~_1959;
    int _1977 = _1975 + 1;
    int _1979 = _1977 + 1;
    int _1981 = _1979;
    if (!_1931)
    {
        int _1983 = ~_1959;
        int _1985 = _1983 + 1;
        _1981 = _1985;
    }
    int _1987 = _1981;
    bool _1989 = _1917 != 3;
    float _1991 = _1905 * _1955;
    float _1993 = _1863 * _1955;
    float _1995 = _1877 * _1955;
    int _1997 = _1965 ? 0 : 1;
    float _1999 = _1515 * _1991;
    float _2001 = _1513 * _1993;
    float _2003 = _1523 * _1995;
    int _2005 = abs(_1987);
    float _2007 = -_1999;
    float _2009 = fma(_1513, _1995, _2007);
    float _2011 = -_2001;
    float _2013 = fma(_1523, _1991, _2011);
    float _2015 = -_2003;
    float _2017 = fma(_1515, _1993, _2015);
    int _2019 = ~_1997;
    int _2021 = _2019 + 1;
    int _2023 = _2021 + 1;
    bool _2025 = !_1919;
    int _2027 = _2025 ? 0 : 1;
    int _2029 = _2023;
    if (_1989)
    {
        int _2031 = ~_1997;
        int _2033 = _2031 + 1;
        _2029 = _2033;
    }
    int _2035 = _2029;
    int _2037 = ~_2005;
    int _2039 = _2037 + 1;
    int _2041 = _2039 + 1;
    bool _2043 = _1917 != 3;
    float _2045 = _2009 * _2009;
    int _2047 = abs(_2035);
    int _2049 = _2041 * as_type<int>(_1899);
    int _2051 = abs(_2027);
    float _2053 = fma(_2017, _2017, _2045);
    float _2055 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2057 = int(_2055);
    int _2059 = ~_2051;
    int _2061 = _2059 + 1;
    int _2063 = _2061 + 1;
    float _2065 = fma(_2013, _2013, _2053);
    bool _2067 = !_2043;
    int _2069 = _2067 ? 0 : (-1);
    int _2071 = ~_2047;
    int _2073 = _2071 + 1;
    int _2075 = _2073 + 1;
    int _2077 = _2063 * as_type<int>(_1891);
    int _2079 = _2077 + _2049;
    int _2081 = abs(_2069);
    float _2083 = rsqrt(_2065);
    bool _2085 = !_1973;
    int _2087 = _2085 ? 0 : (-1);
    int _2089 = _2075 * as_type<int>(_1941);
    int _2091 = _2089 + _2079;
    bool _2093 = !_774;
    int _2095 = _2093 ? 0 : 1;
    int _2097 = ~_1909;
    int _2099 = _2097 + _2087;
    int _2101 = _2099 + 1;
    int _2103 = ~_2081;
    int _2105 = _2103 + 1;
    int _2107 = _2105 + 1;
    int _2109 = abs(_2057);
    int _2111 = _740 * _2101;
    int _2113 = _2111 + _1487;
    int _2115 = abs(_2095);
    int _2117 = _2107 * as_type<int>(_1949);
    int _2119 = _2117 + _2091;
    float _2121 = float(uint(_2057));
    float _2123 = _2013 * _2083;
    float _2125 = _2017 * _2083;
    int _2127 = ~_2115;
    int _2129 = _2127 + 1;
    int _2131 = _2129 + 1;
    float _2133 = _2009 * _2083;
    float _2135 = _1513 * _2123;
    float _2137 = fma(_1857, _1021, _1967);
    float _2139 = 1.0 / _2121;
    float _2141 = float(uint(_2109));
    float _2143 = _1515 * _2133;
    float _2145 = -_2135;
    float _2147 = fma(_1515, _2125, _2145);
    int _2149 = _2119 * _2131;
    bool _2151 = !_1437;
    int _2153 = _2151 ? _2113 : (-1);
    float _2155 = _1523 * _2125;
    float _2157 = -_2143;
    float _2159 = fma(_1523, _2123, _2157);
    float _2161 = _2147 * _2147;
    float _2163 = 1.0 / _2141;
    float _2165 = fma(_1927, _1021, _1969);
    float _2167 = fma(_1913, _1021, _1971);
    float _2169 = -_2155;
    float _2171 = fma(_1513, _2133, _2169);
    float _2173 = fma(_2159, _2159, _2161);
    int _2175 = _2153 * _2115;
    int _2177 = _2175 + _2149;
    float _2179 = _1843 * _2125;
    int _2181 = as_type<int>(_2139) + (-2);
    float _2183 = fma(_2171, _2171, _2173);
    float _2185 = _1843 * _2123;
    float _2187 = float(uint(_2177));
    float _2189 = _1911 * _2125;
    float _2191 = rsqrt(_2183);
    int _2193 = abs(_2177);
    float _2195 = _1911 * _2133;
    float _2197 = as_type<float>(_2181) * _2187;
    int _2199 = as_type<int>(_2163) + (-2);
    float _2201 = _1843 * _2133;
    float _2203 = float(uint(_2193));
    float _2205 = _1927 * _2125;
    float _2207 = _1911 * _2123;
    float _2209 = trunc(_2197);
    float _2211 = precise::max(_2209, 0.0);
    uint _2213 = uint(_2211);
    float _2215 = _2125 * _2165;
    float _2217 = as_type<float>(_2199) * _2203;
    float _2219 = _2133 * _2165;
    float _2221 = _1927 * _2123;
    float _2223 = _2123 * _2165;
    float _2225 = _1927 * _2133;
    float _2227 = _2159 * _2191;
    float _2229 = trunc(_2217);
    float _2231 = precise::max(_2229, 0.0);
    uint _2233 = uint(_2231);
    float _2235 = _2147 * _2191;
    float _2237 = _2171 * _2191;
    int _2239 = ~_2057;
    int _2241 = _2239 + 1;
    float _2243 = -_1833;
    float _2245 = fma(_2243, _2227, _2179);
    float _2247 = -_1833;
    float _2249 = fma(_2247, _2235, _2201);
    float _2251 = -_1833;
    float _2253 = fma(_2251, _2237, _2185);
    float _2255 = fma(_1871, _2227, _2189);
    int _2257 = ~_2109;
    int _2259 = _2257 + 1;
    float _2261 = fma(_1871, _2235, _2195);
    float _2263 = fma(_1871, _2237, _2207);
    int _2265 = _2241 * int(_2213);
    int _2267 = _2265 + _2177;
    float _2269 = fma(_2227, _2137, _2215);
    float _2271 = fma(_2235, _2137, _2219);
    float _2273 = fma(_2237, _2137, _2223);
    int _2275 = _2259 * int(_2233);
    int _2277 = _2275 + _2193;
    float _2279 = float(uint(_2267));
    float _2281 = fma(_1857, _2227, _2205);
    float _2283 = fma(_1857, _2235, _2225);
    float _2285 = fma(_1857, _2237, _2221);
    float _2287 = float(uint(_2277));
    float _2289 = as_type<float>(_2181) * _2279;
    float _2291 = fma(_1513, _2167, _2269);
    float _2293 = fma(_1515, _2167, _2273);
    float _2295 = fma(_1839, _1513, _2245);
    float _2297 = as_type<float>(_2199) * _2287;
    float _2299 = trunc(_2289);
    float _2301 = precise::max(_2299, 0.0);
    uint _2303 = uint(_2301);
    float _2305 = _1037 + _2291;
    float _2307 = _1065 + _2293;
    float _2309 = fma(_1839, _1523, _2249);
    float _2311 = fma(_1839, _1515, _2253);
    float _2313 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2315 = _2305 + _2313;
    float _2317 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2319 = _2307 + _2317;
    float _2321 = fma(_1923, _1513, _2255);
    float _2323 = fma(_1923, _1523, _2261);
    float _2325 = trunc(_2297);
    float _2327 = precise::max(_2325, 0.0);
    uint _2329 = uint(_2327);
    float _2331 = _2315 * _2315;
    float _2333 = _2319 * _2319;
    float _2335 = fma(_1923, _1515, _2263);
    int _2337 = ~_2057;
    int _2339 = _2337 + 1;
    float _2341 = fma(_1913, _1513, _2281);
    float _2343 = _2331 + _2333;
    int _2345 = int(_2213) + int(_2303);
    float _2347 = fma(_1913, _1515, _2285);
    float _2349 = fma(_1913, _1523, _2283);
    float _2351 = sqrt(_2343);
    int _2353 = ~_2109;
    int _2355 = _2353 + 1;
    int _2357 = _2339 * _2345;
    int _2359 = _2357 + _2177;
    float _2361 = fma(_1523, _2167, _2271);
    float _2363 = _2311 * _1373;
    float _2365 = _2309 * _1373;
    int _2367 = int(_2233) + int(_2329);
    float _2369 = _2295 * _1373;
    bool _2371 = uint(_2359) >= uint(_2057);
    float _2373 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2375 = _2057 == 0;
    int _2377 = _2355 * _2367;
    int _2379 = _2377 + _2193;
    bool _2381 = !_2371;
    int _2383 = _2381 ? 0 : (-1);
    float _2385 = _1009 + _2361;
    float _2387 = fma(_2321, _1393, _2369);
    bool _2389 = _2351 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2391 = fma(_2323, _1393, _2365);
    bool _2393 = uint(_2379) >= uint(_2109);
    float _2395 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2397 = _2177 ^ _2057;
    int _2399 = ~_2345;
    int _2401 = _2399 + _2383;
    int _2403 = _2401 + 1;
    bool _2405 = !_2393;
    float _2407 = _2405 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    uint _2409 = uint(int(uint(_2397) >> uint(31)));
    int _2411 = _2057 * _2403;
    int _2413 = _2411 + _2177;
    bool _2415 = _2057 == 0;
    int _2417 = ~as_type<int>(_2407);
    int _2419 = _2367 + _2417;
    int _2421 = _2419 + 1;
    int _2423 = ~int(_2409);
    int _2425 = _2423 + 1;
    float _2427 = as_type<float>(_2409);
    float _2429 = _2407;
    float _2431 = as_type<float>(_2177);
    float _2433 = _2331;
    float _2435 = _2333;
    if (!_2389)
    {
        _2427 = _2305;
    }
    float _2437 = _2427;
    float _2439 = _2437;
    if (!_2389)
    {
        _2429 = _2307;
    }
    float _2441 = _2429;
    int _2443 = _2421 ^ _2425;
    float _2445 = _2441;
    if (!_2389)
    {
        _2431 = _2385;
    }
    float _2447 = _2431;
    bool _2449 = !_2389;
    float _2451 = _2447;
    if (!_2449)
    {
        float _2453 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2455 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2457 = _2351 + _2455;
        float _2459 = _2385 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2461 = rsqrt(_2343);
        float _2463 = _2457 * _2453;
        float _2465 = _2463 * 0.15915493667125701904296875;
        float _2467 = _2465 * 6.283185482025146484375;
        float _2469 = sin(_2467);
        float _2471 = _2465 * 6.283185482025146484375;
        float _2473 = cos(_2471);
        float _2475 = fma(_2469, _2459, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2477 = _2461 * _2475;
        float _2479 = fma(_2315, _2477, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2481 = _2473 + (-1.0);
        float _2483 = fma(_2319, _2477, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2485 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2487 = _2479 + _2485;
        float _2489 = _2481 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2491 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2493 = _2483 + _2491;
        float _2495 = _2487 * _2487;
        float _2497 = fma(_2385, _2473, _2489);
        float _2499 = _2493 * _2493;
        _2451 = _2497;
        _2433 = _2495;
        _2435 = _2499;
        _2439 = _2479;
        _2445 = _2483;
    }
    float _2501 = _2451;
    float _2503 = _2433;
    float _2505 = _2435;
    float _2507 = _2439;
    float _2509 = _2445;
    bool _2511 = !_2375;
    int _2513 = _2511 ? _2413 : (-1);
    float _2515 = _2373 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2517 = ~_2425;
    int _2519 = _2517 + _2443;
    int _2521 = _2519 + 1;
    float _2523 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2525 = _2501 + _2523;
    float _2527 = float(_2513);
    float _2529 = in.m_65.z;
    bool _2531 = !_2415;
    int _2533 = _2531 ? _2521 : (-1);
    float _2535 = fma(_2525, _2525, _2503);
    float _2537 = _2395 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2539 = fma(_2515, _2527, _932);
    float _2541 = fma(_2515, _1791, -0.5);
    float _2543 = in.m_65.w;
    float _2545 = float(_2533);
    float _2547 = _2535 + _2505;
    float _2549 = fma(_1101, _2541, _2539);
    float _2551 = fma(_2537, _790, -0.5);
    float _2553 = -_956;
    float _2555 = fma(_2537, _2545, _2553);
    float _2557 = sqrt(_2547);
    float _2559 = fma(_2335, _1393, _2363);
    float _2561 = fma(_1083, _2551, _2555);
    float _2563 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2565 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2567 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2569 = fma(_2341, _1377, _2387);
    float _2571 = fma(_2349, _1377, _2391);
    float _2573 = _2563 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2575 = _2565 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2577 = _2567 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2579 = _1807 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2581 = _2549 + 0.5;
    float _2583 = _2561 + 0.5;
    float _2585 = fma(_2347, _1377, _2559);
    out.m_67.z = _2529;
    bool _2587 = _2557 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2589 = isnan(_2557);
    bool _2591 = _2587 || _2589;
    bool _2593 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2595 = _2591 || _2593;
    out.m_67.w = _2543;
    out.m_75.x = _2573;
    out.m_75.y = _2575;
    out.m_75.z = _2577;
    out.m_75.w = _2579;
    out.m_77.x = _2581;
    out.m_77.y = _2583;
    float _2597 = _2545;
    if (!_2595)
    {
        _2597 = 1.0;
    }
    float _2599 = _2597;
    out.m_79.x = _2569;
    out.m_79.y = _2571;
    out.m_79.z = _2585;
    bool _2601 = !_2595;
    float _2603 = _2599;
    if (!_2601)
    {
        bool _2605 = _2557 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2607 = isnan(_2557);
        bool _2609 = _2605 || _2607;
        bool _2611 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2613 = _2609 || _2611;
        if (!_2613)
        {
            float _2615 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2617 = _2557 + _2615;
            float _2619 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2621 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2619;
            float _2623 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2625 = _2623 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2627 = 1.0 / _2621;
            float _2629 = _2617 * _2627;
            float _2631 = fma(_2629, _2625, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2603 = _2631;
            _2633 = true;
        }
        else
        {
            bool _2635 = _2557 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2637 = isnan(_2557);
            bool _2639 = _2635 || _2637;
            bool _2641 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2643 = _2639 || _2641;
            if (!_2643)
            {
                float _2645 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2647 = _2557 + _2645;
                float _2649 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2651 = _2649 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2653 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2655 = _2653 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2657 = 1.0 / _2651;
                float _2659 = _2647 * _2657;
                float _2661 = fma(_2659, _2655, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2603 = _2661;
                _2633 = true;
            }
            else
            {
                _2603 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2633 = false;
    float _2663 = _2603;
    float _2665 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2667 = _2501 + _2665;
    float _2669 = _1009 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2671 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2673 = _2507 + _2671;
    float _2675 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2677 = _2509 + _2675;
    float _2679 = fma(_2667, _2663, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2681 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2669);
    float _2683 = fma(_2673, _2663, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2685 = fma(_2677, _2663, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2687 = -_1009;
    float _2689 = _2687 + _2679;
    float _2691 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2681);
    float _2693 = -_1037;
    float _2695 = _2693 + _2683;
    float _2697 = _1009 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2699 = _2689 * _2689;
    float _2701 = _2691 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2703 = -_1065;
    float _2705 = _2703 + _2685;
    float _2707 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2697);
    float _2709 = fma(_2695, _2695, _2699);
    float _2711 = 1.0 / _2701;
    float _2713 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2707);
    float _2715 = fma(_2705, _2705, _2709);
    float _2717 = _2713 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2719 = sqrt(_2715);
    float _2721 = _2717 + _2701;
    float _2723 = _2721 * _2711;
    float _2725 = _2723 * 0.5;
    float _2727 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2729 = fma(_2725, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2727);
    bool _2731 = _2719 > 0.0;
    float _2733 = 1.0 / _2729;
    bool _2735 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2737 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2739 = _2735 || _2737;
    bool _2741 = isnan(0.5);
    bool _2743 = _2739 || _2741;
    bool _2745 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2747 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2749 = _2745 || _2747;
    bool _2751 = isnan(0.5);
    bool _2753 = _2749 || _2751;
    float _2755 = _2701;
    float _2757 = _2691;
    float _2759 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _2761 = _2683;
    float _2763 = _2685;
    float _2765 = _2679;
    if (!_2731)
    {
        _2755 = _2683;
    }
    float _2767 = _2755;
    float _2769 = _2767;
    float _2771 = _2767;
    if (!_2731)
    {
        _2757 = _2679;
    }
    float _2773 = _2757;
    float _2775 = _2773;
    float _2777 = _2773;
    if (!_2731)
    {
        _2759 = _2685;
    }
    float _2779 = _2759;
    bool _2781 = !_2731;
    float _2783 = _2779;
    if (!_2781)
    {
        float _2785 = _188 * _188;
        float _2787 = fma(_186, _186, _2785);
        float _2789 = rsqrt(_2715);
        float _2791 = fma(_190, _190, _2787);
        float _2793 = sqrt(_2791);
        float _2795 = _2695 * _2789;
        float _2797 = _2689 * _2789;
        float _2799 = _2705 * _2789;
        bool _2801 = _2793 > 0.0;
        float _2803 = _2789;
        if (!_2801)
        {
            _2769 = _2683;
        }
        float _2805 = _2769;
        _2771 = _2805;
        if (!_2801)
        {
            _2775 = _2679;
        }
        float _2807 = _2775;
        _2777 = _2807;
        if (!_2801)
        {
            _2803 = _2685;
        }
        float _2809 = _2803;
        bool _2811 = !_2801;
        _2783 = _2809;
        if (!_2811)
        {
            float _2813 = rsqrt(_2791);
            float _2815 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2817 = _188 * _2813;
            float _2819 = _186 * _2813;
            float _2821 = _190 * _2813;
            float _2823 = _2797 * _2817;
            float _2825 = fma(_2795, _2819, _2823);
            float _2827 = _2815 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2829 = fma(_2799, _2821, _2825);
            float _2831 = _2829 * _2827;
            float _2833 = fma(_186, _2831, _2683);
            float _2835 = fma(_188, _2831, _2679);
            float _2837 = fma(_190, _2831, _2685);
            _2783 = _2837;
            _2771 = _2833;
            _2777 = _2835;
        }
    }
    float _2839 = _2783;
    float _2841 = _2771;
    float _2843 = _2777;
    float _2845 = _2843;
    float _2847 = _2841;
    if (_2743)
    {
        _194 = 1.0;
    }
    float _2849 = _194;
    float _2851 = _2849;
    if (_2753)
    {
        _196 = _2839;
    }
    float _2853 = _196;
    float _2855 = _2853;
    if (!_2753)
    {
        float _2857 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2859 = _1009 + _2857;
        float _2861 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2863 = _1037 + _2861;
        float _2865 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2867 = -_1037;
        float _2869 = _2867 + _2841;
        float _2871 = _2859 * _2859;
        float _2873 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2875 = _1065 + _2873;
        float _2877 = -_1065;
        float _2879 = _2877 + _2839;
        float _2881 = fma(_2863, _2863, _2871);
        float _2883 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2885 = fma(_2875, _2875, _2881);
        float _2887 = sqrt(_2885);
        float _2889 = _2865 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2891 = precise::min(_2887, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2893 = _2891 * _2883;
        float _2895 = -_1009;
        float _2897 = _2895 + _2843;
        float _2899 = _2889 * _2893;
        float _2901 = fma(_2897, _2899, _1009);
        float _2903 = fma(_2869, _2899, _1037);
        float _2905 = fma(_2879, _2899, _1065);
        _2845 = _2901;
        _2847 = _2903;
        _2855 = _2905;
    }
    float _2907 = _2845;
    float _2909 = _2847;
    float _2911 = _2855;
    if (_2743)
    {
        _2761 = 1.0;
    }
    float _2913 = _2761;
    float _2915 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2917 = _2733 * _2915;
    float _2919 = _2913;
    if (!_2743)
    {
        float _2921 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2923 = _2921 * 0.15915493667125701904296875;
        float _2925 = _2923 * 6.283185482025146484375;
        float _2927 = cos(_2925);
        float _2929 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2931 = _2929 * 0.15915493667125701904296875;
        float _2933 = _2923 * 6.283185482025146484375;
        float _2935 = sin(_2933);
        float _2937 = 1.0 / _2927;
        float _2939 = _2931 * 6.283185482025146484375;
        float _2941 = cos(_2939);
        float _2943 = _2935 * _2937;
        float _2945 = _2931 * 6.283185482025146484375;
        float _2947 = sin(_2945);
        float _2949 = _2941 * _2943;
        float _2951 = 1.0 / _2949;
        float _2953 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2955 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2953;
        float _2957 = 1.0 / _2955;
        float _2959 = _2947 * _2951;
        float _2961 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2963 = fma(_2917, _2959, _2961);
        float _2965 = _2963 * _2957;
        float _2967 = precise::clamp(_2965, 0.0, 1.0);
        _2851 = _2967;
    }
    float _2969 = _2851;
    if (!_2743)
    {
        float _2971 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2973 = _2971 * 0.15915493667125701904296875;
        float _2975 = _2973 * 6.283185482025146484375;
        float _2977 = cos(_2975);
        float _2979 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2981 = _2979 * 0.15915493667125701904296875;
        float _2983 = _2973 * 6.283185482025146484375;
        float _2985 = sin(_2983);
        float _2987 = 1.0 / _2977;
        float _2989 = _2981 * 6.283185482025146484375;
        float _2991 = cos(_2989);
        float _2993 = _2985 * _2987;
        float _2995 = _2981 * 6.283185482025146484375;
        float _2997 = sin(_2995);
        float _2999 = _2991 * _2993;
        float _3001 = 1.0 / _2999;
        float _3003 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3005 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3003;
        float _3007 = 1.0 / _3005;
        float _3009 = _2997 * _3001;
        float _3011 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3013 = fma(_2917, _3009, _3011);
        float _3015 = _3013 * _3007;
        float _3017 = precise::clamp(_3015, 0.0, 1.0);
        float _3019 = -_3017;
        float _3021 = _3019 + 1.0;
        _2763 = _3001;
        _2919 = _3021;
    }
    float _3023 = _2763;
    float _3025 = _2919;
    float _3027 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3029 = _2907 + _3027;
    float _3031 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3033 = _2909 + _3031;
    float _3035 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3037 = _2911 + _3035;
    float _3039 = _3029 * _3029;
    float _3041 = fma(_3033, _3033, _3039);
    float _3043 = fma(_1037, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3045 = fma(_3037, _3037, _3041);
    float _3047 = rsqrt(_3045);
    float _3049 = sqrt(_3045);
    float _3051 = _3047 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3053 = _3033 * _3051;
    float _3055 = _3037 * _3051;
    float _3057 = _3053 * _3053;
    float _3059 = _3055 * _3055;
    float _3061 = _3057 + _3059;
    float _3063 = sqrt(_3061);
    bool _3065 = _3063 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3067 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3069 = _3063 + _3067;
    float _3071 = _3047;
    float _3073 = _3069;
    float _3075 = _3029;
    float _3077 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_3065)
    {
        float _3079 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3071 = _3079;
    }
    float _3081 = _3071;
    float _3083 = _3081;
    if (_3065)
    {
        float _3085 = _3069 * _3081;
        _3073 = _3085;
    }
    float _3087 = _3073;
    if (_3065)
    {
        float _3089 = rsqrt(_3061);
        _3083 = _3089;
    }
    float _3091 = _3083;
    float _3093 = _3091;
    if (_3065)
    {
        float _3095 = _3087 * 0.15915493667125701904296875;
        _2765 = _3095;
    }
    float _3097 = _2765;
    float _3099 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3101 = _3037;
    float _3103 = _3097;
    if (_3065)
    {
        float _3105 = _3097 * 6.283185482025146484375;
        float _3107 = sin(_3105);
        _3101 = _3107;
    }
    float _3109 = _3101;
    float _3111 = precise::max(0.0, _3099);
    float _3113 = _3023;
    float _3115 = _3111;
    if (_3065)
    {
        float _3117 = _3097 * 6.283185482025146484375;
        float _3119 = cos(_3117);
        _3113 = _3119;
    }
    float _3121 = _3113;
    float _3123 = -_3051;
    float _3125 = -_3111;
    float _3127 = fma(_3029, _3123, _3125);
    if (_3065)
    {
        float _3129 = _3127 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3075 = _3129;
    }
    float _3131 = _3075;
    float _3133 = _3109;
    float _3135 = _3131;
    if (_3065)
    {
        float _3137 = fma(_3109, _3131, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3133 = _3137;
    }
    float _3139 = _3133;
    float _3141 = _3139;
    if (!_3065)
    {
        _3135 = _3127;
    }
    float _3143 = _3135;
    float _3145 = _3143;
    if (_3065)
    {
        float _3147 = _3091 * _3139;
        _3077 = _3147;
    }
    float _3149 = _3077;
    if (!_3065)
    {
        _3093 = _3053;
    }
    float _3151 = _3093;
    float _3153 = _3151;
    float _3155 = _3121;
    if (_3065)
    {
        float _3157 = _3121 + (-1.0);
        _3115 = _3157;
    }
    float _3159 = _3115;
    float _3161 = _3159;
    if (_3065)
    {
        float _3163 = _3053 * _3149;
        _3153 = _3163;
    }
    float _3165 = _3153;
    if (!_3065)
    {
        _3141 = _3057;
    }
    float _3167 = _3141;
    float _3169 = _3167;
    if (_3065)
    {
        float _3171 = _3159 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3103 = _3171;
    }
    float _3173 = _3103;
    if (!_3065)
    {
        _3161 = _3055;
    }
    float _3175 = _3161;
    float _3177 = _3175;
    if (_3065)
    {
        float _3179 = _3055 * _3149;
        _3177 = _3179;
    }
    float _3181 = _3177;
    if (_3065)
    {
        float _3183 = _3165 * _3165;
        _3169 = _3183;
    }
    float _3185 = _3169;
    if (_3065)
    {
        float _3187 = fma(_3127, _3121, _3173);
        _3145 = _3187;
    }
    float _3189 = _3145;
    if (!_3065)
    {
        _3155 = _3059;
    }
    float _3191 = _3155;
    float _3193 = _3191;
    if (_3065)
    {
        float _3195 = _3181 * _3181;
        _3193 = _3195;
    }
    float _3197 = _3193;
    float _3199 = fma(_3189, _3189, _3185);
    float _3201 = _2907 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3203 = floor(_3043);
    float _3205 = _3199 + _3197;
    float _3207 = fma(_2909, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3201);
    float _3209 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3211 = fma(_3049, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3209);
    float _3213 = precise::clamp(_3211, 0.0, 1.0);
    float _3215 = fma(_1065, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3217 = fma(_2911, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3207);
    float _3219 = -_3213;
    float _3221 = _3219 + 1.0;
    float _3223 = rsqrt(_3205);
    float _3225 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3227 = _3217 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3229 = _2907 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3231 = _3227 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3233 = abs(_3221);
    float _3235 = log2(_3233);
    float _3237 = _2907 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3239 = -_3231;
    float _3241 = fma(_3239, _3225, 1.0);
    float _3243 = _2907 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3245 = -_3203;
    float _3247 = _3043 + _3245;
    float _3249 = fma(_2909, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3237);
    float _3251 = _3223 * _3189;
    float _3253 = fma(_2909, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3243);
    float _3255 = fma(_2911, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3249);
    float _3257 = _3223 * _3165;
    float _3259 = _3223 * _3181;
    float _3261 = fma(_2911, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3253);
    float _3263 = _3255 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3265 = _3257 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3267 = fma(_2909, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3229);
    float _3269 = _3261 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3271 = _3263 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3273 = -_3265;
    float _3275 = fma(_3251, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3273);
    float _3277 = fma(_2911, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3267);
    float _3279 = _3235 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3281 = fma(_3269, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3271);
    float _3283 = -_3259;
    float _3285 = fma(_3283, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3275);
    float _3287 = _3277 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3289 = floor(_3215);
    float _3291 = fma(_3227, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3281);
    float _3293 = fma(_3285, -0.5, 0.5);
    float _3295 = _3263 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3297 = fma(_3285, 0.5, 0.5);
    float _3299 = fma(_3287, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3291);
    float _3301 = _3263 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3303 = exp2(_3279);
    float _3305 = fma(_3269, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3295);
    float _3307 = fma(_3269, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3301);
    float _3309 = _3251 + 1.0;
    float _3311 = fma(_3297, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3313 = fma(_3227, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3307);
    float _3315 = sqrt(_3293);
    float _3317 = -_3289;
    float _3319 = _3215 + _3317;
    float _3321 = fma(_3297, _3311, -0.212114393711090087890625);
    float _3323 = fma(_3297, _3321, 1.570728778839111328125);
    float _3325 = log2(_3241);
    float _3327 = fma(_3227, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3305);
    float _3329 = -_3251;
    float _3331 = fma(_3303, _3309, _3329);
    float _3333 = fma(_3287, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3327);
    float _3335 = fma(_3287, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3313);
    float _3337 = 1.0 / _3299;
    float _3339 = _3315 * 0.636619746685028076171875;
    float2 _8895 = float2(_3247, _3319);
    float _3341 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8895, float2(0.0), isnan(_8895)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8895, float2(0.0), isnan(_8895)), level(0.0)).x;
    float _3343 = fma(_3331, 0.5, 0.5);
    float _3345 = _3325 * 0.693147182464599609375;
    float _3347 = _3333 * _3337;
    float _3349 = _3335 * _3337;
    float _3351 = -_3323;
    float _3353 = fma(_3339, _3351, 1.0);
    float _3355 = _3345 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3357 = fma(_3347, 0.5, 0.5);
    float _3359 = fma(_3349, -0.5, 0.5);
    float3 _8930 = float3(_3357, _3359, _3355);
    float _3361 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8930, float3(0.0), isnan(_8930)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8930, float3(0.0), isnan(_8930)), level(0.0)).x;
    float3 _8941 = float3(_3357, _3359, _3355);
    float4 _3364 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8941, float3(0.0), isnan(_8941)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8941, float3(0.0), isnan(_8941)), level(0.0)).xyzw;
    float _3366 = _3364.x;
    float _3368 = _3364.y;
    float _3370 = _3364.z;
    float _3372 = _3364.w;
    float2 _8957 = float2(_3353, _3343);
    float3 _3376 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8957, float2(0.0), isnan(_8957)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8957, float2(0.0), isnan(_8957)), level(0.0)).xyz;
    float _3378 = _3376.x;
    float _3380 = _3376.y;
    float _3382 = _3376.z;
    float _3384 = abs(_2917);
    float _3386 = log2(_3384);
    float _3388 = _3235 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3390 = _3263 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3392 = _3049 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3394 = isnan(_3049);
    bool _3396 = _3392 || _3394;
    bool _3398 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3400 = _3396 || _3398;
    float _3402 = exp2(_3388);
    float _3404 = fma(_3269, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3390);
    bool _3406 = _2917 <= 8000.0;
    bool _3408 = isnan(_2917);
    bool _3410 = _3406 || _3408;
    bool _3412 = isnan(8000.0);
    bool _3414 = _3410 || _3412;
    float _3416 = float(_3414);
    float _3418 = in.m_81.x;
    float _3420 = fma(_3227, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3404);
    float _3422 = _3299 * 0.5;
    float _3424 = _3386 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3426 = fma(_3287, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3420);
    float _3428 = _3333 + _3299;
    float _3430 = exp2(_3424);
    float _3432 = _3428 * 0.5;
    float _3434 = -_3402;
    float _3436 = _3434 + 1.0;
    out.gl_Position.x = _3333;
    out.gl_Position.y = _3335;
    out.gl_Position.z = _3426;
    out.gl_Position.w = _3299;
    float _3438 = _3436 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3440 = fma(_3430, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3442 = precise::clamp(_3440, 0.0, 1.0);
    float _3444 = fma(_3335, -0.5, _3422);
    float _3446 = _2969 * _3025;
    float _3448 = fma(_3442, -2.0, 3.0);
    float _3450 = _3442 * _3442;
    float _3452 = _3335;
    float _3454 = _3299;
    float _3456 = _3426;
    float _3458 = _3446;
    if (!_3400)
    {
        _3452 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3460 = _3452;
    float _3462 = _3450 * _3448;
    float _3464 = -_3462;
    float _3466 = _3464 + 1.0;
    float _3468 = fma(_3466, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3462);
    float _3470 = _3426 + _3299;
    float _3472 = _3460;
    float _3474 = _3460;
    if (!_3400)
    {
        _3454 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3476 = _3454;
    float _3478 = _3416 * _3468;
    float _3480 = _3470 * 0.5;
    float _3482 = _3476;
    float _3484 = _3476;
    if (!_3400)
    {
        _3456 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3486 = _3456;
    float _3488 = _3478 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_83.x = _3432;
    out.m_83.y = _3444;
    out.m_83.z = _3480;
    out.m_83.w = _3299;
    float _3490 = -_3341;
    float _3492 = _3490 + 1.0;
    float _3494 = _3492 * _3488;
    float _3496 = precise::clamp(_3494, 0.0, 1.0);
    float _3498 = -_3496;
    float _3500 = fma(_3498, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3502 = _3500 * _3418;
    float _3504 = _3438 * _3361;
    float _3506 = -_3438;
    float _3508 = _3506 + 1.0;
    float _3510 = _3372 * _3504;
    float _3512 = _3382 * _3504;
    float _3514 = _3372 * _3508;
    float _3516 = fma(_3378, _3510, _3366);
    float _3518 = fma(_3380, _3510, _3368);
    float _3520 = _3502 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3522 = fma(_3372, _3512, _3370);
    float _3524 = _3446 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3526 = _3502;
    float _3528 = _3366;
    float _3530 = _3486;
    float _3532 = _3486;
    if (!_3400)
    {
        _3526 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3534 = _3526;
    out.m_85.x = _3520;
    float _3536 = _3534;
    float _3538 = _3534;
    if (!_3400)
    {
        _3528 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3540 = _3528;
    float _3542 = _3540;
    float _3544 = _3540;
    if (!_3400)
    {
        _3458 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3546 = _3458;
    out.m_87.x = _3516;
    out.m_87.y = _3518;
    out.m_87.z = _3522;
    out.m_87.w = _3514;
    bool _3548 = !_3400;
    float _3550 = _3546;
    float _3552 = _3546;
    if (!_3548)
    {
        bool _3554 = _3049 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3556 = isnan(_3049);
        bool _3558 = _3554 || _3556;
        bool _3560 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3562 = _3558 || _3560;
        if (!_3562)
        {
            float _3564 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3566 = _3049 + _3564;
            float _3568 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3570 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3568;
            float _3572 = 1.0 / _3570;
            float _3574 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3576 = _3574 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3578 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3580 = _3578 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3582 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3584 = _3582 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3586 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3588 = _3586 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3590 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3592 = _3590 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3594 = _3566 * _3572;
            float _3596 = precise::clamp(_3594, 0.0, 1.0);
            float _3598 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3600 = _3598 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3602 = fma(_3596, _3576, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3604 = fma(_3596, _3600, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3606 = fma(_3596, _3580, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3608 = fma(_3596, _3584, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3610 = fma(_3596, _3588, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3612 = fma(_3596, _3592, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3544 = _3604;
            _3474 = _3610;
            _3538 = _3602;
            _3532 = _3608;
            _3484 = _3606;
            _3552 = _3612;
            _3614 = true;
        }
        else
        {
            bool _3616 = _3049 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3618 = isnan(_3049);
            bool _3620 = _3616 || _3618;
            bool _3622 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3624 = _3620 || _3622;
            if (!_3624)
            {
                _3536 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3626 = _3536;
            _3538 = _3626;
            if (!_3624)
            {
                _3542 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3628 = _3542;
            _3544 = _3628;
            if (!_3624)
            {
                _3482 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3630 = _3482;
            _3484 = _3630;
            if (!_3624)
            {
                _3530 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3632 = _3530;
            _3532 = _3632;
            if (!_3624)
            {
                _3472 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3634 = _3472;
            _3474 = _3634;
            if (!_3624)
            {
                _3550 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3636 = _3550;
            bool _3638 = !_3624;
            _3552 = _3636;
            if (!_3638)
            {
                bool _3640 = _3049 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3642 = isnan(_3049);
                bool _3644 = _3640 || _3642;
                bool _3646 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3648 = _3644 || _3646;
                if (!_3648)
                {
                    float _3650 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3652 = _3049 + _3650;
                    float _3654 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3656 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3654;
                    float _3658 = 1.0 / _3656;
                    float _3660 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3662 = _3660 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3664 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3666 = _3664 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3668 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3670 = _3668 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3672 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3674 = _3672 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3676 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3678 = _3676 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3680 = _3652 * _3658;
                    float _3682 = precise::clamp(_3680, 0.0, 1.0);
                    float _3684 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3686 = _3684 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3688 = fma(_3682, _3662, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3690 = fma(_3682, _3686, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3692 = fma(_3682, _3666, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3694 = fma(_3682, _3670, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3696 = fma(_3682, _3674, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3698 = fma(_3682, _3678, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3544 = _3690;
                    _3474 = _3696;
                    _3538 = _3688;
                    _3532 = _3694;
                    _3484 = _3692;
                    _3552 = _3698;
                    _3614 = true;
                }
                else
                {
                    _3544 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3474 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3538 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3532 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3484 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3552 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3614 = false;
    float _3700 = _3544;
    float _3702 = _3474;
    float _3704 = _3538;
    float _3706 = _3532;
    float _3708 = _3484;
    float _3710 = _3552;
    float _3712 = fma(_2571, -0.5, 0.5);
    float _3714 = precise::clamp(_3712, 0.0, 1.0);
    float _3716 = -_3700;
    float _3718 = _3716 + _3702;
    float _3720 = _3524 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3722 = -_3704;
    float _3724 = _3722 + _3706;
    float _3726 = fma(_3714, _3718, _3700);
    out.m_89.x = 0.0;
    float _3728 = -_3708;
    float _3730 = _3728 + _3710;
    float _3732 = fma(_3714, _3724, _3704);
    float _3734 = _3726 * 0.586610972881317138671875;
    out.m_51.x = _3720;
    bool _3736 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3738 = fma(_3714, _3730, _3708);
    float _3740 = fma(_3732, 0.298911988735198974609375, _3734);
    bool _3742 = _2969 > 0.0;
    bool _3744 = isnan(_2969);
    bool _3746 = _3742 || _3744;
    bool _3748 = isnan(0.0);
    bool _3750 = _3746 || _3748;
    float _3752 = fma(_3738, 0.114477999508380889892578125, _3740);
    bool _3754 = _3025 <= 0.0;
    bool _3756 = !_3750;
    bool _3758 = _3754 || _3756;
    float _3760 = -_3752;
    float _3762 = _3732 + _3760;
    float _3764 = -_3752;
    float _3766 = _3726 + _3764;
    float _3768 = -_3752;
    float _3770 = _3738 + _3768;
    float _3772 = fma(_3762, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3752);
    float _3774 = fma(_3766, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3752);
    float _3776 = fma(_3770, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3752);
    bool _3778 = !_3736;
    if (!_3778)
    {
        float _3780 = -_2907;
        float _3782 = _3780 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3784 = -_2909;
        float _3786 = _3784 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3788 = -_2911;
        float _3790 = _3788 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3792 = _3782 * _3782;
        float _3794 = fma(_3786, _3786, _3792);
        float _3796 = fma(_3790, _3790, _3794);
        float _3798 = sqrt(_3796);
        float _3800 = rsqrt(_3796);
        float _3802 = -_3798;
        float _3804 = _3802 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3806 = _3804 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3808 = precise::clamp(_3806, 0.0, 1.0);
        float _3810 = _3786 * _3800;
        float _3812 = _3782 * _3800;
        float _3814 = abs(_3808);
        float _3816 = log2(_3814);
        float _3818 = _3790 * _3800;
        float _3820 = _3810 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3822 = _2571 * _3812;
        float _3824 = -_3812;
        float _3826 = -_3820;
        float _3828 = fma(_3824, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3826);
        float _3830 = fma(_2569, _3810, _3822);
        float _3832 = -_3818;
        float _3834 = fma(_3832, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3828);
        float _3836 = fma(_2585, _3818, _3830);
        float _3838 = precise::clamp(_3836, 0.0, 1.0);
        float _3840 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3842 = _3834 + _3840;
        float _3844 = _3816 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3846 = _3842 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3848 = precise::clamp(_3846, 0.0, 1.0);
        float _3850 = exp2(_3844);
        float _3852 = _3850 * _3848;
        float _3854 = _3838 * _3852;
        float _3856 = _3854 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3858 = _3854 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3860 = _3854 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _3856;
        out.m_89.y = _3858;
        out.m_89.z = _3860;
    }
    out.m_91.x = _3772;
    out.m_91.y = _3774;
    out.m_91.z = _3776;
    if (!_3758)
    {
        return out;
    }
    out.m_51.x = 0.0;
    float _3862 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3862;
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
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3614 = false;
    bool _2633 = false;
    bool _706 = false;
    bool _564 = false;
    bool _438 = false;
    bool _216 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_48.w;
    float _107 = trunc(_105);
    int _110 = int(_107);
    bool _114 = _110 >= 1;
    float _116 = 0.0;
    if (!_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _116;
    float _120 = _118;
    if (!_114)
    {
        out.m_51.x = 0.0;
    }
    int _122 = 0;
    if (!_114)
    {
        float _124 = _118 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    int _128 = _126;
    if (!_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3919 = as_type<float>(_126);
        out.gl_Position.z = _3919;
    }
    if (!_114)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _130 = in.m_53.w;
    bool _132 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_130);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    float _142 = -_130;
    float _144 = _142 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _146 = _144;
    if (_140)
    {
        float _148 = float(_110);
        _120 = _148;
    }
    float _150 = _120;
    bool _152 = _144 >= _150;
    bool _154 = !_140;
    bool _156 = _152 || _154;
    float _158 = _150;
    if (_156)
    {
        _158 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _158;
    if (_156)
    {
        out.m_51.x = 0.0;
    }
    if (_156)
    {
        float _162 = _160 * 5.0;
        _128 = as_type<int>(_162);
    }
    int _164 = _128;
    if (_156)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3989 = as_type<float>(_164);
        out.gl_Position.z = _3989;
    }
    if (_156)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _166 = in.m_55.x;
    float _168 = in.m_55.y;
    float _170 = in.m_55.z;
    bool _172 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _174 = _168 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _176 = _168 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _178 = _168 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _180 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[4].x, _174);
    float _182 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[5].x, _176);
    float _184 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[6].x, _178);
    float _186 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[4].z, _180);
    float _188 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[5].z, _182);
    float _190 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[6].z, _184);
    bool _192 = !_172;
    float _194 = _188;
    float _196 = _190;
    float _214;
    if (!_192)
    {
        float _198 = in.m_57.x;
        float _200 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _202 = _198 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _204 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[12].x, _144);
        float _206 = _204 * _200;
        float _208 = floor(_206);
        float _210 = -_208;
        float _212 = _206 + _210;
        _214 = _212;
        _216 = true;
    }
    else
    {
        float _218 = float(_110);
        float _220 = 1.0 / _218;
        float _222 = _144 * _220;
        _214 = _222;
    }
    _216 = false;
    float _224 = _214;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _228 = _224 + _226;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _232 = _224 + _230;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _236 = _224 + _234;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _240 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _238;
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _244 = _242 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _246;
    float _250 = 1.0 / _240;
    bool _252 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _254 = 1.0 / _248;
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _258 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _256;
    float _260 = 1.0 / _244;
    float _262 = _228 * _250;
    bool _264 = _224 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _266 = isnan(_224);
    bool _268 = _264 || _266;
    bool _270 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _272 = _268 || _270;
    float _274 = float(_272);
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _278 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _276;
    float _280 = fma(_258, _262, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _282 = fma(_278, _262, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _284 = _232 * _254;
    bool _286 = _224 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _288 = isnan(_224);
    bool _290 = _286 || _288;
    bool _292 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _294 = _290 || _292;
    float _296 = float(_294);
    float _298 = -_274;
    float _300 = _298 + 1.0;
    float _302 = _296 * _300;
    float _304 = -_296;
    float _306 = _304 + 1.0;
    float _308 = _236 * _260;
    bool _310 = _224 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _312 = isnan(_224);
    bool _314 = _310 || _312;
    bool _316 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _318 = _314 || _316;
    float _320 = float(_318);
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _324 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _322;
    bool _326 = _224 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _328 = isnan(_224);
    bool _330 = _326 || _328;
    bool _332 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _334 = _330 || _332;
    float _336 = float(_334);
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _340 = _338 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _344 = _342 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _346 = -_320;
    float _348 = _346 + 1.0;
    float _350 = fma(_324, _262, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _352 = _320 * _306;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _356 = _354 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _358 = _336 * _348;
    float _360 = -_336;
    float _362 = _360 + 1.0;
    float _364 = fma(_344, _308, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _366 = _350 * _358;
    float _368 = _280 * _358;
    float _370 = _282 * _358;
    float _372 = fma(_356, _308, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _374 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[143].x, _368);
    float _376 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[143].y, _370);
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _378;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _382;
    float _386 = fma(_340, _308, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _388 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[143].z, _366);
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _392 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _390;
    float _394 = fma(_364, _352, _374);
    float _396 = fma(_380, _284, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _398 = fma(_384, _284, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _400 = fma(_372, _352, _376);
    float _402 = fma(_392, _284, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _404 = fma(_386, _352, _388);
    float _406 = fma(_396, _302, _394);
    float _408 = fma(_398, _302, _400);
    float _410 = fma(_402, _302, _404);
    float _412 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[146].x, _406);
    float _414 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[146].y, _408);
    float _416 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[146].z, _410);
    bool _418 = !_252;
    float _436;
    if (!_418)
    {
        float _420 = in.m_57.x;
        float _422 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _424 = _420 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _426 = fma(_424, (*spvDescriptorSet0.vp_c9)._m0[11].x, _144);
        float _428 = _426 * _422;
        float _430 = floor(_428);
        float _432 = -_430;
        float _434 = _428 + _432;
        _436 = _434;
        _438 = true;
    }
    else
    {
        float _440 = float(_110);
        float _442 = 1.0 / _440;
        float _444 = _144 * _442;
        _436 = _444;
    }
    _438 = false;
    float _446 = _436;
    float _448 = in.m_59.x;
    float _450 = in.m_59.y;
    float _452 = in.m_59.z;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _456 = _446 + _454;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _458;
    bool _462 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _464 = 1.0 / _460;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _466;
    float _470 = _414 * _450;
    float _472 = _456 * _464;
    float _474 = _416 * _452;
    bool _476 = _446 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _478 = isnan(_446);
    bool _480 = _476 || _478;
    bool _482 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _484 = _480 || _482;
    float _486 = float(_484);
    float _488 = _412 * _448;
    float _490 = fma(_468, _472, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _492 = -_486;
    float _494 = _492 + 1.0;
    bool _496 = _446 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _498 = isnan(_446);
    bool _500 = _496 || _498;
    bool _502 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _504 = _500 || _502;
    float _506 = float(_504);
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _510 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _508;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _512;
    float _516 = _506 * _494;
    float _518 = fma(_510, _472, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _520 = fma(_514, _472, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _522 = -_506;
    float _524 = _522 + 1.0;
    float _526 = _490 * _516;
    float _528 = _518 * _516;
    float _530 = _520 * _516;
    float _532 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[107].y, _526);
    float _534 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[107].x, _528);
    float _536 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[107].z, _530);
    float _538 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[108].y, _532);
    float _540 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[108].x, _534);
    float _542 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[108].z, _536);
    bool _544 = !_462;
    float _562;
    if (!_544)
    {
        float _546 = in.m_57.x;
        float _548 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _550 = _546 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _552 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[11].y, _144);
        float _554 = _552 * _548;
        float _556 = floor(_554);
        float _558 = -_556;
        float _560 = _554 + _558;
        _562 = _560;
        _564 = true;
    }
    else
    {
        float _566 = float(_110);
        float _568 = 1.0 / _566;
        float _570 = _144 * _568;
        _562 = _570;
    }
    _564 = false;
    float _572 = _562;
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _576 = _574 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _578 = _572 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _580 = isnan(_572);
    bool _582 = _578 || _580;
    bool _584 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _586 = _582 || _584;
    float _588 = float(_586);
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _592 = _590 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _594 = _572 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _596 = isnan(_572);
    bool _598 = _594 || _596;
    bool _600 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _602 = _598 || _600;
    float _604 = float(_602);
    float _606 = 1.0 / _576;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _610 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _608;
    float _612 = -_588;
    float _614 = _612 + 1.0;
    bool _616 = _572 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _618 = isnan(_572);
    bool _620 = _616 || _618;
    bool _622 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _624 = _620 || _622;
    float _626 = float(_624);
    bool _628 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _630 = _604 * _614;
    float _632 = -_604;
    float _634 = _632 + 1.0;
    float _636 = 1.0 / _592;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _640 = _638 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _642 = _610 * _606;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _646 = _572 + _644;
    float _648 = -_626;
    float _650 = _648 + 1.0;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _654 = _572 + _652;
    float _656 = fma(_642, _646, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _658 = _588 * _650;
    float _660 = _640 * _636;
    float _662 = _656 * _630;
    float _664 = _538 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _666 = fma(_660, _654, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _668 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[115].x, _662);
    float _670 = _542 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _672 = _664 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _674 = fma(_666, _658, _668);
    float _676 = _540 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _678 = _670 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _680 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[117].x, _674);
    float _682 = _676 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _684 = _680 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_61.x = _682;
    out.m_61.y = _672;
    out.m_61.z = _678;
    out.m_61.w = _684;
    bool _686 = !_628;
    float _704;
    if (!_686)
    {
        float _688 = in.m_57.x;
        float _690 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _692 = _688 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _694 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[11].w, _144);
        float _696 = _694 * _690;
        float _698 = floor(_696);
        float _700 = -_698;
        float _702 = _696 + _700;
        _704 = _702;
        _706 = true;
    }
    else
    {
        float _708 = float(_110);
        float _710 = 1.0 / _708;
        float _712 = _144 * _710;
        _704 = _712;
    }
    _706 = false;
    float _714 = _704;
    float _716 = in.m_63.y;
    float _718 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _720 = int(_718);
    float _722 = _488 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _724 = in.m_57.x;
    float _726 = in.m_57.y;
    float _728 = _470 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _730 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _732 = _730 != 0;
    float _734 = in.m_65.x;
    float _736 = float(_110);
    float _738 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _740 = int(_738);
    float _742 = in.m_65.y;
    int _744 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _746 = _744 != 0;
    float _748 = _474 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _752 = float(_720);
    float _754 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _756 = log2(_754);
    float _758 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _760 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _762 = -_716;
    float _764 = _762 + 1.0;
    int _766 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _768 = _766 != 0;
    float _770 = 1.0 / _752;
    int _772 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _774 = _772 != 0;
    float _776 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _778 = _726 > 0.5;
    float _780 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    int _782 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _784 = _782 != 0;
    out.m_67.x = _734;
    float _786 = _716;
    if (_732)
    {
        float _788 = _778 ? _764 : _716;
        _786 = _788;
    }
    float _790 = _786;
    float _792 = _726 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    out.m_67.y = _742;
    float _794 = _724 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _796 = fma(_792, -2.0, _750);
    float _798 = in.m_48.x;
    float _800 = in.m_48.y;
    float _802 = in.m_48.z;
    float _804 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _806 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _808 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _812 = _810 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _814 = -_776;
    float _816 = fma(_794, 2.0, _814);
    float _818 = -_758;
    float _820 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _818);
    float _822 = -_760;
    float _824 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _822);
    float _826 = -_780;
    float _828 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _826);
    float _830 = _770 * _144;
    float _832 = in.m_69.x;
    float _834 = in.m_69.y;
    float _836 = in.m_69.z;
    float _838 = -_806;
    float _840 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _838);
    float _842 = -_808;
    float _844 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _842);
    float _846 = float(uint(_740));
    float _848 = 1.0 / _812;
    float _850 = -_804;
    float _852 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _850);
    float _854 = _488;
    if (_768)
    {
        float _856 = in.m_57.x;
        _854 = _856;
    }
    float _858 = _854;
    float _860 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _862 = _860 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _864 = 1.0 / _846;
    float _866 = _800 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _868 = _800 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _870 = _800 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _872 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _874 = _872 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _876 = fma(_798, (*spvDescriptorSet0.vp_c10)._m0[5].x, _866);
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _880 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _878;
    float _882 = trunc(_830);
    int _884 = int(_882);
    bool _886 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _888 = isnan(0.0);
    bool _890 = _886 || _888;
    bool _892 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _894 = _890 || _892;
    float _896 = _880 * _848;
    float _898 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _900 = _898 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _902 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _834);
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _906 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _904;
    float _908 = float(_740);
    float _910 = fma(_798, (*spvDescriptorSet0.vp_c10)._m0[4].x, _868);
    float _912 = 1.0 / _862;
    int _914 = as_type<int>(_864) + (-2);
    float _916 = fma(_798, (*spvDescriptorSet0.vp_c10)._m0[6].x, _870);
    float _918 = _908 * _144;
    bool _920 = _858 > 0.5;
    bool _922 = _920 && _768;
    float _924 = _726 * 2.0;
    int _926 = ~_740;
    int _928 = _926 + 1;
    float _930 = -_144;
    float _932 = fma(_930, (*spvDescriptorSet0.vp_c9)._m0[76].x, _816);
    float _934 = float(uint(_884));
    float _936 = _756 * _144;
    float _938 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _832);
    float _940 = 1.0 / _736;
    float _942 = as_type<float>(_914) * _934;
    float _944 = _722 * _938;
    float _946 = _728 * _902;
    float _948 = _724 * 2.0;
    float _950 = _906 * _912;
    float _952 = in.m_57.z;
    float _954 = exp2(_936);
    float _956 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[76].y, _796);
    bool _958 = !_746;
    float _960 = _958 ? 7.345489978790283203125 : 1.0;
    float _962 = fma(_802, (*spvDescriptorSet0.vp_c10)._m0[4].z, _910);
    bool _964 = !_784;
    int _966 = _964 ? 0 : 1;
    float _968 = fma(_802, (*spvDescriptorSet0.vp_c10)._m0[5].z, _876);
    float _970 = fma(_802, (*spvDescriptorSet0.vp_c10)._m0[6].z, _916);
    float _972 = _960 * _724;
    float _974 = trunc(_942);
    float _976 = precise::max(_974, 0.0);
    uint _979 = uint(_976);
    float _981 = _918 * _940;
    float _983 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _985 = _714 + _983;
    float _987 = _828 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _989 = _828 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _991 = _828 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _993 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _995 = floor(_948);
    float _997 = -_954;
    float _999 = _997 + 1.0;
    float _1001 = fma(_896, _985, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1003 = -_987;
    float _1005 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1003);
    float _1007 = _828 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1009 = _968 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1011 = _894 ? _999 : 0.0;
    float _1013 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1015 = _714 + _1013;
    float _1017 = 1.0 / _874;
    float _1019 = _824 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1021 = _748 * _836;
    bool _1023 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1025 = isnan(1.0);
    bool _1027 = _1023 || _1025;
    bool _1029 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1031 = _1027 || _1029;
    float _1033 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1035 = 1.0 + _1033;
    float _1037 = _962 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1039 = _928 * int(_979);
    int _1041 = _1039 + _884;
    bool _1043 = _995 >= 0.0;
    bool _1045 = isnan(_995);
    bool _1047 = _1043 || _1045;
    bool _1049 = isnan(0.0);
    bool _1051 = _1047 || _1049;
    float _1053 = 1.0 / _1035;
    float _1055 = -_1009;
    float _1057 = _1055 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1059 = -_1019;
    float _1061 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[0].y, _1059);
    int _1063 = _1051 ? 0 : 1;
    float _1065 = _970 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1067 = float(uint(_1041));
    float _1069 = _900 * _1017;
    float _1071 = floor(_924);
    bool _1073 = _995 > 0.0;
    float _1075 = as_type<float>(_914) * _1067;
    float _1077 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[78].w, _993);
    float _1079 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1081 = fma(_1069, _1015, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1083 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1077);
    float _1085 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1079);
    float _1087 = trunc(_1075);
    float _1089 = precise::max(_1087, 0.0);
    uint _1091 = uint(_1089);
    float _1093 = _952 * 2.0;
    int _1095 = ~_1063;
    int _1097 = _1095 + 1;
    int _1099 = _1097 + 1;
    float _1101 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1085);
    int _1103 = _1099;
    if (_1031)
    {
        float _1105 = _1011 * _1053;
        _146 = _1105;
    }
    float _1107 = _146;
    if (!_1073)
    {
        int _1109 = ~_1063;
        int _1111 = _1109 + 1;
        _1103 = _1111;
    }
    int _1113 = _1103;
    float _1115 = _726 + _724;
    int _1117 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1119 = _1117 != 0;
    int _1121 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1123 = _1121 != 0;
    int _1125 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1127 = _1125 != 0;
    float _1129 = floor(_1093);
    float _1131 = _952 + _724;
    float _1133 = _1115 + (-1.0);
    bool _1135 = !_1123;
    int _1137 = _1135 ? 0 : 1;
    float _1139 = -_1037;
    float _1141 = _1139 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1143 = _1131 + (-1.0);
    bool _1145 = _1071 > 0.0;
    float _1147 = fma(_1133, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1149 = ~_740;
    int _1151 = _1149 + 1;
    float _1153 = fma(_1143, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1155 = _1071 >= 0.0;
    bool _1157 = isnan(_1071);
    bool _1159 = _1155 || _1157;
    bool _1161 = isnan(0.0);
    bool _1163 = _1159 || _1161;
    float _1165 = floor(_972);
    int _1167 = int(_979) + int(_1091);
    float _1169 = fma(_852, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1061);
    float _1171 = _726 + _952;
    int _1173 = _1163 ? 0 : 1;
    float _1175 = fma(_840, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1005);
    bool _1177 = _1129 > 0.0;
    int _1179 = _1151 * _1167;
    int _1181 = _1179 + _884;
    int _1183 = ~_1173;
    int _1185 = _1183 + 1;
    int _1187 = _1185 + 1;
    float _1189 = _1171 + (-1.0);
    bool _1191 = !_1119;
    int _1193 = _1191 ? 0 : 1;
    float _1195 = _724 + (-0.5);
    int _1197 = _1187;
    if (!_1145)
    {
        int _1199 = ~_1173;
        int _1201 = _1199 + 1;
        _1197 = _1201;
    }
    int _1203 = _1197;
    float _1205 = _952 + (-0.5);
    bool _1207 = _1129 >= 0.0;
    bool _1209 = isnan(_1129);
    bool _1211 = _1207 || _1209;
    bool _1213 = isnan(0.0);
    bool _1215 = _1211 || _1213;
    float _1217 = -_1165;
    float _1219 = _972 + _1217;
    bool _1221 = !_1127;
    int _1223 = _1221 ? 0 : 1;
    float _1225 = _1219 * _908;
    int _1227 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1229 = _1227 != 0;
    float _1231 = fma(_1189, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1233 = uint(_1181) >= uint(_740);
    int _1235 = _1215 ? 0 : 1;
    float _1237 = trunc(_1225);
    int _1239 = int(_1237);
    bool _1241 = !_1229;
    int _1243 = _1241 ? 0 : 1;
    bool _1245 = !_1233;
    int _1247 = _1245 ? 0 : (-1);
    int _1249 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1251 = _1249 != 0;
    int _1253 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1255 = _1253 != 0;
    int _1257 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1259 = _1257 != 0;
    float _1261 = in.m_71.x;
    float _1263 = in.m_71.y;
    float _1265 = in.m_71.z;
    int _1267 = ~_1235;
    int _1269 = _1267 + 1;
    int _1271 = _1269 + 1;
    int _1273 = _1271;
    if (!_1177)
    {
        int _1275 = ~_1235;
        int _1277 = _1275 + 1;
        _1273 = _1277;
    }
    int _1279 = _1273;
    float _1281 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1283 = _714 + _1281;
    bool _1285 = _834 != 0.0;
    bool _1287 = isnan(_834);
    bool _1289 = _1285 || _1287;
    bool _1291 = isnan(0.0);
    bool _1293 = _1289 || _1291;
    int _1295 = ~_1167;
    int _1297 = _1295 + _1247;
    int _1299 = _1297 + 1;
    float _1301 = fma(_950, _1283, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    bool _1303 = _832 == 0.0;
    bool _1305 = !_1293;
    bool _1307 = _1303 && _1305;
    float _1309 = _824 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1311 = float(_884);
    int _1313 = _740 * _1299;
    int _1315 = _1313 + _884;
    bool _1317 = _836 == 0.0;
    bool _1319 = _1317 && _1307;
    float _1321 = -_1309;
    float _1323 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[1].y, _1321);
    bool _1325 = _714 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1327 = isnan(_714);
    bool _1329 = _1325 || _1327;
    bool _1331 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1333 = _1329 || _1331;
    float _1335 = float(_1333);
    float _1337 = -_989;
    float _1339 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1337);
    float _1341 = _1057 * _1057;
    float _1343 = -_1007;
    float _1345 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1343);
    float _1347 = -_991;
    float _1349 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1347);
    float _1351 = -_1335;
    float _1353 = _1351 + 1.0;
    float _1355 = fma(_1141, _1141, _1341);
    int _1357 = _740 + (-1);
    float _1359 = fma(_852, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1323);
    int _1361 = abs(_1137);
    float _1363 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1339);
    float _1365 = _1263;
    float _1367 = _1265;
    float _1369 = _1261;
    if (!_1319)
    {
        float _1371 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1263);
        _1365 = _1371;
    }
    float _1373 = _1365;
    if (!_1319)
    {
        float _1375 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1265);
        _1367 = _1375;
    }
    float _1377 = _1367;
    bool _1379 = _1311 >= _908;
    bool _1381 = isnan(_1311);
    bool _1383 = _1379 || _1381;
    bool _1385 = isnan(_908);
    bool _1387 = _1383 || _1385;
    float _1389 = float(_1387);
    if (!_1319)
    {
        float _1391 = fma(_832, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1261);
        _1369 = _1391;
    }
    float _1393 = _1369;
    bool _1395 = _714 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1397 = isnan(_714);
    bool _1399 = _1395 || _1397;
    bool _1401 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1403 = _1399 || _1401;
    float _1405 = float(_1403);
    float _1407 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1345);
    bool _1409 = _714 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1411 = isnan(_714);
    bool _1413 = _1409 || _1411;
    bool _1415 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1417 = _1413 || _1415;
    float _1419 = float(_1417);
    float _1421 = fma(_840, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1349);
    float _1423 = trunc(_1389);
    int _1425 = int(_1423);
    float _1427 = _1405 * _1353;
    float _1429 = -_1405;
    float _1431 = _1429 + 1.0;
    float _1433 = -_1065;
    float _1435 = _1433 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    bool _1437 = _740 == 0;
    float _1439 = -_1419;
    float _1441 = _1439 + 1.0;
    bool _1443 = _714 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1445 = isnan(_714);
    bool _1447 = _1443 || _1445;
    bool _1449 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1451 = _1447 || _1449;
    float _1453 = float(_1451);
    float _1455 = fma(_1435, _1435, _1355);
    bool _1457 = !_1437;
    int _1459 = _1457 ? _1315 : (-1);
    float _1461 = _1419 * _1431;
    int _1463 = abs(_966);
    float _1465 = _1453 * _1441;
    bool _1467 = !_1251;
    int _1469 = _1467 ? 0 : 1;
    float _1471 = rsqrt(_1455);
    int _1473 = abs(_1223);
    float _1475 = _1001 * _1465;
    int _1477 = ~_1425;
    int _1479 = _1477 + 1;
    int _1481 = _1479 + 1;
    float _1483 = _840 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    int _1485 = _1239 * _1463;
    int _1487 = _1485 + _884;
    int _1489 = abs(_1469);
    float _1491 = in.m_63.x;
    int _1493 = _1459 * _1481;
    float _1495 = -_1483;
    float _1497 = fma(_852, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1495);
    float _1499 = float(_1279);
    int _1501 = _1425 * _1357;
    int _1503 = _1501 + _1493;
    int _1505 = abs(_1193);
    float _1507 = trunc(_981);
    int _1509 = int(_1507);
    float _1511 = float(_1113);
    float _1513 = _1141 * _1471;
    float _1515 = _1435 * _1471;
    float _1517 = _1175 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1519 = _1513 * _1513;
    int _1521 = abs(_1243);
    float _1523 = _1057 * _1471;
    float _1525 = -_1517;
    float _1527 = fma(_1359, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1525);
    float _1529 = fma(_1515, _1515, _1519);
    int _1531 = _1503 * _1361;
    float _1533 = float(_1489);
    float _1535 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1527);
    float _1537 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1497);
    int _1539 = _1509 * _1505;
    int _1541 = _1539 + _1531;
    float _1543 = rsqrt(_1529);
    float _1545 = in.m_73.x;
    float _1547 = in.m_73.y;
    float _1549 = in.m_73.z;
    float _1551 = _1533 * _1499;
    int _1553 = _1487 * _1473;
    int _1555 = _1553 + _1541;
    float _1557 = -_1537;
    float _1559 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1535);
    float _1561 = _1551 * (-2.0);
    int _1563 = _1239 * _1521;
    int _1565 = _1563 + _1555;
    float _1567 = 1.0 / _1559;
    float _1569 = float(uint(_1565));
    float _1571 = _1515 * _1543;
    float _1573 = _1513 * _1543;
    float _1575 = fma(_1147, _1561, _1147);
    float _1577 = as_type<float>(_914) * _1569;
    float _1579 = -_1571;
    float _1581 = _1515 * _1579;
    float _1583 = float(uint(_1487));
    float _1585 = -_1571;
    float _1587 = _1523 * _1585;
    float _1589 = -_1581;
    float _1591 = fma(_1513, _1573, _1589);
    float _1593 = fma(_1561, _1545, _1545);
    float _1595 = trunc(_1577);
    float _1597 = precise::max(_1595, 0.0);
    uint _1599 = uint(_1597);
    bool _1601 = !_1255;
    int _1603 = _1601 ? 0 : 1;
    float _1605 = _1523 * _1573;
    float _1607 = _1591 * _1591;
    float _1609 = fma(_1195, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1593);
    int _1611 = abs(_1603);
    float _1613 = fma(_1605, _1605, _1607);
    float _1615 = as_type<float>(_914) * _1583;
    float _1617 = fma(_1575, _1107, _1609);
    int _1619 = ~_740;
    int _1621 = _1619 + 1;
    float _1623 = fma(_1587, _1587, _1613);
    float _1625 = float(_1611);
    float _1627 = trunc(_1615);
    float _1629 = precise::max(_1627, 0.0);
    uint _1631 = uint(_1629);
    bool _1633 = !_1259;
    int _1635 = _1633 ? 0 : 1;
    int _1637 = _1621 * int(_1599);
    int _1639 = _1637 + _1565;
    float _1641 = _1625 * _1511;
    int _1643 = abs(_1635);
    float _1645 = _1617 * 0.15915493667125701904296875;
    float _1647 = float(uint(_1639));
    float _1649 = rsqrt(_1623);
    float _1651 = _1641 * (-2.0);
    float _1653 = _726 + (-0.5);
    float _1655 = as_type<float>(_914) * _1647;
    float _1657 = fma(_1651, _1547, _1547);
    float _1659 = float(_1203);
    float _1661 = fma(_1231, _1651, _1231);
    float _1663 = float(_1643);
    float _1665 = fma(_1653, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1657);
    float _1667 = trunc(_1655);
    float _1669 = precise::max(_1667, 0.0);
    uint _1671 = uint(_1669);
    float _1673 = _1663 * _1659;
    float _1675 = fma(_1661, _1107, _1665);
    float _1677 = _1591 * _1649;
    float _1679 = precise::clamp(_1677, 0.0, 1.0);
    float _1681 = _1673 * (-2.0);
    float _1683 = _1675 * 0.15915493667125701904296875;
    float _1685 = _1645 * 6.283185482025146484375;
    float _1687 = sin(_1685);
    float _1689 = -_1679;
    float _1691 = _1689 + 1.0;
    float _1693 = fma(_1153, _1681, _1153);
    float _1695 = fma(_1421, _1567, -1.0);
    float _1697 = fma(_1681, _1549, _1549);
    float _1699 = _1691 * _1567;
    int _1701 = ~_740;
    int _1703 = _1701 + 1;
    float _1705 = fma(_1691, _1695, 1.0);
    int _1707 = int(_1599) + int(_1671);
    float _1709 = _1169 * _1699;
    int _1711 = ~_740;
    int _1713 = _1711 + 1;
    float _1715 = _1705 * _1705;
    float _1717 = fma(_1205, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1697);
    float _1719 = _1407 * _1699;
    float _1721 = _1645 * 6.283185482025146484375;
    float _1723 = cos(_1721);
    float _1725 = fma(_1709, _1709, _1715);
    float _1727 = -_1453;
    float _1729 = _1727 + 1.0;
    float _1731 = fma(_1693, _1107, _1717);
    float _1733 = fma(_1719, _1719, _1725);
    int _1735 = _1713 * _1707;
    int _1737 = _1735 + _1565;
    float _1739 = fma(_1729, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1475);
    float _1741 = rsqrt(_1733);
    float _1743 = as_type<float>(_1703);
    float _1745 = _1731;
    if (_768)
    {
        _1743 = _1491;
    }
    float _1747 = _1743;
    int _1749 = _1703 * int(_1631);
    int _1751 = _1749 + _1487;
    bool _1753 = uint(_1737) >= uint(_740);
    float _1755 = fma(_1081, _1461, _1739);
    float _1757 = _1731 * 0.15915493667125701904296875;
    float _1759 = _1747;
    if (_922)
    {
        float _1761 = -_1747;
        float _1763 = _1761 + 1.0;
        _1759 = _1763;
    }
    float _1765 = _1759;
    bool _1767 = !_1753;
    int _1769 = _1767 ? 0 : (-1);
    float _1771 = _1683 * 6.283185482025146484375;
    float _1773 = sin(_1771);
    float _1775 = float(uint(_1751));
    float _1777 = fma(_1301, _1427, _1755);
    int _1779 = ~_1707;
    int _1781 = _1779 + _1769;
    int _1783 = _1781 + 1;
    if (!_768)
    {
        _1745 = _1491;
    }
    float _1785 = _1745;
    float _1787 = as_type<float>(_914) * _1775;
    float _1789 = _1785;
    if (_768)
    {
        _1789 = _1765;
    }
    float _1791 = _1789;
    float _1793 = _1683 * 6.283185482025146484375;
    float _1795 = cos(_1793);
    int _1797 = _740 * _1783;
    int _1799 = _1797 + _1565;
    float _1801 = _1719 * _1741;
    float _1803 = _1709 * _1741;
    float _1805 = _1705 * _1741;
    float _1807 = fma(_1335, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1777);
    bool _1809 = !_1437;
    int _1811 = _1809 ? _1799 : (-1);
    float _1813 = _1757 * 6.283185482025146484375;
    float _1815 = cos(_1813);
    float _1817 = _1723 * _1773;
    int _1819 = _1811 >> 31;
    float _1821 = _1687 * _1773;
    int _1823 = _1811 & 3;
    bool _1825 = _1823 != 0;
    int _1827 = ~_740;
    int _1829 = _1827 + 1;
    float _1831 = _1757 * 6.283185482025146484375;
    float _1833 = sin(_1831);
    float _1835 = _1723 * _1795;
    float _1837 = _1687 * _1795;
    float _1839 = _1687 * _1815;
    int _1841 = _1819 & 3;
    float _1843 = _1723 * _1815;
    float _1845 = -_1801;
    float _1847 = _1513 * _1845;
    float _1849 = trunc(_1787);
    float _1851 = precise::max(_1849, 0.0);
    uint _1853 = uint(_1851);
    int _1855 = _1811 + _1841;
    float _1857 = _1773 * _1815;
    float _1859 = -_1803;
    float _1861 = -_1847;
    float _1863 = fma(_1515, _1859, _1861);
    float _1865 = -_1803;
    float _1867 = _1523 * _1865;
    int _1869 = _1855 >> 2;
    float _1871 = _1795 * _1815;
    float _1873 = _1839 * _946;
    float _1875 = -_1867;
    float _1877 = fma(_1513, _1805, _1875);
    int _1879 = _1869 << 4;
    int _1881 = _1879 + 368;
    float _1883 = _1515 * _1805;
    uint _1885 = uint(int(uint(_1881) >> uint(2)));
    uint _1887 = uint(int(uint(int(_1885)) >> uint(2)));
    int _1889 = int(_1885) & 3;
    float _1891 = (*spvDescriptorSet0.vp_c9)._m0[int(_1887)][_1889];
    int _1893 = int(_1885) + 1;
    uint _1895 = uint(int(uint(_1893) >> uint(2)));
    int _1897 = _1893 & 3;
    float _1899 = (*spvDescriptorSet0.vp_c9)._m0[int(_1895)][_1897];
    float _1901 = -_1801;
    float _1903 = -_1883;
    float _1905 = fma(_1523, _1901, _1903);
    float _1907 = _1863 * _1863;
    int _1909 = int(_1631) + int(_1853);
    float _1911 = fma(_1833, _1835, _1821);
    float _1913 = fma(_1833, _1821, _1835);
    float _1915 = fma(_1905, _1905, _1907);
    int _1917 = _1811 & 3;
    bool _1919 = _1917 != 0;
    float _1921 = -_1817;
    float _1923 = fma(_1833, _1837, _1921);
    float _1925 = -_1837;
    float _1927 = fma(_1833, _1817, _1925);
    float _1929 = fma(_1877, _1877, _1915);
    bool _1931 = uint(_1917) > 1u;
    int _1933 = _1881 + 8;
    uint _1935 = uint(int(uint(_1933) >> uint(2)));
    uint _1937 = uint(int(uint(int(_1935)) >> uint(2)));
    int _1939 = int(_1935) & 3;
    float _1941 = (*spvDescriptorSet0.vp_c9)._m0[int(_1937)][_1939];
    int _1943 = int(_1935) + 1;
    uint _1945 = uint(int(uint(_1943) >> uint(2)));
    int _1947 = _1943 & 3;
    float _1949 = (*spvDescriptorSet0.vp_c9)._m0[int(_1945)][_1947];
    float _1951 = -_946;
    float _1953 = _1833 * _1951;
    float _1955 = rsqrt(_1929);
    float _1957 = _1843 * _946;
    int _1959 = _1825 ? 0 : 1;
    int _1961 = _1829 * _1909;
    int _1963 = _1961 + _1487;
    bool _1965 = uint(_1917) >= 2u;
    float _1967 = fma(_1871, _944, _1953);
    float _1969 = fma(_1911, _944, _1957);
    float _1971 = fma(_1923, _944, _1873);
    bool _1973 = uint(_1963) >= uint(_740);
    int _1975 = ~_1959;
    int _1977 = _1975 + 1;
    int _1979 = _1977 + 1;
    int _1981 = _1979;
    if (!_1931)
    {
        int _1983 = ~_1959;
        int _1985 = _1983 + 1;
        _1981 = _1985;
    }
    int _1987 = _1981;
    bool _1989 = _1917 != 3;
    float _1991 = _1905 * _1955;
    float _1993 = _1863 * _1955;
    float _1995 = _1877 * _1955;
    int _1997 = _1965 ? 0 : 1;
    float _1999 = _1515 * _1991;
    float _2001 = _1513 * _1993;
    float _2003 = _1523 * _1995;
    int _2005 = abs(_1987);
    float _2007 = -_1999;
    float _2009 = fma(_1513, _1995, _2007);
    float _2011 = -_2001;
    float _2013 = fma(_1523, _1991, _2011);
    float _2015 = -_2003;
    float _2017 = fma(_1515, _1993, _2015);
    int _2019 = ~_1997;
    int _2021 = _2019 + 1;
    int _2023 = _2021 + 1;
    bool _2025 = !_1919;
    int _2027 = _2025 ? 0 : 1;
    int _2029 = _2023;
    if (_1989)
    {
        int _2031 = ~_1997;
        int _2033 = _2031 + 1;
        _2029 = _2033;
    }
    int _2035 = _2029;
    int _2037 = ~_2005;
    int _2039 = _2037 + 1;
    int _2041 = _2039 + 1;
    bool _2043 = _1917 != 3;
    float _2045 = _2009 * _2009;
    int _2047 = abs(_2035);
    int _2049 = _2041 * as_type<int>(_1899);
    int _2051 = abs(_2027);
    float _2053 = fma(_2017, _2017, _2045);
    float _2055 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2057 = int(_2055);
    int _2059 = ~_2051;
    int _2061 = _2059 + 1;
    int _2063 = _2061 + 1;
    float _2065 = fma(_2013, _2013, _2053);
    bool _2067 = !_2043;
    int _2069 = _2067 ? 0 : (-1);
    int _2071 = ~_2047;
    int _2073 = _2071 + 1;
    int _2075 = _2073 + 1;
    int _2077 = _2063 * as_type<int>(_1891);
    int _2079 = _2077 + _2049;
    int _2081 = abs(_2069);
    float _2083 = rsqrt(_2065);
    bool _2085 = !_1973;
    int _2087 = _2085 ? 0 : (-1);
    int _2089 = _2075 * as_type<int>(_1941);
    int _2091 = _2089 + _2079;
    bool _2093 = !_774;
    int _2095 = _2093 ? 0 : 1;
    int _2097 = ~_1909;
    int _2099 = _2097 + _2087;
    int _2101 = _2099 + 1;
    int _2103 = ~_2081;
    int _2105 = _2103 + 1;
    int _2107 = _2105 + 1;
    int _2109 = abs(_2057);
    int _2111 = _740 * _2101;
    int _2113 = _2111 + _1487;
    int _2115 = abs(_2095);
    int _2117 = _2107 * as_type<int>(_1949);
    int _2119 = _2117 + _2091;
    float _2121 = float(uint(_2057));
    float _2123 = _2013 * _2083;
    float _2125 = _2017 * _2083;
    int _2127 = ~_2115;
    int _2129 = _2127 + 1;
    int _2131 = _2129 + 1;
    float _2133 = _2009 * _2083;
    float _2135 = _1513 * _2123;
    float _2137 = fma(_1857, _1021, _1967);
    float _2139 = 1.0 / _2121;
    float _2141 = float(uint(_2109));
    float _2143 = _1515 * _2133;
    float _2145 = -_2135;
    float _2147 = fma(_1515, _2125, _2145);
    int _2149 = _2119 * _2131;
    bool _2151 = !_1437;
    int _2153 = _2151 ? _2113 : (-1);
    float _2155 = _1523 * _2125;
    float _2157 = -_2143;
    float _2159 = fma(_1523, _2123, _2157);
    float _2161 = _2147 * _2147;
    float _2163 = 1.0 / _2141;
    float _2165 = fma(_1927, _1021, _1969);
    float _2167 = fma(_1913, _1021, _1971);
    float _2169 = -_2155;
    float _2171 = fma(_1513, _2133, _2169);
    float _2173 = fma(_2159, _2159, _2161);
    int _2175 = _2153 * _2115;
    int _2177 = _2175 + _2149;
    float _2179 = _1843 * _2125;
    int _2181 = as_type<int>(_2139) + (-2);
    float _2183 = fma(_2171, _2171, _2173);
    float _2185 = _1843 * _2123;
    float _2187 = float(uint(_2177));
    float _2189 = _1911 * _2125;
    float _2191 = rsqrt(_2183);
    int _2193 = abs(_2177);
    float _2195 = _1911 * _2133;
    float _2197 = as_type<float>(_2181) * _2187;
    int _2199 = as_type<int>(_2163) + (-2);
    float _2201 = _1843 * _2133;
    float _2203 = float(uint(_2193));
    float _2205 = _1927 * _2125;
    float _2207 = _1911 * _2123;
    float _2209 = trunc(_2197);
    float _2211 = precise::max(_2209, 0.0);
    uint _2213 = uint(_2211);
    float _2215 = _2125 * _2165;
    float _2217 = as_type<float>(_2199) * _2203;
    float _2219 = _2133 * _2165;
    float _2221 = _1927 * _2123;
    float _2223 = _2123 * _2165;
    float _2225 = _1927 * _2133;
    float _2227 = _2159 * _2191;
    float _2229 = trunc(_2217);
    float _2231 = precise::max(_2229, 0.0);
    uint _2233 = uint(_2231);
    float _2235 = _2147 * _2191;
    float _2237 = _2171 * _2191;
    int _2239 = ~_2057;
    int _2241 = _2239 + 1;
    float _2243 = -_1833;
    float _2245 = fma(_2243, _2227, _2179);
    float _2247 = -_1833;
    float _2249 = fma(_2247, _2235, _2201);
    float _2251 = -_1833;
    float _2253 = fma(_2251, _2237, _2185);
    float _2255 = fma(_1871, _2227, _2189);
    int _2257 = ~_2109;
    int _2259 = _2257 + 1;
    float _2261 = fma(_1871, _2235, _2195);
    float _2263 = fma(_1871, _2237, _2207);
    int _2265 = _2241 * int(_2213);
    int _2267 = _2265 + _2177;
    float _2269 = fma(_2227, _2137, _2215);
    float _2271 = fma(_2235, _2137, _2219);
    float _2273 = fma(_2237, _2137, _2223);
    int _2275 = _2259 * int(_2233);
    int _2277 = _2275 + _2193;
    float _2279 = float(uint(_2267));
    float _2281 = fma(_1857, _2227, _2205);
    float _2283 = fma(_1857, _2235, _2225);
    float _2285 = fma(_1857, _2237, _2221);
    float _2287 = float(uint(_2277));
    float _2289 = as_type<float>(_2181) * _2279;
    float _2291 = fma(_1513, _2167, _2269);
    float _2293 = fma(_1515, _2167, _2273);
    float _2295 = fma(_1839, _1513, _2245);
    float _2297 = as_type<float>(_2199) * _2287;
    float _2299 = trunc(_2289);
    float _2301 = precise::max(_2299, 0.0);
    uint _2303 = uint(_2301);
    float _2305 = _1037 + _2291;
    float _2307 = _1065 + _2293;
    float _2309 = fma(_1839, _1523, _2249);
    float _2311 = fma(_1839, _1515, _2253);
    float _2313 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2315 = _2305 + _2313;
    float _2317 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2319 = _2307 + _2317;
    float _2321 = fma(_1923, _1513, _2255);
    float _2323 = fma(_1923, _1523, _2261);
    float _2325 = trunc(_2297);
    float _2327 = precise::max(_2325, 0.0);
    uint _2329 = uint(_2327);
    float _2331 = _2315 * _2315;
    float _2333 = _2319 * _2319;
    float _2335 = fma(_1923, _1515, _2263);
    int _2337 = ~_2057;
    int _2339 = _2337 + 1;
    float _2341 = fma(_1913, _1513, _2281);
    float _2343 = _2331 + _2333;
    int _2345 = int(_2213) + int(_2303);
    float _2347 = fma(_1913, _1515, _2285);
    float _2349 = fma(_1913, _1523, _2283);
    float _2351 = sqrt(_2343);
    int _2353 = ~_2109;
    int _2355 = _2353 + 1;
    int _2357 = _2339 * _2345;
    int _2359 = _2357 + _2177;
    float _2361 = fma(_1523, _2167, _2271);
    float _2363 = _2311 * _1373;
    float _2365 = _2309 * _1373;
    int _2367 = int(_2233) + int(_2329);
    float _2369 = _2295 * _1373;
    bool _2371 = uint(_2359) >= uint(_2057);
    float _2373 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2375 = _2057 == 0;
    int _2377 = _2355 * _2367;
    int _2379 = _2377 + _2193;
    bool _2381 = !_2371;
    int _2383 = _2381 ? 0 : (-1);
    float _2385 = _1009 + _2361;
    float _2387 = fma(_2321, _1393, _2369);
    bool _2389 = _2351 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2391 = fma(_2323, _1393, _2365);
    bool _2393 = uint(_2379) >= uint(_2109);
    float _2395 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2397 = _2177 ^ _2057;
    int _2399 = ~_2345;
    int _2401 = _2399 + _2383;
    int _2403 = _2401 + 1;
    bool _2405 = !_2393;
    float _2407 = _2405 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    uint _2409 = uint(int(uint(_2397) >> uint(31)));
    int _2411 = _2057 * _2403;
    int _2413 = _2411 + _2177;
    bool _2415 = _2057 == 0;
    int _2417 = ~as_type<int>(_2407);
    int _2419 = _2367 + _2417;
    int _2421 = _2419 + 1;
    int _2423 = ~int(_2409);
    int _2425 = _2423 + 1;
    float _2427 = as_type<float>(_2409);
    float _2429 = _2407;
    float _2431 = as_type<float>(_2177);
    float _2433 = _2331;
    float _2435 = _2333;
    if (!_2389)
    {
        _2427 = _2305;
    }
    float _2437 = _2427;
    float _2439 = _2437;
    if (!_2389)
    {
        _2429 = _2307;
    }
    float _2441 = _2429;
    int _2443 = _2421 ^ _2425;
    float _2445 = _2441;
    if (!_2389)
    {
        _2431 = _2385;
    }
    float _2447 = _2431;
    bool _2449 = !_2389;
    float _2451 = _2447;
    if (!_2449)
    {
        float _2453 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2455 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2457 = _2351 + _2455;
        float _2459 = _2385 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2461 = rsqrt(_2343);
        float _2463 = _2457 * _2453;
        float _2465 = _2463 * 0.15915493667125701904296875;
        float _2467 = _2465 * 6.283185482025146484375;
        float _2469 = sin(_2467);
        float _2471 = _2465 * 6.283185482025146484375;
        float _2473 = cos(_2471);
        float _2475 = fma(_2469, _2459, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2477 = _2461 * _2475;
        float _2479 = fma(_2315, _2477, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2481 = _2473 + (-1.0);
        float _2483 = fma(_2319, _2477, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2485 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2487 = _2479 + _2485;
        float _2489 = _2481 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2491 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2493 = _2483 + _2491;
        float _2495 = _2487 * _2487;
        float _2497 = fma(_2385, _2473, _2489);
        float _2499 = _2493 * _2493;
        _2451 = _2497;
        _2433 = _2495;
        _2435 = _2499;
        _2439 = _2479;
        _2445 = _2483;
    }
    float _2501 = _2451;
    float _2503 = _2433;
    float _2505 = _2435;
    float _2507 = _2439;
    float _2509 = _2445;
    bool _2511 = !_2375;
    int _2513 = _2511 ? _2413 : (-1);
    float _2515 = _2373 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2517 = ~_2425;
    int _2519 = _2517 + _2443;
    int _2521 = _2519 + 1;
    float _2523 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2525 = _2501 + _2523;
    float _2527 = float(_2513);
    float _2529 = in.m_65.z;
    bool _2531 = !_2415;
    int _2533 = _2531 ? _2521 : (-1);
    float _2535 = fma(_2525, _2525, _2503);
    float _2537 = _2395 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2539 = fma(_2515, _2527, _932);
    float _2541 = fma(_2515, _1791, -0.5);
    float _2543 = in.m_65.w;
    float _2545 = float(_2533);
    float _2547 = _2535 + _2505;
    float _2549 = fma(_1101, _2541, _2539);
    float _2551 = fma(_2537, _790, -0.5);
    float _2553 = -_956;
    float _2555 = fma(_2537, _2545, _2553);
    float _2557 = sqrt(_2547);
    float _2559 = fma(_2335, _1393, _2363);
    float _2561 = fma(_1083, _2551, _2555);
    float _2563 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2565 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2567 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2569 = fma(_2341, _1377, _2387);
    float _2571 = fma(_2349, _1377, _2391);
    float _2573 = _2563 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2575 = _2565 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2577 = _2567 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2579 = _1807 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2581 = _2549 + 0.5;
    float _2583 = _2561 + 0.5;
    float _2585 = fma(_2347, _1377, _2559);
    out.m_67.z = _2529;
    bool _2587 = _2557 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2589 = isnan(_2557);
    bool _2591 = _2587 || _2589;
    bool _2593 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2595 = _2591 || _2593;
    out.m_67.w = _2543;
    out.m_75.x = _2573;
    out.m_75.y = _2575;
    out.m_75.z = _2577;
    out.m_75.w = _2579;
    out.m_77.x = _2581;
    out.m_77.y = _2583;
    float _2597 = _2545;
    if (!_2595)
    {
        _2597 = 1.0;
    }
    float _2599 = _2597;
    out.m_79.x = _2569;
    out.m_79.y = _2571;
    out.m_79.z = _2585;
    bool _2601 = !_2595;
    float _2603 = _2599;
    if (!_2601)
    {
        bool _2605 = _2557 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2607 = isnan(_2557);
        bool _2609 = _2605 || _2607;
        bool _2611 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2613 = _2609 || _2611;
        if (!_2613)
        {
            float _2615 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2617 = _2557 + _2615;
            float _2619 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2621 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2619;
            float _2623 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2625 = _2623 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2627 = 1.0 / _2621;
            float _2629 = _2617 * _2627;
            float _2631 = fma(_2629, _2625, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2603 = _2631;
            _2633 = true;
        }
        else
        {
            bool _2635 = _2557 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2637 = isnan(_2557);
            bool _2639 = _2635 || _2637;
            bool _2641 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2643 = _2639 || _2641;
            if (!_2643)
            {
                float _2645 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2647 = _2557 + _2645;
                float _2649 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2651 = _2649 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2653 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2655 = _2653 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2657 = 1.0 / _2651;
                float _2659 = _2647 * _2657;
                float _2661 = fma(_2659, _2655, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2603 = _2661;
                _2633 = true;
            }
            else
            {
                _2603 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2633 = false;
    float _2663 = _2603;
    float _2665 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2667 = _2501 + _2665;
    float _2669 = _1009 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2671 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2673 = _2507 + _2671;
    float _2675 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2677 = _2509 + _2675;
    float _2679 = fma(_2667, _2663, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2681 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2669);
    float _2683 = fma(_2673, _2663, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2685 = fma(_2677, _2663, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2687 = -_1009;
    float _2689 = _2687 + _2679;
    float _2691 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2681);
    float _2693 = -_1037;
    float _2695 = _2693 + _2683;
    float _2697 = _1009 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2699 = _2689 * _2689;
    float _2701 = _2691 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2703 = -_1065;
    float _2705 = _2703 + _2685;
    float _2707 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2697);
    float _2709 = fma(_2695, _2695, _2699);
    float _2711 = 1.0 / _2701;
    float _2713 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2707);
    float _2715 = fma(_2705, _2705, _2709);
    float _2717 = _2713 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2719 = sqrt(_2715);
    float _2721 = _2717 + _2701;
    float _2723 = _2721 * _2711;
    float _2725 = _2723 * 0.5;
    float _2727 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2729 = fma(_2725, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2727);
    bool _2731 = _2719 > 0.0;
    float _2733 = 1.0 / _2729;
    bool _2735 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2737 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2739 = _2735 || _2737;
    bool _2741 = isnan(0.5);
    bool _2743 = _2739 || _2741;
    bool _2745 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2747 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2749 = _2745 || _2747;
    bool _2751 = isnan(0.5);
    bool _2753 = _2749 || _2751;
    float _2755 = _2701;
    float _2757 = _2691;
    float _2759 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _2761 = _2683;
    float _2763 = _2685;
    float _2765 = _2679;
    if (!_2731)
    {
        _2755 = _2683;
    }
    float _2767 = _2755;
    float _2769 = _2767;
    float _2771 = _2767;
    if (!_2731)
    {
        _2757 = _2679;
    }
    float _2773 = _2757;
    float _2775 = _2773;
    float _2777 = _2773;
    if (!_2731)
    {
        _2759 = _2685;
    }
    float _2779 = _2759;
    bool _2781 = !_2731;
    float _2783 = _2779;
    if (!_2781)
    {
        float _2785 = _188 * _188;
        float _2787 = fma(_186, _186, _2785);
        float _2789 = rsqrt(_2715);
        float _2791 = fma(_190, _190, _2787);
        float _2793 = sqrt(_2791);
        float _2795 = _2695 * _2789;
        float _2797 = _2689 * _2789;
        float _2799 = _2705 * _2789;
        bool _2801 = _2793 > 0.0;
        float _2803 = _2789;
        if (!_2801)
        {
            _2769 = _2683;
        }
        float _2805 = _2769;
        _2771 = _2805;
        if (!_2801)
        {
            _2775 = _2679;
        }
        float _2807 = _2775;
        _2777 = _2807;
        if (!_2801)
        {
            _2803 = _2685;
        }
        float _2809 = _2803;
        bool _2811 = !_2801;
        _2783 = _2809;
        if (!_2811)
        {
            float _2813 = rsqrt(_2791);
            float _2815 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2817 = _188 * _2813;
            float _2819 = _186 * _2813;
            float _2821 = _190 * _2813;
            float _2823 = _2797 * _2817;
            float _2825 = fma(_2795, _2819, _2823);
            float _2827 = _2815 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2829 = fma(_2799, _2821, _2825);
            float _2831 = _2829 * _2827;
            float _2833 = fma(_186, _2831, _2683);
            float _2835 = fma(_188, _2831, _2679);
            float _2837 = fma(_190, _2831, _2685);
            _2783 = _2837;
            _2771 = _2833;
            _2777 = _2835;
        }
    }
    float _2839 = _2783;
    float _2841 = _2771;
    float _2843 = _2777;
    float _2845 = _2843;
    float _2847 = _2841;
    if (_2743)
    {
        _194 = 1.0;
    }
    float _2849 = _194;
    float _2851 = _2849;
    if (_2753)
    {
        _196 = _2839;
    }
    float _2853 = _196;
    float _2855 = _2853;
    if (!_2753)
    {
        float _2857 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2859 = _1009 + _2857;
        float _2861 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2863 = _1037 + _2861;
        float _2865 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2867 = -_1037;
        float _2869 = _2867 + _2841;
        float _2871 = _2859 * _2859;
        float _2873 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2875 = _1065 + _2873;
        float _2877 = -_1065;
        float _2879 = _2877 + _2839;
        float _2881 = fma(_2863, _2863, _2871);
        float _2883 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2885 = fma(_2875, _2875, _2881);
        float _2887 = sqrt(_2885);
        float _2889 = _2865 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2891 = precise::min(_2887, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2893 = _2891 * _2883;
        float _2895 = -_1009;
        float _2897 = _2895 + _2843;
        float _2899 = _2889 * _2893;
        float _2901 = fma(_2897, _2899, _1009);
        float _2903 = fma(_2869, _2899, _1037);
        float _2905 = fma(_2879, _2899, _1065);
        _2845 = _2901;
        _2847 = _2903;
        _2855 = _2905;
    }
    float _2907 = _2845;
    float _2909 = _2847;
    float _2911 = _2855;
    if (_2743)
    {
        _2761 = 1.0;
    }
    float _2913 = _2761;
    float _2915 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2917 = _2733 * _2915;
    float _2919 = _2913;
    if (!_2743)
    {
        float _2921 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2923 = _2921 * 0.15915493667125701904296875;
        float _2925 = _2923 * 6.283185482025146484375;
        float _2927 = cos(_2925);
        float _2929 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2931 = _2929 * 0.15915493667125701904296875;
        float _2933 = _2923 * 6.283185482025146484375;
        float _2935 = sin(_2933);
        float _2937 = 1.0 / _2927;
        float _2939 = _2931 * 6.283185482025146484375;
        float _2941 = cos(_2939);
        float _2943 = _2935 * _2937;
        float _2945 = _2931 * 6.283185482025146484375;
        float _2947 = sin(_2945);
        float _2949 = _2941 * _2943;
        float _2951 = 1.0 / _2949;
        float _2953 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2955 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2953;
        float _2957 = 1.0 / _2955;
        float _2959 = _2947 * _2951;
        float _2961 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2963 = fma(_2917, _2959, _2961);
        float _2965 = _2963 * _2957;
        float _2967 = precise::clamp(_2965, 0.0, 1.0);
        _2851 = _2967;
    }
    float _2969 = _2851;
    if (!_2743)
    {
        float _2971 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2973 = _2971 * 0.15915493667125701904296875;
        float _2975 = _2973 * 6.283185482025146484375;
        float _2977 = cos(_2975);
        float _2979 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2981 = _2979 * 0.15915493667125701904296875;
        float _2983 = _2973 * 6.283185482025146484375;
        float _2985 = sin(_2983);
        float _2987 = 1.0 / _2977;
        float _2989 = _2981 * 6.283185482025146484375;
        float _2991 = cos(_2989);
        float _2993 = _2985 * _2987;
        float _2995 = _2981 * 6.283185482025146484375;
        float _2997 = sin(_2995);
        float _2999 = _2991 * _2993;
        float _3001 = 1.0 / _2999;
        float _3003 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3005 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3003;
        float _3007 = 1.0 / _3005;
        float _3009 = _2997 * _3001;
        float _3011 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3013 = fma(_2917, _3009, _3011);
        float _3015 = _3013 * _3007;
        float _3017 = precise::clamp(_3015, 0.0, 1.0);
        float _3019 = -_3017;
        float _3021 = _3019 + 1.0;
        _2763 = _3001;
        _2919 = _3021;
    }
    float _3023 = _2763;
    float _3025 = _2919;
    float _3027 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3029 = _2907 + _3027;
    float _3031 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3033 = _2909 + _3031;
    float _3035 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3037 = _2911 + _3035;
    float _3039 = _3029 * _3029;
    float _3041 = fma(_3033, _3033, _3039);
    float _3043 = fma(_1037, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3045 = fma(_3037, _3037, _3041);
    float _3047 = rsqrt(_3045);
    float _3049 = sqrt(_3045);
    float _3051 = _3047 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3053 = _3033 * _3051;
    float _3055 = _3037 * _3051;
    float _3057 = _3053 * _3053;
    float _3059 = _3055 * _3055;
    float _3061 = _3057 + _3059;
    float _3063 = sqrt(_3061);
    bool _3065 = _3063 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3067 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3069 = _3063 + _3067;
    float _3071 = _3047;
    float _3073 = _3069;
    float _3075 = _3029;
    float _3077 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_3065)
    {
        float _3079 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3071 = _3079;
    }
    float _3081 = _3071;
    float _3083 = _3081;
    if (_3065)
    {
        float _3085 = _3069 * _3081;
        _3073 = _3085;
    }
    float _3087 = _3073;
    if (_3065)
    {
        float _3089 = rsqrt(_3061);
        _3083 = _3089;
    }
    float _3091 = _3083;
    float _3093 = _3091;
    if (_3065)
    {
        float _3095 = _3087 * 0.15915493667125701904296875;
        _2765 = _3095;
    }
    float _3097 = _2765;
    float _3099 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3101 = _3037;
    float _3103 = _3097;
    if (_3065)
    {
        float _3105 = _3097 * 6.283185482025146484375;
        float _3107 = sin(_3105);
        _3101 = _3107;
    }
    float _3109 = _3101;
    float _3111 = precise::max(0.0, _3099);
    float _3113 = _3023;
    float _3115 = _3111;
    if (_3065)
    {
        float _3117 = _3097 * 6.283185482025146484375;
        float _3119 = cos(_3117);
        _3113 = _3119;
    }
    float _3121 = _3113;
    float _3123 = -_3051;
    float _3125 = -_3111;
    float _3127 = fma(_3029, _3123, _3125);
    if (_3065)
    {
        float _3129 = _3127 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3075 = _3129;
    }
    float _3131 = _3075;
    float _3133 = _3109;
    float _3135 = _3131;
    if (_3065)
    {
        float _3137 = fma(_3109, _3131, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3133 = _3137;
    }
    float _3139 = _3133;
    float _3141 = _3139;
    if (!_3065)
    {
        _3135 = _3127;
    }
    float _3143 = _3135;
    float _3145 = _3143;
    if (_3065)
    {
        float _3147 = _3091 * _3139;
        _3077 = _3147;
    }
    float _3149 = _3077;
    if (!_3065)
    {
        _3093 = _3053;
    }
    float _3151 = _3093;
    float _3153 = _3151;
    float _3155 = _3121;
    if (_3065)
    {
        float _3157 = _3121 + (-1.0);
        _3115 = _3157;
    }
    float _3159 = _3115;
    float _3161 = _3159;
    if (_3065)
    {
        float _3163 = _3053 * _3149;
        _3153 = _3163;
    }
    float _3165 = _3153;
    if (!_3065)
    {
        _3141 = _3057;
    }
    float _3167 = _3141;
    float _3169 = _3167;
    if (_3065)
    {
        float _3171 = _3159 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3103 = _3171;
    }
    float _3173 = _3103;
    if (!_3065)
    {
        _3161 = _3055;
    }
    float _3175 = _3161;
    float _3177 = _3175;
    if (_3065)
    {
        float _3179 = _3055 * _3149;
        _3177 = _3179;
    }
    float _3181 = _3177;
    if (_3065)
    {
        float _3183 = _3165 * _3165;
        _3169 = _3183;
    }
    float _3185 = _3169;
    if (_3065)
    {
        float _3187 = fma(_3127, _3121, _3173);
        _3145 = _3187;
    }
    float _3189 = _3145;
    if (!_3065)
    {
        _3155 = _3059;
    }
    float _3191 = _3155;
    float _3193 = _3191;
    if (_3065)
    {
        float _3195 = _3181 * _3181;
        _3193 = _3195;
    }
    float _3197 = _3193;
    float _3199 = fma(_3189, _3189, _3185);
    float _3201 = _2907 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3203 = floor(_3043);
    float _3205 = _3199 + _3197;
    float _3207 = fma(_2909, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3201);
    float _3209 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3211 = fma(_3049, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3209);
    float _3213 = precise::clamp(_3211, 0.0, 1.0);
    float _3215 = fma(_1065, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3217 = fma(_2911, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3207);
    float _3219 = -_3213;
    float _3221 = _3219 + 1.0;
    float _3223 = rsqrt(_3205);
    float _3225 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3227 = _3217 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3229 = _2907 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3231 = _3227 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3233 = abs(_3221);
    float _3235 = log2(_3233);
    float _3237 = _2907 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3239 = -_3231;
    float _3241 = fma(_3239, _3225, 1.0);
    float _3243 = _2907 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3245 = -_3203;
    float _3247 = _3043 + _3245;
    float _3249 = fma(_2909, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3237);
    float _3251 = _3223 * _3189;
    float _3253 = fma(_2909, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3243);
    float _3255 = fma(_2911, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3249);
    float _3257 = _3223 * _3165;
    float _3259 = _3223 * _3181;
    float _3261 = fma(_2911, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3253);
    float _3263 = _3255 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3265 = _3257 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3267 = fma(_2909, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3229);
    float _3269 = _3261 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3271 = _3263 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3273 = -_3265;
    float _3275 = fma(_3251, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3273);
    float _3277 = fma(_2911, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3267);
    float _3279 = _3235 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3281 = fma(_3269, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3271);
    float _3283 = -_3259;
    float _3285 = fma(_3283, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3275);
    float _3287 = _3277 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3289 = floor(_3215);
    float _3291 = fma(_3227, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3281);
    float _3293 = fma(_3285, -0.5, 0.5);
    float _3295 = _3263 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3297 = fma(_3285, 0.5, 0.5);
    float _3299 = fma(_3287, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3291);
    float _3301 = _3263 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3303 = exp2(_3279);
    float _3305 = fma(_3269, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3295);
    float _3307 = fma(_3269, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3301);
    float _3309 = _3251 + 1.0;
    float _3311 = fma(_3297, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3313 = fma(_3227, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3307);
    float _3315 = sqrt(_3293);
    float _3317 = -_3289;
    float _3319 = _3215 + _3317;
    float _3321 = fma(_3297, _3311, -0.212114393711090087890625);
    float _3323 = fma(_3297, _3321, 1.570728778839111328125);
    float _3325 = log2(_3241);
    float _3327 = fma(_3227, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3305);
    float _3329 = -_3251;
    float _3331 = fma(_3303, _3309, _3329);
    float _3333 = fma(_3287, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3327);
    float _3335 = fma(_3287, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3313);
    float _3337 = 1.0 / _3299;
    float _3339 = _3315 * 0.636619746685028076171875;
    float2 _8895 = float2(_3247, _3319);
    float _3341 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8895, float2(0.0), isnan(_8895)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8895, float2(0.0), isnan(_8895)), level(0.0)).x;
    float _3343 = fma(_3331, 0.5, 0.5);
    float _3345 = _3325 * 0.693147182464599609375;
    float _3347 = _3333 * _3337;
    float _3349 = _3335 * _3337;
    float _3351 = -_3323;
    float _3353 = fma(_3339, _3351, 1.0);
    float _3355 = _3345 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3357 = fma(_3347, 0.5, 0.5);
    float _3359 = fma(_3349, -0.5, 0.5);
    float3 _8930 = float3(_3357, _3359, _3355);
    float _3361 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8930, float3(0.0), isnan(_8930)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8930, float3(0.0), isnan(_8930)), level(0.0)).x;
    float3 _8941 = float3(_3357, _3359, _3355);
    float4 _3364 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8941, float3(0.0), isnan(_8941)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8941, float3(0.0), isnan(_8941)), level(0.0)).xyzw;
    float _3366 = _3364.x;
    float _3368 = _3364.y;
    float _3370 = _3364.z;
    float _3372 = _3364.w;
    float2 _8957 = float2(_3353, _3343);
    float3 _3376 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8957, float2(0.0), isnan(_8957)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8957, float2(0.0), isnan(_8957)), level(0.0)).xyz;
    float _3378 = _3376.x;
    float _3380 = _3376.y;
    float _3382 = _3376.z;
    float _3384 = abs(_2917);
    float _3386 = log2(_3384);
    float _3388 = _3235 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3390 = _3263 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3392 = _3049 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3394 = isnan(_3049);
    bool _3396 = _3392 || _3394;
    bool _3398 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3400 = _3396 || _3398;
    float _3402 = exp2(_3388);
    float _3404 = fma(_3269, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3390);
    bool _3406 = _2917 <= 8000.0;
    bool _3408 = isnan(_2917);
    bool _3410 = _3406 || _3408;
    bool _3412 = isnan(8000.0);
    bool _3414 = _3410 || _3412;
    float _3416 = float(_3414);
    float _3418 = in.m_81.x;
    float _3420 = fma(_3227, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3404);
    float _3422 = _3299 * 0.5;
    float _3424 = _3386 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3426 = fma(_3287, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3420);
    float _3428 = _3333 + _3299;
    float _3430 = exp2(_3424);
    float _3432 = _3428 * 0.5;
    float _3434 = -_3402;
    float _3436 = _3434 + 1.0;
    out.gl_Position.x = _3333;
    out.gl_Position.y = _3335;
    out.gl_Position.z = _3426;
    out.gl_Position.w = _3299;
    float _3438 = _3436 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3440 = fma(_3430, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3442 = precise::clamp(_3440, 0.0, 1.0);
    float _3444 = fma(_3335, -0.5, _3422);
    float _3446 = _2969 * _3025;
    float _3448 = fma(_3442, -2.0, 3.0);
    float _3450 = _3442 * _3442;
    float _3452 = _3335;
    float _3454 = _3299;
    float _3456 = _3426;
    float _3458 = _3446;
    if (!_3400)
    {
        _3452 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3460 = _3452;
    float _3462 = _3450 * _3448;
    float _3464 = -_3462;
    float _3466 = _3464 + 1.0;
    float _3468 = fma(_3466, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3462);
    float _3470 = _3426 + _3299;
    float _3472 = _3460;
    float _3474 = _3460;
    if (!_3400)
    {
        _3454 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3476 = _3454;
    float _3478 = _3416 * _3468;
    float _3480 = _3470 * 0.5;
    float _3482 = _3476;
    float _3484 = _3476;
    if (!_3400)
    {
        _3456 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3486 = _3456;
    float _3488 = _3478 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_83.x = _3432;
    out.m_83.y = _3444;
    out.m_83.z = _3480;
    out.m_83.w = _3299;
    float _3490 = -_3341;
    float _3492 = _3490 + 1.0;
    float _3494 = _3492 * _3488;
    float _3496 = precise::clamp(_3494, 0.0, 1.0);
    float _3498 = -_3496;
    float _3500 = fma(_3498, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3502 = _3500 * _3418;
    float _3504 = _3438 * _3361;
    float _3506 = -_3438;
    float _3508 = _3506 + 1.0;
    float _3510 = _3372 * _3504;
    float _3512 = _3382 * _3504;
    float _3514 = _3372 * _3508;
    float _3516 = fma(_3378, _3510, _3366);
    float _3518 = fma(_3380, _3510, _3368);
    float _3520 = _3502 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3522 = fma(_3372, _3512, _3370);
    float _3524 = _3446 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3526 = _3502;
    float _3528 = _3366;
    float _3530 = _3486;
    float _3532 = _3486;
    if (!_3400)
    {
        _3526 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3534 = _3526;
    out.m_85.x = _3520;
    float _3536 = _3534;
    float _3538 = _3534;
    if (!_3400)
    {
        _3528 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3540 = _3528;
    float _3542 = _3540;
    float _3544 = _3540;
    if (!_3400)
    {
        _3458 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3546 = _3458;
    out.m_87.x = _3516;
    out.m_87.y = _3518;
    out.m_87.z = _3522;
    out.m_87.w = _3514;
    bool _3548 = !_3400;
    float _3550 = _3546;
    float _3552 = _3546;
    if (!_3548)
    {
        bool _3554 = _3049 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3556 = isnan(_3049);
        bool _3558 = _3554 || _3556;
        bool _3560 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3562 = _3558 || _3560;
        if (!_3562)
        {
            float _3564 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3566 = _3049 + _3564;
            float _3568 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3570 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3568;
            float _3572 = 1.0 / _3570;
            float _3574 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3576 = _3574 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3578 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3580 = _3578 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3582 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3584 = _3582 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3586 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3588 = _3586 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3590 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3592 = _3590 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3594 = _3566 * _3572;
            float _3596 = precise::clamp(_3594, 0.0, 1.0);
            float _3598 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3600 = _3598 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3602 = fma(_3596, _3576, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3604 = fma(_3596, _3600, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3606 = fma(_3596, _3580, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3608 = fma(_3596, _3584, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3610 = fma(_3596, _3588, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3612 = fma(_3596, _3592, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3544 = _3604;
            _3474 = _3610;
            _3538 = _3602;
            _3532 = _3608;
            _3484 = _3606;
            _3552 = _3612;
            _3614 = true;
        }
        else
        {
            bool _3616 = _3049 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3618 = isnan(_3049);
            bool _3620 = _3616 || _3618;
            bool _3622 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3624 = _3620 || _3622;
            if (!_3624)
            {
                _3536 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3626 = _3536;
            _3538 = _3626;
            if (!_3624)
            {
                _3542 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3628 = _3542;
            _3544 = _3628;
            if (!_3624)
            {
                _3482 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3630 = _3482;
            _3484 = _3630;
            if (!_3624)
            {
                _3530 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3632 = _3530;
            _3532 = _3632;
            if (!_3624)
            {
                _3472 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3634 = _3472;
            _3474 = _3634;
            if (!_3624)
            {
                _3550 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3636 = _3550;
            bool _3638 = !_3624;
            _3552 = _3636;
            if (!_3638)
            {
                bool _3640 = _3049 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3642 = isnan(_3049);
                bool _3644 = _3640 || _3642;
                bool _3646 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3648 = _3644 || _3646;
                if (!_3648)
                {
                    float _3650 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3652 = _3049 + _3650;
                    float _3654 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3656 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3654;
                    float _3658 = 1.0 / _3656;
                    float _3660 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3662 = _3660 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3664 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3666 = _3664 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3668 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3670 = _3668 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3672 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3674 = _3672 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3676 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3678 = _3676 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3680 = _3652 * _3658;
                    float _3682 = precise::clamp(_3680, 0.0, 1.0);
                    float _3684 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3686 = _3684 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3688 = fma(_3682, _3662, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3690 = fma(_3682, _3686, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3692 = fma(_3682, _3666, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3694 = fma(_3682, _3670, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3696 = fma(_3682, _3674, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3698 = fma(_3682, _3678, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3544 = _3690;
                    _3474 = _3696;
                    _3538 = _3688;
                    _3532 = _3694;
                    _3484 = _3692;
                    _3552 = _3698;
                    _3614 = true;
                }
                else
                {
                    _3544 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3474 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3538 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3532 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3484 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3552 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3614 = false;
    float _3700 = _3544;
    float _3702 = _3474;
    float _3704 = _3538;
    float _3706 = _3532;
    float _3708 = _3484;
    float _3710 = _3552;
    float _3712 = fma(_2571, -0.5, 0.5);
    float _3714 = precise::clamp(_3712, 0.0, 1.0);
    float _3716 = -_3700;
    float _3718 = _3716 + _3702;
    float _3720 = _3524 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3722 = -_3704;
    float _3724 = _3722 + _3706;
    float _3726 = fma(_3714, _3718, _3700);
    out.m_89.x = 0.0;
    float _3728 = -_3708;
    float _3730 = _3728 + _3710;
    float _3732 = fma(_3714, _3724, _3704);
    float _3734 = _3726 * 0.586610972881317138671875;
    out.m_51.x = _3720;
    bool _3736 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3738 = fma(_3714, _3730, _3708);
    float _3740 = fma(_3732, 0.298911988735198974609375, _3734);
    bool _3742 = _2969 > 0.0;
    bool _3744 = isnan(_2969);
    bool _3746 = _3742 || _3744;
    bool _3748 = isnan(0.0);
    bool _3750 = _3746 || _3748;
    float _3752 = fma(_3738, 0.114477999508380889892578125, _3740);
    bool _3754 = _3025 <= 0.0;
    bool _3756 = !_3750;
    bool _3758 = _3754 || _3756;
    float _3760 = -_3752;
    float _3762 = _3732 + _3760;
    float _3764 = -_3752;
    float _3766 = _3726 + _3764;
    float _3768 = -_3752;
    float _3770 = _3738 + _3768;
    float _3772 = fma(_3762, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3752);
    float _3774 = fma(_3766, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3752);
    float _3776 = fma(_3770, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3752);
    bool _3778 = !_3736;
    if (!_3778)
    {
        float _3780 = -_2907;
        float _3782 = _3780 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3784 = -_2909;
        float _3786 = _3784 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3788 = -_2911;
        float _3790 = _3788 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3792 = _3782 * _3782;
        float _3794 = fma(_3786, _3786, _3792);
        float _3796 = fma(_3790, _3790, _3794);
        float _3798 = sqrt(_3796);
        float _3800 = rsqrt(_3796);
        float _3802 = -_3798;
        float _3804 = _3802 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3806 = _3804 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3808 = precise::clamp(_3806, 0.0, 1.0);
        float _3810 = _3786 * _3800;
        float _3812 = _3782 * _3800;
        float _3814 = abs(_3808);
        float _3816 = log2(_3814);
        float _3818 = _3790 * _3800;
        float _3820 = _3810 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3822 = _2571 * _3812;
        float _3824 = -_3812;
        float _3826 = -_3820;
        float _3828 = fma(_3824, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3826);
        float _3830 = fma(_2569, _3810, _3822);
        float _3832 = -_3818;
        float _3834 = fma(_3832, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3828);
        float _3836 = fma(_2585, _3818, _3830);
        float _3838 = precise::clamp(_3836, 0.0, 1.0);
        float _3840 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3842 = _3834 + _3840;
        float _3844 = _3816 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3846 = _3842 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3848 = precise::clamp(_3846, 0.0, 1.0);
        float _3850 = exp2(_3844);
        float _3852 = _3850 * _3848;
        float _3854 = _3838 * _3852;
        float _3856 = _3854 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3858 = _3854 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3860 = _3854 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _3856;
        out.m_89.y = _3858;
        out.m_89.z = _3860;
    }
    out.m_91.x = _3772;
    out.m_91.y = _3774;
    out.m_91.z = _3776;
    if (!_3758)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_51.x = 0.0;
    float _3862 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3862;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

