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
    constant _16* vp_c10 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c7 [[id(4)]];
    texture3d<float> vp_t_tcb_32 [[id(5)]];
    sampler vp_t_tcb_32Smplr [[id(6)]];
    texture3d<float> vp_t_tcb_30 [[id(7)]];
    sampler vp_t_tcb_30Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_1C [[id(9)]];
    sampler vp_t_tcb_1CSmplr [[id(10)]];
    sampler vp_t_tcb_32Smplr_w [[id(11)]];
    sampler vp_t_tcb_30Smplr_w [[id(12)]];
    sampler vp_t_tcb_1CSmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_63 [[user(locn0)]];
    float4 m_73 [[user(locn1)]];
    float4 m_67 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_71 [[user(locn4)]];
    float4 m_75 [[user(locn5)]];
    float4 m_49 [[user(locn6)]];
    float4 m_53 [[user(locn7)]];
    float4 m_59 [[user(locn8)]];
    float4 m_69 [[user(locn9)]];
    float4 m_77 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_44 [[attribute(3)]];
    float4 m_61 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_55 [[attribute(9)]];
    float4 m_65 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _300 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _91 = in.m_42.w;
    float _93 = in.m_44.w;
    float _95 = trunc(_91);
    int _98 = int(_95);
    float _100 = -_93;
    float _102 = _100 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_47.y = _102;
    bool _106 = _98 >= 1;
    float _108 = 0.0;
    float _110 = as_type<float>(_98);
    if (!_106)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _108;
    if (!_106)
    {
        out.m_49.x = 0.0;
    }
    int _114 = 0;
    if (!_106)
    {
        float _116 = _112 * 5.0;
        _114 = as_type<int>(_116);
    }
    int _118 = _114;
    float _120 = as_type<float>(_118);
    if (!_106)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1824 = as_type<float>(_118);
        out.gl_Position.z = _1824;
    }
    if (!_106)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _122 = _93 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _124 = isnan(_93);
    bool _126 = _122 || _124;
    bool _128 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _130 = _126 || _128;
    float _132 = in.m_51.z;
    float _134 = float(_98);
    bool _136 = _102 >= _134;
    bool _138 = !_130;
    bool _140 = _136 || _138;
    if (_140)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _110;
    if (_140)
    {
        out.m_49.x = 0.0;
    }
    int _144 = 0;
    if (_140)
    {
        float _146 = _142 * 5.0;
        _144 = as_type<int>(_146);
    }
    int _148 = _144;
    out.m_53.z = _132;
    float _150 = _132;
    if (_140)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1884 = as_type<float>(_148);
        out.gl_Position.z = _1884;
    }
    if (_140)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _152 = in.m_55.y;
    float _154 = 1.0 / _134;
    float _156 = _102 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _158 = in.m_57.w;
    bool _160 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _162 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _164 = _160 || _162;
    bool _166 = isnan(1.0);
    bool _168 = _164 || _166;
    float _170 = in.m_44.x;
    float _172 = in.m_44.y;
    float _174 = in.m_44.z;
    float _176 = in.m_42.x;
    float _178 = in.m_42.y;
    float _180 = in.m_42.z;
    float _182 = _156;
    if (!_168)
    {
        float _184 = _156 * _156;
        float _186 = _184 * 0.5;
        _120 = _186;
    }
    float _188 = _120;
    float _190 = _188;
    if (!_168)
    {
        float _192 = _188 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _192;
    }
    float _194 = _190;
    out.m_59.y = _152;
    bool _196 = !_168;
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
    bool _232 = !_168;
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
    bool _256 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _258 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _260 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _262 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _264 = _102 * _154;
    float _266 = fma(_254, _170, _258);
    float _268 = fma(_254, _172, _260);
    float _270 = fma(_254, _174, _262);
    float _272 = fma(_266, _158, _176);
    float _274 = fma(_268, _158, _178);
    float _276 = fma(_270, _158, _180);
    bool _278 = !_256;
    float _280 = _264;
    float _298;
    if (!_278)
    {
        float _282 = in.m_51.x;
        float _284 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _286 = _282 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _288 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[11].x, _102);
        float _290 = _288 * _284;
        float _292 = floor(_290);
        float _294 = -_292;
        float _296 = _290 + _294;
        _298 = _296;
        _300 = true;
    }
    else
    {
        _298 = _264;
    }
    _300 = false;
    float _302 = _298;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _306 = _302 + _304;
    bool _308 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _310 = isnan(_302);
    bool _312 = _308 || _310;
    bool _314 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _316 = _312 || _314;
    float _318 = float(_316);
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _322 = _302 + _320;
    bool _324 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _326 = isnan(_302);
    bool _328 = _324 || _326;
    bool _330 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _332 = _328 || _330;
    float _334 = float(_332);
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _336;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _342 = _340 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _344 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _346 = isnan(_302);
    bool _348 = _344 || _346;
    bool _350 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _352 = _348 || _350;
    float _354 = float(_352);
    float _356 = -_318;
    float _358 = _356 + 1.0;
    float _360 = 1.0 / _342;
    float _362 = _354 * _358;
    float _364 = -_354;
    float _366 = _364 + 1.0;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _368;
    bool _372 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _374 = 1.0 / _338;
    float _376 = _334 * _366;
    float _378 = -_334;
    float _380 = _378 + 1.0;
    float _382 = _322 * _360;
    float _384 = _306 * _374;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _386;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _392 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _390;
    float _394 = fma(_370, _384, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _396 = fma(_388, _384, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _398 = fma(_392, _384, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _400 = in.m_57.x;
    float _402 = in.m_57.y;
    float _404 = in.m_57.z;
    float _406 = _394 * _376;
    float _408 = _396 * _376;
    float _410 = _398 * _376;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _418 = _416 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _422 = _420 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _424 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[107].x, _406);
    float _426 = fma(_414, _382, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _428 = fma(_418, _382, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _430 = fma(_422, _382, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _432 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[107].y, _408);
    float _434 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[107].z, _410);
    float _436 = fma(_426, _362, _424);
    float _438 = fma(_428, _362, _432);
    float _440 = fma(_430, _362, _434);
    float _442 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[109].x, _436);
    float _444 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[109].y, _438);
    float _446 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[109].z, _440);
    float _448 = _400 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _450 = _402 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _452 = _442 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _454 = _444 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _456 = _446 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _458 = _404 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _460 = _452 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _462 = _454 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _464 = _456 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _466 = !_372;
    if (!_466)
    {
        float _468 = in.m_51.x;
        float _470 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _472 = _468 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _474 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[11].z, _102);
        float _476 = _474 * _470;
        float _478 = floor(_476);
        float _480 = -_478;
        float _482 = _476 + _480;
        _280 = _482;
    }
    float _484 = _280;
    float _486 = in.m_51.x;
    float _488 = _274 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _490 = in.m_51.y;
    float _492 = (*spvDescriptorSet0.vp_c8)._m0[32].z * (*spvDescriptorSet0.vp_c8)._m0[32].z;
    float _494 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _496 = fma((*spvDescriptorSet0.vp_c8)._m0[32].x, (*spvDescriptorSet0.vp_c8)._m0[32].x, _492);
    float _498 = _274 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _500 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _494);
    float _502 = _274 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _504 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[4].x, _498);
    float _506 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _500);
    float _508 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[6].x, _502);
    float _510 = -_152;
    float _512 = fma(_510, 5.0, 5.0);
    float _514 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[4].z, _504);
    float _516 = 1.0 / _458;
    float _518 = -_152;
    float _520 = fma(_518, 4.0, 4.0);
    float _522 = fma(_102, 0.5299999713897705078125, _512);
    float _524 = _486 * 6.283185482025146484375;
    float _526 = _514 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _528 = fma(_102, 0.4199999868869781494140625, _520);
    float _530 = fma(_102, 0.12999999523162841796875, _524);
    float _532 = _490 * 6.283185482025146484375;
    float _534 = _528 + _524;
    float _536 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[6].z, _508);
    float _538 = _530 * 0.15915493667125701904296875;
    float _540 = fma(_102, 0.37000000476837158203125, _532);
    float _542 = _522 + _532;
    float _544 = _536 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _546 = -_526;
    float _548 = _546 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _550 = _540 * 0.15915493667125701904296875;
    float _552 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[5].x, _488);
    float _554 = _542 * 0.15915493667125701904296875;
    float _556 = -_544;
    float _558 = _556 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _560 = rsqrt(_506);
    float _562 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[5].z, _552);
    float _564 = _534 * 0.15915493667125701904296875;
    float _566 = -_152;
    float _568 = _566 + 1.0;
    float _570 = fma(_102, 0.7200000286102294921875, _532);
    float _572 = _562 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _574 = _458 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _576 = _564 * 6.283185482025146484375;
    float _578 = sin(_576);
    float _580 = -_572;
    float _582 = _580 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _584 = _570 * 0.15915493667125701904296875;
    float _586 = _582 * _582;
    float _588 = _554 * 6.283185482025146484375;
    float _590 = sin(_588);
    float _592 = fma(_548, _548, _586);
    float _594 = _560 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _596 = _560 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _598 = fma(_558, _558, _592);
    float _600 = _594 * _594;
    float _602 = _578 * 0.100000001490116119384765625;
    float _604 = rsqrt(_598);
    float _606 = fma(_596, _596, _600);
    float _608 = _568 * _602;
    float _610 = _568 * _590;
    float _612 = rsqrt(_606);
    float _614 = in.m_61.x;
    float _616 = in.m_61.y;
    float _618 = in.m_61.z;
    float _620 = fma(_610, 0.0500000007450580596923828125, _608);
    float _622 = _620 * 0.15915493667125701904296875;
    float _624 = _548 * _604;
    float _626 = _558 * _604;
    float _628 = _582 * _604;
    float _630 = 1.0 / _450;
    float _632 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _634 = _624 * _632;
    float _636 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _638 = _626 * _636;
    float _640 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _642 = _628 * _640;
    float _644 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _646 = -_634;
    float _648 = fma(_626, _644, _646);
    float _650 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _652 = -_638;
    float _654 = fma(_628, _650, _652);
    float _656 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _658 = -_642;
    float _660 = fma(_624, _656, _658);
    float _662 = _550 * 6.283185482025146484375;
    float _664 = sin(_662);
    float _666 = _648 * _648;
    float _668 = _594 * _612;
    float _670 = _596 * _612;
    float _672 = _450 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _674 = fma(_654, _654, _666);
    float _676 = _516 * _618;
    float _678 = fma(_610, 0.0199999995529651641845703125, _608);
    float _680 = rsqrt(_496);
    float _682 = fma(_660, _660, _674);
    float _684 = _630 * _616;
    float _686 = 1.0 / _448;
    float _688 = _664 * 0.1500000059604644775390625;
    float _690 = _622 * 6.283185482025146484375;
    float _692 = sin(_690);
    float _694 = _680 * (*spvDescriptorSet0.vp_c8)._m0[32].z;
    float _696 = _448 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _698 = _668 * _694;
    float _700 = _622 * 6.283185482025146484375;
    float _702 = cos(_700);
    float _704 = fma(_686, _614, _678);
    float _706 = _680 * (*spvDescriptorSet0.vp_c8)._m0[32].x;
    float _708 = fma(_670, _706, _698);
    float _710 = rsqrt(_682);
    float _712 = _684 * _692;
    float _714 = _708 * _708;
    float _716 = _538 * 6.283185482025146484375;
    float _718 = sin(_716);
    float _720 = _684 * _702;
    float _722 = -_712;
    float _724 = fma(_704, _702, _722);
    float _726 = fma(_704, _692, _720);
    float _728 = _584 * 6.283185482025146484375;
    float _730 = sin(_728);
    float _732 = _654 * _710;
    float _734 = _648 * _710;
    float _736 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _726);
    float _738 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _724);
    float _740 = _628 * _732;
    float _742 = _672 * _736;
    float _744 = fma(_718, 0.449999988079071044921875, _688);
    float _746 = _660 * _710;
    float _748 = -_740;
    float _750 = fma(_624, _734, _748);
    float _752 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _676);
    float _754 = _696 * _738;
    float _756 = _742 * _750;
    float _758 = _574 * _752;
    float _760 = fma(_730, 0.100000001490116119384765625, _744);
    float _762 = _626 * _734;
    float _764 = fma(_754, _746, _756);
    float _766 = fma(_714, -0.699999988079071044921875, 1.0);
    float _768 = _760 + 1.5;
    float _770 = -_762;
    float _772 = fma(_628, _746, _770);
    float _774 = fma(_758, _626, _764);
    float _776 = _766 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _778 = _624 * _746;
    float _780 = _742 * _772;
    float _782 = _568 * _568;
    float _784 = _544 + _774;
    float _786 = -_778;
    float _788 = fma(_626, _732, _786);
    float _790 = fma(_754, _732, _780);
    float _792 = _782 * _768;
    float _794 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _796 = _784 + _794;
    float _798 = _742 * _788;
    float _800 = fma(_758, _624, _790);
    float _802 = _776 * _792;
    float _804 = fma(_574, _796, _784);
    float _806 = fma(_754, _734, _798);
    float _808 = _526 + _800;
    float _810 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[32].z, _804);
    float _812 = fma(_758, _628, _806);
    float _814 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _816 = _808 + _814;
    float _818 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _820 = _810 + _818;
    float _822 = _572 + _812;
    float _824 = fma(_696, _816, _808);
    float _826 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[32].x, _824);
    float _828 = _820 * _820;
    float _830 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _832 = _826 + _830;
    float _834 = fma(_832, _832, _828);
    float _836 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _838 = _822 + _836;
    float _840 = sqrt(_834);
    float _842 = fma(_672, _838, _822);
    float _844 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[32].y, _842);
    bool _846 = _840 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _848 = _842;
    float _850 = _822;
    float _852 = _742;
    float _854 = _810;
    float _856 = _798;
    float _858 = _802;
    float _860 = _832;
    if (!_846)
    {
        _848 = _826;
    }
    float _862 = _848;
    float _864 = _862;
    if (!_846)
    {
        _850 = _810;
    }
    float _866 = _850;
    float _868 = _866;
    if (!_846)
    {
        _852 = _844;
    }
    float _870 = _852;
    bool _872 = !_846;
    float _874 = _870;
    if (!_872)
    {
        float _876 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _878 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _880 = _840 + _878;
        float _882 = rsqrt(_834);
        float _884 = _880 * _876;
        float _886 = _844 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _888 = _884 * 0.15915493667125701904296875;
        float _890 = _888 * 6.283185482025146484375;
        float _892 = cos(_890);
        float _894 = _888 * 6.283185482025146484375;
        float _896 = sin(_894);
        float _898 = _892 + (-1.0);
        float _900 = fma(_896, _886, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _902 = _898 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _904 = _882 * _900;
        float _906 = fma(_844, _892, _902);
        float _908 = fma(_832, _904, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _910 = fma(_820, _904, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _874 = _906;
        _864 = _908;
        _868 = _910;
    }
    float _912 = _874;
    float _914 = _864;
    float _916 = _868;
    float _918 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _920 = _912 + _918;
    float _922 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _924 = _914 + _922;
    float _926 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _928 = _916 + _926;
    float _930 = _920 * _920;
    float _932 = fma(_924, _924, _930);
    float _934 = fma(_928, _928, _932);
    float _936 = rsqrt(_934);
    float _938 = _936 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _940 = _924 * _938;
    float _942 = _928 * _938;
    float _944 = _940 * _940;
    float _946 = _942 * _942;
    float _948 = _944 + _946;
    float _950 = sqrt(_948);
    bool _952 = _950 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _954 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _956 = _950 + _954;
    float _958 = _936;
    float _960 = _948;
    float _962 = _956;
    float _964 = _920;
    if (_952)
    {
        float _966 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _958 = _966;
    }
    float _968 = _958;
    if (_952)
    {
        float _970 = rsqrt(_948);
        _960 = _970;
    }
    float _972 = _960;
    if (_952)
    {
        float _974 = _956 * _968;
        _962 = _974;
    }
    float _976 = _962;
    if (_952)
    {
        float _978 = _976 * 0.15915493667125701904296875;
        _854 = _978;
    }
    float _980 = _854;
    float _982 = _928;
    if (_952)
    {
        float _984 = _980 * 6.283185482025146484375;
        float _986 = sin(_984);
        _982 = _986;
    }
    float _988 = _982;
    float _990 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _992 = precise::max(0.0, _990);
    float _994 = _968;
    float _996 = _992;
    if (_952)
    {
        float _998 = _980 * 6.283185482025146484375;
        float _1000 = cos(_998);
        _994 = _1000;
    }
    float _1002 = _994;
    float _1004 = -_938;
    float _1006 = -_992;
    float _1008 = fma(_920, _1004, _1006);
    if (_952)
    {
        float _1010 = _1008 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _964 = _1010;
    }
    float _1012 = _964;
    float _1014 = _988;
    float _1016 = _1012;
    if (_952)
    {
        float _1018 = fma(_988, _1012, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _856 = _1018;
    }
    float _1020 = _856;
    float _1022 = _1020;
    if (!_952)
    {
        _1014 = _940;
    }
    float _1024 = _1014;
    float _1026 = _1024;
    if (!_952)
    {
        _1016 = _1008;
    }
    float _1028 = _1016;
    float _1030 = _1028;
    float _1032 = _1002;
    if (_952)
    {
        float _1034 = _1002 + (-1.0);
        _996 = _1034;
    }
    float _1036 = _996;
    float _1038 = _1036;
    if (_952)
    {
        float _1040 = _972 * _1020;
        _858 = _1040;
    }
    float _1042 = _858;
    if (!_952)
    {
        _1022 = _944;
    }
    float _1044 = _1022;
    float _1046 = sqrt(_934);
    float _1048 = _1044;
    if (_952)
    {
        float _1050 = _1036 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _860 = _1050;
    }
    float _1052 = _860;
    if (_952)
    {
        float _1054 = _940 * _1042;
        _1026 = _1054;
    }
    float _1056 = _1026;
    if (!_952)
    {
        _1038 = _942;
    }
    float _1058 = _1038;
    float _1060 = _1058;
    if (_952)
    {
        float _1062 = _942 * _1042;
        _1060 = _1062;
    }
    float _1064 = _1060;
    if (_952)
    {
        float _1066 = fma(_1008, _1002, _1052);
        _1030 = _1066;
    }
    float _1068 = _1030;
    if (_952)
    {
        float _1070 = _1056 * _1056;
        _1048 = _1070;
    }
    float _1072 = _1048;
    if (!_952)
    {
        _1032 = _946;
    }
    float _1074 = _1032;
    float _1076 = _1074;
    if (_952)
    {
        float _1078 = _1064 * _1064;
        _1076 = _1078;
    }
    float _1080 = _1076;
    float _1082 = fma(_1068, _1068, _1072);
    float _1084 = _912 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1086 = _1082 + _1080;
    float _1088 = _912 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1090 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1092 = fma(_1046, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1090);
    float _1094 = precise::clamp(_1092, 0.0, 1.0);
    float _1096 = _912 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1098 = rsqrt(_1086);
    float _1100 = fma(_914, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1088);
    float _1102 = -_1094;
    float _1104 = _1102 + 1.0;
    float _1106 = fma(_914, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1096);
    float _1108 = fma(_914, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1084);
    float _1110 = fma(_916, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1100);
    float _1112 = _912 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1114 = fma(_916, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1106);
    float _1116 = abs(_1104);
    float _1118 = log2(_1116);
    float _1120 = _1110 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1122 = fma(_914, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1112);
    float _1124 = _1114 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1126 = fma(_916, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1108);
    float _1128 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1130 = fma(_916, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1122);
    float _1132 = _1120 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1134 = _1098 * _1056;
    float _1136 = _1098 * _1068;
    float _1138 = _1130 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1140 = _1124 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1142 = _1134 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1144 = _1098 * _1064;
    float _1146 = _1126 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1148 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1140);
    float _1150 = -_1142;
    float _1152 = fma(_1136, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1150);
    float _1154 = _1118 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1156 = -_1132;
    float _1158 = fma(_1156, _1128, 1.0);
    float _1160 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1148);
    float _1162 = -_1144;
    float _1164 = fma(_1162, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1152);
    float _1166 = _1124 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1168 = log2(_1158);
    float _1170 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1160);
    float _1172 = fma(_1164, -0.5, 0.5);
    float _1174 = _1124 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1176 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1166);
    float _1178 = fma(_1164, 0.5, 0.5);
    float _1180 = _1136 + 1.0;
    float _1182 = exp2(_1154);
    float _1184 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1174);
    float _1186 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1176);
    float _1188 = fma(_1178, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1190 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1184);
    float _1192 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1186);
    float _1194 = fma(_1178, _1188, -0.212114393711090087890625);
    float _1196 = 1.0 / _1170;
    float _1198 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1190);
    float _1200 = _1168 * 0.693147182464599609375;
    float _1202 = fma(_1178, _1194, 1.570728778839111328125);
    float _1204 = _1200 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1206 = sqrt(_1172);
    float _1208 = -_1136;
    float _1210 = fma(_1182, _1180, _1208);
    float _1212 = fma(_1210, 0.5, 0.5);
    float _1214 = _1192 * _1196;
    float _1216 = _1198 * _1196;
    float _1218 = fma(_1214, 0.5, 0.5);
    float _1220 = fma(_1216, -0.5, 0.5);
    float _1222 = _1206 * 0.636619746685028076171875;
    float3 _3630 = float3(_1218, _1220, _1204);
    float _1224 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3630, float3(0.0), isnan(_3630)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3630, float3(0.0), isnan(_3630)), level(0.0)).x;
    float3 _3641 = float3(_1218, _1220, _1204);
    float4 _1227 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3641, float3(0.0), isnan(_3641)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3641, float3(0.0), isnan(_3641)), level(0.0)).xyzw;
    float _1229 = _1227.x;
    float _1231 = _1227.y;
    float _1233 = _1227.z;
    float _1235 = _1227.w;
    float _1237 = -_1202;
    float _1239 = fma(_1222, _1237, 1.0);
    float2 _3663 = float2(_1239, _1212);
    float3 _1243 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3663, float2(0.0), isnan(_3663)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3663, float2(0.0), isnan(_3663)), level(0.0)).xyz;
    float _1245 = _1243.x;
    float _1247 = _1243.y;
    float _1249 = _1243.z;
    float _1251 = in.m_51.w;
    float _1253 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    out.m_63.x = _460;
    out.m_63.y = _462;
    out.m_63.z = _464;
    int _1255 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1257 = _1255 != 0;
    float _1259 = _1118 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1261 = _132 > 0.5;
    float _1263 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1265 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1263;
    float _1267 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1269 = _1267 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1271 = in.m_65.w;
    bool _1273 = _490 > 0.5;
    float _1275 = 1.0 / _1265;
    float _1277 = in.m_55.x;
    int _1279 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1281 = _1279 != 0;
    float _1283 = _486 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1285 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1287 = _1285 != 0;
    float _1289 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1291 = _1261 ? as_type<int>(_568) : as_type<int>(_152);
    float _1293 = 1.0 / _1269;
    int _1295 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1297 = _1295 != 0;
    float _1299 = -_1289;
    float _1301 = fma(_1283, 2.0, _1299);
    bool _1303 = _1251 > 0.5;
    float _1305 = _490 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1307 = _1273 ? as_type<int>(_568) : as_type<int>(_152);
    float _1309 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1311 = _484 + _1309;
    float _1313 = _1287 ? as_type<float>(_1291) : _152;
    float _1315 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1317 = _1281 ? as_type<float>(_1307) : _152;
    float _1319 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1321 = _484 + _1319;
    int _1323 = _1303 ? as_type<int>(_568) : as_type<int>(_152);
    float _1325 = _1253 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1327 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1329 = _1327 != 0;
    float _1331 = _1321 * _1275;
    int _1333 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1335 = _1333 != 0;
    float _1337 = _1311 * _1293;
    int _1339 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1341 = _1339 != 0;
    out.m_67.w = _1271;
    float _1343 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1345 = _1341 ? as_type<float>(_1323) : _152;
    float _1347 = -_102;
    float _1349 = fma(_1347, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1301);
    float _1351 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1353 = _1315 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1355 = fma(_1345, _1325, -0.5);
    float _1357 = fma(_1305, -2.0, _1351);
    float _1359 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1361 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1359;
    float _1363 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1365 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1363;
    float _1367 = fma(_1313, _1353, -0.5);
    float _1369 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1371 = _1369 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1373 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1375 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1373;
    float _1377 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1379 = _1377 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1381 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1383 = _1381 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1385 = _1343 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1387 = fma(_1371, _1337, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1389 = fma(_1379, _1337, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1391 = fma(_1383, _1337, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1393 = fma(_1385, _1317, -0.5);
    bool _1395 = _484 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1397 = isnan(_484);
    bool _1399 = _1395 || _1397;
    bool _1401 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1403 = _1399 || _1401;
    float _1405 = float(_1403);
    float _1407 = fma(_1361, _1331, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1409 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1411 = _1275;
    float _1413 = _1311;
    float _1415 = _1277;
    float _1417 = _1409;
    float _1419 = _1407;
    int _1421 = as_type<int>(_1393);
    bool _1423 = _1341;
    if (!_1297)
    {
        _1411 = _1277;
    }
    float _1425 = _1411;
    float _1427 = -_1405;
    float _1429 = _1427 + 1.0;
    bool _1431 = _484 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1433 = isnan(_484);
    bool _1435 = _1431 || _1433;
    bool _1437 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1439 = _1435 || _1437;
    float _1441 = float(_1439);
    float _1443 = fma(_1365, _1331, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _1445 = _484 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1447 = isnan(_484);
    bool _1449 = _1445 || _1447;
    bool _1451 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1453 = _1449 || _1451;
    float _1455 = float(_1453);
    float _1457 = fma(_1375, _1331, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1459 = _1425;
    float _1461 = _1429;
    int _1463 = as_type<int>(_1457);
    if (!_1297)
    {
        _1413 = _1425;
    }
    float _1465 = _1413;
    float _1467 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1469 = _1465;
    if (_1297)
    {
        _1459 = _1277;
    }
    float _1471 = _1459;
    float _1473 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1409);
    float _1475 = _1471;
    if (_1257)
    {
        _1415 = _486;
    }
    float _1477 = _1415;
    float _1479 = _1455 * _1429;
    float _1481 = -_1455;
    float _1483 = _1481 + 1.0;
    float _1485 = _1477;
    if (!_1257)
    {
        _1485 = _132;
    }
    float _1487 = _1485;
    float _1489 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1467);
    if (!_1257)
    {
        _1461 = _490;
    }
    float _1491 = _1461;
    float _1493 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1473);
    float _1495 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1357);
    float _1497 = _1441 * _1483;
    float _1499 = _1491;
    if (!_1257)
    {
        _1417 = _1491;
    }
    float _1501 = _1417;
    float _1503 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1505 = _1487 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _1507 = as_type<int>(_1505);
    float _1509 = _1501;
    if (_1257)
    {
        _1499 = _490;
    }
    float _1511 = _1499;
    float _1513 = -_1495;
    float _1515 = fma(_1493, _1393, _1513);
    float _1517 = _1407 * _1497;
    float _1519 = _1443 * _1497;
    float _1521 = _1457 * _1497;
    float _1523 = -_1503;
    float _1525 = fma(_1505, 2.0, _1523);
    float _1527 = _1517;
    float _1529 = _1511;
    if (_1329)
    {
        float _1531 = -_1471;
        float _1533 = _1531 + 1.0;
        _1507 = as_type<int>(_1533);
    }
    int _1535 = _1507;
    if (_1297)
    {
        float _1537 = -_1471;
        float _1539 = _1537 + 1.0;
        _1463 = as_type<int>(_1539);
    }
    int _1541 = _1463;
    if (!_1329)
    {
        _1419 = _1471;
    }
    float _1543 = _1419;
    float _1545 = _1543;
    if (_1335)
    {
        float _1547 = -_1471;
        float _1549 = _1547 + 1.0;
        _1421 = as_type<int>(_1549);
    }
    int _1551 = _1421;
    if (_1297)
    {
        bool _1553 = _486 > 0.5;
        _1423 = _1553;
    }
    bool _1555 = _1423;
    float _1557 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_1329)
    {
        float _1559 = _1261 ? as_type<float>(_1535) : _1471;
        _1545 = _1559;
    }
    float _1561 = _1545;
    float _1563 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1489);
    float _1565 = -_102;
    float _1567 = fma(_1565, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1525);
    if (_1257)
    {
        _1509 = _486;
    }
    float _1569 = _1509;
    float _1571 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (_1297)
    {
        float _1573 = _1555 ? as_type<float>(_1541) : _1471;
        _1469 = _1573;
    }
    float _1575 = _1469;
    float _1577 = -_1441;
    float _1579 = _1577 + 1.0;
    float _1581 = _1569 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1583 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (_1335)
    {
        float _1585 = _1273 ? as_type<float>(_1551) : _1471;
        _1475 = _1585;
    }
    float _1587 = _1475;
    float _1589 = fma(_1579, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1521);
    float _1591 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1593 = fma(_1579, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1519);
    float _1595 = -_1571;
    float _1597 = fma(_1581, 2.0, _1595);
    float _1599 = fma(_1569, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1583);
    float _1601 = fma(_1579, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1517);
    float _1603 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (!_1257)
    {
        _1527 = _132;
    }
    float _1605 = _1527;
    float _1607 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1609 = _1605;
    if (_1257)
    {
        _150 = _1511;
    }
    float _1611 = _150;
    float _1613 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    if (_1257)
    {
        _1609 = _1511;
    }
    float _1615 = _1609;
    float _1617 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1607);
    if (!_1257)
    {
        _1529 = _486;
    }
    float _1619 = _1529;
    float _1621 = fma(_1611, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1603);
    float _1623 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1613);
    float _1625 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1627 = _1557 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1629 = fma(_1387, _1479, _1601);
    float _1631 = _1591 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1633 = fma(_1627, _1575, -0.5);
    float _1635 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1617);
    float _1637 = exp2(_1259);
    float _1639 = fma(_1389, _1479, _1593);
    float _1641 = fma(_1391, _1479, _1589);
    float _1643 = fma(_1631, _1561, -0.5);
    float _1645 = fma(_1635, _1633, _1349);
    float _1647 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1649 = _1615 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1651 = _1124 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1653 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1655 = _1619 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1657 = fma(_1649, -2.0, _1647);
    float _1659 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1651);
    float _1661 = _1625 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1663 = fma(_1655, -2.0, _1653);
    float _1665 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1621);
    float _1667 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1657);
    float _1669 = -_1637;
    float _1671 = _1669 + 1.0;
    float _1673 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1659);
    float _1675 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1599);
    float _1677 = -_102;
    float _1679 = fma(_1677, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1597);
    float _1681 = fma(_1405, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1639);
    float _1683 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1623);
    float _1685 = _1515 + 0.5;
    float _1687 = fma(_1661, _1587, -0.5);
    float _1689 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1663);
    float _1691 = _1671 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1693 = fma(_1405, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1641);
    float _1695 = -_1667;
    float _1697 = fma(_1665, _1355, _1695);
    float _1699 = _1681 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1701 = _1645 + 0.5;
    float _1703 = fma(_1675, _1643, _1679);
    float _1705 = fma(_1683, _1687, _1567);
    float _1707 = -_1689;
    float _1709 = fma(_1563, _1367, _1707);
    float _1711 = _1693 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1713 = fma(_1405, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1629);
    float _1715 = _1697 + 0.5;
    float _1717 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1673);
    float _1719 = _1699 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1721 = _1705 + 0.5;
    float _1723 = _1709 + 0.5;
    float _1725 = _1713 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1727 = _1717 + _1170;
    float _1729 = _1703 + 0.5;
    out.m_69.x = _1721;
    out.m_69.y = _1723;
    float _1731 = _1725 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1733 = _1711 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1735 = _1727 * 0.5;
    float _1737 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_71.x = _1701;
    out.m_71.y = _1685;
    out.m_71.z = _1729;
    out.m_71.w = _1715;
    out.m_73.x = _1731;
    out.m_73.y = _1719;
    out.m_73.z = _1733;
    out.gl_Position.x = _1192;
    out.gl_Position.y = _1198;
    out.gl_Position.z = _1717;
    out.gl_Position.w = _1170;
    out.m_75.z = _1735;
    out.m_75.w = _1170;
    out.m_49.x = _1737;
    float _1739 = _1691 * _1224;
    float _1741 = -_1691;
    float _1743 = _1741 + 1.0;
    float _1745 = _1235 * _1739;
    float _1747 = _1249 * _1739;
    float _1749 = fma(_1245, _1745, _1229);
    float _1751 = fma(_1247, _1745, _1231);
    float _1753 = _1235 * _1743;
    float _1755 = fma(_1235, _1747, _1233);
    out.m_77.x = _1749;
    out.m_77.y = _1751;
    out.m_77.z = _1755;
    out.m_77.w = _1753;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _300 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _91 = in.m_42.w;
    float _93 = in.m_44.w;
    float _95 = trunc(_91);
    int _98 = int(_95);
    float _100 = -_93;
    float _102 = _100 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_47.y = _102;
    bool _106 = _98 >= 1;
    float _108 = 0.0;
    float _110 = as_type<float>(_98);
    if (!_106)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _108;
    if (!_106)
    {
        out.m_49.x = 0.0;
    }
    int _114 = 0;
    if (!_106)
    {
        float _116 = _112 * 5.0;
        _114 = as_type<int>(_116);
    }
    int _118 = _114;
    float _120 = as_type<float>(_118);
    if (!_106)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1824 = as_type<float>(_118);
        out.gl_Position.z = _1824;
    }
    if (!_106)
    {
        return out;
    }
    bool _122 = _93 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _124 = isnan(_93);
    bool _126 = _122 || _124;
    bool _128 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _130 = _126 || _128;
    float _132 = in.m_51.z;
    float _134 = float(_98);
    bool _136 = _102 >= _134;
    bool _138 = !_130;
    bool _140 = _136 || _138;
    if (_140)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _110;
    if (_140)
    {
        out.m_49.x = 0.0;
    }
    int _144 = 0;
    if (_140)
    {
        float _146 = _142 * 5.0;
        _144 = as_type<int>(_146);
    }
    int _148 = _144;
    out.m_53.z = _132;
    float _150 = _132;
    if (_140)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1884 = as_type<float>(_148);
        out.gl_Position.z = _1884;
    }
    if (_140)
    {
        return out;
    }
    float _152 = in.m_55.y;
    float _154 = 1.0 / _134;
    float _156 = _102 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _158 = in.m_57.w;
    bool _160 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _162 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _164 = _160 || _162;
    bool _166 = isnan(1.0);
    bool _168 = _164 || _166;
    float _170 = in.m_44.x;
    float _172 = in.m_44.y;
    float _174 = in.m_44.z;
    float _176 = in.m_42.x;
    float _178 = in.m_42.y;
    float _180 = in.m_42.z;
    float _182 = _156;
    if (!_168)
    {
        float _184 = _156 * _156;
        float _186 = _184 * 0.5;
        _120 = _186;
    }
    float _188 = _120;
    float _190 = _188;
    if (!_168)
    {
        float _192 = _188 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _192;
    }
    float _194 = _190;
    out.m_59.y = _152;
    bool _196 = !_168;
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
    bool _232 = !_168;
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
    bool _256 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _258 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _260 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _262 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _264 = _102 * _154;
    float _266 = fma(_254, _170, _258);
    float _268 = fma(_254, _172, _260);
    float _270 = fma(_254, _174, _262);
    float _272 = fma(_266, _158, _176);
    float _274 = fma(_268, _158, _178);
    float _276 = fma(_270, _158, _180);
    bool _278 = !_256;
    float _280 = _264;
    float _298;
    if (!_278)
    {
        float _282 = in.m_51.x;
        float _284 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _286 = _282 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _288 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[11].x, _102);
        float _290 = _288 * _284;
        float _292 = floor(_290);
        float _294 = -_292;
        float _296 = _290 + _294;
        _298 = _296;
        _300 = true;
    }
    else
    {
        _298 = _264;
    }
    _300 = false;
    float _302 = _298;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _306 = _302 + _304;
    bool _308 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _310 = isnan(_302);
    bool _312 = _308 || _310;
    bool _314 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _316 = _312 || _314;
    float _318 = float(_316);
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _322 = _302 + _320;
    bool _324 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _326 = isnan(_302);
    bool _328 = _324 || _326;
    bool _330 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _332 = _328 || _330;
    float _334 = float(_332);
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _336;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _342 = _340 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _344 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _346 = isnan(_302);
    bool _348 = _344 || _346;
    bool _350 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _352 = _348 || _350;
    float _354 = float(_352);
    float _356 = -_318;
    float _358 = _356 + 1.0;
    float _360 = 1.0 / _342;
    float _362 = _354 * _358;
    float _364 = -_354;
    float _366 = _364 + 1.0;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _368;
    bool _372 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _374 = 1.0 / _338;
    float _376 = _334 * _366;
    float _378 = -_334;
    float _380 = _378 + 1.0;
    float _382 = _322 * _360;
    float _384 = _306 * _374;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _386;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _392 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _390;
    float _394 = fma(_370, _384, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _396 = fma(_388, _384, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _398 = fma(_392, _384, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _400 = in.m_57.x;
    float _402 = in.m_57.y;
    float _404 = in.m_57.z;
    float _406 = _394 * _376;
    float _408 = _396 * _376;
    float _410 = _398 * _376;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _418 = _416 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _422 = _420 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _424 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[107].x, _406);
    float _426 = fma(_414, _382, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _428 = fma(_418, _382, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _430 = fma(_422, _382, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _432 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[107].y, _408);
    float _434 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[107].z, _410);
    float _436 = fma(_426, _362, _424);
    float _438 = fma(_428, _362, _432);
    float _440 = fma(_430, _362, _434);
    float _442 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[109].x, _436);
    float _444 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[109].y, _438);
    float _446 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[109].z, _440);
    float _448 = _400 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _450 = _402 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _452 = _442 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _454 = _444 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _456 = _446 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _458 = _404 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _460 = _452 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _462 = _454 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _464 = _456 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _466 = !_372;
    if (!_466)
    {
        float _468 = in.m_51.x;
        float _470 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _472 = _468 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _474 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[11].z, _102);
        float _476 = _474 * _470;
        float _478 = floor(_476);
        float _480 = -_478;
        float _482 = _476 + _480;
        _280 = _482;
    }
    float _484 = _280;
    float _486 = in.m_51.x;
    float _488 = _274 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _490 = in.m_51.y;
    float _492 = (*spvDescriptorSet0.vp_c8)._m0[32].z * (*spvDescriptorSet0.vp_c8)._m0[32].z;
    float _494 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _496 = fma((*spvDescriptorSet0.vp_c8)._m0[32].x, (*spvDescriptorSet0.vp_c8)._m0[32].x, _492);
    float _498 = _274 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _500 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _494);
    float _502 = _274 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _504 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[4].x, _498);
    float _506 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _500);
    float _508 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[6].x, _502);
    float _510 = -_152;
    float _512 = fma(_510, 5.0, 5.0);
    float _514 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[4].z, _504);
    float _516 = 1.0 / _458;
    float _518 = -_152;
    float _520 = fma(_518, 4.0, 4.0);
    float _522 = fma(_102, 0.5299999713897705078125, _512);
    float _524 = _486 * 6.283185482025146484375;
    float _526 = _514 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _528 = fma(_102, 0.4199999868869781494140625, _520);
    float _530 = fma(_102, 0.12999999523162841796875, _524);
    float _532 = _490 * 6.283185482025146484375;
    float _534 = _528 + _524;
    float _536 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[6].z, _508);
    float _538 = _530 * 0.15915493667125701904296875;
    float _540 = fma(_102, 0.37000000476837158203125, _532);
    float _542 = _522 + _532;
    float _544 = _536 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _546 = -_526;
    float _548 = _546 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _550 = _540 * 0.15915493667125701904296875;
    float _552 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[5].x, _488);
    float _554 = _542 * 0.15915493667125701904296875;
    float _556 = -_544;
    float _558 = _556 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _560 = rsqrt(_506);
    float _562 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[5].z, _552);
    float _564 = _534 * 0.15915493667125701904296875;
    float _566 = -_152;
    float _568 = _566 + 1.0;
    float _570 = fma(_102, 0.7200000286102294921875, _532);
    float _572 = _562 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _574 = _458 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _576 = _564 * 6.283185482025146484375;
    float _578 = sin(_576);
    float _580 = -_572;
    float _582 = _580 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _584 = _570 * 0.15915493667125701904296875;
    float _586 = _582 * _582;
    float _588 = _554 * 6.283185482025146484375;
    float _590 = sin(_588);
    float _592 = fma(_548, _548, _586);
    float _594 = _560 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _596 = _560 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _598 = fma(_558, _558, _592);
    float _600 = _594 * _594;
    float _602 = _578 * 0.100000001490116119384765625;
    float _604 = rsqrt(_598);
    float _606 = fma(_596, _596, _600);
    float _608 = _568 * _602;
    float _610 = _568 * _590;
    float _612 = rsqrt(_606);
    float _614 = in.m_61.x;
    float _616 = in.m_61.y;
    float _618 = in.m_61.z;
    float _620 = fma(_610, 0.0500000007450580596923828125, _608);
    float _622 = _620 * 0.15915493667125701904296875;
    float _624 = _548 * _604;
    float _626 = _558 * _604;
    float _628 = _582 * _604;
    float _630 = 1.0 / _450;
    float _632 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _634 = _624 * _632;
    float _636 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _638 = _626 * _636;
    float _640 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _642 = _628 * _640;
    float _644 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _646 = -_634;
    float _648 = fma(_626, _644, _646);
    float _650 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _652 = -_638;
    float _654 = fma(_628, _650, _652);
    float _656 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _658 = -_642;
    float _660 = fma(_624, _656, _658);
    float _662 = _550 * 6.283185482025146484375;
    float _664 = sin(_662);
    float _666 = _648 * _648;
    float _668 = _594 * _612;
    float _670 = _596 * _612;
    float _672 = _450 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _674 = fma(_654, _654, _666);
    float _676 = _516 * _618;
    float _678 = fma(_610, 0.0199999995529651641845703125, _608);
    float _680 = rsqrt(_496);
    float _682 = fma(_660, _660, _674);
    float _684 = _630 * _616;
    float _686 = 1.0 / _448;
    float _688 = _664 * 0.1500000059604644775390625;
    float _690 = _622 * 6.283185482025146484375;
    float _692 = sin(_690);
    float _694 = _680 * (*spvDescriptorSet0.vp_c8)._m0[32].z;
    float _696 = _448 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _698 = _668 * _694;
    float _700 = _622 * 6.283185482025146484375;
    float _702 = cos(_700);
    float _704 = fma(_686, _614, _678);
    float _706 = _680 * (*spvDescriptorSet0.vp_c8)._m0[32].x;
    float _708 = fma(_670, _706, _698);
    float _710 = rsqrt(_682);
    float _712 = _684 * _692;
    float _714 = _708 * _708;
    float _716 = _538 * 6.283185482025146484375;
    float _718 = sin(_716);
    float _720 = _684 * _702;
    float _722 = -_712;
    float _724 = fma(_704, _702, _722);
    float _726 = fma(_704, _692, _720);
    float _728 = _584 * 6.283185482025146484375;
    float _730 = sin(_728);
    float _732 = _654 * _710;
    float _734 = _648 * _710;
    float _736 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _726);
    float _738 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _724);
    float _740 = _628 * _732;
    float _742 = _672 * _736;
    float _744 = fma(_718, 0.449999988079071044921875, _688);
    float _746 = _660 * _710;
    float _748 = -_740;
    float _750 = fma(_624, _734, _748);
    float _752 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _676);
    float _754 = _696 * _738;
    float _756 = _742 * _750;
    float _758 = _574 * _752;
    float _760 = fma(_730, 0.100000001490116119384765625, _744);
    float _762 = _626 * _734;
    float _764 = fma(_754, _746, _756);
    float _766 = fma(_714, -0.699999988079071044921875, 1.0);
    float _768 = _760 + 1.5;
    float _770 = -_762;
    float _772 = fma(_628, _746, _770);
    float _774 = fma(_758, _626, _764);
    float _776 = _766 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _778 = _624 * _746;
    float _780 = _742 * _772;
    float _782 = _568 * _568;
    float _784 = _544 + _774;
    float _786 = -_778;
    float _788 = fma(_626, _732, _786);
    float _790 = fma(_754, _732, _780);
    float _792 = _782 * _768;
    float _794 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _796 = _784 + _794;
    float _798 = _742 * _788;
    float _800 = fma(_758, _624, _790);
    float _802 = _776 * _792;
    float _804 = fma(_574, _796, _784);
    float _806 = fma(_754, _734, _798);
    float _808 = _526 + _800;
    float _810 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[32].z, _804);
    float _812 = fma(_758, _628, _806);
    float _814 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _816 = _808 + _814;
    float _818 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _820 = _810 + _818;
    float _822 = _572 + _812;
    float _824 = fma(_696, _816, _808);
    float _826 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[32].x, _824);
    float _828 = _820 * _820;
    float _830 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _832 = _826 + _830;
    float _834 = fma(_832, _832, _828);
    float _836 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _838 = _822 + _836;
    float _840 = sqrt(_834);
    float _842 = fma(_672, _838, _822);
    float _844 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[32].y, _842);
    bool _846 = _840 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _848 = _842;
    float _850 = _822;
    float _852 = _742;
    float _854 = _810;
    float _856 = _798;
    float _858 = _802;
    float _860 = _832;
    if (!_846)
    {
        _848 = _826;
    }
    float _862 = _848;
    float _864 = _862;
    if (!_846)
    {
        _850 = _810;
    }
    float _866 = _850;
    float _868 = _866;
    if (!_846)
    {
        _852 = _844;
    }
    float _870 = _852;
    bool _872 = !_846;
    float _874 = _870;
    if (!_872)
    {
        float _876 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _878 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _880 = _840 + _878;
        float _882 = rsqrt(_834);
        float _884 = _880 * _876;
        float _886 = _844 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _888 = _884 * 0.15915493667125701904296875;
        float _890 = _888 * 6.283185482025146484375;
        float _892 = cos(_890);
        float _894 = _888 * 6.283185482025146484375;
        float _896 = sin(_894);
        float _898 = _892 + (-1.0);
        float _900 = fma(_896, _886, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _902 = _898 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _904 = _882 * _900;
        float _906 = fma(_844, _892, _902);
        float _908 = fma(_832, _904, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _910 = fma(_820, _904, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _874 = _906;
        _864 = _908;
        _868 = _910;
    }
    float _912 = _874;
    float _914 = _864;
    float _916 = _868;
    float _918 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _920 = _912 + _918;
    float _922 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _924 = _914 + _922;
    float _926 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _928 = _916 + _926;
    float _930 = _920 * _920;
    float _932 = fma(_924, _924, _930);
    float _934 = fma(_928, _928, _932);
    float _936 = rsqrt(_934);
    float _938 = _936 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _940 = _924 * _938;
    float _942 = _928 * _938;
    float _944 = _940 * _940;
    float _946 = _942 * _942;
    float _948 = _944 + _946;
    float _950 = sqrt(_948);
    bool _952 = _950 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _954 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _956 = _950 + _954;
    float _958 = _936;
    float _960 = _948;
    float _962 = _956;
    float _964 = _920;
    if (_952)
    {
        float _966 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _958 = _966;
    }
    float _968 = _958;
    if (_952)
    {
        float _970 = rsqrt(_948);
        _960 = _970;
    }
    float _972 = _960;
    if (_952)
    {
        float _974 = _956 * _968;
        _962 = _974;
    }
    float _976 = _962;
    if (_952)
    {
        float _978 = _976 * 0.15915493667125701904296875;
        _854 = _978;
    }
    float _980 = _854;
    float _982 = _928;
    if (_952)
    {
        float _984 = _980 * 6.283185482025146484375;
        float _986 = sin(_984);
        _982 = _986;
    }
    float _988 = _982;
    float _990 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _992 = precise::max(0.0, _990);
    float _994 = _968;
    float _996 = _992;
    if (_952)
    {
        float _998 = _980 * 6.283185482025146484375;
        float _1000 = cos(_998);
        _994 = _1000;
    }
    float _1002 = _994;
    float _1004 = -_938;
    float _1006 = -_992;
    float _1008 = fma(_920, _1004, _1006);
    if (_952)
    {
        float _1010 = _1008 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _964 = _1010;
    }
    float _1012 = _964;
    float _1014 = _988;
    float _1016 = _1012;
    if (_952)
    {
        float _1018 = fma(_988, _1012, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _856 = _1018;
    }
    float _1020 = _856;
    float _1022 = _1020;
    if (!_952)
    {
        _1014 = _940;
    }
    float _1024 = _1014;
    float _1026 = _1024;
    if (!_952)
    {
        _1016 = _1008;
    }
    float _1028 = _1016;
    float _1030 = _1028;
    float _1032 = _1002;
    if (_952)
    {
        float _1034 = _1002 + (-1.0);
        _996 = _1034;
    }
    float _1036 = _996;
    float _1038 = _1036;
    if (_952)
    {
        float _1040 = _972 * _1020;
        _858 = _1040;
    }
    float _1042 = _858;
    if (!_952)
    {
        _1022 = _944;
    }
    float _1044 = _1022;
    float _1046 = sqrt(_934);
    float _1048 = _1044;
    if (_952)
    {
        float _1050 = _1036 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _860 = _1050;
    }
    float _1052 = _860;
    if (_952)
    {
        float _1054 = _940 * _1042;
        _1026 = _1054;
    }
    float _1056 = _1026;
    if (!_952)
    {
        _1038 = _942;
    }
    float _1058 = _1038;
    float _1060 = _1058;
    if (_952)
    {
        float _1062 = _942 * _1042;
        _1060 = _1062;
    }
    float _1064 = _1060;
    if (_952)
    {
        float _1066 = fma(_1008, _1002, _1052);
        _1030 = _1066;
    }
    float _1068 = _1030;
    if (_952)
    {
        float _1070 = _1056 * _1056;
        _1048 = _1070;
    }
    float _1072 = _1048;
    if (!_952)
    {
        _1032 = _946;
    }
    float _1074 = _1032;
    float _1076 = _1074;
    if (_952)
    {
        float _1078 = _1064 * _1064;
        _1076 = _1078;
    }
    float _1080 = _1076;
    float _1082 = fma(_1068, _1068, _1072);
    float _1084 = _912 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1086 = _1082 + _1080;
    float _1088 = _912 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1090 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1092 = fma(_1046, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1090);
    float _1094 = precise::clamp(_1092, 0.0, 1.0);
    float _1096 = _912 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1098 = rsqrt(_1086);
    float _1100 = fma(_914, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1088);
    float _1102 = -_1094;
    float _1104 = _1102 + 1.0;
    float _1106 = fma(_914, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1096);
    float _1108 = fma(_914, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1084);
    float _1110 = fma(_916, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1100);
    float _1112 = _912 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1114 = fma(_916, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1106);
    float _1116 = abs(_1104);
    float _1118 = log2(_1116);
    float _1120 = _1110 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1122 = fma(_914, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1112);
    float _1124 = _1114 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1126 = fma(_916, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1108);
    float _1128 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1130 = fma(_916, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1122);
    float _1132 = _1120 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1134 = _1098 * _1056;
    float _1136 = _1098 * _1068;
    float _1138 = _1130 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1140 = _1124 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1142 = _1134 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1144 = _1098 * _1064;
    float _1146 = _1126 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1148 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1140);
    float _1150 = -_1142;
    float _1152 = fma(_1136, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1150);
    float _1154 = _1118 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1156 = -_1132;
    float _1158 = fma(_1156, _1128, 1.0);
    float _1160 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1148);
    float _1162 = -_1144;
    float _1164 = fma(_1162, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1152);
    float _1166 = _1124 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1168 = log2(_1158);
    float _1170 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1160);
    float _1172 = fma(_1164, -0.5, 0.5);
    float _1174 = _1124 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1176 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1166);
    float _1178 = fma(_1164, 0.5, 0.5);
    float _1180 = _1136 + 1.0;
    float _1182 = exp2(_1154);
    float _1184 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1174);
    float _1186 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1176);
    float _1188 = fma(_1178, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1190 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1184);
    float _1192 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1186);
    float _1194 = fma(_1178, _1188, -0.212114393711090087890625);
    float _1196 = 1.0 / _1170;
    float _1198 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1190);
    float _1200 = _1168 * 0.693147182464599609375;
    float _1202 = fma(_1178, _1194, 1.570728778839111328125);
    float _1204 = _1200 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1206 = sqrt(_1172);
    float _1208 = -_1136;
    float _1210 = fma(_1182, _1180, _1208);
    float _1212 = fma(_1210, 0.5, 0.5);
    float _1214 = _1192 * _1196;
    float _1216 = _1198 * _1196;
    float _1218 = fma(_1214, 0.5, 0.5);
    float _1220 = fma(_1216, -0.5, 0.5);
    float _1222 = _1206 * 0.636619746685028076171875;
    float3 _3630 = float3(_1218, _1220, _1204);
    float _1224 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3630, float3(0.0), isnan(_3630)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3630, float3(0.0), isnan(_3630)), level(0.0)).x;
    float3 _3641 = float3(_1218, _1220, _1204);
    float4 _1227 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3641, float3(0.0), isnan(_3641)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3641, float3(0.0), isnan(_3641)), level(0.0)).xyzw;
    float _1229 = _1227.x;
    float _1231 = _1227.y;
    float _1233 = _1227.z;
    float _1235 = _1227.w;
    float _1237 = -_1202;
    float _1239 = fma(_1222, _1237, 1.0);
    float2 _3663 = float2(_1239, _1212);
    float3 _1243 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3663, float2(0.0), isnan(_3663)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3663, float2(0.0), isnan(_3663)), level(0.0)).xyz;
    float _1245 = _1243.x;
    float _1247 = _1243.y;
    float _1249 = _1243.z;
    float _1251 = in.m_51.w;
    float _1253 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    out.m_63.x = _460;
    out.m_63.y = _462;
    out.m_63.z = _464;
    int _1255 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1257 = _1255 != 0;
    float _1259 = _1118 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1261 = _132 > 0.5;
    float _1263 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1265 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1263;
    float _1267 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1269 = _1267 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1271 = in.m_65.w;
    bool _1273 = _490 > 0.5;
    float _1275 = 1.0 / _1265;
    float _1277 = in.m_55.x;
    int _1279 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1281 = _1279 != 0;
    float _1283 = _486 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1285 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1287 = _1285 != 0;
    float _1289 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1291 = _1261 ? as_type<int>(_568) : as_type<int>(_152);
    float _1293 = 1.0 / _1269;
    int _1295 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1297 = _1295 != 0;
    float _1299 = -_1289;
    float _1301 = fma(_1283, 2.0, _1299);
    bool _1303 = _1251 > 0.5;
    float _1305 = _490 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1307 = _1273 ? as_type<int>(_568) : as_type<int>(_152);
    float _1309 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1311 = _484 + _1309;
    float _1313 = _1287 ? as_type<float>(_1291) : _152;
    float _1315 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1317 = _1281 ? as_type<float>(_1307) : _152;
    float _1319 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1321 = _484 + _1319;
    int _1323 = _1303 ? as_type<int>(_568) : as_type<int>(_152);
    float _1325 = _1253 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1327 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1329 = _1327 != 0;
    float _1331 = _1321 * _1275;
    int _1333 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1335 = _1333 != 0;
    float _1337 = _1311 * _1293;
    int _1339 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1341 = _1339 != 0;
    out.m_67.w = _1271;
    float _1343 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1345 = _1341 ? as_type<float>(_1323) : _152;
    float _1347 = -_102;
    float _1349 = fma(_1347, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1301);
    float _1351 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1353 = _1315 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1355 = fma(_1345, _1325, -0.5);
    float _1357 = fma(_1305, -2.0, _1351);
    float _1359 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1361 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1359;
    float _1363 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1365 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1363;
    float _1367 = fma(_1313, _1353, -0.5);
    float _1369 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1371 = _1369 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1373 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1375 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1373;
    float _1377 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1379 = _1377 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1381 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1383 = _1381 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1385 = _1343 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1387 = fma(_1371, _1337, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1389 = fma(_1379, _1337, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1391 = fma(_1383, _1337, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1393 = fma(_1385, _1317, -0.5);
    bool _1395 = _484 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1397 = isnan(_484);
    bool _1399 = _1395 || _1397;
    bool _1401 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1403 = _1399 || _1401;
    float _1405 = float(_1403);
    float _1407 = fma(_1361, _1331, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1409 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1411 = _1275;
    float _1413 = _1311;
    float _1415 = _1277;
    float _1417 = _1409;
    float _1419 = _1407;
    int _1421 = as_type<int>(_1393);
    bool _1423 = _1341;
    if (!_1297)
    {
        _1411 = _1277;
    }
    float _1425 = _1411;
    float _1427 = -_1405;
    float _1429 = _1427 + 1.0;
    bool _1431 = _484 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1433 = isnan(_484);
    bool _1435 = _1431 || _1433;
    bool _1437 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1439 = _1435 || _1437;
    float _1441 = float(_1439);
    float _1443 = fma(_1365, _1331, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _1445 = _484 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1447 = isnan(_484);
    bool _1449 = _1445 || _1447;
    bool _1451 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1453 = _1449 || _1451;
    float _1455 = float(_1453);
    float _1457 = fma(_1375, _1331, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1459 = _1425;
    float _1461 = _1429;
    int _1463 = as_type<int>(_1457);
    if (!_1297)
    {
        _1413 = _1425;
    }
    float _1465 = _1413;
    float _1467 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1469 = _1465;
    if (_1297)
    {
        _1459 = _1277;
    }
    float _1471 = _1459;
    float _1473 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1409);
    float _1475 = _1471;
    if (_1257)
    {
        _1415 = _486;
    }
    float _1477 = _1415;
    float _1479 = _1455 * _1429;
    float _1481 = -_1455;
    float _1483 = _1481 + 1.0;
    float _1485 = _1477;
    if (!_1257)
    {
        _1485 = _132;
    }
    float _1487 = _1485;
    float _1489 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1467);
    if (!_1257)
    {
        _1461 = _490;
    }
    float _1491 = _1461;
    float _1493 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1473);
    float _1495 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1357);
    float _1497 = _1441 * _1483;
    float _1499 = _1491;
    if (!_1257)
    {
        _1417 = _1491;
    }
    float _1501 = _1417;
    float _1503 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1505 = _1487 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _1507 = as_type<int>(_1505);
    float _1509 = _1501;
    if (_1257)
    {
        _1499 = _490;
    }
    float _1511 = _1499;
    float _1513 = -_1495;
    float _1515 = fma(_1493, _1393, _1513);
    float _1517 = _1407 * _1497;
    float _1519 = _1443 * _1497;
    float _1521 = _1457 * _1497;
    float _1523 = -_1503;
    float _1525 = fma(_1505, 2.0, _1523);
    float _1527 = _1517;
    float _1529 = _1511;
    if (_1329)
    {
        float _1531 = -_1471;
        float _1533 = _1531 + 1.0;
        _1507 = as_type<int>(_1533);
    }
    int _1535 = _1507;
    if (_1297)
    {
        float _1537 = -_1471;
        float _1539 = _1537 + 1.0;
        _1463 = as_type<int>(_1539);
    }
    int _1541 = _1463;
    if (!_1329)
    {
        _1419 = _1471;
    }
    float _1543 = _1419;
    float _1545 = _1543;
    if (_1335)
    {
        float _1547 = -_1471;
        float _1549 = _1547 + 1.0;
        _1421 = as_type<int>(_1549);
    }
    int _1551 = _1421;
    if (_1297)
    {
        bool _1553 = _486 > 0.5;
        _1423 = _1553;
    }
    bool _1555 = _1423;
    float _1557 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_1329)
    {
        float _1559 = _1261 ? as_type<float>(_1535) : _1471;
        _1545 = _1559;
    }
    float _1561 = _1545;
    float _1563 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1489);
    float _1565 = -_102;
    float _1567 = fma(_1565, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1525);
    if (_1257)
    {
        _1509 = _486;
    }
    float _1569 = _1509;
    float _1571 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (_1297)
    {
        float _1573 = _1555 ? as_type<float>(_1541) : _1471;
        _1469 = _1573;
    }
    float _1575 = _1469;
    float _1577 = -_1441;
    float _1579 = _1577 + 1.0;
    float _1581 = _1569 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1583 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (_1335)
    {
        float _1585 = _1273 ? as_type<float>(_1551) : _1471;
        _1475 = _1585;
    }
    float _1587 = _1475;
    float _1589 = fma(_1579, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1521);
    float _1591 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1593 = fma(_1579, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1519);
    float _1595 = -_1571;
    float _1597 = fma(_1581, 2.0, _1595);
    float _1599 = fma(_1569, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1583);
    float _1601 = fma(_1579, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1517);
    float _1603 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (!_1257)
    {
        _1527 = _132;
    }
    float _1605 = _1527;
    float _1607 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1609 = _1605;
    if (_1257)
    {
        _150 = _1511;
    }
    float _1611 = _150;
    float _1613 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    if (_1257)
    {
        _1609 = _1511;
    }
    float _1615 = _1609;
    float _1617 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1607);
    if (!_1257)
    {
        _1529 = _486;
    }
    float _1619 = _1529;
    float _1621 = fma(_1611, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1603);
    float _1623 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1613);
    float _1625 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1627 = _1557 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1629 = fma(_1387, _1479, _1601);
    float _1631 = _1591 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1633 = fma(_1627, _1575, -0.5);
    float _1635 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1617);
    float _1637 = exp2(_1259);
    float _1639 = fma(_1389, _1479, _1593);
    float _1641 = fma(_1391, _1479, _1589);
    float _1643 = fma(_1631, _1561, -0.5);
    float _1645 = fma(_1635, _1633, _1349);
    float _1647 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1649 = _1615 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1651 = _1124 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1653 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1655 = _1619 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1657 = fma(_1649, -2.0, _1647);
    float _1659 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1651);
    float _1661 = _1625 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1663 = fma(_1655, -2.0, _1653);
    float _1665 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1621);
    float _1667 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1657);
    float _1669 = -_1637;
    float _1671 = _1669 + 1.0;
    float _1673 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1659);
    float _1675 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1599);
    float _1677 = -_102;
    float _1679 = fma(_1677, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1597);
    float _1681 = fma(_1405, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1639);
    float _1683 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1623);
    float _1685 = _1515 + 0.5;
    float _1687 = fma(_1661, _1587, -0.5);
    float _1689 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1663);
    float _1691 = _1671 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1693 = fma(_1405, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1641);
    float _1695 = -_1667;
    float _1697 = fma(_1665, _1355, _1695);
    float _1699 = _1681 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1701 = _1645 + 0.5;
    float _1703 = fma(_1675, _1643, _1679);
    float _1705 = fma(_1683, _1687, _1567);
    float _1707 = -_1689;
    float _1709 = fma(_1563, _1367, _1707);
    float _1711 = _1693 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1713 = fma(_1405, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1629);
    float _1715 = _1697 + 0.5;
    float _1717 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1673);
    float _1719 = _1699 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1721 = _1705 + 0.5;
    float _1723 = _1709 + 0.5;
    float _1725 = _1713 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1727 = _1717 + _1170;
    float _1729 = _1703 + 0.5;
    out.m_69.x = _1721;
    out.m_69.y = _1723;
    float _1731 = _1725 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1733 = _1711 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1735 = _1727 * 0.5;
    float _1737 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_71.x = _1701;
    out.m_71.y = _1685;
    out.m_71.z = _1729;
    out.m_71.w = _1715;
    out.m_73.x = _1731;
    out.m_73.y = _1719;
    out.m_73.z = _1733;
    out.gl_Position.x = _1192;
    out.gl_Position.y = _1198;
    out.gl_Position.z = _1717;
    out.gl_Position.w = _1170;
    out.m_75.z = _1735;
    out.m_75.w = _1170;
    out.m_49.x = _1737;
    float _1739 = _1691 * _1224;
    float _1741 = -_1691;
    float _1743 = _1741 + 1.0;
    float _1745 = _1235 * _1739;
    float _1747 = _1249 * _1739;
    float _1749 = fma(_1245, _1745, _1229);
    float _1751 = fma(_1247, _1745, _1231);
    float _1753 = _1235 * _1743;
    float _1755 = fma(_1235, _1747, _1233);
    out.m_77.x = _1749;
    out.m_77.y = _1751;
    out.m_77.z = _1755;
    out.m_77.w = _1753;
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
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _300 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _91 = in.m_42.w;
    float _93 = in.m_44.w;
    float _95 = trunc(_91);
    int _98 = int(_95);
    float _100 = -_93;
    float _102 = _100 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_47.y = _102;
    bool _106 = _98 >= 1;
    float _108 = 0.0;
    float _110 = as_type<float>(_98);
    if (!_106)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _108;
    if (!_106)
    {
        out.m_49.x = 0.0;
    }
    int _114 = 0;
    if (!_106)
    {
        float _116 = _112 * 5.0;
        _114 = as_type<int>(_116);
    }
    int _118 = _114;
    float _120 = as_type<float>(_118);
    if (!_106)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1824 = as_type<float>(_118);
        out.gl_Position.z = _1824;
    }
    if (!_106)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _122 = _93 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _124 = isnan(_93);
    bool _126 = _122 || _124;
    bool _128 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _130 = _126 || _128;
    float _132 = in.m_51.z;
    float _134 = float(_98);
    bool _136 = _102 >= _134;
    bool _138 = !_130;
    bool _140 = _136 || _138;
    if (_140)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _110;
    if (_140)
    {
        out.m_49.x = 0.0;
    }
    int _144 = 0;
    if (_140)
    {
        float _146 = _142 * 5.0;
        _144 = as_type<int>(_146);
    }
    int _148 = _144;
    out.m_53.z = _132;
    float _150 = _132;
    if (_140)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1884 = as_type<float>(_148);
        out.gl_Position.z = _1884;
    }
    if (_140)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _152 = in.m_55.y;
    float _154 = 1.0 / _134;
    float _156 = _102 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _158 = in.m_57.w;
    bool _160 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _162 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _164 = _160 || _162;
    bool _166 = isnan(1.0);
    bool _168 = _164 || _166;
    float _170 = in.m_44.x;
    float _172 = in.m_44.y;
    float _174 = in.m_44.z;
    float _176 = in.m_42.x;
    float _178 = in.m_42.y;
    float _180 = in.m_42.z;
    float _182 = _156;
    if (!_168)
    {
        float _184 = _156 * _156;
        float _186 = _184 * 0.5;
        _120 = _186;
    }
    float _188 = _120;
    float _190 = _188;
    if (!_168)
    {
        float _192 = _188 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _192;
    }
    float _194 = _190;
    out.m_59.y = _152;
    bool _196 = !_168;
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
    bool _232 = !_168;
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
    bool _256 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _258 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _260 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _262 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _264 = _102 * _154;
    float _266 = fma(_254, _170, _258);
    float _268 = fma(_254, _172, _260);
    float _270 = fma(_254, _174, _262);
    float _272 = fma(_266, _158, _176);
    float _274 = fma(_268, _158, _178);
    float _276 = fma(_270, _158, _180);
    bool _278 = !_256;
    float _280 = _264;
    float _298;
    if (!_278)
    {
        float _282 = in.m_51.x;
        float _284 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _286 = _282 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _288 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[11].x, _102);
        float _290 = _288 * _284;
        float _292 = floor(_290);
        float _294 = -_292;
        float _296 = _290 + _294;
        _298 = _296;
        _300 = true;
    }
    else
    {
        _298 = _264;
    }
    _300 = false;
    float _302 = _298;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _306 = _302 + _304;
    bool _308 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _310 = isnan(_302);
    bool _312 = _308 || _310;
    bool _314 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _316 = _312 || _314;
    float _318 = float(_316);
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _322 = _302 + _320;
    bool _324 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _326 = isnan(_302);
    bool _328 = _324 || _326;
    bool _330 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _332 = _328 || _330;
    float _334 = float(_332);
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _336;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _342 = _340 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _344 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _346 = isnan(_302);
    bool _348 = _344 || _346;
    bool _350 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _352 = _348 || _350;
    float _354 = float(_352);
    float _356 = -_318;
    float _358 = _356 + 1.0;
    float _360 = 1.0 / _342;
    float _362 = _354 * _358;
    float _364 = -_354;
    float _366 = _364 + 1.0;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _368;
    bool _372 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _374 = 1.0 / _338;
    float _376 = _334 * _366;
    float _378 = -_334;
    float _380 = _378 + 1.0;
    float _382 = _322 * _360;
    float _384 = _306 * _374;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _386;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _392 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _390;
    float _394 = fma(_370, _384, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _396 = fma(_388, _384, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _398 = fma(_392, _384, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _400 = in.m_57.x;
    float _402 = in.m_57.y;
    float _404 = in.m_57.z;
    float _406 = _394 * _376;
    float _408 = _396 * _376;
    float _410 = _398 * _376;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _418 = _416 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _422 = _420 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _424 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[107].x, _406);
    float _426 = fma(_414, _382, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _428 = fma(_418, _382, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _430 = fma(_422, _382, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _432 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[107].y, _408);
    float _434 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[107].z, _410);
    float _436 = fma(_426, _362, _424);
    float _438 = fma(_428, _362, _432);
    float _440 = fma(_430, _362, _434);
    float _442 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[109].x, _436);
    float _444 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[109].y, _438);
    float _446 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[109].z, _440);
    float _448 = _400 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _450 = _402 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _452 = _442 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _454 = _444 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _456 = _446 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _458 = _404 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _460 = _452 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _462 = _454 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _464 = _456 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _466 = !_372;
    if (!_466)
    {
        float _468 = in.m_51.x;
        float _470 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _472 = _468 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _474 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[11].z, _102);
        float _476 = _474 * _470;
        float _478 = floor(_476);
        float _480 = -_478;
        float _482 = _476 + _480;
        _280 = _482;
    }
    float _484 = _280;
    float _486 = in.m_51.x;
    float _488 = _274 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _490 = in.m_51.y;
    float _492 = (*spvDescriptorSet0.vp_c8)._m0[32].z * (*spvDescriptorSet0.vp_c8)._m0[32].z;
    float _494 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _496 = fma((*spvDescriptorSet0.vp_c8)._m0[32].x, (*spvDescriptorSet0.vp_c8)._m0[32].x, _492);
    float _498 = _274 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _500 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _494);
    float _502 = _274 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _504 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[4].x, _498);
    float _506 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _500);
    float _508 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[6].x, _502);
    float _510 = -_152;
    float _512 = fma(_510, 5.0, 5.0);
    float _514 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[4].z, _504);
    float _516 = 1.0 / _458;
    float _518 = -_152;
    float _520 = fma(_518, 4.0, 4.0);
    float _522 = fma(_102, 0.5299999713897705078125, _512);
    float _524 = _486 * 6.283185482025146484375;
    float _526 = _514 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _528 = fma(_102, 0.4199999868869781494140625, _520);
    float _530 = fma(_102, 0.12999999523162841796875, _524);
    float _532 = _490 * 6.283185482025146484375;
    float _534 = _528 + _524;
    float _536 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[6].z, _508);
    float _538 = _530 * 0.15915493667125701904296875;
    float _540 = fma(_102, 0.37000000476837158203125, _532);
    float _542 = _522 + _532;
    float _544 = _536 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _546 = -_526;
    float _548 = _546 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _550 = _540 * 0.15915493667125701904296875;
    float _552 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[5].x, _488);
    float _554 = _542 * 0.15915493667125701904296875;
    float _556 = -_544;
    float _558 = _556 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _560 = rsqrt(_506);
    float _562 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[5].z, _552);
    float _564 = _534 * 0.15915493667125701904296875;
    float _566 = -_152;
    float _568 = _566 + 1.0;
    float _570 = fma(_102, 0.7200000286102294921875, _532);
    float _572 = _562 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _574 = _458 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _576 = _564 * 6.283185482025146484375;
    float _578 = sin(_576);
    float _580 = -_572;
    float _582 = _580 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _584 = _570 * 0.15915493667125701904296875;
    float _586 = _582 * _582;
    float _588 = _554 * 6.283185482025146484375;
    float _590 = sin(_588);
    float _592 = fma(_548, _548, _586);
    float _594 = _560 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _596 = _560 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _598 = fma(_558, _558, _592);
    float _600 = _594 * _594;
    float _602 = _578 * 0.100000001490116119384765625;
    float _604 = rsqrt(_598);
    float _606 = fma(_596, _596, _600);
    float _608 = _568 * _602;
    float _610 = _568 * _590;
    float _612 = rsqrt(_606);
    float _614 = in.m_61.x;
    float _616 = in.m_61.y;
    float _618 = in.m_61.z;
    float _620 = fma(_610, 0.0500000007450580596923828125, _608);
    float _622 = _620 * 0.15915493667125701904296875;
    float _624 = _548 * _604;
    float _626 = _558 * _604;
    float _628 = _582 * _604;
    float _630 = 1.0 / _450;
    float _632 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _634 = _624 * _632;
    float _636 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _638 = _626 * _636;
    float _640 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _642 = _628 * _640;
    float _644 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _646 = -_634;
    float _648 = fma(_626, _644, _646);
    float _650 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _652 = -_638;
    float _654 = fma(_628, _650, _652);
    float _656 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _658 = -_642;
    float _660 = fma(_624, _656, _658);
    float _662 = _550 * 6.283185482025146484375;
    float _664 = sin(_662);
    float _666 = _648 * _648;
    float _668 = _594 * _612;
    float _670 = _596 * _612;
    float _672 = _450 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _674 = fma(_654, _654, _666);
    float _676 = _516 * _618;
    float _678 = fma(_610, 0.0199999995529651641845703125, _608);
    float _680 = rsqrt(_496);
    float _682 = fma(_660, _660, _674);
    float _684 = _630 * _616;
    float _686 = 1.0 / _448;
    float _688 = _664 * 0.1500000059604644775390625;
    float _690 = _622 * 6.283185482025146484375;
    float _692 = sin(_690);
    float _694 = _680 * (*spvDescriptorSet0.vp_c8)._m0[32].z;
    float _696 = _448 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _698 = _668 * _694;
    float _700 = _622 * 6.283185482025146484375;
    float _702 = cos(_700);
    float _704 = fma(_686, _614, _678);
    float _706 = _680 * (*spvDescriptorSet0.vp_c8)._m0[32].x;
    float _708 = fma(_670, _706, _698);
    float _710 = rsqrt(_682);
    float _712 = _684 * _692;
    float _714 = _708 * _708;
    float _716 = _538 * 6.283185482025146484375;
    float _718 = sin(_716);
    float _720 = _684 * _702;
    float _722 = -_712;
    float _724 = fma(_704, _702, _722);
    float _726 = fma(_704, _692, _720);
    float _728 = _584 * 6.283185482025146484375;
    float _730 = sin(_728);
    float _732 = _654 * _710;
    float _734 = _648 * _710;
    float _736 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _726);
    float _738 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _724);
    float _740 = _628 * _732;
    float _742 = _672 * _736;
    float _744 = fma(_718, 0.449999988079071044921875, _688);
    float _746 = _660 * _710;
    float _748 = -_740;
    float _750 = fma(_624, _734, _748);
    float _752 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _676);
    float _754 = _696 * _738;
    float _756 = _742 * _750;
    float _758 = _574 * _752;
    float _760 = fma(_730, 0.100000001490116119384765625, _744);
    float _762 = _626 * _734;
    float _764 = fma(_754, _746, _756);
    float _766 = fma(_714, -0.699999988079071044921875, 1.0);
    float _768 = _760 + 1.5;
    float _770 = -_762;
    float _772 = fma(_628, _746, _770);
    float _774 = fma(_758, _626, _764);
    float _776 = _766 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _778 = _624 * _746;
    float _780 = _742 * _772;
    float _782 = _568 * _568;
    float _784 = _544 + _774;
    float _786 = -_778;
    float _788 = fma(_626, _732, _786);
    float _790 = fma(_754, _732, _780);
    float _792 = _782 * _768;
    float _794 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _796 = _784 + _794;
    float _798 = _742 * _788;
    float _800 = fma(_758, _624, _790);
    float _802 = _776 * _792;
    float _804 = fma(_574, _796, _784);
    float _806 = fma(_754, _734, _798);
    float _808 = _526 + _800;
    float _810 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[32].z, _804);
    float _812 = fma(_758, _628, _806);
    float _814 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _816 = _808 + _814;
    float _818 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _820 = _810 + _818;
    float _822 = _572 + _812;
    float _824 = fma(_696, _816, _808);
    float _826 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[32].x, _824);
    float _828 = _820 * _820;
    float _830 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _832 = _826 + _830;
    float _834 = fma(_832, _832, _828);
    float _836 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _838 = _822 + _836;
    float _840 = sqrt(_834);
    float _842 = fma(_672, _838, _822);
    float _844 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[32].y, _842);
    bool _846 = _840 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _848 = _842;
    float _850 = _822;
    float _852 = _742;
    float _854 = _810;
    float _856 = _798;
    float _858 = _802;
    float _860 = _832;
    if (!_846)
    {
        _848 = _826;
    }
    float _862 = _848;
    float _864 = _862;
    if (!_846)
    {
        _850 = _810;
    }
    float _866 = _850;
    float _868 = _866;
    if (!_846)
    {
        _852 = _844;
    }
    float _870 = _852;
    bool _872 = !_846;
    float _874 = _870;
    if (!_872)
    {
        float _876 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _878 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _880 = _840 + _878;
        float _882 = rsqrt(_834);
        float _884 = _880 * _876;
        float _886 = _844 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _888 = _884 * 0.15915493667125701904296875;
        float _890 = _888 * 6.283185482025146484375;
        float _892 = cos(_890);
        float _894 = _888 * 6.283185482025146484375;
        float _896 = sin(_894);
        float _898 = _892 + (-1.0);
        float _900 = fma(_896, _886, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _902 = _898 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _904 = _882 * _900;
        float _906 = fma(_844, _892, _902);
        float _908 = fma(_832, _904, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _910 = fma(_820, _904, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _874 = _906;
        _864 = _908;
        _868 = _910;
    }
    float _912 = _874;
    float _914 = _864;
    float _916 = _868;
    float _918 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _920 = _912 + _918;
    float _922 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _924 = _914 + _922;
    float _926 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _928 = _916 + _926;
    float _930 = _920 * _920;
    float _932 = fma(_924, _924, _930);
    float _934 = fma(_928, _928, _932);
    float _936 = rsqrt(_934);
    float _938 = _936 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _940 = _924 * _938;
    float _942 = _928 * _938;
    float _944 = _940 * _940;
    float _946 = _942 * _942;
    float _948 = _944 + _946;
    float _950 = sqrt(_948);
    bool _952 = _950 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _954 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _956 = _950 + _954;
    float _958 = _936;
    float _960 = _948;
    float _962 = _956;
    float _964 = _920;
    if (_952)
    {
        float _966 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _958 = _966;
    }
    float _968 = _958;
    if (_952)
    {
        float _970 = rsqrt(_948);
        _960 = _970;
    }
    float _972 = _960;
    if (_952)
    {
        float _974 = _956 * _968;
        _962 = _974;
    }
    float _976 = _962;
    if (_952)
    {
        float _978 = _976 * 0.15915493667125701904296875;
        _854 = _978;
    }
    float _980 = _854;
    float _982 = _928;
    if (_952)
    {
        float _984 = _980 * 6.283185482025146484375;
        float _986 = sin(_984);
        _982 = _986;
    }
    float _988 = _982;
    float _990 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _992 = precise::max(0.0, _990);
    float _994 = _968;
    float _996 = _992;
    if (_952)
    {
        float _998 = _980 * 6.283185482025146484375;
        float _1000 = cos(_998);
        _994 = _1000;
    }
    float _1002 = _994;
    float _1004 = -_938;
    float _1006 = -_992;
    float _1008 = fma(_920, _1004, _1006);
    if (_952)
    {
        float _1010 = _1008 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _964 = _1010;
    }
    float _1012 = _964;
    float _1014 = _988;
    float _1016 = _1012;
    if (_952)
    {
        float _1018 = fma(_988, _1012, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _856 = _1018;
    }
    float _1020 = _856;
    float _1022 = _1020;
    if (!_952)
    {
        _1014 = _940;
    }
    float _1024 = _1014;
    float _1026 = _1024;
    if (!_952)
    {
        _1016 = _1008;
    }
    float _1028 = _1016;
    float _1030 = _1028;
    float _1032 = _1002;
    if (_952)
    {
        float _1034 = _1002 + (-1.0);
        _996 = _1034;
    }
    float _1036 = _996;
    float _1038 = _1036;
    if (_952)
    {
        float _1040 = _972 * _1020;
        _858 = _1040;
    }
    float _1042 = _858;
    if (!_952)
    {
        _1022 = _944;
    }
    float _1044 = _1022;
    float _1046 = sqrt(_934);
    float _1048 = _1044;
    if (_952)
    {
        float _1050 = _1036 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _860 = _1050;
    }
    float _1052 = _860;
    if (_952)
    {
        float _1054 = _940 * _1042;
        _1026 = _1054;
    }
    float _1056 = _1026;
    if (!_952)
    {
        _1038 = _942;
    }
    float _1058 = _1038;
    float _1060 = _1058;
    if (_952)
    {
        float _1062 = _942 * _1042;
        _1060 = _1062;
    }
    float _1064 = _1060;
    if (_952)
    {
        float _1066 = fma(_1008, _1002, _1052);
        _1030 = _1066;
    }
    float _1068 = _1030;
    if (_952)
    {
        float _1070 = _1056 * _1056;
        _1048 = _1070;
    }
    float _1072 = _1048;
    if (!_952)
    {
        _1032 = _946;
    }
    float _1074 = _1032;
    float _1076 = _1074;
    if (_952)
    {
        float _1078 = _1064 * _1064;
        _1076 = _1078;
    }
    float _1080 = _1076;
    float _1082 = fma(_1068, _1068, _1072);
    float _1084 = _912 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1086 = _1082 + _1080;
    float _1088 = _912 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1090 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1092 = fma(_1046, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1090);
    float _1094 = precise::clamp(_1092, 0.0, 1.0);
    float _1096 = _912 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1098 = rsqrt(_1086);
    float _1100 = fma(_914, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1088);
    float _1102 = -_1094;
    float _1104 = _1102 + 1.0;
    float _1106 = fma(_914, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1096);
    float _1108 = fma(_914, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1084);
    float _1110 = fma(_916, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1100);
    float _1112 = _912 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1114 = fma(_916, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1106);
    float _1116 = abs(_1104);
    float _1118 = log2(_1116);
    float _1120 = _1110 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1122 = fma(_914, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1112);
    float _1124 = _1114 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1126 = fma(_916, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1108);
    float _1128 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1130 = fma(_916, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1122);
    float _1132 = _1120 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1134 = _1098 * _1056;
    float _1136 = _1098 * _1068;
    float _1138 = _1130 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1140 = _1124 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1142 = _1134 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1144 = _1098 * _1064;
    float _1146 = _1126 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1148 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1140);
    float _1150 = -_1142;
    float _1152 = fma(_1136, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1150);
    float _1154 = _1118 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1156 = -_1132;
    float _1158 = fma(_1156, _1128, 1.0);
    float _1160 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1148);
    float _1162 = -_1144;
    float _1164 = fma(_1162, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1152);
    float _1166 = _1124 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1168 = log2(_1158);
    float _1170 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1160);
    float _1172 = fma(_1164, -0.5, 0.5);
    float _1174 = _1124 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1176 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1166);
    float _1178 = fma(_1164, 0.5, 0.5);
    float _1180 = _1136 + 1.0;
    float _1182 = exp2(_1154);
    float _1184 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1174);
    float _1186 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1176);
    float _1188 = fma(_1178, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1190 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1184);
    float _1192 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1186);
    float _1194 = fma(_1178, _1188, -0.212114393711090087890625);
    float _1196 = 1.0 / _1170;
    float _1198 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1190);
    float _1200 = _1168 * 0.693147182464599609375;
    float _1202 = fma(_1178, _1194, 1.570728778839111328125);
    float _1204 = _1200 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1206 = sqrt(_1172);
    float _1208 = -_1136;
    float _1210 = fma(_1182, _1180, _1208);
    float _1212 = fma(_1210, 0.5, 0.5);
    float _1214 = _1192 * _1196;
    float _1216 = _1198 * _1196;
    float _1218 = fma(_1214, 0.5, 0.5);
    float _1220 = fma(_1216, -0.5, 0.5);
    float _1222 = _1206 * 0.636619746685028076171875;
    float3 _3630 = float3(_1218, _1220, _1204);
    float _1224 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3630, float3(0.0), isnan(_3630)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3630, float3(0.0), isnan(_3630)), level(0.0)).x;
    float3 _3641 = float3(_1218, _1220, _1204);
    float4 _1227 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3641, float3(0.0), isnan(_3641)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3641, float3(0.0), isnan(_3641)), level(0.0)).xyzw;
    float _1229 = _1227.x;
    float _1231 = _1227.y;
    float _1233 = _1227.z;
    float _1235 = _1227.w;
    float _1237 = -_1202;
    float _1239 = fma(_1222, _1237, 1.0);
    float2 _3663 = float2(_1239, _1212);
    float3 _1243 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3663, float2(0.0), isnan(_3663)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3663, float2(0.0), isnan(_3663)), level(0.0)).xyz;
    float _1245 = _1243.x;
    float _1247 = _1243.y;
    float _1249 = _1243.z;
    float _1251 = in.m_51.w;
    float _1253 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    out.m_63.x = _460;
    out.m_63.y = _462;
    out.m_63.z = _464;
    int _1255 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1257 = _1255 != 0;
    float _1259 = _1118 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1261 = _132 > 0.5;
    float _1263 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1265 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1263;
    float _1267 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1269 = _1267 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1271 = in.m_65.w;
    bool _1273 = _490 > 0.5;
    float _1275 = 1.0 / _1265;
    float _1277 = in.m_55.x;
    int _1279 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1281 = _1279 != 0;
    float _1283 = _486 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1285 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1287 = _1285 != 0;
    float _1289 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1291 = _1261 ? as_type<int>(_568) : as_type<int>(_152);
    float _1293 = 1.0 / _1269;
    int _1295 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1297 = _1295 != 0;
    float _1299 = -_1289;
    float _1301 = fma(_1283, 2.0, _1299);
    bool _1303 = _1251 > 0.5;
    float _1305 = _490 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1307 = _1273 ? as_type<int>(_568) : as_type<int>(_152);
    float _1309 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1311 = _484 + _1309;
    float _1313 = _1287 ? as_type<float>(_1291) : _152;
    float _1315 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1317 = _1281 ? as_type<float>(_1307) : _152;
    float _1319 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1321 = _484 + _1319;
    int _1323 = _1303 ? as_type<int>(_568) : as_type<int>(_152);
    float _1325 = _1253 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1327 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1329 = _1327 != 0;
    float _1331 = _1321 * _1275;
    int _1333 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1335 = _1333 != 0;
    float _1337 = _1311 * _1293;
    int _1339 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1341 = _1339 != 0;
    out.m_67.w = _1271;
    float _1343 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1345 = _1341 ? as_type<float>(_1323) : _152;
    float _1347 = -_102;
    float _1349 = fma(_1347, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1301);
    float _1351 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1353 = _1315 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1355 = fma(_1345, _1325, -0.5);
    float _1357 = fma(_1305, -2.0, _1351);
    float _1359 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1361 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1359;
    float _1363 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1365 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1363;
    float _1367 = fma(_1313, _1353, -0.5);
    float _1369 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1371 = _1369 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1373 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1375 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1373;
    float _1377 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1379 = _1377 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1381 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1383 = _1381 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1385 = _1343 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1387 = fma(_1371, _1337, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1389 = fma(_1379, _1337, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1391 = fma(_1383, _1337, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1393 = fma(_1385, _1317, -0.5);
    bool _1395 = _484 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1397 = isnan(_484);
    bool _1399 = _1395 || _1397;
    bool _1401 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1403 = _1399 || _1401;
    float _1405 = float(_1403);
    float _1407 = fma(_1361, _1331, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1409 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1411 = _1275;
    float _1413 = _1311;
    float _1415 = _1277;
    float _1417 = _1409;
    float _1419 = _1407;
    int _1421 = as_type<int>(_1393);
    bool _1423 = _1341;
    if (!_1297)
    {
        _1411 = _1277;
    }
    float _1425 = _1411;
    float _1427 = -_1405;
    float _1429 = _1427 + 1.0;
    bool _1431 = _484 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1433 = isnan(_484);
    bool _1435 = _1431 || _1433;
    bool _1437 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1439 = _1435 || _1437;
    float _1441 = float(_1439);
    float _1443 = fma(_1365, _1331, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _1445 = _484 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1447 = isnan(_484);
    bool _1449 = _1445 || _1447;
    bool _1451 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1453 = _1449 || _1451;
    float _1455 = float(_1453);
    float _1457 = fma(_1375, _1331, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1459 = _1425;
    float _1461 = _1429;
    int _1463 = as_type<int>(_1457);
    if (!_1297)
    {
        _1413 = _1425;
    }
    float _1465 = _1413;
    float _1467 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1469 = _1465;
    if (_1297)
    {
        _1459 = _1277;
    }
    float _1471 = _1459;
    float _1473 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1409);
    float _1475 = _1471;
    if (_1257)
    {
        _1415 = _486;
    }
    float _1477 = _1415;
    float _1479 = _1455 * _1429;
    float _1481 = -_1455;
    float _1483 = _1481 + 1.0;
    float _1485 = _1477;
    if (!_1257)
    {
        _1485 = _132;
    }
    float _1487 = _1485;
    float _1489 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1467);
    if (!_1257)
    {
        _1461 = _490;
    }
    float _1491 = _1461;
    float _1493 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1473);
    float _1495 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1357);
    float _1497 = _1441 * _1483;
    float _1499 = _1491;
    if (!_1257)
    {
        _1417 = _1491;
    }
    float _1501 = _1417;
    float _1503 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1505 = _1487 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _1507 = as_type<int>(_1505);
    float _1509 = _1501;
    if (_1257)
    {
        _1499 = _490;
    }
    float _1511 = _1499;
    float _1513 = -_1495;
    float _1515 = fma(_1493, _1393, _1513);
    float _1517 = _1407 * _1497;
    float _1519 = _1443 * _1497;
    float _1521 = _1457 * _1497;
    float _1523 = -_1503;
    float _1525 = fma(_1505, 2.0, _1523);
    float _1527 = _1517;
    float _1529 = _1511;
    if (_1329)
    {
        float _1531 = -_1471;
        float _1533 = _1531 + 1.0;
        _1507 = as_type<int>(_1533);
    }
    int _1535 = _1507;
    if (_1297)
    {
        float _1537 = -_1471;
        float _1539 = _1537 + 1.0;
        _1463 = as_type<int>(_1539);
    }
    int _1541 = _1463;
    if (!_1329)
    {
        _1419 = _1471;
    }
    float _1543 = _1419;
    float _1545 = _1543;
    if (_1335)
    {
        float _1547 = -_1471;
        float _1549 = _1547 + 1.0;
        _1421 = as_type<int>(_1549);
    }
    int _1551 = _1421;
    if (_1297)
    {
        bool _1553 = _486 > 0.5;
        _1423 = _1553;
    }
    bool _1555 = _1423;
    float _1557 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_1329)
    {
        float _1559 = _1261 ? as_type<float>(_1535) : _1471;
        _1545 = _1559;
    }
    float _1561 = _1545;
    float _1563 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1489);
    float _1565 = -_102;
    float _1567 = fma(_1565, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1525);
    if (_1257)
    {
        _1509 = _486;
    }
    float _1569 = _1509;
    float _1571 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (_1297)
    {
        float _1573 = _1555 ? as_type<float>(_1541) : _1471;
        _1469 = _1573;
    }
    float _1575 = _1469;
    float _1577 = -_1441;
    float _1579 = _1577 + 1.0;
    float _1581 = _1569 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1583 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (_1335)
    {
        float _1585 = _1273 ? as_type<float>(_1551) : _1471;
        _1475 = _1585;
    }
    float _1587 = _1475;
    float _1589 = fma(_1579, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1521);
    float _1591 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1593 = fma(_1579, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1519);
    float _1595 = -_1571;
    float _1597 = fma(_1581, 2.0, _1595);
    float _1599 = fma(_1569, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1583);
    float _1601 = fma(_1579, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1517);
    float _1603 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (!_1257)
    {
        _1527 = _132;
    }
    float _1605 = _1527;
    float _1607 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1609 = _1605;
    if (_1257)
    {
        _150 = _1511;
    }
    float _1611 = _150;
    float _1613 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    if (_1257)
    {
        _1609 = _1511;
    }
    float _1615 = _1609;
    float _1617 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1607);
    if (!_1257)
    {
        _1529 = _486;
    }
    float _1619 = _1529;
    float _1621 = fma(_1611, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1603);
    float _1623 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1613);
    float _1625 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1627 = _1557 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1629 = fma(_1387, _1479, _1601);
    float _1631 = _1591 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1633 = fma(_1627, _1575, -0.5);
    float _1635 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1617);
    float _1637 = exp2(_1259);
    float _1639 = fma(_1389, _1479, _1593);
    float _1641 = fma(_1391, _1479, _1589);
    float _1643 = fma(_1631, _1561, -0.5);
    float _1645 = fma(_1635, _1633, _1349);
    float _1647 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1649 = _1615 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1651 = _1124 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1653 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1655 = _1619 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1657 = fma(_1649, -2.0, _1647);
    float _1659 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1651);
    float _1661 = _1625 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1663 = fma(_1655, -2.0, _1653);
    float _1665 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1621);
    float _1667 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1657);
    float _1669 = -_1637;
    float _1671 = _1669 + 1.0;
    float _1673 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1659);
    float _1675 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1599);
    float _1677 = -_102;
    float _1679 = fma(_1677, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1597);
    float _1681 = fma(_1405, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1639);
    float _1683 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1623);
    float _1685 = _1515 + 0.5;
    float _1687 = fma(_1661, _1587, -0.5);
    float _1689 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1663);
    float _1691 = _1671 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1693 = fma(_1405, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1641);
    float _1695 = -_1667;
    float _1697 = fma(_1665, _1355, _1695);
    float _1699 = _1681 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1701 = _1645 + 0.5;
    float _1703 = fma(_1675, _1643, _1679);
    float _1705 = fma(_1683, _1687, _1567);
    float _1707 = -_1689;
    float _1709 = fma(_1563, _1367, _1707);
    float _1711 = _1693 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1713 = fma(_1405, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1629);
    float _1715 = _1697 + 0.5;
    float _1717 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1673);
    float _1719 = _1699 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1721 = _1705 + 0.5;
    float _1723 = _1709 + 0.5;
    float _1725 = _1713 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1727 = _1717 + _1170;
    float _1729 = _1703 + 0.5;
    out.m_69.x = _1721;
    out.m_69.y = _1723;
    float _1731 = _1725 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1733 = _1711 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1735 = _1727 * 0.5;
    float _1737 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_71.x = _1701;
    out.m_71.y = _1685;
    out.m_71.z = _1729;
    out.m_71.w = _1715;
    out.m_73.x = _1731;
    out.m_73.y = _1719;
    out.m_73.z = _1733;
    out.gl_Position.x = _1192;
    out.gl_Position.y = _1198;
    out.gl_Position.z = _1717;
    out.gl_Position.w = _1170;
    out.m_75.z = _1735;
    out.m_75.w = _1170;
    out.m_49.x = _1737;
    float _1739 = _1691 * _1224;
    float _1741 = -_1691;
    float _1743 = _1741 + 1.0;
    float _1745 = _1235 * _1739;
    float _1747 = _1249 * _1739;
    float _1749 = fma(_1245, _1745, _1229);
    float _1751 = fma(_1247, _1745, _1231);
    float _1753 = _1235 * _1743;
    float _1755 = fma(_1235, _1747, _1233);
    out.m_77.x = _1749;
    out.m_77.y = _1751;
    out.m_77.z = _1755;
    out.m_77.w = _1753;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

