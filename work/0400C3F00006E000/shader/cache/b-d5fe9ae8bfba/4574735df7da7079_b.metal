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
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c13 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
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
    float4 m_71 [[user(locn0)]];
    float4 m_63 [[user(locn1)]];
    float4 m_85 [[user(locn2)]];
    float4 m_79 [[user(locn3)]];
    float4 m_83 [[user(locn4)]];
    float4 m_65 [[user(locn5)]];
    float4 m_73 [[user(locn6)]];
    float4 m_75 [[user(locn7)]];
    float4 m_69 [[user(locn8)]];
    float4 m_77 [[user(locn9)]];
    float4 m_49 [[user(locn10)]];
    float4 m_81 [[user(locn11)]];
    float4 m_51 [[user(locn12)]];
    float4 m_67 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_61 [[attribute(4)]];
    float4 m_59 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_57 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2740 = false;
    bool _566 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _99 = in.m_44.w;
    float _101 = in.m_46.w;
    float _103 = trunc(_99);
    int _106 = int(_103);
    float _108 = -_101;
    float _110 = _108 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _110;
    bool _114 = _106 >= 1;
    float _116 = 0.0;
    float _118 = _101;
    if (!_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _116;
    if (!_114)
    {
        out.m_51.x = 0.0;
    }
    int _122 = 0;
    if (!_114)
    {
        float _124 = _120 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    int _128 = _126;
    if (!_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3055 = as_type<float>(_126);
        out.gl_Position.z = _3055;
    }
    if (!_114)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _130 = _101 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_101);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = float(_106);
    bool _142 = _110 >= _140;
    bool _144 = !_138;
    bool _146 = _142 || _144;
    if (_146)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _118;
    if (_146)
    {
        out.m_51.x = 0.0;
    }
    if (_146)
    {
        float _150 = _148 * 5.0;
        _128 = as_type<int>(_150);
    }
    int _152 = _128;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3110 = as_type<float>(_152);
        out.gl_Position.z = _3110;
    }
    if (_146)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _154 = in.m_53.x;
    float _156 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _158 = _110 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _160 = _110 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _162 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _164 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _166 = _162 || _164;
    bool _168 = isnan(1.0);
    bool _170 = _166 || _168;
    int _172 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _174 = _172 != 0;
    float _176 = _158 * _156;
    float _178 = 0.0;
    float _180 = _160;
    if (!_170)
    {
        float _182 = _160 * _160;
        float _184 = _182 * 0.5;
        _178 = _184;
    }
    float _186 = _178;
    float _188 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[20].x, _176);
    float _190 = _186;
    if (!_170)
    {
        float _192 = _186 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _192;
    }
    float _194 = _190;
    float _196 = in.m_46.x;
    float _198 = in.m_46.y;
    float _200 = in.m_46.z;
    float _202 = _188 * 6.283185482025146484375;
    float _204 = floor(_188);
    float _206 = _202 * 0.15915493667125701904296875;
    float _208 = _206 * 6.283185482025146484375;
    float _210 = cos(_208);
    float _212 = -_204;
    float _214 = _188 + _212;
    bool _216 = !_170;
    float _218 = _194;
    if (!_216)
    {
        float _220 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = log2(_220);
        float _224 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _226 = _224 + 1.0;
        float _228 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _230 = _160 * _222;
        float _232 = 1.0 / _226;
        float _234 = _228 * 0.693147182464599609375;
        float _236 = exp2(_230);
        float _238 = 1.0 / _234;
        float _240 = _236 + (-1.0);
        float _242 = -_240;
        float _244 = fma(_242, _238, _160);
        float _246 = _244 * _232;
        float _248 = _246 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _218 = _248;
    }
    float _250 = _218;
    bool _252 = !_170;
    if (!_252)
    {
        float _254 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _256 = log2(_254);
        float _258 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _260 = _258 + 1.0;
        float _262 = 1.0 / _260;
        float _264 = _160 * _256;
        float _266 = exp2(_264);
        float _268 = -_266;
        float _270 = _268 + 1.0;
        float _272 = _270 * _262;
        _180 = _272;
    }
    float _274 = _180;
    float _276 = in.m_55.w;
    float _278 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _280 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _282 = in.m_44.x;
    float _284 = in.m_44.y;
    float _286 = in.m_44.z;
    float _288 = _278 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _290 = _278 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _292 = _278 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _294 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[8].x, _288);
    float _296 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[8].y, _290);
    float _298 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _300 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[8].z, _292);
    bool _302 = _214 < 0.5;
    float _304 = float(_302);
    float _306 = fma(_210, 0.5, 0.5);
    float _308 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[10].x, _294);
    float _310 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[10].y, _296);
    float _312 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[10].z, _300);
    float _314 = _300;
    if (!_170)
    {
        float _316 = _110 * _110;
        float _318 = _316 * 0.5;
        _314 = _318;
    }
    float _320 = _314;
    float _322 = fma(_274, _196, _308);
    float _324 = fma(_274, _198, _310);
    float _326 = -_214;
    float _328 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _330 = -_304;
    float _332 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _334 = -_306;
    float _336 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _338 = fma(_274, _200, _312);
    float _340 = _320;
    if (!_170)
    {
        float _342 = _320 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _340 = _342;
    }
    float _344 = _340;
    bool _346 = !_170;
    float _348 = _344;
    float _350 = _284;
    if (!_346)
    {
        float _352 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _354 = log2(_352);
        float _356 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _358 = _356 + 1.0;
        float _360 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _362 = _110 * _354;
        float _364 = 1.0 / _358;
        float _366 = _360 * 0.693147182464599609375;
        float _368 = exp2(_362);
        float _370 = 1.0 / _366;
        float _372 = _368 + (-1.0);
        float _374 = -_372;
        float _376 = fma(_374, _370, _110);
        float _378 = _376 * _364;
        float _380 = _378 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _348 = _380;
    }
    float _382 = _348;
    float _384 = fma(_324, _276, _284);
    float _386 = _382 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _388 = fma(_322, _276, _282);
    if (!_170)
    {
        _350 = _110;
    }
    float _390 = _350;
    bool _392 = !_170;
    float _394 = _390;
    if (!_392)
    {
        float _396 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _398 = log2(_396);
        float _400 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _402 = _400 + 1.0;
        float _404 = 1.0 / _402;
        float _406 = _110 * _398;
        float _408 = exp2(_406);
        float _410 = -_408;
        float _412 = _410 + 1.0;
        float _414 = _412 * _404;
        _394 = _414;
    }
    float _416 = _394;
    int _418 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _420 = _418 != 0;
    int _422 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _424 = _422 != 0;
    float _426 = fma(_338, _276, _286);
    float _428 = _382 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _430 = _386 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _432 = _386 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    bool _434 = !_420;
    int _436 = _434 ? 0 : 1;
    float _438 = _386 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _440 = _382 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _442 = fma(_428, (*spvDescriptorSet0.vp_c10)._m0[8].x, _430);
    float _444 = fma(_428, (*spvDescriptorSet0.vp_c10)._m0[8].y, _432);
    int _446 = abs(_436);
    float _448 = fma(_428, (*spvDescriptorSet0.vp_c10)._m0[8].z, _438);
    bool _450 = !_174;
    int _452 = _450 ? 0 : 1;
    float _454 = fma(_440, (*spvDescriptorSet0.vp_c10)._m0[10].x, _442);
    float _456 = fma(_440, (*spvDescriptorSet0.vp_c10)._m0[10].y, _444);
    float _458 = float(_446);
    float _460 = 1.0 / _140;
    int _462 = abs(_452);
    float _464 = fma(_416, _196, _454);
    float _466 = fma(_416, _198, _456);
    float _468 = abs(_328);
    float _470 = _458 * _468;
    float _472 = fma(_440, (*spvDescriptorSet0.vp_c10)._m0[10].z, _448);
    float _474 = -_466;
    float _476 = _324 + _474;
    bool _478 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _480 = fma(_416, _200, _472);
    bool _482 = !_424;
    int _484 = _482 ? 0 : 1;
    float _486 = _476 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _488 = float(_462);
    float _490 = -_464;
    float _492 = _322 + _490;
    int _494 = abs(_484);
    float _496 = _476 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _498 = _476 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _500 = fma(_492, (*spvDescriptorSet0.vp_c10)._m0[5].x, _486);
    float _502 = float(_494);
    float _504 = fma(_492, (*spvDescriptorSet0.vp_c10)._m0[4].x, _496);
    float _506 = fma(_492, (*spvDescriptorSet0.vp_c10)._m0[6].x, _498);
    float _508 = -_480;
    float _510 = _338 + _508;
    float _512 = fma(_488, _336, _470);
    float _514 = _110 * _460;
    float _516 = fma(_510, (*spvDescriptorSet0.vp_c10)._m0[4].z, _504);
    float _518 = fma(_510, (*spvDescriptorSet0.vp_c10)._m0[5].z, _500);
    float _520 = fma(_510, (*spvDescriptorSet0.vp_c10)._m0[6].z, _506);
    float _522 = abs(_332);
    float _524 = fma(_502, _522, _512);
    bool _526 = !_478;
    float _528 = _514;
    float _530 = _520;
    float _532 = _518;
    float _534 = _516;
    float _536 = _520;
    float _538 = _466;
    float _540 = _516;
    float _542 = _480;
    float _544 = _520;
    float _546 = _464;
    float _548 = _524;
    float _564;
    if (!_526)
    {
        float _550 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _552 = _154 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _554 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[12].x, _110);
        float _556 = _554 * _550;
        float _558 = floor(_556);
        float _560 = -_558;
        float _562 = _556 + _560;
        _564 = _562;
        _566 = true;
    }
    else
    {
        _564 = _514;
    }
    _566 = false;
    float _568 = _564;
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _572 = _568 + _570;
    bool _574 = _568 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _576 = isnan(_568);
    bool _578 = _574 || _576;
    bool _580 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _582 = _578 || _580;
    float _584 = float(_582);
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _586;
    float _590 = -_584;
    float _592 = _590 + 1.0;
    bool _594 = _568 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _596 = isnan(_568);
    bool _598 = _594 || _596;
    bool _600 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _602 = _598 || _600;
    float _604 = float(_602);
    float _606 = 1.0 / _588;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _610 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _608;
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _614 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _612;
    bool _616 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _618 = _604 * _592;
    float _620 = -_604;
    float _622 = _620 + 1.0;
    float _624 = _572 * _606;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _628 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _626;
    float _630 = in.m_55.x;
    float _632 = in.m_55.y;
    float _634 = in.m_55.z;
    float _636 = fma(_610, _624, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _638 = fma(_628, _624, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _640 = fma(_614, _624, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _642 = _636 * _618;
    float _644 = _638 * _618;
    float _646 = _640 * _618;
    float _648 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[143].x, _642);
    float _650 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[143].y, _644);
    float _652 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[143].z, _646);
    float _654 = fma(_584, (*spvDescriptorSet0.vp_c9)._m0[144].x, _648);
    float _656 = fma(_584, (*spvDescriptorSet0.vp_c9)._m0[144].y, _650);
    float _658 = fma(_584, (*spvDescriptorSet0.vp_c9)._m0[144].z, _652);
    float _660 = _654 * _630;
    float _662 = _656 * _632;
    float _664 = _658 * _634;
    bool _666 = !_616;
    if (!_666)
    {
        float _668 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _670 = _154 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _672 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[11].y, _110);
        float _674 = _672 * _668;
        float _676 = floor(_674);
        float _678 = -_676;
        float _680 = _674 + _678;
        _528 = _680;
    }
    float _682 = _528;
    float _684 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _686 = int(_684);
    float _688 = in.m_57.y;
    float _690 = _384 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _692 = in.m_53.y;
    int _694 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _696 = _694 != 0;
    float _698 = _384 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _700 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _702 = int(_700);
    float _704 = _154 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _706 = _660 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _708 = _662 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _710 = _706 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _712 = float(_686);
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _716 = _714 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _718 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _720 = 1.0 / _712;
    float _722 = _664 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _724 = float(uint(_702));
    int _726 = ~_702;
    int _728 = _726 + 1;
    float _730 = float(_702);
    float _732 = 1.0 / _716;
    bool _734 = _692 > 0.5;
    int _736 = ~_702;
    int _738 = _736 + 1;
    float _740 = _110 * _720;
    float _742 = 1.0 / _724;
    float _744 = trunc(_740);
    int _746 = int(_744);
    int _748 = as_type<int>(_742) + (-2);
    int _750 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _752 = _750 != 0;
    float _754 = float(uint(_746));
    bool _756 = !_752;
    float _758 = _756 ? 7.345489978790283203125 : 1.0;
    int _760 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _762 = _760 != 0;
    int _764 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _766 = _764 != 0;
    int _768 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _770 = _768 != 0;
    float _772 = as_type<float>(_748) * _754;
    int _774 = ~_702;
    int _776 = _774 + 1;
    int _778 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _780 = _778 != 0;
    float _782 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[5].x, _690);
    bool _784 = !_766;
    int _786 = _784 ? 0 : 1;
    float _788 = trunc(_772);
    float _790 = precise::max(_788, 0.0);
    uint _793 = uint(_790);
    bool _795 = !_762;
    int _797 = _795 ? 0 : 1;
    int _799 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _801 = _799 != 0;
    int _803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _805 = _803 != 0;
    int _807 = _776 * int(_793);
    int _809 = _807 + _746;
    float _811 = in.m_59.x;
    float _813 = in.m_59.y;
    float _815 = in.m_59.z;
    float _817 = float(uint(_809));
    float _819 = as_type<float>(_748) * _817;
    float _821 = trunc(_819);
    float _823 = precise::max(_821, 0.0);
    uint _825 = uint(_823);
    int _827 = int(_793) + int(_825);
    float _829 = -_688;
    float _831 = _829 + 1.0;
    int _833 = _728 * _827;
    int _835 = _833 + _746;
    float _837 = _688;
    if (_696)
    {
        float _839 = _734 ? _831 : _688;
        _837 = _839;
    }
    float _841 = _837;
    float _843 = _758 * _154;
    bool _845 = _813 != 0.0;
    bool _847 = isnan(_813);
    bool _849 = _845 || _847;
    bool _851 = isnan(0.0);
    bool _853 = _849 || _851;
    bool _855 = uint(_835) >= uint(_702);
    float _857 = floor(_843);
    float _859 = in.m_61.x;
    float _861 = in.m_61.y;
    float _863 = in.m_61.z;
    float _865 = float(_746);
    bool _867 = !_855;
    int _869 = _867 ? 0 : (-1);
    bool _871 = _811 == 0.0;
    bool _873 = !_853;
    bool _875 = _871 && _873;
    int _877 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _879 = _877 != 0;
    float _881 = _384 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _883 = _865 >= _730;
    bool _885 = isnan(_865);
    bool _887 = _883 || _885;
    bool _889 = isnan(_730);
    bool _891 = _887 || _889;
    float _893 = float(_891);
    bool _895 = _815 == 0.0;
    bool _897 = _895 && _875;
    float _899 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[4].x, _881);
    int _901 = ~_827;
    int _903 = _901 + _869;
    int _905 = _903 + 1;
    float _907 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _813);
    float _909 = trunc(_893);
    int _911 = int(_909);
    float _913 = -_857;
    float _915 = _843 + _913;
    float _917 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _811);
    float _919 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _815);
    float _921 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[6].x, _698);
    float _923 = fma(_426, (*spvDescriptorSet0.vp_c10)._m0[4].z, _899);
    bool _925 = !_805;
    int _927 = _925 ? 0 : 1;
    float _929 = _861;
    float _931 = _859;
    float _933 = _863;
    if (!_897)
    {
        float _935 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[17].y, _861);
        _929 = _935;
    }
    float _937 = _929;
    float _939 = _915 * _730;
    if (!_897)
    {
        float _941 = fma(_811, (*spvDescriptorSet0.vp_c9)._m0[17].y, _859);
        _931 = _941;
    }
    float _943 = _931;
    if (!_897)
    {
        float _945 = fma(_815, (*spvDescriptorSet0.vp_c9)._m0[17].y, _863);
        _933 = _945;
    }
    float _947 = _933;
    int _949 = _702 * _905;
    int _951 = _949 + _746;
    float _953 = _110 * _730;
    bool _955 = _702 == 0;
    float _957 = trunc(_939);
    int _959 = int(_957);
    int _961 = ~_911;
    int _963 = _961 + 1;
    int _965 = _963 + 1;
    float _967 = _953 * _460;
    bool _969 = !_955;
    int _971 = _969 ? _951 : (-1);
    float _973 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _975 = _702 + (-1);
    int _977 = abs(_927);
    int _979 = _971 * _965;
    float _981 = trunc(_967);
    int _983 = int(_981);
    float _985 = -_973;
    float _987 = fma(_704, 2.0, _985);
    int _989 = abs(_786);
    int _991 = _911 * _975;
    int _993 = _991 + _979;
    float _995 = -_110;
    float _997 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[76].x, _987);
    bool _999 = !_770;
    int _1001 = _999 ? 0 : 1;
    int _1003 = _993 * _989;
    int _1005 = abs(_797);
    int _1007 = _959 * _977;
    int _1009 = _1007 + _746;
    int _1011 = abs(_1001);
    float _1013 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1015 = !_780;
    int _1017 = _1015 ? 0 : 1;
    int _1019 = _983 * _1005;
    int _1021 = _1019 + _1003;
    bool _1023 = _154 > 0.5;
    bool _1025 = _1023 && _879;
    float _1027 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1013);
    int _1029 = abs(_1017);
    int _1031 = _1009 * _1011;
    int _1033 = _1031 + _1021;
    float _1035 = fma(_426, (*spvDescriptorSet0.vp_c10)._m0[5].z, _782);
    float _1037 = fma(_426, (*spvDescriptorSet0.vp_c10)._m0[6].z, _921);
    float _1039 = _923 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1041 = _959 * _1029;
    int _1043 = _1041 + _1033;
    float _1045 = _1035 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1047 = _1037 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1049 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1051 = _1039 + _1049;
    float _1053 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1055 = _1045 + _1053;
    float _1057 = float(uint(_1043));
    float _1059 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1061 = _1047 + _1059;
    float _1063 = _1055 * _1055;
    float _1065 = as_type<float>(_748) * _1057;
    float _1067 = _692 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1069 = fma(_1051, _1051, _1063);
    float _1071 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1073 = trunc(_1065);
    float _1075 = precise::max(_1073, 0.0);
    uint _1077 = uint(_1075);
    float _1079 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1081 = _1079 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1083 = fma(_1061, _1061, _1069);
    float _1085 = fma(_1067, -2.0, _1071);
    float _1087 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1085);
    float _1089 = sqrt(_1083);
    float _1091 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1093 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1095 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1097 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1099 = _1091 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1101 = _1095 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1103 = _738 * int(_1077);
    int _1105 = _1103 + _1043;
    float _1107 = rsqrt(_1083);
    float _1109 = _1097 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1111 = float(uint(_1105));
    float _1113 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[78].w, _718);
    float _1115 = fma(_841, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _1117 = _1089 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1119 = 1.0 / _1081;
    float _1121 = as_type<float>(_748) * _1111;
    float _1123 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1113);
    float _1125 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1127 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1125;
    float _1129 = precise::min(_710, _1117);
    float _1131 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1133 = _1131 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    out.m_63.x = _1101;
    out.m_63.y = _1109;
    out.m_63.z = _1099;
    out.m_63.w = _1093;
    float _1135 = trunc(_1121);
    float _1137 = precise::max(_1135, 0.0);
    uint _1139 = uint(_1137);
    float _1141 = _1107 * _1129;
    float _1143 = _1133 * _732;
    float _1145 = _1127 * _1119;
    float _1147 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1149 = _682 + _1147;
    float _1151 = -_1087;
    float _1153 = fma(_1123, _1115, _1151);
    float _1155 = float(uint(_1009));
    float _1157 = in.m_57.x;
    float _1159 = _1055 * _1141;
    int _1161 = int(_1077) + int(_1139);
    float _1163 = _1051 * _1141;
    float _1165 = as_type<float>(_748) * _1155;
    float _1167 = -_1159;
    float _1169 = _1055 + _1167;
    float _1171 = fma(_1145, _1149, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    int _1173 = ~_702;
    int _1175 = _1173 + 1;
    float _1177 = -_1163;
    float _1179 = _1051 + _1177;
    float _1181 = _1169 * _1169;
    float _1183 = _1061 * _1141;
    float _1185 = trunc(_1165);
    float _1187 = precise::max(_1185, 0.0);
    uint _1189 = uint(_1187);
    float _1191 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1193 = _682 + _1191;
    float _1195 = fma(_1179, _1179, _1181);
    float _1197 = -_1183;
    float _1199 = _1061 + _1197;
    int _1201 = _1175 * _1161;
    int _1203 = _1201 + _1043;
    bool _1205 = _682 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1207 = isnan(_682);
    bool _1209 = _1205 || _1207;
    bool _1211 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1213 = _1209 || _1211;
    float _1215 = float(_1213);
    float _1217 = fma(_1143, _1193, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1219 = fma(_1199, _1199, _1195);
    int _1221 = ~_702;
    int _1223 = _1221 + 1;
    bool _1225 = _682 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1227 = isnan(_682);
    bool _1229 = _1225 || _1227;
    bool _1231 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1233 = _1229 || _1231;
    float _1235 = float(_1233);
    float _1237 = -_1215;
    float _1239 = _1237 + 1.0;
    bool _1241 = uint(_1203) >= uint(_702);
    float _1243 = _1235 * _1239;
    float _1245 = as_type<float>(_1223);
    float _1247 = _1157;
    if (_879)
    {
        _1245 = _1157;
    }
    float _1249 = _1245;
    float _1251 = -_1235;
    float _1253 = _1251 + 1.0;
    bool _1255 = !_1241;
    int _1257 = _1255 ? 0 : (-1);
    int _1259 = _1223 * int(_1189);
    int _1261 = _1259 + _1009;
    bool _1263 = _682 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1265 = isnan(_682);
    bool _1267 = _1263 || _1265;
    bool _1269 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1271 = _1267 || _1269;
    float _1273 = float(_1271);
    float _1275 = _1249;
    if (_1025)
    {
        float _1277 = -_1249;
        float _1279 = _1277 + 1.0;
        _1275 = _1279;
    }
    float _1281 = _1275;
    int _1283 = ~_1161;
    int _1285 = _1283 + _1257;
    int _1287 = _1285 + 1;
    float _1289 = float(uint(_1261));
    float _1291 = sqrt(_1219);
    if (_879)
    {
        _1247 = _1281;
    }
    float _1293 = _1247;
    int _1295 = _702 * _1287;
    int _1297 = _1295 + _1043;
    float _1299 = _1273 * _1253;
    float _1301 = as_type<float>(_748) * _1289;
    float _1303 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1027);
    float _1305 = fma(_1293, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    bool _1307 = !_955;
    int _1309 = _1307 ? _1297 : (-1);
    float _1311 = _1171 * _1299;
    float _1313 = -_1273;
    float _1315 = _1313 + 1.0;
    float _1317 = fma(_1303, _1305, _997);
    int _1319 = _1309 >> 31;
    float _1321 = _937 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1323 = fma(_1315, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1311);
    float _1325 = _937 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1327 = _937 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1329 = _1319 & 3;
    float _1331 = trunc(_1301);
    float _1333 = precise::max(_1331, 0.0);
    uint _1335 = uint(_1333);
    float _1337 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1321);
    float _1339 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1325);
    float _1341 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1327);
    float _1343 = _1107 * _1291;
    int _1345 = _1309 + _1329;
    float _1347 = fma(_1217, _1243, _1323);
    int _1349 = _1309 & 3;
    bool _1351 = _1349 != 0;
    float _1353 = _708 * _1343;
    int _1355 = _1345 >> 2;
    float _1357 = _706 * _1343;
    float _1359 = _722 * _1343;
    float _1361 = _1353 * _907;
    int _1363 = _1355 << 4;
    int _1365 = _1363 + 368;
    float _1367 = _1357 * _917;
    float _1369 = _1359 * _919;
    float _1371 = _1361 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    uint _1373 = uint(int(uint(_1365) >> uint(2)));
    uint _1375 = uint(int(uint(int(_1373)) >> uint(2)));
    int _1377 = int(_1373) & 3;
    float _1379 = (*spvDescriptorSet0.vp_c9)._m0[int(_1375)][_1377];
    int _1381 = int(_1373) + 1;
    uint _1383 = uint(int(uint(_1381) >> uint(2)));
    int _1385 = _1381 & 3;
    float _1387 = (*spvDescriptorSet0.vp_c9)._m0[int(_1383)][_1385];
    int _1389 = int(_1189) + int(_1335);
    float _1391 = _1361 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1393 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1371);
    int _1395 = ~_702;
    int _1397 = _1395 + 1;
    float _1399 = fma(_1215, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1347);
    float _1401 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1391);
    float _1403 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1393);
    int _1405 = _1365 + 8;
    uint _1407 = uint(int(uint(_1405) >> uint(2)));
    uint _1409 = uint(int(uint(int(_1407)) >> uint(2)));
    int _1411 = int(_1407) & 3;
    float _1413 = (*spvDescriptorSet0.vp_c9)._m0[int(_1409)][_1411];
    int _1415 = int(_1407) + 1;
    uint _1417 = uint(int(uint(_1415) >> uint(2)));
    int _1419 = _1415 & 3;
    float _1421 = (*spvDescriptorSet0.vp_c9)._m0[int(_1417)][_1419];
    bool _1423 = uint(_1349) > 1u;
    float _1425 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1401);
    float _1427 = _1403 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _1429 = _1309 & 3;
    bool _1431 = _1429 != 0;
    int _1433 = _1397 * _1389;
    int _1435 = _1433 + _1009;
    float _1437 = _1425 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1439 = _1047 + _1427;
    int _1441 = _1431 ? 0 : 1;
    float _1443 = _1361 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _1445 = uint(_1435) >= uint(_702);
    float _1447 = _1039 + _1437;
    float _1449 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1451 = _1439 + _1449;
    int _1453 = ~_1441;
    int _1455 = _1453 + 1;
    int _1457 = _1455 + 1;
    float _1459 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1443);
    int _1461 = _1457;
    if (!_1423)
    {
        int _1463 = ~_1441;
        int _1465 = _1463 + 1;
        _1461 = _1465;
    }
    int _1467 = _1461;
    float _1469 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1471 = _1447 + _1469;
    float _1473 = _1451 * _1451;
    bool _1475 = _1349 != 3;
    int _1477 = abs(_1467);
    float _1479 = fma(_1471, _1471, _1473);
    bool _1481 = !_1445;
    int _1483 = _1481 ? 0 : (-1);
    bool _1485 = uint(_1349) >= 2u;
    float _1487 = sqrt(_1479);
    bool _1489 = !_1351;
    int _1491 = _1489 ? 0 : 1;
    int _1493 = _1485 ? 0 : 1;
    bool _1495 = _1349 != 3;
    int _1497 = ~_1493;
    int _1499 = _1497 + 1;
    int _1501 = _1499 + 1;
    int _1503 = abs(_1491);
    int _1505 = _1501;
    if (_1475)
    {
        int _1507 = ~_1493;
        int _1509 = _1507 + 1;
        _1505 = _1509;
    }
    int _1511 = _1505;
    int _1513 = ~_1477;
    int _1515 = _1513 + 1;
    int _1517 = _1515 + 1;
    float _1519 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1459);
    bool _1521 = !_1495;
    int _1523 = _1521 ? 0 : (-1);
    int _1525 = abs(_1511);
    int _1527 = _1517 * as_type<int>(_1387);
    int _1529 = ~_1503;
    int _1531 = _1529 + 1;
    int _1533 = _1531 + 1;
    float _1535 = _1519 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _1537 = _1487 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1539 = !_801;
    int _1541 = _1539 ? 0 : 1;
    int _1543 = _1533 * as_type<int>(_1379);
    int _1545 = _1543 + _1527;
    int _1547 = ~_1525;
    int _1549 = _1547 + 1;
    int _1551 = _1549 + 1;
    int _1553 = abs(_1523);
    int _1555 = abs(_1541);
    int _1557 = _1551 * as_type<int>(_1413);
    int _1559 = _1557 + _1545;
    int _1561 = ~_1389;
    int _1563 = _1561 + _1483;
    int _1565 = _1563 + 1;
    float _1567 = _1045 + _1535;
    int _1569 = ~_1553;
    int _1571 = _1569 + 1;
    int _1573 = _1571 + 1;
    int _1575 = _702 * _1565;
    int _1577 = _1575 + _1009;
    float _1579 = as_type<float>(_1527);
    float _1581 = as_type<float>(_1573);
    float _1583 = as_type<float>(_1565);
    if (!_1537)
    {
        _1579 = _1447;
    }
    float _1585 = _1579;
    int _1587 = _1573 * as_type<int>(_1421);
    int _1589 = _1587 + _1559;
    int _1591 = ~_1555;
    int _1593 = _1591 + 1;
    int _1595 = _1593 + 1;
    float _1597 = _1585;
    if (!_1537)
    {
        _1581 = _1439;
    }
    float _1599 = _1581;
    float _1601 = _1599;
    if (!_1537)
    {
        _1583 = _1567;
    }
    float _1603 = _1583;
    bool _1605 = !_1537;
    float _1607 = _1603;
    if (!_1605)
    {
        float _1609 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1611 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1613 = _1487 + _1611;
        float _1615 = _1567 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1617 = rsqrt(_1479);
        float _1619 = _1613 * _1609;
        float _1621 = _1619 * 0.15915493667125701904296875;
        float _1623 = _1621 * 6.283185482025146484375;
        float _1625 = cos(_1623);
        float _1627 = _1621 * 6.283185482025146484375;
        float _1629 = sin(_1627);
        float _1631 = _1625 + (-1.0);
        float _1633 = fma(_1629, _1615, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1635 = _1631 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1637 = _1617 * _1633;
        float _1639 = fma(_1567, _1625, _1635);
        float _1641 = fma(_1471, _1637, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1643 = fma(_1451, _1637, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1607 = _1639;
        _1597 = _1641;
        _1601 = _1643;
    }
    float _1645 = _1607;
    float _1647 = _1597;
    float _1649 = _1601;
    float _1651 = -_1045;
    float _1653 = _1651 + _1645;
    float _1655 = -_1039;
    float _1657 = _1655 + _1647;
    float _1659 = -_1047;
    float _1661 = _1659 + _1649;
    int _1663 = _1589 * _1595;
    float _1665 = _1653 * _1653;
    bool _1667 = !_955;
    int _1669 = _1667 ? _1577 : (-1);
    out.m_65.w = _1129;
    float _1671 = fma(_1657, _1657, _1665);
    int _1673 = _1669 * _1555;
    int _1675 = _1673 + _1663;
    float _1677 = fma(_1661, _1661, _1671);
    float _1679 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1681 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1683 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1337);
    float _1685 = sqrt(_1677);
    float _1687 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1689 = _1153 + 0.5;
    float _1691 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1339);
    float _1693 = _1679 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1695 = _1681 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1697 = _1687 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1699 = _1317 + 0.5;
    float _1701 = _1399 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1703 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1341);
    float _1705 = float(_1675);
    out.m_67.x = _1357;
    float _1707 = -_1163;
    float _1709 = _1707 + _1647;
    float _1711 = -_1163;
    float _1713 = _1039 + _1711;
    out.m_69.x = _1699;
    out.m_69.y = _1689;
    bool _1715 = _1685 > 0.0;
    float _1717 = -_1159;
    float _1719 = _1717 + _1645;
    float _1721 = -_1183;
    float _1723 = _1721 + _1649;
    out.m_71.x = _1693;
    out.m_71.y = _1695;
    out.m_71.z = _1697;
    out.m_71.w = _1701;
    float _1725 = -_1159;
    float _1727 = _1045 + _1725;
    float _1729 = -_1183;
    float _1731 = _1047 + _1729;
    out.m_73.x = _1705;
    out.m_75.x = _1683;
    out.m_75.y = _1691;
    out.m_75.z = _1703;
    bool _1733 = !_1715;
    float _1735 = _1697;
    float _1737 = _1693;
    float _1739 = _1695;
    float _1741 = _1709;
    float _1743 = _1723;
    float _1745 = _1719;
    float _1747 = _1699;
    float _1749 = _1713;
    if (!_1733)
    {
        bool _1751 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1753 = _1159;
        if (_1751)
        {
            float _1755 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1753 = _1755;
        }
        float _1757 = _1753;
        if (_1751)
        {
            float _1759 = _516 * _1757;
            _1735 = _1759;
        }
        float _1761 = _1735;
        float _1763 = _1761;
        if (_1751)
        {
            float _1765 = _518 * _1757;
            _1737 = _1765;
        }
        float _1767 = _1737;
        float _1769 = _1767;
        if (_1751)
        {
            float _1771 = _520 * _1757;
            _1739 = _1771;
        }
        float _1773 = _1739;
        float _1775 = _1773;
        if (!_1751)
        {
            float _1777 = _110 + 1.0;
            if (!_170)
            {
                float _1779 = _1777 * _1777;
                float _1781 = _1779 * 0.5;
                _530 = _1781;
            }
            float _1783 = _530;
            float _1785 = _1783;
            if (!_170)
            {
                float _1787 = _1783 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1785 = _1787;
            }
            float _1789 = _1785;
            bool _1791 = !_170;
            float _1793 = _1789;
            if (!_1791)
            {
                float _1795 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1797 = log2(_1795);
                float _1799 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1801 = _1799 + 1.0;
                float _1803 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1805 = _1797 * _1777;
                float _1807 = 1.0 / _1801;
                float _1809 = _1803 * 0.693147182464599609375;
                float _1811 = exp2(_1805);
                float _1813 = 1.0 / _1809;
                float _1815 = _1811 + (-1.0);
                float _1817 = -_1815;
                float _1819 = fma(_1817, _1813, _1777);
                float _1821 = _1819 * _1807;
                float _1823 = _1821 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1793 = _1823;
            }
            float _1825 = _1793;
            float _1827 = _1825 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _1829 = _1825 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1831 = _1825 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1833 = _1827 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _1835 = _1827 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _1837 = _1827 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _1839 = fma(_1829, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1833);
            float _1841 = fma(_1829, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1835);
            float _1843 = _1835;
            if (!_170)
            {
                _1843 = _1777;
            }
            float _1845 = _1843;
            float _1847 = fma(_1831, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1839);
            bool _1849 = !_170;
            float _1851 = _1845;
            if (!_1849)
            {
                float _1853 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1855 = log2(_1853);
                float _1857 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1859 = _1857 + 1.0;
                float _1861 = 1.0 / _1859;
                float _1863 = _1855 * _1777;
                float _1865 = exp2(_1863);
                float _1867 = -_1865;
                float _1869 = _1867 + 1.0;
                float _1871 = _1869 * _1861;
                _1851 = _1871;
            }
            float _1873 = _1851;
            float _1875 = fma(_1829, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1837);
            float _1877 = fma(_1831, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1841);
            float _1879 = fma(_1873, _198, _1847);
            float _1881 = fma(_1831, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1875);
            float _1883 = fma(_1873, _196, _1877);
            float _1885 = -_466;
            float _1887 = _1885 + _1879;
            float _1889 = fma(_1873, _200, _1881);
            float _1891 = -_464;
            float _1893 = _1891 + _1883;
            float _1895 = _1887 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _1897 = _1887 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _1899 = _1887 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _1901 = -_480;
            float _1903 = _1901 + _1889;
            float _1905 = fma(_1893, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1895);
            float _1907 = fma(_1893, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1897);
            float _1909 = fma(_1893, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1899);
            float _1911 = fma(_1903, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1905);
            float _1913 = fma(_1903, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1907);
            float _1915 = fma(_1903, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1909);
            _532 = _1913;
            _534 = _1911;
            _536 = _1915;
            _1763 = _1911;
            _1769 = _1913;
            _1775 = _1915;
        }
        float _1917 = _532;
        float _1919 = _534;
        float _1921 = _536;
        float _1923 = _1763;
        float _1925 = _1769;
        float _1927 = _1775;
        float _1929 = _1917 * _1917;
        float _1931 = rsqrt(_1677);
        float _1933 = fma(_1919, _1919, _1929);
        float _1935 = fma(_1921, _1921, _1933);
        float _1937 = sqrt(_1935);
        float _1939 = _1657 * _1931;
        float _1941 = _1653 * _1931;
        float _1943 = _1661 * _1931;
        bool _1945 = _1937 > 0.0;
        bool _1947 = !_1945;
        _538 = _1943;
        _540 = _1919;
        _542 = _1935;
        _544 = _1921;
        if (!_1947)
        {
            float _1949 = rsqrt(_1935);
            float _1951 = _1949 * _1917;
            float _1953 = _1949 * _1919;
            float _1955 = _1949 * _1921;
            float _1957 = _1941 * _1951;
            float _1959 = fma(_1939, _1953, _1957);
            float _1961 = fma(_1943, _1955, _1959);
            float _1963 = _1961 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1965 = fma(_1923, _1963, _1709);
            float _1967 = fma(_1925, _1963, _1719);
            float _1969 = fma(_1927, _1963, _1723);
            _1741 = _1965;
            _1743 = _1969;
            _1745 = _1967;
        }
    }
    float _1971 = _1741;
    float _1973 = _1743;
    float _1975 = _1745;
    float _1977 = _538;
    float _1979 = _540;
    float _1981 = _542;
    float _1983 = _544;
    float _1985 = _1727 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1987 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1989 = isnan(0.5);
    bool _1991 = _1987 || _1989;
    bool _1993 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1995 = _1991 || _1993;
    float _1997 = fma(_1713, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1985);
    bool _1999 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2001 = isnan(0.5);
    bool _2003 = _1999 || _2001;
    bool _2005 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2007 = _2003 || _2005;
    float _2009 = fma(_1731, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1997);
    float _2011 = _1727 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2013 = _2009 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2015 = fma(_1713, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2011);
    float _2017 = 1.0 / _2013;
    float _2019 = fma(_1731, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2015);
    float _2021 = _1983;
    float _2023 = _2013;
    float _2025 = _1979;
    float _2027 = _1977;
    if (_2007)
    {
        _2021 = 1.0;
    }
    float _2029 = _2021;
    float _2031 = _2019 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2033 = _2031 + _2013;
    float _2035 = _2029;
    if (_1995)
    {
        _2023 = _1971;
    }
    float _2037 = _2023;
    float _2039 = _2033 * _2017;
    float _2041 = _2039 * 0.5;
    float _2043 = _2017;
    float _2045 = _2041;
    float _2047 = _2037;
    if (_1995)
    {
        _2043 = _1973;
    }
    float _2049 = _2043;
    float _2051 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2053 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2051);
    float _2055 = _2049;
    if (_1995)
    {
        _2045 = _1975;
    }
    float _2057 = _2045;
    float _2059 = 1.0 / _2053;
    float _2061 = _2057;
    if (!_1995)
    {
        float _2063 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2065 = _1727 + _2063;
        float _2067 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2069 = _1713 + _2067;
        float _2071 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2073 = -_1713;
        float _2075 = _2073 + _1971;
        float _2077 = _2065 * _2065;
        float _2079 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2081 = _1731 + _2079;
        float _2083 = fma(_2069, _2069, _2077);
        float _2085 = -_1731;
        float _2087 = _2085 + _1973;
        float _2089 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2091 = fma(_2081, _2081, _2083);
        float _2093 = sqrt(_2091);
        float _2095 = _2071 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2097 = -_1727;
        float _2099 = _2097 + _1975;
        float _2101 = precise::min(_2093, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2103 = _2101 * _2089;
        float _2105 = _2095 * _2103;
        float _2107 = fma(_2075, _2105, _1713);
        float _2109 = fma(_2099, _2105, _1727);
        float _2111 = fma(_2087, _2105, _1731);
        _2061 = _2109;
        _2047 = _2107;
        _2055 = _2111;
    }
    float _2113 = _2061;
    float _2115 = _2047;
    float _2117 = _2055;
    if (_2007)
    {
        _2025 = 1.0;
    }
    float _2119 = _2025;
    float _2121 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2123 = _2059 * _2121;
    float _2125 = _2119;
    if (!_2007)
    {
        float _2127 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2129 = _2127 * 0.15915493667125701904296875;
        float _2131 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2133 = _2129 * 6.283185482025146484375;
        float _2135 = cos(_2133);
        float _2137 = _2131 * 0.15915493667125701904296875;
        float _2139 = _2129 * 6.283185482025146484375;
        float _2141 = sin(_2139);
        float _2143 = 1.0 / _2135;
        float _2145 = _2137 * 6.283185482025146484375;
        float _2147 = cos(_2145);
        float _2149 = _2141 * _2143;
        float _2151 = _2137 * 6.283185482025146484375;
        float _2153 = sin(_2151);
        float _2155 = _2147 * _2149;
        float _2157 = 1.0 / _2155;
        float _2159 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2161 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2159;
        float _2163 = 1.0 / _2161;
        float _2165 = _2153 * _2157;
        float _2167 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2169 = fma(_2123, _2165, _2167);
        float _2171 = _2169 * _2163;
        float _2173 = precise::clamp(_2171, 0.0, 1.0);
        _2027 = _2163;
        _2035 = _2173;
    }
    float _2175 = _2027;
    float _2177 = _2035;
    float _2179 = _2175;
    if (!_2007)
    {
        float _2181 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2183 = _2181 * 0.15915493667125701904296875;
        float _2185 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2187 = _2183 * 6.283185482025146484375;
        float _2189 = cos(_2187);
        float _2191 = _2185 * 0.15915493667125701904296875;
        float _2193 = _2183 * 6.283185482025146484375;
        float _2195 = sin(_2193);
        float _2197 = 1.0 / _2189;
        float _2199 = _2191 * 6.283185482025146484375;
        float _2201 = cos(_2199);
        float _2203 = _2195 * _2197;
        float _2205 = _2191 * 6.283185482025146484375;
        float _2207 = sin(_2205);
        float _2209 = _2201 * _2203;
        float _2211 = 1.0 / _2209;
        float _2213 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2215 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2213;
        float _2217 = 1.0 / _2215;
        float _2219 = _2207 * _2211;
        float _2221 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2223 = fma(_2123, _2219, _2221);
        float _2225 = _2223 * _2217;
        float _2227 = precise::clamp(_2225, 0.0, 1.0);
        float _2229 = -_2227;
        float _2231 = _2229 + 1.0;
        _2179 = _2209;
        _2125 = _2231;
    }
    float _2233 = _2179;
    float _2235 = _2125;
    float _2237 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2239 = _2113 + _2237;
    float _2241 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2243 = _2115 + _2241;
    float _2245 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2247 = _2117 + _2245;
    float _2249 = _2239 * _2239;
    float _2251 = fma(_2243, _2243, _2249);
    float _2253 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2255 = fma(_2247, _2247, _2251);
    float _2257 = rsqrt(_2255);
    float _2259 = sqrt(_2255);
    float _2261 = _2257 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2263 = _2243 * _2261;
    float _2265 = _2247 * _2261;
    float _2267 = _2263 * _2263;
    float _2269 = _2265 * _2265;
    float _2271 = _2267 + _2269;
    float _2273 = sqrt(_2271);
    bool _2275 = _2273 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2277 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2279 = _2273 + _2277;
    float _2281 = _1981;
    float _2283 = _2233;
    float _2285 = _2279;
    float _2287 = _2239;
    float _2289 = _2263;
    if (_2275)
    {
        float _2291 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2281 = _2291;
    }
    float _2293 = _2281;
    if (_2275)
    {
        float _2295 = rsqrt(_2271);
        _2283 = _2295;
    }
    float _2297 = _2283;
    float _2299 = _2297;
    if (_2275)
    {
        float _2301 = _2279 * _2293;
        _2285 = _2301;
    }
    float _2303 = _2285;
    if (_2275)
    {
        float _2305 = _2303 * 0.15915493667125701904296875;
        _546 = _2305;
    }
    float _2307 = _546;
    float _2309 = _2247;
    if (_2275)
    {
        float _2311 = _2307 * 6.283185482025146484375;
        float _2313 = sin(_2311);
        _2309 = _2313;
    }
    float _2315 = _2309;
    float _2317 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2319 = precise::max(0.0, _2317);
    float _2321 = _2293;
    float _2323 = _2319;
    if (_2275)
    {
        float _2325 = _2307 * 6.283185482025146484375;
        float _2327 = cos(_2325);
        _2321 = _2327;
    }
    float _2329 = _2321;
    float _2331 = -_2261;
    float _2333 = -_2319;
    float _2335 = fma(_2239, _2331, _2333);
    if (_2275)
    {
        float _2337 = _2335 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2287 = _2337;
    }
    float _2339 = _2287;
    float _2341 = _2113 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2343 = _2339;
    float _2345 = _2315;
    if (_2275)
    {
        float _2347 = fma(_2315, _2339, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2343 = _2347;
    }
    float _2349 = _2343;
    float _2351 = _2349;
    if (!_2275)
    {
        _2345 = _2267;
    }
    float _2353 = _2345;
    float _2355 = fma(_2115, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2341);
    float _2357 = _2353;
    float _2359 = _2329;
    if (_2275)
    {
        float _2361 = _2329 + (-1.0);
        _2323 = _2361;
    }
    float _2363 = _2323;
    float _2365 = _2363;
    if (_2275)
    {
        float _2367 = _2297 * _2349;
        _1747 = _2367;
    }
    float _2369 = _1747;
    if (!_2275)
    {
        _2351 = _2335;
    }
    float _2371 = _2351;
    float _2373 = _2371;
    if (_2275)
    {
        float _2375 = _2363 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2299 = _2375;
    }
    float _2377 = _2299;
    if (_2275)
    {
        float _2379 = _2263 * _2369;
        _2289 = _2379;
    }
    float _2381 = _2289;
    if (!_2275)
    {
        _2365 = _2265;
    }
    float _2383 = _2365;
    float _2385 = _2383;
    if (_2275)
    {
        float _2387 = _2265 * _2369;
        _2385 = _2387;
    }
    float _2389 = _2385;
    if (_2275)
    {
        float _2391 = fma(_2335, _2329, _2377);
        _2373 = _2391;
    }
    float _2393 = _2373;
    if (_2275)
    {
        float _2395 = _2381 * _2381;
        _2357 = _2395;
    }
    float _2397 = _2357;
    if (!_2275)
    {
        _2359 = _2269;
    }
    float _2399 = _2359;
    float _2401 = _2399;
    if (_2275)
    {
        float _2403 = _2389 * _2389;
        _2401 = _2403;
    }
    float _2405 = _2401;
    float _2407 = fma(_2393, _2393, _2397);
    float _2409 = _2113 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2411 = _2407 + _2405;
    float _2413 = _2113 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2415 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2417 = fma(_2259, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2415);
    float _2419 = precise::clamp(_2417, 0.0, 1.0);
    float _2421 = fma(_2117, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2355);
    float _2423 = rsqrt(_2411);
    float _2425 = _2113 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2427 = fma(_2115, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2413);
    float _2429 = -_2419;
    float _2431 = _2429 + 1.0;
    float _2433 = _2421 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2435 = fma(_2115, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2425);
    float _2437 = fma(_2115, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2409);
    float _2439 = abs(_2431);
    float _2441 = log2(_2439);
    float _2443 = fma(_2117, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2427);
    float _2445 = _2433 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2447 = fma(_2117, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2435);
    float _2449 = fma(_2117, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2437);
    float _2451 = _2443 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2453 = -_2445;
    float _2455 = fma(_2453, _2253, 1.0);
    float _2457 = _2447 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2459 = _2423 * _2381;
    float _2461 = _2451 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2463 = _2449 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2465 = _2423 * _2393;
    float _2467 = _2459 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2469 = fma(_2457, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2461);
    float _2471 = _2423 * _2389;
    float _2473 = log2(_2455);
    float _2475 = -_2467;
    float _2477 = fma(_2465, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2475);
    float _2479 = fma(_2433, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2469);
    float _2481 = _2441 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2483 = _2451 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2485 = -_2471;
    float _2487 = fma(_2485, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2477);
    float _2489 = fma(_2463, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2479);
    float _2491 = _2451 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2493 = fma(_2457, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2483);
    float _2495 = fma(_2487, -0.5, 0.5);
    float _2497 = exp2(_2481);
    float _2499 = fma(_2457, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2491);
    float _2501 = fma(_2487, 0.5, 0.5);
    float _2503 = fma(_2433, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2493);
    float _2505 = _2465 + 1.0;
    float _2507 = fma(_2433, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2499);
    float _2509 = fma(_2501, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2511 = fma(_2463, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2503);
    float _2513 = 1.0 / _2489;
    float _2515 = fma(_2463, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2507);
    float _2517 = fma(_2501, _2509, -0.212114393711090087890625);
    float _2519 = _2473 * 0.693147182464599609375;
    float _2521 = fma(_2501, _2517, 1.570728778839111328125);
    float _2523 = _2519 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2525 = sqrt(_2495);
    float _2527 = -_2465;
    float _2529 = fma(_2497, _2505, _2527);
    float _2531 = _2515 * _2513;
    float _2533 = _2511 * _2513;
    float _2535 = fma(_2529, 0.5, 0.5);
    float _2537 = fma(_2531, 0.5, 0.5);
    float _2539 = fma(_2533, -0.5, 0.5);
    float _2541 = _2525 * 0.636619746685028076171875;
    float3 _6803 = float3(_2537, _2539, _2523);
    float _2543 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6803, float3(0.0), isnan(_6803)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6803, float3(0.0), isnan(_6803)), level(0.0)).x;
    float _2545 = -_2521;
    float _2547 = fma(_2541, _2545, 1.0);
    float3 _6819 = float3(_2537, _2539, _2523);
    float4 _2550 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6819, float3(0.0), isnan(_6819)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6819, float3(0.0), isnan(_6819)), level(0.0)).xyzw;
    float _2552 = _2550.x;
    float _2554 = _2550.y;
    float _2556 = _2550.z;
    float _2558 = _2550.w;
    float2 _6836 = float2(_2547, _2535);
    float3 _2562 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6836, float2(0.0), isnan(_6836)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6836, float2(0.0), isnan(_6836)), level(0.0)).xyz;
    float _2564 = _2562.x;
    float _2566 = _2562.y;
    float _2568 = _2562.z;
    float _2570 = _2441 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2572 = _2451 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2574 = _2489 * 0.5;
    float _2576 = _2515 + _2489;
    out.m_77.x = _2115;
    out.m_77.y = _2113;
    out.m_77.z = _2117;
    float _2578 = fma(_2457, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2572);
    float _2580 = exp2(_2570);
    float _2582 = _2576 * 0.5;
    bool _2584 = _2259 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2586 = isnan(_2259);
    bool _2588 = _2584 || _2586;
    bool _2590 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2592 = _2588 || _2590;
    float _2594 = fma(_2433, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2578);
    float _2596 = fma(_2511, -0.5, _2574);
    out.m_79.x = _1713;
    out.m_79.y = _1727;
    out.m_79.z = _1731;
    float _2598 = fma(_2463, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2594);
    float _2600 = _2598 + _2489;
    out.gl_Position.x = _2515;
    out.gl_Position.y = _2511;
    out.gl_Position.z = _2598;
    out.gl_Position.w = _2489;
    float _2602 = _2600 * 0.5;
    float _2604 = -_2580;
    float _2606 = _2604 + 1.0;
    float _2608 = _2489;
    float _2610 = _2598;
    float _2612 = _2511;
    if (!_2592)
    {
        _1749 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2614 = _1749;
    float _2616 = _2606 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_81.x = _2582;
    out.m_81.y = _2596;
    out.m_81.z = _2602;
    out.m_81.w = _2489;
    float _2618 = -_2616;
    float _2620 = _2618 + 1.0;
    float _2622 = _2177 * _2235;
    float _2624 = _2614;
    float _2626 = _2614;
    if (!_2592)
    {
        _2608 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2628 = _2608;
    float _2630 = _2628;
    float _2632 = _2628;
    if (!_2592)
    {
        _2610 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2634 = _2610;
    float _2636 = _2622 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2638 = _2636;
    float _2640 = _2634;
    float _2642 = _2634;
    if (!_2592)
    {
        _2612 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2644 = _2612;
    float _2646 = _524 * _2636;
    float _2648 = _2644;
    float _2650 = _2644;
    if (!_2592)
    {
        _2638 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2652 = _2638;
    float _2654 = _2652;
    float _2656 = _2652;
    if (!_2592)
    {
        _548 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2658 = _548;
    float _2660 = _2616 * _2543;
    float _2662 = _2558 * _2660;
    float _2664 = _2568 * _2660;
    float _2666 = fma(_2564, _2662, _2552);
    float _2668 = fma(_2566, _2662, _2554);
    float _2670 = _2558 * _2620;
    float _2672 = fma(_2558, _2664, _2556);
    out.m_83.x = _2666;
    out.m_83.y = _2668;
    out.m_83.z = _2672;
    out.m_83.w = _2670;
    bool _2674 = !_2592;
    float _2676 = _2658;
    float _2678 = _2658;
    if (!_2674)
    {
        bool _2680 = _2259 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2682 = isnan(_2259);
        bool _2684 = _2680 || _2682;
        bool _2686 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2688 = _2684 || _2686;
        if (!_2688)
        {
            float _2690 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2692 = _2259 + _2690;
            float _2694 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2696 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2694;
            float _2698 = 1.0 / _2696;
            float _2700 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2702 = _2700 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2704 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2706 = _2704 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2708 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2710 = _2708 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2712 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2714 = _2712 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2716 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2718 = _2716 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2720 = _2692 * _2698;
            float _2722 = precise::clamp(_2720, 0.0, 1.0);
            float _2724 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2726 = _2724 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2728 = fma(_2722, _2702, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2730 = fma(_2722, _2726, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2732 = fma(_2722, _2706, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2734 = fma(_2722, _2710, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2736 = fma(_2722, _2714, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2738 = fma(_2722, _2718, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2632 = _2730;
            _2656 = _2736;
            _2626 = _2728;
            _2650 = _2734;
            _2642 = _2732;
            _2678 = _2738;
            _2740 = true;
        }
        else
        {
            bool _2742 = _2259 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2744 = isnan(_2259);
            bool _2746 = _2742 || _2744;
            bool _2748 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2750 = _2746 || _2748;
            if (!_2750)
            {
                _2624 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2752 = _2624;
            _2626 = _2752;
            if (!_2750)
            {
                _2630 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2754 = _2630;
            _2632 = _2754;
            if (!_2750)
            {
                _2640 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2756 = _2640;
            _2642 = _2756;
            if (!_2750)
            {
                _2648 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2758 = _2648;
            _2650 = _2758;
            if (!_2750)
            {
                _2654 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2760 = _2654;
            _2656 = _2760;
            if (!_2750)
            {
                _2676 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2762 = _2676;
            bool _2764 = !_2750;
            _2678 = _2762;
            if (!_2764)
            {
                bool _2766 = _2259 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2768 = isnan(_2259);
                bool _2770 = _2766 || _2768;
                bool _2772 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2774 = _2770 || _2772;
                if (!_2774)
                {
                    float _2776 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2778 = _2259 + _2776;
                    float _2780 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2782 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2780;
                    float _2784 = 1.0 / _2782;
                    float _2786 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2788 = _2786 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2790 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2792 = _2790 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2794 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2796 = _2794 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2798 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2800 = _2798 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2802 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2804 = _2802 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2806 = _2778 * _2784;
                    float _2808 = precise::clamp(_2806, 0.0, 1.0);
                    float _2810 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2812 = _2810 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2814 = fma(_2808, _2788, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2816 = fma(_2808, _2812, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2818 = fma(_2808, _2792, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2820 = fma(_2808, _2796, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2822 = fma(_2808, _2800, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2824 = fma(_2808, _2804, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2632 = _2816;
                    _2656 = _2822;
                    _2626 = _2814;
                    _2650 = _2820;
                    _2642 = _2818;
                    _2678 = _2824;
                    _2740 = true;
                }
                else
                {
                    _2632 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2656 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2626 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2650 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2642 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2678 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2740 = false;
    float _2826 = _2632;
    float _2828 = _2656;
    float _2830 = _2626;
    float _2832 = _2650;
    float _2834 = _2642;
    float _2836 = _2678;
    float _2838 = fma(_1691, -0.5, 0.5);
    float _2840 = precise::clamp(_2838, 0.0, 1.0);
    float _2842 = -_2826;
    float _2844 = _2842 + _2828;
    float _2846 = _2646 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2848 = -_2830;
    float _2850 = _2848 + _2832;
    out.m_85.x = 0.0;
    float _2852 = fma(_2840, _2844, _2826);
    float _2854 = fma(_2840, _2850, _2830);
    out.m_51.x = _2846;
    float _2856 = -_2834;
    float _2858 = _2856 + _2836;
    float _2860 = _2852 * 0.586610972881317138671875;
    bool _2862 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2864 = fma(_2840, _2858, _2834);
    float _2866 = fma(_2854, 0.298911988735198974609375, _2860);
    bool _2868 = _2177 > 0.0;
    bool _2870 = isnan(_2177);
    bool _2872 = _2868 || _2870;
    bool _2874 = isnan(0.0);
    bool _2876 = _2872 || _2874;
    float _2878 = fma(_2864, 0.114477999508380889892578125, _2866);
    bool _2880 = _2235 <= 0.0;
    bool _2882 = !_2876;
    bool _2884 = _2880 || _2882;
    float _2886 = -_2878;
    float _2888 = _2854 + _2886;
    float _2890 = -_2878;
    float _2892 = _2852 + _2890;
    float _2894 = -_2878;
    float _2896 = _2864 + _2894;
    float _2898 = fma(_2888, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2878);
    float _2900 = fma(_2892, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2878);
    float _2902 = fma(_2896, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2878);
    bool _2904 = !_2862;
    if (!_2904)
    {
        float _2906 = -_2113;
        float _2908 = _2906 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2910 = -_2115;
        float _2912 = _2910 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2914 = -_2117;
        float _2916 = _2914 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2918 = _2908 * _2908;
        float _2920 = fma(_2912, _2912, _2918);
        float _2922 = fma(_2916, _2916, _2920);
        float _2924 = sqrt(_2922);
        float _2926 = rsqrt(_2922);
        float _2928 = -_2924;
        float _2930 = _2928 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2932 = _2930 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2934 = precise::clamp(_2932, 0.0, 1.0);
        float _2936 = _2912 * _2926;
        float _2938 = _2908 * _2926;
        float _2940 = abs(_2934);
        float _2942 = log2(_2940);
        float _2944 = _2916 * _2926;
        float _2946 = _2936 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2948 = _1691 * _2938;
        float _2950 = -_2938;
        float _2952 = -_2946;
        float _2954 = fma(_2950, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2952);
        float _2956 = fma(_1683, _2936, _2948);
        float _2958 = -_2944;
        float _2960 = fma(_2958, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2954);
        float _2962 = fma(_1703, _2944, _2956);
        float _2964 = precise::clamp(_2962, 0.0, 1.0);
        float _2966 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2968 = _2960 + _2966;
        float _2970 = _2942 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2972 = _2968 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2974 = precise::clamp(_2972, 0.0, 1.0);
        float _2976 = exp2(_2970);
        float _2978 = _2976 * _2974;
        float _2980 = _2964 * _2978;
        float _2982 = _2980 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2984 = _2980 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2986 = _2980 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_85.x = _2982;
        out.m_85.y = _2984;
        out.m_85.z = _2986;
    }
    out.m_65.x = _2898;
    out.m_65.y = _2900;
    out.m_65.z = _2902;
    if (!_2884)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_51.x = 0.0;
    float _2988 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2988;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2740 = false;
    bool _566 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _99 = in.m_44.w;
    float _101 = in.m_46.w;
    float _103 = trunc(_99);
    int _106 = int(_103);
    float _108 = -_101;
    float _110 = _108 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _110;
    bool _114 = _106 >= 1;
    float _116 = 0.0;
    float _118 = _101;
    if (!_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _116;
    if (!_114)
    {
        out.m_51.x = 0.0;
    }
    int _122 = 0;
    if (!_114)
    {
        float _124 = _120 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    int _128 = _126;
    if (!_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3055 = as_type<float>(_126);
        out.gl_Position.z = _3055;
    }
    if (!_114)
    {
        return out;
    }
    bool _130 = _101 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_101);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = float(_106);
    bool _142 = _110 >= _140;
    bool _144 = !_138;
    bool _146 = _142 || _144;
    if (_146)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _118;
    if (_146)
    {
        out.m_51.x = 0.0;
    }
    if (_146)
    {
        float _150 = _148 * 5.0;
        _128 = as_type<int>(_150);
    }
    int _152 = _128;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3110 = as_type<float>(_152);
        out.gl_Position.z = _3110;
    }
    if (_146)
    {
        return out;
    }
    float _154 = in.m_53.x;
    float _156 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _158 = _110 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _160 = _110 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _162 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _164 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _166 = _162 || _164;
    bool _168 = isnan(1.0);
    bool _170 = _166 || _168;
    int _172 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _174 = _172 != 0;
    float _176 = _158 * _156;
    float _178 = 0.0;
    float _180 = _160;
    if (!_170)
    {
        float _182 = _160 * _160;
        float _184 = _182 * 0.5;
        _178 = _184;
    }
    float _186 = _178;
    float _188 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[20].x, _176);
    float _190 = _186;
    if (!_170)
    {
        float _192 = _186 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _192;
    }
    float _194 = _190;
    float _196 = in.m_46.x;
    float _198 = in.m_46.y;
    float _200 = in.m_46.z;
    float _202 = _188 * 6.283185482025146484375;
    float _204 = floor(_188);
    float _206 = _202 * 0.15915493667125701904296875;
    float _208 = _206 * 6.283185482025146484375;
    float _210 = cos(_208);
    float _212 = -_204;
    float _214 = _188 + _212;
    bool _216 = !_170;
    float _218 = _194;
    if (!_216)
    {
        float _220 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = log2(_220);
        float _224 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _226 = _224 + 1.0;
        float _228 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _230 = _160 * _222;
        float _232 = 1.0 / _226;
        float _234 = _228 * 0.693147182464599609375;
        float _236 = exp2(_230);
        float _238 = 1.0 / _234;
        float _240 = _236 + (-1.0);
        float _242 = -_240;
        float _244 = fma(_242, _238, _160);
        float _246 = _244 * _232;
        float _248 = _246 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _218 = _248;
    }
    float _250 = _218;
    bool _252 = !_170;
    if (!_252)
    {
        float _254 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _256 = log2(_254);
        float _258 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _260 = _258 + 1.0;
        float _262 = 1.0 / _260;
        float _264 = _160 * _256;
        float _266 = exp2(_264);
        float _268 = -_266;
        float _270 = _268 + 1.0;
        float _272 = _270 * _262;
        _180 = _272;
    }
    float _274 = _180;
    float _276 = in.m_55.w;
    float _278 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _280 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _282 = in.m_44.x;
    float _284 = in.m_44.y;
    float _286 = in.m_44.z;
    float _288 = _278 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _290 = _278 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _292 = _278 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _294 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[8].x, _288);
    float _296 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[8].y, _290);
    float _298 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _300 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[8].z, _292);
    bool _302 = _214 < 0.5;
    float _304 = float(_302);
    float _306 = fma(_210, 0.5, 0.5);
    float _308 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[10].x, _294);
    float _310 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[10].y, _296);
    float _312 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[10].z, _300);
    float _314 = _300;
    if (!_170)
    {
        float _316 = _110 * _110;
        float _318 = _316 * 0.5;
        _314 = _318;
    }
    float _320 = _314;
    float _322 = fma(_274, _196, _308);
    float _324 = fma(_274, _198, _310);
    float _326 = -_214;
    float _328 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _330 = -_304;
    float _332 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _334 = -_306;
    float _336 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _338 = fma(_274, _200, _312);
    float _340 = _320;
    if (!_170)
    {
        float _342 = _320 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _340 = _342;
    }
    float _344 = _340;
    bool _346 = !_170;
    float _348 = _344;
    float _350 = _284;
    if (!_346)
    {
        float _352 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _354 = log2(_352);
        float _356 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _358 = _356 + 1.0;
        float _360 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _362 = _110 * _354;
        float _364 = 1.0 / _358;
        float _366 = _360 * 0.693147182464599609375;
        float _368 = exp2(_362);
        float _370 = 1.0 / _366;
        float _372 = _368 + (-1.0);
        float _374 = -_372;
        float _376 = fma(_374, _370, _110);
        float _378 = _376 * _364;
        float _380 = _378 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _348 = _380;
    }
    float _382 = _348;
    float _384 = fma(_324, _276, _284);
    float _386 = _382 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _388 = fma(_322, _276, _282);
    if (!_170)
    {
        _350 = _110;
    }
    float _390 = _350;
    bool _392 = !_170;
    float _394 = _390;
    if (!_392)
    {
        float _396 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _398 = log2(_396);
        float _400 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _402 = _400 + 1.0;
        float _404 = 1.0 / _402;
        float _406 = _110 * _398;
        float _408 = exp2(_406);
        float _410 = -_408;
        float _412 = _410 + 1.0;
        float _414 = _412 * _404;
        _394 = _414;
    }
    float _416 = _394;
    int _418 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _420 = _418 != 0;
    int _422 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _424 = _422 != 0;
    float _426 = fma(_338, _276, _286);
    float _428 = _382 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _430 = _386 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _432 = _386 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    bool _434 = !_420;
    int _436 = _434 ? 0 : 1;
    float _438 = _386 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _440 = _382 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _442 = fma(_428, (*spvDescriptorSet0.vp_c10)._m0[8].x, _430);
    float _444 = fma(_428, (*spvDescriptorSet0.vp_c10)._m0[8].y, _432);
    int _446 = abs(_436);
    float _448 = fma(_428, (*spvDescriptorSet0.vp_c10)._m0[8].z, _438);
    bool _450 = !_174;
    int _452 = _450 ? 0 : 1;
    float _454 = fma(_440, (*spvDescriptorSet0.vp_c10)._m0[10].x, _442);
    float _456 = fma(_440, (*spvDescriptorSet0.vp_c10)._m0[10].y, _444);
    float _458 = float(_446);
    float _460 = 1.0 / _140;
    int _462 = abs(_452);
    float _464 = fma(_416, _196, _454);
    float _466 = fma(_416, _198, _456);
    float _468 = abs(_328);
    float _470 = _458 * _468;
    float _472 = fma(_440, (*spvDescriptorSet0.vp_c10)._m0[10].z, _448);
    float _474 = -_466;
    float _476 = _324 + _474;
    bool _478 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _480 = fma(_416, _200, _472);
    bool _482 = !_424;
    int _484 = _482 ? 0 : 1;
    float _486 = _476 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _488 = float(_462);
    float _490 = -_464;
    float _492 = _322 + _490;
    int _494 = abs(_484);
    float _496 = _476 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _498 = _476 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _500 = fma(_492, (*spvDescriptorSet0.vp_c10)._m0[5].x, _486);
    float _502 = float(_494);
    float _504 = fma(_492, (*spvDescriptorSet0.vp_c10)._m0[4].x, _496);
    float _506 = fma(_492, (*spvDescriptorSet0.vp_c10)._m0[6].x, _498);
    float _508 = -_480;
    float _510 = _338 + _508;
    float _512 = fma(_488, _336, _470);
    float _514 = _110 * _460;
    float _516 = fma(_510, (*spvDescriptorSet0.vp_c10)._m0[4].z, _504);
    float _518 = fma(_510, (*spvDescriptorSet0.vp_c10)._m0[5].z, _500);
    float _520 = fma(_510, (*spvDescriptorSet0.vp_c10)._m0[6].z, _506);
    float _522 = abs(_332);
    float _524 = fma(_502, _522, _512);
    bool _526 = !_478;
    float _528 = _514;
    float _530 = _520;
    float _532 = _518;
    float _534 = _516;
    float _536 = _520;
    float _538 = _466;
    float _540 = _516;
    float _542 = _480;
    float _544 = _520;
    float _546 = _464;
    float _548 = _524;
    float _564;
    if (!_526)
    {
        float _550 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _552 = _154 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _554 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[12].x, _110);
        float _556 = _554 * _550;
        float _558 = floor(_556);
        float _560 = -_558;
        float _562 = _556 + _560;
        _564 = _562;
        _566 = true;
    }
    else
    {
        _564 = _514;
    }
    _566 = false;
    float _568 = _564;
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _572 = _568 + _570;
    bool _574 = _568 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _576 = isnan(_568);
    bool _578 = _574 || _576;
    bool _580 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _582 = _578 || _580;
    float _584 = float(_582);
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _586;
    float _590 = -_584;
    float _592 = _590 + 1.0;
    bool _594 = _568 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _596 = isnan(_568);
    bool _598 = _594 || _596;
    bool _600 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _602 = _598 || _600;
    float _604 = float(_602);
    float _606 = 1.0 / _588;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _610 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _608;
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _614 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _612;
    bool _616 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _618 = _604 * _592;
    float _620 = -_604;
    float _622 = _620 + 1.0;
    float _624 = _572 * _606;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _628 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _626;
    float _630 = in.m_55.x;
    float _632 = in.m_55.y;
    float _634 = in.m_55.z;
    float _636 = fma(_610, _624, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _638 = fma(_628, _624, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _640 = fma(_614, _624, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _642 = _636 * _618;
    float _644 = _638 * _618;
    float _646 = _640 * _618;
    float _648 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[143].x, _642);
    float _650 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[143].y, _644);
    float _652 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[143].z, _646);
    float _654 = fma(_584, (*spvDescriptorSet0.vp_c9)._m0[144].x, _648);
    float _656 = fma(_584, (*spvDescriptorSet0.vp_c9)._m0[144].y, _650);
    float _658 = fma(_584, (*spvDescriptorSet0.vp_c9)._m0[144].z, _652);
    float _660 = _654 * _630;
    float _662 = _656 * _632;
    float _664 = _658 * _634;
    bool _666 = !_616;
    if (!_666)
    {
        float _668 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _670 = _154 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _672 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[11].y, _110);
        float _674 = _672 * _668;
        float _676 = floor(_674);
        float _678 = -_676;
        float _680 = _674 + _678;
        _528 = _680;
    }
    float _682 = _528;
    float _684 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _686 = int(_684);
    float _688 = in.m_57.y;
    float _690 = _384 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _692 = in.m_53.y;
    int _694 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _696 = _694 != 0;
    float _698 = _384 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _700 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _702 = int(_700);
    float _704 = _154 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _706 = _660 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _708 = _662 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _710 = _706 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _712 = float(_686);
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _716 = _714 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _718 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _720 = 1.0 / _712;
    float _722 = _664 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _724 = float(uint(_702));
    int _726 = ~_702;
    int _728 = _726 + 1;
    float _730 = float(_702);
    float _732 = 1.0 / _716;
    bool _734 = _692 > 0.5;
    int _736 = ~_702;
    int _738 = _736 + 1;
    float _740 = _110 * _720;
    float _742 = 1.0 / _724;
    float _744 = trunc(_740);
    int _746 = int(_744);
    int _748 = as_type<int>(_742) + (-2);
    int _750 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _752 = _750 != 0;
    float _754 = float(uint(_746));
    bool _756 = !_752;
    float _758 = _756 ? 7.345489978790283203125 : 1.0;
    int _760 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _762 = _760 != 0;
    int _764 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _766 = _764 != 0;
    int _768 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _770 = _768 != 0;
    float _772 = as_type<float>(_748) * _754;
    int _774 = ~_702;
    int _776 = _774 + 1;
    int _778 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _780 = _778 != 0;
    float _782 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[5].x, _690);
    bool _784 = !_766;
    int _786 = _784 ? 0 : 1;
    float _788 = trunc(_772);
    float _790 = precise::max(_788, 0.0);
    uint _793 = uint(_790);
    bool _795 = !_762;
    int _797 = _795 ? 0 : 1;
    int _799 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _801 = _799 != 0;
    int _803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _805 = _803 != 0;
    int _807 = _776 * int(_793);
    int _809 = _807 + _746;
    float _811 = in.m_59.x;
    float _813 = in.m_59.y;
    float _815 = in.m_59.z;
    float _817 = float(uint(_809));
    float _819 = as_type<float>(_748) * _817;
    float _821 = trunc(_819);
    float _823 = precise::max(_821, 0.0);
    uint _825 = uint(_823);
    int _827 = int(_793) + int(_825);
    float _829 = -_688;
    float _831 = _829 + 1.0;
    int _833 = _728 * _827;
    int _835 = _833 + _746;
    float _837 = _688;
    if (_696)
    {
        float _839 = _734 ? _831 : _688;
        _837 = _839;
    }
    float _841 = _837;
    float _843 = _758 * _154;
    bool _845 = _813 != 0.0;
    bool _847 = isnan(_813);
    bool _849 = _845 || _847;
    bool _851 = isnan(0.0);
    bool _853 = _849 || _851;
    bool _855 = uint(_835) >= uint(_702);
    float _857 = floor(_843);
    float _859 = in.m_61.x;
    float _861 = in.m_61.y;
    float _863 = in.m_61.z;
    float _865 = float(_746);
    bool _867 = !_855;
    int _869 = _867 ? 0 : (-1);
    bool _871 = _811 == 0.0;
    bool _873 = !_853;
    bool _875 = _871 && _873;
    int _877 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _879 = _877 != 0;
    float _881 = _384 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _883 = _865 >= _730;
    bool _885 = isnan(_865);
    bool _887 = _883 || _885;
    bool _889 = isnan(_730);
    bool _891 = _887 || _889;
    float _893 = float(_891);
    bool _895 = _815 == 0.0;
    bool _897 = _895 && _875;
    float _899 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[4].x, _881);
    int _901 = ~_827;
    int _903 = _901 + _869;
    int _905 = _903 + 1;
    float _907 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _813);
    float _909 = trunc(_893);
    int _911 = int(_909);
    float _913 = -_857;
    float _915 = _843 + _913;
    float _917 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _811);
    float _919 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _815);
    float _921 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[6].x, _698);
    float _923 = fma(_426, (*spvDescriptorSet0.vp_c10)._m0[4].z, _899);
    bool _925 = !_805;
    int _927 = _925 ? 0 : 1;
    float _929 = _861;
    float _931 = _859;
    float _933 = _863;
    if (!_897)
    {
        float _935 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[17].y, _861);
        _929 = _935;
    }
    float _937 = _929;
    float _939 = _915 * _730;
    if (!_897)
    {
        float _941 = fma(_811, (*spvDescriptorSet0.vp_c9)._m0[17].y, _859);
        _931 = _941;
    }
    float _943 = _931;
    if (!_897)
    {
        float _945 = fma(_815, (*spvDescriptorSet0.vp_c9)._m0[17].y, _863);
        _933 = _945;
    }
    float _947 = _933;
    int _949 = _702 * _905;
    int _951 = _949 + _746;
    float _953 = _110 * _730;
    bool _955 = _702 == 0;
    float _957 = trunc(_939);
    int _959 = int(_957);
    int _961 = ~_911;
    int _963 = _961 + 1;
    int _965 = _963 + 1;
    float _967 = _953 * _460;
    bool _969 = !_955;
    int _971 = _969 ? _951 : (-1);
    float _973 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _975 = _702 + (-1);
    int _977 = abs(_927);
    int _979 = _971 * _965;
    float _981 = trunc(_967);
    int _983 = int(_981);
    float _985 = -_973;
    float _987 = fma(_704, 2.0, _985);
    int _989 = abs(_786);
    int _991 = _911 * _975;
    int _993 = _991 + _979;
    float _995 = -_110;
    float _997 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[76].x, _987);
    bool _999 = !_770;
    int _1001 = _999 ? 0 : 1;
    int _1003 = _993 * _989;
    int _1005 = abs(_797);
    int _1007 = _959 * _977;
    int _1009 = _1007 + _746;
    int _1011 = abs(_1001);
    float _1013 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1015 = !_780;
    int _1017 = _1015 ? 0 : 1;
    int _1019 = _983 * _1005;
    int _1021 = _1019 + _1003;
    bool _1023 = _154 > 0.5;
    bool _1025 = _1023 && _879;
    float _1027 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1013);
    int _1029 = abs(_1017);
    int _1031 = _1009 * _1011;
    int _1033 = _1031 + _1021;
    float _1035 = fma(_426, (*spvDescriptorSet0.vp_c10)._m0[5].z, _782);
    float _1037 = fma(_426, (*spvDescriptorSet0.vp_c10)._m0[6].z, _921);
    float _1039 = _923 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1041 = _959 * _1029;
    int _1043 = _1041 + _1033;
    float _1045 = _1035 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1047 = _1037 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1049 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1051 = _1039 + _1049;
    float _1053 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1055 = _1045 + _1053;
    float _1057 = float(uint(_1043));
    float _1059 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1061 = _1047 + _1059;
    float _1063 = _1055 * _1055;
    float _1065 = as_type<float>(_748) * _1057;
    float _1067 = _692 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1069 = fma(_1051, _1051, _1063);
    float _1071 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1073 = trunc(_1065);
    float _1075 = precise::max(_1073, 0.0);
    uint _1077 = uint(_1075);
    float _1079 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1081 = _1079 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1083 = fma(_1061, _1061, _1069);
    float _1085 = fma(_1067, -2.0, _1071);
    float _1087 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1085);
    float _1089 = sqrt(_1083);
    float _1091 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1093 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1095 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1097 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1099 = _1091 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1101 = _1095 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1103 = _738 * int(_1077);
    int _1105 = _1103 + _1043;
    float _1107 = rsqrt(_1083);
    float _1109 = _1097 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1111 = float(uint(_1105));
    float _1113 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[78].w, _718);
    float _1115 = fma(_841, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _1117 = _1089 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1119 = 1.0 / _1081;
    float _1121 = as_type<float>(_748) * _1111;
    float _1123 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1113);
    float _1125 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1127 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1125;
    float _1129 = precise::min(_710, _1117);
    float _1131 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1133 = _1131 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    out.m_63.x = _1101;
    out.m_63.y = _1109;
    out.m_63.z = _1099;
    out.m_63.w = _1093;
    float _1135 = trunc(_1121);
    float _1137 = precise::max(_1135, 0.0);
    uint _1139 = uint(_1137);
    float _1141 = _1107 * _1129;
    float _1143 = _1133 * _732;
    float _1145 = _1127 * _1119;
    float _1147 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1149 = _682 + _1147;
    float _1151 = -_1087;
    float _1153 = fma(_1123, _1115, _1151);
    float _1155 = float(uint(_1009));
    float _1157 = in.m_57.x;
    float _1159 = _1055 * _1141;
    int _1161 = int(_1077) + int(_1139);
    float _1163 = _1051 * _1141;
    float _1165 = as_type<float>(_748) * _1155;
    float _1167 = -_1159;
    float _1169 = _1055 + _1167;
    float _1171 = fma(_1145, _1149, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    int _1173 = ~_702;
    int _1175 = _1173 + 1;
    float _1177 = -_1163;
    float _1179 = _1051 + _1177;
    float _1181 = _1169 * _1169;
    float _1183 = _1061 * _1141;
    float _1185 = trunc(_1165);
    float _1187 = precise::max(_1185, 0.0);
    uint _1189 = uint(_1187);
    float _1191 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1193 = _682 + _1191;
    float _1195 = fma(_1179, _1179, _1181);
    float _1197 = -_1183;
    float _1199 = _1061 + _1197;
    int _1201 = _1175 * _1161;
    int _1203 = _1201 + _1043;
    bool _1205 = _682 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1207 = isnan(_682);
    bool _1209 = _1205 || _1207;
    bool _1211 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1213 = _1209 || _1211;
    float _1215 = float(_1213);
    float _1217 = fma(_1143, _1193, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1219 = fma(_1199, _1199, _1195);
    int _1221 = ~_702;
    int _1223 = _1221 + 1;
    bool _1225 = _682 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1227 = isnan(_682);
    bool _1229 = _1225 || _1227;
    bool _1231 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1233 = _1229 || _1231;
    float _1235 = float(_1233);
    float _1237 = -_1215;
    float _1239 = _1237 + 1.0;
    bool _1241 = uint(_1203) >= uint(_702);
    float _1243 = _1235 * _1239;
    float _1245 = as_type<float>(_1223);
    float _1247 = _1157;
    if (_879)
    {
        _1245 = _1157;
    }
    float _1249 = _1245;
    float _1251 = -_1235;
    float _1253 = _1251 + 1.0;
    bool _1255 = !_1241;
    int _1257 = _1255 ? 0 : (-1);
    int _1259 = _1223 * int(_1189);
    int _1261 = _1259 + _1009;
    bool _1263 = _682 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1265 = isnan(_682);
    bool _1267 = _1263 || _1265;
    bool _1269 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1271 = _1267 || _1269;
    float _1273 = float(_1271);
    float _1275 = _1249;
    if (_1025)
    {
        float _1277 = -_1249;
        float _1279 = _1277 + 1.0;
        _1275 = _1279;
    }
    float _1281 = _1275;
    int _1283 = ~_1161;
    int _1285 = _1283 + _1257;
    int _1287 = _1285 + 1;
    float _1289 = float(uint(_1261));
    float _1291 = sqrt(_1219);
    if (_879)
    {
        _1247 = _1281;
    }
    float _1293 = _1247;
    int _1295 = _702 * _1287;
    int _1297 = _1295 + _1043;
    float _1299 = _1273 * _1253;
    float _1301 = as_type<float>(_748) * _1289;
    float _1303 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1027);
    float _1305 = fma(_1293, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    bool _1307 = !_955;
    int _1309 = _1307 ? _1297 : (-1);
    float _1311 = _1171 * _1299;
    float _1313 = -_1273;
    float _1315 = _1313 + 1.0;
    float _1317 = fma(_1303, _1305, _997);
    int _1319 = _1309 >> 31;
    float _1321 = _937 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1323 = fma(_1315, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1311);
    float _1325 = _937 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1327 = _937 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1329 = _1319 & 3;
    float _1331 = trunc(_1301);
    float _1333 = precise::max(_1331, 0.0);
    uint _1335 = uint(_1333);
    float _1337 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1321);
    float _1339 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1325);
    float _1341 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1327);
    float _1343 = _1107 * _1291;
    int _1345 = _1309 + _1329;
    float _1347 = fma(_1217, _1243, _1323);
    int _1349 = _1309 & 3;
    bool _1351 = _1349 != 0;
    float _1353 = _708 * _1343;
    int _1355 = _1345 >> 2;
    float _1357 = _706 * _1343;
    float _1359 = _722 * _1343;
    float _1361 = _1353 * _907;
    int _1363 = _1355 << 4;
    int _1365 = _1363 + 368;
    float _1367 = _1357 * _917;
    float _1369 = _1359 * _919;
    float _1371 = _1361 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    uint _1373 = uint(int(uint(_1365) >> uint(2)));
    uint _1375 = uint(int(uint(int(_1373)) >> uint(2)));
    int _1377 = int(_1373) & 3;
    float _1379 = (*spvDescriptorSet0.vp_c9)._m0[int(_1375)][_1377];
    int _1381 = int(_1373) + 1;
    uint _1383 = uint(int(uint(_1381) >> uint(2)));
    int _1385 = _1381 & 3;
    float _1387 = (*spvDescriptorSet0.vp_c9)._m0[int(_1383)][_1385];
    int _1389 = int(_1189) + int(_1335);
    float _1391 = _1361 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1393 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1371);
    int _1395 = ~_702;
    int _1397 = _1395 + 1;
    float _1399 = fma(_1215, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1347);
    float _1401 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1391);
    float _1403 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1393);
    int _1405 = _1365 + 8;
    uint _1407 = uint(int(uint(_1405) >> uint(2)));
    uint _1409 = uint(int(uint(int(_1407)) >> uint(2)));
    int _1411 = int(_1407) & 3;
    float _1413 = (*spvDescriptorSet0.vp_c9)._m0[int(_1409)][_1411];
    int _1415 = int(_1407) + 1;
    uint _1417 = uint(int(uint(_1415) >> uint(2)));
    int _1419 = _1415 & 3;
    float _1421 = (*spvDescriptorSet0.vp_c9)._m0[int(_1417)][_1419];
    bool _1423 = uint(_1349) > 1u;
    float _1425 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1401);
    float _1427 = _1403 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _1429 = _1309 & 3;
    bool _1431 = _1429 != 0;
    int _1433 = _1397 * _1389;
    int _1435 = _1433 + _1009;
    float _1437 = _1425 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1439 = _1047 + _1427;
    int _1441 = _1431 ? 0 : 1;
    float _1443 = _1361 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _1445 = uint(_1435) >= uint(_702);
    float _1447 = _1039 + _1437;
    float _1449 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1451 = _1439 + _1449;
    int _1453 = ~_1441;
    int _1455 = _1453 + 1;
    int _1457 = _1455 + 1;
    float _1459 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1443);
    int _1461 = _1457;
    if (!_1423)
    {
        int _1463 = ~_1441;
        int _1465 = _1463 + 1;
        _1461 = _1465;
    }
    int _1467 = _1461;
    float _1469 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1471 = _1447 + _1469;
    float _1473 = _1451 * _1451;
    bool _1475 = _1349 != 3;
    int _1477 = abs(_1467);
    float _1479 = fma(_1471, _1471, _1473);
    bool _1481 = !_1445;
    int _1483 = _1481 ? 0 : (-1);
    bool _1485 = uint(_1349) >= 2u;
    float _1487 = sqrt(_1479);
    bool _1489 = !_1351;
    int _1491 = _1489 ? 0 : 1;
    int _1493 = _1485 ? 0 : 1;
    bool _1495 = _1349 != 3;
    int _1497 = ~_1493;
    int _1499 = _1497 + 1;
    int _1501 = _1499 + 1;
    int _1503 = abs(_1491);
    int _1505 = _1501;
    if (_1475)
    {
        int _1507 = ~_1493;
        int _1509 = _1507 + 1;
        _1505 = _1509;
    }
    int _1511 = _1505;
    int _1513 = ~_1477;
    int _1515 = _1513 + 1;
    int _1517 = _1515 + 1;
    float _1519 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1459);
    bool _1521 = !_1495;
    int _1523 = _1521 ? 0 : (-1);
    int _1525 = abs(_1511);
    int _1527 = _1517 * as_type<int>(_1387);
    int _1529 = ~_1503;
    int _1531 = _1529 + 1;
    int _1533 = _1531 + 1;
    float _1535 = _1519 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _1537 = _1487 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1539 = !_801;
    int _1541 = _1539 ? 0 : 1;
    int _1543 = _1533 * as_type<int>(_1379);
    int _1545 = _1543 + _1527;
    int _1547 = ~_1525;
    int _1549 = _1547 + 1;
    int _1551 = _1549 + 1;
    int _1553 = abs(_1523);
    int _1555 = abs(_1541);
    int _1557 = _1551 * as_type<int>(_1413);
    int _1559 = _1557 + _1545;
    int _1561 = ~_1389;
    int _1563 = _1561 + _1483;
    int _1565 = _1563 + 1;
    float _1567 = _1045 + _1535;
    int _1569 = ~_1553;
    int _1571 = _1569 + 1;
    int _1573 = _1571 + 1;
    int _1575 = _702 * _1565;
    int _1577 = _1575 + _1009;
    float _1579 = as_type<float>(_1527);
    float _1581 = as_type<float>(_1573);
    float _1583 = as_type<float>(_1565);
    if (!_1537)
    {
        _1579 = _1447;
    }
    float _1585 = _1579;
    int _1587 = _1573 * as_type<int>(_1421);
    int _1589 = _1587 + _1559;
    int _1591 = ~_1555;
    int _1593 = _1591 + 1;
    int _1595 = _1593 + 1;
    float _1597 = _1585;
    if (!_1537)
    {
        _1581 = _1439;
    }
    float _1599 = _1581;
    float _1601 = _1599;
    if (!_1537)
    {
        _1583 = _1567;
    }
    float _1603 = _1583;
    bool _1605 = !_1537;
    float _1607 = _1603;
    if (!_1605)
    {
        float _1609 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1611 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1613 = _1487 + _1611;
        float _1615 = _1567 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1617 = rsqrt(_1479);
        float _1619 = _1613 * _1609;
        float _1621 = _1619 * 0.15915493667125701904296875;
        float _1623 = _1621 * 6.283185482025146484375;
        float _1625 = cos(_1623);
        float _1627 = _1621 * 6.283185482025146484375;
        float _1629 = sin(_1627);
        float _1631 = _1625 + (-1.0);
        float _1633 = fma(_1629, _1615, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1635 = _1631 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1637 = _1617 * _1633;
        float _1639 = fma(_1567, _1625, _1635);
        float _1641 = fma(_1471, _1637, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1643 = fma(_1451, _1637, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1607 = _1639;
        _1597 = _1641;
        _1601 = _1643;
    }
    float _1645 = _1607;
    float _1647 = _1597;
    float _1649 = _1601;
    float _1651 = -_1045;
    float _1653 = _1651 + _1645;
    float _1655 = -_1039;
    float _1657 = _1655 + _1647;
    float _1659 = -_1047;
    float _1661 = _1659 + _1649;
    int _1663 = _1589 * _1595;
    float _1665 = _1653 * _1653;
    bool _1667 = !_955;
    int _1669 = _1667 ? _1577 : (-1);
    out.m_65.w = _1129;
    float _1671 = fma(_1657, _1657, _1665);
    int _1673 = _1669 * _1555;
    int _1675 = _1673 + _1663;
    float _1677 = fma(_1661, _1661, _1671);
    float _1679 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1681 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1683 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1337);
    float _1685 = sqrt(_1677);
    float _1687 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1689 = _1153 + 0.5;
    float _1691 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1339);
    float _1693 = _1679 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1695 = _1681 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1697 = _1687 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1699 = _1317 + 0.5;
    float _1701 = _1399 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1703 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1341);
    float _1705 = float(_1675);
    out.m_67.x = _1357;
    float _1707 = -_1163;
    float _1709 = _1707 + _1647;
    float _1711 = -_1163;
    float _1713 = _1039 + _1711;
    out.m_69.x = _1699;
    out.m_69.y = _1689;
    bool _1715 = _1685 > 0.0;
    float _1717 = -_1159;
    float _1719 = _1717 + _1645;
    float _1721 = -_1183;
    float _1723 = _1721 + _1649;
    out.m_71.x = _1693;
    out.m_71.y = _1695;
    out.m_71.z = _1697;
    out.m_71.w = _1701;
    float _1725 = -_1159;
    float _1727 = _1045 + _1725;
    float _1729 = -_1183;
    float _1731 = _1047 + _1729;
    out.m_73.x = _1705;
    out.m_75.x = _1683;
    out.m_75.y = _1691;
    out.m_75.z = _1703;
    bool _1733 = !_1715;
    float _1735 = _1697;
    float _1737 = _1693;
    float _1739 = _1695;
    float _1741 = _1709;
    float _1743 = _1723;
    float _1745 = _1719;
    float _1747 = _1699;
    float _1749 = _1713;
    if (!_1733)
    {
        bool _1751 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1753 = _1159;
        if (_1751)
        {
            float _1755 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1753 = _1755;
        }
        float _1757 = _1753;
        if (_1751)
        {
            float _1759 = _516 * _1757;
            _1735 = _1759;
        }
        float _1761 = _1735;
        float _1763 = _1761;
        if (_1751)
        {
            float _1765 = _518 * _1757;
            _1737 = _1765;
        }
        float _1767 = _1737;
        float _1769 = _1767;
        if (_1751)
        {
            float _1771 = _520 * _1757;
            _1739 = _1771;
        }
        float _1773 = _1739;
        float _1775 = _1773;
        if (!_1751)
        {
            float _1777 = _110 + 1.0;
            if (!_170)
            {
                float _1779 = _1777 * _1777;
                float _1781 = _1779 * 0.5;
                _530 = _1781;
            }
            float _1783 = _530;
            float _1785 = _1783;
            if (!_170)
            {
                float _1787 = _1783 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1785 = _1787;
            }
            float _1789 = _1785;
            bool _1791 = !_170;
            float _1793 = _1789;
            if (!_1791)
            {
                float _1795 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1797 = log2(_1795);
                float _1799 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1801 = _1799 + 1.0;
                float _1803 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1805 = _1797 * _1777;
                float _1807 = 1.0 / _1801;
                float _1809 = _1803 * 0.693147182464599609375;
                float _1811 = exp2(_1805);
                float _1813 = 1.0 / _1809;
                float _1815 = _1811 + (-1.0);
                float _1817 = -_1815;
                float _1819 = fma(_1817, _1813, _1777);
                float _1821 = _1819 * _1807;
                float _1823 = _1821 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1793 = _1823;
            }
            float _1825 = _1793;
            float _1827 = _1825 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _1829 = _1825 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1831 = _1825 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1833 = _1827 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _1835 = _1827 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _1837 = _1827 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _1839 = fma(_1829, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1833);
            float _1841 = fma(_1829, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1835);
            float _1843 = _1835;
            if (!_170)
            {
                _1843 = _1777;
            }
            float _1845 = _1843;
            float _1847 = fma(_1831, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1839);
            bool _1849 = !_170;
            float _1851 = _1845;
            if (!_1849)
            {
                float _1853 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1855 = log2(_1853);
                float _1857 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1859 = _1857 + 1.0;
                float _1861 = 1.0 / _1859;
                float _1863 = _1855 * _1777;
                float _1865 = exp2(_1863);
                float _1867 = -_1865;
                float _1869 = _1867 + 1.0;
                float _1871 = _1869 * _1861;
                _1851 = _1871;
            }
            float _1873 = _1851;
            float _1875 = fma(_1829, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1837);
            float _1877 = fma(_1831, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1841);
            float _1879 = fma(_1873, _198, _1847);
            float _1881 = fma(_1831, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1875);
            float _1883 = fma(_1873, _196, _1877);
            float _1885 = -_466;
            float _1887 = _1885 + _1879;
            float _1889 = fma(_1873, _200, _1881);
            float _1891 = -_464;
            float _1893 = _1891 + _1883;
            float _1895 = _1887 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _1897 = _1887 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _1899 = _1887 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _1901 = -_480;
            float _1903 = _1901 + _1889;
            float _1905 = fma(_1893, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1895);
            float _1907 = fma(_1893, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1897);
            float _1909 = fma(_1893, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1899);
            float _1911 = fma(_1903, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1905);
            float _1913 = fma(_1903, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1907);
            float _1915 = fma(_1903, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1909);
            _532 = _1913;
            _534 = _1911;
            _536 = _1915;
            _1763 = _1911;
            _1769 = _1913;
            _1775 = _1915;
        }
        float _1917 = _532;
        float _1919 = _534;
        float _1921 = _536;
        float _1923 = _1763;
        float _1925 = _1769;
        float _1927 = _1775;
        float _1929 = _1917 * _1917;
        float _1931 = rsqrt(_1677);
        float _1933 = fma(_1919, _1919, _1929);
        float _1935 = fma(_1921, _1921, _1933);
        float _1937 = sqrt(_1935);
        float _1939 = _1657 * _1931;
        float _1941 = _1653 * _1931;
        float _1943 = _1661 * _1931;
        bool _1945 = _1937 > 0.0;
        bool _1947 = !_1945;
        _538 = _1943;
        _540 = _1919;
        _542 = _1935;
        _544 = _1921;
        if (!_1947)
        {
            float _1949 = rsqrt(_1935);
            float _1951 = _1949 * _1917;
            float _1953 = _1949 * _1919;
            float _1955 = _1949 * _1921;
            float _1957 = _1941 * _1951;
            float _1959 = fma(_1939, _1953, _1957);
            float _1961 = fma(_1943, _1955, _1959);
            float _1963 = _1961 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1965 = fma(_1923, _1963, _1709);
            float _1967 = fma(_1925, _1963, _1719);
            float _1969 = fma(_1927, _1963, _1723);
            _1741 = _1965;
            _1743 = _1969;
            _1745 = _1967;
        }
    }
    float _1971 = _1741;
    float _1973 = _1743;
    float _1975 = _1745;
    float _1977 = _538;
    float _1979 = _540;
    float _1981 = _542;
    float _1983 = _544;
    float _1985 = _1727 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1987 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1989 = isnan(0.5);
    bool _1991 = _1987 || _1989;
    bool _1993 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1995 = _1991 || _1993;
    float _1997 = fma(_1713, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1985);
    bool _1999 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2001 = isnan(0.5);
    bool _2003 = _1999 || _2001;
    bool _2005 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2007 = _2003 || _2005;
    float _2009 = fma(_1731, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1997);
    float _2011 = _1727 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2013 = _2009 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2015 = fma(_1713, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2011);
    float _2017 = 1.0 / _2013;
    float _2019 = fma(_1731, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2015);
    float _2021 = _1983;
    float _2023 = _2013;
    float _2025 = _1979;
    float _2027 = _1977;
    if (_2007)
    {
        _2021 = 1.0;
    }
    float _2029 = _2021;
    float _2031 = _2019 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2033 = _2031 + _2013;
    float _2035 = _2029;
    if (_1995)
    {
        _2023 = _1971;
    }
    float _2037 = _2023;
    float _2039 = _2033 * _2017;
    float _2041 = _2039 * 0.5;
    float _2043 = _2017;
    float _2045 = _2041;
    float _2047 = _2037;
    if (_1995)
    {
        _2043 = _1973;
    }
    float _2049 = _2043;
    float _2051 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2053 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2051);
    float _2055 = _2049;
    if (_1995)
    {
        _2045 = _1975;
    }
    float _2057 = _2045;
    float _2059 = 1.0 / _2053;
    float _2061 = _2057;
    if (!_1995)
    {
        float _2063 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2065 = _1727 + _2063;
        float _2067 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2069 = _1713 + _2067;
        float _2071 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2073 = -_1713;
        float _2075 = _2073 + _1971;
        float _2077 = _2065 * _2065;
        float _2079 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2081 = _1731 + _2079;
        float _2083 = fma(_2069, _2069, _2077);
        float _2085 = -_1731;
        float _2087 = _2085 + _1973;
        float _2089 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2091 = fma(_2081, _2081, _2083);
        float _2093 = sqrt(_2091);
        float _2095 = _2071 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2097 = -_1727;
        float _2099 = _2097 + _1975;
        float _2101 = precise::min(_2093, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2103 = _2101 * _2089;
        float _2105 = _2095 * _2103;
        float _2107 = fma(_2075, _2105, _1713);
        float _2109 = fma(_2099, _2105, _1727);
        float _2111 = fma(_2087, _2105, _1731);
        _2061 = _2109;
        _2047 = _2107;
        _2055 = _2111;
    }
    float _2113 = _2061;
    float _2115 = _2047;
    float _2117 = _2055;
    if (_2007)
    {
        _2025 = 1.0;
    }
    float _2119 = _2025;
    float _2121 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2123 = _2059 * _2121;
    float _2125 = _2119;
    if (!_2007)
    {
        float _2127 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2129 = _2127 * 0.15915493667125701904296875;
        float _2131 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2133 = _2129 * 6.283185482025146484375;
        float _2135 = cos(_2133);
        float _2137 = _2131 * 0.15915493667125701904296875;
        float _2139 = _2129 * 6.283185482025146484375;
        float _2141 = sin(_2139);
        float _2143 = 1.0 / _2135;
        float _2145 = _2137 * 6.283185482025146484375;
        float _2147 = cos(_2145);
        float _2149 = _2141 * _2143;
        float _2151 = _2137 * 6.283185482025146484375;
        float _2153 = sin(_2151);
        float _2155 = _2147 * _2149;
        float _2157 = 1.0 / _2155;
        float _2159 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2161 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2159;
        float _2163 = 1.0 / _2161;
        float _2165 = _2153 * _2157;
        float _2167 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2169 = fma(_2123, _2165, _2167);
        float _2171 = _2169 * _2163;
        float _2173 = precise::clamp(_2171, 0.0, 1.0);
        _2027 = _2163;
        _2035 = _2173;
    }
    float _2175 = _2027;
    float _2177 = _2035;
    float _2179 = _2175;
    if (!_2007)
    {
        float _2181 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2183 = _2181 * 0.15915493667125701904296875;
        float _2185 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2187 = _2183 * 6.283185482025146484375;
        float _2189 = cos(_2187);
        float _2191 = _2185 * 0.15915493667125701904296875;
        float _2193 = _2183 * 6.283185482025146484375;
        float _2195 = sin(_2193);
        float _2197 = 1.0 / _2189;
        float _2199 = _2191 * 6.283185482025146484375;
        float _2201 = cos(_2199);
        float _2203 = _2195 * _2197;
        float _2205 = _2191 * 6.283185482025146484375;
        float _2207 = sin(_2205);
        float _2209 = _2201 * _2203;
        float _2211 = 1.0 / _2209;
        float _2213 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2215 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2213;
        float _2217 = 1.0 / _2215;
        float _2219 = _2207 * _2211;
        float _2221 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2223 = fma(_2123, _2219, _2221);
        float _2225 = _2223 * _2217;
        float _2227 = precise::clamp(_2225, 0.0, 1.0);
        float _2229 = -_2227;
        float _2231 = _2229 + 1.0;
        _2179 = _2209;
        _2125 = _2231;
    }
    float _2233 = _2179;
    float _2235 = _2125;
    float _2237 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2239 = _2113 + _2237;
    float _2241 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2243 = _2115 + _2241;
    float _2245 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2247 = _2117 + _2245;
    float _2249 = _2239 * _2239;
    float _2251 = fma(_2243, _2243, _2249);
    float _2253 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2255 = fma(_2247, _2247, _2251);
    float _2257 = rsqrt(_2255);
    float _2259 = sqrt(_2255);
    float _2261 = _2257 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2263 = _2243 * _2261;
    float _2265 = _2247 * _2261;
    float _2267 = _2263 * _2263;
    float _2269 = _2265 * _2265;
    float _2271 = _2267 + _2269;
    float _2273 = sqrt(_2271);
    bool _2275 = _2273 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2277 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2279 = _2273 + _2277;
    float _2281 = _1981;
    float _2283 = _2233;
    float _2285 = _2279;
    float _2287 = _2239;
    float _2289 = _2263;
    if (_2275)
    {
        float _2291 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2281 = _2291;
    }
    float _2293 = _2281;
    if (_2275)
    {
        float _2295 = rsqrt(_2271);
        _2283 = _2295;
    }
    float _2297 = _2283;
    float _2299 = _2297;
    if (_2275)
    {
        float _2301 = _2279 * _2293;
        _2285 = _2301;
    }
    float _2303 = _2285;
    if (_2275)
    {
        float _2305 = _2303 * 0.15915493667125701904296875;
        _546 = _2305;
    }
    float _2307 = _546;
    float _2309 = _2247;
    if (_2275)
    {
        float _2311 = _2307 * 6.283185482025146484375;
        float _2313 = sin(_2311);
        _2309 = _2313;
    }
    float _2315 = _2309;
    float _2317 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2319 = precise::max(0.0, _2317);
    float _2321 = _2293;
    float _2323 = _2319;
    if (_2275)
    {
        float _2325 = _2307 * 6.283185482025146484375;
        float _2327 = cos(_2325);
        _2321 = _2327;
    }
    float _2329 = _2321;
    float _2331 = -_2261;
    float _2333 = -_2319;
    float _2335 = fma(_2239, _2331, _2333);
    if (_2275)
    {
        float _2337 = _2335 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2287 = _2337;
    }
    float _2339 = _2287;
    float _2341 = _2113 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2343 = _2339;
    float _2345 = _2315;
    if (_2275)
    {
        float _2347 = fma(_2315, _2339, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2343 = _2347;
    }
    float _2349 = _2343;
    float _2351 = _2349;
    if (!_2275)
    {
        _2345 = _2267;
    }
    float _2353 = _2345;
    float _2355 = fma(_2115, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2341);
    float _2357 = _2353;
    float _2359 = _2329;
    if (_2275)
    {
        float _2361 = _2329 + (-1.0);
        _2323 = _2361;
    }
    float _2363 = _2323;
    float _2365 = _2363;
    if (_2275)
    {
        float _2367 = _2297 * _2349;
        _1747 = _2367;
    }
    float _2369 = _1747;
    if (!_2275)
    {
        _2351 = _2335;
    }
    float _2371 = _2351;
    float _2373 = _2371;
    if (_2275)
    {
        float _2375 = _2363 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2299 = _2375;
    }
    float _2377 = _2299;
    if (_2275)
    {
        float _2379 = _2263 * _2369;
        _2289 = _2379;
    }
    float _2381 = _2289;
    if (!_2275)
    {
        _2365 = _2265;
    }
    float _2383 = _2365;
    float _2385 = _2383;
    if (_2275)
    {
        float _2387 = _2265 * _2369;
        _2385 = _2387;
    }
    float _2389 = _2385;
    if (_2275)
    {
        float _2391 = fma(_2335, _2329, _2377);
        _2373 = _2391;
    }
    float _2393 = _2373;
    if (_2275)
    {
        float _2395 = _2381 * _2381;
        _2357 = _2395;
    }
    float _2397 = _2357;
    if (!_2275)
    {
        _2359 = _2269;
    }
    float _2399 = _2359;
    float _2401 = _2399;
    if (_2275)
    {
        float _2403 = _2389 * _2389;
        _2401 = _2403;
    }
    float _2405 = _2401;
    float _2407 = fma(_2393, _2393, _2397);
    float _2409 = _2113 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2411 = _2407 + _2405;
    float _2413 = _2113 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2415 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2417 = fma(_2259, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2415);
    float _2419 = precise::clamp(_2417, 0.0, 1.0);
    float _2421 = fma(_2117, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2355);
    float _2423 = rsqrt(_2411);
    float _2425 = _2113 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2427 = fma(_2115, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2413);
    float _2429 = -_2419;
    float _2431 = _2429 + 1.0;
    float _2433 = _2421 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2435 = fma(_2115, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2425);
    float _2437 = fma(_2115, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2409);
    float _2439 = abs(_2431);
    float _2441 = log2(_2439);
    float _2443 = fma(_2117, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2427);
    float _2445 = _2433 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2447 = fma(_2117, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2435);
    float _2449 = fma(_2117, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2437);
    float _2451 = _2443 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2453 = -_2445;
    float _2455 = fma(_2453, _2253, 1.0);
    float _2457 = _2447 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2459 = _2423 * _2381;
    float _2461 = _2451 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2463 = _2449 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2465 = _2423 * _2393;
    float _2467 = _2459 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2469 = fma(_2457, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2461);
    float _2471 = _2423 * _2389;
    float _2473 = log2(_2455);
    float _2475 = -_2467;
    float _2477 = fma(_2465, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2475);
    float _2479 = fma(_2433, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2469);
    float _2481 = _2441 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2483 = _2451 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2485 = -_2471;
    float _2487 = fma(_2485, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2477);
    float _2489 = fma(_2463, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2479);
    float _2491 = _2451 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2493 = fma(_2457, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2483);
    float _2495 = fma(_2487, -0.5, 0.5);
    float _2497 = exp2(_2481);
    float _2499 = fma(_2457, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2491);
    float _2501 = fma(_2487, 0.5, 0.5);
    float _2503 = fma(_2433, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2493);
    float _2505 = _2465 + 1.0;
    float _2507 = fma(_2433, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2499);
    float _2509 = fma(_2501, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2511 = fma(_2463, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2503);
    float _2513 = 1.0 / _2489;
    float _2515 = fma(_2463, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2507);
    float _2517 = fma(_2501, _2509, -0.212114393711090087890625);
    float _2519 = _2473 * 0.693147182464599609375;
    float _2521 = fma(_2501, _2517, 1.570728778839111328125);
    float _2523 = _2519 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2525 = sqrt(_2495);
    float _2527 = -_2465;
    float _2529 = fma(_2497, _2505, _2527);
    float _2531 = _2515 * _2513;
    float _2533 = _2511 * _2513;
    float _2535 = fma(_2529, 0.5, 0.5);
    float _2537 = fma(_2531, 0.5, 0.5);
    float _2539 = fma(_2533, -0.5, 0.5);
    float _2541 = _2525 * 0.636619746685028076171875;
    float3 _6803 = float3(_2537, _2539, _2523);
    float _2543 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6803, float3(0.0), isnan(_6803)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6803, float3(0.0), isnan(_6803)), level(0.0)).x;
    float _2545 = -_2521;
    float _2547 = fma(_2541, _2545, 1.0);
    float3 _6819 = float3(_2537, _2539, _2523);
    float4 _2550 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6819, float3(0.0), isnan(_6819)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6819, float3(0.0), isnan(_6819)), level(0.0)).xyzw;
    float _2552 = _2550.x;
    float _2554 = _2550.y;
    float _2556 = _2550.z;
    float _2558 = _2550.w;
    float2 _6836 = float2(_2547, _2535);
    float3 _2562 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6836, float2(0.0), isnan(_6836)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6836, float2(0.0), isnan(_6836)), level(0.0)).xyz;
    float _2564 = _2562.x;
    float _2566 = _2562.y;
    float _2568 = _2562.z;
    float _2570 = _2441 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2572 = _2451 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2574 = _2489 * 0.5;
    float _2576 = _2515 + _2489;
    out.m_77.x = _2115;
    out.m_77.y = _2113;
    out.m_77.z = _2117;
    float _2578 = fma(_2457, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2572);
    float _2580 = exp2(_2570);
    float _2582 = _2576 * 0.5;
    bool _2584 = _2259 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2586 = isnan(_2259);
    bool _2588 = _2584 || _2586;
    bool _2590 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2592 = _2588 || _2590;
    float _2594 = fma(_2433, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2578);
    float _2596 = fma(_2511, -0.5, _2574);
    out.m_79.x = _1713;
    out.m_79.y = _1727;
    out.m_79.z = _1731;
    float _2598 = fma(_2463, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2594);
    float _2600 = _2598 + _2489;
    out.gl_Position.x = _2515;
    out.gl_Position.y = _2511;
    out.gl_Position.z = _2598;
    out.gl_Position.w = _2489;
    float _2602 = _2600 * 0.5;
    float _2604 = -_2580;
    float _2606 = _2604 + 1.0;
    float _2608 = _2489;
    float _2610 = _2598;
    float _2612 = _2511;
    if (!_2592)
    {
        _1749 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2614 = _1749;
    float _2616 = _2606 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_81.x = _2582;
    out.m_81.y = _2596;
    out.m_81.z = _2602;
    out.m_81.w = _2489;
    float _2618 = -_2616;
    float _2620 = _2618 + 1.0;
    float _2622 = _2177 * _2235;
    float _2624 = _2614;
    float _2626 = _2614;
    if (!_2592)
    {
        _2608 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2628 = _2608;
    float _2630 = _2628;
    float _2632 = _2628;
    if (!_2592)
    {
        _2610 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2634 = _2610;
    float _2636 = _2622 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2638 = _2636;
    float _2640 = _2634;
    float _2642 = _2634;
    if (!_2592)
    {
        _2612 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2644 = _2612;
    float _2646 = _524 * _2636;
    float _2648 = _2644;
    float _2650 = _2644;
    if (!_2592)
    {
        _2638 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2652 = _2638;
    float _2654 = _2652;
    float _2656 = _2652;
    if (!_2592)
    {
        _548 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2658 = _548;
    float _2660 = _2616 * _2543;
    float _2662 = _2558 * _2660;
    float _2664 = _2568 * _2660;
    float _2666 = fma(_2564, _2662, _2552);
    float _2668 = fma(_2566, _2662, _2554);
    float _2670 = _2558 * _2620;
    float _2672 = fma(_2558, _2664, _2556);
    out.m_83.x = _2666;
    out.m_83.y = _2668;
    out.m_83.z = _2672;
    out.m_83.w = _2670;
    bool _2674 = !_2592;
    float _2676 = _2658;
    float _2678 = _2658;
    if (!_2674)
    {
        bool _2680 = _2259 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2682 = isnan(_2259);
        bool _2684 = _2680 || _2682;
        bool _2686 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2688 = _2684 || _2686;
        if (!_2688)
        {
            float _2690 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2692 = _2259 + _2690;
            float _2694 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2696 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2694;
            float _2698 = 1.0 / _2696;
            float _2700 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2702 = _2700 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2704 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2706 = _2704 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2708 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2710 = _2708 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2712 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2714 = _2712 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2716 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2718 = _2716 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2720 = _2692 * _2698;
            float _2722 = precise::clamp(_2720, 0.0, 1.0);
            float _2724 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2726 = _2724 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2728 = fma(_2722, _2702, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2730 = fma(_2722, _2726, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2732 = fma(_2722, _2706, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2734 = fma(_2722, _2710, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2736 = fma(_2722, _2714, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2738 = fma(_2722, _2718, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2632 = _2730;
            _2656 = _2736;
            _2626 = _2728;
            _2650 = _2734;
            _2642 = _2732;
            _2678 = _2738;
            _2740 = true;
        }
        else
        {
            bool _2742 = _2259 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2744 = isnan(_2259);
            bool _2746 = _2742 || _2744;
            bool _2748 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2750 = _2746 || _2748;
            if (!_2750)
            {
                _2624 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2752 = _2624;
            _2626 = _2752;
            if (!_2750)
            {
                _2630 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2754 = _2630;
            _2632 = _2754;
            if (!_2750)
            {
                _2640 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2756 = _2640;
            _2642 = _2756;
            if (!_2750)
            {
                _2648 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2758 = _2648;
            _2650 = _2758;
            if (!_2750)
            {
                _2654 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2760 = _2654;
            _2656 = _2760;
            if (!_2750)
            {
                _2676 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2762 = _2676;
            bool _2764 = !_2750;
            _2678 = _2762;
            if (!_2764)
            {
                bool _2766 = _2259 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2768 = isnan(_2259);
                bool _2770 = _2766 || _2768;
                bool _2772 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2774 = _2770 || _2772;
                if (!_2774)
                {
                    float _2776 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2778 = _2259 + _2776;
                    float _2780 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2782 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2780;
                    float _2784 = 1.0 / _2782;
                    float _2786 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2788 = _2786 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2790 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2792 = _2790 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2794 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2796 = _2794 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2798 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2800 = _2798 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2802 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2804 = _2802 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2806 = _2778 * _2784;
                    float _2808 = precise::clamp(_2806, 0.0, 1.0);
                    float _2810 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2812 = _2810 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2814 = fma(_2808, _2788, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2816 = fma(_2808, _2812, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2818 = fma(_2808, _2792, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2820 = fma(_2808, _2796, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2822 = fma(_2808, _2800, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2824 = fma(_2808, _2804, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2632 = _2816;
                    _2656 = _2822;
                    _2626 = _2814;
                    _2650 = _2820;
                    _2642 = _2818;
                    _2678 = _2824;
                    _2740 = true;
                }
                else
                {
                    _2632 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2656 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2626 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2650 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2642 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2678 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2740 = false;
    float _2826 = _2632;
    float _2828 = _2656;
    float _2830 = _2626;
    float _2832 = _2650;
    float _2834 = _2642;
    float _2836 = _2678;
    float _2838 = fma(_1691, -0.5, 0.5);
    float _2840 = precise::clamp(_2838, 0.0, 1.0);
    float _2842 = -_2826;
    float _2844 = _2842 + _2828;
    float _2846 = _2646 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2848 = -_2830;
    float _2850 = _2848 + _2832;
    out.m_85.x = 0.0;
    float _2852 = fma(_2840, _2844, _2826);
    float _2854 = fma(_2840, _2850, _2830);
    out.m_51.x = _2846;
    float _2856 = -_2834;
    float _2858 = _2856 + _2836;
    float _2860 = _2852 * 0.586610972881317138671875;
    bool _2862 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2864 = fma(_2840, _2858, _2834);
    float _2866 = fma(_2854, 0.298911988735198974609375, _2860);
    bool _2868 = _2177 > 0.0;
    bool _2870 = isnan(_2177);
    bool _2872 = _2868 || _2870;
    bool _2874 = isnan(0.0);
    bool _2876 = _2872 || _2874;
    float _2878 = fma(_2864, 0.114477999508380889892578125, _2866);
    bool _2880 = _2235 <= 0.0;
    bool _2882 = !_2876;
    bool _2884 = _2880 || _2882;
    float _2886 = -_2878;
    float _2888 = _2854 + _2886;
    float _2890 = -_2878;
    float _2892 = _2852 + _2890;
    float _2894 = -_2878;
    float _2896 = _2864 + _2894;
    float _2898 = fma(_2888, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2878);
    float _2900 = fma(_2892, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2878);
    float _2902 = fma(_2896, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2878);
    bool _2904 = !_2862;
    if (!_2904)
    {
        float _2906 = -_2113;
        float _2908 = _2906 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2910 = -_2115;
        float _2912 = _2910 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2914 = -_2117;
        float _2916 = _2914 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2918 = _2908 * _2908;
        float _2920 = fma(_2912, _2912, _2918);
        float _2922 = fma(_2916, _2916, _2920);
        float _2924 = sqrt(_2922);
        float _2926 = rsqrt(_2922);
        float _2928 = -_2924;
        float _2930 = _2928 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2932 = _2930 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2934 = precise::clamp(_2932, 0.0, 1.0);
        float _2936 = _2912 * _2926;
        float _2938 = _2908 * _2926;
        float _2940 = abs(_2934);
        float _2942 = log2(_2940);
        float _2944 = _2916 * _2926;
        float _2946 = _2936 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2948 = _1691 * _2938;
        float _2950 = -_2938;
        float _2952 = -_2946;
        float _2954 = fma(_2950, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2952);
        float _2956 = fma(_1683, _2936, _2948);
        float _2958 = -_2944;
        float _2960 = fma(_2958, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2954);
        float _2962 = fma(_1703, _2944, _2956);
        float _2964 = precise::clamp(_2962, 0.0, 1.0);
        float _2966 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2968 = _2960 + _2966;
        float _2970 = _2942 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2972 = _2968 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2974 = precise::clamp(_2972, 0.0, 1.0);
        float _2976 = exp2(_2970);
        float _2978 = _2976 * _2974;
        float _2980 = _2964 * _2978;
        float _2982 = _2980 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2984 = _2980 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2986 = _2980 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_85.x = _2982;
        out.m_85.y = _2984;
        out.m_85.z = _2986;
    }
    out.m_65.x = _2898;
    out.m_65.y = _2900;
    out.m_65.z = _2902;
    if (!_2884)
    {
        return out;
    }
    out.m_51.x = 0.0;
    float _2988 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2988;
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
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2740 = false;
    bool _566 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _99 = in.m_44.w;
    float _101 = in.m_46.w;
    float _103 = trunc(_99);
    int _106 = int(_103);
    float _108 = -_101;
    float _110 = _108 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _110;
    bool _114 = _106 >= 1;
    float _116 = 0.0;
    float _118 = _101;
    if (!_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _116;
    if (!_114)
    {
        out.m_51.x = 0.0;
    }
    int _122 = 0;
    if (!_114)
    {
        float _124 = _120 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    int _128 = _126;
    if (!_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3055 = as_type<float>(_126);
        out.gl_Position.z = _3055;
    }
    if (!_114)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _130 = _101 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_101);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = float(_106);
    bool _142 = _110 >= _140;
    bool _144 = !_138;
    bool _146 = _142 || _144;
    if (_146)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _118;
    if (_146)
    {
        out.m_51.x = 0.0;
    }
    if (_146)
    {
        float _150 = _148 * 5.0;
        _128 = as_type<int>(_150);
    }
    int _152 = _128;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3110 = as_type<float>(_152);
        out.gl_Position.z = _3110;
    }
    if (_146)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _154 = in.m_53.x;
    float _156 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _158 = _110 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _160 = _110 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _162 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _164 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _166 = _162 || _164;
    bool _168 = isnan(1.0);
    bool _170 = _166 || _168;
    int _172 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _174 = _172 != 0;
    float _176 = _158 * _156;
    float _178 = 0.0;
    float _180 = _160;
    if (!_170)
    {
        float _182 = _160 * _160;
        float _184 = _182 * 0.5;
        _178 = _184;
    }
    float _186 = _178;
    float _188 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[20].x, _176);
    float _190 = _186;
    if (!_170)
    {
        float _192 = _186 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _192;
    }
    float _194 = _190;
    float _196 = in.m_46.x;
    float _198 = in.m_46.y;
    float _200 = in.m_46.z;
    float _202 = _188 * 6.283185482025146484375;
    float _204 = floor(_188);
    float _206 = _202 * 0.15915493667125701904296875;
    float _208 = _206 * 6.283185482025146484375;
    float _210 = cos(_208);
    float _212 = -_204;
    float _214 = _188 + _212;
    bool _216 = !_170;
    float _218 = _194;
    if (!_216)
    {
        float _220 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = log2(_220);
        float _224 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _226 = _224 + 1.0;
        float _228 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _230 = _160 * _222;
        float _232 = 1.0 / _226;
        float _234 = _228 * 0.693147182464599609375;
        float _236 = exp2(_230);
        float _238 = 1.0 / _234;
        float _240 = _236 + (-1.0);
        float _242 = -_240;
        float _244 = fma(_242, _238, _160);
        float _246 = _244 * _232;
        float _248 = _246 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _218 = _248;
    }
    float _250 = _218;
    bool _252 = !_170;
    if (!_252)
    {
        float _254 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _256 = log2(_254);
        float _258 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _260 = _258 + 1.0;
        float _262 = 1.0 / _260;
        float _264 = _160 * _256;
        float _266 = exp2(_264);
        float _268 = -_266;
        float _270 = _268 + 1.0;
        float _272 = _270 * _262;
        _180 = _272;
    }
    float _274 = _180;
    float _276 = in.m_55.w;
    float _278 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _280 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _282 = in.m_44.x;
    float _284 = in.m_44.y;
    float _286 = in.m_44.z;
    float _288 = _278 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _290 = _278 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _292 = _278 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _294 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[8].x, _288);
    float _296 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[8].y, _290);
    float _298 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _300 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[8].z, _292);
    bool _302 = _214 < 0.5;
    float _304 = float(_302);
    float _306 = fma(_210, 0.5, 0.5);
    float _308 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[10].x, _294);
    float _310 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[10].y, _296);
    float _312 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[10].z, _300);
    float _314 = _300;
    if (!_170)
    {
        float _316 = _110 * _110;
        float _318 = _316 * 0.5;
        _314 = _318;
    }
    float _320 = _314;
    float _322 = fma(_274, _196, _308);
    float _324 = fma(_274, _198, _310);
    float _326 = -_214;
    float _328 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _330 = -_304;
    float _332 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _334 = -_306;
    float _336 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _338 = fma(_274, _200, _312);
    float _340 = _320;
    if (!_170)
    {
        float _342 = _320 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _340 = _342;
    }
    float _344 = _340;
    bool _346 = !_170;
    float _348 = _344;
    float _350 = _284;
    if (!_346)
    {
        float _352 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _354 = log2(_352);
        float _356 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _358 = _356 + 1.0;
        float _360 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _362 = _110 * _354;
        float _364 = 1.0 / _358;
        float _366 = _360 * 0.693147182464599609375;
        float _368 = exp2(_362);
        float _370 = 1.0 / _366;
        float _372 = _368 + (-1.0);
        float _374 = -_372;
        float _376 = fma(_374, _370, _110);
        float _378 = _376 * _364;
        float _380 = _378 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _348 = _380;
    }
    float _382 = _348;
    float _384 = fma(_324, _276, _284);
    float _386 = _382 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _388 = fma(_322, _276, _282);
    if (!_170)
    {
        _350 = _110;
    }
    float _390 = _350;
    bool _392 = !_170;
    float _394 = _390;
    if (!_392)
    {
        float _396 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _398 = log2(_396);
        float _400 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _402 = _400 + 1.0;
        float _404 = 1.0 / _402;
        float _406 = _110 * _398;
        float _408 = exp2(_406);
        float _410 = -_408;
        float _412 = _410 + 1.0;
        float _414 = _412 * _404;
        _394 = _414;
    }
    float _416 = _394;
    int _418 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _420 = _418 != 0;
    int _422 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _424 = _422 != 0;
    float _426 = fma(_338, _276, _286);
    float _428 = _382 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _430 = _386 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _432 = _386 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    bool _434 = !_420;
    int _436 = _434 ? 0 : 1;
    float _438 = _386 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _440 = _382 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _442 = fma(_428, (*spvDescriptorSet0.vp_c10)._m0[8].x, _430);
    float _444 = fma(_428, (*spvDescriptorSet0.vp_c10)._m0[8].y, _432);
    int _446 = abs(_436);
    float _448 = fma(_428, (*spvDescriptorSet0.vp_c10)._m0[8].z, _438);
    bool _450 = !_174;
    int _452 = _450 ? 0 : 1;
    float _454 = fma(_440, (*spvDescriptorSet0.vp_c10)._m0[10].x, _442);
    float _456 = fma(_440, (*spvDescriptorSet0.vp_c10)._m0[10].y, _444);
    float _458 = float(_446);
    float _460 = 1.0 / _140;
    int _462 = abs(_452);
    float _464 = fma(_416, _196, _454);
    float _466 = fma(_416, _198, _456);
    float _468 = abs(_328);
    float _470 = _458 * _468;
    float _472 = fma(_440, (*spvDescriptorSet0.vp_c10)._m0[10].z, _448);
    float _474 = -_466;
    float _476 = _324 + _474;
    bool _478 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _480 = fma(_416, _200, _472);
    bool _482 = !_424;
    int _484 = _482 ? 0 : 1;
    float _486 = _476 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _488 = float(_462);
    float _490 = -_464;
    float _492 = _322 + _490;
    int _494 = abs(_484);
    float _496 = _476 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _498 = _476 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _500 = fma(_492, (*spvDescriptorSet0.vp_c10)._m0[5].x, _486);
    float _502 = float(_494);
    float _504 = fma(_492, (*spvDescriptorSet0.vp_c10)._m0[4].x, _496);
    float _506 = fma(_492, (*spvDescriptorSet0.vp_c10)._m0[6].x, _498);
    float _508 = -_480;
    float _510 = _338 + _508;
    float _512 = fma(_488, _336, _470);
    float _514 = _110 * _460;
    float _516 = fma(_510, (*spvDescriptorSet0.vp_c10)._m0[4].z, _504);
    float _518 = fma(_510, (*spvDescriptorSet0.vp_c10)._m0[5].z, _500);
    float _520 = fma(_510, (*spvDescriptorSet0.vp_c10)._m0[6].z, _506);
    float _522 = abs(_332);
    float _524 = fma(_502, _522, _512);
    bool _526 = !_478;
    float _528 = _514;
    float _530 = _520;
    float _532 = _518;
    float _534 = _516;
    float _536 = _520;
    float _538 = _466;
    float _540 = _516;
    float _542 = _480;
    float _544 = _520;
    float _546 = _464;
    float _548 = _524;
    float _564;
    if (!_526)
    {
        float _550 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _552 = _154 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _554 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[12].x, _110);
        float _556 = _554 * _550;
        float _558 = floor(_556);
        float _560 = -_558;
        float _562 = _556 + _560;
        _564 = _562;
        _566 = true;
    }
    else
    {
        _564 = _514;
    }
    _566 = false;
    float _568 = _564;
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _572 = _568 + _570;
    bool _574 = _568 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _576 = isnan(_568);
    bool _578 = _574 || _576;
    bool _580 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _582 = _578 || _580;
    float _584 = float(_582);
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _586;
    float _590 = -_584;
    float _592 = _590 + 1.0;
    bool _594 = _568 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _596 = isnan(_568);
    bool _598 = _594 || _596;
    bool _600 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _602 = _598 || _600;
    float _604 = float(_602);
    float _606 = 1.0 / _588;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _610 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _608;
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _614 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _612;
    bool _616 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _618 = _604 * _592;
    float _620 = -_604;
    float _622 = _620 + 1.0;
    float _624 = _572 * _606;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _628 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _626;
    float _630 = in.m_55.x;
    float _632 = in.m_55.y;
    float _634 = in.m_55.z;
    float _636 = fma(_610, _624, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _638 = fma(_628, _624, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _640 = fma(_614, _624, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _642 = _636 * _618;
    float _644 = _638 * _618;
    float _646 = _640 * _618;
    float _648 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[143].x, _642);
    float _650 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[143].y, _644);
    float _652 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[143].z, _646);
    float _654 = fma(_584, (*spvDescriptorSet0.vp_c9)._m0[144].x, _648);
    float _656 = fma(_584, (*spvDescriptorSet0.vp_c9)._m0[144].y, _650);
    float _658 = fma(_584, (*spvDescriptorSet0.vp_c9)._m0[144].z, _652);
    float _660 = _654 * _630;
    float _662 = _656 * _632;
    float _664 = _658 * _634;
    bool _666 = !_616;
    if (!_666)
    {
        float _668 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _670 = _154 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _672 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[11].y, _110);
        float _674 = _672 * _668;
        float _676 = floor(_674);
        float _678 = -_676;
        float _680 = _674 + _678;
        _528 = _680;
    }
    float _682 = _528;
    float _684 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _686 = int(_684);
    float _688 = in.m_57.y;
    float _690 = _384 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _692 = in.m_53.y;
    int _694 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _696 = _694 != 0;
    float _698 = _384 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _700 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _702 = int(_700);
    float _704 = _154 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _706 = _660 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _708 = _662 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _710 = _706 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _712 = float(_686);
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _716 = _714 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _718 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _720 = 1.0 / _712;
    float _722 = _664 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _724 = float(uint(_702));
    int _726 = ~_702;
    int _728 = _726 + 1;
    float _730 = float(_702);
    float _732 = 1.0 / _716;
    bool _734 = _692 > 0.5;
    int _736 = ~_702;
    int _738 = _736 + 1;
    float _740 = _110 * _720;
    float _742 = 1.0 / _724;
    float _744 = trunc(_740);
    int _746 = int(_744);
    int _748 = as_type<int>(_742) + (-2);
    int _750 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _752 = _750 != 0;
    float _754 = float(uint(_746));
    bool _756 = !_752;
    float _758 = _756 ? 7.345489978790283203125 : 1.0;
    int _760 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _762 = _760 != 0;
    int _764 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _766 = _764 != 0;
    int _768 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _770 = _768 != 0;
    float _772 = as_type<float>(_748) * _754;
    int _774 = ~_702;
    int _776 = _774 + 1;
    int _778 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _780 = _778 != 0;
    float _782 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[5].x, _690);
    bool _784 = !_766;
    int _786 = _784 ? 0 : 1;
    float _788 = trunc(_772);
    float _790 = precise::max(_788, 0.0);
    uint _793 = uint(_790);
    bool _795 = !_762;
    int _797 = _795 ? 0 : 1;
    int _799 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _801 = _799 != 0;
    int _803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _805 = _803 != 0;
    int _807 = _776 * int(_793);
    int _809 = _807 + _746;
    float _811 = in.m_59.x;
    float _813 = in.m_59.y;
    float _815 = in.m_59.z;
    float _817 = float(uint(_809));
    float _819 = as_type<float>(_748) * _817;
    float _821 = trunc(_819);
    float _823 = precise::max(_821, 0.0);
    uint _825 = uint(_823);
    int _827 = int(_793) + int(_825);
    float _829 = -_688;
    float _831 = _829 + 1.0;
    int _833 = _728 * _827;
    int _835 = _833 + _746;
    float _837 = _688;
    if (_696)
    {
        float _839 = _734 ? _831 : _688;
        _837 = _839;
    }
    float _841 = _837;
    float _843 = _758 * _154;
    bool _845 = _813 != 0.0;
    bool _847 = isnan(_813);
    bool _849 = _845 || _847;
    bool _851 = isnan(0.0);
    bool _853 = _849 || _851;
    bool _855 = uint(_835) >= uint(_702);
    float _857 = floor(_843);
    float _859 = in.m_61.x;
    float _861 = in.m_61.y;
    float _863 = in.m_61.z;
    float _865 = float(_746);
    bool _867 = !_855;
    int _869 = _867 ? 0 : (-1);
    bool _871 = _811 == 0.0;
    bool _873 = !_853;
    bool _875 = _871 && _873;
    int _877 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _879 = _877 != 0;
    float _881 = _384 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _883 = _865 >= _730;
    bool _885 = isnan(_865);
    bool _887 = _883 || _885;
    bool _889 = isnan(_730);
    bool _891 = _887 || _889;
    float _893 = float(_891);
    bool _895 = _815 == 0.0;
    bool _897 = _895 && _875;
    float _899 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[4].x, _881);
    int _901 = ~_827;
    int _903 = _901 + _869;
    int _905 = _903 + 1;
    float _907 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _813);
    float _909 = trunc(_893);
    int _911 = int(_909);
    float _913 = -_857;
    float _915 = _843 + _913;
    float _917 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _811);
    float _919 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _815);
    float _921 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[6].x, _698);
    float _923 = fma(_426, (*spvDescriptorSet0.vp_c10)._m0[4].z, _899);
    bool _925 = !_805;
    int _927 = _925 ? 0 : 1;
    float _929 = _861;
    float _931 = _859;
    float _933 = _863;
    if (!_897)
    {
        float _935 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[17].y, _861);
        _929 = _935;
    }
    float _937 = _929;
    float _939 = _915 * _730;
    if (!_897)
    {
        float _941 = fma(_811, (*spvDescriptorSet0.vp_c9)._m0[17].y, _859);
        _931 = _941;
    }
    float _943 = _931;
    if (!_897)
    {
        float _945 = fma(_815, (*spvDescriptorSet0.vp_c9)._m0[17].y, _863);
        _933 = _945;
    }
    float _947 = _933;
    int _949 = _702 * _905;
    int _951 = _949 + _746;
    float _953 = _110 * _730;
    bool _955 = _702 == 0;
    float _957 = trunc(_939);
    int _959 = int(_957);
    int _961 = ~_911;
    int _963 = _961 + 1;
    int _965 = _963 + 1;
    float _967 = _953 * _460;
    bool _969 = !_955;
    int _971 = _969 ? _951 : (-1);
    float _973 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _975 = _702 + (-1);
    int _977 = abs(_927);
    int _979 = _971 * _965;
    float _981 = trunc(_967);
    int _983 = int(_981);
    float _985 = -_973;
    float _987 = fma(_704, 2.0, _985);
    int _989 = abs(_786);
    int _991 = _911 * _975;
    int _993 = _991 + _979;
    float _995 = -_110;
    float _997 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[76].x, _987);
    bool _999 = !_770;
    int _1001 = _999 ? 0 : 1;
    int _1003 = _993 * _989;
    int _1005 = abs(_797);
    int _1007 = _959 * _977;
    int _1009 = _1007 + _746;
    int _1011 = abs(_1001);
    float _1013 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1015 = !_780;
    int _1017 = _1015 ? 0 : 1;
    int _1019 = _983 * _1005;
    int _1021 = _1019 + _1003;
    bool _1023 = _154 > 0.5;
    bool _1025 = _1023 && _879;
    float _1027 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1013);
    int _1029 = abs(_1017);
    int _1031 = _1009 * _1011;
    int _1033 = _1031 + _1021;
    float _1035 = fma(_426, (*spvDescriptorSet0.vp_c10)._m0[5].z, _782);
    float _1037 = fma(_426, (*spvDescriptorSet0.vp_c10)._m0[6].z, _921);
    float _1039 = _923 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1041 = _959 * _1029;
    int _1043 = _1041 + _1033;
    float _1045 = _1035 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1047 = _1037 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1049 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1051 = _1039 + _1049;
    float _1053 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1055 = _1045 + _1053;
    float _1057 = float(uint(_1043));
    float _1059 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1061 = _1047 + _1059;
    float _1063 = _1055 * _1055;
    float _1065 = as_type<float>(_748) * _1057;
    float _1067 = _692 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1069 = fma(_1051, _1051, _1063);
    float _1071 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1073 = trunc(_1065);
    float _1075 = precise::max(_1073, 0.0);
    uint _1077 = uint(_1075);
    float _1079 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1081 = _1079 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1083 = fma(_1061, _1061, _1069);
    float _1085 = fma(_1067, -2.0, _1071);
    float _1087 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1085);
    float _1089 = sqrt(_1083);
    float _1091 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1093 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1095 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1097 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1099 = _1091 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1101 = _1095 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1103 = _738 * int(_1077);
    int _1105 = _1103 + _1043;
    float _1107 = rsqrt(_1083);
    float _1109 = _1097 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1111 = float(uint(_1105));
    float _1113 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[78].w, _718);
    float _1115 = fma(_841, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _1117 = _1089 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1119 = 1.0 / _1081;
    float _1121 = as_type<float>(_748) * _1111;
    float _1123 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1113);
    float _1125 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1127 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1125;
    float _1129 = precise::min(_710, _1117);
    float _1131 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1133 = _1131 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    out.m_63.x = _1101;
    out.m_63.y = _1109;
    out.m_63.z = _1099;
    out.m_63.w = _1093;
    float _1135 = trunc(_1121);
    float _1137 = precise::max(_1135, 0.0);
    uint _1139 = uint(_1137);
    float _1141 = _1107 * _1129;
    float _1143 = _1133 * _732;
    float _1145 = _1127 * _1119;
    float _1147 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1149 = _682 + _1147;
    float _1151 = -_1087;
    float _1153 = fma(_1123, _1115, _1151);
    float _1155 = float(uint(_1009));
    float _1157 = in.m_57.x;
    float _1159 = _1055 * _1141;
    int _1161 = int(_1077) + int(_1139);
    float _1163 = _1051 * _1141;
    float _1165 = as_type<float>(_748) * _1155;
    float _1167 = -_1159;
    float _1169 = _1055 + _1167;
    float _1171 = fma(_1145, _1149, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    int _1173 = ~_702;
    int _1175 = _1173 + 1;
    float _1177 = -_1163;
    float _1179 = _1051 + _1177;
    float _1181 = _1169 * _1169;
    float _1183 = _1061 * _1141;
    float _1185 = trunc(_1165);
    float _1187 = precise::max(_1185, 0.0);
    uint _1189 = uint(_1187);
    float _1191 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1193 = _682 + _1191;
    float _1195 = fma(_1179, _1179, _1181);
    float _1197 = -_1183;
    float _1199 = _1061 + _1197;
    int _1201 = _1175 * _1161;
    int _1203 = _1201 + _1043;
    bool _1205 = _682 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1207 = isnan(_682);
    bool _1209 = _1205 || _1207;
    bool _1211 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1213 = _1209 || _1211;
    float _1215 = float(_1213);
    float _1217 = fma(_1143, _1193, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1219 = fma(_1199, _1199, _1195);
    int _1221 = ~_702;
    int _1223 = _1221 + 1;
    bool _1225 = _682 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1227 = isnan(_682);
    bool _1229 = _1225 || _1227;
    bool _1231 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1233 = _1229 || _1231;
    float _1235 = float(_1233);
    float _1237 = -_1215;
    float _1239 = _1237 + 1.0;
    bool _1241 = uint(_1203) >= uint(_702);
    float _1243 = _1235 * _1239;
    float _1245 = as_type<float>(_1223);
    float _1247 = _1157;
    if (_879)
    {
        _1245 = _1157;
    }
    float _1249 = _1245;
    float _1251 = -_1235;
    float _1253 = _1251 + 1.0;
    bool _1255 = !_1241;
    int _1257 = _1255 ? 0 : (-1);
    int _1259 = _1223 * int(_1189);
    int _1261 = _1259 + _1009;
    bool _1263 = _682 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1265 = isnan(_682);
    bool _1267 = _1263 || _1265;
    bool _1269 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1271 = _1267 || _1269;
    float _1273 = float(_1271);
    float _1275 = _1249;
    if (_1025)
    {
        float _1277 = -_1249;
        float _1279 = _1277 + 1.0;
        _1275 = _1279;
    }
    float _1281 = _1275;
    int _1283 = ~_1161;
    int _1285 = _1283 + _1257;
    int _1287 = _1285 + 1;
    float _1289 = float(uint(_1261));
    float _1291 = sqrt(_1219);
    if (_879)
    {
        _1247 = _1281;
    }
    float _1293 = _1247;
    int _1295 = _702 * _1287;
    int _1297 = _1295 + _1043;
    float _1299 = _1273 * _1253;
    float _1301 = as_type<float>(_748) * _1289;
    float _1303 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1027);
    float _1305 = fma(_1293, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    bool _1307 = !_955;
    int _1309 = _1307 ? _1297 : (-1);
    float _1311 = _1171 * _1299;
    float _1313 = -_1273;
    float _1315 = _1313 + 1.0;
    float _1317 = fma(_1303, _1305, _997);
    int _1319 = _1309 >> 31;
    float _1321 = _937 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1323 = fma(_1315, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1311);
    float _1325 = _937 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1327 = _937 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1329 = _1319 & 3;
    float _1331 = trunc(_1301);
    float _1333 = precise::max(_1331, 0.0);
    uint _1335 = uint(_1333);
    float _1337 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1321);
    float _1339 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1325);
    float _1341 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1327);
    float _1343 = _1107 * _1291;
    int _1345 = _1309 + _1329;
    float _1347 = fma(_1217, _1243, _1323);
    int _1349 = _1309 & 3;
    bool _1351 = _1349 != 0;
    float _1353 = _708 * _1343;
    int _1355 = _1345 >> 2;
    float _1357 = _706 * _1343;
    float _1359 = _722 * _1343;
    float _1361 = _1353 * _907;
    int _1363 = _1355 << 4;
    int _1365 = _1363 + 368;
    float _1367 = _1357 * _917;
    float _1369 = _1359 * _919;
    float _1371 = _1361 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    uint _1373 = uint(int(uint(_1365) >> uint(2)));
    uint _1375 = uint(int(uint(int(_1373)) >> uint(2)));
    int _1377 = int(_1373) & 3;
    float _1379 = (*spvDescriptorSet0.vp_c9)._m0[int(_1375)][_1377];
    int _1381 = int(_1373) + 1;
    uint _1383 = uint(int(uint(_1381) >> uint(2)));
    int _1385 = _1381 & 3;
    float _1387 = (*spvDescriptorSet0.vp_c9)._m0[int(_1383)][_1385];
    int _1389 = int(_1189) + int(_1335);
    float _1391 = _1361 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1393 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1371);
    int _1395 = ~_702;
    int _1397 = _1395 + 1;
    float _1399 = fma(_1215, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1347);
    float _1401 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1391);
    float _1403 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1393);
    int _1405 = _1365 + 8;
    uint _1407 = uint(int(uint(_1405) >> uint(2)));
    uint _1409 = uint(int(uint(int(_1407)) >> uint(2)));
    int _1411 = int(_1407) & 3;
    float _1413 = (*spvDescriptorSet0.vp_c9)._m0[int(_1409)][_1411];
    int _1415 = int(_1407) + 1;
    uint _1417 = uint(int(uint(_1415) >> uint(2)));
    int _1419 = _1415 & 3;
    float _1421 = (*spvDescriptorSet0.vp_c9)._m0[int(_1417)][_1419];
    bool _1423 = uint(_1349) > 1u;
    float _1425 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1401);
    float _1427 = _1403 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _1429 = _1309 & 3;
    bool _1431 = _1429 != 0;
    int _1433 = _1397 * _1389;
    int _1435 = _1433 + _1009;
    float _1437 = _1425 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1439 = _1047 + _1427;
    int _1441 = _1431 ? 0 : 1;
    float _1443 = _1361 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _1445 = uint(_1435) >= uint(_702);
    float _1447 = _1039 + _1437;
    float _1449 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1451 = _1439 + _1449;
    int _1453 = ~_1441;
    int _1455 = _1453 + 1;
    int _1457 = _1455 + 1;
    float _1459 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1443);
    int _1461 = _1457;
    if (!_1423)
    {
        int _1463 = ~_1441;
        int _1465 = _1463 + 1;
        _1461 = _1465;
    }
    int _1467 = _1461;
    float _1469 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1471 = _1447 + _1469;
    float _1473 = _1451 * _1451;
    bool _1475 = _1349 != 3;
    int _1477 = abs(_1467);
    float _1479 = fma(_1471, _1471, _1473);
    bool _1481 = !_1445;
    int _1483 = _1481 ? 0 : (-1);
    bool _1485 = uint(_1349) >= 2u;
    float _1487 = sqrt(_1479);
    bool _1489 = !_1351;
    int _1491 = _1489 ? 0 : 1;
    int _1493 = _1485 ? 0 : 1;
    bool _1495 = _1349 != 3;
    int _1497 = ~_1493;
    int _1499 = _1497 + 1;
    int _1501 = _1499 + 1;
    int _1503 = abs(_1491);
    int _1505 = _1501;
    if (_1475)
    {
        int _1507 = ~_1493;
        int _1509 = _1507 + 1;
        _1505 = _1509;
    }
    int _1511 = _1505;
    int _1513 = ~_1477;
    int _1515 = _1513 + 1;
    int _1517 = _1515 + 1;
    float _1519 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1459);
    bool _1521 = !_1495;
    int _1523 = _1521 ? 0 : (-1);
    int _1525 = abs(_1511);
    int _1527 = _1517 * as_type<int>(_1387);
    int _1529 = ~_1503;
    int _1531 = _1529 + 1;
    int _1533 = _1531 + 1;
    float _1535 = _1519 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _1537 = _1487 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1539 = !_801;
    int _1541 = _1539 ? 0 : 1;
    int _1543 = _1533 * as_type<int>(_1379);
    int _1545 = _1543 + _1527;
    int _1547 = ~_1525;
    int _1549 = _1547 + 1;
    int _1551 = _1549 + 1;
    int _1553 = abs(_1523);
    int _1555 = abs(_1541);
    int _1557 = _1551 * as_type<int>(_1413);
    int _1559 = _1557 + _1545;
    int _1561 = ~_1389;
    int _1563 = _1561 + _1483;
    int _1565 = _1563 + 1;
    float _1567 = _1045 + _1535;
    int _1569 = ~_1553;
    int _1571 = _1569 + 1;
    int _1573 = _1571 + 1;
    int _1575 = _702 * _1565;
    int _1577 = _1575 + _1009;
    float _1579 = as_type<float>(_1527);
    float _1581 = as_type<float>(_1573);
    float _1583 = as_type<float>(_1565);
    if (!_1537)
    {
        _1579 = _1447;
    }
    float _1585 = _1579;
    int _1587 = _1573 * as_type<int>(_1421);
    int _1589 = _1587 + _1559;
    int _1591 = ~_1555;
    int _1593 = _1591 + 1;
    int _1595 = _1593 + 1;
    float _1597 = _1585;
    if (!_1537)
    {
        _1581 = _1439;
    }
    float _1599 = _1581;
    float _1601 = _1599;
    if (!_1537)
    {
        _1583 = _1567;
    }
    float _1603 = _1583;
    bool _1605 = !_1537;
    float _1607 = _1603;
    if (!_1605)
    {
        float _1609 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1611 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1613 = _1487 + _1611;
        float _1615 = _1567 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1617 = rsqrt(_1479);
        float _1619 = _1613 * _1609;
        float _1621 = _1619 * 0.15915493667125701904296875;
        float _1623 = _1621 * 6.283185482025146484375;
        float _1625 = cos(_1623);
        float _1627 = _1621 * 6.283185482025146484375;
        float _1629 = sin(_1627);
        float _1631 = _1625 + (-1.0);
        float _1633 = fma(_1629, _1615, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1635 = _1631 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1637 = _1617 * _1633;
        float _1639 = fma(_1567, _1625, _1635);
        float _1641 = fma(_1471, _1637, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1643 = fma(_1451, _1637, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1607 = _1639;
        _1597 = _1641;
        _1601 = _1643;
    }
    float _1645 = _1607;
    float _1647 = _1597;
    float _1649 = _1601;
    float _1651 = -_1045;
    float _1653 = _1651 + _1645;
    float _1655 = -_1039;
    float _1657 = _1655 + _1647;
    float _1659 = -_1047;
    float _1661 = _1659 + _1649;
    int _1663 = _1589 * _1595;
    float _1665 = _1653 * _1653;
    bool _1667 = !_955;
    int _1669 = _1667 ? _1577 : (-1);
    out.m_65.w = _1129;
    float _1671 = fma(_1657, _1657, _1665);
    int _1673 = _1669 * _1555;
    int _1675 = _1673 + _1663;
    float _1677 = fma(_1661, _1661, _1671);
    float _1679 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1681 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1683 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1337);
    float _1685 = sqrt(_1677);
    float _1687 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1689 = _1153 + 0.5;
    float _1691 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1339);
    float _1693 = _1679 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1695 = _1681 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1697 = _1687 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1699 = _1317 + 0.5;
    float _1701 = _1399 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1703 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1341);
    float _1705 = float(_1675);
    out.m_67.x = _1357;
    float _1707 = -_1163;
    float _1709 = _1707 + _1647;
    float _1711 = -_1163;
    float _1713 = _1039 + _1711;
    out.m_69.x = _1699;
    out.m_69.y = _1689;
    bool _1715 = _1685 > 0.0;
    float _1717 = -_1159;
    float _1719 = _1717 + _1645;
    float _1721 = -_1183;
    float _1723 = _1721 + _1649;
    out.m_71.x = _1693;
    out.m_71.y = _1695;
    out.m_71.z = _1697;
    out.m_71.w = _1701;
    float _1725 = -_1159;
    float _1727 = _1045 + _1725;
    float _1729 = -_1183;
    float _1731 = _1047 + _1729;
    out.m_73.x = _1705;
    out.m_75.x = _1683;
    out.m_75.y = _1691;
    out.m_75.z = _1703;
    bool _1733 = !_1715;
    float _1735 = _1697;
    float _1737 = _1693;
    float _1739 = _1695;
    float _1741 = _1709;
    float _1743 = _1723;
    float _1745 = _1719;
    float _1747 = _1699;
    float _1749 = _1713;
    if (!_1733)
    {
        bool _1751 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1753 = _1159;
        if (_1751)
        {
            float _1755 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1753 = _1755;
        }
        float _1757 = _1753;
        if (_1751)
        {
            float _1759 = _516 * _1757;
            _1735 = _1759;
        }
        float _1761 = _1735;
        float _1763 = _1761;
        if (_1751)
        {
            float _1765 = _518 * _1757;
            _1737 = _1765;
        }
        float _1767 = _1737;
        float _1769 = _1767;
        if (_1751)
        {
            float _1771 = _520 * _1757;
            _1739 = _1771;
        }
        float _1773 = _1739;
        float _1775 = _1773;
        if (!_1751)
        {
            float _1777 = _110 + 1.0;
            if (!_170)
            {
                float _1779 = _1777 * _1777;
                float _1781 = _1779 * 0.5;
                _530 = _1781;
            }
            float _1783 = _530;
            float _1785 = _1783;
            if (!_170)
            {
                float _1787 = _1783 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1785 = _1787;
            }
            float _1789 = _1785;
            bool _1791 = !_170;
            float _1793 = _1789;
            if (!_1791)
            {
                float _1795 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1797 = log2(_1795);
                float _1799 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1801 = _1799 + 1.0;
                float _1803 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1805 = _1797 * _1777;
                float _1807 = 1.0 / _1801;
                float _1809 = _1803 * 0.693147182464599609375;
                float _1811 = exp2(_1805);
                float _1813 = 1.0 / _1809;
                float _1815 = _1811 + (-1.0);
                float _1817 = -_1815;
                float _1819 = fma(_1817, _1813, _1777);
                float _1821 = _1819 * _1807;
                float _1823 = _1821 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1793 = _1823;
            }
            float _1825 = _1793;
            float _1827 = _1825 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _1829 = _1825 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1831 = _1825 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1833 = _1827 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _1835 = _1827 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _1837 = _1827 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _1839 = fma(_1829, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1833);
            float _1841 = fma(_1829, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1835);
            float _1843 = _1835;
            if (!_170)
            {
                _1843 = _1777;
            }
            float _1845 = _1843;
            float _1847 = fma(_1831, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1839);
            bool _1849 = !_170;
            float _1851 = _1845;
            if (!_1849)
            {
                float _1853 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1855 = log2(_1853);
                float _1857 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1859 = _1857 + 1.0;
                float _1861 = 1.0 / _1859;
                float _1863 = _1855 * _1777;
                float _1865 = exp2(_1863);
                float _1867 = -_1865;
                float _1869 = _1867 + 1.0;
                float _1871 = _1869 * _1861;
                _1851 = _1871;
            }
            float _1873 = _1851;
            float _1875 = fma(_1829, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1837);
            float _1877 = fma(_1831, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1841);
            float _1879 = fma(_1873, _198, _1847);
            float _1881 = fma(_1831, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1875);
            float _1883 = fma(_1873, _196, _1877);
            float _1885 = -_466;
            float _1887 = _1885 + _1879;
            float _1889 = fma(_1873, _200, _1881);
            float _1891 = -_464;
            float _1893 = _1891 + _1883;
            float _1895 = _1887 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _1897 = _1887 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _1899 = _1887 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _1901 = -_480;
            float _1903 = _1901 + _1889;
            float _1905 = fma(_1893, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1895);
            float _1907 = fma(_1893, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1897);
            float _1909 = fma(_1893, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1899);
            float _1911 = fma(_1903, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1905);
            float _1913 = fma(_1903, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1907);
            float _1915 = fma(_1903, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1909);
            _532 = _1913;
            _534 = _1911;
            _536 = _1915;
            _1763 = _1911;
            _1769 = _1913;
            _1775 = _1915;
        }
        float _1917 = _532;
        float _1919 = _534;
        float _1921 = _536;
        float _1923 = _1763;
        float _1925 = _1769;
        float _1927 = _1775;
        float _1929 = _1917 * _1917;
        float _1931 = rsqrt(_1677);
        float _1933 = fma(_1919, _1919, _1929);
        float _1935 = fma(_1921, _1921, _1933);
        float _1937 = sqrt(_1935);
        float _1939 = _1657 * _1931;
        float _1941 = _1653 * _1931;
        float _1943 = _1661 * _1931;
        bool _1945 = _1937 > 0.0;
        bool _1947 = !_1945;
        _538 = _1943;
        _540 = _1919;
        _542 = _1935;
        _544 = _1921;
        if (!_1947)
        {
            float _1949 = rsqrt(_1935);
            float _1951 = _1949 * _1917;
            float _1953 = _1949 * _1919;
            float _1955 = _1949 * _1921;
            float _1957 = _1941 * _1951;
            float _1959 = fma(_1939, _1953, _1957);
            float _1961 = fma(_1943, _1955, _1959);
            float _1963 = _1961 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1965 = fma(_1923, _1963, _1709);
            float _1967 = fma(_1925, _1963, _1719);
            float _1969 = fma(_1927, _1963, _1723);
            _1741 = _1965;
            _1743 = _1969;
            _1745 = _1967;
        }
    }
    float _1971 = _1741;
    float _1973 = _1743;
    float _1975 = _1745;
    float _1977 = _538;
    float _1979 = _540;
    float _1981 = _542;
    float _1983 = _544;
    float _1985 = _1727 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1987 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1989 = isnan(0.5);
    bool _1991 = _1987 || _1989;
    bool _1993 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1995 = _1991 || _1993;
    float _1997 = fma(_1713, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1985);
    bool _1999 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2001 = isnan(0.5);
    bool _2003 = _1999 || _2001;
    bool _2005 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2007 = _2003 || _2005;
    float _2009 = fma(_1731, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1997);
    float _2011 = _1727 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2013 = _2009 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2015 = fma(_1713, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2011);
    float _2017 = 1.0 / _2013;
    float _2019 = fma(_1731, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2015);
    float _2021 = _1983;
    float _2023 = _2013;
    float _2025 = _1979;
    float _2027 = _1977;
    if (_2007)
    {
        _2021 = 1.0;
    }
    float _2029 = _2021;
    float _2031 = _2019 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2033 = _2031 + _2013;
    float _2035 = _2029;
    if (_1995)
    {
        _2023 = _1971;
    }
    float _2037 = _2023;
    float _2039 = _2033 * _2017;
    float _2041 = _2039 * 0.5;
    float _2043 = _2017;
    float _2045 = _2041;
    float _2047 = _2037;
    if (_1995)
    {
        _2043 = _1973;
    }
    float _2049 = _2043;
    float _2051 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2053 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2051);
    float _2055 = _2049;
    if (_1995)
    {
        _2045 = _1975;
    }
    float _2057 = _2045;
    float _2059 = 1.0 / _2053;
    float _2061 = _2057;
    if (!_1995)
    {
        float _2063 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2065 = _1727 + _2063;
        float _2067 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2069 = _1713 + _2067;
        float _2071 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2073 = -_1713;
        float _2075 = _2073 + _1971;
        float _2077 = _2065 * _2065;
        float _2079 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2081 = _1731 + _2079;
        float _2083 = fma(_2069, _2069, _2077);
        float _2085 = -_1731;
        float _2087 = _2085 + _1973;
        float _2089 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2091 = fma(_2081, _2081, _2083);
        float _2093 = sqrt(_2091);
        float _2095 = _2071 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2097 = -_1727;
        float _2099 = _2097 + _1975;
        float _2101 = precise::min(_2093, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2103 = _2101 * _2089;
        float _2105 = _2095 * _2103;
        float _2107 = fma(_2075, _2105, _1713);
        float _2109 = fma(_2099, _2105, _1727);
        float _2111 = fma(_2087, _2105, _1731);
        _2061 = _2109;
        _2047 = _2107;
        _2055 = _2111;
    }
    float _2113 = _2061;
    float _2115 = _2047;
    float _2117 = _2055;
    if (_2007)
    {
        _2025 = 1.0;
    }
    float _2119 = _2025;
    float _2121 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2123 = _2059 * _2121;
    float _2125 = _2119;
    if (!_2007)
    {
        float _2127 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2129 = _2127 * 0.15915493667125701904296875;
        float _2131 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2133 = _2129 * 6.283185482025146484375;
        float _2135 = cos(_2133);
        float _2137 = _2131 * 0.15915493667125701904296875;
        float _2139 = _2129 * 6.283185482025146484375;
        float _2141 = sin(_2139);
        float _2143 = 1.0 / _2135;
        float _2145 = _2137 * 6.283185482025146484375;
        float _2147 = cos(_2145);
        float _2149 = _2141 * _2143;
        float _2151 = _2137 * 6.283185482025146484375;
        float _2153 = sin(_2151);
        float _2155 = _2147 * _2149;
        float _2157 = 1.0 / _2155;
        float _2159 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2161 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2159;
        float _2163 = 1.0 / _2161;
        float _2165 = _2153 * _2157;
        float _2167 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2169 = fma(_2123, _2165, _2167);
        float _2171 = _2169 * _2163;
        float _2173 = precise::clamp(_2171, 0.0, 1.0);
        _2027 = _2163;
        _2035 = _2173;
    }
    float _2175 = _2027;
    float _2177 = _2035;
    float _2179 = _2175;
    if (!_2007)
    {
        float _2181 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2183 = _2181 * 0.15915493667125701904296875;
        float _2185 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2187 = _2183 * 6.283185482025146484375;
        float _2189 = cos(_2187);
        float _2191 = _2185 * 0.15915493667125701904296875;
        float _2193 = _2183 * 6.283185482025146484375;
        float _2195 = sin(_2193);
        float _2197 = 1.0 / _2189;
        float _2199 = _2191 * 6.283185482025146484375;
        float _2201 = cos(_2199);
        float _2203 = _2195 * _2197;
        float _2205 = _2191 * 6.283185482025146484375;
        float _2207 = sin(_2205);
        float _2209 = _2201 * _2203;
        float _2211 = 1.0 / _2209;
        float _2213 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2215 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2213;
        float _2217 = 1.0 / _2215;
        float _2219 = _2207 * _2211;
        float _2221 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2223 = fma(_2123, _2219, _2221);
        float _2225 = _2223 * _2217;
        float _2227 = precise::clamp(_2225, 0.0, 1.0);
        float _2229 = -_2227;
        float _2231 = _2229 + 1.0;
        _2179 = _2209;
        _2125 = _2231;
    }
    float _2233 = _2179;
    float _2235 = _2125;
    float _2237 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2239 = _2113 + _2237;
    float _2241 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2243 = _2115 + _2241;
    float _2245 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2247 = _2117 + _2245;
    float _2249 = _2239 * _2239;
    float _2251 = fma(_2243, _2243, _2249);
    float _2253 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2255 = fma(_2247, _2247, _2251);
    float _2257 = rsqrt(_2255);
    float _2259 = sqrt(_2255);
    float _2261 = _2257 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2263 = _2243 * _2261;
    float _2265 = _2247 * _2261;
    float _2267 = _2263 * _2263;
    float _2269 = _2265 * _2265;
    float _2271 = _2267 + _2269;
    float _2273 = sqrt(_2271);
    bool _2275 = _2273 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2277 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2279 = _2273 + _2277;
    float _2281 = _1981;
    float _2283 = _2233;
    float _2285 = _2279;
    float _2287 = _2239;
    float _2289 = _2263;
    if (_2275)
    {
        float _2291 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2281 = _2291;
    }
    float _2293 = _2281;
    if (_2275)
    {
        float _2295 = rsqrt(_2271);
        _2283 = _2295;
    }
    float _2297 = _2283;
    float _2299 = _2297;
    if (_2275)
    {
        float _2301 = _2279 * _2293;
        _2285 = _2301;
    }
    float _2303 = _2285;
    if (_2275)
    {
        float _2305 = _2303 * 0.15915493667125701904296875;
        _546 = _2305;
    }
    float _2307 = _546;
    float _2309 = _2247;
    if (_2275)
    {
        float _2311 = _2307 * 6.283185482025146484375;
        float _2313 = sin(_2311);
        _2309 = _2313;
    }
    float _2315 = _2309;
    float _2317 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2319 = precise::max(0.0, _2317);
    float _2321 = _2293;
    float _2323 = _2319;
    if (_2275)
    {
        float _2325 = _2307 * 6.283185482025146484375;
        float _2327 = cos(_2325);
        _2321 = _2327;
    }
    float _2329 = _2321;
    float _2331 = -_2261;
    float _2333 = -_2319;
    float _2335 = fma(_2239, _2331, _2333);
    if (_2275)
    {
        float _2337 = _2335 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2287 = _2337;
    }
    float _2339 = _2287;
    float _2341 = _2113 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2343 = _2339;
    float _2345 = _2315;
    if (_2275)
    {
        float _2347 = fma(_2315, _2339, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2343 = _2347;
    }
    float _2349 = _2343;
    float _2351 = _2349;
    if (!_2275)
    {
        _2345 = _2267;
    }
    float _2353 = _2345;
    float _2355 = fma(_2115, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2341);
    float _2357 = _2353;
    float _2359 = _2329;
    if (_2275)
    {
        float _2361 = _2329 + (-1.0);
        _2323 = _2361;
    }
    float _2363 = _2323;
    float _2365 = _2363;
    if (_2275)
    {
        float _2367 = _2297 * _2349;
        _1747 = _2367;
    }
    float _2369 = _1747;
    if (!_2275)
    {
        _2351 = _2335;
    }
    float _2371 = _2351;
    float _2373 = _2371;
    if (_2275)
    {
        float _2375 = _2363 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2299 = _2375;
    }
    float _2377 = _2299;
    if (_2275)
    {
        float _2379 = _2263 * _2369;
        _2289 = _2379;
    }
    float _2381 = _2289;
    if (!_2275)
    {
        _2365 = _2265;
    }
    float _2383 = _2365;
    float _2385 = _2383;
    if (_2275)
    {
        float _2387 = _2265 * _2369;
        _2385 = _2387;
    }
    float _2389 = _2385;
    if (_2275)
    {
        float _2391 = fma(_2335, _2329, _2377);
        _2373 = _2391;
    }
    float _2393 = _2373;
    if (_2275)
    {
        float _2395 = _2381 * _2381;
        _2357 = _2395;
    }
    float _2397 = _2357;
    if (!_2275)
    {
        _2359 = _2269;
    }
    float _2399 = _2359;
    float _2401 = _2399;
    if (_2275)
    {
        float _2403 = _2389 * _2389;
        _2401 = _2403;
    }
    float _2405 = _2401;
    float _2407 = fma(_2393, _2393, _2397);
    float _2409 = _2113 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2411 = _2407 + _2405;
    float _2413 = _2113 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2415 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2417 = fma(_2259, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2415);
    float _2419 = precise::clamp(_2417, 0.0, 1.0);
    float _2421 = fma(_2117, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2355);
    float _2423 = rsqrt(_2411);
    float _2425 = _2113 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2427 = fma(_2115, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2413);
    float _2429 = -_2419;
    float _2431 = _2429 + 1.0;
    float _2433 = _2421 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2435 = fma(_2115, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2425);
    float _2437 = fma(_2115, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2409);
    float _2439 = abs(_2431);
    float _2441 = log2(_2439);
    float _2443 = fma(_2117, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2427);
    float _2445 = _2433 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2447 = fma(_2117, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2435);
    float _2449 = fma(_2117, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2437);
    float _2451 = _2443 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2453 = -_2445;
    float _2455 = fma(_2453, _2253, 1.0);
    float _2457 = _2447 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2459 = _2423 * _2381;
    float _2461 = _2451 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2463 = _2449 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2465 = _2423 * _2393;
    float _2467 = _2459 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2469 = fma(_2457, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2461);
    float _2471 = _2423 * _2389;
    float _2473 = log2(_2455);
    float _2475 = -_2467;
    float _2477 = fma(_2465, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2475);
    float _2479 = fma(_2433, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2469);
    float _2481 = _2441 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2483 = _2451 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2485 = -_2471;
    float _2487 = fma(_2485, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2477);
    float _2489 = fma(_2463, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2479);
    float _2491 = _2451 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2493 = fma(_2457, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2483);
    float _2495 = fma(_2487, -0.5, 0.5);
    float _2497 = exp2(_2481);
    float _2499 = fma(_2457, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2491);
    float _2501 = fma(_2487, 0.5, 0.5);
    float _2503 = fma(_2433, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2493);
    float _2505 = _2465 + 1.0;
    float _2507 = fma(_2433, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2499);
    float _2509 = fma(_2501, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2511 = fma(_2463, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2503);
    float _2513 = 1.0 / _2489;
    float _2515 = fma(_2463, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2507);
    float _2517 = fma(_2501, _2509, -0.212114393711090087890625);
    float _2519 = _2473 * 0.693147182464599609375;
    float _2521 = fma(_2501, _2517, 1.570728778839111328125);
    float _2523 = _2519 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2525 = sqrt(_2495);
    float _2527 = -_2465;
    float _2529 = fma(_2497, _2505, _2527);
    float _2531 = _2515 * _2513;
    float _2533 = _2511 * _2513;
    float _2535 = fma(_2529, 0.5, 0.5);
    float _2537 = fma(_2531, 0.5, 0.5);
    float _2539 = fma(_2533, -0.5, 0.5);
    float _2541 = _2525 * 0.636619746685028076171875;
    float3 _6803 = float3(_2537, _2539, _2523);
    float _2543 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6803, float3(0.0), isnan(_6803)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6803, float3(0.0), isnan(_6803)), level(0.0)).x;
    float _2545 = -_2521;
    float _2547 = fma(_2541, _2545, 1.0);
    float3 _6819 = float3(_2537, _2539, _2523);
    float4 _2550 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6819, float3(0.0), isnan(_6819)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6819, float3(0.0), isnan(_6819)), level(0.0)).xyzw;
    float _2552 = _2550.x;
    float _2554 = _2550.y;
    float _2556 = _2550.z;
    float _2558 = _2550.w;
    float2 _6836 = float2(_2547, _2535);
    float3 _2562 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6836, float2(0.0), isnan(_6836)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6836, float2(0.0), isnan(_6836)), level(0.0)).xyz;
    float _2564 = _2562.x;
    float _2566 = _2562.y;
    float _2568 = _2562.z;
    float _2570 = _2441 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2572 = _2451 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2574 = _2489 * 0.5;
    float _2576 = _2515 + _2489;
    out.m_77.x = _2115;
    out.m_77.y = _2113;
    out.m_77.z = _2117;
    float _2578 = fma(_2457, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2572);
    float _2580 = exp2(_2570);
    float _2582 = _2576 * 0.5;
    bool _2584 = _2259 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2586 = isnan(_2259);
    bool _2588 = _2584 || _2586;
    bool _2590 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2592 = _2588 || _2590;
    float _2594 = fma(_2433, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2578);
    float _2596 = fma(_2511, -0.5, _2574);
    out.m_79.x = _1713;
    out.m_79.y = _1727;
    out.m_79.z = _1731;
    float _2598 = fma(_2463, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2594);
    float _2600 = _2598 + _2489;
    out.gl_Position.x = _2515;
    out.gl_Position.y = _2511;
    out.gl_Position.z = _2598;
    out.gl_Position.w = _2489;
    float _2602 = _2600 * 0.5;
    float _2604 = -_2580;
    float _2606 = _2604 + 1.0;
    float _2608 = _2489;
    float _2610 = _2598;
    float _2612 = _2511;
    if (!_2592)
    {
        _1749 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2614 = _1749;
    float _2616 = _2606 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_81.x = _2582;
    out.m_81.y = _2596;
    out.m_81.z = _2602;
    out.m_81.w = _2489;
    float _2618 = -_2616;
    float _2620 = _2618 + 1.0;
    float _2622 = _2177 * _2235;
    float _2624 = _2614;
    float _2626 = _2614;
    if (!_2592)
    {
        _2608 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2628 = _2608;
    float _2630 = _2628;
    float _2632 = _2628;
    if (!_2592)
    {
        _2610 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2634 = _2610;
    float _2636 = _2622 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2638 = _2636;
    float _2640 = _2634;
    float _2642 = _2634;
    if (!_2592)
    {
        _2612 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2644 = _2612;
    float _2646 = _524 * _2636;
    float _2648 = _2644;
    float _2650 = _2644;
    if (!_2592)
    {
        _2638 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2652 = _2638;
    float _2654 = _2652;
    float _2656 = _2652;
    if (!_2592)
    {
        _548 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2658 = _548;
    float _2660 = _2616 * _2543;
    float _2662 = _2558 * _2660;
    float _2664 = _2568 * _2660;
    float _2666 = fma(_2564, _2662, _2552);
    float _2668 = fma(_2566, _2662, _2554);
    float _2670 = _2558 * _2620;
    float _2672 = fma(_2558, _2664, _2556);
    out.m_83.x = _2666;
    out.m_83.y = _2668;
    out.m_83.z = _2672;
    out.m_83.w = _2670;
    bool _2674 = !_2592;
    float _2676 = _2658;
    float _2678 = _2658;
    if (!_2674)
    {
        bool _2680 = _2259 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2682 = isnan(_2259);
        bool _2684 = _2680 || _2682;
        bool _2686 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2688 = _2684 || _2686;
        if (!_2688)
        {
            float _2690 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2692 = _2259 + _2690;
            float _2694 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2696 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2694;
            float _2698 = 1.0 / _2696;
            float _2700 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2702 = _2700 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2704 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2706 = _2704 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2708 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2710 = _2708 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2712 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2714 = _2712 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2716 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2718 = _2716 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2720 = _2692 * _2698;
            float _2722 = precise::clamp(_2720, 0.0, 1.0);
            float _2724 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2726 = _2724 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2728 = fma(_2722, _2702, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2730 = fma(_2722, _2726, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2732 = fma(_2722, _2706, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2734 = fma(_2722, _2710, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2736 = fma(_2722, _2714, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2738 = fma(_2722, _2718, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2632 = _2730;
            _2656 = _2736;
            _2626 = _2728;
            _2650 = _2734;
            _2642 = _2732;
            _2678 = _2738;
            _2740 = true;
        }
        else
        {
            bool _2742 = _2259 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2744 = isnan(_2259);
            bool _2746 = _2742 || _2744;
            bool _2748 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2750 = _2746 || _2748;
            if (!_2750)
            {
                _2624 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2752 = _2624;
            _2626 = _2752;
            if (!_2750)
            {
                _2630 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2754 = _2630;
            _2632 = _2754;
            if (!_2750)
            {
                _2640 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2756 = _2640;
            _2642 = _2756;
            if (!_2750)
            {
                _2648 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2758 = _2648;
            _2650 = _2758;
            if (!_2750)
            {
                _2654 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2760 = _2654;
            _2656 = _2760;
            if (!_2750)
            {
                _2676 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2762 = _2676;
            bool _2764 = !_2750;
            _2678 = _2762;
            if (!_2764)
            {
                bool _2766 = _2259 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2768 = isnan(_2259);
                bool _2770 = _2766 || _2768;
                bool _2772 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2774 = _2770 || _2772;
                if (!_2774)
                {
                    float _2776 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2778 = _2259 + _2776;
                    float _2780 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2782 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2780;
                    float _2784 = 1.0 / _2782;
                    float _2786 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2788 = _2786 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2790 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2792 = _2790 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2794 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2796 = _2794 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2798 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2800 = _2798 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2802 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2804 = _2802 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2806 = _2778 * _2784;
                    float _2808 = precise::clamp(_2806, 0.0, 1.0);
                    float _2810 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2812 = _2810 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2814 = fma(_2808, _2788, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2816 = fma(_2808, _2812, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2818 = fma(_2808, _2792, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2820 = fma(_2808, _2796, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2822 = fma(_2808, _2800, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2824 = fma(_2808, _2804, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2632 = _2816;
                    _2656 = _2822;
                    _2626 = _2814;
                    _2650 = _2820;
                    _2642 = _2818;
                    _2678 = _2824;
                    _2740 = true;
                }
                else
                {
                    _2632 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2656 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2626 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2650 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2642 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2678 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2740 = false;
    float _2826 = _2632;
    float _2828 = _2656;
    float _2830 = _2626;
    float _2832 = _2650;
    float _2834 = _2642;
    float _2836 = _2678;
    float _2838 = fma(_1691, -0.5, 0.5);
    float _2840 = precise::clamp(_2838, 0.0, 1.0);
    float _2842 = -_2826;
    float _2844 = _2842 + _2828;
    float _2846 = _2646 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2848 = -_2830;
    float _2850 = _2848 + _2832;
    out.m_85.x = 0.0;
    float _2852 = fma(_2840, _2844, _2826);
    float _2854 = fma(_2840, _2850, _2830);
    out.m_51.x = _2846;
    float _2856 = -_2834;
    float _2858 = _2856 + _2836;
    float _2860 = _2852 * 0.586610972881317138671875;
    bool _2862 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2864 = fma(_2840, _2858, _2834);
    float _2866 = fma(_2854, 0.298911988735198974609375, _2860);
    bool _2868 = _2177 > 0.0;
    bool _2870 = isnan(_2177);
    bool _2872 = _2868 || _2870;
    bool _2874 = isnan(0.0);
    bool _2876 = _2872 || _2874;
    float _2878 = fma(_2864, 0.114477999508380889892578125, _2866);
    bool _2880 = _2235 <= 0.0;
    bool _2882 = !_2876;
    bool _2884 = _2880 || _2882;
    float _2886 = -_2878;
    float _2888 = _2854 + _2886;
    float _2890 = -_2878;
    float _2892 = _2852 + _2890;
    float _2894 = -_2878;
    float _2896 = _2864 + _2894;
    float _2898 = fma(_2888, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2878);
    float _2900 = fma(_2892, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2878);
    float _2902 = fma(_2896, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2878);
    bool _2904 = !_2862;
    if (!_2904)
    {
        float _2906 = -_2113;
        float _2908 = _2906 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2910 = -_2115;
        float _2912 = _2910 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2914 = -_2117;
        float _2916 = _2914 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2918 = _2908 * _2908;
        float _2920 = fma(_2912, _2912, _2918);
        float _2922 = fma(_2916, _2916, _2920);
        float _2924 = sqrt(_2922);
        float _2926 = rsqrt(_2922);
        float _2928 = -_2924;
        float _2930 = _2928 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2932 = _2930 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2934 = precise::clamp(_2932, 0.0, 1.0);
        float _2936 = _2912 * _2926;
        float _2938 = _2908 * _2926;
        float _2940 = abs(_2934);
        float _2942 = log2(_2940);
        float _2944 = _2916 * _2926;
        float _2946 = _2936 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2948 = _1691 * _2938;
        float _2950 = -_2938;
        float _2952 = -_2946;
        float _2954 = fma(_2950, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2952);
        float _2956 = fma(_1683, _2936, _2948);
        float _2958 = -_2944;
        float _2960 = fma(_2958, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2954);
        float _2962 = fma(_1703, _2944, _2956);
        float _2964 = precise::clamp(_2962, 0.0, 1.0);
        float _2966 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2968 = _2960 + _2966;
        float _2970 = _2942 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2972 = _2968 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2974 = precise::clamp(_2972, 0.0, 1.0);
        float _2976 = exp2(_2970);
        float _2978 = _2976 * _2974;
        float _2980 = _2964 * _2978;
        float _2982 = _2980 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2984 = _2980 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2986 = _2980 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_85.x = _2982;
        out.m_85.y = _2984;
        out.m_85.z = _2986;
    }
    out.m_65.x = _2898;
    out.m_65.y = _2900;
    out.m_65.z = _2902;
    if (!_2884)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_51.x = 0.0;
    float _2988 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2988;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

