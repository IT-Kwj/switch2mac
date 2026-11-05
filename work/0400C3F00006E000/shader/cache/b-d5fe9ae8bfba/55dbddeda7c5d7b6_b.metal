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
    float4 m_71 [[user(locn0)]];
    float4 m_65 [[user(locn1)]];
    float4 m_51 [[user(locn2)]];
    float4 m_91 [[user(locn3)]];
    float4 m_63 [[user(locn4)]];
    float4 m_67 [[user(locn5)]];
    float4 m_83 [[user(locn6)]];
    float4 m_73 [[user(locn7)]];
    float4 m_79 [[user(locn8)]];
    float4 m_89 [[user(locn9)]];
    float4 m_85 [[user(locn10)]];
    float4 m_87 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_81 [[attribute(0)]];
    float4 m_69 [[attribute(1)]];
    float4 m_55 [[attribute(2)]];
    float4 m_48 [[attribute(3)]];
    float4 m_53 [[attribute(4)]];
    float4 m_77 [[attribute(5)]];
    float4 m_75 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_59 [[attribute(8)]];
    float4 m_61 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3104 = false;
    bool _2209 = false;
    bool _614 = false;
    bool _488 = false;
    bool _212 = false;
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
        float _3403 = as_type<float>(_126);
        out.gl_Position.z = _3403;
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
    float _146 = 0.0;
    float _148 = _144;
    if (_140)
    {
        float _150 = float(_110);
        _146 = _150;
    }
    float _152 = _146;
    bool _154 = _144 >= _152;
    bool _156 = !_140;
    bool _158 = _154 || _156;
    if (_158)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _120;
    if (_158)
    {
        out.m_51.x = 0.0;
    }
    if (_158)
    {
        float _162 = _160 * 5.0;
        _128 = as_type<int>(_162);
    }
    int _164 = _128;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3472 = as_type<float>(_164);
        out.gl_Position.z = _3472;
    }
    if (_158)
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
    float _210;
    if (!_192)
    {
        float _194 = in.m_57.x;
        float _196 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _198 = _194 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _200 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[12].x, _144);
        float _202 = _200 * _196;
        float _204 = floor(_202);
        float _206 = -_204;
        float _208 = _202 + _206;
        _210 = _208;
        _212 = true;
    }
    else
    {
        float _214 = float(_110);
        float _216 = 1.0 / _214;
        float _218 = _144 * _216;
        _210 = _218;
    }
    _212 = false;
    float _220 = _210;
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _224 = _220 + _222;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _228 = _220 + _226;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _232 = _220 + _230;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _236 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _234;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _240 = _238 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _242;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _248 = _246 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _250 = 1.0 / _240;
    bool _252 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _254 = isnan(_220);
    bool _256 = _252 || _254;
    bool _258 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _260 = _256 || _258;
    float _262 = float(_260);
    float _264 = 1.0 / _244;
    bool _266 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _268 = isnan(_220);
    bool _270 = _266 || _268;
    bool _272 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _274 = _270 || _272;
    float _276 = float(_274);
    bool _278 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _280 = 1.0 / _248;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _284 = _220 + _282;
    float _286 = 1.0 / _236;
    float _288 = _284 * _250;
    bool _290 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _292 = isnan(_220);
    bool _294 = _290 || _292;
    bool _296 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _298 = _294 || _296;
    float _300 = float(_298);
    float _302 = _224 * _264;
    bool _304 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _306 = isnan(_220);
    bool _308 = _304 || _306;
    bool _310 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _312 = _308 || _310;
    float _314 = float(_312);
    float _316 = -_300;
    float _318 = _316 + 1.0;
    float _320 = _228 * _280;
    float _322 = -_276;
    float _324 = _322 + 1.0;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _328 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _326;
    float _330 = _314 * _318;
    float _332 = -_314;
    float _334 = _332 + 1.0;
    bool _336 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _338 = isnan(_220);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    float _348 = fma(_328, _302, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _352 = _350 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _354 = _232 * _286;
    float _356 = _276 * _334;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _358;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _364 = _362 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _366 = _262 * _324;
    float _368 = -_262;
    float _370 = _368 + 1.0;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _374 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _372;
    float _376 = fma(_360, _302, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _380 = _378 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _382 = _346 * _370;
    float _384 = fma(_374, _302, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _386 = fma(_352, _320, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _388 = fma(_364, _320, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _390 = fma(_380, _320, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _392 = _348 * _382;
    float _394 = _376 * _382;
    float _396 = -_346;
    float _398 = _396 + 1.0;
    float _400 = _384 * _382;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _402;
    float _406 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[143].x, _392);
    float _408 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[143].y, _394);
    float _410 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[143].z, _400);
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _412;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _416;
    float _420 = fma(_386, _366, _406);
    float _422 = fma(_388, _366, _408);
    float _424 = fma(_404, _354, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _426 = fma(_390, _366, _410);
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _430 = _428 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _432 = fma(_414, _354, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _434 = fma(_418, _354, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _438 = _436 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _442 = _440 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _444 = fma(_424, _356, _420);
    float _446 = fma(_430, _288, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _448 = fma(_438, _288, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _450 = fma(_442, _288, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _452 = fma(_432, _356, _422);
    float _454 = fma(_434, _356, _426);
    float _456 = fma(_446, _330, _444);
    float _458 = fma(_448, _330, _452);
    float _460 = fma(_450, _330, _454);
    float _462 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[147].x, _456);
    float _464 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[147].y, _458);
    float _466 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[147].z, _460);
    bool _468 = !_278;
    float _486;
    if (!_468)
    {
        float _470 = in.m_57.x;
        float _472 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _474 = _470 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _476 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[11].x, _144);
        float _478 = _476 * _472;
        float _480 = floor(_478);
        float _482 = -_480;
        float _484 = _478 + _482;
        _486 = _484;
        _488 = true;
    }
    else
    {
        float _490 = float(_110);
        float _492 = 1.0 / _490;
        float _494 = _144 * _492;
        _486 = _494;
    }
    _488 = false;
    float _496 = _486;
    float _498 = in.m_59.x;
    float _500 = in.m_59.y;
    float _502 = in.m_59.z;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _506 = _496 + _504;
    bool _508 = _496 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _510 = isnan(_496);
    bool _512 = _508 || _510;
    bool _514 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _516 = _512 || _514;
    float _518 = float(_516);
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _520;
    bool _524 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _526 = 1.0 / _522;
    float _528 = _466 * _502;
    float _530 = _506 * _526;
    float _532 = _464 * _500;
    float _534 = -_518;
    float _536 = _534 + 1.0;
    bool _538 = _496 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _540 = isnan(_496);
    bool _542 = _538 || _540;
    bool _544 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _546 = _542 || _544;
    float _548 = float(_546);
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _552 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _550;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _556 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _554;
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _558;
    float _562 = _462 * _498;
    float _564 = _548 * _536;
    float _566 = fma(_552, _530, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _568 = fma(_560, _530, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _570 = fma(_556, _530, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _572 = -_548;
    float _574 = _572 + 1.0;
    float _576 = _566 * _564;
    float _578 = _568 * _564;
    float _580 = _570 * _564;
    float _582 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[107].x, _576);
    float _584 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[107].y, _578);
    float _586 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[107].z, _580);
    float _588 = fma(_518, (*spvDescriptorSet0.vp_c9)._m0[108].x, _582);
    float _590 = fma(_518, (*spvDescriptorSet0.vp_c9)._m0[108].y, _584);
    float _592 = fma(_518, (*spvDescriptorSet0.vp_c9)._m0[108].z, _586);
    bool _594 = !_524;
    float _612;
    if (!_594)
    {
        float _596 = in.m_57.x;
        float _598 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _600 = _596 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _602 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[11].y, _144);
        float _604 = _602 * _598;
        float _606 = floor(_604);
        float _608 = -_606;
        float _610 = _604 + _608;
        _612 = _610;
        _614 = true;
    }
    else
    {
        float _616 = float(_110);
        float _618 = 1.0 / _616;
        float _620 = _144 * _618;
        _612 = _620;
    }
    _614 = false;
    float _622 = _612;
    float _624 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _626 = int(_624);
    float _628 = in.m_57.x;
    float _630 = in.m_57.y;
    float _632 = in.m_61.y;
    float _634 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _636 = int(_634);
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _642 = _640 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _646 = _644 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _648 = float(_626);
    float _650 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _652 = log2(_650);
    float _654 = float(uint(_636));
    float _656 = 1.0 / _648;
    int _658 = ~_636;
    int _660 = _658 + 1;
    int _662 = ~_636;
    int _664 = _662 + 1;
    int _666 = ~_636;
    int _668 = _666 + 1;
    float _670 = 1.0 / _654;
    float _672 = _656 * _144;
    float _674 = 1.0 / _642;
    int _676 = as_type<int>(_670) + (-2);
    float _678 = trunc(_672);
    int _680 = int(_678);
    float _682 = 1.0 / _646;
    float _684 = float(uint(_680));
    float _686 = as_type<float>(_676) * _684;
    float _688 = trunc(_686);
    float _690 = precise::max(_688, 0.0);
    uint _693 = uint(_690);
    int _695 = ~_636;
    int _697 = _695 + 1;
    int _699 = _660 * int(_693);
    int _701 = _699 + _680;
    float _703 = float(_636);
    float _705 = float(uint(_701));
    float _707 = as_type<float>(_676) * _705;
    float _709 = trunc(_707);
    float _711 = precise::max(_709, 0.0);
    uint _713 = uint(_711);
    int _715 = int(_693) + int(_713);
    float _717 = float(_110);
    int _719 = _697 * _715;
    int _721 = _719 + _680;
    float _723 = float(_680);
    float _725 = 1.0 / _717;
    int _727 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _729 = _727 != 0;
    bool _731 = _723 >= _703;
    bool _733 = isnan(_723);
    bool _735 = _731 || _733;
    bool _737 = isnan(_703);
    bool _739 = _735 || _737;
    float _741 = float(_739);
    bool _743 = !_729;
    float _745 = _743 ? 7.345489978790283203125 : 1.0;
    bool _747 = uint(_721) >= uint(_636);
    float _749 = trunc(_741);
    int _751 = int(_749);
    float _753 = _745 * _628;
    bool _755 = !_747;
    int _757 = _755 ? 0 : (-1);
    bool _759 = _636 == 0;
    int _761 = ~_715;
    int _763 = _761 + _757;
    int _765 = _763 + 1;
    float _767 = floor(_753);
    float _769 = _703 * _144;
    int _771 = _636 * _765;
    int _773 = _771 + _680;
    float _775 = _769 * _725;
    int _777 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _779 = _777 != 0;
    int _781 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _783 = _781 != 0;
    int _785 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _787 = _785 != 0;
    int _789 = ~_751;
    int _791 = _789 + 1;
    int _793 = _791 + 1;
    out.m_63.x = 1.0;
    out.m_63.y = 1.0;
    out.m_63.z = 1.0;
    bool _795 = !_759;
    int _797 = _795 ? _773 : (-1);
    float _799 = trunc(_775);
    int _801 = int(_799);
    float _803 = -_767;
    float _805 = _753 + _803;
    int _807 = _797 * _793;
    int _809 = _636 + (-1);
    float _811 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _813 = _805 * _703;
    bool _815 = !_783;
    int _817 = _815 ? 0 : 1;
    int _819 = _751 * _809;
    int _821 = _819 + _807;
    int _823 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _825 = _823 != 0;
    float _827 = trunc(_813);
    int _829 = int(_827);
    int _831 = abs(_817);
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _835 = 1.0 + _833;
    bool _837 = !_825;
    int _839 = _837 ? 0 : 1;
    int _841 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _843 = _841 != 0;
    bool _845 = !_779;
    int _847 = _845 ? 0 : 1;
    float _849 = 1.0 / _835;
    int _851 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _853 = _851 != 0;
    int _855 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _857 = _855 != 0;
    int _859 = _821 * _831;
    int _861 = abs(_839);
    float _863 = -_632;
    float _865 = _863 + 1.0;
    int _867 = abs(_847);
    bool _869 = _630 > 0.5;
    int _871 = _829 * _861;
    int _873 = _871 + _680;
    bool _875 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _877 = isnan(1.0);
    bool _879 = _875 || _877;
    bool _881 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _883 = _879 || _881;
    int _885 = _801 * _867;
    int _887 = _885 + _859;
    float _889 = _632;
    if (_843)
    {
        float _891 = _869 ? _865 : _632;
        _889 = _891;
    }
    float _893 = _889;
    float _895 = _630 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _897 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _899 = _897 != 0;
    float _901 = in.m_48.x;
    float _903 = in.m_48.y;
    float _905 = in.m_48.z;
    bool _907 = !_787;
    int _909 = _907 ? 0 : 1;
    float _911 = fma(_895, -2.0, _811);
    bool _913 = !_899;
    int _915 = _913 ? 0 : 1;
    float _917 = 0.0;
    if (_853)
    {
        float _919 = in.m_57.x;
        _917 = _919;
    }
    float _921 = _917;
    int _923 = abs(_909);
    float _925 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _927 = _925 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _929 = abs(_915);
    float _931 = _628 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _933 = _873 * _923;
    int _935 = _933 + _887;
    float _937 = 1.0 / _927;
    float _939 = -_638;
    float _941 = fma(_931, 2.0, _939);
    int _943 = _829 * _929;
    int _945 = _943 + _935;
    float _947 = -_144;
    float _949 = fma(_947, (*spvDescriptorSet0.vp_c9)._m0[76].x, _941);
    float _951 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[76].y, _911);
    float _953 = float(uint(_945));
    float _955 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _957 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _959 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _961 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _963 = as_type<float>(_676) * _953;
    float _965 = _903 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _967 = _903 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _969 = _903 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _971 = _652 * _144;
    float _973 = fma(_901, (*spvDescriptorSet0.vp_c10)._m0[4].x, _965);
    float _975 = trunc(_963);
    float _977 = precise::max(_975, 0.0);
    uint _979 = uint(_977);
    float _981 = fma(_901, (*spvDescriptorSet0.vp_c10)._m0[5].x, _967);
    float _983 = fma(_901, (*spvDescriptorSet0.vp_c10)._m0[6].x, _969);
    float _985 = in.m_61.x;
    float _987 = _955 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _989 = _957 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _991 = _959 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _993 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _995 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _993;
    float _997 = in.m_57.z;
    float _999 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1001 = _999 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1003 = exp2(_971);
    float _1005 = _995 * _937;
    float _1007 = _628 * 2.0;
    out.m_65.x = _987;
    out.m_65.y = _989;
    out.m_65.z = _991;
    out.m_65.w = _961;
    float _1009 = _1001 * _674;
    bool _1011 = _921 > 0.5;
    bool _1013 = _1011 && _853;
    float _1015 = _630 + _628;
    float _1017 = fma(_905, (*spvDescriptorSet0.vp_c10)._m0[4].z, _973);
    float _1019 = floor(_1007);
    float _1021 = fma(_905, (*spvDescriptorSet0.vp_c10)._m0[6].z, _983);
    float _1023 = -_1003;
    float _1025 = _1023 + 1.0;
    int _1027 = _664 * int(_979);
    int _1029 = _1027 + _945;
    float _1031 = _630 * 2.0;
    float _1033 = _1015 + (-1.0);
    float _1035 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1037 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1035;
    float _1039 = float(uint(_1029));
    float _1041 = floor(_1031);
    bool _1043 = _1019 >= 0.0;
    bool _1045 = isnan(_1019);
    bool _1047 = _1043 || _1045;
    bool _1049 = isnan(0.0);
    bool _1051 = _1047 || _1049;
    float _1053 = _1037 * _682;
    float _1055 = _630 + _997;
    float _1057 = as_type<float>(_676) * _1039;
    float _1059 = _1039;
    if (_853)
    {
        _1059 = _985;
    }
    float _1061 = _1059;
    float _1063 = fma(_1033, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1065 = _1051 ? 0 : 1;
    float _1067 = _1055 + (-1.0);
    bool _1069 = _1019 > 0.0;
    float _1071 = trunc(_1057);
    float _1073 = precise::max(_1071, 0.0);
    uint _1075 = uint(_1073);
    float _1077 = _1061;
    if (_1013)
    {
        float _1079 = -_1061;
        float _1081 = _1079 + 1.0;
        _1077 = _1081;
    }
    float _1083 = _1077;
    bool _1085 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1087 = isnan(0.0);
    bool _1089 = _1085 || _1087;
    bool _1091 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1093 = _1089 || _1091;
    float _1095 = fma(_1067, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1097 = _1093 ? _1025 : 0.0;
    bool _1099 = _1041 > 0.0;
    bool _1101 = _1041 >= 0.0;
    bool _1103 = isnan(_1041);
    bool _1105 = _1101 || _1103;
    bool _1107 = isnan(0.0);
    bool _1109 = _1105 || _1107;
    float _1111 = _997 * 2.0;
    float _1113 = floor(_1111);
    int _1115 = int(_979) + int(_1075);
    float _1117 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1119 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1121 = fma(_628, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1117);
    float _1123 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1119);
    float _1125 = _1117;
    if (!_853)
    {
        _1125 = _985;
    }
    float _1127 = _1125;
    int _1129 = _668 * _1115;
    int _1131 = _1129 + _945;
    float _1133 = _1127;
    if (_853)
    {
        _1133 = _1083;
    }
    float _1135 = _1133;
    float _1137 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1121);
    float _1139 = float(uint(_873));
    float _1141 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1123);
    if (_883)
    {
        float _1143 = _1097 * _849;
        _148 = _1143;
    }
    float _1145 = _148;
    bool _1147 = uint(_1131) >= uint(_636);
    bool _1149 = _1113 >= 0.0;
    bool _1151 = isnan(_1113);
    bool _1153 = _1149 || _1151;
    bool _1155 = isnan(0.0);
    bool _1157 = _1153 || _1155;
    float _1159 = as_type<float>(_676) * _1139;
    int _1161 = ~_1065;
    int _1163 = _1161 + 1;
    int _1165 = _1163 + 1;
    float _1167 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1169 = _622 + _1167;
    int _1171 = _1165;
    if (!_1069)
    {
        int _1173 = ~_1065;
        int _1175 = _1173 + 1;
        _1171 = _1175;
    }
    int _1177 = _1171;
    int _1179 = _1109 ? 0 : 1;
    float _1181 = trunc(_1159);
    float _1183 = precise::max(_1181, 0.0);
    uint _1185 = uint(_1183);
    bool _1187 = !_1147;
    int _1189 = _1187 ? 0 : (-1);
    float _1191 = fma(_1005, _1169, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    int _1193 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1195 = _1193 != 0;
    int _1197 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1199 = _1197 != 0;
    int _1201 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1203 = _1201 != 0;
    int _1205 = _1157 ? 0 : 1;
    int _1207 = ~_1115;
    int _1209 = _1207 + _1189;
    int _1211 = _1209 + 1;
    float _1213 = fma(_1135, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    bool _1215 = _1113 > 0.0;
    float _1217 = fma(_893, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _1219 = fma(_905, (*spvDescriptorSet0.vp_c10)._m0[5].z, _981);
    int _1221 = _636 * _1211;
    int _1223 = _1221 + _945;
    bool _1225 = _622 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1227 = isnan(_622);
    bool _1229 = _1225 || _1227;
    bool _1231 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1233 = _1229 || _1231;
    float _1235 = float(_1233);
    float _1237 = -_951;
    float _1239 = fma(_1141, _1217, _1237);
    float _1241 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1243 = _622 + _1241;
    int _1245 = ~_636;
    int _1247 = _1245 + 1;
    bool _1249 = !_759;
    int _1251 = _1249 ? _1223 : (-1);
    float _1253 = fma(_1009, _1243, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _1255 = _622 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1257 = isnan(_622);
    bool _1259 = _1255 || _1257;
    bool _1261 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1263 = _1259 || _1261;
    float _1265 = float(_1263);
    int _1267 = _1247 * int(_1185);
    int _1269 = _1267 + _873;
    int _1271 = _1251 >> 31;
    float _1273 = -_1235;
    float _1275 = _1273 + 1.0;
    bool _1277 = _622 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1279 = isnan(_622);
    bool _1281 = _1277 || _1279;
    bool _1283 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1285 = _1281 || _1283;
    float _1287 = float(_1285);
    float _1289 = -_1265;
    float _1291 = _1289 + 1.0;
    int _1293 = _1271 & 3;
    float _1295 = _1265 * _1275;
    float _1297 = float(uint(_1269));
    float _1299 = _1287 * _1291;
    int _1301 = _1251 + _1293;
    float _1303 = -_1287;
    float _1305 = _1303 + 1.0;
    bool _1307 = _622 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1309 = isnan(_622);
    bool _1311 = _1307 || _1309;
    bool _1313 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1315 = _1311 || _1313;
    float _1317 = float(_1315);
    float _1319 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1321 = _622 + _1319;
    int _1323 = _1301 >> 2;
    float _1325 = as_type<float>(_676) * _1297;
    float _1327 = _1317 * _1305;
    int _1329 = _1323 << 4;
    int _1331 = _1329 + 368;
    float _1333 = fma(_1053, _1321, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1335 = -_1317;
    float _1337 = _1335 + 1.0;
    float _1339 = trunc(_1325);
    float _1341 = precise::max(_1339, 0.0);
    uint _1343 = uint(_1341);
    uint _1345 = uint(int(uint(_1331) >> uint(2)));
    uint _1347 = uint(int(uint(int(_1345)) >> uint(2)));
    int _1349 = int(_1345) & 3;
    float _1351 = (*spvDescriptorSet0.vp_c9)._m0[int(_1347)][_1349];
    int _1353 = int(_1345) + 1;
    uint _1355 = uint(int(uint(_1353) >> uint(2)));
    int _1357 = _1353 & 3;
    float _1359 = (*spvDescriptorSet0.vp_c9)._m0[int(_1355)][_1357];
    float _1361 = _1191 * _1327;
    int _1363 = ~_1205;
    int _1365 = _1363 + 1;
    int _1367 = _1365 + 1;
    int _1369 = _1367;
    if (!_1215)
    {
        int _1371 = ~_1205;
        int _1373 = _1371 + 1;
        _1369 = _1373;
    }
    int _1375 = _1369;
    float _1377 = fma(_1337, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1361);
    float _1379 = fma(_1137, _1213, _949);
    bool _1381 = !_1195;
    int _1383 = _1381 ? 0 : 1;
    int _1385 = _1251 & 3;
    bool _1387 = _1385 != 0;
    float _1389 = fma(_1253, _1299, _1377);
    int _1391 = ~_1179;
    int _1393 = _1391 + 1;
    int _1395 = _1393 + 1;
    int _1397 = _1395;
    if (!_1099)
    {
        int _1399 = ~_1179;
        int _1401 = _1399 + 1;
        _1397 = _1401;
    }
    int _1403 = _1397;
    int _1405 = int(_1185) + int(_1343);
    int _1407 = abs(_1383);
    bool _1409 = uint(_1385) > 1u;
    float _1411 = float(_1177);
    int _1413 = _1331 + 8;
    uint _1415 = uint(int(uint(_1413) >> uint(2)));
    uint _1417 = uint(int(uint(int(_1415)) >> uint(2)));
    int _1419 = int(_1415) & 3;
    float _1421 = (*spvDescriptorSet0.vp_c9)._m0[int(_1417)][_1419];
    int _1423 = int(_1415) + 1;
    uint _1425 = uint(int(uint(_1423) >> uint(2)));
    int _1427 = _1423 & 3;
    float _1429 = (*spvDescriptorSet0.vp_c9)._m0[int(_1425)][_1427];
    int _1431 = _1251 & 3;
    bool _1433 = _1431 != 0;
    float _1435 = fma(_1333, _1295, _1389);
    int _1437 = ~_636;
    int _1439 = _1437 + 1;
    float _1441 = _1239 + 0.5;
    int _1443 = _1433 ? 0 : 1;
    float _1445 = fma(_1235, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1435);
    bool _1447 = !_1199;
    int _1449 = _1447 ? 0 : 1;
    int _1451 = _1439 * _1405;
    int _1453 = _1451 + _873;
    int _1455 = ~_1443;
    int _1457 = _1455 + 1;
    int _1459 = _1457 + 1;
    int _1461 = _1459;
    if (!_1409)
    {
        int _1463 = ~_1443;
        int _1465 = _1463 + 1;
        _1461 = _1465;
    }
    int _1467 = _1461;
    bool _1469 = !_1387;
    int _1471 = _1469 ? 0 : 1;
    int _1473 = abs(_1449);
    int _1475 = abs(_1467);
    float _1477 = float(_1375);
    float _1479 = _1379 + 0.5;
    bool _1481 = _1385 != 3;
    int _1483 = abs(_1471);
    float _1485 = float(_1473);
    out.m_67.x = _1479;
    out.m_67.y = _1441;
    bool _1487 = uint(_1453) >= uint(_636);
    float _1489 = _1485 * _1411;
    bool _1491 = uint(_1385) >= 2u;
    int _1493 = ~_1475;
    int _1495 = _1493 + 1;
    int _1497 = _1495 + 1;
    bool _1499 = !_1487;
    int _1501 = _1499 ? 0 : (-1);
    float _1503 = _1219 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1505 = _1491 ? 0 : 1;
    int _1507 = _1497 * as_type<int>(_1359);
    int _1509 = ~_1405;
    int _1511 = _1509 + _1501;
    int _1513 = _1511 + 1;
    float _1515 = _1021 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1517 = ~_1483;
    int _1519 = _1517 + 1;
    int _1521 = _1519 + 1;
    int _1523 = ~_1505;
    int _1525 = _1523 + 1;
    int _1527 = _1525 + 1;
    int _1529 = _636 * _1513;
    int _1531 = _1529 + _873;
    bool _1533 = _1385 != 3;
    int _1535 = _1521 * as_type<int>(_1351);
    int _1537 = _1535 + _1507;
    int _1539 = _1527;
    float _1541 = _1503;
    if (_1481)
    {
        int _1543 = ~_1505;
        int _1545 = _1543 + 1;
        _1539 = _1545;
    }
    int _1547 = _1539;
    float _1549 = in.m_69.x;
    float _1551 = in.m_69.y;
    float _1553 = in.m_69.z;
    bool _1555 = !_1533;
    int _1557 = _1555 ? 0 : (-1);
    float _1559 = _1489 * (-2.0);
    int _1561 = abs(_1547);
    int _1563 = abs(_1557);
    bool _1565 = !_857;
    int _1567 = _1565 ? 0 : 1;
    int _1569 = abs(_1567);
    float _1571 = _1017 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1573 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1575 = _1503 + _1573;
    int _1577 = ~_1561;
    int _1579 = _1577 + 1;
    int _1581 = _1579 + 1;
    float _1583 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1585 = _1571 + _1583;
    float _1587 = float(_1407);
    float _1589 = _1575 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1591 = ~_1563;
    int _1593 = _1591 + 1;
    int _1595 = _1593 + 1;
    int _1597 = _1581 * as_type<int>(_1421);
    int _1599 = _1597 + _1537;
    float _1601 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1603 = _1515 + _1601;
    float _1605 = _1587 * _1477;
    float _1607 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1589);
    int _1609 = _1595 * as_type<int>(_1429);
    int _1611 = _1609 + _1599;
    float _1613 = _1605 * (-2.0);
    float _1615 = fma(_1603, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1607);
    float _1617 = fma(_1559, _1551, _1551);
    int _1619 = ~_1569;
    int _1621 = _1619 + 1;
    int _1623 = _1621 + 1;
    float _1625 = fma(_1063, _1613, _1063);
    float _1627 = _1575 * _1575;
    float _1629 = fma(_1613, _1549, _1549);
    float _1631 = fma(_1095, _1559, _1095);
    float _1633 = _592 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _1635 = _1615 >= 0.0;
    float _1637 = fma(_1585, _1585, _1627);
    int _1639 = _1611 * _1623;
    bool _1641 = !_759;
    int _1643 = _1641 ? _1531 : (-1);
    float _1645 = _590 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1647 = fma(_1603, _1603, _1637);
    float _1649 = _628 + (-0.5);
    float _1651 = _1633 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1653 = _1643 * _1569;
    int _1655 = _1653 + _1639;
    float _1657 = _588 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1659 = _1645 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1661 = rsqrt(_1647);
    float _1663 = _1637;
    float _1665 = _1553;
    if (_1635)
    {
        _1663 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1667 = _1663;
    float _1669 = _1657 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1671 = _1445 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1673 = float(_1655);
    float _1675 = fma(_1649, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1629);
    int _1677 = as_type<int>(_1667);
    if (_1635)
    {
        float _1679 = _1667 * 5.0;
        _1677 = as_type<int>(_1679);
    }
    int _1681 = _1677;
    bool _1683 = !_1203;
    int _1685 = _1683 ? 0 : 1;
    out.m_71.x = _1669;
    out.m_71.y = _1659;
    out.m_71.z = _1651;
    out.m_71.w = _1671;
    float _1687 = fma(_1625, _1145, _1675);
    float _1689 = _630 + (-0.5);
    int _1691 = abs(_1685);
    if (_1635)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5793 = as_type<float>(_1681);
        out.gl_Position.z = _5793;
    }
    float _1693 = float(_1403);
    float _1695 = _1575 * _1661;
    out.m_73.x = _1673;
    float _1697 = _1585 * _1661;
    float _1699 = _1695;
    if (_1635)
    {
        out.m_51.x = 0.0;
    }
    if (_1635)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1701 = -_1695;
    float _1703 = fma(_1701, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1503);
    float _1705 = _1603 * _1661;
    float _1707 = -_1697;
    float _1709 = fma(_1707, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1571);
    float _1711 = float(_1691);
    float _1713 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1715 = _1703 + _1713;
    float _1717 = _1687 * 0.15915493667125701904296875;
    float _1719 = -_1705;
    float _1721 = fma(_1719, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1515);
    float _1723 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1725 = _1709 + _1723;
    float _1727 = _1715 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1729 = fma(_1689, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1617);
    float _1731 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1733 = _1721 + _1731;
    float _1735 = _997 + _628;
    float _1737 = fma(_1725, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1727);
    float _1739 = _1711 * _1693;
    float _1741 = fma(_1631, _1145, _1729);
    float _1743 = fma(_1733, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1737);
    float _1745 = _1735 + (-1.0);
    float _1747 = _1739 * (-2.0);
    float _1749 = -_1695;
    float _1751 = fma(_1749, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1575);
    float _1753 = _997 + (-0.5);
    float _1755 = fma(_1745, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1757 = _1743 >= 0.0;
    float _1759 = fma(_1747, _1553, _1553);
    float _1761 = -_1697;
    float _1763 = fma(_1761, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1585);
    float _1765 = _1751 * _1751;
    float _1767 = fma(_1755, _1747, _1755);
    float _1769 = fma(_1753, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1759);
    float _1771 = -_1705;
    float _1773 = fma(_1771, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1603);
    float _1775 = fma(_1763, _1763, _1765);
    float _1777 = _1741 * 0.15915493667125701904296875;
    float _1779 = fma(_1767, _1145, _1769);
    float _1781 = _1717 * 6.283185482025146484375;
    float _1783 = sin(_1781);
    float _1785 = fma(_1773, _1773, _1775);
    float _1787 = _1715;
    float _1789 = _1709;
    if (_1757)
    {
        _1665 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1791 = _1665;
    int _1793 = as_type<int>(_1791);
    if (_1757)
    {
        out.m_51.x = 0.0;
    }
    float _1795 = _1717 * 6.283185482025146484375;
    float _1797 = cos(_1795);
    if (_1757)
    {
        float _1799 = _1791 * 5.0;
        _1793 = as_type<int>(_1799);
    }
    int _1801 = _1793;
    if (_1757)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5992 = as_type<float>(_1801);
        out.gl_Position.z = _5992;
    }
    float _1803 = _1777 * 6.283185482025146484375;
    float _1805 = sin(_1803);
    float _1807 = _1779 * 0.15915493667125701904296875;
    float _1809 = _1777 * 6.283185482025146484375;
    float _1811 = cos(_1809);
    float _1813 = sqrt(_1785);
    if (_1757)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1815 = in.m_75.x;
    float _1817 = in.m_75.y;
    float _1819 = in.m_75.z;
    float _1821 = _1807 * 6.283185482025146484375;
    float _1823 = cos(_1821);
    float _1825 = _1661 * _1813;
    float _1827 = _532 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1829 = _1797 * _1811;
    float _1831 = _1797 * _1805;
    float _1833 = _1783 * _1805;
    float _1835 = _562 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1837 = _1783 * _1811;
    float _1839 = _1807 * 6.283185482025146484375;
    float _1841 = sin(_1839);
    float _1843 = _1825 * _1835;
    float _1845 = _1797 * _1823;
    float _1847 = _1811 * _1823;
    float _1849 = _1783 * _1823;
    float _1851 = _1805 * _1823;
    float _1853 = _1825 * _1827;
    float _1855 = _528 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1857 = _1845 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1859 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1817);
    float _1861 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1815);
    float _1863 = _1825 * _1855;
    float _1865 = _1845 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1867 = _1859 * _1853;
    float _1869 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1819);
    float _1871 = _1861 * _1843;
    float _1873 = fma(_1841, _1829, _1833);
    float _1875 = _1845 * _1867;
    float _1877 = _1869 * _1863;
    float _1879 = -_1837;
    float _1881 = fma(_1841, _1831, _1879);
    float _1883 = -_1867;
    float _1885 = _1841 * _1883;
    float _1887 = fma(_1873, _1871, _1875);
    float _1889 = -_1831;
    float _1891 = fma(_1841, _1837, _1889);
    float _1893 = _1849 * _1867;
    float _1895 = fma(_1847, _1871, _1885);
    float _1897 = fma(_1881, _1877, _1887);
    float _1899 = fma(_1841, _1833, _1829);
    float _1901 = fma(_1891, _1871, _1893);
    float _1903 = fma(_1851, _1877, _1895);
    float _1905 = _1897 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1907 = _1897 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1909 = fma(_1899, _1877, _1901);
    float _1911 = _1873 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1913 = fma(_1903, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1905);
    float _1915 = fma(_1903, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1907);
    float _1917 = _1845 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1919 = fma(_1847, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1911);
    float _1921 = fma(_1909, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1913);
    float _1923 = fma(_1909, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1915);
    float _1925 = -_1841;
    float _1927 = fma(_1925, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1857);
    float _1929 = -_1841;
    float _1931 = fma(_1929, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1865);
    float _1933 = _1921 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1935 = _1923 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    bool _1937 = _1817 != 0.0;
    bool _1939 = isnan(_1817);
    bool _1941 = _1937 || _1939;
    bool _1943 = isnan(0.0);
    bool _1945 = _1941 || _1943;
    float _1947 = -_1841;
    float _1949 = fma(_1947, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1917);
    float _1951 = _1571 + _1933;
    float _1953 = _1515 + _1935;
    float _1955 = _1873 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1957 = _1873 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1959 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1961 = _1951 + _1959;
    float _1963 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1965 = _1953 + _1963;
    float _1967 = fma(_1847, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1955);
    float _1969 = fma(_1847, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1957);
    float _1971 = _1961 * _1961;
    float _1973 = _1965 * _1965;
    float _1975 = in.m_77.x;
    float _1977 = in.m_77.y;
    float _1979 = in.m_77.z;
    float _1981 = _1897 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _1983 = _1815 == 0.0;
    bool _1985 = !_1945;
    bool _1987 = _1983 && _1985;
    float _1989 = _1971 + _1973;
    float _1991 = _1881 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1993 = fma(_1903, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1981);
    bool _1995 = _1819 == 0.0;
    bool _1997 = _1995 && _1987;
    float _1999 = sqrt(_1989);
    float _2001 = fma(_1891, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1967);
    float _2003 = fma(_1909, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1993);
    float _2005 = _1881 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2007 = _1881 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2009 = fma(_1851, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1991);
    float _2011 = _2003 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2013 = fma(_1851, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2005);
    float _2015 = fma(_1851, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2007);
    float _2017 = fma(_1891, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1919);
    float _2019 = _1503 + _2011;
    float _2021 = fma(_1891, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1969);
    bool _2023 = _1999 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2025 = _1975;
    float _2027 = _1977;
    float _2029 = _1979;
    float _2031 = _1815;
    float _2033 = _1971;
    float _2035 = _1973;
    float _2037 = _1951;
    float _2039 = _1953;
    float _2041 = _1819;
    float _2043 = _1825;
    if (!_1997)
    {
        float _2045 = fma(_1815, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1975);
        _2025 = _2045;
    }
    float _2047 = _2025;
    if (!_1997)
    {
        float _2049 = fma(_1817, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1977);
        _2027 = _2049;
    }
    float _2051 = _2027;
    if (!_1997)
    {
        float _2053 = fma(_1819, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1979);
        _2029 = _2053;
    }
    float _2055 = _2029;
    if (!_2023)
    {
        _2031 = _2019;
    }
    float _2057 = _2031;
    bool _2059 = !_2023;
    float _2061 = _2057;
    if (!_2059)
    {
        float _2063 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2065 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2067 = _1999 + _2065;
        float _2069 = _2019 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2071 = rsqrt(_1989);
        float _2073 = _2067 * _2063;
        float _2075 = _2073 * 0.15915493667125701904296875;
        float _2077 = _2075 * 6.283185482025146484375;
        float _2079 = sin(_2077);
        float _2081 = _2075 * 6.283185482025146484375;
        float _2083 = cos(_2081);
        float _2085 = fma(_2079, _2069, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2087 = _2071 * _2085;
        float _2089 = fma(_1961, _2087, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2091 = _2083 + (-1.0);
        float _2093 = fma(_1965, _2087, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2095 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2097 = _2089 + _2095;
        float _2099 = _2091 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2101 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2103 = _2093 + _2101;
        float _2105 = _2097 * _2097;
        float _2107 = fma(_2019, _2083, _2099);
        float _2109 = _2103 * _2103;
        _2061 = _2107;
        _2033 = _2105;
        _2035 = _2109;
        _2037 = _2089;
        _2039 = _2093;
        _2041 = _2069;
    }
    float _2111 = _2061;
    float _2113 = _2033;
    float _2115 = _2035;
    float _2117 = _2037;
    float _2119 = _2039;
    float _2121 = _2041;
    float _2123 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2125 = _2111 + _2123;
    float _2127 = fma(_1849, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1927);
    float _2129 = fma(_1849, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1931);
    float _2131 = fma(_1849, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1949);
    float _2133 = fma(_2125, _2125, _2113);
    float _2135 = _2127 * _2051;
    float _2137 = _2129 * _2051;
    float _2139 = _2131 * _2051;
    float _2141 = _2133 + _2115;
    float _2143 = fma(_1899, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2009);
    float _2145 = fma(_1899, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2013);
    float _2147 = fma(_2001, _2047, _2135);
    float _2149 = fma(_2017, _2047, _2137);
    float _2151 = fma(_1899, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2015);
    float _2153 = sqrt(_2141);
    float _2155 = fma(_2021, _2047, _2139);
    float _2157 = fma(_2143, _2055, _2147);
    float _2159 = fma(_2145, _2055, _2149);
    float _2161 = fma(_2151, _2055, _2155);
    out.m_79.x = _2157;
    out.m_79.y = _2159;
    out.m_79.z = _2161;
    bool _2163 = _2153 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2165 = isnan(_2153);
    bool _2167 = _2163 || _2165;
    bool _2169 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2171 = _2167 || _2169;
    float _2173 = _2121;
    if (!_2171)
    {
        _2173 = 1.0;
    }
    float _2175 = _2173;
    bool _2177 = !_2171;
    float _2179 = _2175;
    if (!_2177)
    {
        bool _2181 = _2153 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2183 = isnan(_2153);
        bool _2185 = _2181 || _2183;
        bool _2187 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2189 = _2185 || _2187;
        if (!_2189)
        {
            float _2191 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2193 = _2153 + _2191;
            float _2195 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2197 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2195;
            float _2199 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2201 = _2199 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2203 = 1.0 / _2197;
            float _2205 = _2193 * _2203;
            float _2207 = fma(_2205, _2201, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2179 = _2207;
            _2209 = true;
        }
        else
        {
            bool _2211 = _2153 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2213 = isnan(_2153);
            bool _2215 = _2211 || _2213;
            bool _2217 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2219 = _2215 || _2217;
            if (!_2219)
            {
                float _2221 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2223 = _2153 + _2221;
                float _2225 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2227 = _2225 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2229 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2231 = _2229 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2233 = 1.0 / _2227;
                float _2235 = _2223 * _2233;
                float _2237 = fma(_2235, _2231, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2179 = _2237;
                _2209 = true;
            }
            else
            {
                _2179 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2209 = false;
    float _2239 = _2179;
    float _2241 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2243 = _2111 + _2241;
    float _2245 = _1703 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2247 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2249 = _2117 + _2247;
    float _2251 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2253 = _2119 + _2251;
    float _2255 = fma(_2243, _2239, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2257 = fma(_1709, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2245);
    float _2259 = fma(_2249, _2239, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2261 = fma(_2253, _2239, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2263 = -_1503;
    float _2265 = _2263 + _2255;
    float _2267 = fma(_1721, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2257);
    float _2269 = -_1571;
    float _2271 = _2269 + _2259;
    float _2273 = -_1515;
    float _2275 = _2273 + _2261;
    float _2277 = _2265 * _2265;
    float _2279 = _2267 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2281 = _1703 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2283 = fma(_2271, _2271, _2277);
    float _2285 = 1.0 / _2279;
    float _2287 = fma(_1709, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2281);
    float _2289 = fma(_2275, _2275, _2283);
    float _2291 = fma(_1721, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2287);
    float _2293 = sqrt(_2289);
    float _2295 = _2291 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2297 = _2295 + _2279;
    float _2299 = _2297 * _2285;
    float _2301 = _2299 * 0.5;
    bool _2303 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2305 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2307 = _2303 || _2305;
    bool _2309 = isnan(0.5);
    bool _2311 = _2307 || _2309;
    float _2313 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2315 = fma(_2301, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2313);
    bool _2317 = _2293 > 0.0;
    float _2319 = 1.0 / _2315;
    bool _2321 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2323 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2325 = _2321 || _2323;
    bool _2327 = isnan(0.5);
    bool _2329 = _2325 || _2327;
    bool _2331 = !_2317;
    float _2333 = _2255;
    float _2335 = _2259;
    float _2337 = _2261;
    if (!_2331)
    {
        float _2339 = _188 * _188;
        float _2341 = rsqrt(_2289);
        float _2343 = fma(_186, _186, _2339);
        float _2345 = fma(_190, _190, _2343);
        float _2347 = sqrt(_2345);
        float _2349 = _2271 * _2341;
        float _2351 = _2265 * _2341;
        float _2353 = _2275 * _2341;
        bool _2355 = _2347 > 0.0;
        bool _2357 = !_2355;
        if (!_2357)
        {
            float _2359 = rsqrt(_2345);
            float _2361 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2363 = _188 * _2359;
            float _2365 = _186 * _2359;
            float _2367 = _2351 * _2363;
            float _2369 = _190 * _2359;
            float _2371 = fma(_2349, _2365, _2367);
            float _2373 = _2361 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2375 = fma(_2353, _2369, _2371);
            float _2377 = _2375 * _2373;
            float _2379 = fma(_186, _2377, _2259);
            float _2381 = fma(_188, _2377, _2255);
            float _2383 = fma(_190, _2377, _2261);
            _2333 = _2381;
            _2335 = _2379;
            _2337 = _2383;
        }
    }
    float _2385 = _2333;
    float _2387 = _2335;
    float _2389 = _2337;
    float _2391 = -_1695;
    float _2393 = fma(_2391, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2385);
    float _2395 = -_1697;
    float _2397 = fma(_2395, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2387);
    float _2399 = -_1705;
    float _2401 = fma(_2399, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2389);
    float _2403 = _2393;
    float _2405 = _2397;
    float _2407 = _2401;
    if (_2311)
    {
        _1699 = 1.0;
    }
    float _2409 = _1699;
    float _2411 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2413 = _2319 * _2411;
    float _2415 = _2409;
    if (!_2329)
    {
        float _2417 = _1715 * _1715;
        float _2419 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2421 = -_1515;
        float _2423 = _2421 + _2389;
        float _2425 = -_1571;
        float _2427 = _2425 + _2387;
        float _2429 = fma(_1725, _1725, _2417);
        float _2431 = fma(_1733, _1733, _2429);
        float _2433 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2435 = sqrt(_2431);
        float _2437 = 1.0 / _1825;
        float _2439 = _2433 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2441 = precise::min(_2435, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2443 = _2441 * _2419;
        float _2445 = -_1503;
        float _2447 = _2445 + _2385;
        float _2449 = _2443 * _2437;
        float _2451 = _2439 * _2449;
        float _2453 = _2423 * _2449;
        float _2455 = fma(_2447, _2451, _1703);
        float _2457 = fma(_2427, _2451, _1709);
        float _2459 = fma(_2439, _2453, _1721);
        _2403 = _2455;
        _2405 = _2457;
        _2407 = _2459;
        _2043 = _2437;
    }
    float _2461 = _2403;
    float _2463 = _2405;
    float _2465 = _2407;
    float _2467 = _2043;
    float _2469 = _2467;
    if (!_2311)
    {
        float _2471 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2473 = _2471 * 0.15915493667125701904296875;
        float _2475 = _2473 * 6.283185482025146484375;
        float _2477 = cos(_2475);
        float _2479 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2481 = _2479 * 0.15915493667125701904296875;
        float _2483 = _2473 * 6.283185482025146484375;
        float _2485 = sin(_2483);
        float _2487 = 1.0 / _2477;
        float _2489 = _2481 * 6.283185482025146484375;
        float _2491 = cos(_2489);
        float _2493 = _2485 * _2487;
        float _2495 = _2481 * 6.283185482025146484375;
        float _2497 = sin(_2495);
        float _2499 = _2491 * _2493;
        float _2501 = 1.0 / _2499;
        float _2503 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2505 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2503;
        float _2507 = 1.0 / _2505;
        float _2509 = _2497 * _2501;
        float _2511 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2513 = fma(_2413, _2509, _2511);
        float _2515 = _2513 * _2507;
        float _2517 = precise::clamp(_2515, 0.0, 1.0);
        _2469 = _2473;
        _2415 = _2517;
    }
    float _2519 = _2469;
    float _2521 = _2415;
    float _2523 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2525 = _2461 + _2523;
    float _2527 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2529 = _2463 + _2527;
    float _2531 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2533 = _2465 + _2531;
    float _2535 = _2525 * _2525;
    float _2537 = fma(_2529, _2529, _2535);
    float _2539 = fma(_2533, _2533, _2537);
    float _2541 = rsqrt(_2539);
    float _2543 = sqrt(_2539);
    float _2545 = _2541 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2547 = _2529 * _2545;
    float _2549 = _2533 * _2545;
    float _2551 = _2547 * _2547;
    float _2553 = _2549 * _2549;
    float _2555 = _2551 + _2553;
    float _2557 = sqrt(_2555);
    bool _2559 = _2557 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2561 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2563 = _2557 + _2561;
    float _2565 = _2541;
    float _2567 = _2563;
    float _2569 = _2525;
    float _2571 = _2555;
    if (_2559)
    {
        float _2573 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2565 = _2573;
    }
    float _2575 = _2565;
    float _2577 = _2575;
    if (_2559)
    {
        float _2579 = _2563 * _2575;
        _2567 = _2579;
    }
    float _2581 = _2567;
    if (_2559)
    {
        float _2583 = rsqrt(_2555);
        _2577 = _2583;
    }
    float _2585 = _2577;
    float _2587 = _2585;
    if (_2559)
    {
        float _2589 = _2581 * 0.15915493667125701904296875;
        _1787 = _2589;
    }
    float _2591 = _1787;
    float _2593 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2595 = _2533;
    if (_2559)
    {
        float _2597 = _2591 * 6.283185482025146484375;
        float _2599 = sin(_2597);
        _2595 = _2599;
    }
    float _2601 = _2595;
    float _2603 = precise::max(0.0, _2593);
    float _2605 = _2519;
    if (_2559)
    {
        float _2607 = _2591 * 6.283185482025146484375;
        float _2609 = cos(_2607);
        _2605 = _2609;
    }
    float _2611 = _2605;
    float _2613 = -_2545;
    float _2615 = -_2603;
    float _2617 = fma(_2525, _2613, _2615);
    if (_2559)
    {
        float _2619 = _2617 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2569 = _2619;
    }
    float _2621 = _2569;
    float _2623 = fma(_1709, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2625 = _2621;
    if (!_2559)
    {
        _1789 = _2547;
    }
    float _2627 = _1789;
    float _2629 = _2601;
    float _2631 = _2627;
    if (_2559)
    {
        float _2633 = fma(_2601, _2621, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2629 = _2633;
    }
    float _2635 = _2629;
    float _2637 = _2635;
    if (_2559)
    {
        float _2639 = _2585 * _2635;
        _1541 = _2639;
    }
    float _2641 = _1541;
    if (!_2559)
    {
        _2587 = _2617;
    }
    float _2643 = _2587;
    float _2645 = _2643;
    float _2647 = _2611;
    if (_2559)
    {
        float _2649 = _2611 + (-1.0);
        _2625 = _2649;
    }
    float _2651 = _2625;
    float _2653 = _2651;
    if (_2559)
    {
        float _2655 = _2547 * _2641;
        _2631 = _2655;
    }
    float _2657 = _2631;
    if (!_2559)
    {
        _2637 = _2551;
    }
    float _2659 = _2637;
    float _2661 = _2659;
    if (_2559)
    {
        float _2663 = _2651 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2571 = _2663;
    }
    float _2665 = _2571;
    if (!_2559)
    {
        _2653 = _2549;
    }
    float _2667 = _2653;
    float _2669 = _2667;
    if (_2559)
    {
        float _2671 = _2549 * _2641;
        _2669 = _2671;
    }
    float _2673 = _2669;
    if (_2559)
    {
        float _2675 = _2657 * _2657;
        _2661 = _2675;
    }
    float _2677 = _2661;
    if (_2559)
    {
        float _2679 = fma(_2617, _2611, _2665);
        _2645 = _2679;
    }
    float _2681 = _2645;
    if (!_2559)
    {
        _2647 = _2553;
    }
    float _2683 = _2647;
    float _2685 = _2683;
    if (_2559)
    {
        float _2687 = _2673 * _2673;
        _2685 = _2687;
    }
    float _2689 = _2685;
    float _2691 = fma(_2681, _2681, _2677);
    float _2693 = _2461 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2695 = floor(_2623);
    float _2697 = _2691 + _2689;
    float _2699 = fma(_2463, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2693);
    float _2701 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2703 = fma(_2543, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2701);
    float _2705 = precise::clamp(_2703, 0.0, 1.0);
    float _2707 = fma(_1721, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2709 = _2461 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2711 = fma(_2465, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2699);
    float _2713 = rsqrt(_2697);
    float _2715 = -_2705;
    float _2717 = _2715 + 1.0;
    float _2719 = _2711 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2721 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2723 = _2719 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2725 = abs(_2717);
    float _2727 = log2(_2725);
    float _2729 = _2461 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2731 = -_2723;
    float _2733 = fma(_2731, _2721, 1.0);
    float _2735 = _2461 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2737 = fma(_2463, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2729);
    float _2739 = _2713 * _2657;
    float _2741 = _2713 * _2681;
    float _2743 = _2713 * _2673;
    float _2745 = fma(_2463, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2735);
    float _2747 = fma(_2465, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2737);
    float _2749 = _2739 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2751 = fma(_2463, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2709);
    float _2753 = fma(_2465, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2745);
    float _2755 = _2747 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2757 = -_2749;
    float _2759 = fma(_2741, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2757);
    float _2761 = fma(_2465, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2751);
    float _2763 = _2753 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2765 = _2755 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2767 = -_2743;
    float _2769 = fma(_2767, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2759);
    float _2771 = _2761 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2773 = floor(_2707);
    float _2775 = fma(_2763, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2765);
    float _2777 = _2727 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2779 = fma(_2769, -0.5, 0.5);
    float _2781 = -_2695;
    float _2783 = _2623 + _2781;
    float _2785 = fma(_2719, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2775);
    float _2787 = fma(_2769, 0.5, 0.5);
    float _2789 = log2(_2733);
    float _2791 = fma(_2771, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2785);
    float _2793 = _2755 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2795 = _2755 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2797 = fma(_2787, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2799 = fma(_2763, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2793);
    float _2801 = fma(_2763, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2795);
    float _2803 = 1.0 / _2791;
    float _2805 = fma(_2787, _2797, -0.212114393711090087890625);
    float _2807 = fma(_2719, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2799);
    float _2809 = fma(_2719, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2801);
    float _2811 = -_2773;
    float _2813 = _2707 + _2811;
    float _2815 = _2741 + 1.0;
    float _2817 = fma(_2771, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2807);
    float _2819 = fma(_2771, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2809);
    float _2821 = exp2(_2777);
    float _2823 = _2789 * 0.693147182464599609375;
    float _2825 = sqrt(_2779);
    float _2827 = _2817 * _2803;
    float _2829 = _2819 * _2803;
    float2 _7680 = float2(_2783, _2813);
    float _2831 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7680, float2(0.0), isnan(_7680)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7680, float2(0.0), isnan(_7680)), level(0.0)).x;
    float _2833 = fma(_2787, _2805, 1.570728778839111328125);
    float _2835 = _2823 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2837 = fma(_2827, 0.5, 0.5);
    float _2839 = fma(_2829, -0.5, 0.5);
    float _2841 = -_2741;
    float _2843 = fma(_2821, _2815, _2841);
    float _2845 = fma(_2843, 0.5, 0.5);
    float _2847 = _2825 * 0.636619746685028076171875;
    float3 _7714 = float3(_2837, _2839, _2835);
    float _2849 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7714, float3(0.0), isnan(_7714)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7714, float3(0.0), isnan(_7714)), level(0.0)).x;
    float _2851 = -_2833;
    float _2853 = fma(_2847, _2851, 1.0);
    float3 _7730 = float3(_2837, _2839, _2835);
    float4 _2856 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7730, float3(0.0), isnan(_7730)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7730, float3(0.0), isnan(_7730)), level(0.0)).xyzw;
    float _2858 = _2856.x;
    float _2860 = _2856.y;
    float _2862 = _2856.z;
    float _2864 = _2856.w;
    float2 _7746 = float2(_2853, _2845);
    float3 _2868 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7746, float2(0.0), isnan(_7746)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7746, float2(0.0), isnan(_7746)), level(0.0)).xyz;
    float _2870 = _2868.x;
    float _2872 = _2868.y;
    float _2874 = _2868.z;
    float _2876 = abs(_2413);
    float _2878 = log2(_2876);
    float _2880 = _2755 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2882 = _2543 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2884 = isnan(_2543);
    bool _2886 = _2882 || _2884;
    bool _2888 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2890 = _2886 || _2888;
    float _2892 = fma(_2763, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2880);
    float _2894 = in.m_81.x;
    bool _2896 = _2413 <= 8000.0;
    bool _2898 = isnan(_2413);
    bool _2900 = _2896 || _2898;
    bool _2902 = isnan(8000.0);
    bool _2904 = _2900 || _2902;
    float _2906 = float(_2904);
    float _2908 = fma(_2719, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2892);
    float _2910 = _2727 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2912 = _2817 + _2791;
    float _2914 = fma(_2771, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2908);
    float _2916 = _2791 * 0.5;
    float _2918 = _2878 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2920 = exp2(_2910);
    float _2922 = _2912 * 0.5;
    out.gl_Position.x = _2817;
    out.gl_Position.y = _2819;
    out.gl_Position.z = _2914;
    out.gl_Position.w = _2791;
    float _2924 = exp2(_2918);
    float _2926 = -_2920;
    float _2928 = _2926 + 1.0;
    float _2930 = _2928 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2932 = fma(_2924, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2934 = precise::clamp(_2932, 0.0, 1.0);
    float _2936 = fma(_2819, -0.5, _2916);
    float _2938 = -_2930;
    float _2940 = _2938 + 1.0;
    float _2942 = fma(_2934, -2.0, 3.0);
    float _2944 = _2934 * _2934;
    float _2946 = _2819;
    float _2948 = _2791;
    float _2950 = _2914;
    float _2952 = _2940;
    if (!_2890)
    {
        _2946 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2954 = _2946;
    float _2956 = _2944 * _2942;
    float _2958 = -_2956;
    float _2960 = _2958 + 1.0;
    float _2962 = fma(_2960, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2956);
    float _2964 = _2914 + _2791;
    float _2966 = _2906 * _2962;
    float _2968 = _2964 * 0.5;
    float _2970 = _2521 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2972 = _2954;
    float _2974 = _2954;
    if (!_2890)
    {
        _2948 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2976 = _2948;
    float _2978 = _2966 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2980 = _2976;
    float _2982 = _2976;
    if (!_2890)
    {
        _2950 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2984 = _2950;
    out.m_83.x = _2922;
    out.m_83.y = _2936;
    out.m_83.z = _2968;
    out.m_83.w = _2791;
    float _2986 = -_2831;
    float _2988 = _2986 + 1.0;
    float _2990 = _2988 * _2978;
    float _2992 = precise::clamp(_2990, 0.0, 1.0);
    float _2994 = -_2992;
    float _2996 = fma(_2994, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2998 = _2996 * _2894;
    float _3000 = _2930 * _2849;
    float _3002 = _2998 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3004 = _2998;
    float _3006 = _2984;
    float _3008 = _2984;
    if (!_2890)
    {
        _3004 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3010 = _3004;
    float _3012 = _2864 * _3000;
    float _3014 = _2864 * _2940;
    out.m_85.x = _3002;
    float _3016 = _3012;
    float _3018 = _3010;
    float _3020 = _3010;
    if (!_2890)
    {
        _2952 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3022 = _2952;
    float _3024 = _2874 * _3000;
    float _3026 = fma(_2870, _3012, _2858);
    float _3028 = fma(_2872, _3012, _2860);
    float _3030 = _3022;
    float _3032 = _3022;
    if (!_2890)
    {
        _3016 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3034 = _3016;
    float _3036 = fma(_2864, _3024, _2862);
    out.m_87.x = _3026;
    out.m_87.y = _3028;
    out.m_87.z = _3036;
    out.m_87.w = _3014;
    bool _3038 = !_2890;
    float _3040 = _3034;
    float _3042 = _3034;
    if (!_3038)
    {
        bool _3044 = _2543 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3046 = isnan(_2543);
        bool _3048 = _3044 || _3046;
        bool _3050 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3052 = _3048 || _3050;
        if (!_3052)
        {
            float _3054 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3056 = _2543 + _3054;
            float _3058 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3060 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3058;
            float _3062 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3064 = _3062 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3066 = 1.0 / _3060;
            float _3068 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3070 = _3068 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3072 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3074 = _3072 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3076 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3078 = _3076 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3080 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3082 = _3080 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3084 = _3056 * _3066;
            float _3086 = precise::clamp(_3084, 0.0, 1.0);
            float _3088 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3090 = _3088 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3092 = fma(_3086, _3064, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3094 = fma(_3086, _3090, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3096 = fma(_3086, _3070, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3098 = fma(_3086, _3074, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3100 = fma(_3086, _3078, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3102 = fma(_3086, _3082, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3042 = _3096;
            _2974 = _3100;
            _3020 = _3092;
            _3008 = _3098;
            _2982 = _3094;
            _3032 = _3102;
            _3104 = true;
        }
        else
        {
            bool _3106 = _2543 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3108 = isnan(_2543);
            bool _3110 = _3106 || _3108;
            bool _3112 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3114 = _3110 || _3112;
            if (!_3114)
            {
                _3018 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3116 = _3018;
            _3020 = _3116;
            if (!_3114)
            {
                _3040 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3118 = _3040;
            _3042 = _3118;
            if (!_3114)
            {
                _2980 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3120 = _2980;
            _2982 = _3120;
            if (!_3114)
            {
                _3006 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3122 = _3006;
            _3008 = _3122;
            if (!_3114)
            {
                _2972 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3124 = _2972;
            _2974 = _3124;
            if (!_3114)
            {
                _3030 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3126 = _3030;
            bool _3128 = !_3114;
            _3032 = _3126;
            if (!_3128)
            {
                bool _3130 = _2543 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3132 = isnan(_2543);
                bool _3134 = _3130 || _3132;
                bool _3136 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3138 = _3134 || _3136;
                if (!_3138)
                {
                    float _3140 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3142 = _2543 + _3140;
                    float _3144 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3146 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3144;
                    float _3148 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3150 = _3148 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3152 = 1.0 / _3146;
                    float _3154 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3156 = _3154 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3158 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3160 = _3158 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3162 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3164 = _3162 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3166 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3168 = _3166 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3170 = _3142 * _3152;
                    float _3172 = precise::clamp(_3170, 0.0, 1.0);
                    float _3174 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3176 = _3174 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3178 = fma(_3172, _3150, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3180 = fma(_3172, _3176, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3182 = fma(_3172, _3156, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3184 = fma(_3172, _3160, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3186 = fma(_3172, _3164, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3188 = fma(_3172, _3168, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3042 = _3182;
                    _2974 = _3186;
                    _3020 = _3178;
                    _3008 = _3184;
                    _2982 = _3180;
                    _3032 = _3188;
                    _3104 = true;
                }
                else
                {
                    _3042 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2974 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3020 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3008 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2982 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3032 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3104 = false;
    float _3190 = _3042;
    float _3192 = _2974;
    float _3194 = _3020;
    float _3196 = _3008;
    float _3198 = _2982;
    float _3200 = _3032;
    float _3202 = _2970 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3204 = fma(_2159, -0.5, 0.5);
    float _3206 = precise::clamp(_3204, 0.0, 1.0);
    float _3208 = -_3190;
    float _3210 = _3208 + _3192;
    float _3212 = -_3194;
    float _3214 = _3212 + _3196;
    out.m_89.x = 0.0;
    float _3216 = fma(_3206, _3210, _3190);
    float _3218 = -_3198;
    float _3220 = _3218 + _3200;
    float _3222 = fma(_3206, _3214, _3194);
    float _3224 = _3216 * 0.586610972881317138671875;
    bool _3226 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3228 = fma(_3206, _3220, _3198);
    out.m_51.x = _3202;
    float _3230 = fma(_3222, 0.298911988735198974609375, _3224);
    bool _3232 = _2521 > 0.0;
    bool _3234 = isnan(_2521);
    bool _3236 = _3232 || _3234;
    bool _3238 = isnan(0.0);
    bool _3240 = _3236 || _3238;
    float _3242 = fma(_3228, 0.114477999508380889892578125, _3230);
    float _3244 = -_3242;
    float _3246 = _3222 + _3244;
    float _3248 = -_3242;
    float _3250 = _3216 + _3248;
    float _3252 = -_3242;
    float _3254 = _3228 + _3252;
    float _3256 = fma(_3246, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3242);
    float _3258 = fma(_3250, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3242);
    float _3260 = fma(_3254, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3242);
    bool _3262 = !_3226;
    if (!_3262)
    {
        float _3264 = -_2461;
        float _3266 = _3264 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3268 = -_2463;
        float _3270 = _3268 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3272 = -_2465;
        float _3274 = _3272 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3276 = _3266 * _3266;
        float _3278 = fma(_3270, _3270, _3276);
        float _3280 = fma(_3274, _3274, _3278);
        float _3282 = sqrt(_3280);
        float _3284 = rsqrt(_3280);
        float _3286 = -_3282;
        float _3288 = _3286 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3290 = _3288 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3292 = precise::clamp(_3290, 0.0, 1.0);
        float _3294 = _3270 * _3284;
        float _3296 = _3266 * _3284;
        float _3298 = abs(_3292);
        float _3300 = log2(_3298);
        float _3302 = _3274 * _3284;
        float _3304 = _3294 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3306 = _2159 * _3296;
        float _3308 = -_3296;
        float _3310 = -_3304;
        float _3312 = fma(_3308, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3310);
        float _3314 = fma(_2157, _3294, _3306);
        float _3316 = -_3302;
        float _3318 = fma(_3316, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3312);
        float _3320 = fma(_2161, _3302, _3314);
        float _3322 = precise::clamp(_3320, 0.0, 1.0);
        float _3324 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3326 = _3318 + _3324;
        float _3328 = _3300 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3330 = _3326 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3332 = precise::clamp(_3330, 0.0, 1.0);
        float _3334 = exp2(_3328);
        float _3336 = _3334 * _3332;
        float _3338 = _3322 * _3336;
        float _3340 = _3338 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3342 = _3338 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3344 = _3338 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _3340;
        out.m_89.y = _3342;
        out.m_89.z = _3344;
    }
    out.m_91.x = _3256;
    out.m_91.y = _3258;
    out.m_91.z = _3260;
    if (_3240)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_51.x = 0.0;
    float _3346 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3346;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3104 = false;
    bool _2209 = false;
    bool _614 = false;
    bool _488 = false;
    bool _212 = false;
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
        float _3403 = as_type<float>(_126);
        out.gl_Position.z = _3403;
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
    float _146 = 0.0;
    float _148 = _144;
    if (_140)
    {
        float _150 = float(_110);
        _146 = _150;
    }
    float _152 = _146;
    bool _154 = _144 >= _152;
    bool _156 = !_140;
    bool _158 = _154 || _156;
    if (_158)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _120;
    if (_158)
    {
        out.m_51.x = 0.0;
    }
    if (_158)
    {
        float _162 = _160 * 5.0;
        _128 = as_type<int>(_162);
    }
    int _164 = _128;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3472 = as_type<float>(_164);
        out.gl_Position.z = _3472;
    }
    if (_158)
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
    float _210;
    if (!_192)
    {
        float _194 = in.m_57.x;
        float _196 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _198 = _194 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _200 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[12].x, _144);
        float _202 = _200 * _196;
        float _204 = floor(_202);
        float _206 = -_204;
        float _208 = _202 + _206;
        _210 = _208;
        _212 = true;
    }
    else
    {
        float _214 = float(_110);
        float _216 = 1.0 / _214;
        float _218 = _144 * _216;
        _210 = _218;
    }
    _212 = false;
    float _220 = _210;
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _224 = _220 + _222;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _228 = _220 + _226;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _232 = _220 + _230;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _236 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _234;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _240 = _238 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _242;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _248 = _246 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _250 = 1.0 / _240;
    bool _252 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _254 = isnan(_220);
    bool _256 = _252 || _254;
    bool _258 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _260 = _256 || _258;
    float _262 = float(_260);
    float _264 = 1.0 / _244;
    bool _266 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _268 = isnan(_220);
    bool _270 = _266 || _268;
    bool _272 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _274 = _270 || _272;
    float _276 = float(_274);
    bool _278 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _280 = 1.0 / _248;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _284 = _220 + _282;
    float _286 = 1.0 / _236;
    float _288 = _284 * _250;
    bool _290 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _292 = isnan(_220);
    bool _294 = _290 || _292;
    bool _296 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _298 = _294 || _296;
    float _300 = float(_298);
    float _302 = _224 * _264;
    bool _304 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _306 = isnan(_220);
    bool _308 = _304 || _306;
    bool _310 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _312 = _308 || _310;
    float _314 = float(_312);
    float _316 = -_300;
    float _318 = _316 + 1.0;
    float _320 = _228 * _280;
    float _322 = -_276;
    float _324 = _322 + 1.0;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _328 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _326;
    float _330 = _314 * _318;
    float _332 = -_314;
    float _334 = _332 + 1.0;
    bool _336 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _338 = isnan(_220);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    float _348 = fma(_328, _302, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _352 = _350 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _354 = _232 * _286;
    float _356 = _276 * _334;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _358;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _364 = _362 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _366 = _262 * _324;
    float _368 = -_262;
    float _370 = _368 + 1.0;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _374 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _372;
    float _376 = fma(_360, _302, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _380 = _378 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _382 = _346 * _370;
    float _384 = fma(_374, _302, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _386 = fma(_352, _320, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _388 = fma(_364, _320, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _390 = fma(_380, _320, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _392 = _348 * _382;
    float _394 = _376 * _382;
    float _396 = -_346;
    float _398 = _396 + 1.0;
    float _400 = _384 * _382;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _402;
    float _406 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[143].x, _392);
    float _408 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[143].y, _394);
    float _410 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[143].z, _400);
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _412;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _416;
    float _420 = fma(_386, _366, _406);
    float _422 = fma(_388, _366, _408);
    float _424 = fma(_404, _354, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _426 = fma(_390, _366, _410);
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _430 = _428 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _432 = fma(_414, _354, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _434 = fma(_418, _354, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _438 = _436 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _442 = _440 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _444 = fma(_424, _356, _420);
    float _446 = fma(_430, _288, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _448 = fma(_438, _288, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _450 = fma(_442, _288, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _452 = fma(_432, _356, _422);
    float _454 = fma(_434, _356, _426);
    float _456 = fma(_446, _330, _444);
    float _458 = fma(_448, _330, _452);
    float _460 = fma(_450, _330, _454);
    float _462 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[147].x, _456);
    float _464 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[147].y, _458);
    float _466 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[147].z, _460);
    bool _468 = !_278;
    float _486;
    if (!_468)
    {
        float _470 = in.m_57.x;
        float _472 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _474 = _470 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _476 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[11].x, _144);
        float _478 = _476 * _472;
        float _480 = floor(_478);
        float _482 = -_480;
        float _484 = _478 + _482;
        _486 = _484;
        _488 = true;
    }
    else
    {
        float _490 = float(_110);
        float _492 = 1.0 / _490;
        float _494 = _144 * _492;
        _486 = _494;
    }
    _488 = false;
    float _496 = _486;
    float _498 = in.m_59.x;
    float _500 = in.m_59.y;
    float _502 = in.m_59.z;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _506 = _496 + _504;
    bool _508 = _496 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _510 = isnan(_496);
    bool _512 = _508 || _510;
    bool _514 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _516 = _512 || _514;
    float _518 = float(_516);
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _520;
    bool _524 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _526 = 1.0 / _522;
    float _528 = _466 * _502;
    float _530 = _506 * _526;
    float _532 = _464 * _500;
    float _534 = -_518;
    float _536 = _534 + 1.0;
    bool _538 = _496 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _540 = isnan(_496);
    bool _542 = _538 || _540;
    bool _544 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _546 = _542 || _544;
    float _548 = float(_546);
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _552 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _550;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _556 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _554;
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _558;
    float _562 = _462 * _498;
    float _564 = _548 * _536;
    float _566 = fma(_552, _530, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _568 = fma(_560, _530, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _570 = fma(_556, _530, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _572 = -_548;
    float _574 = _572 + 1.0;
    float _576 = _566 * _564;
    float _578 = _568 * _564;
    float _580 = _570 * _564;
    float _582 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[107].x, _576);
    float _584 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[107].y, _578);
    float _586 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[107].z, _580);
    float _588 = fma(_518, (*spvDescriptorSet0.vp_c9)._m0[108].x, _582);
    float _590 = fma(_518, (*spvDescriptorSet0.vp_c9)._m0[108].y, _584);
    float _592 = fma(_518, (*spvDescriptorSet0.vp_c9)._m0[108].z, _586);
    bool _594 = !_524;
    float _612;
    if (!_594)
    {
        float _596 = in.m_57.x;
        float _598 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _600 = _596 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _602 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[11].y, _144);
        float _604 = _602 * _598;
        float _606 = floor(_604);
        float _608 = -_606;
        float _610 = _604 + _608;
        _612 = _610;
        _614 = true;
    }
    else
    {
        float _616 = float(_110);
        float _618 = 1.0 / _616;
        float _620 = _144 * _618;
        _612 = _620;
    }
    _614 = false;
    float _622 = _612;
    float _624 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _626 = int(_624);
    float _628 = in.m_57.x;
    float _630 = in.m_57.y;
    float _632 = in.m_61.y;
    float _634 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _636 = int(_634);
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _642 = _640 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _646 = _644 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _648 = float(_626);
    float _650 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _652 = log2(_650);
    float _654 = float(uint(_636));
    float _656 = 1.0 / _648;
    int _658 = ~_636;
    int _660 = _658 + 1;
    int _662 = ~_636;
    int _664 = _662 + 1;
    int _666 = ~_636;
    int _668 = _666 + 1;
    float _670 = 1.0 / _654;
    float _672 = _656 * _144;
    float _674 = 1.0 / _642;
    int _676 = as_type<int>(_670) + (-2);
    float _678 = trunc(_672);
    int _680 = int(_678);
    float _682 = 1.0 / _646;
    float _684 = float(uint(_680));
    float _686 = as_type<float>(_676) * _684;
    float _688 = trunc(_686);
    float _690 = precise::max(_688, 0.0);
    uint _693 = uint(_690);
    int _695 = ~_636;
    int _697 = _695 + 1;
    int _699 = _660 * int(_693);
    int _701 = _699 + _680;
    float _703 = float(_636);
    float _705 = float(uint(_701));
    float _707 = as_type<float>(_676) * _705;
    float _709 = trunc(_707);
    float _711 = precise::max(_709, 0.0);
    uint _713 = uint(_711);
    int _715 = int(_693) + int(_713);
    float _717 = float(_110);
    int _719 = _697 * _715;
    int _721 = _719 + _680;
    float _723 = float(_680);
    float _725 = 1.0 / _717;
    int _727 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _729 = _727 != 0;
    bool _731 = _723 >= _703;
    bool _733 = isnan(_723);
    bool _735 = _731 || _733;
    bool _737 = isnan(_703);
    bool _739 = _735 || _737;
    float _741 = float(_739);
    bool _743 = !_729;
    float _745 = _743 ? 7.345489978790283203125 : 1.0;
    bool _747 = uint(_721) >= uint(_636);
    float _749 = trunc(_741);
    int _751 = int(_749);
    float _753 = _745 * _628;
    bool _755 = !_747;
    int _757 = _755 ? 0 : (-1);
    bool _759 = _636 == 0;
    int _761 = ~_715;
    int _763 = _761 + _757;
    int _765 = _763 + 1;
    float _767 = floor(_753);
    float _769 = _703 * _144;
    int _771 = _636 * _765;
    int _773 = _771 + _680;
    float _775 = _769 * _725;
    int _777 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _779 = _777 != 0;
    int _781 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _783 = _781 != 0;
    int _785 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _787 = _785 != 0;
    int _789 = ~_751;
    int _791 = _789 + 1;
    int _793 = _791 + 1;
    out.m_63.x = 1.0;
    out.m_63.y = 1.0;
    out.m_63.z = 1.0;
    bool _795 = !_759;
    int _797 = _795 ? _773 : (-1);
    float _799 = trunc(_775);
    int _801 = int(_799);
    float _803 = -_767;
    float _805 = _753 + _803;
    int _807 = _797 * _793;
    int _809 = _636 + (-1);
    float _811 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _813 = _805 * _703;
    bool _815 = !_783;
    int _817 = _815 ? 0 : 1;
    int _819 = _751 * _809;
    int _821 = _819 + _807;
    int _823 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _825 = _823 != 0;
    float _827 = trunc(_813);
    int _829 = int(_827);
    int _831 = abs(_817);
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _835 = 1.0 + _833;
    bool _837 = !_825;
    int _839 = _837 ? 0 : 1;
    int _841 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _843 = _841 != 0;
    bool _845 = !_779;
    int _847 = _845 ? 0 : 1;
    float _849 = 1.0 / _835;
    int _851 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _853 = _851 != 0;
    int _855 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _857 = _855 != 0;
    int _859 = _821 * _831;
    int _861 = abs(_839);
    float _863 = -_632;
    float _865 = _863 + 1.0;
    int _867 = abs(_847);
    bool _869 = _630 > 0.5;
    int _871 = _829 * _861;
    int _873 = _871 + _680;
    bool _875 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _877 = isnan(1.0);
    bool _879 = _875 || _877;
    bool _881 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _883 = _879 || _881;
    int _885 = _801 * _867;
    int _887 = _885 + _859;
    float _889 = _632;
    if (_843)
    {
        float _891 = _869 ? _865 : _632;
        _889 = _891;
    }
    float _893 = _889;
    float _895 = _630 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _897 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _899 = _897 != 0;
    float _901 = in.m_48.x;
    float _903 = in.m_48.y;
    float _905 = in.m_48.z;
    bool _907 = !_787;
    int _909 = _907 ? 0 : 1;
    float _911 = fma(_895, -2.0, _811);
    bool _913 = !_899;
    int _915 = _913 ? 0 : 1;
    float _917 = 0.0;
    if (_853)
    {
        float _919 = in.m_57.x;
        _917 = _919;
    }
    float _921 = _917;
    int _923 = abs(_909);
    float _925 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _927 = _925 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _929 = abs(_915);
    float _931 = _628 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _933 = _873 * _923;
    int _935 = _933 + _887;
    float _937 = 1.0 / _927;
    float _939 = -_638;
    float _941 = fma(_931, 2.0, _939);
    int _943 = _829 * _929;
    int _945 = _943 + _935;
    float _947 = -_144;
    float _949 = fma(_947, (*spvDescriptorSet0.vp_c9)._m0[76].x, _941);
    float _951 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[76].y, _911);
    float _953 = float(uint(_945));
    float _955 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _957 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _959 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _961 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _963 = as_type<float>(_676) * _953;
    float _965 = _903 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _967 = _903 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _969 = _903 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _971 = _652 * _144;
    float _973 = fma(_901, (*spvDescriptorSet0.vp_c10)._m0[4].x, _965);
    float _975 = trunc(_963);
    float _977 = precise::max(_975, 0.0);
    uint _979 = uint(_977);
    float _981 = fma(_901, (*spvDescriptorSet0.vp_c10)._m0[5].x, _967);
    float _983 = fma(_901, (*spvDescriptorSet0.vp_c10)._m0[6].x, _969);
    float _985 = in.m_61.x;
    float _987 = _955 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _989 = _957 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _991 = _959 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _993 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _995 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _993;
    float _997 = in.m_57.z;
    float _999 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1001 = _999 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1003 = exp2(_971);
    float _1005 = _995 * _937;
    float _1007 = _628 * 2.0;
    out.m_65.x = _987;
    out.m_65.y = _989;
    out.m_65.z = _991;
    out.m_65.w = _961;
    float _1009 = _1001 * _674;
    bool _1011 = _921 > 0.5;
    bool _1013 = _1011 && _853;
    float _1015 = _630 + _628;
    float _1017 = fma(_905, (*spvDescriptorSet0.vp_c10)._m0[4].z, _973);
    float _1019 = floor(_1007);
    float _1021 = fma(_905, (*spvDescriptorSet0.vp_c10)._m0[6].z, _983);
    float _1023 = -_1003;
    float _1025 = _1023 + 1.0;
    int _1027 = _664 * int(_979);
    int _1029 = _1027 + _945;
    float _1031 = _630 * 2.0;
    float _1033 = _1015 + (-1.0);
    float _1035 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1037 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1035;
    float _1039 = float(uint(_1029));
    float _1041 = floor(_1031);
    bool _1043 = _1019 >= 0.0;
    bool _1045 = isnan(_1019);
    bool _1047 = _1043 || _1045;
    bool _1049 = isnan(0.0);
    bool _1051 = _1047 || _1049;
    float _1053 = _1037 * _682;
    float _1055 = _630 + _997;
    float _1057 = as_type<float>(_676) * _1039;
    float _1059 = _1039;
    if (_853)
    {
        _1059 = _985;
    }
    float _1061 = _1059;
    float _1063 = fma(_1033, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1065 = _1051 ? 0 : 1;
    float _1067 = _1055 + (-1.0);
    bool _1069 = _1019 > 0.0;
    float _1071 = trunc(_1057);
    float _1073 = precise::max(_1071, 0.0);
    uint _1075 = uint(_1073);
    float _1077 = _1061;
    if (_1013)
    {
        float _1079 = -_1061;
        float _1081 = _1079 + 1.0;
        _1077 = _1081;
    }
    float _1083 = _1077;
    bool _1085 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1087 = isnan(0.0);
    bool _1089 = _1085 || _1087;
    bool _1091 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1093 = _1089 || _1091;
    float _1095 = fma(_1067, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1097 = _1093 ? _1025 : 0.0;
    bool _1099 = _1041 > 0.0;
    bool _1101 = _1041 >= 0.0;
    bool _1103 = isnan(_1041);
    bool _1105 = _1101 || _1103;
    bool _1107 = isnan(0.0);
    bool _1109 = _1105 || _1107;
    float _1111 = _997 * 2.0;
    float _1113 = floor(_1111);
    int _1115 = int(_979) + int(_1075);
    float _1117 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1119 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1121 = fma(_628, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1117);
    float _1123 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1119);
    float _1125 = _1117;
    if (!_853)
    {
        _1125 = _985;
    }
    float _1127 = _1125;
    int _1129 = _668 * _1115;
    int _1131 = _1129 + _945;
    float _1133 = _1127;
    if (_853)
    {
        _1133 = _1083;
    }
    float _1135 = _1133;
    float _1137 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1121);
    float _1139 = float(uint(_873));
    float _1141 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1123);
    if (_883)
    {
        float _1143 = _1097 * _849;
        _148 = _1143;
    }
    float _1145 = _148;
    bool _1147 = uint(_1131) >= uint(_636);
    bool _1149 = _1113 >= 0.0;
    bool _1151 = isnan(_1113);
    bool _1153 = _1149 || _1151;
    bool _1155 = isnan(0.0);
    bool _1157 = _1153 || _1155;
    float _1159 = as_type<float>(_676) * _1139;
    int _1161 = ~_1065;
    int _1163 = _1161 + 1;
    int _1165 = _1163 + 1;
    float _1167 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1169 = _622 + _1167;
    int _1171 = _1165;
    if (!_1069)
    {
        int _1173 = ~_1065;
        int _1175 = _1173 + 1;
        _1171 = _1175;
    }
    int _1177 = _1171;
    int _1179 = _1109 ? 0 : 1;
    float _1181 = trunc(_1159);
    float _1183 = precise::max(_1181, 0.0);
    uint _1185 = uint(_1183);
    bool _1187 = !_1147;
    int _1189 = _1187 ? 0 : (-1);
    float _1191 = fma(_1005, _1169, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    int _1193 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1195 = _1193 != 0;
    int _1197 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1199 = _1197 != 0;
    int _1201 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1203 = _1201 != 0;
    int _1205 = _1157 ? 0 : 1;
    int _1207 = ~_1115;
    int _1209 = _1207 + _1189;
    int _1211 = _1209 + 1;
    float _1213 = fma(_1135, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    bool _1215 = _1113 > 0.0;
    float _1217 = fma(_893, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _1219 = fma(_905, (*spvDescriptorSet0.vp_c10)._m0[5].z, _981);
    int _1221 = _636 * _1211;
    int _1223 = _1221 + _945;
    bool _1225 = _622 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1227 = isnan(_622);
    bool _1229 = _1225 || _1227;
    bool _1231 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1233 = _1229 || _1231;
    float _1235 = float(_1233);
    float _1237 = -_951;
    float _1239 = fma(_1141, _1217, _1237);
    float _1241 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1243 = _622 + _1241;
    int _1245 = ~_636;
    int _1247 = _1245 + 1;
    bool _1249 = !_759;
    int _1251 = _1249 ? _1223 : (-1);
    float _1253 = fma(_1009, _1243, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _1255 = _622 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1257 = isnan(_622);
    bool _1259 = _1255 || _1257;
    bool _1261 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1263 = _1259 || _1261;
    float _1265 = float(_1263);
    int _1267 = _1247 * int(_1185);
    int _1269 = _1267 + _873;
    int _1271 = _1251 >> 31;
    float _1273 = -_1235;
    float _1275 = _1273 + 1.0;
    bool _1277 = _622 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1279 = isnan(_622);
    bool _1281 = _1277 || _1279;
    bool _1283 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1285 = _1281 || _1283;
    float _1287 = float(_1285);
    float _1289 = -_1265;
    float _1291 = _1289 + 1.0;
    int _1293 = _1271 & 3;
    float _1295 = _1265 * _1275;
    float _1297 = float(uint(_1269));
    float _1299 = _1287 * _1291;
    int _1301 = _1251 + _1293;
    float _1303 = -_1287;
    float _1305 = _1303 + 1.0;
    bool _1307 = _622 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1309 = isnan(_622);
    bool _1311 = _1307 || _1309;
    bool _1313 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1315 = _1311 || _1313;
    float _1317 = float(_1315);
    float _1319 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1321 = _622 + _1319;
    int _1323 = _1301 >> 2;
    float _1325 = as_type<float>(_676) * _1297;
    float _1327 = _1317 * _1305;
    int _1329 = _1323 << 4;
    int _1331 = _1329 + 368;
    float _1333 = fma(_1053, _1321, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1335 = -_1317;
    float _1337 = _1335 + 1.0;
    float _1339 = trunc(_1325);
    float _1341 = precise::max(_1339, 0.0);
    uint _1343 = uint(_1341);
    uint _1345 = uint(int(uint(_1331) >> uint(2)));
    uint _1347 = uint(int(uint(int(_1345)) >> uint(2)));
    int _1349 = int(_1345) & 3;
    float _1351 = (*spvDescriptorSet0.vp_c9)._m0[int(_1347)][_1349];
    int _1353 = int(_1345) + 1;
    uint _1355 = uint(int(uint(_1353) >> uint(2)));
    int _1357 = _1353 & 3;
    float _1359 = (*spvDescriptorSet0.vp_c9)._m0[int(_1355)][_1357];
    float _1361 = _1191 * _1327;
    int _1363 = ~_1205;
    int _1365 = _1363 + 1;
    int _1367 = _1365 + 1;
    int _1369 = _1367;
    if (!_1215)
    {
        int _1371 = ~_1205;
        int _1373 = _1371 + 1;
        _1369 = _1373;
    }
    int _1375 = _1369;
    float _1377 = fma(_1337, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1361);
    float _1379 = fma(_1137, _1213, _949);
    bool _1381 = !_1195;
    int _1383 = _1381 ? 0 : 1;
    int _1385 = _1251 & 3;
    bool _1387 = _1385 != 0;
    float _1389 = fma(_1253, _1299, _1377);
    int _1391 = ~_1179;
    int _1393 = _1391 + 1;
    int _1395 = _1393 + 1;
    int _1397 = _1395;
    if (!_1099)
    {
        int _1399 = ~_1179;
        int _1401 = _1399 + 1;
        _1397 = _1401;
    }
    int _1403 = _1397;
    int _1405 = int(_1185) + int(_1343);
    int _1407 = abs(_1383);
    bool _1409 = uint(_1385) > 1u;
    float _1411 = float(_1177);
    int _1413 = _1331 + 8;
    uint _1415 = uint(int(uint(_1413) >> uint(2)));
    uint _1417 = uint(int(uint(int(_1415)) >> uint(2)));
    int _1419 = int(_1415) & 3;
    float _1421 = (*spvDescriptorSet0.vp_c9)._m0[int(_1417)][_1419];
    int _1423 = int(_1415) + 1;
    uint _1425 = uint(int(uint(_1423) >> uint(2)));
    int _1427 = _1423 & 3;
    float _1429 = (*spvDescriptorSet0.vp_c9)._m0[int(_1425)][_1427];
    int _1431 = _1251 & 3;
    bool _1433 = _1431 != 0;
    float _1435 = fma(_1333, _1295, _1389);
    int _1437 = ~_636;
    int _1439 = _1437 + 1;
    float _1441 = _1239 + 0.5;
    int _1443 = _1433 ? 0 : 1;
    float _1445 = fma(_1235, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1435);
    bool _1447 = !_1199;
    int _1449 = _1447 ? 0 : 1;
    int _1451 = _1439 * _1405;
    int _1453 = _1451 + _873;
    int _1455 = ~_1443;
    int _1457 = _1455 + 1;
    int _1459 = _1457 + 1;
    int _1461 = _1459;
    if (!_1409)
    {
        int _1463 = ~_1443;
        int _1465 = _1463 + 1;
        _1461 = _1465;
    }
    int _1467 = _1461;
    bool _1469 = !_1387;
    int _1471 = _1469 ? 0 : 1;
    int _1473 = abs(_1449);
    int _1475 = abs(_1467);
    float _1477 = float(_1375);
    float _1479 = _1379 + 0.5;
    bool _1481 = _1385 != 3;
    int _1483 = abs(_1471);
    float _1485 = float(_1473);
    out.m_67.x = _1479;
    out.m_67.y = _1441;
    bool _1487 = uint(_1453) >= uint(_636);
    float _1489 = _1485 * _1411;
    bool _1491 = uint(_1385) >= 2u;
    int _1493 = ~_1475;
    int _1495 = _1493 + 1;
    int _1497 = _1495 + 1;
    bool _1499 = !_1487;
    int _1501 = _1499 ? 0 : (-1);
    float _1503 = _1219 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1505 = _1491 ? 0 : 1;
    int _1507 = _1497 * as_type<int>(_1359);
    int _1509 = ~_1405;
    int _1511 = _1509 + _1501;
    int _1513 = _1511 + 1;
    float _1515 = _1021 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1517 = ~_1483;
    int _1519 = _1517 + 1;
    int _1521 = _1519 + 1;
    int _1523 = ~_1505;
    int _1525 = _1523 + 1;
    int _1527 = _1525 + 1;
    int _1529 = _636 * _1513;
    int _1531 = _1529 + _873;
    bool _1533 = _1385 != 3;
    int _1535 = _1521 * as_type<int>(_1351);
    int _1537 = _1535 + _1507;
    int _1539 = _1527;
    float _1541 = _1503;
    if (_1481)
    {
        int _1543 = ~_1505;
        int _1545 = _1543 + 1;
        _1539 = _1545;
    }
    int _1547 = _1539;
    float _1549 = in.m_69.x;
    float _1551 = in.m_69.y;
    float _1553 = in.m_69.z;
    bool _1555 = !_1533;
    int _1557 = _1555 ? 0 : (-1);
    float _1559 = _1489 * (-2.0);
    int _1561 = abs(_1547);
    int _1563 = abs(_1557);
    bool _1565 = !_857;
    int _1567 = _1565 ? 0 : 1;
    int _1569 = abs(_1567);
    float _1571 = _1017 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1573 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1575 = _1503 + _1573;
    int _1577 = ~_1561;
    int _1579 = _1577 + 1;
    int _1581 = _1579 + 1;
    float _1583 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1585 = _1571 + _1583;
    float _1587 = float(_1407);
    float _1589 = _1575 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1591 = ~_1563;
    int _1593 = _1591 + 1;
    int _1595 = _1593 + 1;
    int _1597 = _1581 * as_type<int>(_1421);
    int _1599 = _1597 + _1537;
    float _1601 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1603 = _1515 + _1601;
    float _1605 = _1587 * _1477;
    float _1607 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1589);
    int _1609 = _1595 * as_type<int>(_1429);
    int _1611 = _1609 + _1599;
    float _1613 = _1605 * (-2.0);
    float _1615 = fma(_1603, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1607);
    float _1617 = fma(_1559, _1551, _1551);
    int _1619 = ~_1569;
    int _1621 = _1619 + 1;
    int _1623 = _1621 + 1;
    float _1625 = fma(_1063, _1613, _1063);
    float _1627 = _1575 * _1575;
    float _1629 = fma(_1613, _1549, _1549);
    float _1631 = fma(_1095, _1559, _1095);
    float _1633 = _592 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _1635 = _1615 >= 0.0;
    float _1637 = fma(_1585, _1585, _1627);
    int _1639 = _1611 * _1623;
    bool _1641 = !_759;
    int _1643 = _1641 ? _1531 : (-1);
    float _1645 = _590 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1647 = fma(_1603, _1603, _1637);
    float _1649 = _628 + (-0.5);
    float _1651 = _1633 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1653 = _1643 * _1569;
    int _1655 = _1653 + _1639;
    float _1657 = _588 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1659 = _1645 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1661 = rsqrt(_1647);
    float _1663 = _1637;
    float _1665 = _1553;
    if (_1635)
    {
        _1663 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1667 = _1663;
    float _1669 = _1657 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1671 = _1445 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1673 = float(_1655);
    float _1675 = fma(_1649, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1629);
    int _1677 = as_type<int>(_1667);
    if (_1635)
    {
        float _1679 = _1667 * 5.0;
        _1677 = as_type<int>(_1679);
    }
    int _1681 = _1677;
    bool _1683 = !_1203;
    int _1685 = _1683 ? 0 : 1;
    out.m_71.x = _1669;
    out.m_71.y = _1659;
    out.m_71.z = _1651;
    out.m_71.w = _1671;
    float _1687 = fma(_1625, _1145, _1675);
    float _1689 = _630 + (-0.5);
    int _1691 = abs(_1685);
    if (_1635)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5793 = as_type<float>(_1681);
        out.gl_Position.z = _5793;
    }
    float _1693 = float(_1403);
    float _1695 = _1575 * _1661;
    out.m_73.x = _1673;
    float _1697 = _1585 * _1661;
    float _1699 = _1695;
    if (_1635)
    {
        out.m_51.x = 0.0;
    }
    if (_1635)
    {
        return out;
    }
    float _1701 = -_1695;
    float _1703 = fma(_1701, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1503);
    float _1705 = _1603 * _1661;
    float _1707 = -_1697;
    float _1709 = fma(_1707, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1571);
    float _1711 = float(_1691);
    float _1713 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1715 = _1703 + _1713;
    float _1717 = _1687 * 0.15915493667125701904296875;
    float _1719 = -_1705;
    float _1721 = fma(_1719, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1515);
    float _1723 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1725 = _1709 + _1723;
    float _1727 = _1715 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1729 = fma(_1689, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1617);
    float _1731 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1733 = _1721 + _1731;
    float _1735 = _997 + _628;
    float _1737 = fma(_1725, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1727);
    float _1739 = _1711 * _1693;
    float _1741 = fma(_1631, _1145, _1729);
    float _1743 = fma(_1733, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1737);
    float _1745 = _1735 + (-1.0);
    float _1747 = _1739 * (-2.0);
    float _1749 = -_1695;
    float _1751 = fma(_1749, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1575);
    float _1753 = _997 + (-0.5);
    float _1755 = fma(_1745, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1757 = _1743 >= 0.0;
    float _1759 = fma(_1747, _1553, _1553);
    float _1761 = -_1697;
    float _1763 = fma(_1761, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1585);
    float _1765 = _1751 * _1751;
    float _1767 = fma(_1755, _1747, _1755);
    float _1769 = fma(_1753, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1759);
    float _1771 = -_1705;
    float _1773 = fma(_1771, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1603);
    float _1775 = fma(_1763, _1763, _1765);
    float _1777 = _1741 * 0.15915493667125701904296875;
    float _1779 = fma(_1767, _1145, _1769);
    float _1781 = _1717 * 6.283185482025146484375;
    float _1783 = sin(_1781);
    float _1785 = fma(_1773, _1773, _1775);
    float _1787 = _1715;
    float _1789 = _1709;
    if (_1757)
    {
        _1665 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1791 = _1665;
    int _1793 = as_type<int>(_1791);
    if (_1757)
    {
        out.m_51.x = 0.0;
    }
    float _1795 = _1717 * 6.283185482025146484375;
    float _1797 = cos(_1795);
    if (_1757)
    {
        float _1799 = _1791 * 5.0;
        _1793 = as_type<int>(_1799);
    }
    int _1801 = _1793;
    if (_1757)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5992 = as_type<float>(_1801);
        out.gl_Position.z = _5992;
    }
    float _1803 = _1777 * 6.283185482025146484375;
    float _1805 = sin(_1803);
    float _1807 = _1779 * 0.15915493667125701904296875;
    float _1809 = _1777 * 6.283185482025146484375;
    float _1811 = cos(_1809);
    float _1813 = sqrt(_1785);
    if (_1757)
    {
        return out;
    }
    float _1815 = in.m_75.x;
    float _1817 = in.m_75.y;
    float _1819 = in.m_75.z;
    float _1821 = _1807 * 6.283185482025146484375;
    float _1823 = cos(_1821);
    float _1825 = _1661 * _1813;
    float _1827 = _532 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1829 = _1797 * _1811;
    float _1831 = _1797 * _1805;
    float _1833 = _1783 * _1805;
    float _1835 = _562 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1837 = _1783 * _1811;
    float _1839 = _1807 * 6.283185482025146484375;
    float _1841 = sin(_1839);
    float _1843 = _1825 * _1835;
    float _1845 = _1797 * _1823;
    float _1847 = _1811 * _1823;
    float _1849 = _1783 * _1823;
    float _1851 = _1805 * _1823;
    float _1853 = _1825 * _1827;
    float _1855 = _528 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1857 = _1845 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1859 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1817);
    float _1861 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1815);
    float _1863 = _1825 * _1855;
    float _1865 = _1845 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1867 = _1859 * _1853;
    float _1869 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1819);
    float _1871 = _1861 * _1843;
    float _1873 = fma(_1841, _1829, _1833);
    float _1875 = _1845 * _1867;
    float _1877 = _1869 * _1863;
    float _1879 = -_1837;
    float _1881 = fma(_1841, _1831, _1879);
    float _1883 = -_1867;
    float _1885 = _1841 * _1883;
    float _1887 = fma(_1873, _1871, _1875);
    float _1889 = -_1831;
    float _1891 = fma(_1841, _1837, _1889);
    float _1893 = _1849 * _1867;
    float _1895 = fma(_1847, _1871, _1885);
    float _1897 = fma(_1881, _1877, _1887);
    float _1899 = fma(_1841, _1833, _1829);
    float _1901 = fma(_1891, _1871, _1893);
    float _1903 = fma(_1851, _1877, _1895);
    float _1905 = _1897 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1907 = _1897 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1909 = fma(_1899, _1877, _1901);
    float _1911 = _1873 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1913 = fma(_1903, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1905);
    float _1915 = fma(_1903, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1907);
    float _1917 = _1845 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1919 = fma(_1847, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1911);
    float _1921 = fma(_1909, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1913);
    float _1923 = fma(_1909, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1915);
    float _1925 = -_1841;
    float _1927 = fma(_1925, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1857);
    float _1929 = -_1841;
    float _1931 = fma(_1929, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1865);
    float _1933 = _1921 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1935 = _1923 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    bool _1937 = _1817 != 0.0;
    bool _1939 = isnan(_1817);
    bool _1941 = _1937 || _1939;
    bool _1943 = isnan(0.0);
    bool _1945 = _1941 || _1943;
    float _1947 = -_1841;
    float _1949 = fma(_1947, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1917);
    float _1951 = _1571 + _1933;
    float _1953 = _1515 + _1935;
    float _1955 = _1873 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1957 = _1873 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1959 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1961 = _1951 + _1959;
    float _1963 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1965 = _1953 + _1963;
    float _1967 = fma(_1847, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1955);
    float _1969 = fma(_1847, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1957);
    float _1971 = _1961 * _1961;
    float _1973 = _1965 * _1965;
    float _1975 = in.m_77.x;
    float _1977 = in.m_77.y;
    float _1979 = in.m_77.z;
    float _1981 = _1897 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _1983 = _1815 == 0.0;
    bool _1985 = !_1945;
    bool _1987 = _1983 && _1985;
    float _1989 = _1971 + _1973;
    float _1991 = _1881 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1993 = fma(_1903, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1981);
    bool _1995 = _1819 == 0.0;
    bool _1997 = _1995 && _1987;
    float _1999 = sqrt(_1989);
    float _2001 = fma(_1891, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1967);
    float _2003 = fma(_1909, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1993);
    float _2005 = _1881 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2007 = _1881 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2009 = fma(_1851, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1991);
    float _2011 = _2003 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2013 = fma(_1851, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2005);
    float _2015 = fma(_1851, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2007);
    float _2017 = fma(_1891, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1919);
    float _2019 = _1503 + _2011;
    float _2021 = fma(_1891, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1969);
    bool _2023 = _1999 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2025 = _1975;
    float _2027 = _1977;
    float _2029 = _1979;
    float _2031 = _1815;
    float _2033 = _1971;
    float _2035 = _1973;
    float _2037 = _1951;
    float _2039 = _1953;
    float _2041 = _1819;
    float _2043 = _1825;
    if (!_1997)
    {
        float _2045 = fma(_1815, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1975);
        _2025 = _2045;
    }
    float _2047 = _2025;
    if (!_1997)
    {
        float _2049 = fma(_1817, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1977);
        _2027 = _2049;
    }
    float _2051 = _2027;
    if (!_1997)
    {
        float _2053 = fma(_1819, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1979);
        _2029 = _2053;
    }
    float _2055 = _2029;
    if (!_2023)
    {
        _2031 = _2019;
    }
    float _2057 = _2031;
    bool _2059 = !_2023;
    float _2061 = _2057;
    if (!_2059)
    {
        float _2063 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2065 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2067 = _1999 + _2065;
        float _2069 = _2019 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2071 = rsqrt(_1989);
        float _2073 = _2067 * _2063;
        float _2075 = _2073 * 0.15915493667125701904296875;
        float _2077 = _2075 * 6.283185482025146484375;
        float _2079 = sin(_2077);
        float _2081 = _2075 * 6.283185482025146484375;
        float _2083 = cos(_2081);
        float _2085 = fma(_2079, _2069, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2087 = _2071 * _2085;
        float _2089 = fma(_1961, _2087, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2091 = _2083 + (-1.0);
        float _2093 = fma(_1965, _2087, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2095 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2097 = _2089 + _2095;
        float _2099 = _2091 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2101 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2103 = _2093 + _2101;
        float _2105 = _2097 * _2097;
        float _2107 = fma(_2019, _2083, _2099);
        float _2109 = _2103 * _2103;
        _2061 = _2107;
        _2033 = _2105;
        _2035 = _2109;
        _2037 = _2089;
        _2039 = _2093;
        _2041 = _2069;
    }
    float _2111 = _2061;
    float _2113 = _2033;
    float _2115 = _2035;
    float _2117 = _2037;
    float _2119 = _2039;
    float _2121 = _2041;
    float _2123 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2125 = _2111 + _2123;
    float _2127 = fma(_1849, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1927);
    float _2129 = fma(_1849, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1931);
    float _2131 = fma(_1849, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1949);
    float _2133 = fma(_2125, _2125, _2113);
    float _2135 = _2127 * _2051;
    float _2137 = _2129 * _2051;
    float _2139 = _2131 * _2051;
    float _2141 = _2133 + _2115;
    float _2143 = fma(_1899, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2009);
    float _2145 = fma(_1899, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2013);
    float _2147 = fma(_2001, _2047, _2135);
    float _2149 = fma(_2017, _2047, _2137);
    float _2151 = fma(_1899, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2015);
    float _2153 = sqrt(_2141);
    float _2155 = fma(_2021, _2047, _2139);
    float _2157 = fma(_2143, _2055, _2147);
    float _2159 = fma(_2145, _2055, _2149);
    float _2161 = fma(_2151, _2055, _2155);
    out.m_79.x = _2157;
    out.m_79.y = _2159;
    out.m_79.z = _2161;
    bool _2163 = _2153 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2165 = isnan(_2153);
    bool _2167 = _2163 || _2165;
    bool _2169 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2171 = _2167 || _2169;
    float _2173 = _2121;
    if (!_2171)
    {
        _2173 = 1.0;
    }
    float _2175 = _2173;
    bool _2177 = !_2171;
    float _2179 = _2175;
    if (!_2177)
    {
        bool _2181 = _2153 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2183 = isnan(_2153);
        bool _2185 = _2181 || _2183;
        bool _2187 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2189 = _2185 || _2187;
        if (!_2189)
        {
            float _2191 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2193 = _2153 + _2191;
            float _2195 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2197 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2195;
            float _2199 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2201 = _2199 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2203 = 1.0 / _2197;
            float _2205 = _2193 * _2203;
            float _2207 = fma(_2205, _2201, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2179 = _2207;
            _2209 = true;
        }
        else
        {
            bool _2211 = _2153 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2213 = isnan(_2153);
            bool _2215 = _2211 || _2213;
            bool _2217 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2219 = _2215 || _2217;
            if (!_2219)
            {
                float _2221 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2223 = _2153 + _2221;
                float _2225 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2227 = _2225 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2229 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2231 = _2229 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2233 = 1.0 / _2227;
                float _2235 = _2223 * _2233;
                float _2237 = fma(_2235, _2231, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2179 = _2237;
                _2209 = true;
            }
            else
            {
                _2179 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2209 = false;
    float _2239 = _2179;
    float _2241 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2243 = _2111 + _2241;
    float _2245 = _1703 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2247 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2249 = _2117 + _2247;
    float _2251 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2253 = _2119 + _2251;
    float _2255 = fma(_2243, _2239, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2257 = fma(_1709, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2245);
    float _2259 = fma(_2249, _2239, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2261 = fma(_2253, _2239, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2263 = -_1503;
    float _2265 = _2263 + _2255;
    float _2267 = fma(_1721, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2257);
    float _2269 = -_1571;
    float _2271 = _2269 + _2259;
    float _2273 = -_1515;
    float _2275 = _2273 + _2261;
    float _2277 = _2265 * _2265;
    float _2279 = _2267 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2281 = _1703 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2283 = fma(_2271, _2271, _2277);
    float _2285 = 1.0 / _2279;
    float _2287 = fma(_1709, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2281);
    float _2289 = fma(_2275, _2275, _2283);
    float _2291 = fma(_1721, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2287);
    float _2293 = sqrt(_2289);
    float _2295 = _2291 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2297 = _2295 + _2279;
    float _2299 = _2297 * _2285;
    float _2301 = _2299 * 0.5;
    bool _2303 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2305 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2307 = _2303 || _2305;
    bool _2309 = isnan(0.5);
    bool _2311 = _2307 || _2309;
    float _2313 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2315 = fma(_2301, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2313);
    bool _2317 = _2293 > 0.0;
    float _2319 = 1.0 / _2315;
    bool _2321 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2323 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2325 = _2321 || _2323;
    bool _2327 = isnan(0.5);
    bool _2329 = _2325 || _2327;
    bool _2331 = !_2317;
    float _2333 = _2255;
    float _2335 = _2259;
    float _2337 = _2261;
    if (!_2331)
    {
        float _2339 = _188 * _188;
        float _2341 = rsqrt(_2289);
        float _2343 = fma(_186, _186, _2339);
        float _2345 = fma(_190, _190, _2343);
        float _2347 = sqrt(_2345);
        float _2349 = _2271 * _2341;
        float _2351 = _2265 * _2341;
        float _2353 = _2275 * _2341;
        bool _2355 = _2347 > 0.0;
        bool _2357 = !_2355;
        if (!_2357)
        {
            float _2359 = rsqrt(_2345);
            float _2361 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2363 = _188 * _2359;
            float _2365 = _186 * _2359;
            float _2367 = _2351 * _2363;
            float _2369 = _190 * _2359;
            float _2371 = fma(_2349, _2365, _2367);
            float _2373 = _2361 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2375 = fma(_2353, _2369, _2371);
            float _2377 = _2375 * _2373;
            float _2379 = fma(_186, _2377, _2259);
            float _2381 = fma(_188, _2377, _2255);
            float _2383 = fma(_190, _2377, _2261);
            _2333 = _2381;
            _2335 = _2379;
            _2337 = _2383;
        }
    }
    float _2385 = _2333;
    float _2387 = _2335;
    float _2389 = _2337;
    float _2391 = -_1695;
    float _2393 = fma(_2391, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2385);
    float _2395 = -_1697;
    float _2397 = fma(_2395, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2387);
    float _2399 = -_1705;
    float _2401 = fma(_2399, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2389);
    float _2403 = _2393;
    float _2405 = _2397;
    float _2407 = _2401;
    if (_2311)
    {
        _1699 = 1.0;
    }
    float _2409 = _1699;
    float _2411 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2413 = _2319 * _2411;
    float _2415 = _2409;
    if (!_2329)
    {
        float _2417 = _1715 * _1715;
        float _2419 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2421 = -_1515;
        float _2423 = _2421 + _2389;
        float _2425 = -_1571;
        float _2427 = _2425 + _2387;
        float _2429 = fma(_1725, _1725, _2417);
        float _2431 = fma(_1733, _1733, _2429);
        float _2433 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2435 = sqrt(_2431);
        float _2437 = 1.0 / _1825;
        float _2439 = _2433 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2441 = precise::min(_2435, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2443 = _2441 * _2419;
        float _2445 = -_1503;
        float _2447 = _2445 + _2385;
        float _2449 = _2443 * _2437;
        float _2451 = _2439 * _2449;
        float _2453 = _2423 * _2449;
        float _2455 = fma(_2447, _2451, _1703);
        float _2457 = fma(_2427, _2451, _1709);
        float _2459 = fma(_2439, _2453, _1721);
        _2403 = _2455;
        _2405 = _2457;
        _2407 = _2459;
        _2043 = _2437;
    }
    float _2461 = _2403;
    float _2463 = _2405;
    float _2465 = _2407;
    float _2467 = _2043;
    float _2469 = _2467;
    if (!_2311)
    {
        float _2471 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2473 = _2471 * 0.15915493667125701904296875;
        float _2475 = _2473 * 6.283185482025146484375;
        float _2477 = cos(_2475);
        float _2479 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2481 = _2479 * 0.15915493667125701904296875;
        float _2483 = _2473 * 6.283185482025146484375;
        float _2485 = sin(_2483);
        float _2487 = 1.0 / _2477;
        float _2489 = _2481 * 6.283185482025146484375;
        float _2491 = cos(_2489);
        float _2493 = _2485 * _2487;
        float _2495 = _2481 * 6.283185482025146484375;
        float _2497 = sin(_2495);
        float _2499 = _2491 * _2493;
        float _2501 = 1.0 / _2499;
        float _2503 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2505 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2503;
        float _2507 = 1.0 / _2505;
        float _2509 = _2497 * _2501;
        float _2511 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2513 = fma(_2413, _2509, _2511);
        float _2515 = _2513 * _2507;
        float _2517 = precise::clamp(_2515, 0.0, 1.0);
        _2469 = _2473;
        _2415 = _2517;
    }
    float _2519 = _2469;
    float _2521 = _2415;
    float _2523 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2525 = _2461 + _2523;
    float _2527 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2529 = _2463 + _2527;
    float _2531 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2533 = _2465 + _2531;
    float _2535 = _2525 * _2525;
    float _2537 = fma(_2529, _2529, _2535);
    float _2539 = fma(_2533, _2533, _2537);
    float _2541 = rsqrt(_2539);
    float _2543 = sqrt(_2539);
    float _2545 = _2541 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2547 = _2529 * _2545;
    float _2549 = _2533 * _2545;
    float _2551 = _2547 * _2547;
    float _2553 = _2549 * _2549;
    float _2555 = _2551 + _2553;
    float _2557 = sqrt(_2555);
    bool _2559 = _2557 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2561 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2563 = _2557 + _2561;
    float _2565 = _2541;
    float _2567 = _2563;
    float _2569 = _2525;
    float _2571 = _2555;
    if (_2559)
    {
        float _2573 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2565 = _2573;
    }
    float _2575 = _2565;
    float _2577 = _2575;
    if (_2559)
    {
        float _2579 = _2563 * _2575;
        _2567 = _2579;
    }
    float _2581 = _2567;
    if (_2559)
    {
        float _2583 = rsqrt(_2555);
        _2577 = _2583;
    }
    float _2585 = _2577;
    float _2587 = _2585;
    if (_2559)
    {
        float _2589 = _2581 * 0.15915493667125701904296875;
        _1787 = _2589;
    }
    float _2591 = _1787;
    float _2593 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2595 = _2533;
    if (_2559)
    {
        float _2597 = _2591 * 6.283185482025146484375;
        float _2599 = sin(_2597);
        _2595 = _2599;
    }
    float _2601 = _2595;
    float _2603 = precise::max(0.0, _2593);
    float _2605 = _2519;
    if (_2559)
    {
        float _2607 = _2591 * 6.283185482025146484375;
        float _2609 = cos(_2607);
        _2605 = _2609;
    }
    float _2611 = _2605;
    float _2613 = -_2545;
    float _2615 = -_2603;
    float _2617 = fma(_2525, _2613, _2615);
    if (_2559)
    {
        float _2619 = _2617 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2569 = _2619;
    }
    float _2621 = _2569;
    float _2623 = fma(_1709, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2625 = _2621;
    if (!_2559)
    {
        _1789 = _2547;
    }
    float _2627 = _1789;
    float _2629 = _2601;
    float _2631 = _2627;
    if (_2559)
    {
        float _2633 = fma(_2601, _2621, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2629 = _2633;
    }
    float _2635 = _2629;
    float _2637 = _2635;
    if (_2559)
    {
        float _2639 = _2585 * _2635;
        _1541 = _2639;
    }
    float _2641 = _1541;
    if (!_2559)
    {
        _2587 = _2617;
    }
    float _2643 = _2587;
    float _2645 = _2643;
    float _2647 = _2611;
    if (_2559)
    {
        float _2649 = _2611 + (-1.0);
        _2625 = _2649;
    }
    float _2651 = _2625;
    float _2653 = _2651;
    if (_2559)
    {
        float _2655 = _2547 * _2641;
        _2631 = _2655;
    }
    float _2657 = _2631;
    if (!_2559)
    {
        _2637 = _2551;
    }
    float _2659 = _2637;
    float _2661 = _2659;
    if (_2559)
    {
        float _2663 = _2651 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2571 = _2663;
    }
    float _2665 = _2571;
    if (!_2559)
    {
        _2653 = _2549;
    }
    float _2667 = _2653;
    float _2669 = _2667;
    if (_2559)
    {
        float _2671 = _2549 * _2641;
        _2669 = _2671;
    }
    float _2673 = _2669;
    if (_2559)
    {
        float _2675 = _2657 * _2657;
        _2661 = _2675;
    }
    float _2677 = _2661;
    if (_2559)
    {
        float _2679 = fma(_2617, _2611, _2665);
        _2645 = _2679;
    }
    float _2681 = _2645;
    if (!_2559)
    {
        _2647 = _2553;
    }
    float _2683 = _2647;
    float _2685 = _2683;
    if (_2559)
    {
        float _2687 = _2673 * _2673;
        _2685 = _2687;
    }
    float _2689 = _2685;
    float _2691 = fma(_2681, _2681, _2677);
    float _2693 = _2461 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2695 = floor(_2623);
    float _2697 = _2691 + _2689;
    float _2699 = fma(_2463, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2693);
    float _2701 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2703 = fma(_2543, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2701);
    float _2705 = precise::clamp(_2703, 0.0, 1.0);
    float _2707 = fma(_1721, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2709 = _2461 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2711 = fma(_2465, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2699);
    float _2713 = rsqrt(_2697);
    float _2715 = -_2705;
    float _2717 = _2715 + 1.0;
    float _2719 = _2711 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2721 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2723 = _2719 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2725 = abs(_2717);
    float _2727 = log2(_2725);
    float _2729 = _2461 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2731 = -_2723;
    float _2733 = fma(_2731, _2721, 1.0);
    float _2735 = _2461 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2737 = fma(_2463, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2729);
    float _2739 = _2713 * _2657;
    float _2741 = _2713 * _2681;
    float _2743 = _2713 * _2673;
    float _2745 = fma(_2463, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2735);
    float _2747 = fma(_2465, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2737);
    float _2749 = _2739 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2751 = fma(_2463, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2709);
    float _2753 = fma(_2465, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2745);
    float _2755 = _2747 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2757 = -_2749;
    float _2759 = fma(_2741, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2757);
    float _2761 = fma(_2465, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2751);
    float _2763 = _2753 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2765 = _2755 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2767 = -_2743;
    float _2769 = fma(_2767, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2759);
    float _2771 = _2761 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2773 = floor(_2707);
    float _2775 = fma(_2763, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2765);
    float _2777 = _2727 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2779 = fma(_2769, -0.5, 0.5);
    float _2781 = -_2695;
    float _2783 = _2623 + _2781;
    float _2785 = fma(_2719, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2775);
    float _2787 = fma(_2769, 0.5, 0.5);
    float _2789 = log2(_2733);
    float _2791 = fma(_2771, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2785);
    float _2793 = _2755 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2795 = _2755 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2797 = fma(_2787, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2799 = fma(_2763, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2793);
    float _2801 = fma(_2763, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2795);
    float _2803 = 1.0 / _2791;
    float _2805 = fma(_2787, _2797, -0.212114393711090087890625);
    float _2807 = fma(_2719, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2799);
    float _2809 = fma(_2719, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2801);
    float _2811 = -_2773;
    float _2813 = _2707 + _2811;
    float _2815 = _2741 + 1.0;
    float _2817 = fma(_2771, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2807);
    float _2819 = fma(_2771, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2809);
    float _2821 = exp2(_2777);
    float _2823 = _2789 * 0.693147182464599609375;
    float _2825 = sqrt(_2779);
    float _2827 = _2817 * _2803;
    float _2829 = _2819 * _2803;
    float2 _7680 = float2(_2783, _2813);
    float _2831 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7680, float2(0.0), isnan(_7680)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7680, float2(0.0), isnan(_7680)), level(0.0)).x;
    float _2833 = fma(_2787, _2805, 1.570728778839111328125);
    float _2835 = _2823 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2837 = fma(_2827, 0.5, 0.5);
    float _2839 = fma(_2829, -0.5, 0.5);
    float _2841 = -_2741;
    float _2843 = fma(_2821, _2815, _2841);
    float _2845 = fma(_2843, 0.5, 0.5);
    float _2847 = _2825 * 0.636619746685028076171875;
    float3 _7714 = float3(_2837, _2839, _2835);
    float _2849 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7714, float3(0.0), isnan(_7714)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7714, float3(0.0), isnan(_7714)), level(0.0)).x;
    float _2851 = -_2833;
    float _2853 = fma(_2847, _2851, 1.0);
    float3 _7730 = float3(_2837, _2839, _2835);
    float4 _2856 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7730, float3(0.0), isnan(_7730)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7730, float3(0.0), isnan(_7730)), level(0.0)).xyzw;
    float _2858 = _2856.x;
    float _2860 = _2856.y;
    float _2862 = _2856.z;
    float _2864 = _2856.w;
    float2 _7746 = float2(_2853, _2845);
    float3 _2868 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7746, float2(0.0), isnan(_7746)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7746, float2(0.0), isnan(_7746)), level(0.0)).xyz;
    float _2870 = _2868.x;
    float _2872 = _2868.y;
    float _2874 = _2868.z;
    float _2876 = abs(_2413);
    float _2878 = log2(_2876);
    float _2880 = _2755 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2882 = _2543 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2884 = isnan(_2543);
    bool _2886 = _2882 || _2884;
    bool _2888 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2890 = _2886 || _2888;
    float _2892 = fma(_2763, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2880);
    float _2894 = in.m_81.x;
    bool _2896 = _2413 <= 8000.0;
    bool _2898 = isnan(_2413);
    bool _2900 = _2896 || _2898;
    bool _2902 = isnan(8000.0);
    bool _2904 = _2900 || _2902;
    float _2906 = float(_2904);
    float _2908 = fma(_2719, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2892);
    float _2910 = _2727 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2912 = _2817 + _2791;
    float _2914 = fma(_2771, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2908);
    float _2916 = _2791 * 0.5;
    float _2918 = _2878 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2920 = exp2(_2910);
    float _2922 = _2912 * 0.5;
    out.gl_Position.x = _2817;
    out.gl_Position.y = _2819;
    out.gl_Position.z = _2914;
    out.gl_Position.w = _2791;
    float _2924 = exp2(_2918);
    float _2926 = -_2920;
    float _2928 = _2926 + 1.0;
    float _2930 = _2928 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2932 = fma(_2924, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2934 = precise::clamp(_2932, 0.0, 1.0);
    float _2936 = fma(_2819, -0.5, _2916);
    float _2938 = -_2930;
    float _2940 = _2938 + 1.0;
    float _2942 = fma(_2934, -2.0, 3.0);
    float _2944 = _2934 * _2934;
    float _2946 = _2819;
    float _2948 = _2791;
    float _2950 = _2914;
    float _2952 = _2940;
    if (!_2890)
    {
        _2946 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2954 = _2946;
    float _2956 = _2944 * _2942;
    float _2958 = -_2956;
    float _2960 = _2958 + 1.0;
    float _2962 = fma(_2960, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2956);
    float _2964 = _2914 + _2791;
    float _2966 = _2906 * _2962;
    float _2968 = _2964 * 0.5;
    float _2970 = _2521 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2972 = _2954;
    float _2974 = _2954;
    if (!_2890)
    {
        _2948 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2976 = _2948;
    float _2978 = _2966 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2980 = _2976;
    float _2982 = _2976;
    if (!_2890)
    {
        _2950 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2984 = _2950;
    out.m_83.x = _2922;
    out.m_83.y = _2936;
    out.m_83.z = _2968;
    out.m_83.w = _2791;
    float _2986 = -_2831;
    float _2988 = _2986 + 1.0;
    float _2990 = _2988 * _2978;
    float _2992 = precise::clamp(_2990, 0.0, 1.0);
    float _2994 = -_2992;
    float _2996 = fma(_2994, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2998 = _2996 * _2894;
    float _3000 = _2930 * _2849;
    float _3002 = _2998 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3004 = _2998;
    float _3006 = _2984;
    float _3008 = _2984;
    if (!_2890)
    {
        _3004 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3010 = _3004;
    float _3012 = _2864 * _3000;
    float _3014 = _2864 * _2940;
    out.m_85.x = _3002;
    float _3016 = _3012;
    float _3018 = _3010;
    float _3020 = _3010;
    if (!_2890)
    {
        _2952 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3022 = _2952;
    float _3024 = _2874 * _3000;
    float _3026 = fma(_2870, _3012, _2858);
    float _3028 = fma(_2872, _3012, _2860);
    float _3030 = _3022;
    float _3032 = _3022;
    if (!_2890)
    {
        _3016 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3034 = _3016;
    float _3036 = fma(_2864, _3024, _2862);
    out.m_87.x = _3026;
    out.m_87.y = _3028;
    out.m_87.z = _3036;
    out.m_87.w = _3014;
    bool _3038 = !_2890;
    float _3040 = _3034;
    float _3042 = _3034;
    if (!_3038)
    {
        bool _3044 = _2543 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3046 = isnan(_2543);
        bool _3048 = _3044 || _3046;
        bool _3050 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3052 = _3048 || _3050;
        if (!_3052)
        {
            float _3054 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3056 = _2543 + _3054;
            float _3058 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3060 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3058;
            float _3062 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3064 = _3062 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3066 = 1.0 / _3060;
            float _3068 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3070 = _3068 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3072 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3074 = _3072 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3076 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3078 = _3076 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3080 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3082 = _3080 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3084 = _3056 * _3066;
            float _3086 = precise::clamp(_3084, 0.0, 1.0);
            float _3088 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3090 = _3088 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3092 = fma(_3086, _3064, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3094 = fma(_3086, _3090, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3096 = fma(_3086, _3070, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3098 = fma(_3086, _3074, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3100 = fma(_3086, _3078, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3102 = fma(_3086, _3082, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3042 = _3096;
            _2974 = _3100;
            _3020 = _3092;
            _3008 = _3098;
            _2982 = _3094;
            _3032 = _3102;
            _3104 = true;
        }
        else
        {
            bool _3106 = _2543 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3108 = isnan(_2543);
            bool _3110 = _3106 || _3108;
            bool _3112 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3114 = _3110 || _3112;
            if (!_3114)
            {
                _3018 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3116 = _3018;
            _3020 = _3116;
            if (!_3114)
            {
                _3040 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3118 = _3040;
            _3042 = _3118;
            if (!_3114)
            {
                _2980 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3120 = _2980;
            _2982 = _3120;
            if (!_3114)
            {
                _3006 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3122 = _3006;
            _3008 = _3122;
            if (!_3114)
            {
                _2972 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3124 = _2972;
            _2974 = _3124;
            if (!_3114)
            {
                _3030 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3126 = _3030;
            bool _3128 = !_3114;
            _3032 = _3126;
            if (!_3128)
            {
                bool _3130 = _2543 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3132 = isnan(_2543);
                bool _3134 = _3130 || _3132;
                bool _3136 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3138 = _3134 || _3136;
                if (!_3138)
                {
                    float _3140 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3142 = _2543 + _3140;
                    float _3144 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3146 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3144;
                    float _3148 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3150 = _3148 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3152 = 1.0 / _3146;
                    float _3154 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3156 = _3154 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3158 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3160 = _3158 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3162 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3164 = _3162 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3166 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3168 = _3166 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3170 = _3142 * _3152;
                    float _3172 = precise::clamp(_3170, 0.0, 1.0);
                    float _3174 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3176 = _3174 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3178 = fma(_3172, _3150, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3180 = fma(_3172, _3176, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3182 = fma(_3172, _3156, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3184 = fma(_3172, _3160, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3186 = fma(_3172, _3164, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3188 = fma(_3172, _3168, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3042 = _3182;
                    _2974 = _3186;
                    _3020 = _3178;
                    _3008 = _3184;
                    _2982 = _3180;
                    _3032 = _3188;
                    _3104 = true;
                }
                else
                {
                    _3042 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2974 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3020 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3008 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2982 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3032 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3104 = false;
    float _3190 = _3042;
    float _3192 = _2974;
    float _3194 = _3020;
    float _3196 = _3008;
    float _3198 = _2982;
    float _3200 = _3032;
    float _3202 = _2970 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3204 = fma(_2159, -0.5, 0.5);
    float _3206 = precise::clamp(_3204, 0.0, 1.0);
    float _3208 = -_3190;
    float _3210 = _3208 + _3192;
    float _3212 = -_3194;
    float _3214 = _3212 + _3196;
    out.m_89.x = 0.0;
    float _3216 = fma(_3206, _3210, _3190);
    float _3218 = -_3198;
    float _3220 = _3218 + _3200;
    float _3222 = fma(_3206, _3214, _3194);
    float _3224 = _3216 * 0.586610972881317138671875;
    bool _3226 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3228 = fma(_3206, _3220, _3198);
    out.m_51.x = _3202;
    float _3230 = fma(_3222, 0.298911988735198974609375, _3224);
    bool _3232 = _2521 > 0.0;
    bool _3234 = isnan(_2521);
    bool _3236 = _3232 || _3234;
    bool _3238 = isnan(0.0);
    bool _3240 = _3236 || _3238;
    float _3242 = fma(_3228, 0.114477999508380889892578125, _3230);
    float _3244 = -_3242;
    float _3246 = _3222 + _3244;
    float _3248 = -_3242;
    float _3250 = _3216 + _3248;
    float _3252 = -_3242;
    float _3254 = _3228 + _3252;
    float _3256 = fma(_3246, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3242);
    float _3258 = fma(_3250, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3242);
    float _3260 = fma(_3254, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3242);
    bool _3262 = !_3226;
    if (!_3262)
    {
        float _3264 = -_2461;
        float _3266 = _3264 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3268 = -_2463;
        float _3270 = _3268 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3272 = -_2465;
        float _3274 = _3272 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3276 = _3266 * _3266;
        float _3278 = fma(_3270, _3270, _3276);
        float _3280 = fma(_3274, _3274, _3278);
        float _3282 = sqrt(_3280);
        float _3284 = rsqrt(_3280);
        float _3286 = -_3282;
        float _3288 = _3286 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3290 = _3288 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3292 = precise::clamp(_3290, 0.0, 1.0);
        float _3294 = _3270 * _3284;
        float _3296 = _3266 * _3284;
        float _3298 = abs(_3292);
        float _3300 = log2(_3298);
        float _3302 = _3274 * _3284;
        float _3304 = _3294 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3306 = _2159 * _3296;
        float _3308 = -_3296;
        float _3310 = -_3304;
        float _3312 = fma(_3308, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3310);
        float _3314 = fma(_2157, _3294, _3306);
        float _3316 = -_3302;
        float _3318 = fma(_3316, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3312);
        float _3320 = fma(_2161, _3302, _3314);
        float _3322 = precise::clamp(_3320, 0.0, 1.0);
        float _3324 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3326 = _3318 + _3324;
        float _3328 = _3300 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3330 = _3326 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3332 = precise::clamp(_3330, 0.0, 1.0);
        float _3334 = exp2(_3328);
        float _3336 = _3334 * _3332;
        float _3338 = _3322 * _3336;
        float _3340 = _3338 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3342 = _3338 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3344 = _3338 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _3340;
        out.m_89.y = _3342;
        out.m_89.z = _3344;
    }
    out.m_91.x = _3256;
    out.m_91.y = _3258;
    out.m_91.z = _3260;
    if (_3240)
    {
        return out;
    }
    out.m_51.x = 0.0;
    float _3346 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3346;
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
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3104 = false;
    bool _2209 = false;
    bool _614 = false;
    bool _488 = false;
    bool _212 = false;
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
        float _3403 = as_type<float>(_126);
        out.gl_Position.z = _3403;
    }
    if (!_114)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _130 = in.m_53.w;
    bool _132 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_130);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    float _142 = -_130;
    float _144 = _142 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _146 = 0.0;
    float _148 = _144;
    if (_140)
    {
        float _150 = float(_110);
        _146 = _150;
    }
    float _152 = _146;
    bool _154 = _144 >= _152;
    bool _156 = !_140;
    bool _158 = _154 || _156;
    if (_158)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _120;
    if (_158)
    {
        out.m_51.x = 0.0;
    }
    if (_158)
    {
        float _162 = _160 * 5.0;
        _128 = as_type<int>(_162);
    }
    int _164 = _128;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3472 = as_type<float>(_164);
        out.gl_Position.z = _3472;
    }
    if (_158)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _210;
    if (!_192)
    {
        float _194 = in.m_57.x;
        float _196 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _198 = _194 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _200 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[12].x, _144);
        float _202 = _200 * _196;
        float _204 = floor(_202);
        float _206 = -_204;
        float _208 = _202 + _206;
        _210 = _208;
        _212 = true;
    }
    else
    {
        float _214 = float(_110);
        float _216 = 1.0 / _214;
        float _218 = _144 * _216;
        _210 = _218;
    }
    _212 = false;
    float _220 = _210;
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _224 = _220 + _222;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _228 = _220 + _226;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _232 = _220 + _230;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _236 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _234;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _240 = _238 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _242;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _248 = _246 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _250 = 1.0 / _240;
    bool _252 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _254 = isnan(_220);
    bool _256 = _252 || _254;
    bool _258 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _260 = _256 || _258;
    float _262 = float(_260);
    float _264 = 1.0 / _244;
    bool _266 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _268 = isnan(_220);
    bool _270 = _266 || _268;
    bool _272 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _274 = _270 || _272;
    float _276 = float(_274);
    bool _278 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _280 = 1.0 / _248;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _284 = _220 + _282;
    float _286 = 1.0 / _236;
    float _288 = _284 * _250;
    bool _290 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _292 = isnan(_220);
    bool _294 = _290 || _292;
    bool _296 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _298 = _294 || _296;
    float _300 = float(_298);
    float _302 = _224 * _264;
    bool _304 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _306 = isnan(_220);
    bool _308 = _304 || _306;
    bool _310 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _312 = _308 || _310;
    float _314 = float(_312);
    float _316 = -_300;
    float _318 = _316 + 1.0;
    float _320 = _228 * _280;
    float _322 = -_276;
    float _324 = _322 + 1.0;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _328 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _326;
    float _330 = _314 * _318;
    float _332 = -_314;
    float _334 = _332 + 1.0;
    bool _336 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _338 = isnan(_220);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    float _348 = fma(_328, _302, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _352 = _350 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _354 = _232 * _286;
    float _356 = _276 * _334;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _358;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _364 = _362 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _366 = _262 * _324;
    float _368 = -_262;
    float _370 = _368 + 1.0;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _374 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _372;
    float _376 = fma(_360, _302, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _380 = _378 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _382 = _346 * _370;
    float _384 = fma(_374, _302, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _386 = fma(_352, _320, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _388 = fma(_364, _320, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _390 = fma(_380, _320, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _392 = _348 * _382;
    float _394 = _376 * _382;
    float _396 = -_346;
    float _398 = _396 + 1.0;
    float _400 = _384 * _382;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _402;
    float _406 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[143].x, _392);
    float _408 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[143].y, _394);
    float _410 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[143].z, _400);
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _412;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _416;
    float _420 = fma(_386, _366, _406);
    float _422 = fma(_388, _366, _408);
    float _424 = fma(_404, _354, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _426 = fma(_390, _366, _410);
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _430 = _428 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _432 = fma(_414, _354, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _434 = fma(_418, _354, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _438 = _436 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _442 = _440 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _444 = fma(_424, _356, _420);
    float _446 = fma(_430, _288, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _448 = fma(_438, _288, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _450 = fma(_442, _288, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _452 = fma(_432, _356, _422);
    float _454 = fma(_434, _356, _426);
    float _456 = fma(_446, _330, _444);
    float _458 = fma(_448, _330, _452);
    float _460 = fma(_450, _330, _454);
    float _462 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[147].x, _456);
    float _464 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[147].y, _458);
    float _466 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[147].z, _460);
    bool _468 = !_278;
    float _486;
    if (!_468)
    {
        float _470 = in.m_57.x;
        float _472 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _474 = _470 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _476 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[11].x, _144);
        float _478 = _476 * _472;
        float _480 = floor(_478);
        float _482 = -_480;
        float _484 = _478 + _482;
        _486 = _484;
        _488 = true;
    }
    else
    {
        float _490 = float(_110);
        float _492 = 1.0 / _490;
        float _494 = _144 * _492;
        _486 = _494;
    }
    _488 = false;
    float _496 = _486;
    float _498 = in.m_59.x;
    float _500 = in.m_59.y;
    float _502 = in.m_59.z;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _506 = _496 + _504;
    bool _508 = _496 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _510 = isnan(_496);
    bool _512 = _508 || _510;
    bool _514 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _516 = _512 || _514;
    float _518 = float(_516);
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _520;
    bool _524 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _526 = 1.0 / _522;
    float _528 = _466 * _502;
    float _530 = _506 * _526;
    float _532 = _464 * _500;
    float _534 = -_518;
    float _536 = _534 + 1.0;
    bool _538 = _496 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _540 = isnan(_496);
    bool _542 = _538 || _540;
    bool _544 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _546 = _542 || _544;
    float _548 = float(_546);
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _552 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _550;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _556 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _554;
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _558;
    float _562 = _462 * _498;
    float _564 = _548 * _536;
    float _566 = fma(_552, _530, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _568 = fma(_560, _530, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _570 = fma(_556, _530, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _572 = -_548;
    float _574 = _572 + 1.0;
    float _576 = _566 * _564;
    float _578 = _568 * _564;
    float _580 = _570 * _564;
    float _582 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[107].x, _576);
    float _584 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[107].y, _578);
    float _586 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[107].z, _580);
    float _588 = fma(_518, (*spvDescriptorSet0.vp_c9)._m0[108].x, _582);
    float _590 = fma(_518, (*spvDescriptorSet0.vp_c9)._m0[108].y, _584);
    float _592 = fma(_518, (*spvDescriptorSet0.vp_c9)._m0[108].z, _586);
    bool _594 = !_524;
    float _612;
    if (!_594)
    {
        float _596 = in.m_57.x;
        float _598 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _600 = _596 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _602 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[11].y, _144);
        float _604 = _602 * _598;
        float _606 = floor(_604);
        float _608 = -_606;
        float _610 = _604 + _608;
        _612 = _610;
        _614 = true;
    }
    else
    {
        float _616 = float(_110);
        float _618 = 1.0 / _616;
        float _620 = _144 * _618;
        _612 = _620;
    }
    _614 = false;
    float _622 = _612;
    float _624 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _626 = int(_624);
    float _628 = in.m_57.x;
    float _630 = in.m_57.y;
    float _632 = in.m_61.y;
    float _634 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _636 = int(_634);
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _642 = _640 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _646 = _644 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _648 = float(_626);
    float _650 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _652 = log2(_650);
    float _654 = float(uint(_636));
    float _656 = 1.0 / _648;
    int _658 = ~_636;
    int _660 = _658 + 1;
    int _662 = ~_636;
    int _664 = _662 + 1;
    int _666 = ~_636;
    int _668 = _666 + 1;
    float _670 = 1.0 / _654;
    float _672 = _656 * _144;
    float _674 = 1.0 / _642;
    int _676 = as_type<int>(_670) + (-2);
    float _678 = trunc(_672);
    int _680 = int(_678);
    float _682 = 1.0 / _646;
    float _684 = float(uint(_680));
    float _686 = as_type<float>(_676) * _684;
    float _688 = trunc(_686);
    float _690 = precise::max(_688, 0.0);
    uint _693 = uint(_690);
    int _695 = ~_636;
    int _697 = _695 + 1;
    int _699 = _660 * int(_693);
    int _701 = _699 + _680;
    float _703 = float(_636);
    float _705 = float(uint(_701));
    float _707 = as_type<float>(_676) * _705;
    float _709 = trunc(_707);
    float _711 = precise::max(_709, 0.0);
    uint _713 = uint(_711);
    int _715 = int(_693) + int(_713);
    float _717 = float(_110);
    int _719 = _697 * _715;
    int _721 = _719 + _680;
    float _723 = float(_680);
    float _725 = 1.0 / _717;
    int _727 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _729 = _727 != 0;
    bool _731 = _723 >= _703;
    bool _733 = isnan(_723);
    bool _735 = _731 || _733;
    bool _737 = isnan(_703);
    bool _739 = _735 || _737;
    float _741 = float(_739);
    bool _743 = !_729;
    float _745 = _743 ? 7.345489978790283203125 : 1.0;
    bool _747 = uint(_721) >= uint(_636);
    float _749 = trunc(_741);
    int _751 = int(_749);
    float _753 = _745 * _628;
    bool _755 = !_747;
    int _757 = _755 ? 0 : (-1);
    bool _759 = _636 == 0;
    int _761 = ~_715;
    int _763 = _761 + _757;
    int _765 = _763 + 1;
    float _767 = floor(_753);
    float _769 = _703 * _144;
    int _771 = _636 * _765;
    int _773 = _771 + _680;
    float _775 = _769 * _725;
    int _777 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _779 = _777 != 0;
    int _781 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _783 = _781 != 0;
    int _785 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _787 = _785 != 0;
    int _789 = ~_751;
    int _791 = _789 + 1;
    int _793 = _791 + 1;
    out.m_63.x = 1.0;
    out.m_63.y = 1.0;
    out.m_63.z = 1.0;
    bool _795 = !_759;
    int _797 = _795 ? _773 : (-1);
    float _799 = trunc(_775);
    int _801 = int(_799);
    float _803 = -_767;
    float _805 = _753 + _803;
    int _807 = _797 * _793;
    int _809 = _636 + (-1);
    float _811 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _813 = _805 * _703;
    bool _815 = !_783;
    int _817 = _815 ? 0 : 1;
    int _819 = _751 * _809;
    int _821 = _819 + _807;
    int _823 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _825 = _823 != 0;
    float _827 = trunc(_813);
    int _829 = int(_827);
    int _831 = abs(_817);
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _835 = 1.0 + _833;
    bool _837 = !_825;
    int _839 = _837 ? 0 : 1;
    int _841 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _843 = _841 != 0;
    bool _845 = !_779;
    int _847 = _845 ? 0 : 1;
    float _849 = 1.0 / _835;
    int _851 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _853 = _851 != 0;
    int _855 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _857 = _855 != 0;
    int _859 = _821 * _831;
    int _861 = abs(_839);
    float _863 = -_632;
    float _865 = _863 + 1.0;
    int _867 = abs(_847);
    bool _869 = _630 > 0.5;
    int _871 = _829 * _861;
    int _873 = _871 + _680;
    bool _875 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _877 = isnan(1.0);
    bool _879 = _875 || _877;
    bool _881 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _883 = _879 || _881;
    int _885 = _801 * _867;
    int _887 = _885 + _859;
    float _889 = _632;
    if (_843)
    {
        float _891 = _869 ? _865 : _632;
        _889 = _891;
    }
    float _893 = _889;
    float _895 = _630 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _897 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _899 = _897 != 0;
    float _901 = in.m_48.x;
    float _903 = in.m_48.y;
    float _905 = in.m_48.z;
    bool _907 = !_787;
    int _909 = _907 ? 0 : 1;
    float _911 = fma(_895, -2.0, _811);
    bool _913 = !_899;
    int _915 = _913 ? 0 : 1;
    float _917 = 0.0;
    if (_853)
    {
        float _919 = in.m_57.x;
        _917 = _919;
    }
    float _921 = _917;
    int _923 = abs(_909);
    float _925 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _927 = _925 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _929 = abs(_915);
    float _931 = _628 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _933 = _873 * _923;
    int _935 = _933 + _887;
    float _937 = 1.0 / _927;
    float _939 = -_638;
    float _941 = fma(_931, 2.0, _939);
    int _943 = _829 * _929;
    int _945 = _943 + _935;
    float _947 = -_144;
    float _949 = fma(_947, (*spvDescriptorSet0.vp_c9)._m0[76].x, _941);
    float _951 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[76].y, _911);
    float _953 = float(uint(_945));
    float _955 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _957 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _959 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _961 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _963 = as_type<float>(_676) * _953;
    float _965 = _903 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _967 = _903 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _969 = _903 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _971 = _652 * _144;
    float _973 = fma(_901, (*spvDescriptorSet0.vp_c10)._m0[4].x, _965);
    float _975 = trunc(_963);
    float _977 = precise::max(_975, 0.0);
    uint _979 = uint(_977);
    float _981 = fma(_901, (*spvDescriptorSet0.vp_c10)._m0[5].x, _967);
    float _983 = fma(_901, (*spvDescriptorSet0.vp_c10)._m0[6].x, _969);
    float _985 = in.m_61.x;
    float _987 = _955 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _989 = _957 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _991 = _959 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _993 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _995 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _993;
    float _997 = in.m_57.z;
    float _999 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1001 = _999 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1003 = exp2(_971);
    float _1005 = _995 * _937;
    float _1007 = _628 * 2.0;
    out.m_65.x = _987;
    out.m_65.y = _989;
    out.m_65.z = _991;
    out.m_65.w = _961;
    float _1009 = _1001 * _674;
    bool _1011 = _921 > 0.5;
    bool _1013 = _1011 && _853;
    float _1015 = _630 + _628;
    float _1017 = fma(_905, (*spvDescriptorSet0.vp_c10)._m0[4].z, _973);
    float _1019 = floor(_1007);
    float _1021 = fma(_905, (*spvDescriptorSet0.vp_c10)._m0[6].z, _983);
    float _1023 = -_1003;
    float _1025 = _1023 + 1.0;
    int _1027 = _664 * int(_979);
    int _1029 = _1027 + _945;
    float _1031 = _630 * 2.0;
    float _1033 = _1015 + (-1.0);
    float _1035 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1037 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1035;
    float _1039 = float(uint(_1029));
    float _1041 = floor(_1031);
    bool _1043 = _1019 >= 0.0;
    bool _1045 = isnan(_1019);
    bool _1047 = _1043 || _1045;
    bool _1049 = isnan(0.0);
    bool _1051 = _1047 || _1049;
    float _1053 = _1037 * _682;
    float _1055 = _630 + _997;
    float _1057 = as_type<float>(_676) * _1039;
    float _1059 = _1039;
    if (_853)
    {
        _1059 = _985;
    }
    float _1061 = _1059;
    float _1063 = fma(_1033, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1065 = _1051 ? 0 : 1;
    float _1067 = _1055 + (-1.0);
    bool _1069 = _1019 > 0.0;
    float _1071 = trunc(_1057);
    float _1073 = precise::max(_1071, 0.0);
    uint _1075 = uint(_1073);
    float _1077 = _1061;
    if (_1013)
    {
        float _1079 = -_1061;
        float _1081 = _1079 + 1.0;
        _1077 = _1081;
    }
    float _1083 = _1077;
    bool _1085 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1087 = isnan(0.0);
    bool _1089 = _1085 || _1087;
    bool _1091 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1093 = _1089 || _1091;
    float _1095 = fma(_1067, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1097 = _1093 ? _1025 : 0.0;
    bool _1099 = _1041 > 0.0;
    bool _1101 = _1041 >= 0.0;
    bool _1103 = isnan(_1041);
    bool _1105 = _1101 || _1103;
    bool _1107 = isnan(0.0);
    bool _1109 = _1105 || _1107;
    float _1111 = _997 * 2.0;
    float _1113 = floor(_1111);
    int _1115 = int(_979) + int(_1075);
    float _1117 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1119 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1121 = fma(_628, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1117);
    float _1123 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1119);
    float _1125 = _1117;
    if (!_853)
    {
        _1125 = _985;
    }
    float _1127 = _1125;
    int _1129 = _668 * _1115;
    int _1131 = _1129 + _945;
    float _1133 = _1127;
    if (_853)
    {
        _1133 = _1083;
    }
    float _1135 = _1133;
    float _1137 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1121);
    float _1139 = float(uint(_873));
    float _1141 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1123);
    if (_883)
    {
        float _1143 = _1097 * _849;
        _148 = _1143;
    }
    float _1145 = _148;
    bool _1147 = uint(_1131) >= uint(_636);
    bool _1149 = _1113 >= 0.0;
    bool _1151 = isnan(_1113);
    bool _1153 = _1149 || _1151;
    bool _1155 = isnan(0.0);
    bool _1157 = _1153 || _1155;
    float _1159 = as_type<float>(_676) * _1139;
    int _1161 = ~_1065;
    int _1163 = _1161 + 1;
    int _1165 = _1163 + 1;
    float _1167 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1169 = _622 + _1167;
    int _1171 = _1165;
    if (!_1069)
    {
        int _1173 = ~_1065;
        int _1175 = _1173 + 1;
        _1171 = _1175;
    }
    int _1177 = _1171;
    int _1179 = _1109 ? 0 : 1;
    float _1181 = trunc(_1159);
    float _1183 = precise::max(_1181, 0.0);
    uint _1185 = uint(_1183);
    bool _1187 = !_1147;
    int _1189 = _1187 ? 0 : (-1);
    float _1191 = fma(_1005, _1169, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    int _1193 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1195 = _1193 != 0;
    int _1197 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1199 = _1197 != 0;
    int _1201 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1203 = _1201 != 0;
    int _1205 = _1157 ? 0 : 1;
    int _1207 = ~_1115;
    int _1209 = _1207 + _1189;
    int _1211 = _1209 + 1;
    float _1213 = fma(_1135, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    bool _1215 = _1113 > 0.0;
    float _1217 = fma(_893, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _1219 = fma(_905, (*spvDescriptorSet0.vp_c10)._m0[5].z, _981);
    int _1221 = _636 * _1211;
    int _1223 = _1221 + _945;
    bool _1225 = _622 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1227 = isnan(_622);
    bool _1229 = _1225 || _1227;
    bool _1231 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1233 = _1229 || _1231;
    float _1235 = float(_1233);
    float _1237 = -_951;
    float _1239 = fma(_1141, _1217, _1237);
    float _1241 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1243 = _622 + _1241;
    int _1245 = ~_636;
    int _1247 = _1245 + 1;
    bool _1249 = !_759;
    int _1251 = _1249 ? _1223 : (-1);
    float _1253 = fma(_1009, _1243, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _1255 = _622 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1257 = isnan(_622);
    bool _1259 = _1255 || _1257;
    bool _1261 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1263 = _1259 || _1261;
    float _1265 = float(_1263);
    int _1267 = _1247 * int(_1185);
    int _1269 = _1267 + _873;
    int _1271 = _1251 >> 31;
    float _1273 = -_1235;
    float _1275 = _1273 + 1.0;
    bool _1277 = _622 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1279 = isnan(_622);
    bool _1281 = _1277 || _1279;
    bool _1283 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1285 = _1281 || _1283;
    float _1287 = float(_1285);
    float _1289 = -_1265;
    float _1291 = _1289 + 1.0;
    int _1293 = _1271 & 3;
    float _1295 = _1265 * _1275;
    float _1297 = float(uint(_1269));
    float _1299 = _1287 * _1291;
    int _1301 = _1251 + _1293;
    float _1303 = -_1287;
    float _1305 = _1303 + 1.0;
    bool _1307 = _622 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1309 = isnan(_622);
    bool _1311 = _1307 || _1309;
    bool _1313 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1315 = _1311 || _1313;
    float _1317 = float(_1315);
    float _1319 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1321 = _622 + _1319;
    int _1323 = _1301 >> 2;
    float _1325 = as_type<float>(_676) * _1297;
    float _1327 = _1317 * _1305;
    int _1329 = _1323 << 4;
    int _1331 = _1329 + 368;
    float _1333 = fma(_1053, _1321, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1335 = -_1317;
    float _1337 = _1335 + 1.0;
    float _1339 = trunc(_1325);
    float _1341 = precise::max(_1339, 0.0);
    uint _1343 = uint(_1341);
    uint _1345 = uint(int(uint(_1331) >> uint(2)));
    uint _1347 = uint(int(uint(int(_1345)) >> uint(2)));
    int _1349 = int(_1345) & 3;
    float _1351 = (*spvDescriptorSet0.vp_c9)._m0[int(_1347)][_1349];
    int _1353 = int(_1345) + 1;
    uint _1355 = uint(int(uint(_1353) >> uint(2)));
    int _1357 = _1353 & 3;
    float _1359 = (*spvDescriptorSet0.vp_c9)._m0[int(_1355)][_1357];
    float _1361 = _1191 * _1327;
    int _1363 = ~_1205;
    int _1365 = _1363 + 1;
    int _1367 = _1365 + 1;
    int _1369 = _1367;
    if (!_1215)
    {
        int _1371 = ~_1205;
        int _1373 = _1371 + 1;
        _1369 = _1373;
    }
    int _1375 = _1369;
    float _1377 = fma(_1337, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1361);
    float _1379 = fma(_1137, _1213, _949);
    bool _1381 = !_1195;
    int _1383 = _1381 ? 0 : 1;
    int _1385 = _1251 & 3;
    bool _1387 = _1385 != 0;
    float _1389 = fma(_1253, _1299, _1377);
    int _1391 = ~_1179;
    int _1393 = _1391 + 1;
    int _1395 = _1393 + 1;
    int _1397 = _1395;
    if (!_1099)
    {
        int _1399 = ~_1179;
        int _1401 = _1399 + 1;
        _1397 = _1401;
    }
    int _1403 = _1397;
    int _1405 = int(_1185) + int(_1343);
    int _1407 = abs(_1383);
    bool _1409 = uint(_1385) > 1u;
    float _1411 = float(_1177);
    int _1413 = _1331 + 8;
    uint _1415 = uint(int(uint(_1413) >> uint(2)));
    uint _1417 = uint(int(uint(int(_1415)) >> uint(2)));
    int _1419 = int(_1415) & 3;
    float _1421 = (*spvDescriptorSet0.vp_c9)._m0[int(_1417)][_1419];
    int _1423 = int(_1415) + 1;
    uint _1425 = uint(int(uint(_1423) >> uint(2)));
    int _1427 = _1423 & 3;
    float _1429 = (*spvDescriptorSet0.vp_c9)._m0[int(_1425)][_1427];
    int _1431 = _1251 & 3;
    bool _1433 = _1431 != 0;
    float _1435 = fma(_1333, _1295, _1389);
    int _1437 = ~_636;
    int _1439 = _1437 + 1;
    float _1441 = _1239 + 0.5;
    int _1443 = _1433 ? 0 : 1;
    float _1445 = fma(_1235, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1435);
    bool _1447 = !_1199;
    int _1449 = _1447 ? 0 : 1;
    int _1451 = _1439 * _1405;
    int _1453 = _1451 + _873;
    int _1455 = ~_1443;
    int _1457 = _1455 + 1;
    int _1459 = _1457 + 1;
    int _1461 = _1459;
    if (!_1409)
    {
        int _1463 = ~_1443;
        int _1465 = _1463 + 1;
        _1461 = _1465;
    }
    int _1467 = _1461;
    bool _1469 = !_1387;
    int _1471 = _1469 ? 0 : 1;
    int _1473 = abs(_1449);
    int _1475 = abs(_1467);
    float _1477 = float(_1375);
    float _1479 = _1379 + 0.5;
    bool _1481 = _1385 != 3;
    int _1483 = abs(_1471);
    float _1485 = float(_1473);
    out.m_67.x = _1479;
    out.m_67.y = _1441;
    bool _1487 = uint(_1453) >= uint(_636);
    float _1489 = _1485 * _1411;
    bool _1491 = uint(_1385) >= 2u;
    int _1493 = ~_1475;
    int _1495 = _1493 + 1;
    int _1497 = _1495 + 1;
    bool _1499 = !_1487;
    int _1501 = _1499 ? 0 : (-1);
    float _1503 = _1219 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1505 = _1491 ? 0 : 1;
    int _1507 = _1497 * as_type<int>(_1359);
    int _1509 = ~_1405;
    int _1511 = _1509 + _1501;
    int _1513 = _1511 + 1;
    float _1515 = _1021 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1517 = ~_1483;
    int _1519 = _1517 + 1;
    int _1521 = _1519 + 1;
    int _1523 = ~_1505;
    int _1525 = _1523 + 1;
    int _1527 = _1525 + 1;
    int _1529 = _636 * _1513;
    int _1531 = _1529 + _873;
    bool _1533 = _1385 != 3;
    int _1535 = _1521 * as_type<int>(_1351);
    int _1537 = _1535 + _1507;
    int _1539 = _1527;
    float _1541 = _1503;
    if (_1481)
    {
        int _1543 = ~_1505;
        int _1545 = _1543 + 1;
        _1539 = _1545;
    }
    int _1547 = _1539;
    float _1549 = in.m_69.x;
    float _1551 = in.m_69.y;
    float _1553 = in.m_69.z;
    bool _1555 = !_1533;
    int _1557 = _1555 ? 0 : (-1);
    float _1559 = _1489 * (-2.0);
    int _1561 = abs(_1547);
    int _1563 = abs(_1557);
    bool _1565 = !_857;
    int _1567 = _1565 ? 0 : 1;
    int _1569 = abs(_1567);
    float _1571 = _1017 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1573 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1575 = _1503 + _1573;
    int _1577 = ~_1561;
    int _1579 = _1577 + 1;
    int _1581 = _1579 + 1;
    float _1583 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1585 = _1571 + _1583;
    float _1587 = float(_1407);
    float _1589 = _1575 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1591 = ~_1563;
    int _1593 = _1591 + 1;
    int _1595 = _1593 + 1;
    int _1597 = _1581 * as_type<int>(_1421);
    int _1599 = _1597 + _1537;
    float _1601 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1603 = _1515 + _1601;
    float _1605 = _1587 * _1477;
    float _1607 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1589);
    int _1609 = _1595 * as_type<int>(_1429);
    int _1611 = _1609 + _1599;
    float _1613 = _1605 * (-2.0);
    float _1615 = fma(_1603, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1607);
    float _1617 = fma(_1559, _1551, _1551);
    int _1619 = ~_1569;
    int _1621 = _1619 + 1;
    int _1623 = _1621 + 1;
    float _1625 = fma(_1063, _1613, _1063);
    float _1627 = _1575 * _1575;
    float _1629 = fma(_1613, _1549, _1549);
    float _1631 = fma(_1095, _1559, _1095);
    float _1633 = _592 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _1635 = _1615 >= 0.0;
    float _1637 = fma(_1585, _1585, _1627);
    int _1639 = _1611 * _1623;
    bool _1641 = !_759;
    int _1643 = _1641 ? _1531 : (-1);
    float _1645 = _590 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1647 = fma(_1603, _1603, _1637);
    float _1649 = _628 + (-0.5);
    float _1651 = _1633 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1653 = _1643 * _1569;
    int _1655 = _1653 + _1639;
    float _1657 = _588 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1659 = _1645 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1661 = rsqrt(_1647);
    float _1663 = _1637;
    float _1665 = _1553;
    if (_1635)
    {
        _1663 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1667 = _1663;
    float _1669 = _1657 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1671 = _1445 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1673 = float(_1655);
    float _1675 = fma(_1649, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1629);
    int _1677 = as_type<int>(_1667);
    if (_1635)
    {
        float _1679 = _1667 * 5.0;
        _1677 = as_type<int>(_1679);
    }
    int _1681 = _1677;
    bool _1683 = !_1203;
    int _1685 = _1683 ? 0 : 1;
    out.m_71.x = _1669;
    out.m_71.y = _1659;
    out.m_71.z = _1651;
    out.m_71.w = _1671;
    float _1687 = fma(_1625, _1145, _1675);
    float _1689 = _630 + (-0.5);
    int _1691 = abs(_1685);
    if (_1635)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5793 = as_type<float>(_1681);
        out.gl_Position.z = _5793;
    }
    float _1693 = float(_1403);
    float _1695 = _1575 * _1661;
    out.m_73.x = _1673;
    float _1697 = _1585 * _1661;
    float _1699 = _1695;
    if (_1635)
    {
        out.m_51.x = 0.0;
    }
    if (_1635)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1701 = -_1695;
    float _1703 = fma(_1701, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1503);
    float _1705 = _1603 * _1661;
    float _1707 = -_1697;
    float _1709 = fma(_1707, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1571);
    float _1711 = float(_1691);
    float _1713 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1715 = _1703 + _1713;
    float _1717 = _1687 * 0.15915493667125701904296875;
    float _1719 = -_1705;
    float _1721 = fma(_1719, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1515);
    float _1723 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1725 = _1709 + _1723;
    float _1727 = _1715 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1729 = fma(_1689, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1617);
    float _1731 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1733 = _1721 + _1731;
    float _1735 = _997 + _628;
    float _1737 = fma(_1725, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1727);
    float _1739 = _1711 * _1693;
    float _1741 = fma(_1631, _1145, _1729);
    float _1743 = fma(_1733, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1737);
    float _1745 = _1735 + (-1.0);
    float _1747 = _1739 * (-2.0);
    float _1749 = -_1695;
    float _1751 = fma(_1749, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1575);
    float _1753 = _997 + (-0.5);
    float _1755 = fma(_1745, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1757 = _1743 >= 0.0;
    float _1759 = fma(_1747, _1553, _1553);
    float _1761 = -_1697;
    float _1763 = fma(_1761, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1585);
    float _1765 = _1751 * _1751;
    float _1767 = fma(_1755, _1747, _1755);
    float _1769 = fma(_1753, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1759);
    float _1771 = -_1705;
    float _1773 = fma(_1771, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1603);
    float _1775 = fma(_1763, _1763, _1765);
    float _1777 = _1741 * 0.15915493667125701904296875;
    float _1779 = fma(_1767, _1145, _1769);
    float _1781 = _1717 * 6.283185482025146484375;
    float _1783 = sin(_1781);
    float _1785 = fma(_1773, _1773, _1775);
    float _1787 = _1715;
    float _1789 = _1709;
    if (_1757)
    {
        _1665 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1791 = _1665;
    int _1793 = as_type<int>(_1791);
    if (_1757)
    {
        out.m_51.x = 0.0;
    }
    float _1795 = _1717 * 6.283185482025146484375;
    float _1797 = cos(_1795);
    if (_1757)
    {
        float _1799 = _1791 * 5.0;
        _1793 = as_type<int>(_1799);
    }
    int _1801 = _1793;
    if (_1757)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5992 = as_type<float>(_1801);
        out.gl_Position.z = _5992;
    }
    float _1803 = _1777 * 6.283185482025146484375;
    float _1805 = sin(_1803);
    float _1807 = _1779 * 0.15915493667125701904296875;
    float _1809 = _1777 * 6.283185482025146484375;
    float _1811 = cos(_1809);
    float _1813 = sqrt(_1785);
    if (_1757)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1815 = in.m_75.x;
    float _1817 = in.m_75.y;
    float _1819 = in.m_75.z;
    float _1821 = _1807 * 6.283185482025146484375;
    float _1823 = cos(_1821);
    float _1825 = _1661 * _1813;
    float _1827 = _532 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1829 = _1797 * _1811;
    float _1831 = _1797 * _1805;
    float _1833 = _1783 * _1805;
    float _1835 = _562 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1837 = _1783 * _1811;
    float _1839 = _1807 * 6.283185482025146484375;
    float _1841 = sin(_1839);
    float _1843 = _1825 * _1835;
    float _1845 = _1797 * _1823;
    float _1847 = _1811 * _1823;
    float _1849 = _1783 * _1823;
    float _1851 = _1805 * _1823;
    float _1853 = _1825 * _1827;
    float _1855 = _528 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1857 = _1845 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1859 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1817);
    float _1861 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1815);
    float _1863 = _1825 * _1855;
    float _1865 = _1845 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1867 = _1859 * _1853;
    float _1869 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1819);
    float _1871 = _1861 * _1843;
    float _1873 = fma(_1841, _1829, _1833);
    float _1875 = _1845 * _1867;
    float _1877 = _1869 * _1863;
    float _1879 = -_1837;
    float _1881 = fma(_1841, _1831, _1879);
    float _1883 = -_1867;
    float _1885 = _1841 * _1883;
    float _1887 = fma(_1873, _1871, _1875);
    float _1889 = -_1831;
    float _1891 = fma(_1841, _1837, _1889);
    float _1893 = _1849 * _1867;
    float _1895 = fma(_1847, _1871, _1885);
    float _1897 = fma(_1881, _1877, _1887);
    float _1899 = fma(_1841, _1833, _1829);
    float _1901 = fma(_1891, _1871, _1893);
    float _1903 = fma(_1851, _1877, _1895);
    float _1905 = _1897 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1907 = _1897 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1909 = fma(_1899, _1877, _1901);
    float _1911 = _1873 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1913 = fma(_1903, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1905);
    float _1915 = fma(_1903, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1907);
    float _1917 = _1845 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1919 = fma(_1847, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1911);
    float _1921 = fma(_1909, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1913);
    float _1923 = fma(_1909, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1915);
    float _1925 = -_1841;
    float _1927 = fma(_1925, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1857);
    float _1929 = -_1841;
    float _1931 = fma(_1929, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1865);
    float _1933 = _1921 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1935 = _1923 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    bool _1937 = _1817 != 0.0;
    bool _1939 = isnan(_1817);
    bool _1941 = _1937 || _1939;
    bool _1943 = isnan(0.0);
    bool _1945 = _1941 || _1943;
    float _1947 = -_1841;
    float _1949 = fma(_1947, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1917);
    float _1951 = _1571 + _1933;
    float _1953 = _1515 + _1935;
    float _1955 = _1873 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1957 = _1873 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1959 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1961 = _1951 + _1959;
    float _1963 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1965 = _1953 + _1963;
    float _1967 = fma(_1847, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1955);
    float _1969 = fma(_1847, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1957);
    float _1971 = _1961 * _1961;
    float _1973 = _1965 * _1965;
    float _1975 = in.m_77.x;
    float _1977 = in.m_77.y;
    float _1979 = in.m_77.z;
    float _1981 = _1897 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _1983 = _1815 == 0.0;
    bool _1985 = !_1945;
    bool _1987 = _1983 && _1985;
    float _1989 = _1971 + _1973;
    float _1991 = _1881 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1993 = fma(_1903, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1981);
    bool _1995 = _1819 == 0.0;
    bool _1997 = _1995 && _1987;
    float _1999 = sqrt(_1989);
    float _2001 = fma(_1891, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1967);
    float _2003 = fma(_1909, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1993);
    float _2005 = _1881 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2007 = _1881 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2009 = fma(_1851, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1991);
    float _2011 = _2003 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2013 = fma(_1851, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2005);
    float _2015 = fma(_1851, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2007);
    float _2017 = fma(_1891, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1919);
    float _2019 = _1503 + _2011;
    float _2021 = fma(_1891, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1969);
    bool _2023 = _1999 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2025 = _1975;
    float _2027 = _1977;
    float _2029 = _1979;
    float _2031 = _1815;
    float _2033 = _1971;
    float _2035 = _1973;
    float _2037 = _1951;
    float _2039 = _1953;
    float _2041 = _1819;
    float _2043 = _1825;
    if (!_1997)
    {
        float _2045 = fma(_1815, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1975);
        _2025 = _2045;
    }
    float _2047 = _2025;
    if (!_1997)
    {
        float _2049 = fma(_1817, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1977);
        _2027 = _2049;
    }
    float _2051 = _2027;
    if (!_1997)
    {
        float _2053 = fma(_1819, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1979);
        _2029 = _2053;
    }
    float _2055 = _2029;
    if (!_2023)
    {
        _2031 = _2019;
    }
    float _2057 = _2031;
    bool _2059 = !_2023;
    float _2061 = _2057;
    if (!_2059)
    {
        float _2063 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2065 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2067 = _1999 + _2065;
        float _2069 = _2019 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2071 = rsqrt(_1989);
        float _2073 = _2067 * _2063;
        float _2075 = _2073 * 0.15915493667125701904296875;
        float _2077 = _2075 * 6.283185482025146484375;
        float _2079 = sin(_2077);
        float _2081 = _2075 * 6.283185482025146484375;
        float _2083 = cos(_2081);
        float _2085 = fma(_2079, _2069, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2087 = _2071 * _2085;
        float _2089 = fma(_1961, _2087, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2091 = _2083 + (-1.0);
        float _2093 = fma(_1965, _2087, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2095 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2097 = _2089 + _2095;
        float _2099 = _2091 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2101 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2103 = _2093 + _2101;
        float _2105 = _2097 * _2097;
        float _2107 = fma(_2019, _2083, _2099);
        float _2109 = _2103 * _2103;
        _2061 = _2107;
        _2033 = _2105;
        _2035 = _2109;
        _2037 = _2089;
        _2039 = _2093;
        _2041 = _2069;
    }
    float _2111 = _2061;
    float _2113 = _2033;
    float _2115 = _2035;
    float _2117 = _2037;
    float _2119 = _2039;
    float _2121 = _2041;
    float _2123 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2125 = _2111 + _2123;
    float _2127 = fma(_1849, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1927);
    float _2129 = fma(_1849, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1931);
    float _2131 = fma(_1849, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1949);
    float _2133 = fma(_2125, _2125, _2113);
    float _2135 = _2127 * _2051;
    float _2137 = _2129 * _2051;
    float _2139 = _2131 * _2051;
    float _2141 = _2133 + _2115;
    float _2143 = fma(_1899, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2009);
    float _2145 = fma(_1899, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2013);
    float _2147 = fma(_2001, _2047, _2135);
    float _2149 = fma(_2017, _2047, _2137);
    float _2151 = fma(_1899, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2015);
    float _2153 = sqrt(_2141);
    float _2155 = fma(_2021, _2047, _2139);
    float _2157 = fma(_2143, _2055, _2147);
    float _2159 = fma(_2145, _2055, _2149);
    float _2161 = fma(_2151, _2055, _2155);
    out.m_79.x = _2157;
    out.m_79.y = _2159;
    out.m_79.z = _2161;
    bool _2163 = _2153 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2165 = isnan(_2153);
    bool _2167 = _2163 || _2165;
    bool _2169 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2171 = _2167 || _2169;
    float _2173 = _2121;
    if (!_2171)
    {
        _2173 = 1.0;
    }
    float _2175 = _2173;
    bool _2177 = !_2171;
    float _2179 = _2175;
    if (!_2177)
    {
        bool _2181 = _2153 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2183 = isnan(_2153);
        bool _2185 = _2181 || _2183;
        bool _2187 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2189 = _2185 || _2187;
        if (!_2189)
        {
            float _2191 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2193 = _2153 + _2191;
            float _2195 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2197 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2195;
            float _2199 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2201 = _2199 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2203 = 1.0 / _2197;
            float _2205 = _2193 * _2203;
            float _2207 = fma(_2205, _2201, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2179 = _2207;
            _2209 = true;
        }
        else
        {
            bool _2211 = _2153 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2213 = isnan(_2153);
            bool _2215 = _2211 || _2213;
            bool _2217 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2219 = _2215 || _2217;
            if (!_2219)
            {
                float _2221 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2223 = _2153 + _2221;
                float _2225 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2227 = _2225 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2229 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2231 = _2229 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2233 = 1.0 / _2227;
                float _2235 = _2223 * _2233;
                float _2237 = fma(_2235, _2231, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2179 = _2237;
                _2209 = true;
            }
            else
            {
                _2179 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2209 = false;
    float _2239 = _2179;
    float _2241 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2243 = _2111 + _2241;
    float _2245 = _1703 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2247 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2249 = _2117 + _2247;
    float _2251 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2253 = _2119 + _2251;
    float _2255 = fma(_2243, _2239, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2257 = fma(_1709, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2245);
    float _2259 = fma(_2249, _2239, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2261 = fma(_2253, _2239, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2263 = -_1503;
    float _2265 = _2263 + _2255;
    float _2267 = fma(_1721, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2257);
    float _2269 = -_1571;
    float _2271 = _2269 + _2259;
    float _2273 = -_1515;
    float _2275 = _2273 + _2261;
    float _2277 = _2265 * _2265;
    float _2279 = _2267 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2281 = _1703 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2283 = fma(_2271, _2271, _2277);
    float _2285 = 1.0 / _2279;
    float _2287 = fma(_1709, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2281);
    float _2289 = fma(_2275, _2275, _2283);
    float _2291 = fma(_1721, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2287);
    float _2293 = sqrt(_2289);
    float _2295 = _2291 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2297 = _2295 + _2279;
    float _2299 = _2297 * _2285;
    float _2301 = _2299 * 0.5;
    bool _2303 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2305 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2307 = _2303 || _2305;
    bool _2309 = isnan(0.5);
    bool _2311 = _2307 || _2309;
    float _2313 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2315 = fma(_2301, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2313);
    bool _2317 = _2293 > 0.0;
    float _2319 = 1.0 / _2315;
    bool _2321 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2323 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2325 = _2321 || _2323;
    bool _2327 = isnan(0.5);
    bool _2329 = _2325 || _2327;
    bool _2331 = !_2317;
    float _2333 = _2255;
    float _2335 = _2259;
    float _2337 = _2261;
    if (!_2331)
    {
        float _2339 = _188 * _188;
        float _2341 = rsqrt(_2289);
        float _2343 = fma(_186, _186, _2339);
        float _2345 = fma(_190, _190, _2343);
        float _2347 = sqrt(_2345);
        float _2349 = _2271 * _2341;
        float _2351 = _2265 * _2341;
        float _2353 = _2275 * _2341;
        bool _2355 = _2347 > 0.0;
        bool _2357 = !_2355;
        if (!_2357)
        {
            float _2359 = rsqrt(_2345);
            float _2361 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2363 = _188 * _2359;
            float _2365 = _186 * _2359;
            float _2367 = _2351 * _2363;
            float _2369 = _190 * _2359;
            float _2371 = fma(_2349, _2365, _2367);
            float _2373 = _2361 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2375 = fma(_2353, _2369, _2371);
            float _2377 = _2375 * _2373;
            float _2379 = fma(_186, _2377, _2259);
            float _2381 = fma(_188, _2377, _2255);
            float _2383 = fma(_190, _2377, _2261);
            _2333 = _2381;
            _2335 = _2379;
            _2337 = _2383;
        }
    }
    float _2385 = _2333;
    float _2387 = _2335;
    float _2389 = _2337;
    float _2391 = -_1695;
    float _2393 = fma(_2391, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2385);
    float _2395 = -_1697;
    float _2397 = fma(_2395, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2387);
    float _2399 = -_1705;
    float _2401 = fma(_2399, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2389);
    float _2403 = _2393;
    float _2405 = _2397;
    float _2407 = _2401;
    if (_2311)
    {
        _1699 = 1.0;
    }
    float _2409 = _1699;
    float _2411 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2413 = _2319 * _2411;
    float _2415 = _2409;
    if (!_2329)
    {
        float _2417 = _1715 * _1715;
        float _2419 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2421 = -_1515;
        float _2423 = _2421 + _2389;
        float _2425 = -_1571;
        float _2427 = _2425 + _2387;
        float _2429 = fma(_1725, _1725, _2417);
        float _2431 = fma(_1733, _1733, _2429);
        float _2433 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2435 = sqrt(_2431);
        float _2437 = 1.0 / _1825;
        float _2439 = _2433 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2441 = precise::min(_2435, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2443 = _2441 * _2419;
        float _2445 = -_1503;
        float _2447 = _2445 + _2385;
        float _2449 = _2443 * _2437;
        float _2451 = _2439 * _2449;
        float _2453 = _2423 * _2449;
        float _2455 = fma(_2447, _2451, _1703);
        float _2457 = fma(_2427, _2451, _1709);
        float _2459 = fma(_2439, _2453, _1721);
        _2403 = _2455;
        _2405 = _2457;
        _2407 = _2459;
        _2043 = _2437;
    }
    float _2461 = _2403;
    float _2463 = _2405;
    float _2465 = _2407;
    float _2467 = _2043;
    float _2469 = _2467;
    if (!_2311)
    {
        float _2471 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2473 = _2471 * 0.15915493667125701904296875;
        float _2475 = _2473 * 6.283185482025146484375;
        float _2477 = cos(_2475);
        float _2479 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2481 = _2479 * 0.15915493667125701904296875;
        float _2483 = _2473 * 6.283185482025146484375;
        float _2485 = sin(_2483);
        float _2487 = 1.0 / _2477;
        float _2489 = _2481 * 6.283185482025146484375;
        float _2491 = cos(_2489);
        float _2493 = _2485 * _2487;
        float _2495 = _2481 * 6.283185482025146484375;
        float _2497 = sin(_2495);
        float _2499 = _2491 * _2493;
        float _2501 = 1.0 / _2499;
        float _2503 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2505 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2503;
        float _2507 = 1.0 / _2505;
        float _2509 = _2497 * _2501;
        float _2511 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2513 = fma(_2413, _2509, _2511);
        float _2515 = _2513 * _2507;
        float _2517 = precise::clamp(_2515, 0.0, 1.0);
        _2469 = _2473;
        _2415 = _2517;
    }
    float _2519 = _2469;
    float _2521 = _2415;
    float _2523 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2525 = _2461 + _2523;
    float _2527 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2529 = _2463 + _2527;
    float _2531 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2533 = _2465 + _2531;
    float _2535 = _2525 * _2525;
    float _2537 = fma(_2529, _2529, _2535);
    float _2539 = fma(_2533, _2533, _2537);
    float _2541 = rsqrt(_2539);
    float _2543 = sqrt(_2539);
    float _2545 = _2541 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2547 = _2529 * _2545;
    float _2549 = _2533 * _2545;
    float _2551 = _2547 * _2547;
    float _2553 = _2549 * _2549;
    float _2555 = _2551 + _2553;
    float _2557 = sqrt(_2555);
    bool _2559 = _2557 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2561 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2563 = _2557 + _2561;
    float _2565 = _2541;
    float _2567 = _2563;
    float _2569 = _2525;
    float _2571 = _2555;
    if (_2559)
    {
        float _2573 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2565 = _2573;
    }
    float _2575 = _2565;
    float _2577 = _2575;
    if (_2559)
    {
        float _2579 = _2563 * _2575;
        _2567 = _2579;
    }
    float _2581 = _2567;
    if (_2559)
    {
        float _2583 = rsqrt(_2555);
        _2577 = _2583;
    }
    float _2585 = _2577;
    float _2587 = _2585;
    if (_2559)
    {
        float _2589 = _2581 * 0.15915493667125701904296875;
        _1787 = _2589;
    }
    float _2591 = _1787;
    float _2593 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2595 = _2533;
    if (_2559)
    {
        float _2597 = _2591 * 6.283185482025146484375;
        float _2599 = sin(_2597);
        _2595 = _2599;
    }
    float _2601 = _2595;
    float _2603 = precise::max(0.0, _2593);
    float _2605 = _2519;
    if (_2559)
    {
        float _2607 = _2591 * 6.283185482025146484375;
        float _2609 = cos(_2607);
        _2605 = _2609;
    }
    float _2611 = _2605;
    float _2613 = -_2545;
    float _2615 = -_2603;
    float _2617 = fma(_2525, _2613, _2615);
    if (_2559)
    {
        float _2619 = _2617 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2569 = _2619;
    }
    float _2621 = _2569;
    float _2623 = fma(_1709, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2625 = _2621;
    if (!_2559)
    {
        _1789 = _2547;
    }
    float _2627 = _1789;
    float _2629 = _2601;
    float _2631 = _2627;
    if (_2559)
    {
        float _2633 = fma(_2601, _2621, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2629 = _2633;
    }
    float _2635 = _2629;
    float _2637 = _2635;
    if (_2559)
    {
        float _2639 = _2585 * _2635;
        _1541 = _2639;
    }
    float _2641 = _1541;
    if (!_2559)
    {
        _2587 = _2617;
    }
    float _2643 = _2587;
    float _2645 = _2643;
    float _2647 = _2611;
    if (_2559)
    {
        float _2649 = _2611 + (-1.0);
        _2625 = _2649;
    }
    float _2651 = _2625;
    float _2653 = _2651;
    if (_2559)
    {
        float _2655 = _2547 * _2641;
        _2631 = _2655;
    }
    float _2657 = _2631;
    if (!_2559)
    {
        _2637 = _2551;
    }
    float _2659 = _2637;
    float _2661 = _2659;
    if (_2559)
    {
        float _2663 = _2651 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2571 = _2663;
    }
    float _2665 = _2571;
    if (!_2559)
    {
        _2653 = _2549;
    }
    float _2667 = _2653;
    float _2669 = _2667;
    if (_2559)
    {
        float _2671 = _2549 * _2641;
        _2669 = _2671;
    }
    float _2673 = _2669;
    if (_2559)
    {
        float _2675 = _2657 * _2657;
        _2661 = _2675;
    }
    float _2677 = _2661;
    if (_2559)
    {
        float _2679 = fma(_2617, _2611, _2665);
        _2645 = _2679;
    }
    float _2681 = _2645;
    if (!_2559)
    {
        _2647 = _2553;
    }
    float _2683 = _2647;
    float _2685 = _2683;
    if (_2559)
    {
        float _2687 = _2673 * _2673;
        _2685 = _2687;
    }
    float _2689 = _2685;
    float _2691 = fma(_2681, _2681, _2677);
    float _2693 = _2461 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2695 = floor(_2623);
    float _2697 = _2691 + _2689;
    float _2699 = fma(_2463, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2693);
    float _2701 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2703 = fma(_2543, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2701);
    float _2705 = precise::clamp(_2703, 0.0, 1.0);
    float _2707 = fma(_1721, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2709 = _2461 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2711 = fma(_2465, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2699);
    float _2713 = rsqrt(_2697);
    float _2715 = -_2705;
    float _2717 = _2715 + 1.0;
    float _2719 = _2711 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2721 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2723 = _2719 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2725 = abs(_2717);
    float _2727 = log2(_2725);
    float _2729 = _2461 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2731 = -_2723;
    float _2733 = fma(_2731, _2721, 1.0);
    float _2735 = _2461 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2737 = fma(_2463, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2729);
    float _2739 = _2713 * _2657;
    float _2741 = _2713 * _2681;
    float _2743 = _2713 * _2673;
    float _2745 = fma(_2463, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2735);
    float _2747 = fma(_2465, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2737);
    float _2749 = _2739 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2751 = fma(_2463, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2709);
    float _2753 = fma(_2465, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2745);
    float _2755 = _2747 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2757 = -_2749;
    float _2759 = fma(_2741, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2757);
    float _2761 = fma(_2465, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2751);
    float _2763 = _2753 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2765 = _2755 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2767 = -_2743;
    float _2769 = fma(_2767, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2759);
    float _2771 = _2761 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2773 = floor(_2707);
    float _2775 = fma(_2763, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2765);
    float _2777 = _2727 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2779 = fma(_2769, -0.5, 0.5);
    float _2781 = -_2695;
    float _2783 = _2623 + _2781;
    float _2785 = fma(_2719, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2775);
    float _2787 = fma(_2769, 0.5, 0.5);
    float _2789 = log2(_2733);
    float _2791 = fma(_2771, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2785);
    float _2793 = _2755 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2795 = _2755 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2797 = fma(_2787, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2799 = fma(_2763, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2793);
    float _2801 = fma(_2763, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2795);
    float _2803 = 1.0 / _2791;
    float _2805 = fma(_2787, _2797, -0.212114393711090087890625);
    float _2807 = fma(_2719, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2799);
    float _2809 = fma(_2719, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2801);
    float _2811 = -_2773;
    float _2813 = _2707 + _2811;
    float _2815 = _2741 + 1.0;
    float _2817 = fma(_2771, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2807);
    float _2819 = fma(_2771, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2809);
    float _2821 = exp2(_2777);
    float _2823 = _2789 * 0.693147182464599609375;
    float _2825 = sqrt(_2779);
    float _2827 = _2817 * _2803;
    float _2829 = _2819 * _2803;
    float2 _7680 = float2(_2783, _2813);
    float _2831 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7680, float2(0.0), isnan(_7680)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7680, float2(0.0), isnan(_7680)), level(0.0)).x;
    float _2833 = fma(_2787, _2805, 1.570728778839111328125);
    float _2835 = _2823 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2837 = fma(_2827, 0.5, 0.5);
    float _2839 = fma(_2829, -0.5, 0.5);
    float _2841 = -_2741;
    float _2843 = fma(_2821, _2815, _2841);
    float _2845 = fma(_2843, 0.5, 0.5);
    float _2847 = _2825 * 0.636619746685028076171875;
    float3 _7714 = float3(_2837, _2839, _2835);
    float _2849 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7714, float3(0.0), isnan(_7714)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7714, float3(0.0), isnan(_7714)), level(0.0)).x;
    float _2851 = -_2833;
    float _2853 = fma(_2847, _2851, 1.0);
    float3 _7730 = float3(_2837, _2839, _2835);
    float4 _2856 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7730, float3(0.0), isnan(_7730)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7730, float3(0.0), isnan(_7730)), level(0.0)).xyzw;
    float _2858 = _2856.x;
    float _2860 = _2856.y;
    float _2862 = _2856.z;
    float _2864 = _2856.w;
    float2 _7746 = float2(_2853, _2845);
    float3 _2868 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7746, float2(0.0), isnan(_7746)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7746, float2(0.0), isnan(_7746)), level(0.0)).xyz;
    float _2870 = _2868.x;
    float _2872 = _2868.y;
    float _2874 = _2868.z;
    float _2876 = abs(_2413);
    float _2878 = log2(_2876);
    float _2880 = _2755 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2882 = _2543 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2884 = isnan(_2543);
    bool _2886 = _2882 || _2884;
    bool _2888 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2890 = _2886 || _2888;
    float _2892 = fma(_2763, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2880);
    float _2894 = in.m_81.x;
    bool _2896 = _2413 <= 8000.0;
    bool _2898 = isnan(_2413);
    bool _2900 = _2896 || _2898;
    bool _2902 = isnan(8000.0);
    bool _2904 = _2900 || _2902;
    float _2906 = float(_2904);
    float _2908 = fma(_2719, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2892);
    float _2910 = _2727 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2912 = _2817 + _2791;
    float _2914 = fma(_2771, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2908);
    float _2916 = _2791 * 0.5;
    float _2918 = _2878 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2920 = exp2(_2910);
    float _2922 = _2912 * 0.5;
    out.gl_Position.x = _2817;
    out.gl_Position.y = _2819;
    out.gl_Position.z = _2914;
    out.gl_Position.w = _2791;
    float _2924 = exp2(_2918);
    float _2926 = -_2920;
    float _2928 = _2926 + 1.0;
    float _2930 = _2928 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2932 = fma(_2924, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2934 = precise::clamp(_2932, 0.0, 1.0);
    float _2936 = fma(_2819, -0.5, _2916);
    float _2938 = -_2930;
    float _2940 = _2938 + 1.0;
    float _2942 = fma(_2934, -2.0, 3.0);
    float _2944 = _2934 * _2934;
    float _2946 = _2819;
    float _2948 = _2791;
    float _2950 = _2914;
    float _2952 = _2940;
    if (!_2890)
    {
        _2946 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2954 = _2946;
    float _2956 = _2944 * _2942;
    float _2958 = -_2956;
    float _2960 = _2958 + 1.0;
    float _2962 = fma(_2960, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2956);
    float _2964 = _2914 + _2791;
    float _2966 = _2906 * _2962;
    float _2968 = _2964 * 0.5;
    float _2970 = _2521 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2972 = _2954;
    float _2974 = _2954;
    if (!_2890)
    {
        _2948 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2976 = _2948;
    float _2978 = _2966 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2980 = _2976;
    float _2982 = _2976;
    if (!_2890)
    {
        _2950 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2984 = _2950;
    out.m_83.x = _2922;
    out.m_83.y = _2936;
    out.m_83.z = _2968;
    out.m_83.w = _2791;
    float _2986 = -_2831;
    float _2988 = _2986 + 1.0;
    float _2990 = _2988 * _2978;
    float _2992 = precise::clamp(_2990, 0.0, 1.0);
    float _2994 = -_2992;
    float _2996 = fma(_2994, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2998 = _2996 * _2894;
    float _3000 = _2930 * _2849;
    float _3002 = _2998 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3004 = _2998;
    float _3006 = _2984;
    float _3008 = _2984;
    if (!_2890)
    {
        _3004 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3010 = _3004;
    float _3012 = _2864 * _3000;
    float _3014 = _2864 * _2940;
    out.m_85.x = _3002;
    float _3016 = _3012;
    float _3018 = _3010;
    float _3020 = _3010;
    if (!_2890)
    {
        _2952 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3022 = _2952;
    float _3024 = _2874 * _3000;
    float _3026 = fma(_2870, _3012, _2858);
    float _3028 = fma(_2872, _3012, _2860);
    float _3030 = _3022;
    float _3032 = _3022;
    if (!_2890)
    {
        _3016 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3034 = _3016;
    float _3036 = fma(_2864, _3024, _2862);
    out.m_87.x = _3026;
    out.m_87.y = _3028;
    out.m_87.z = _3036;
    out.m_87.w = _3014;
    bool _3038 = !_2890;
    float _3040 = _3034;
    float _3042 = _3034;
    if (!_3038)
    {
        bool _3044 = _2543 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3046 = isnan(_2543);
        bool _3048 = _3044 || _3046;
        bool _3050 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3052 = _3048 || _3050;
        if (!_3052)
        {
            float _3054 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3056 = _2543 + _3054;
            float _3058 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3060 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3058;
            float _3062 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3064 = _3062 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3066 = 1.0 / _3060;
            float _3068 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3070 = _3068 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3072 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3074 = _3072 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3076 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3078 = _3076 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3080 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3082 = _3080 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3084 = _3056 * _3066;
            float _3086 = precise::clamp(_3084, 0.0, 1.0);
            float _3088 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3090 = _3088 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3092 = fma(_3086, _3064, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3094 = fma(_3086, _3090, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3096 = fma(_3086, _3070, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3098 = fma(_3086, _3074, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3100 = fma(_3086, _3078, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3102 = fma(_3086, _3082, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3042 = _3096;
            _2974 = _3100;
            _3020 = _3092;
            _3008 = _3098;
            _2982 = _3094;
            _3032 = _3102;
            _3104 = true;
        }
        else
        {
            bool _3106 = _2543 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3108 = isnan(_2543);
            bool _3110 = _3106 || _3108;
            bool _3112 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3114 = _3110 || _3112;
            if (!_3114)
            {
                _3018 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3116 = _3018;
            _3020 = _3116;
            if (!_3114)
            {
                _3040 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3118 = _3040;
            _3042 = _3118;
            if (!_3114)
            {
                _2980 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3120 = _2980;
            _2982 = _3120;
            if (!_3114)
            {
                _3006 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3122 = _3006;
            _3008 = _3122;
            if (!_3114)
            {
                _2972 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3124 = _2972;
            _2974 = _3124;
            if (!_3114)
            {
                _3030 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3126 = _3030;
            bool _3128 = !_3114;
            _3032 = _3126;
            if (!_3128)
            {
                bool _3130 = _2543 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3132 = isnan(_2543);
                bool _3134 = _3130 || _3132;
                bool _3136 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3138 = _3134 || _3136;
                if (!_3138)
                {
                    float _3140 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3142 = _2543 + _3140;
                    float _3144 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3146 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3144;
                    float _3148 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3150 = _3148 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3152 = 1.0 / _3146;
                    float _3154 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3156 = _3154 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3158 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3160 = _3158 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3162 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3164 = _3162 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3166 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3168 = _3166 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3170 = _3142 * _3152;
                    float _3172 = precise::clamp(_3170, 0.0, 1.0);
                    float _3174 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3176 = _3174 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3178 = fma(_3172, _3150, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3180 = fma(_3172, _3176, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3182 = fma(_3172, _3156, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3184 = fma(_3172, _3160, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3186 = fma(_3172, _3164, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3188 = fma(_3172, _3168, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3042 = _3182;
                    _2974 = _3186;
                    _3020 = _3178;
                    _3008 = _3184;
                    _2982 = _3180;
                    _3032 = _3188;
                    _3104 = true;
                }
                else
                {
                    _3042 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2974 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3020 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3008 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2982 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3032 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3104 = false;
    float _3190 = _3042;
    float _3192 = _2974;
    float _3194 = _3020;
    float _3196 = _3008;
    float _3198 = _2982;
    float _3200 = _3032;
    float _3202 = _2970 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3204 = fma(_2159, -0.5, 0.5);
    float _3206 = precise::clamp(_3204, 0.0, 1.0);
    float _3208 = -_3190;
    float _3210 = _3208 + _3192;
    float _3212 = -_3194;
    float _3214 = _3212 + _3196;
    out.m_89.x = 0.0;
    float _3216 = fma(_3206, _3210, _3190);
    float _3218 = -_3198;
    float _3220 = _3218 + _3200;
    float _3222 = fma(_3206, _3214, _3194);
    float _3224 = _3216 * 0.586610972881317138671875;
    bool _3226 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3228 = fma(_3206, _3220, _3198);
    out.m_51.x = _3202;
    float _3230 = fma(_3222, 0.298911988735198974609375, _3224);
    bool _3232 = _2521 > 0.0;
    bool _3234 = isnan(_2521);
    bool _3236 = _3232 || _3234;
    bool _3238 = isnan(0.0);
    bool _3240 = _3236 || _3238;
    float _3242 = fma(_3228, 0.114477999508380889892578125, _3230);
    float _3244 = -_3242;
    float _3246 = _3222 + _3244;
    float _3248 = -_3242;
    float _3250 = _3216 + _3248;
    float _3252 = -_3242;
    float _3254 = _3228 + _3252;
    float _3256 = fma(_3246, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3242);
    float _3258 = fma(_3250, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3242);
    float _3260 = fma(_3254, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3242);
    bool _3262 = !_3226;
    if (!_3262)
    {
        float _3264 = -_2461;
        float _3266 = _3264 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3268 = -_2463;
        float _3270 = _3268 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3272 = -_2465;
        float _3274 = _3272 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3276 = _3266 * _3266;
        float _3278 = fma(_3270, _3270, _3276);
        float _3280 = fma(_3274, _3274, _3278);
        float _3282 = sqrt(_3280);
        float _3284 = rsqrt(_3280);
        float _3286 = -_3282;
        float _3288 = _3286 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3290 = _3288 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3292 = precise::clamp(_3290, 0.0, 1.0);
        float _3294 = _3270 * _3284;
        float _3296 = _3266 * _3284;
        float _3298 = abs(_3292);
        float _3300 = log2(_3298);
        float _3302 = _3274 * _3284;
        float _3304 = _3294 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3306 = _2159 * _3296;
        float _3308 = -_3296;
        float _3310 = -_3304;
        float _3312 = fma(_3308, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3310);
        float _3314 = fma(_2157, _3294, _3306);
        float _3316 = -_3302;
        float _3318 = fma(_3316, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3312);
        float _3320 = fma(_2161, _3302, _3314);
        float _3322 = precise::clamp(_3320, 0.0, 1.0);
        float _3324 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3326 = _3318 + _3324;
        float _3328 = _3300 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3330 = _3326 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3332 = precise::clamp(_3330, 0.0, 1.0);
        float _3334 = exp2(_3328);
        float _3336 = _3334 * _3332;
        float _3338 = _3322 * _3336;
        float _3340 = _3338 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3342 = _3338 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3344 = _3338 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _3340;
        out.m_89.y = _3342;
        out.m_89.z = _3344;
    }
    out.m_91.x = _3256;
    out.m_91.y = _3258;
    out.m_91.z = _3260;
    if (_3240)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_51.x = 0.0;
    float _3346 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3346;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

