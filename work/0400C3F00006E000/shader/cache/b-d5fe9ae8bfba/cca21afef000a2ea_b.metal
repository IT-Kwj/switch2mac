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
    float4 m_53 [[user(locn0)]];
    float4 m_65 [[user(locn1)]];
    float4 m_67 [[user(locn2)]];
    float4 m_71 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_59 [[user(locn5)]];
    float4 m_69 [[user(locn6)]];
    float4 m_73 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_63 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_61 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
    float4 m_55 [[attribute(9)]];
    float4 m_57 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1490 = false;
    bool _1046 = false;
    bool _866 = false;
    bool _698 = false;
    bool _464 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_42.w;
    float _89 = trunc(_87);
    int _92 = int(_89);
    bool _96 = _92 >= 1;
    float _98 = 0.0;
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _100 = _98;
    float _102 = _100;
    if (!_96)
    {
        out.m_45.x = 0.0;
    }
    int _104 = 0;
    if (!_96)
    {
        float _106 = _100 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3452 = as_type<float>(_108);
        out.gl_Position.z = _3452;
    }
    if (!_96)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _112 = in.m_47.w;
    bool _114 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_112);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = -_112;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _128 = _126;
    float _130 = _126;
    if (_122)
    {
        float _132 = float(_92);
        _102 = _132;
    }
    float _134 = _102;
    bool _136 = _126 >= _134;
    bool _138 = !_122;
    bool _140 = _136 || _138;
    float _142 = _134;
    if (_140)
    {
        _142 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _144 = _142;
    if (_140)
    {
        out.m_45.x = 0.0;
    }
    if (_140)
    {
        float _146 = _144 * 5.0;
        _110 = as_type<int>(_146);
    }
    int _148 = _110;
    if (_140)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3523 = as_type<float>(_148);
        out.gl_Position.z = _3523;
    }
    if (_140)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _150 = in.m_49.w;
    float _152 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _154 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _156 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _158 = _154 || _156;
    bool _160 = isnan(1.0);
    bool _162 = _158 || _160;
    float _164 = in.m_47.x;
    float _166 = in.m_47.y;
    float _168 = in.m_47.z;
    float _170 = in.m_42.x;
    float _172 = in.m_42.y;
    float _174 = in.m_42.z;
    float _176 = 0.0;
    float _178 = _152;
    if (!_162)
    {
        float _180 = _152 * _152;
        float _182 = _180 * 0.5;
        _176 = _182;
    }
    float _184 = _176;
    float _186 = _184;
    if (!_162)
    {
        float _188 = _184 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _188;
    }
    float _190 = _186;
    bool _192 = !_162;
    float _194 = _190;
    float _196 = _166;
    float _198 = _164;
    if (!_192)
    {
        float _200 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = log2(_200);
        float _204 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _206 = _204 + 1.0;
        float _208 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = _152 * _202;
        float _212 = 1.0 / _206;
        float _214 = _208 * 0.693147182464599609375;
        float _216 = exp2(_210);
        float _218 = 1.0 / _214;
        float _220 = _216 + (-1.0);
        float _222 = -_220;
        float _224 = fma(_222, _218, _152);
        float _226 = _224 * _212;
        float _228 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _194 = _228;
    }
    float _230 = _194;
    float _232 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _234 = !_162;
    float _236 = _232;
    float _238 = _230;
    if (!_234)
    {
        float _240 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _242 = log2(_240);
        float _244 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _246 = _244 + 1.0;
        float _248 = 1.0 / _246;
        float _250 = _152 * _242;
        float _252 = exp2(_250);
        float _254 = -_252;
        float _256 = _254 + 1.0;
        float _258 = _256 * _248;
        _178 = _258;
    }
    float _260 = _178;
    float _262 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _264 = _232 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _266 = _232 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _268 = _232 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _270 = _260;
    if (!_162)
    {
        float _272 = _126 * _126;
        float _274 = _272 * 0.5;
        _236 = _274;
    }
    float _276 = _236;
    float _278 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[8].x, _264);
    float _280 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[8].y, _266);
    float _282 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[8].z, _268);
    float _284 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_162)
    {
        float _286 = _276 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _238 = _286;
    }
    float _288 = _238;
    bool _290 = !_162;
    float _292 = _288;
    if (!_290)
    {
        float _294 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _296 = log2(_294);
        float _298 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _300 = _298 + 1.0;
        float _302 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _304 = _126 * _296;
        float _306 = 1.0 / _300;
        float _308 = _302 * 0.693147182464599609375;
        float _310 = exp2(_304);
        float _312 = 1.0 / _308;
        float _314 = _310 + (-1.0);
        float _316 = -_314;
        float _318 = fma(_316, _312, _126);
        float _320 = _318 * _306;
        float _322 = _320 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _292 = _322;
    }
    float _324 = _292;
    float _326 = _324 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _328 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[10].x, _278);
    float _330 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[10].y, _280);
    float _332 = _324 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _334 = _326 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _336 = _326 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _338 = _326 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _340 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[10].z, _282);
    float _342 = fma(_332, (*spvDescriptorSet0.vp_c10)._m0[8].x, _334);
    float _344 = fma(_332, (*spvDescriptorSet0.vp_c10)._m0[8].y, _336);
    float _346 = fma(_332, (*spvDescriptorSet0.vp_c10)._m0[8].z, _338);
    float _348 = _324 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _350 = fma(_260, _164, _328);
    float _352 = fma(_260, _166, _330);
    float _354 = fma(_260, _168, _340);
    float _356 = fma(_348, (*spvDescriptorSet0.vp_c10)._m0[10].x, _342);
    float _358 = fma(_348, (*spvDescriptorSet0.vp_c10)._m0[10].y, _344);
    float _360 = fma(_348, (*spvDescriptorSet0.vp_c10)._m0[10].z, _346);
    if (!_162)
    {
        _270 = _126;
    }
    float _362 = _270;
    bool _364 = !_162;
    float _366 = _362;
    if (!_364)
    {
        float _368 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _370 = log2(_368);
        float _372 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _374 = _372 + 1.0;
        float _376 = 1.0 / _374;
        float _378 = _126 * _370;
        float _380 = exp2(_378);
        float _382 = -_380;
        float _384 = _382 + 1.0;
        float _386 = _384 * _376;
        _366 = _386;
    }
    float _388 = _366;
    float _390 = fma(_388, _166, _358);
    float _392 = fma(_388, _164, _356);
    bool _394 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _396 = fma(_350, _150, _170);
    float _398 = -_390;
    float _400 = _352 + _398;
    float _402 = -_392;
    float _404 = _350 + _402;
    float _406 = fma(_388, _168, _360);
    float _408 = fma(_352, _150, _172);
    float _410 = _400 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _412 = _400 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _414 = _400 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _416 = -_406;
    float _418 = _354 + _416;
    float _420 = fma(_404, (*spvDescriptorSet0.vp_c10)._m0[4].x, _410);
    float _422 = fma(_404, (*spvDescriptorSet0.vp_c10)._m0[5].x, _412);
    float _424 = fma(_404, (*spvDescriptorSet0.vp_c10)._m0[6].x, _414);
    float _426 = fma(_354, _150, _174);
    float _428 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[4].z, _420);
    float _430 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[5].z, _422);
    float _432 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[6].z, _424);
    bool _434 = !_394;
    float _436 = _430;
    float _438 = _428;
    float _440 = _432;
    float _442 = _432;
    float _444 = _428;
    float _462;
    if (!_434)
    {
        float _446 = in.m_51.x;
        float _448 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _450 = _446 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _452 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[12].x, _126);
        float _454 = _452 * _448;
        float _456 = floor(_454);
        float _458 = -_456;
        float _460 = _454 + _458;
        _462 = _460;
        _464 = true;
    }
    else
    {
        float _466 = float(_92);
        float _468 = 1.0 / _466;
        float _470 = _126 * _468;
        _462 = _470;
    }
    _464 = false;
    float _472 = _462;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _476 = _472 + _474;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _480 = _472 + _478;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _482;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _488 = _486 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _490;
    float _494 = 1.0 / _484;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _498 = _472 + _496;
    bool _500 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _502 = isnan(_472);
    bool _504 = _500 || _502;
    bool _506 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _508 = _504 || _506;
    float _510 = float(_508);
    bool _512 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _514 = 1.0 / _488;
    bool _516 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _518 = isnan(_472);
    bool _520 = _516 || _518;
    bool _522 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _524 = _520 || _522;
    float _526 = float(_524);
    float _528 = 1.0 / _492;
    float _530 = _476 * _494;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _532;
    float _536 = fma(_534, _530, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _538 = _480 * _514;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _542 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _540;
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _544;
    float _548 = fma(_542, _530, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _550 = fma(_546, _530, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _552 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _554 = isnan(_472);
    bool _556 = _552 || _554;
    bool _558 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _560 = _556 || _558;
    float _562 = float(_560);
    float _564 = _498 * _528;
    bool _566 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _568 = isnan(_472);
    bool _570 = _566 || _568;
    bool _572 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _574 = _570 || _572;
    float _576 = float(_574);
    float _578 = -_526;
    float _580 = _578 + 1.0;
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _584 = _582 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _586 = -_576;
    float _588 = _586 + 1.0;
    float _590 = _576 * _580;
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _594 = _592 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _598 = _596 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _600 = _562 * _588;
    float _602 = -_562;
    float _604 = _602 + 1.0;
    float _606 = fma(_584, _538, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _608 = fma(_594, _538, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _610 = fma(_598, _538, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _612 = _510 * _604;
    float _614 = in.m_49.x;
    float _616 = in.m_49.y;
    float _618 = in.m_49.z;
    float _620 = _536 * _612;
    float _622 = _548 * _612;
    float _624 = _550 * _612;
    float _626 = -_510;
    float _628 = _626 + 1.0;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _632 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _630;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _636 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _634;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _638;
    float _642 = fma(_628, (*spvDescriptorSet0.vp_c9)._m0[143].x, _620);
    float _644 = fma(_628, (*spvDescriptorSet0.vp_c9)._m0[143].y, _622);
    float _646 = fma(_628, (*spvDescriptorSet0.vp_c9)._m0[143].z, _624);
    float _648 = fma(_632, _564, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _650 = fma(_636, _564, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _652 = fma(_640, _564, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _654 = fma(_606, _600, _642);
    float _656 = fma(_608, _600, _644);
    float _658 = fma(_610, _600, _646);
    float _660 = fma(_648, _590, _654);
    float _662 = fma(_650, _590, _656);
    float _664 = fma(_652, _590, _658);
    float _666 = fma(_526, (*spvDescriptorSet0.vp_c9)._m0[146].x, _660);
    float _668 = fma(_526, (*spvDescriptorSet0.vp_c9)._m0[146].y, _662);
    float _670 = fma(_526, (*spvDescriptorSet0.vp_c9)._m0[146].z, _664);
    float _672 = _666 * _614;
    float _674 = _668 * _616;
    float _676 = _670 * _618;
    bool _678 = !_512;
    float _696;
    if (!_678)
    {
        float _680 = in.m_51.x;
        float _682 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _684 = _680 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _686 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[11].x, _126);
        float _688 = _686 * _682;
        float _690 = floor(_688);
        float _692 = -_690;
        float _694 = _688 + _692;
        _696 = _694;
        _698 = true;
    }
    else
    {
        float _700 = float(_92);
        float _702 = 1.0 / _700;
        float _704 = _126 * _702;
        _696 = _704;
    }
    _698 = false;
    float _706 = _696;
    float _708 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _710 = _706 + _708;
    bool _712 = _706 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _714 = isnan(_706);
    bool _716 = _712 || _714;
    bool _718 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _720 = _716 || _718;
    float _722 = float(_720);
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _726 = _706 + _724;
    bool _728 = _706 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _730 = isnan(_706);
    bool _732 = _728 || _730;
    bool _734 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _736 = _732 || _734;
    float _738 = float(_736);
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _740;
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _746 = _744 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _748 = _706 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _750 = isnan(_706);
    bool _752 = _748 || _750;
    bool _754 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _756 = _752 || _754;
    float _758 = float(_756);
    float _760 = -_722;
    float _762 = _760 + 1.0;
    float _764 = 1.0 / _746;
    float _766 = _758 * _762;
    float _768 = -_758;
    float _770 = _768 + 1.0;
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _774 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _772;
    bool _776 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _778 = 1.0 / _742;
    float _780 = _738 * _770;
    float _782 = -_738;
    float _784 = _782 + 1.0;
    float _786 = _726 * _764;
    float _788 = _710 * _778;
    float _790 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _792 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _790;
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _796 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _794;
    float _798 = fma(_774, _788, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _800 = fma(_792, _788, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _802 = fma(_796, _788, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _804 = _798 * _780;
    float _806 = _800 * _780;
    float _808 = _802 * _780;
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _812 = _810 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _816 = _814 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _820 = _818 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _822 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[107].x, _804);
    float _824 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[107].y, _806);
    float _826 = fma(_812, _786, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _828 = fma(_816, _786, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _830 = fma(_820, _786, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _832 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[107].z, _808);
    float _834 = fma(_826, _766, _822);
    float _836 = fma(_828, _766, _824);
    float _838 = fma(_830, _766, _832);
    float _840 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[109].x, _834);
    float _842 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[109].y, _836);
    float _844 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[109].z, _838);
    bool _846 = !_776;
    float _864;
    if (!_846)
    {
        float _848 = in.m_51.x;
        float _850 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _852 = _848 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _854 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[11].y, _126);
        float _856 = _854 * _850;
        float _858 = floor(_856);
        float _860 = -_858;
        float _862 = _856 + _860;
        _864 = _862;
        _866 = true;
    }
    else
    {
        float _868 = float(_92);
        float _870 = 1.0 / _868;
        float _872 = _126 * _870;
        _864 = _872;
    }
    _866 = false;
    float _874 = _864;
    float _876 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _878 = _874 + _876;
    float _880 = _840 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _882 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _884 = _882 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _886 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _888 = _886 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _890 = _874 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _892 = isnan(_874);
    bool _894 = _890 || _892;
    bool _896 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _898 = _894 || _896;
    float _900 = float(_898);
    float _902 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _904 = _902 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _906 = _874 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _908 = isnan(_874);
    bool _910 = _906 || _908;
    bool _912 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _914 = _910 || _912;
    float _916 = float(_914);
    float _918 = 1.0 / _884;
    float _920 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _922 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _920;
    float _924 = -_900;
    float _926 = _924 + 1.0;
    bool _928 = _874 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _930 = isnan(_874);
    bool _932 = _928 || _930;
    bool _934 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _936 = _932 || _934;
    float _938 = float(_936);
    float _940 = _842 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _942 = _844 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _944 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _946 = 1.0 / _888;
    float _948 = 1.0 / _904;
    float _950 = _922 * _918;
    float _952 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _954 = _952 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _956 = _916 * _926;
    float _958 = -_916;
    float _960 = _958 + 1.0;
    float _962 = fma(_950, _878, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _964 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _966 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _964;
    float _968 = _938 * _960;
    float _970 = _954 * _946;
    float _972 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _974 = _874 + _972;
    bool _976 = _874 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _978 = isnan(_874);
    bool _980 = _976 || _978;
    bool _982 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _984 = _980 || _982;
    float _986 = float(_984);
    float _988 = _962 * _968;
    float _990 = -_938;
    float _992 = _990 + 1.0;
    float _994 = fma(_970, _974, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _996 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _998 = _874 + _996;
    float _1000 = _966 * _948;
    float _1002 = -_986;
    float _1004 = _1002 + 1.0;
    float _1006 = fma(_992, (*spvDescriptorSet0.vp_c9)._m0[115].x, _988);
    float _1008 = _880 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1010 = fma(_1000, _998, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1012 = _900 * _1004;
    float _1014 = fma(_994, _956, _1006);
    float _1016 = fma(_1010, _1012, _1014);
    float _1018 = _942 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1020 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1016);
    float _1022 = _940 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1024 = _1020 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _1008;
    out.m_53.y = _1022;
    out.m_53.z = _1018;
    out.m_53.w = _1024;
    bool _1026 = !_944;
    float _1044;
    if (!_1026)
    {
        float _1028 = in.m_51.x;
        float _1030 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1032 = _1028 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1034 = fma(_1032, (*spvDescriptorSet0.vp_c9)._m0[11].z, _126);
        float _1036 = _1034 * _1030;
        float _1038 = floor(_1036);
        float _1040 = -_1038;
        float _1042 = _1036 + _1040;
        _1044 = _1042;
        _1046 = true;
    }
    else
    {
        float _1048 = float(_92);
        float _1050 = 1.0 / _1048;
        float _1052 = _126 * _1050;
        _1044 = _1052;
    }
    _1046 = false;
    float _1054 = _1044;
    float _1056 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1058 = _1054 + _1056;
    float _1060 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1062 = _1054 + _1060;
    float _1064 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1066 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1064;
    float _1068 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1070 = _1068 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1072 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1074 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _1072;
    float _1076 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _1078 = _1076 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _1080 = 1.0 / _1066;
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1084 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1082;
    float _1086 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1088 = _1086 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1090 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1092 = _1054 + _1090;
    float _1094 = 1.0 / _1070;
    bool _1096 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1098 = 1.0 / _1074;
    float _1100 = -(*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _1102 = (*spvDescriptorSet0.vp_c9)._m0[130].w + _1100;
    float _1104 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1106 = _1054 + _1104;
    float _1108 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1110 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1108;
    float _1112 = _1106 * _1080;
    float _1114 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1116 = _1054 + _1114;
    float _1118 = 1.0 / _1084;
    float _1120 = _1092 * _1094;
    bool _1122 = _1054 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1124 = isnan(_1054);
    bool _1126 = _1122 || _1124;
    bool _1128 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1130 = _1126 || _1128;
    float _1132 = float(_1130);
    float _1134 = -_1132;
    float _1136 = _1134 + 1.0;
    float _1138 = 1.0 / _1088;
    float _1140 = _1116 * _1098;
    bool _1142 = _1054 >= (*spvDescriptorSet0.vp_c9)._m0[130].w;
    bool _1144 = isnan(_1054);
    bool _1146 = _1142 || _1144;
    bool _1148 = isnan((*spvDescriptorSet0.vp_c9)._m0[130].w);
    bool _1150 = _1146 || _1148;
    float _1152 = float(_1150);
    float _1154 = -_1152;
    float _1156 = _1154 + 1.0;
    float _1158 = 1.0 / _1078;
    float _1160 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _1162 = _1054 + _1160;
    float _1164 = _1058 * _1118;
    bool _1166 = _1054 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _1168 = isnan(_1054);
    bool _1170 = _1166 || _1168;
    bool _1172 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _1174 = _1170 || _1172;
    float _1176 = float(_1174);
    float _1178 = fma(_1110, _1164, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1180 = 1.0 / _1102;
    float _1182 = _1062 * _1138;
    float _1184 = _1176 * _1156;
    bool _1186 = _1054 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1188 = isnan(_1054);
    bool _1190 = _1186 || _1188;
    bool _1192 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1194 = _1190 || _1192;
    float _1196 = float(_1194);
    float _1198 = -_1176;
    float _1200 = _1198 + 1.0;
    bool _1202 = _1054 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1204 = isnan(_1054);
    bool _1206 = _1202 || _1204;
    bool _1208 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1210 = _1206 || _1208;
    float _1212 = float(_1210);
    float _1214 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1216 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1214;
    float _1218 = _1162 * _1158;
    float _1220 = -(*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _1222 = _1054 + _1220;
    float _1224 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1226 = _1224 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1228 = _1196 * _1200;
    float _1230 = fma(_1216, _1112, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1232 = -_1196;
    float _1234 = _1232 + 1.0;
    float _1236 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1238 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1236;
    float _1240 = _1222 * _1180;
    float _1242 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1244 = _1242 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1246 = fma(_1238, _1112, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1248 = fma(_1226, _1120, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1250 = _1132 * _1234;
    float _1252 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1254 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1252;
    float _1256 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1258 = _1256 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1260 = fma(_1244, _1120, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1262 = fma(_1254, _1112, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _1264 = _1054 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1266 = isnan(_1054);
    bool _1268 = _1264 || _1266;
    bool _1270 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1272 = _1268 || _1270;
    float _1274 = float(_1272);
    float _1276 = fma(_1258, _1120, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    bool _1278 = _1054 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1280 = isnan(_1054);
    bool _1282 = _1278 || _1280;
    bool _1284 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1286 = _1282 || _1284;
    float _1288 = float(_1286);
    float _1290 = _1274 * _1136;
    bool _1292 = _1054 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1294 = isnan(_1054);
    bool _1296 = _1292 || _1294;
    bool _1298 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1300 = _1296 || _1298;
    float _1302 = float(_1300);
    float _1304 = -_1288;
    float _1306 = _1304 + 1.0;
    float _1308 = -_1274;
    float _1310 = _1308 + 1.0;
    float _1312 = _1302 * _1306;
    float _1314 = _1212 * _1310;
    float _1316 = -_1212;
    float _1318 = _1316 + 1.0;
    float _1320 = -_1302;
    float _1322 = _1320 + 1.0;
    float _1324 = _1230 * _1312;
    float _1326 = _1246 * _1312;
    float _1328 = _1262 * _1312;
    float _1330 = _1288 * _1318;
    float _1332 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1334 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1332;
    float _1336 = fma(_1322, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1324);
    float _1338 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1340 = _1338 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1342 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1344 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1342;
    float _1346 = fma(_1322, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1326);
    float _1348 = fma(_1322, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1328);
    float _1350 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1352 = _1350 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1354 = fma(_1334, _1164, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1356 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1358 = _1356 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1360 = fma(_1248, _1330, _1336);
    float _1362 = fma(_1344, _1164, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1364 = fma(_1352, _1182, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1366 = fma(_1340, _1182, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1368 = fma(_1260, _1330, _1346);
    float _1370 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1372 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1370;
    float _1374 = fma(_1276, _1330, _1348);
    float _1376 = fma(_1354, _1314, _1360);
    float _1378 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1380 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1378;
    float _1382 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1384 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1382;
    float _1386 = fma(_1358, _1182, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1388 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _1390 = _1388 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1392 = fma(_1372, _1140, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1394 = fma(_1362, _1314, _1368);
    float _1396 = fma(_1178, _1314, _1374);
    float _1398 = fma(_1366, _1290, _1376);
    float _1400 = fma(_1380, _1140, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1402 = fma(_1384, _1140, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1404 = fma(_1390, _1218, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    float _1406 = fma(_1364, _1290, _1394);
    float _1408 = fma(_1386, _1290, _1396);
    float _1410 = fma(_1392, _1250, _1398);
    float _1412 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _1414 = _1412 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1416 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _1418 = _1416 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1420 = fma(_1414, _1218, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _1422 = fma(_1400, _1250, _1406);
    float _1424 = -(*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1426 = (*spvDescriptorSet0.vp_c9)._m0[130].x + _1424;
    float _1428 = -(*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1430 = (*spvDescriptorSet0.vp_c9)._m0[130].y + _1428;
    float _1432 = fma(_1418, _1218, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    float _1434 = fma(_1402, _1250, _1408);
    float _1436 = -(*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1438 = (*spvDescriptorSet0.vp_c9)._m0[130].z + _1436;
    float _1440 = fma(_1404, _1228, _1410);
    float _1442 = fma(_1426, _1240, (*spvDescriptorSet0.vp_c9)._m0[129].x);
    float _1444 = fma(_1430, _1240, (*spvDescriptorSet0.vp_c9)._m0[129].y);
    float _1446 = fma(_1420, _1228, _1422);
    float _1448 = fma(_1438, _1240, (*spvDescriptorSet0.vp_c9)._m0[129].z);
    float _1450 = fma(_1432, _1228, _1434);
    float _1452 = fma(_1442, _1184, _1440);
    float _1454 = fma(_1444, _1184, _1446);
    float _1456 = fma(_1448, _1184, _1450);
    float _1458 = fma(_1152, (*spvDescriptorSet0.vp_c9)._m0[130].x, _1452);
    float _1460 = fma(_1152, (*spvDescriptorSet0.vp_c9)._m0[130].y, _1454);
    float _1462 = fma(_1152, (*spvDescriptorSet0.vp_c9)._m0[130].z, _1456);
    bool _1464 = !_1096;
    int _1466 = as_type<int>(_1184);
    float _1468 = _1444;
    bool _1470 = _1096;
    float _1488;
    if (!_1464)
    {
        float _1472 = in.m_51.x;
        float _1474 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1476 = _1472 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1478 = fma(_1476, (*spvDescriptorSet0.vp_c9)._m0[11].w, _126);
        float _1480 = _1478 * _1474;
        float _1482 = floor(_1480);
        float _1484 = -_1482;
        float _1486 = _1480 + _1484;
        _1466 = as_type<int>(_1482);
        _1488 = _1486;
        _1490 = true;
    }
    else
    {
        float _1492 = float(_92);
        float _1494 = 1.0 / _1492;
        float _1496 = _126 * _1494;
        _1488 = _1496;
    }
    _1490 = false;
    int _1498 = _1466;
    float _1500 = _1488;
    float _1502 = in.m_55.x;
    float _1504 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1506 = log2(_1504);
    float _1508 = _408 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1510 = in.m_51.x;
    int _1512 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1514 = _1512 != 0;
    float _1516 = _672 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1518 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1520 = _1518 != 0;
    float _1522 = in.m_51.z;
    int _1524 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1526 = _1524 != 0;
    float _1528 = fma(_396, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1508);
    int _1530 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1532 = _1530 != 0;
    float _1534 = in.m_51.y;
    float _1536 = fma(_426, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1528);
    float _1538 = in.m_55.y;
    float _1540 = _126 * _1506;
    float _1542 = in.m_51.w;
    float _1544 = _676 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1546 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1548 = _1498;
    float _1550 = _1502;
    if (_1514)
    {
        float _1552 = -_1502;
        float _1554 = _1552 + 1.0;
        _1548 = as_type<int>(_1554);
    }
    int _1556 = _1548;
    if (!_1514)
    {
        _1468 = _1502;
    }
    float _1558 = _1468;
    float _1560 = in.m_57.y;
    float _1562 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1564 = _1558;
    if (_1514)
    {
        bool _1566 = _1510 > 0.5;
        _1470 = _1566;
    }
    bool _1568 = _1470;
    float _1570 = _1510 * 2.0;
    float _1572 = exp2(_1540);
    float _1574 = _1522 * 2.0;
    if (_1514)
    {
        float _1576 = _1568 ? as_type<float>(_1556) : _1502;
        _1564 = _1576;
    }
    float _1578 = _1564;
    bool _1580 = _1522 > 0.5;
    float _1582 = _1534 * 2.0;
    bool _1584 = _1534 > 0.5;
    float _1586 = _1534 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1588 = floor(_1574);
    float _1590 = -_1538;
    float _1592 = _1590 + 1.0;
    bool _1594 = _1500 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1596 = isnan(_1500);
    bool _1598 = _1594 || _1596;
    bool _1600 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1602 = _1598 || _1600;
    float _1604 = float(_1602);
    float _1606 = fma(_1586, -2.0, _1562);
    float _1608 = _1546 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1610 = _1580 ? as_type<int>(_1592) : as_type<int>(_1538);
    float _1612 = floor(_1570);
    int _1614 = _1584 ? as_type<int>(_1592) : as_type<int>(_1538);
    float _1616 = -_1572;
    float _1618 = _1616 + 1.0;
    bool _1620 = _1542 > 0.5;
    float _1622 = _408 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1624 = _1526 ? as_type<float>(_1610) : _1538;
    out.m_59.y = _1560;
    float _1626 = _1532 ? as_type<float>(_1614) : _1538;
    float _1628 = floor(_1582);
    bool _1630 = _1588 >= 0.0;
    bool _1632 = isnan(_1588);
    bool _1634 = _1630 || _1632;
    bool _1636 = isnan(0.0);
    bool _1638 = _1634 || _1636;
    float _1640 = fma(_396, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1622);
    float _1642 = _1538;
    if (_1520)
    {
        float _1644 = _1620 ? _1592 : _1538;
        _1642 = _1644;
    }
    float _1646 = _1642;
    bool _1648 = _1588 > 0.0;
    int _1650 = _1638 ? 0 : 1;
    float _1652 = fma(_1608, _1646, -0.5);
    bool _1654 = _1612 > 0.0;
    bool _1656 = _1612 >= 0.0;
    bool _1658 = isnan(_1612);
    bool _1660 = _1656 || _1658;
    bool _1662 = isnan(0.0);
    bool _1664 = _1660 || _1662;
    int _1666 = ~_1650;
    int _1668 = _1666 + 1;
    int _1670 = _1668 + 1;
    float _1672 = in.m_57.x;
    int _1674 = _1664 ? 0 : 1;
    bool _1676 = _1628 > 0.0;
    bool _1678 = _1628 >= 0.0;
    bool _1680 = isnan(_1628);
    bool _1682 = _1678 || _1680;
    bool _1684 = isnan(0.0);
    bool _1686 = _1682 || _1684;
    int _1688 = _1686 ? 0 : 1;
    int _1690 = ~_1674;
    int _1692 = _1690 + 1;
    int _1694 = _1692 + 1;
    int _1696 = ~_1688;
    int _1698 = _1696 + 1;
    int _1700 = _1698 + 1;
    int _1702 = _1670;
    int _1704 = _1694;
    int _1706 = _1700;
    if (!_1648)
    {
        int _1708 = ~_1650;
        int _1710 = _1708 + 1;
        _1702 = _1710;
    }
    int _1712 = _1702;
    if (!_1654)
    {
        int _1714 = ~_1674;
        int _1716 = _1714 + 1;
        _1704 = _1716;
    }
    int _1718 = _1704;
    int _1720 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1722 = _1720 != 0;
    int _1724 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1726 = _1724 != 0;
    int _1728 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1730 = _1728 != 0;
    if (!_1676)
    {
        int _1732 = ~_1688;
        int _1734 = _1732 + 1;
        _1706 = _1734;
    }
    int _1736 = _1706;
    float _1738 = in.m_61.x;
    float _1740 = in.m_61.y;
    float _1742 = in.m_61.z;
    bool _1744 = !_1722;
    int _1746 = _1744 ? 0 : 1;
    bool _1748 = !_1726;
    int _1750 = _1748 ? 0 : 1;
    out.m_59.x = _1672;
    int _1752 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1754 = _1752 != 0;
    int _1756 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1758 = _1756 != 0;
    float _1760 = _408 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _1762 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1764 = isnan(0.0);
    bool _1766 = _1762 || _1764;
    bool _1768 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1770 = _1766 || _1768;
    float _1772 = fma(_396, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1760);
    float _1774 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1776 = _1774 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1778 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1780 = _1770 ? _1618 : 0.0;
    float _1782 = _1510 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1784 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1786 = _1784 != 0;
    float _1788 = 1.0 / _1776;
    int _1790 = abs(_1746);
    float _1792 = -_1778;
    float _1794 = fma(_1782, 2.0, _1792);
    int _1796 = abs(_1750);
    float _1798 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1738);
    float _1800 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1802 = _1800 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1804 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1742);
    float _1806 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1808 = _1806 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1810 = fma(_426, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1640);
    float _1812 = fma(_426, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1772);
    float _1814 = _674 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1816 = 1.0 / _1802;
    float _1818 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1740);
    float _1820 = _1516 * _1798;
    float _1822 = _1544 * _1804;
    float _1824 = _1814 * _1818;
    float _1826 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1828 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1826;
    float _1830 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1832 = _1830 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1834 = 1.0 / _1808;
    float _1836 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1838 = _1500 + _1836;
    float _1840 = _1828 * _1788;
    float _1842 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1844 = _1500 + _1842;
    float _1846 = _1510 + _1522;
    float _1848 = float(_1712);
    float _1850 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1606);
    float _1852 = _1832 * _1816;
    float _1854 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1856 = _1534 + _1522;
    float _1858 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1860 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1858;
    float _1862 = fma(_1852, _1838, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _1864 = _1500 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1866 = isnan(_1500);
    bool _1868 = _1864 || _1866;
    bool _1870 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1872 = _1868 || _1870;
    float _1874 = float(_1872);
    float _1876 = _1856 + (-1.0);
    float _1878 = _1510 + _1534;
    float _1880 = _1846 + (-1.0);
    float _1882 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1884 = fma(_1876, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1886 = _1878 + (-1.0);
    float _1888 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1890 = _1500 + _1888;
    float _1892 = _1860 * _1834;
    float _1894 = fma(_1886, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1896 = fma(_1840, _1890, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1898 = _1854 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1900 = -_1874;
    float _1902 = _1900 + 1.0;
    float _1904 = fma(_1892, _1844, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1906 = fma(_1880, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1908 = fma(_1898, _1626, -0.5);
    bool _1910 = _1500 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1912 = isnan(_1500);
    bool _1914 = _1910 || _1912;
    bool _1916 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1918 = _1914 || _1916;
    float _1920 = float(_1918);
    int _1922 = 0;
    int _1924 = as_type<int>(_1848);
    float _1926 = as_type<float>(_1736);
    float _1928 = 0.5;
    if (_1758)
    {
        float _1930 = -_1502;
        float _1932 = _1930 + 1.0;
        _1922 = as_type<int>(_1932);
    }
    int _1934 = _1922;
    float _1936 = _1882 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1938 = float(_1796);
    float _1940 = -_1920;
    float _1942 = _1940 + 1.0;
    float _1944 = float(_1718);
    float _1946 = fma(_1624, _1936, -0.5);
    bool _1948 = _1500 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1950 = isnan(_1500);
    bool _1952 = _1948 || _1950;
    bool _1954 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1956 = _1952 || _1954;
    float _1958 = float(_1956);
    float _1960 = _1920 * _1902;
    float _1962 = _1604 * _1942;
    float _1964 = in.m_63.x;
    float _1966 = in.m_63.y;
    float _1968 = in.m_63.z;
    float _1970 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1972 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1974 = 1.0 + _1972;
    float _1976 = _1938 * _1944;
    float _1978 = -_1604;
    float _1980 = _1978 + 1.0;
    float _1982 = fma(_1534, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1970);
    float _1984 = _1510 + (-0.5);
    float _1986 = _1976 * (-2.0);
    float _1988 = 1.0 / _1974;
    float _1990 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1982);
    float _1992 = float(_1790);
    float _1994 = _1958 * _1980;
    float _1996 = _1534 + (-0.5);
    float _1998 = -_1850;
    float _2000 = fma(_1990, _1908, _1998);
    float _2002 = float(_1736);
    float _2004 = _1992 * _1848;
    float _2006 = _1896 * _1994;
    float _2008 = _1986;
    if (_1754)
    {
        float _2010 = -_1502;
        float _2012 = _2010 + 1.0;
        _1924 = as_type<int>(_2012);
    }
    int _2014 = _1924;
    float _2016 = _2004 * (-2.0);
    if (!_1754)
    {
        _1926 = _1502;
    }
    float _2018 = _1926;
    float _2020 = -_1958;
    float _2022 = _2020 + 1.0;
    float _2024 = -_126;
    float _2026 = fma(_2024, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1794);
    float _2028 = fma(_1894, _2016, _1894);
    float _2030 = fma(_2016, _1964, _1964);
    float _2032 = _1536 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2034 = fma(_1986, _1966, _1966);
    float _2036 = _1810 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2038 = fma(_1884, _1986, _1884);
    float _2040 = -_2032;
    float _2042 = _2040 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2044 = _1780 * _1988;
    bool _2046 = !_1730;
    int _2048 = _2046 ? 0 : 1;
    float _2050 = _1812 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _2052 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2054 = isnan(1.0);
    bool _2056 = _2052 || _2054;
    bool _2058 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2060 = _2056 || _2058;
    float _2062 = -_2036;
    float _2064 = _2062 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2066 = _2042 * _2042;
    float _2068 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2070 = fma(_1984, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2030);
    float _2072 = fma(_1996, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2034);
    float _2074 = -_2050;
    float _2076 = _2074 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    bool _2078 = !_2060;
    float _2080 = _2078 ? _126 : _2044;
    float _2082 = fma(_2064, _2064, _2066);
    float _2084 = fma(_2022, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2006);
    int _2086 = abs(_2048);
    float _2088 = fma(_2076, _2076, _2082);
    float _2090 = _2018;
    float _2092 = _2066;
    float _2094 = _2076;
    if (_1754)
    {
        float _2096 = _1580 ? as_type<float>(_2014) : _1502;
        _2090 = _2096;
    }
    float _2098 = _2090;
    float _2100 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2102 = float(_2086);
    float _2104 = fma(_2080, _2038, _2072);
    float _2106 = fma(_2080, _2028, _2070);
    float _2108 = rsqrt(_2088);
    if (_1786)
    {
        _2092 = _1510;
    }
    float _2110 = _2092;
    float _2112 = _2102 * _2002;
    float _2114 = _2110;
    if (!_1786)
    {
        _2114 = _1522;
    }
    float _2116 = _2114;
    float _2118 = _2106 * 0.15915493667125701904296875;
    if (!_1786)
    {
        _2008 = _1534;
    }
    float _2120 = _2008;
    float _2122 = _2112 * (-2.0);
    float _2124 = _2104 * 0.15915493667125701904296875;
    float _2126 = _2116 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2128 = _2120;
    if (_1786)
    {
        _2128 = _1510;
    }
    float _2130 = _2128;
    float _2132 = fma(_2122, _1968, _1968);
    float _2134 = _1522 + (-0.5);
    float _2136 = fma(_1906, _2122, _1906);
    float _2138 = _2124 * 6.283185482025146484375;
    float _2140 = sin(_2138);
    float _2142 = -_2100;
    float _2144 = fma(_2126, 2.0, _2142);
    float _2146 = fma(_2134, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2132);
    float _2148 = _2064 * _2108;
    float _2150 = _2076 * _2108;
    float _2152 = _2042 * _2108;
    float _2154 = fma(_2080, _2136, _2146);
    float _2156 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2158 = _2148 * _2156;
    float _2160 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2162 = _2150 * _2160;
    float _2164 = _2154 * 0.15915493667125701904296875;
    float _2166 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2168 = -_2158;
    float _2170 = fma(_2150, _2166, _2168);
    float _2172 = _2124 * 6.283185482025146484375;
    float _2174 = cos(_2172);
    float _2176 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2178 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2180 = _2152 * _2178;
    float _2182 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2184 = -_2162;
    float _2186 = fma(_2152, _2182, _2184);
    float _2188 = fma(_2130, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2176);
    float _2190 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2192 = -_2180;
    float _2194 = fma(_2148, _2190, _2192);
    if (!_1786)
    {
        _2094 = _1522;
    }
    float _2196 = _2094;
    float _2198 = _2118 * 6.283185482025146484375;
    float _2200 = sin(_2198);
    float _2202 = _2170 * _2170;
    float _2204 = _2196;
    if (_1786)
    {
        _2204 = _1534;
    }
    float _2206 = _2204;
    float _2208 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2210 = _2130 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2212 = fma(_2186, _2186, _2202);
    if (_1758)
    {
        float _2214 = _1584 ? as_type<float>(_1934) : _1502;
        _1550 = _2214;
    }
    float _2216 = _1550;
    float _2218 = fma(_1534, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2068);
    float _2220 = _2118 * 6.283185482025146484375;
    float _2222 = cos(_2220);
    float _2224 = -_2208;
    float _2226 = fma(_2210, 2.0, _2224);
    float _2228 = fma(_1862, _1962, _2084);
    float _2230 = -_126;
    float _2232 = fma(_2230, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2226);
    float _2234 = fma(_1904, _1960, _2228);
    float _2236 = _2164 * 6.283185482025146484375;
    float _2238 = cos(_2236);
    float _2240 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2242 = fma(_2194, _2194, _2212);
    float _2244 = _2164 * 6.283185482025146484375;
    float _2246 = sin(_2244);
    float _2248 = _2222 * _2140;
    float _2250 = fma(_2206, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2240);
    float _2252 = _2222 * _2174;
    float _2254 = _2200 * _2140;
    float _2256 = rsqrt(_2242);
    float _2258 = _2200 * _2174;
    float _2260 = _2174 * _2238;
    float _2262 = _2140 * _2238;
    float _2264 = _2238 * _1824;
    float _2266 = -_2248;
    float _2268 = fma(_2246, _2258, _2266);
    float _2270 = -_2258;
    float _2272 = fma(_2246, _2248, _2270);
    float _2274 = -_1824;
    float _2276 = _2246 * _2274;
    float _2278 = _2222 * _2264;
    float _2280 = fma(_2246, _2252, _2254);
    float _2282 = fma(_2246, _2254, _2252);
    float _2284 = fma(_2260, _1820, _2276);
    float _2286 = _2200 * _2264;
    float _2288 = _2186 * _2256;
    float _2290 = fma(_2280, _1820, _2278);
    float _2292 = _2170 * _2256;
    float _2294 = fma(_2268, _1820, _2286);
    float _2296 = _2152 * _2288;
    float _2298 = fma(_2262, _1822, _2284);
    float _2300 = fma(_2272, _1822, _2290);
    float _2302 = fma(_2282, _1822, _2294);
    float _2304 = _2194 * _2256;
    float _2306 = _2150 * _2292;
    float _2308 = -_2296;
    float _2310 = fma(_2148, _2292, _2308);
    float _2312 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2314 = -_2306;
    float _2316 = fma(_2152, _2304, _2314);
    float _2318 = _2310 * _2300;
    float _2320 = _2316 * _2300;
    float _2322 = fma(_2304, _2298, _2318);
    float _2324 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2326 = (*spvDescriptorSet0.vp_c9)._m0[88].z;
    if (!_1786)
    {
        _2326 = _1522;
    }
    float _2328 = _2326;
    float _2330 = fma(_2288, _2298, _2320);
    float _2332 = fma(_2150, _2302, _2322);
    float _2334 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2336 = _2328;
    float _2338 = _2330;
    if (_1786)
    {
        _2336 = _1534;
    }
    float _2340 = _2336;
    float _2342 = fma(_2148, _2302, _2330);
    float _2344 = _2050 + _2332;
    float _2346 = _2344;
    if (_1786)
    {
        _2338 = _1534;
    }
    float _2348 = _2338;
    float _2350 = fma(_1510, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2334);
    float _2352 = _2036 + _2342;
    float _2354 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2356 = _2344 + _2354;
    float _2358 = fma(_1510, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2324);
    float _2360 = _2348;
    float _2362 = _2352;
    if (!_1786)
    {
        _2360 = _1510;
    }
    float _2364 = _2360;
    float _2366 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2368 = _2352 + _2366;
    float _2370 = _2356 * _2356;
    float _2372 = _2312 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2374 = _2148 * _2304;
    float _2376 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2378 = fma(_2368, _2368, _2370);
    float _2380 = fma(_2372, _1578, -0.5);
    float _2382 = -_2374;
    float _2384 = fma(_2150, _2288, _2382);
    float _2386 = _2340 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2388 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2350);
    float _2390 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2358);
    float _2392 = sqrt(_2378);
    float _2394 = _2384 * _2300;
    float _2396 = fma(_2388, _2380, _2026);
    float _2398 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2250);
    float _2400 = fma(_2292, _2298, _2394);
    float _2402 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2404 = _2376 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2406 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2408 = fma(_2152, _2302, _2400);
    float _2410 = fma(_2404, _2098, -0.5);
    float _2412 = _2032 + _2408;
    bool _2414 = _2392 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2416 = _2402 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2418 = fma(_2386, -2.0, _2406);
    float _2420 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2188);
    float _2422 = fma(_2416, _2216, -0.5);
    float _2424 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2418);
    float _2426 = fma(_2420, _2410, _2232);
    float _2428 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2430 = _2364 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2432 = -_126;
    float _2434 = fma(_2432, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2144);
    float _2436 = fma(_2430, -2.0, _2428);
    float _2438 = fma(_2390, _2422, _2434);
    float _2440 = -_2424;
    float _2442 = fma(_2398, _1652, _2440);
    float _2444 = _2428;
    if (!_2414)
    {
        _2444 = _2412;
    }
    float _2446 = _2444;
    bool _2448 = !_2414;
    float _2450 = _2446;
    if (!_2448)
    {
        float _2452 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2454 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2456 = _2392 + _2454;
        float _2458 = rsqrt(_2378);
        float _2460 = _2456 * _2452;
        float _2462 = _2412 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2464 = _2460 * 0.15915493667125701904296875;
        float _2466 = _2464 * 6.283185482025146484375;
        float _2468 = cos(_2466);
        float _2470 = _2464 * 6.283185482025146484375;
        float _2472 = sin(_2470);
        float _2474 = _2468 + (-1.0);
        float _2476 = _2474 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2478 = fma(_2472, _2462, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2480 = fma(_2412, _2468, _2476);
        float _2482 = _2458 * _2478;
        float _2484 = fma(_2368, _2482, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2486 = fma(_2356, _2482, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2450 = _2480;
        _2362 = _2484;
        _2346 = _2486;
    }
    float _2488 = _2450;
    float _2490 = _2362;
    float _2492 = _2346;
    float _2494 = -_2032;
    float _2496 = _2494 + _2488;
    float _2498 = in.m_57.z;
    float _2500 = -_2036;
    float _2502 = _2500 + _2490;
    float _2504 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2218);
    float _2506 = _2496 * _2496;
    float _2508 = in.m_57.w;
    float _2510 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2436);
    float _2512 = -_2050;
    float _2514 = _2512 + _2492;
    float _2516 = fma(_2502, _2502, _2506);
    float _2518 = fma(_1874, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2234);
    float _2520 = -_2510;
    float _2522 = fma(_2504, _1946, _2520);
    float _2524 = _1458 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2526 = fma(_2514, _2514, _2516);
    float _2528 = _1462 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2530 = _1460 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2532 = _2524 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2534 = sqrt(_2526);
    float _2536 = _2528 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2538 = _2530 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2540 = _2000 + 0.5;
    float _2542 = _2438 + 0.5;
    float _2544 = _2396 + 0.5;
    float _2546 = _2426 + 0.5;
    float _2548 = _2518 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2550 = _2442 + 0.5;
    float _2552 = _2522 + 0.5;
    out.m_59.z = _2498;
    out.m_59.w = _2508;
    bool _2554 = _2534 > 0.0;
    out.m_65.x = _2532;
    out.m_65.y = _2538;
    out.m_65.z = _2536;
    out.m_65.w = _2548;
    out.m_67.x = _2544;
    out.m_67.y = _2540;
    out.m_67.z = _2546;
    out.m_67.w = _2550;
    out.m_69.x = _2542;
    out.m_69.y = _2552;
    bool _2556 = !_2554;
    float _2558 = _2550;
    float _2560 = _2544;
    float _2562 = _2490;
    float _2564 = _2488;
    float _2566 = _2492;
    if (!_2556)
    {
        bool _2568 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2570 = _2540;
        if (_2568)
        {
            float _2572 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2570 = _2572;
        }
        float _2574 = _2570;
        float _2576 = _2574;
        if (_2568)
        {
            float _2578 = _428 * _2574;
            _2558 = _2578;
        }
        float _2580 = _2558;
        float _2582 = _2580;
        if (_2568)
        {
            float _2584 = _430 * _2574;
            _2560 = _2584;
        }
        float _2586 = _2560;
        float _2588 = _2586;
        if (_2568)
        {
            float _2590 = _432 * _2574;
            _2576 = _2590;
        }
        float _2592 = _2576;
        float _2594 = _2592;
        if (!_2568)
        {
            float _2596 = _126 + 1.0;
            if (!_162)
            {
                float _2598 = _2596 * _2596;
                float _2600 = _2598 * 0.5;
                _128 = _2600;
            }
            float _2602 = _128;
            float _2604 = _2602;
            if (!_162)
            {
                float _2606 = _2602 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2604 = _2606;
            }
            float _2608 = _2604;
            bool _2610 = !_162;
            float _2612 = _2608;
            if (!_2610)
            {
                float _2614 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2616 = log2(_2614);
                float _2618 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2620 = 1.0 + _2618;
                float _2622 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2624 = _2616 * _2596;
                float _2626 = 1.0 / _2620;
                float _2628 = _2622 * 0.693147182464599609375;
                float _2630 = exp2(_2624);
                float _2632 = 1.0 / _2628;
                float _2634 = _2630 + (-1.0);
                float _2636 = -_2634;
                float _2638 = fma(_2636, _2632, _2596);
                float _2640 = _2638 * _2626;
                float _2642 = _2640 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2612 = _2642;
            }
            float _2644 = _2612;
            float _2646 = _2644 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2648 = _2644 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2650 = _2644 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2652 = _2646 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _2654 = _2646 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _2656 = _2646 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _2658 = fma(_2648, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2652);
            float _2660 = fma(_2648, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2654);
            float _2662 = fma(_2650, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2658);
            float _2664 = _2658;
            if (!_162)
            {
                _2664 = _2596;
            }
            float _2666 = _2664;
            bool _2668 = !_162;
            float _2670 = _2666;
            if (!_2668)
            {
                float _2672 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2674 = log2(_2672);
                float _2676 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2678 = 1.0 + _2676;
                float _2680 = 1.0 / _2678;
                float _2682 = _2674 * _2596;
                float _2684 = exp2(_2682);
                float _2686 = -_2684;
                float _2688 = _2686 + 1.0;
                float _2690 = _2688 * _2680;
                _2670 = _2690;
            }
            float _2692 = _2670;
            float _2694 = fma(_2650, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2660);
            float _2696 = fma(_2692, _166, _2662);
            float _2698 = fma(_2648, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2656);
            float _2700 = fma(_2692, _164, _2694);
            float _2702 = -_390;
            float _2704 = _2702 + _2696;
            float _2706 = fma(_2650, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2698);
            float _2708 = -_392;
            float _2710 = _2708 + _2700;
            float _2712 = _2704 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2714 = _2704 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2716 = fma(_2692, _168, _2706);
            float _2718 = _2704 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2720 = fma(_2710, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2712);
            float _2722 = fma(_2710, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2714);
            float _2724 = -_406;
            float _2726 = _2724 + _2716;
            float _2728 = fma(_2710, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2718);
            float _2730 = fma(_2726, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2720);
            float _2732 = fma(_2726, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2722);
            float _2734 = fma(_2726, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2728);
            _436 = _2732;
            _438 = _2730;
            _440 = _2734;
            _2582 = _2730;
            _2588 = _2732;
            _2594 = _2734;
        }
        float _2736 = _436;
        float _2738 = _438;
        float _2740 = _440;
        float _2742 = _2582;
        float _2744 = _2588;
        float _2746 = _2594;
        float _2748 = _2736 * _2736;
        float _2750 = rsqrt(_2526);
        float _2752 = fma(_2738, _2738, _2748);
        float _2754 = fma(_2740, _2740, _2752);
        float _2756 = sqrt(_2754);
        float _2758 = _2502 * _2750;
        float _2760 = _2496 * _2750;
        float _2762 = _2514 * _2750;
        bool _2764 = _2756 > 0.0;
        bool _2766 = !_2764;
        _130 = _2760;
        _196 = _2752;
        _198 = _2756;
        _442 = _2740;
        _444 = _2738;
        if (!_2766)
        {
            float _2768 = rsqrt(_2754);
            float _2770 = _2768 * _2736;
            float _2772 = _2768 * _2738;
            float _2774 = _2768 * _2740;
            float _2776 = _2760 * _2770;
            float _2778 = fma(_2758, _2772, _2776);
            float _2780 = fma(_2762, _2774, _2778);
            float _2782 = _2780 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2784 = fma(_2742, _2782, _2490);
            float _2786 = fma(_2744, _2782, _2488);
            float _2788 = fma(_2746, _2782, _2492);
            _2562 = _2784;
            _2564 = _2786;
            _2566 = _2788;
            _130 = _2776;
            _196 = _2774;
            _198 = _2782;
        }
    }
    float _2790 = _2562;
    float _2792 = _2564;
    float _2794 = _2566;
    float _2796 = _130;
    float _2798 = _196;
    float _2800 = _198;
    float _2802 = _442;
    float _2804 = _444;
    bool _2806 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2808 = isnan(0.5);
    bool _2810 = _2806 || _2808;
    bool _2812 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2814 = _2810 || _2812;
    float _2816 = _2798;
    float _2818 = _2796;
    float _2820 = _2800;
    float _2822 = _2794;
    float _2824 = _2804;
    float _2826 = _2802;
    if (_2814)
    {
        _2816 = _2790;
    }
    float _2828 = _2816;
    float _2830 = _2828;
    if (_2814)
    {
        _2818 = _2792;
    }
    float _2832 = _2818;
    float _2834 = _2832;
    if (_2814)
    {
        _2820 = _2794;
    }
    float _2836 = _2820;
    float _2838 = _2836;
    if (!_2814)
    {
        float _2840 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2842 = _2032 + _2840;
        float _2844 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2846 = _2036 + _2844;
        float _2848 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2850 = -_2036;
        float _2852 = _2850 + _2790;
        float _2854 = _2842 * _2842;
        float _2856 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2858 = _2050 + _2856;
        float _2860 = -_2050;
        float _2862 = _2860 + _2794;
        float _2864 = fma(_2846, _2846, _2854);
        float _2866 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2868 = fma(_2858, _2858, _2864);
        float _2870 = sqrt(_2868);
        float _2872 = _2848 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2874 = precise::min(_2870, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2876 = _2874 * _2866;
        float _2878 = -_2032;
        float _2880 = _2878 + _2792;
        float _2882 = _2872 * _2876;
        float _2884 = fma(_2852, _2882, _2036);
        float _2886 = fma(_2880, _2882, _2032);
        float _2888 = fma(_2862, _2882, _2050);
        _2834 = _2886;
        _2830 = _2884;
        _2838 = _2888;
        _2822 = _2862;
    }
    float _2890 = _2834;
    float _2892 = _2830;
    float _2894 = _2838;
    float _2896 = _2822;
    float _2898 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2900 = _2890 + _2898;
    float _2902 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2904 = _2892 + _2902;
    float _2906 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2908 = _2894 + _2906;
    float _2910 = _2900 * _2900;
    float _2912 = fma(_2904, _2904, _2910);
    float _2914 = fma(_2908, _2908, _2912);
    float _2916 = rsqrt(_2914);
    float _2918 = sqrt(_2914);
    float _2920 = _2916 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2922 = _2904 * _2920;
    float _2924 = _2908 * _2920;
    float _2926 = _2922 * _2922;
    float _2928 = _2924 * _2924;
    float _2930 = _2926 + _2928;
    float _2932 = sqrt(_2930);
    bool _2934 = _2932 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2936 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2938 = _2932 + _2936;
    float _2940 = _2908;
    float _2942 = _2938;
    float _2944 = _2900;
    float _2946 = _2896;
    if (_2934)
    {
        float _2948 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2940 = _2948;
    }
    float _2950 = _2940;
    if (_2934)
    {
        float _2952 = rsqrt(_2930);
        _2824 = _2952;
    }
    float _2954 = _2824;
    float _2956 = _2954;
    if (_2934)
    {
        float _2958 = _2938 * _2950;
        _2942 = _2958;
    }
    float _2960 = _2942;
    if (_2934)
    {
        float _2962 = _2960 * 0.15915493667125701904296875;
        _2826 = _2962;
    }
    float _2964 = _2826;
    float _2966 = _2916;
    if (_2934)
    {
        float _2968 = _2964 * 6.283185482025146484375;
        float _2970 = sin(_2968);
        _2966 = _2970;
    }
    float _2972 = _2966;
    float _2974 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2976 = precise::max(0.0, _2974);
    float _2978 = _2910;
    float _2980 = _2976;
    float _2982 = _2974;
    if (_2934)
    {
        float _2984 = _2964 * 6.283185482025146484375;
        float _2986 = cos(_2984);
        _2978 = _2986;
    }
    float _2988 = _2978;
    float _2990 = -_2920;
    float _2992 = -_2976;
    float _2994 = fma(_2900, _2990, _2992);
    if (!_2934)
    {
        _2944 = _2924;
    }
    float _2996 = _2944;
    float _2998 = _2996;
    if (_2934)
    {
        float _3000 = _2994 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2980 = _3000;
    }
    float _3002 = _2980;
    float _3004 = _3002;
    float _3006 = _2972;
    if (_2934)
    {
        float _3008 = fma(_2972, _3002, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3004 = _3008;
    }
    float _3010 = _3004;
    float _3012 = _3010;
    if (!_2934)
    {
        _3006 = _2922;
    }
    float _3014 = _3006;
    float _3016 = _3014;
    float _3018 = _2988;
    if (_2934)
    {
        float _3020 = _2988 + (-1.0);
        _2982 = _3020;
    }
    float _3022 = _2982;
    float _3024 = _3022;
    if (_2934)
    {
        float _3026 = _2954 * _3010;
        _2946 = _3026;
    }
    float _3028 = _2946;
    if (!_2934)
    {
        _3012 = _2994;
    }
    float _3030 = _3012;
    float _3032 = _3030;
    if (_2934)
    {
        float _3034 = _3022 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2956 = _3034;
    }
    float _3036 = _2956;
    if (_2934)
    {
        float _3038 = _2922 * _3028;
        _3016 = _3038;
    }
    float _3040 = _3016;
    if (!_2934)
    {
        _3024 = _2926;
    }
    float _3042 = _3024;
    float _3044 = _3042;
    if (_2934)
    {
        float _3046 = _2924 * _3028;
        _2998 = _3046;
    }
    float _3048 = _2998;
    if (_2934)
    {
        float _3050 = fma(_2994, _2988, _3036);
        _3032 = _3050;
    }
    float _3052 = _3032;
    if (_2934)
    {
        float _3054 = _3040 * _3040;
        _3044 = _3054;
    }
    float _3056 = _3044;
    if (!_2934)
    {
        _3018 = _2928;
    }
    float _3058 = _3018;
    float _3060 = _3058;
    if (_2934)
    {
        float _3062 = _3048 * _3048;
        _3060 = _3062;
    }
    float _3064 = _3060;
    float _3066 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3068 = fma(_3052, _3052, _3056);
    float _3070 = _2890 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3072 = _2890 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3074 = _3068 + _3064;
    float _3076 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3078 = fma(_2918, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3076);
    float _3080 = precise::clamp(_3078, 0.0, 1.0);
    float _3082 = fma(_2892, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3070);
    float _3084 = _2890 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3086 = rsqrt(_3074);
    float _3088 = -_3080;
    float _3090 = _3088 + 1.0;
    float _3092 = fma(_2894, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3082);
    float _3094 = _2890 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3096 = fma(_2892, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3084);
    float _3098 = _3092 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3100 = fma(_2892, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3094);
    float _3102 = fma(_2894, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3096);
    float _3104 = abs(_3090);
    float _3106 = log2(_3104);
    float _3108 = fma(_2892, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3072);
    float _3110 = fma(_2894, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3100);
    float _3112 = _3102 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3114 = _3098 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3116 = fma(_2894, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3108);
    float _3118 = _3110 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3120 = _3086 * _3040;
    float _3122 = _3112 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3124 = _3086 * _3052;
    float _3126 = -_3114;
    float _3128 = fma(_3126, _3066, 1.0);
    float _3130 = _3120 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3132 = _3116 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3134 = fma(_3118, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3122);
    float _3136 = _3086 * _3048;
    float _3138 = -_3130;
    float _3140 = fma(_3124, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3138);
    float _3142 = _3106 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3144 = fma(_3098, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3134);
    float _3146 = log2(_3128);
    float _3148 = -_3136;
    float _3150 = fma(_3148, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3140);
    float _3152 = _3112 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3154 = fma(_3132, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3144);
    float _3156 = _3112 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3158 = fma(_3150, -0.5, 0.5);
    float _3160 = fma(_3118, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3152);
    float _3162 = fma(_3150, 0.5, 0.5);
    float _3164 = exp2(_3142);
    float _3166 = fma(_3118, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3156);
    float _3168 = fma(_3098, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3160);
    float _3170 = fma(_3162, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3172 = _3124 + 1.0;
    float _3174 = fma(_3098, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3166);
    float _3176 = fma(_3132, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3168);
    float _3178 = fma(_3162, _3170, -0.212114393711090087890625);
    float _3180 = 1.0 / _3154;
    float _3182 = fma(_3132, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3174);
    float _3184 = _3146 * 0.693147182464599609375;
    float _3186 = fma(_3162, _3178, 1.570728778839111328125);
    float _3188 = _3184 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3190 = sqrt(_3158);
    float _3192 = -_3124;
    float _3194 = fma(_3164, _3172, _3192);
    float _3196 = fma(_3194, 0.5, 0.5);
    float _3198 = _3176 * _3180;
    float _3200 = _3182 * _3180;
    float _3202 = fma(_3198, 0.5, 0.5);
    float _3204 = fma(_3200, -0.5, 0.5);
    float _3206 = _3190 * 0.636619746685028076171875;
    float _3208 = -_3186;
    float _3210 = fma(_3206, _3208, 1.0);
    float3 _8457 = float3(_3202, _3204, _3188);
    float _3212 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8457, float3(0.0), isnan(_8457)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8457, float3(0.0), isnan(_8457)), level(0.0)).x;
    float3 _8468 = float3(_3202, _3204, _3188);
    float4 _3215 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8468, float3(0.0), isnan(_8468)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8468, float3(0.0), isnan(_8468)), level(0.0)).xyzw;
    float _3217 = _3215.x;
    float _3219 = _3215.y;
    float _3221 = _3215.z;
    float _3223 = _3215.w;
    float2 _8485 = float2(_3210, _3196);
    float3 _3227 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8485, float2(0.0), isnan(_8485)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8485, float2(0.0), isnan(_8485)), level(0.0)).xyz;
    float _3229 = _3227.x;
    float _3231 = _3227.y;
    float _3233 = _3227.z;
    float _3235 = _2032 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3237 = _2032 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _3239 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _3241 = isnan(0.5);
    bool _3243 = _3239 || _3241;
    bool _3245 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3247 = _3243 || _3245;
    float _3249 = fma(_2036, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3235);
    float _3251 = fma(_2036, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3237);
    float _3253 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3249);
    float _3255 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3251);
    float _3257 = _3253 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3259 = _3255 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3261 = _3253;
    float _3263 = _3106;
    if (!_3247)
    {
        _1928 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _3265 = _1928;
    float _3267 = 1.0 / _3257;
    float _3269 = _3259 + _3257;
    float _3271 = _3106 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3273 = exp2(_3271);
    float _3275 = _3269 * _3267;
    float _3277 = _3275 * 0.5;
    float _3279 = _3112 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3281 = _3265;
    float _3283 = _3277;
    if (!_3247)
    {
        float _3285 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3287 = fma(_3277, _3265, _3285);
        _3281 = _3287;
    }
    float _3289 = _3281;
    if (!_3247)
    {
        _3283 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _3291 = _3283;
    float _3293 = fma(_3118, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3279);
    float _3295 = _3154 * 0.5;
    float _3297 = _3289;
    float _3299 = _3291;
    if (!_3247)
    {
        float _3301 = 1.0 / _3289;
        _3297 = _3301;
    }
    float _3303 = _3297;
    if (!_3247)
    {
        float _3305 = -_3291;
        float _3307 = _3305 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _3261 = _3307;
    }
    float _3309 = _3261;
    float _3311 = fma(_3098, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3293);
    float _3313 = -_3273;
    float _3315 = _3313 + 1.0;
    float _3317 = fma(_3132, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3311);
    float _3319 = _2050;
    if (!_3247)
    {
        float _3321 = 1.0 / _3309;
        _3319 = _3321;
    }
    float _3323 = _3319;
    float _3325 = _3315 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3327 = _3317 + _3154;
    out.gl_Position.x = _3176;
    out.gl_Position.y = _3182;
    out.gl_Position.z = _3317;
    out.gl_Position.w = _3154;
    float _3329 = _3327 * 0.5;
    if (!_3247)
    {
        float _3331 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3333 = -_3291;
        float _3335 = fma(_3303, _3331, _3333);
        _3263 = _3335;
    }
    float _3337 = _3263;
    float _3339 = _3337;
    if (_3247)
    {
        _3299 = 1.0;
    }
    float _3341 = _3299;
    float _3343 = fma(_3182, -0.5, _3295);
    float _3345 = _3341;
    if (!_3247)
    {
        float _3347 = _3337 * _3323;
        float _3349 = precise::clamp(_3347, 0.0, 1.0);
        _3339 = _3349;
    }
    float _3351 = _3339;
    if (!_3247)
    {
        float _3353 = -_3351;
        float _3355 = _3353 + 1.0;
        _3345 = _3355;
    }
    float _3357 = _3345;
    float _3359 = _3176 + _3154;
    float _3361 = _3357 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _3363 = _3357 > 0.0;
    bool _3365 = isnan(_3357);
    bool _3367 = _3363 || _3365;
    bool _3369 = isnan(0.0);
    bool _3371 = _3367 || _3369;
    float _3373 = -_3325;
    float _3375 = _3373 + 1.0;
    float _3377 = _3359 * 0.5;
    float _3379 = _3361 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_71.x = _3377;
    out.m_71.y = _3343;
    out.m_71.z = _3329;
    out.m_71.w = _3154;
    out.m_45.x = _3379;
    float _3381 = _3325 * _3212;
    float _3383 = _3223 * _3381;
    float _3385 = _3233 * _3381;
    float _3387 = _3223 * _3375;
    float _3389 = fma(_3229, _3383, _3217);
    float _3391 = fma(_3231, _3383, _3219);
    float _3393 = fma(_3223, _3385, _3221);
    out.m_73.x = _3389;
    out.m_73.y = _3391;
    out.m_73.z = _3393;
    out.m_73.w = _3387;
    if (_3371)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _3395 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3395;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1490 = false;
    bool _1046 = false;
    bool _866 = false;
    bool _698 = false;
    bool _464 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_42.w;
    float _89 = trunc(_87);
    int _92 = int(_89);
    bool _96 = _92 >= 1;
    float _98 = 0.0;
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _100 = _98;
    float _102 = _100;
    if (!_96)
    {
        out.m_45.x = 0.0;
    }
    int _104 = 0;
    if (!_96)
    {
        float _106 = _100 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3452 = as_type<float>(_108);
        out.gl_Position.z = _3452;
    }
    if (!_96)
    {
        return out;
    }
    float _112 = in.m_47.w;
    bool _114 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_112);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = -_112;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _128 = _126;
    float _130 = _126;
    if (_122)
    {
        float _132 = float(_92);
        _102 = _132;
    }
    float _134 = _102;
    bool _136 = _126 >= _134;
    bool _138 = !_122;
    bool _140 = _136 || _138;
    float _142 = _134;
    if (_140)
    {
        _142 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _144 = _142;
    if (_140)
    {
        out.m_45.x = 0.0;
    }
    if (_140)
    {
        float _146 = _144 * 5.0;
        _110 = as_type<int>(_146);
    }
    int _148 = _110;
    if (_140)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3523 = as_type<float>(_148);
        out.gl_Position.z = _3523;
    }
    if (_140)
    {
        return out;
    }
    float _150 = in.m_49.w;
    float _152 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _154 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _156 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _158 = _154 || _156;
    bool _160 = isnan(1.0);
    bool _162 = _158 || _160;
    float _164 = in.m_47.x;
    float _166 = in.m_47.y;
    float _168 = in.m_47.z;
    float _170 = in.m_42.x;
    float _172 = in.m_42.y;
    float _174 = in.m_42.z;
    float _176 = 0.0;
    float _178 = _152;
    if (!_162)
    {
        float _180 = _152 * _152;
        float _182 = _180 * 0.5;
        _176 = _182;
    }
    float _184 = _176;
    float _186 = _184;
    if (!_162)
    {
        float _188 = _184 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _188;
    }
    float _190 = _186;
    bool _192 = !_162;
    float _194 = _190;
    float _196 = _166;
    float _198 = _164;
    if (!_192)
    {
        float _200 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = log2(_200);
        float _204 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _206 = _204 + 1.0;
        float _208 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = _152 * _202;
        float _212 = 1.0 / _206;
        float _214 = _208 * 0.693147182464599609375;
        float _216 = exp2(_210);
        float _218 = 1.0 / _214;
        float _220 = _216 + (-1.0);
        float _222 = -_220;
        float _224 = fma(_222, _218, _152);
        float _226 = _224 * _212;
        float _228 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _194 = _228;
    }
    float _230 = _194;
    float _232 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _234 = !_162;
    float _236 = _232;
    float _238 = _230;
    if (!_234)
    {
        float _240 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _242 = log2(_240);
        float _244 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _246 = _244 + 1.0;
        float _248 = 1.0 / _246;
        float _250 = _152 * _242;
        float _252 = exp2(_250);
        float _254 = -_252;
        float _256 = _254 + 1.0;
        float _258 = _256 * _248;
        _178 = _258;
    }
    float _260 = _178;
    float _262 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _264 = _232 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _266 = _232 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _268 = _232 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _270 = _260;
    if (!_162)
    {
        float _272 = _126 * _126;
        float _274 = _272 * 0.5;
        _236 = _274;
    }
    float _276 = _236;
    float _278 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[8].x, _264);
    float _280 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[8].y, _266);
    float _282 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[8].z, _268);
    float _284 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_162)
    {
        float _286 = _276 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _238 = _286;
    }
    float _288 = _238;
    bool _290 = !_162;
    float _292 = _288;
    if (!_290)
    {
        float _294 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _296 = log2(_294);
        float _298 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _300 = _298 + 1.0;
        float _302 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _304 = _126 * _296;
        float _306 = 1.0 / _300;
        float _308 = _302 * 0.693147182464599609375;
        float _310 = exp2(_304);
        float _312 = 1.0 / _308;
        float _314 = _310 + (-1.0);
        float _316 = -_314;
        float _318 = fma(_316, _312, _126);
        float _320 = _318 * _306;
        float _322 = _320 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _292 = _322;
    }
    float _324 = _292;
    float _326 = _324 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _328 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[10].x, _278);
    float _330 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[10].y, _280);
    float _332 = _324 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _334 = _326 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _336 = _326 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _338 = _326 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _340 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[10].z, _282);
    float _342 = fma(_332, (*spvDescriptorSet0.vp_c10)._m0[8].x, _334);
    float _344 = fma(_332, (*spvDescriptorSet0.vp_c10)._m0[8].y, _336);
    float _346 = fma(_332, (*spvDescriptorSet0.vp_c10)._m0[8].z, _338);
    float _348 = _324 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _350 = fma(_260, _164, _328);
    float _352 = fma(_260, _166, _330);
    float _354 = fma(_260, _168, _340);
    float _356 = fma(_348, (*spvDescriptorSet0.vp_c10)._m0[10].x, _342);
    float _358 = fma(_348, (*spvDescriptorSet0.vp_c10)._m0[10].y, _344);
    float _360 = fma(_348, (*spvDescriptorSet0.vp_c10)._m0[10].z, _346);
    if (!_162)
    {
        _270 = _126;
    }
    float _362 = _270;
    bool _364 = !_162;
    float _366 = _362;
    if (!_364)
    {
        float _368 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _370 = log2(_368);
        float _372 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _374 = _372 + 1.0;
        float _376 = 1.0 / _374;
        float _378 = _126 * _370;
        float _380 = exp2(_378);
        float _382 = -_380;
        float _384 = _382 + 1.0;
        float _386 = _384 * _376;
        _366 = _386;
    }
    float _388 = _366;
    float _390 = fma(_388, _166, _358);
    float _392 = fma(_388, _164, _356);
    bool _394 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _396 = fma(_350, _150, _170);
    float _398 = -_390;
    float _400 = _352 + _398;
    float _402 = -_392;
    float _404 = _350 + _402;
    float _406 = fma(_388, _168, _360);
    float _408 = fma(_352, _150, _172);
    float _410 = _400 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _412 = _400 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _414 = _400 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _416 = -_406;
    float _418 = _354 + _416;
    float _420 = fma(_404, (*spvDescriptorSet0.vp_c10)._m0[4].x, _410);
    float _422 = fma(_404, (*spvDescriptorSet0.vp_c10)._m0[5].x, _412);
    float _424 = fma(_404, (*spvDescriptorSet0.vp_c10)._m0[6].x, _414);
    float _426 = fma(_354, _150, _174);
    float _428 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[4].z, _420);
    float _430 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[5].z, _422);
    float _432 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[6].z, _424);
    bool _434 = !_394;
    float _436 = _430;
    float _438 = _428;
    float _440 = _432;
    float _442 = _432;
    float _444 = _428;
    float _462;
    if (!_434)
    {
        float _446 = in.m_51.x;
        float _448 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _450 = _446 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _452 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[12].x, _126);
        float _454 = _452 * _448;
        float _456 = floor(_454);
        float _458 = -_456;
        float _460 = _454 + _458;
        _462 = _460;
        _464 = true;
    }
    else
    {
        float _466 = float(_92);
        float _468 = 1.0 / _466;
        float _470 = _126 * _468;
        _462 = _470;
    }
    _464 = false;
    float _472 = _462;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _476 = _472 + _474;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _480 = _472 + _478;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _482;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _488 = _486 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _490;
    float _494 = 1.0 / _484;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _498 = _472 + _496;
    bool _500 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _502 = isnan(_472);
    bool _504 = _500 || _502;
    bool _506 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _508 = _504 || _506;
    float _510 = float(_508);
    bool _512 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _514 = 1.0 / _488;
    bool _516 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _518 = isnan(_472);
    bool _520 = _516 || _518;
    bool _522 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _524 = _520 || _522;
    float _526 = float(_524);
    float _528 = 1.0 / _492;
    float _530 = _476 * _494;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _532;
    float _536 = fma(_534, _530, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _538 = _480 * _514;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _542 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _540;
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _544;
    float _548 = fma(_542, _530, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _550 = fma(_546, _530, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _552 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _554 = isnan(_472);
    bool _556 = _552 || _554;
    bool _558 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _560 = _556 || _558;
    float _562 = float(_560);
    float _564 = _498 * _528;
    bool _566 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _568 = isnan(_472);
    bool _570 = _566 || _568;
    bool _572 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _574 = _570 || _572;
    float _576 = float(_574);
    float _578 = -_526;
    float _580 = _578 + 1.0;
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _584 = _582 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _586 = -_576;
    float _588 = _586 + 1.0;
    float _590 = _576 * _580;
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _594 = _592 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _598 = _596 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _600 = _562 * _588;
    float _602 = -_562;
    float _604 = _602 + 1.0;
    float _606 = fma(_584, _538, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _608 = fma(_594, _538, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _610 = fma(_598, _538, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _612 = _510 * _604;
    float _614 = in.m_49.x;
    float _616 = in.m_49.y;
    float _618 = in.m_49.z;
    float _620 = _536 * _612;
    float _622 = _548 * _612;
    float _624 = _550 * _612;
    float _626 = -_510;
    float _628 = _626 + 1.0;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _632 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _630;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _636 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _634;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _638;
    float _642 = fma(_628, (*spvDescriptorSet0.vp_c9)._m0[143].x, _620);
    float _644 = fma(_628, (*spvDescriptorSet0.vp_c9)._m0[143].y, _622);
    float _646 = fma(_628, (*spvDescriptorSet0.vp_c9)._m0[143].z, _624);
    float _648 = fma(_632, _564, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _650 = fma(_636, _564, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _652 = fma(_640, _564, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _654 = fma(_606, _600, _642);
    float _656 = fma(_608, _600, _644);
    float _658 = fma(_610, _600, _646);
    float _660 = fma(_648, _590, _654);
    float _662 = fma(_650, _590, _656);
    float _664 = fma(_652, _590, _658);
    float _666 = fma(_526, (*spvDescriptorSet0.vp_c9)._m0[146].x, _660);
    float _668 = fma(_526, (*spvDescriptorSet0.vp_c9)._m0[146].y, _662);
    float _670 = fma(_526, (*spvDescriptorSet0.vp_c9)._m0[146].z, _664);
    float _672 = _666 * _614;
    float _674 = _668 * _616;
    float _676 = _670 * _618;
    bool _678 = !_512;
    float _696;
    if (!_678)
    {
        float _680 = in.m_51.x;
        float _682 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _684 = _680 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _686 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[11].x, _126);
        float _688 = _686 * _682;
        float _690 = floor(_688);
        float _692 = -_690;
        float _694 = _688 + _692;
        _696 = _694;
        _698 = true;
    }
    else
    {
        float _700 = float(_92);
        float _702 = 1.0 / _700;
        float _704 = _126 * _702;
        _696 = _704;
    }
    _698 = false;
    float _706 = _696;
    float _708 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _710 = _706 + _708;
    bool _712 = _706 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _714 = isnan(_706);
    bool _716 = _712 || _714;
    bool _718 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _720 = _716 || _718;
    float _722 = float(_720);
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _726 = _706 + _724;
    bool _728 = _706 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _730 = isnan(_706);
    bool _732 = _728 || _730;
    bool _734 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _736 = _732 || _734;
    float _738 = float(_736);
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _740;
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _746 = _744 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _748 = _706 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _750 = isnan(_706);
    bool _752 = _748 || _750;
    bool _754 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _756 = _752 || _754;
    float _758 = float(_756);
    float _760 = -_722;
    float _762 = _760 + 1.0;
    float _764 = 1.0 / _746;
    float _766 = _758 * _762;
    float _768 = -_758;
    float _770 = _768 + 1.0;
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _774 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _772;
    bool _776 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _778 = 1.0 / _742;
    float _780 = _738 * _770;
    float _782 = -_738;
    float _784 = _782 + 1.0;
    float _786 = _726 * _764;
    float _788 = _710 * _778;
    float _790 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _792 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _790;
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _796 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _794;
    float _798 = fma(_774, _788, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _800 = fma(_792, _788, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _802 = fma(_796, _788, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _804 = _798 * _780;
    float _806 = _800 * _780;
    float _808 = _802 * _780;
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _812 = _810 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _816 = _814 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _820 = _818 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _822 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[107].x, _804);
    float _824 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[107].y, _806);
    float _826 = fma(_812, _786, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _828 = fma(_816, _786, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _830 = fma(_820, _786, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _832 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[107].z, _808);
    float _834 = fma(_826, _766, _822);
    float _836 = fma(_828, _766, _824);
    float _838 = fma(_830, _766, _832);
    float _840 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[109].x, _834);
    float _842 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[109].y, _836);
    float _844 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[109].z, _838);
    bool _846 = !_776;
    float _864;
    if (!_846)
    {
        float _848 = in.m_51.x;
        float _850 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _852 = _848 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _854 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[11].y, _126);
        float _856 = _854 * _850;
        float _858 = floor(_856);
        float _860 = -_858;
        float _862 = _856 + _860;
        _864 = _862;
        _866 = true;
    }
    else
    {
        float _868 = float(_92);
        float _870 = 1.0 / _868;
        float _872 = _126 * _870;
        _864 = _872;
    }
    _866 = false;
    float _874 = _864;
    float _876 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _878 = _874 + _876;
    float _880 = _840 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _882 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _884 = _882 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _886 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _888 = _886 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _890 = _874 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _892 = isnan(_874);
    bool _894 = _890 || _892;
    bool _896 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _898 = _894 || _896;
    float _900 = float(_898);
    float _902 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _904 = _902 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _906 = _874 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _908 = isnan(_874);
    bool _910 = _906 || _908;
    bool _912 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _914 = _910 || _912;
    float _916 = float(_914);
    float _918 = 1.0 / _884;
    float _920 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _922 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _920;
    float _924 = -_900;
    float _926 = _924 + 1.0;
    bool _928 = _874 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _930 = isnan(_874);
    bool _932 = _928 || _930;
    bool _934 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _936 = _932 || _934;
    float _938 = float(_936);
    float _940 = _842 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _942 = _844 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _944 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _946 = 1.0 / _888;
    float _948 = 1.0 / _904;
    float _950 = _922 * _918;
    float _952 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _954 = _952 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _956 = _916 * _926;
    float _958 = -_916;
    float _960 = _958 + 1.0;
    float _962 = fma(_950, _878, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _964 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _966 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _964;
    float _968 = _938 * _960;
    float _970 = _954 * _946;
    float _972 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _974 = _874 + _972;
    bool _976 = _874 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _978 = isnan(_874);
    bool _980 = _976 || _978;
    bool _982 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _984 = _980 || _982;
    float _986 = float(_984);
    float _988 = _962 * _968;
    float _990 = -_938;
    float _992 = _990 + 1.0;
    float _994 = fma(_970, _974, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _996 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _998 = _874 + _996;
    float _1000 = _966 * _948;
    float _1002 = -_986;
    float _1004 = _1002 + 1.0;
    float _1006 = fma(_992, (*spvDescriptorSet0.vp_c9)._m0[115].x, _988);
    float _1008 = _880 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1010 = fma(_1000, _998, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1012 = _900 * _1004;
    float _1014 = fma(_994, _956, _1006);
    float _1016 = fma(_1010, _1012, _1014);
    float _1018 = _942 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1020 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1016);
    float _1022 = _940 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1024 = _1020 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _1008;
    out.m_53.y = _1022;
    out.m_53.z = _1018;
    out.m_53.w = _1024;
    bool _1026 = !_944;
    float _1044;
    if (!_1026)
    {
        float _1028 = in.m_51.x;
        float _1030 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1032 = _1028 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1034 = fma(_1032, (*spvDescriptorSet0.vp_c9)._m0[11].z, _126);
        float _1036 = _1034 * _1030;
        float _1038 = floor(_1036);
        float _1040 = -_1038;
        float _1042 = _1036 + _1040;
        _1044 = _1042;
        _1046 = true;
    }
    else
    {
        float _1048 = float(_92);
        float _1050 = 1.0 / _1048;
        float _1052 = _126 * _1050;
        _1044 = _1052;
    }
    _1046 = false;
    float _1054 = _1044;
    float _1056 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1058 = _1054 + _1056;
    float _1060 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1062 = _1054 + _1060;
    float _1064 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1066 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1064;
    float _1068 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1070 = _1068 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1072 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1074 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _1072;
    float _1076 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _1078 = _1076 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _1080 = 1.0 / _1066;
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1084 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1082;
    float _1086 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1088 = _1086 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1090 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1092 = _1054 + _1090;
    float _1094 = 1.0 / _1070;
    bool _1096 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1098 = 1.0 / _1074;
    float _1100 = -(*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _1102 = (*spvDescriptorSet0.vp_c9)._m0[130].w + _1100;
    float _1104 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1106 = _1054 + _1104;
    float _1108 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1110 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1108;
    float _1112 = _1106 * _1080;
    float _1114 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1116 = _1054 + _1114;
    float _1118 = 1.0 / _1084;
    float _1120 = _1092 * _1094;
    bool _1122 = _1054 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1124 = isnan(_1054);
    bool _1126 = _1122 || _1124;
    bool _1128 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1130 = _1126 || _1128;
    float _1132 = float(_1130);
    float _1134 = -_1132;
    float _1136 = _1134 + 1.0;
    float _1138 = 1.0 / _1088;
    float _1140 = _1116 * _1098;
    bool _1142 = _1054 >= (*spvDescriptorSet0.vp_c9)._m0[130].w;
    bool _1144 = isnan(_1054);
    bool _1146 = _1142 || _1144;
    bool _1148 = isnan((*spvDescriptorSet0.vp_c9)._m0[130].w);
    bool _1150 = _1146 || _1148;
    float _1152 = float(_1150);
    float _1154 = -_1152;
    float _1156 = _1154 + 1.0;
    float _1158 = 1.0 / _1078;
    float _1160 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _1162 = _1054 + _1160;
    float _1164 = _1058 * _1118;
    bool _1166 = _1054 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _1168 = isnan(_1054);
    bool _1170 = _1166 || _1168;
    bool _1172 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _1174 = _1170 || _1172;
    float _1176 = float(_1174);
    float _1178 = fma(_1110, _1164, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1180 = 1.0 / _1102;
    float _1182 = _1062 * _1138;
    float _1184 = _1176 * _1156;
    bool _1186 = _1054 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1188 = isnan(_1054);
    bool _1190 = _1186 || _1188;
    bool _1192 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1194 = _1190 || _1192;
    float _1196 = float(_1194);
    float _1198 = -_1176;
    float _1200 = _1198 + 1.0;
    bool _1202 = _1054 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1204 = isnan(_1054);
    bool _1206 = _1202 || _1204;
    bool _1208 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1210 = _1206 || _1208;
    float _1212 = float(_1210);
    float _1214 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1216 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1214;
    float _1218 = _1162 * _1158;
    float _1220 = -(*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _1222 = _1054 + _1220;
    float _1224 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1226 = _1224 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1228 = _1196 * _1200;
    float _1230 = fma(_1216, _1112, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1232 = -_1196;
    float _1234 = _1232 + 1.0;
    float _1236 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1238 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1236;
    float _1240 = _1222 * _1180;
    float _1242 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1244 = _1242 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1246 = fma(_1238, _1112, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1248 = fma(_1226, _1120, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1250 = _1132 * _1234;
    float _1252 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1254 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1252;
    float _1256 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1258 = _1256 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1260 = fma(_1244, _1120, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1262 = fma(_1254, _1112, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _1264 = _1054 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1266 = isnan(_1054);
    bool _1268 = _1264 || _1266;
    bool _1270 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1272 = _1268 || _1270;
    float _1274 = float(_1272);
    float _1276 = fma(_1258, _1120, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    bool _1278 = _1054 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1280 = isnan(_1054);
    bool _1282 = _1278 || _1280;
    bool _1284 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1286 = _1282 || _1284;
    float _1288 = float(_1286);
    float _1290 = _1274 * _1136;
    bool _1292 = _1054 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1294 = isnan(_1054);
    bool _1296 = _1292 || _1294;
    bool _1298 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1300 = _1296 || _1298;
    float _1302 = float(_1300);
    float _1304 = -_1288;
    float _1306 = _1304 + 1.0;
    float _1308 = -_1274;
    float _1310 = _1308 + 1.0;
    float _1312 = _1302 * _1306;
    float _1314 = _1212 * _1310;
    float _1316 = -_1212;
    float _1318 = _1316 + 1.0;
    float _1320 = -_1302;
    float _1322 = _1320 + 1.0;
    float _1324 = _1230 * _1312;
    float _1326 = _1246 * _1312;
    float _1328 = _1262 * _1312;
    float _1330 = _1288 * _1318;
    float _1332 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1334 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1332;
    float _1336 = fma(_1322, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1324);
    float _1338 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1340 = _1338 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1342 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1344 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1342;
    float _1346 = fma(_1322, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1326);
    float _1348 = fma(_1322, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1328);
    float _1350 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1352 = _1350 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1354 = fma(_1334, _1164, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1356 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1358 = _1356 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1360 = fma(_1248, _1330, _1336);
    float _1362 = fma(_1344, _1164, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1364 = fma(_1352, _1182, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1366 = fma(_1340, _1182, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1368 = fma(_1260, _1330, _1346);
    float _1370 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1372 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1370;
    float _1374 = fma(_1276, _1330, _1348);
    float _1376 = fma(_1354, _1314, _1360);
    float _1378 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1380 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1378;
    float _1382 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1384 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1382;
    float _1386 = fma(_1358, _1182, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1388 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _1390 = _1388 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1392 = fma(_1372, _1140, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1394 = fma(_1362, _1314, _1368);
    float _1396 = fma(_1178, _1314, _1374);
    float _1398 = fma(_1366, _1290, _1376);
    float _1400 = fma(_1380, _1140, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1402 = fma(_1384, _1140, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1404 = fma(_1390, _1218, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    float _1406 = fma(_1364, _1290, _1394);
    float _1408 = fma(_1386, _1290, _1396);
    float _1410 = fma(_1392, _1250, _1398);
    float _1412 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _1414 = _1412 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1416 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _1418 = _1416 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1420 = fma(_1414, _1218, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _1422 = fma(_1400, _1250, _1406);
    float _1424 = -(*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1426 = (*spvDescriptorSet0.vp_c9)._m0[130].x + _1424;
    float _1428 = -(*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1430 = (*spvDescriptorSet0.vp_c9)._m0[130].y + _1428;
    float _1432 = fma(_1418, _1218, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    float _1434 = fma(_1402, _1250, _1408);
    float _1436 = -(*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1438 = (*spvDescriptorSet0.vp_c9)._m0[130].z + _1436;
    float _1440 = fma(_1404, _1228, _1410);
    float _1442 = fma(_1426, _1240, (*spvDescriptorSet0.vp_c9)._m0[129].x);
    float _1444 = fma(_1430, _1240, (*spvDescriptorSet0.vp_c9)._m0[129].y);
    float _1446 = fma(_1420, _1228, _1422);
    float _1448 = fma(_1438, _1240, (*spvDescriptorSet0.vp_c9)._m0[129].z);
    float _1450 = fma(_1432, _1228, _1434);
    float _1452 = fma(_1442, _1184, _1440);
    float _1454 = fma(_1444, _1184, _1446);
    float _1456 = fma(_1448, _1184, _1450);
    float _1458 = fma(_1152, (*spvDescriptorSet0.vp_c9)._m0[130].x, _1452);
    float _1460 = fma(_1152, (*spvDescriptorSet0.vp_c9)._m0[130].y, _1454);
    float _1462 = fma(_1152, (*spvDescriptorSet0.vp_c9)._m0[130].z, _1456);
    bool _1464 = !_1096;
    int _1466 = as_type<int>(_1184);
    float _1468 = _1444;
    bool _1470 = _1096;
    float _1488;
    if (!_1464)
    {
        float _1472 = in.m_51.x;
        float _1474 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1476 = _1472 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1478 = fma(_1476, (*spvDescriptorSet0.vp_c9)._m0[11].w, _126);
        float _1480 = _1478 * _1474;
        float _1482 = floor(_1480);
        float _1484 = -_1482;
        float _1486 = _1480 + _1484;
        _1466 = as_type<int>(_1482);
        _1488 = _1486;
        _1490 = true;
    }
    else
    {
        float _1492 = float(_92);
        float _1494 = 1.0 / _1492;
        float _1496 = _126 * _1494;
        _1488 = _1496;
    }
    _1490 = false;
    int _1498 = _1466;
    float _1500 = _1488;
    float _1502 = in.m_55.x;
    float _1504 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1506 = log2(_1504);
    float _1508 = _408 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1510 = in.m_51.x;
    int _1512 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1514 = _1512 != 0;
    float _1516 = _672 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1518 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1520 = _1518 != 0;
    float _1522 = in.m_51.z;
    int _1524 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1526 = _1524 != 0;
    float _1528 = fma(_396, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1508);
    int _1530 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1532 = _1530 != 0;
    float _1534 = in.m_51.y;
    float _1536 = fma(_426, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1528);
    float _1538 = in.m_55.y;
    float _1540 = _126 * _1506;
    float _1542 = in.m_51.w;
    float _1544 = _676 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1546 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1548 = _1498;
    float _1550 = _1502;
    if (_1514)
    {
        float _1552 = -_1502;
        float _1554 = _1552 + 1.0;
        _1548 = as_type<int>(_1554);
    }
    int _1556 = _1548;
    if (!_1514)
    {
        _1468 = _1502;
    }
    float _1558 = _1468;
    float _1560 = in.m_57.y;
    float _1562 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1564 = _1558;
    if (_1514)
    {
        bool _1566 = _1510 > 0.5;
        _1470 = _1566;
    }
    bool _1568 = _1470;
    float _1570 = _1510 * 2.0;
    float _1572 = exp2(_1540);
    float _1574 = _1522 * 2.0;
    if (_1514)
    {
        float _1576 = _1568 ? as_type<float>(_1556) : _1502;
        _1564 = _1576;
    }
    float _1578 = _1564;
    bool _1580 = _1522 > 0.5;
    float _1582 = _1534 * 2.0;
    bool _1584 = _1534 > 0.5;
    float _1586 = _1534 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1588 = floor(_1574);
    float _1590 = -_1538;
    float _1592 = _1590 + 1.0;
    bool _1594 = _1500 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1596 = isnan(_1500);
    bool _1598 = _1594 || _1596;
    bool _1600 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1602 = _1598 || _1600;
    float _1604 = float(_1602);
    float _1606 = fma(_1586, -2.0, _1562);
    float _1608 = _1546 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1610 = _1580 ? as_type<int>(_1592) : as_type<int>(_1538);
    float _1612 = floor(_1570);
    int _1614 = _1584 ? as_type<int>(_1592) : as_type<int>(_1538);
    float _1616 = -_1572;
    float _1618 = _1616 + 1.0;
    bool _1620 = _1542 > 0.5;
    float _1622 = _408 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1624 = _1526 ? as_type<float>(_1610) : _1538;
    out.m_59.y = _1560;
    float _1626 = _1532 ? as_type<float>(_1614) : _1538;
    float _1628 = floor(_1582);
    bool _1630 = _1588 >= 0.0;
    bool _1632 = isnan(_1588);
    bool _1634 = _1630 || _1632;
    bool _1636 = isnan(0.0);
    bool _1638 = _1634 || _1636;
    float _1640 = fma(_396, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1622);
    float _1642 = _1538;
    if (_1520)
    {
        float _1644 = _1620 ? _1592 : _1538;
        _1642 = _1644;
    }
    float _1646 = _1642;
    bool _1648 = _1588 > 0.0;
    int _1650 = _1638 ? 0 : 1;
    float _1652 = fma(_1608, _1646, -0.5);
    bool _1654 = _1612 > 0.0;
    bool _1656 = _1612 >= 0.0;
    bool _1658 = isnan(_1612);
    bool _1660 = _1656 || _1658;
    bool _1662 = isnan(0.0);
    bool _1664 = _1660 || _1662;
    int _1666 = ~_1650;
    int _1668 = _1666 + 1;
    int _1670 = _1668 + 1;
    float _1672 = in.m_57.x;
    int _1674 = _1664 ? 0 : 1;
    bool _1676 = _1628 > 0.0;
    bool _1678 = _1628 >= 0.0;
    bool _1680 = isnan(_1628);
    bool _1682 = _1678 || _1680;
    bool _1684 = isnan(0.0);
    bool _1686 = _1682 || _1684;
    int _1688 = _1686 ? 0 : 1;
    int _1690 = ~_1674;
    int _1692 = _1690 + 1;
    int _1694 = _1692 + 1;
    int _1696 = ~_1688;
    int _1698 = _1696 + 1;
    int _1700 = _1698 + 1;
    int _1702 = _1670;
    int _1704 = _1694;
    int _1706 = _1700;
    if (!_1648)
    {
        int _1708 = ~_1650;
        int _1710 = _1708 + 1;
        _1702 = _1710;
    }
    int _1712 = _1702;
    if (!_1654)
    {
        int _1714 = ~_1674;
        int _1716 = _1714 + 1;
        _1704 = _1716;
    }
    int _1718 = _1704;
    int _1720 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1722 = _1720 != 0;
    int _1724 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1726 = _1724 != 0;
    int _1728 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1730 = _1728 != 0;
    if (!_1676)
    {
        int _1732 = ~_1688;
        int _1734 = _1732 + 1;
        _1706 = _1734;
    }
    int _1736 = _1706;
    float _1738 = in.m_61.x;
    float _1740 = in.m_61.y;
    float _1742 = in.m_61.z;
    bool _1744 = !_1722;
    int _1746 = _1744 ? 0 : 1;
    bool _1748 = !_1726;
    int _1750 = _1748 ? 0 : 1;
    out.m_59.x = _1672;
    int _1752 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1754 = _1752 != 0;
    int _1756 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1758 = _1756 != 0;
    float _1760 = _408 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _1762 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1764 = isnan(0.0);
    bool _1766 = _1762 || _1764;
    bool _1768 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1770 = _1766 || _1768;
    float _1772 = fma(_396, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1760);
    float _1774 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1776 = _1774 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1778 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1780 = _1770 ? _1618 : 0.0;
    float _1782 = _1510 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1784 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1786 = _1784 != 0;
    float _1788 = 1.0 / _1776;
    int _1790 = abs(_1746);
    float _1792 = -_1778;
    float _1794 = fma(_1782, 2.0, _1792);
    int _1796 = abs(_1750);
    float _1798 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1738);
    float _1800 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1802 = _1800 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1804 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1742);
    float _1806 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1808 = _1806 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1810 = fma(_426, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1640);
    float _1812 = fma(_426, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1772);
    float _1814 = _674 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1816 = 1.0 / _1802;
    float _1818 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1740);
    float _1820 = _1516 * _1798;
    float _1822 = _1544 * _1804;
    float _1824 = _1814 * _1818;
    float _1826 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1828 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1826;
    float _1830 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1832 = _1830 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1834 = 1.0 / _1808;
    float _1836 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1838 = _1500 + _1836;
    float _1840 = _1828 * _1788;
    float _1842 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1844 = _1500 + _1842;
    float _1846 = _1510 + _1522;
    float _1848 = float(_1712);
    float _1850 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1606);
    float _1852 = _1832 * _1816;
    float _1854 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1856 = _1534 + _1522;
    float _1858 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1860 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1858;
    float _1862 = fma(_1852, _1838, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _1864 = _1500 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1866 = isnan(_1500);
    bool _1868 = _1864 || _1866;
    bool _1870 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1872 = _1868 || _1870;
    float _1874 = float(_1872);
    float _1876 = _1856 + (-1.0);
    float _1878 = _1510 + _1534;
    float _1880 = _1846 + (-1.0);
    float _1882 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1884 = fma(_1876, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1886 = _1878 + (-1.0);
    float _1888 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1890 = _1500 + _1888;
    float _1892 = _1860 * _1834;
    float _1894 = fma(_1886, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1896 = fma(_1840, _1890, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1898 = _1854 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1900 = -_1874;
    float _1902 = _1900 + 1.0;
    float _1904 = fma(_1892, _1844, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1906 = fma(_1880, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1908 = fma(_1898, _1626, -0.5);
    bool _1910 = _1500 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1912 = isnan(_1500);
    bool _1914 = _1910 || _1912;
    bool _1916 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1918 = _1914 || _1916;
    float _1920 = float(_1918);
    int _1922 = 0;
    int _1924 = as_type<int>(_1848);
    float _1926 = as_type<float>(_1736);
    float _1928 = 0.5;
    if (_1758)
    {
        float _1930 = -_1502;
        float _1932 = _1930 + 1.0;
        _1922 = as_type<int>(_1932);
    }
    int _1934 = _1922;
    float _1936 = _1882 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1938 = float(_1796);
    float _1940 = -_1920;
    float _1942 = _1940 + 1.0;
    float _1944 = float(_1718);
    float _1946 = fma(_1624, _1936, -0.5);
    bool _1948 = _1500 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1950 = isnan(_1500);
    bool _1952 = _1948 || _1950;
    bool _1954 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1956 = _1952 || _1954;
    float _1958 = float(_1956);
    float _1960 = _1920 * _1902;
    float _1962 = _1604 * _1942;
    float _1964 = in.m_63.x;
    float _1966 = in.m_63.y;
    float _1968 = in.m_63.z;
    float _1970 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1972 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1974 = 1.0 + _1972;
    float _1976 = _1938 * _1944;
    float _1978 = -_1604;
    float _1980 = _1978 + 1.0;
    float _1982 = fma(_1534, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1970);
    float _1984 = _1510 + (-0.5);
    float _1986 = _1976 * (-2.0);
    float _1988 = 1.0 / _1974;
    float _1990 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1982);
    float _1992 = float(_1790);
    float _1994 = _1958 * _1980;
    float _1996 = _1534 + (-0.5);
    float _1998 = -_1850;
    float _2000 = fma(_1990, _1908, _1998);
    float _2002 = float(_1736);
    float _2004 = _1992 * _1848;
    float _2006 = _1896 * _1994;
    float _2008 = _1986;
    if (_1754)
    {
        float _2010 = -_1502;
        float _2012 = _2010 + 1.0;
        _1924 = as_type<int>(_2012);
    }
    int _2014 = _1924;
    float _2016 = _2004 * (-2.0);
    if (!_1754)
    {
        _1926 = _1502;
    }
    float _2018 = _1926;
    float _2020 = -_1958;
    float _2022 = _2020 + 1.0;
    float _2024 = -_126;
    float _2026 = fma(_2024, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1794);
    float _2028 = fma(_1894, _2016, _1894);
    float _2030 = fma(_2016, _1964, _1964);
    float _2032 = _1536 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2034 = fma(_1986, _1966, _1966);
    float _2036 = _1810 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2038 = fma(_1884, _1986, _1884);
    float _2040 = -_2032;
    float _2042 = _2040 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2044 = _1780 * _1988;
    bool _2046 = !_1730;
    int _2048 = _2046 ? 0 : 1;
    float _2050 = _1812 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _2052 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2054 = isnan(1.0);
    bool _2056 = _2052 || _2054;
    bool _2058 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2060 = _2056 || _2058;
    float _2062 = -_2036;
    float _2064 = _2062 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2066 = _2042 * _2042;
    float _2068 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2070 = fma(_1984, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2030);
    float _2072 = fma(_1996, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2034);
    float _2074 = -_2050;
    float _2076 = _2074 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    bool _2078 = !_2060;
    float _2080 = _2078 ? _126 : _2044;
    float _2082 = fma(_2064, _2064, _2066);
    float _2084 = fma(_2022, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2006);
    int _2086 = abs(_2048);
    float _2088 = fma(_2076, _2076, _2082);
    float _2090 = _2018;
    float _2092 = _2066;
    float _2094 = _2076;
    if (_1754)
    {
        float _2096 = _1580 ? as_type<float>(_2014) : _1502;
        _2090 = _2096;
    }
    float _2098 = _2090;
    float _2100 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2102 = float(_2086);
    float _2104 = fma(_2080, _2038, _2072);
    float _2106 = fma(_2080, _2028, _2070);
    float _2108 = rsqrt(_2088);
    if (_1786)
    {
        _2092 = _1510;
    }
    float _2110 = _2092;
    float _2112 = _2102 * _2002;
    float _2114 = _2110;
    if (!_1786)
    {
        _2114 = _1522;
    }
    float _2116 = _2114;
    float _2118 = _2106 * 0.15915493667125701904296875;
    if (!_1786)
    {
        _2008 = _1534;
    }
    float _2120 = _2008;
    float _2122 = _2112 * (-2.0);
    float _2124 = _2104 * 0.15915493667125701904296875;
    float _2126 = _2116 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2128 = _2120;
    if (_1786)
    {
        _2128 = _1510;
    }
    float _2130 = _2128;
    float _2132 = fma(_2122, _1968, _1968);
    float _2134 = _1522 + (-0.5);
    float _2136 = fma(_1906, _2122, _1906);
    float _2138 = _2124 * 6.283185482025146484375;
    float _2140 = sin(_2138);
    float _2142 = -_2100;
    float _2144 = fma(_2126, 2.0, _2142);
    float _2146 = fma(_2134, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2132);
    float _2148 = _2064 * _2108;
    float _2150 = _2076 * _2108;
    float _2152 = _2042 * _2108;
    float _2154 = fma(_2080, _2136, _2146);
    float _2156 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2158 = _2148 * _2156;
    float _2160 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2162 = _2150 * _2160;
    float _2164 = _2154 * 0.15915493667125701904296875;
    float _2166 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2168 = -_2158;
    float _2170 = fma(_2150, _2166, _2168);
    float _2172 = _2124 * 6.283185482025146484375;
    float _2174 = cos(_2172);
    float _2176 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2178 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2180 = _2152 * _2178;
    float _2182 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2184 = -_2162;
    float _2186 = fma(_2152, _2182, _2184);
    float _2188 = fma(_2130, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2176);
    float _2190 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2192 = -_2180;
    float _2194 = fma(_2148, _2190, _2192);
    if (!_1786)
    {
        _2094 = _1522;
    }
    float _2196 = _2094;
    float _2198 = _2118 * 6.283185482025146484375;
    float _2200 = sin(_2198);
    float _2202 = _2170 * _2170;
    float _2204 = _2196;
    if (_1786)
    {
        _2204 = _1534;
    }
    float _2206 = _2204;
    float _2208 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2210 = _2130 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2212 = fma(_2186, _2186, _2202);
    if (_1758)
    {
        float _2214 = _1584 ? as_type<float>(_1934) : _1502;
        _1550 = _2214;
    }
    float _2216 = _1550;
    float _2218 = fma(_1534, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2068);
    float _2220 = _2118 * 6.283185482025146484375;
    float _2222 = cos(_2220);
    float _2224 = -_2208;
    float _2226 = fma(_2210, 2.0, _2224);
    float _2228 = fma(_1862, _1962, _2084);
    float _2230 = -_126;
    float _2232 = fma(_2230, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2226);
    float _2234 = fma(_1904, _1960, _2228);
    float _2236 = _2164 * 6.283185482025146484375;
    float _2238 = cos(_2236);
    float _2240 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2242 = fma(_2194, _2194, _2212);
    float _2244 = _2164 * 6.283185482025146484375;
    float _2246 = sin(_2244);
    float _2248 = _2222 * _2140;
    float _2250 = fma(_2206, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2240);
    float _2252 = _2222 * _2174;
    float _2254 = _2200 * _2140;
    float _2256 = rsqrt(_2242);
    float _2258 = _2200 * _2174;
    float _2260 = _2174 * _2238;
    float _2262 = _2140 * _2238;
    float _2264 = _2238 * _1824;
    float _2266 = -_2248;
    float _2268 = fma(_2246, _2258, _2266);
    float _2270 = -_2258;
    float _2272 = fma(_2246, _2248, _2270);
    float _2274 = -_1824;
    float _2276 = _2246 * _2274;
    float _2278 = _2222 * _2264;
    float _2280 = fma(_2246, _2252, _2254);
    float _2282 = fma(_2246, _2254, _2252);
    float _2284 = fma(_2260, _1820, _2276);
    float _2286 = _2200 * _2264;
    float _2288 = _2186 * _2256;
    float _2290 = fma(_2280, _1820, _2278);
    float _2292 = _2170 * _2256;
    float _2294 = fma(_2268, _1820, _2286);
    float _2296 = _2152 * _2288;
    float _2298 = fma(_2262, _1822, _2284);
    float _2300 = fma(_2272, _1822, _2290);
    float _2302 = fma(_2282, _1822, _2294);
    float _2304 = _2194 * _2256;
    float _2306 = _2150 * _2292;
    float _2308 = -_2296;
    float _2310 = fma(_2148, _2292, _2308);
    float _2312 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2314 = -_2306;
    float _2316 = fma(_2152, _2304, _2314);
    float _2318 = _2310 * _2300;
    float _2320 = _2316 * _2300;
    float _2322 = fma(_2304, _2298, _2318);
    float _2324 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2326 = (*spvDescriptorSet0.vp_c9)._m0[88].z;
    if (!_1786)
    {
        _2326 = _1522;
    }
    float _2328 = _2326;
    float _2330 = fma(_2288, _2298, _2320);
    float _2332 = fma(_2150, _2302, _2322);
    float _2334 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2336 = _2328;
    float _2338 = _2330;
    if (_1786)
    {
        _2336 = _1534;
    }
    float _2340 = _2336;
    float _2342 = fma(_2148, _2302, _2330);
    float _2344 = _2050 + _2332;
    float _2346 = _2344;
    if (_1786)
    {
        _2338 = _1534;
    }
    float _2348 = _2338;
    float _2350 = fma(_1510, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2334);
    float _2352 = _2036 + _2342;
    float _2354 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2356 = _2344 + _2354;
    float _2358 = fma(_1510, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2324);
    float _2360 = _2348;
    float _2362 = _2352;
    if (!_1786)
    {
        _2360 = _1510;
    }
    float _2364 = _2360;
    float _2366 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2368 = _2352 + _2366;
    float _2370 = _2356 * _2356;
    float _2372 = _2312 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2374 = _2148 * _2304;
    float _2376 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2378 = fma(_2368, _2368, _2370);
    float _2380 = fma(_2372, _1578, -0.5);
    float _2382 = -_2374;
    float _2384 = fma(_2150, _2288, _2382);
    float _2386 = _2340 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2388 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2350);
    float _2390 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2358);
    float _2392 = sqrt(_2378);
    float _2394 = _2384 * _2300;
    float _2396 = fma(_2388, _2380, _2026);
    float _2398 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2250);
    float _2400 = fma(_2292, _2298, _2394);
    float _2402 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2404 = _2376 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2406 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2408 = fma(_2152, _2302, _2400);
    float _2410 = fma(_2404, _2098, -0.5);
    float _2412 = _2032 + _2408;
    bool _2414 = _2392 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2416 = _2402 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2418 = fma(_2386, -2.0, _2406);
    float _2420 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2188);
    float _2422 = fma(_2416, _2216, -0.5);
    float _2424 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2418);
    float _2426 = fma(_2420, _2410, _2232);
    float _2428 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2430 = _2364 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2432 = -_126;
    float _2434 = fma(_2432, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2144);
    float _2436 = fma(_2430, -2.0, _2428);
    float _2438 = fma(_2390, _2422, _2434);
    float _2440 = -_2424;
    float _2442 = fma(_2398, _1652, _2440);
    float _2444 = _2428;
    if (!_2414)
    {
        _2444 = _2412;
    }
    float _2446 = _2444;
    bool _2448 = !_2414;
    float _2450 = _2446;
    if (!_2448)
    {
        float _2452 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2454 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2456 = _2392 + _2454;
        float _2458 = rsqrt(_2378);
        float _2460 = _2456 * _2452;
        float _2462 = _2412 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2464 = _2460 * 0.15915493667125701904296875;
        float _2466 = _2464 * 6.283185482025146484375;
        float _2468 = cos(_2466);
        float _2470 = _2464 * 6.283185482025146484375;
        float _2472 = sin(_2470);
        float _2474 = _2468 + (-1.0);
        float _2476 = _2474 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2478 = fma(_2472, _2462, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2480 = fma(_2412, _2468, _2476);
        float _2482 = _2458 * _2478;
        float _2484 = fma(_2368, _2482, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2486 = fma(_2356, _2482, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2450 = _2480;
        _2362 = _2484;
        _2346 = _2486;
    }
    float _2488 = _2450;
    float _2490 = _2362;
    float _2492 = _2346;
    float _2494 = -_2032;
    float _2496 = _2494 + _2488;
    float _2498 = in.m_57.z;
    float _2500 = -_2036;
    float _2502 = _2500 + _2490;
    float _2504 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2218);
    float _2506 = _2496 * _2496;
    float _2508 = in.m_57.w;
    float _2510 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2436);
    float _2512 = -_2050;
    float _2514 = _2512 + _2492;
    float _2516 = fma(_2502, _2502, _2506);
    float _2518 = fma(_1874, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2234);
    float _2520 = -_2510;
    float _2522 = fma(_2504, _1946, _2520);
    float _2524 = _1458 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2526 = fma(_2514, _2514, _2516);
    float _2528 = _1462 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2530 = _1460 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2532 = _2524 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2534 = sqrt(_2526);
    float _2536 = _2528 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2538 = _2530 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2540 = _2000 + 0.5;
    float _2542 = _2438 + 0.5;
    float _2544 = _2396 + 0.5;
    float _2546 = _2426 + 0.5;
    float _2548 = _2518 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2550 = _2442 + 0.5;
    float _2552 = _2522 + 0.5;
    out.m_59.z = _2498;
    out.m_59.w = _2508;
    bool _2554 = _2534 > 0.0;
    out.m_65.x = _2532;
    out.m_65.y = _2538;
    out.m_65.z = _2536;
    out.m_65.w = _2548;
    out.m_67.x = _2544;
    out.m_67.y = _2540;
    out.m_67.z = _2546;
    out.m_67.w = _2550;
    out.m_69.x = _2542;
    out.m_69.y = _2552;
    bool _2556 = !_2554;
    float _2558 = _2550;
    float _2560 = _2544;
    float _2562 = _2490;
    float _2564 = _2488;
    float _2566 = _2492;
    if (!_2556)
    {
        bool _2568 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2570 = _2540;
        if (_2568)
        {
            float _2572 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2570 = _2572;
        }
        float _2574 = _2570;
        float _2576 = _2574;
        if (_2568)
        {
            float _2578 = _428 * _2574;
            _2558 = _2578;
        }
        float _2580 = _2558;
        float _2582 = _2580;
        if (_2568)
        {
            float _2584 = _430 * _2574;
            _2560 = _2584;
        }
        float _2586 = _2560;
        float _2588 = _2586;
        if (_2568)
        {
            float _2590 = _432 * _2574;
            _2576 = _2590;
        }
        float _2592 = _2576;
        float _2594 = _2592;
        if (!_2568)
        {
            float _2596 = _126 + 1.0;
            if (!_162)
            {
                float _2598 = _2596 * _2596;
                float _2600 = _2598 * 0.5;
                _128 = _2600;
            }
            float _2602 = _128;
            float _2604 = _2602;
            if (!_162)
            {
                float _2606 = _2602 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2604 = _2606;
            }
            float _2608 = _2604;
            bool _2610 = !_162;
            float _2612 = _2608;
            if (!_2610)
            {
                float _2614 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2616 = log2(_2614);
                float _2618 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2620 = 1.0 + _2618;
                float _2622 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2624 = _2616 * _2596;
                float _2626 = 1.0 / _2620;
                float _2628 = _2622 * 0.693147182464599609375;
                float _2630 = exp2(_2624);
                float _2632 = 1.0 / _2628;
                float _2634 = _2630 + (-1.0);
                float _2636 = -_2634;
                float _2638 = fma(_2636, _2632, _2596);
                float _2640 = _2638 * _2626;
                float _2642 = _2640 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2612 = _2642;
            }
            float _2644 = _2612;
            float _2646 = _2644 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2648 = _2644 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2650 = _2644 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2652 = _2646 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _2654 = _2646 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _2656 = _2646 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _2658 = fma(_2648, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2652);
            float _2660 = fma(_2648, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2654);
            float _2662 = fma(_2650, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2658);
            float _2664 = _2658;
            if (!_162)
            {
                _2664 = _2596;
            }
            float _2666 = _2664;
            bool _2668 = !_162;
            float _2670 = _2666;
            if (!_2668)
            {
                float _2672 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2674 = log2(_2672);
                float _2676 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2678 = 1.0 + _2676;
                float _2680 = 1.0 / _2678;
                float _2682 = _2674 * _2596;
                float _2684 = exp2(_2682);
                float _2686 = -_2684;
                float _2688 = _2686 + 1.0;
                float _2690 = _2688 * _2680;
                _2670 = _2690;
            }
            float _2692 = _2670;
            float _2694 = fma(_2650, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2660);
            float _2696 = fma(_2692, _166, _2662);
            float _2698 = fma(_2648, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2656);
            float _2700 = fma(_2692, _164, _2694);
            float _2702 = -_390;
            float _2704 = _2702 + _2696;
            float _2706 = fma(_2650, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2698);
            float _2708 = -_392;
            float _2710 = _2708 + _2700;
            float _2712 = _2704 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2714 = _2704 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2716 = fma(_2692, _168, _2706);
            float _2718 = _2704 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2720 = fma(_2710, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2712);
            float _2722 = fma(_2710, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2714);
            float _2724 = -_406;
            float _2726 = _2724 + _2716;
            float _2728 = fma(_2710, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2718);
            float _2730 = fma(_2726, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2720);
            float _2732 = fma(_2726, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2722);
            float _2734 = fma(_2726, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2728);
            _436 = _2732;
            _438 = _2730;
            _440 = _2734;
            _2582 = _2730;
            _2588 = _2732;
            _2594 = _2734;
        }
        float _2736 = _436;
        float _2738 = _438;
        float _2740 = _440;
        float _2742 = _2582;
        float _2744 = _2588;
        float _2746 = _2594;
        float _2748 = _2736 * _2736;
        float _2750 = rsqrt(_2526);
        float _2752 = fma(_2738, _2738, _2748);
        float _2754 = fma(_2740, _2740, _2752);
        float _2756 = sqrt(_2754);
        float _2758 = _2502 * _2750;
        float _2760 = _2496 * _2750;
        float _2762 = _2514 * _2750;
        bool _2764 = _2756 > 0.0;
        bool _2766 = !_2764;
        _130 = _2760;
        _196 = _2752;
        _198 = _2756;
        _442 = _2740;
        _444 = _2738;
        if (!_2766)
        {
            float _2768 = rsqrt(_2754);
            float _2770 = _2768 * _2736;
            float _2772 = _2768 * _2738;
            float _2774 = _2768 * _2740;
            float _2776 = _2760 * _2770;
            float _2778 = fma(_2758, _2772, _2776);
            float _2780 = fma(_2762, _2774, _2778);
            float _2782 = _2780 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2784 = fma(_2742, _2782, _2490);
            float _2786 = fma(_2744, _2782, _2488);
            float _2788 = fma(_2746, _2782, _2492);
            _2562 = _2784;
            _2564 = _2786;
            _2566 = _2788;
            _130 = _2776;
            _196 = _2774;
            _198 = _2782;
        }
    }
    float _2790 = _2562;
    float _2792 = _2564;
    float _2794 = _2566;
    float _2796 = _130;
    float _2798 = _196;
    float _2800 = _198;
    float _2802 = _442;
    float _2804 = _444;
    bool _2806 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2808 = isnan(0.5);
    bool _2810 = _2806 || _2808;
    bool _2812 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2814 = _2810 || _2812;
    float _2816 = _2798;
    float _2818 = _2796;
    float _2820 = _2800;
    float _2822 = _2794;
    float _2824 = _2804;
    float _2826 = _2802;
    if (_2814)
    {
        _2816 = _2790;
    }
    float _2828 = _2816;
    float _2830 = _2828;
    if (_2814)
    {
        _2818 = _2792;
    }
    float _2832 = _2818;
    float _2834 = _2832;
    if (_2814)
    {
        _2820 = _2794;
    }
    float _2836 = _2820;
    float _2838 = _2836;
    if (!_2814)
    {
        float _2840 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2842 = _2032 + _2840;
        float _2844 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2846 = _2036 + _2844;
        float _2848 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2850 = -_2036;
        float _2852 = _2850 + _2790;
        float _2854 = _2842 * _2842;
        float _2856 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2858 = _2050 + _2856;
        float _2860 = -_2050;
        float _2862 = _2860 + _2794;
        float _2864 = fma(_2846, _2846, _2854);
        float _2866 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2868 = fma(_2858, _2858, _2864);
        float _2870 = sqrt(_2868);
        float _2872 = _2848 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2874 = precise::min(_2870, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2876 = _2874 * _2866;
        float _2878 = -_2032;
        float _2880 = _2878 + _2792;
        float _2882 = _2872 * _2876;
        float _2884 = fma(_2852, _2882, _2036);
        float _2886 = fma(_2880, _2882, _2032);
        float _2888 = fma(_2862, _2882, _2050);
        _2834 = _2886;
        _2830 = _2884;
        _2838 = _2888;
        _2822 = _2862;
    }
    float _2890 = _2834;
    float _2892 = _2830;
    float _2894 = _2838;
    float _2896 = _2822;
    float _2898 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2900 = _2890 + _2898;
    float _2902 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2904 = _2892 + _2902;
    float _2906 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2908 = _2894 + _2906;
    float _2910 = _2900 * _2900;
    float _2912 = fma(_2904, _2904, _2910);
    float _2914 = fma(_2908, _2908, _2912);
    float _2916 = rsqrt(_2914);
    float _2918 = sqrt(_2914);
    float _2920 = _2916 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2922 = _2904 * _2920;
    float _2924 = _2908 * _2920;
    float _2926 = _2922 * _2922;
    float _2928 = _2924 * _2924;
    float _2930 = _2926 + _2928;
    float _2932 = sqrt(_2930);
    bool _2934 = _2932 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2936 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2938 = _2932 + _2936;
    float _2940 = _2908;
    float _2942 = _2938;
    float _2944 = _2900;
    float _2946 = _2896;
    if (_2934)
    {
        float _2948 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2940 = _2948;
    }
    float _2950 = _2940;
    if (_2934)
    {
        float _2952 = rsqrt(_2930);
        _2824 = _2952;
    }
    float _2954 = _2824;
    float _2956 = _2954;
    if (_2934)
    {
        float _2958 = _2938 * _2950;
        _2942 = _2958;
    }
    float _2960 = _2942;
    if (_2934)
    {
        float _2962 = _2960 * 0.15915493667125701904296875;
        _2826 = _2962;
    }
    float _2964 = _2826;
    float _2966 = _2916;
    if (_2934)
    {
        float _2968 = _2964 * 6.283185482025146484375;
        float _2970 = sin(_2968);
        _2966 = _2970;
    }
    float _2972 = _2966;
    float _2974 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2976 = precise::max(0.0, _2974);
    float _2978 = _2910;
    float _2980 = _2976;
    float _2982 = _2974;
    if (_2934)
    {
        float _2984 = _2964 * 6.283185482025146484375;
        float _2986 = cos(_2984);
        _2978 = _2986;
    }
    float _2988 = _2978;
    float _2990 = -_2920;
    float _2992 = -_2976;
    float _2994 = fma(_2900, _2990, _2992);
    if (!_2934)
    {
        _2944 = _2924;
    }
    float _2996 = _2944;
    float _2998 = _2996;
    if (_2934)
    {
        float _3000 = _2994 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2980 = _3000;
    }
    float _3002 = _2980;
    float _3004 = _3002;
    float _3006 = _2972;
    if (_2934)
    {
        float _3008 = fma(_2972, _3002, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3004 = _3008;
    }
    float _3010 = _3004;
    float _3012 = _3010;
    if (!_2934)
    {
        _3006 = _2922;
    }
    float _3014 = _3006;
    float _3016 = _3014;
    float _3018 = _2988;
    if (_2934)
    {
        float _3020 = _2988 + (-1.0);
        _2982 = _3020;
    }
    float _3022 = _2982;
    float _3024 = _3022;
    if (_2934)
    {
        float _3026 = _2954 * _3010;
        _2946 = _3026;
    }
    float _3028 = _2946;
    if (!_2934)
    {
        _3012 = _2994;
    }
    float _3030 = _3012;
    float _3032 = _3030;
    if (_2934)
    {
        float _3034 = _3022 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2956 = _3034;
    }
    float _3036 = _2956;
    if (_2934)
    {
        float _3038 = _2922 * _3028;
        _3016 = _3038;
    }
    float _3040 = _3016;
    if (!_2934)
    {
        _3024 = _2926;
    }
    float _3042 = _3024;
    float _3044 = _3042;
    if (_2934)
    {
        float _3046 = _2924 * _3028;
        _2998 = _3046;
    }
    float _3048 = _2998;
    if (_2934)
    {
        float _3050 = fma(_2994, _2988, _3036);
        _3032 = _3050;
    }
    float _3052 = _3032;
    if (_2934)
    {
        float _3054 = _3040 * _3040;
        _3044 = _3054;
    }
    float _3056 = _3044;
    if (!_2934)
    {
        _3018 = _2928;
    }
    float _3058 = _3018;
    float _3060 = _3058;
    if (_2934)
    {
        float _3062 = _3048 * _3048;
        _3060 = _3062;
    }
    float _3064 = _3060;
    float _3066 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3068 = fma(_3052, _3052, _3056);
    float _3070 = _2890 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3072 = _2890 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3074 = _3068 + _3064;
    float _3076 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3078 = fma(_2918, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3076);
    float _3080 = precise::clamp(_3078, 0.0, 1.0);
    float _3082 = fma(_2892, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3070);
    float _3084 = _2890 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3086 = rsqrt(_3074);
    float _3088 = -_3080;
    float _3090 = _3088 + 1.0;
    float _3092 = fma(_2894, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3082);
    float _3094 = _2890 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3096 = fma(_2892, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3084);
    float _3098 = _3092 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3100 = fma(_2892, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3094);
    float _3102 = fma(_2894, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3096);
    float _3104 = abs(_3090);
    float _3106 = log2(_3104);
    float _3108 = fma(_2892, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3072);
    float _3110 = fma(_2894, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3100);
    float _3112 = _3102 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3114 = _3098 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3116 = fma(_2894, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3108);
    float _3118 = _3110 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3120 = _3086 * _3040;
    float _3122 = _3112 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3124 = _3086 * _3052;
    float _3126 = -_3114;
    float _3128 = fma(_3126, _3066, 1.0);
    float _3130 = _3120 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3132 = _3116 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3134 = fma(_3118, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3122);
    float _3136 = _3086 * _3048;
    float _3138 = -_3130;
    float _3140 = fma(_3124, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3138);
    float _3142 = _3106 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3144 = fma(_3098, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3134);
    float _3146 = log2(_3128);
    float _3148 = -_3136;
    float _3150 = fma(_3148, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3140);
    float _3152 = _3112 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3154 = fma(_3132, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3144);
    float _3156 = _3112 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3158 = fma(_3150, -0.5, 0.5);
    float _3160 = fma(_3118, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3152);
    float _3162 = fma(_3150, 0.5, 0.5);
    float _3164 = exp2(_3142);
    float _3166 = fma(_3118, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3156);
    float _3168 = fma(_3098, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3160);
    float _3170 = fma(_3162, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3172 = _3124 + 1.0;
    float _3174 = fma(_3098, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3166);
    float _3176 = fma(_3132, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3168);
    float _3178 = fma(_3162, _3170, -0.212114393711090087890625);
    float _3180 = 1.0 / _3154;
    float _3182 = fma(_3132, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3174);
    float _3184 = _3146 * 0.693147182464599609375;
    float _3186 = fma(_3162, _3178, 1.570728778839111328125);
    float _3188 = _3184 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3190 = sqrt(_3158);
    float _3192 = -_3124;
    float _3194 = fma(_3164, _3172, _3192);
    float _3196 = fma(_3194, 0.5, 0.5);
    float _3198 = _3176 * _3180;
    float _3200 = _3182 * _3180;
    float _3202 = fma(_3198, 0.5, 0.5);
    float _3204 = fma(_3200, -0.5, 0.5);
    float _3206 = _3190 * 0.636619746685028076171875;
    float _3208 = -_3186;
    float _3210 = fma(_3206, _3208, 1.0);
    float3 _8457 = float3(_3202, _3204, _3188);
    float _3212 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8457, float3(0.0), isnan(_8457)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8457, float3(0.0), isnan(_8457)), level(0.0)).x;
    float3 _8468 = float3(_3202, _3204, _3188);
    float4 _3215 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8468, float3(0.0), isnan(_8468)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8468, float3(0.0), isnan(_8468)), level(0.0)).xyzw;
    float _3217 = _3215.x;
    float _3219 = _3215.y;
    float _3221 = _3215.z;
    float _3223 = _3215.w;
    float2 _8485 = float2(_3210, _3196);
    float3 _3227 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8485, float2(0.0), isnan(_8485)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8485, float2(0.0), isnan(_8485)), level(0.0)).xyz;
    float _3229 = _3227.x;
    float _3231 = _3227.y;
    float _3233 = _3227.z;
    float _3235 = _2032 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3237 = _2032 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _3239 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _3241 = isnan(0.5);
    bool _3243 = _3239 || _3241;
    bool _3245 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3247 = _3243 || _3245;
    float _3249 = fma(_2036, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3235);
    float _3251 = fma(_2036, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3237);
    float _3253 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3249);
    float _3255 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3251);
    float _3257 = _3253 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3259 = _3255 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3261 = _3253;
    float _3263 = _3106;
    if (!_3247)
    {
        _1928 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _3265 = _1928;
    float _3267 = 1.0 / _3257;
    float _3269 = _3259 + _3257;
    float _3271 = _3106 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3273 = exp2(_3271);
    float _3275 = _3269 * _3267;
    float _3277 = _3275 * 0.5;
    float _3279 = _3112 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3281 = _3265;
    float _3283 = _3277;
    if (!_3247)
    {
        float _3285 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3287 = fma(_3277, _3265, _3285);
        _3281 = _3287;
    }
    float _3289 = _3281;
    if (!_3247)
    {
        _3283 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _3291 = _3283;
    float _3293 = fma(_3118, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3279);
    float _3295 = _3154 * 0.5;
    float _3297 = _3289;
    float _3299 = _3291;
    if (!_3247)
    {
        float _3301 = 1.0 / _3289;
        _3297 = _3301;
    }
    float _3303 = _3297;
    if (!_3247)
    {
        float _3305 = -_3291;
        float _3307 = _3305 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _3261 = _3307;
    }
    float _3309 = _3261;
    float _3311 = fma(_3098, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3293);
    float _3313 = -_3273;
    float _3315 = _3313 + 1.0;
    float _3317 = fma(_3132, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3311);
    float _3319 = _2050;
    if (!_3247)
    {
        float _3321 = 1.0 / _3309;
        _3319 = _3321;
    }
    float _3323 = _3319;
    float _3325 = _3315 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3327 = _3317 + _3154;
    out.gl_Position.x = _3176;
    out.gl_Position.y = _3182;
    out.gl_Position.z = _3317;
    out.gl_Position.w = _3154;
    float _3329 = _3327 * 0.5;
    if (!_3247)
    {
        float _3331 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3333 = -_3291;
        float _3335 = fma(_3303, _3331, _3333);
        _3263 = _3335;
    }
    float _3337 = _3263;
    float _3339 = _3337;
    if (_3247)
    {
        _3299 = 1.0;
    }
    float _3341 = _3299;
    float _3343 = fma(_3182, -0.5, _3295);
    float _3345 = _3341;
    if (!_3247)
    {
        float _3347 = _3337 * _3323;
        float _3349 = precise::clamp(_3347, 0.0, 1.0);
        _3339 = _3349;
    }
    float _3351 = _3339;
    if (!_3247)
    {
        float _3353 = -_3351;
        float _3355 = _3353 + 1.0;
        _3345 = _3355;
    }
    float _3357 = _3345;
    float _3359 = _3176 + _3154;
    float _3361 = _3357 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _3363 = _3357 > 0.0;
    bool _3365 = isnan(_3357);
    bool _3367 = _3363 || _3365;
    bool _3369 = isnan(0.0);
    bool _3371 = _3367 || _3369;
    float _3373 = -_3325;
    float _3375 = _3373 + 1.0;
    float _3377 = _3359 * 0.5;
    float _3379 = _3361 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_71.x = _3377;
    out.m_71.y = _3343;
    out.m_71.z = _3329;
    out.m_71.w = _3154;
    out.m_45.x = _3379;
    float _3381 = _3325 * _3212;
    float _3383 = _3223 * _3381;
    float _3385 = _3233 * _3381;
    float _3387 = _3223 * _3375;
    float _3389 = fma(_3229, _3383, _3217);
    float _3391 = fma(_3231, _3383, _3219);
    float _3393 = fma(_3223, _3385, _3221);
    out.m_73.x = _3389;
    out.m_73.y = _3391;
    out.m_73.z = _3393;
    out.m_73.w = _3387;
    if (_3371)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _3395 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3395;
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
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1490 = false;
    bool _1046 = false;
    bool _866 = false;
    bool _698 = false;
    bool _464 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_42.w;
    float _89 = trunc(_87);
    int _92 = int(_89);
    bool _96 = _92 >= 1;
    float _98 = 0.0;
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _100 = _98;
    float _102 = _100;
    if (!_96)
    {
        out.m_45.x = 0.0;
    }
    int _104 = 0;
    if (!_96)
    {
        float _106 = _100 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3452 = as_type<float>(_108);
        out.gl_Position.z = _3452;
    }
    if (!_96)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _112 = in.m_47.w;
    bool _114 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_112);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = -_112;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _128 = _126;
    float _130 = _126;
    if (_122)
    {
        float _132 = float(_92);
        _102 = _132;
    }
    float _134 = _102;
    bool _136 = _126 >= _134;
    bool _138 = !_122;
    bool _140 = _136 || _138;
    float _142 = _134;
    if (_140)
    {
        _142 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _144 = _142;
    if (_140)
    {
        out.m_45.x = 0.0;
    }
    if (_140)
    {
        float _146 = _144 * 5.0;
        _110 = as_type<int>(_146);
    }
    int _148 = _110;
    if (_140)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3523 = as_type<float>(_148);
        out.gl_Position.z = _3523;
    }
    if (_140)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _150 = in.m_49.w;
    float _152 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _154 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _156 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _158 = _154 || _156;
    bool _160 = isnan(1.0);
    bool _162 = _158 || _160;
    float _164 = in.m_47.x;
    float _166 = in.m_47.y;
    float _168 = in.m_47.z;
    float _170 = in.m_42.x;
    float _172 = in.m_42.y;
    float _174 = in.m_42.z;
    float _176 = 0.0;
    float _178 = _152;
    if (!_162)
    {
        float _180 = _152 * _152;
        float _182 = _180 * 0.5;
        _176 = _182;
    }
    float _184 = _176;
    float _186 = _184;
    if (!_162)
    {
        float _188 = _184 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _188;
    }
    float _190 = _186;
    bool _192 = !_162;
    float _194 = _190;
    float _196 = _166;
    float _198 = _164;
    if (!_192)
    {
        float _200 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = log2(_200);
        float _204 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _206 = _204 + 1.0;
        float _208 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = _152 * _202;
        float _212 = 1.0 / _206;
        float _214 = _208 * 0.693147182464599609375;
        float _216 = exp2(_210);
        float _218 = 1.0 / _214;
        float _220 = _216 + (-1.0);
        float _222 = -_220;
        float _224 = fma(_222, _218, _152);
        float _226 = _224 * _212;
        float _228 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _194 = _228;
    }
    float _230 = _194;
    float _232 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _234 = !_162;
    float _236 = _232;
    float _238 = _230;
    if (!_234)
    {
        float _240 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _242 = log2(_240);
        float _244 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _246 = _244 + 1.0;
        float _248 = 1.0 / _246;
        float _250 = _152 * _242;
        float _252 = exp2(_250);
        float _254 = -_252;
        float _256 = _254 + 1.0;
        float _258 = _256 * _248;
        _178 = _258;
    }
    float _260 = _178;
    float _262 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _264 = _232 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _266 = _232 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _268 = _232 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _270 = _260;
    if (!_162)
    {
        float _272 = _126 * _126;
        float _274 = _272 * 0.5;
        _236 = _274;
    }
    float _276 = _236;
    float _278 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[8].x, _264);
    float _280 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[8].y, _266);
    float _282 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[8].z, _268);
    float _284 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_162)
    {
        float _286 = _276 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _238 = _286;
    }
    float _288 = _238;
    bool _290 = !_162;
    float _292 = _288;
    if (!_290)
    {
        float _294 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _296 = log2(_294);
        float _298 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _300 = _298 + 1.0;
        float _302 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _304 = _126 * _296;
        float _306 = 1.0 / _300;
        float _308 = _302 * 0.693147182464599609375;
        float _310 = exp2(_304);
        float _312 = 1.0 / _308;
        float _314 = _310 + (-1.0);
        float _316 = -_314;
        float _318 = fma(_316, _312, _126);
        float _320 = _318 * _306;
        float _322 = _320 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _292 = _322;
    }
    float _324 = _292;
    float _326 = _324 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _328 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[10].x, _278);
    float _330 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[10].y, _280);
    float _332 = _324 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _334 = _326 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _336 = _326 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _338 = _326 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _340 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[10].z, _282);
    float _342 = fma(_332, (*spvDescriptorSet0.vp_c10)._m0[8].x, _334);
    float _344 = fma(_332, (*spvDescriptorSet0.vp_c10)._m0[8].y, _336);
    float _346 = fma(_332, (*spvDescriptorSet0.vp_c10)._m0[8].z, _338);
    float _348 = _324 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _350 = fma(_260, _164, _328);
    float _352 = fma(_260, _166, _330);
    float _354 = fma(_260, _168, _340);
    float _356 = fma(_348, (*spvDescriptorSet0.vp_c10)._m0[10].x, _342);
    float _358 = fma(_348, (*spvDescriptorSet0.vp_c10)._m0[10].y, _344);
    float _360 = fma(_348, (*spvDescriptorSet0.vp_c10)._m0[10].z, _346);
    if (!_162)
    {
        _270 = _126;
    }
    float _362 = _270;
    bool _364 = !_162;
    float _366 = _362;
    if (!_364)
    {
        float _368 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _370 = log2(_368);
        float _372 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _374 = _372 + 1.0;
        float _376 = 1.0 / _374;
        float _378 = _126 * _370;
        float _380 = exp2(_378);
        float _382 = -_380;
        float _384 = _382 + 1.0;
        float _386 = _384 * _376;
        _366 = _386;
    }
    float _388 = _366;
    float _390 = fma(_388, _166, _358);
    float _392 = fma(_388, _164, _356);
    bool _394 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _396 = fma(_350, _150, _170);
    float _398 = -_390;
    float _400 = _352 + _398;
    float _402 = -_392;
    float _404 = _350 + _402;
    float _406 = fma(_388, _168, _360);
    float _408 = fma(_352, _150, _172);
    float _410 = _400 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _412 = _400 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _414 = _400 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _416 = -_406;
    float _418 = _354 + _416;
    float _420 = fma(_404, (*spvDescriptorSet0.vp_c10)._m0[4].x, _410);
    float _422 = fma(_404, (*spvDescriptorSet0.vp_c10)._m0[5].x, _412);
    float _424 = fma(_404, (*spvDescriptorSet0.vp_c10)._m0[6].x, _414);
    float _426 = fma(_354, _150, _174);
    float _428 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[4].z, _420);
    float _430 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[5].z, _422);
    float _432 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[6].z, _424);
    bool _434 = !_394;
    float _436 = _430;
    float _438 = _428;
    float _440 = _432;
    float _442 = _432;
    float _444 = _428;
    float _462;
    if (!_434)
    {
        float _446 = in.m_51.x;
        float _448 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _450 = _446 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _452 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[12].x, _126);
        float _454 = _452 * _448;
        float _456 = floor(_454);
        float _458 = -_456;
        float _460 = _454 + _458;
        _462 = _460;
        _464 = true;
    }
    else
    {
        float _466 = float(_92);
        float _468 = 1.0 / _466;
        float _470 = _126 * _468;
        _462 = _470;
    }
    _464 = false;
    float _472 = _462;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _476 = _472 + _474;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _480 = _472 + _478;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _482;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _488 = _486 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _490;
    float _494 = 1.0 / _484;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _498 = _472 + _496;
    bool _500 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _502 = isnan(_472);
    bool _504 = _500 || _502;
    bool _506 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _508 = _504 || _506;
    float _510 = float(_508);
    bool _512 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _514 = 1.0 / _488;
    bool _516 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _518 = isnan(_472);
    bool _520 = _516 || _518;
    bool _522 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _524 = _520 || _522;
    float _526 = float(_524);
    float _528 = 1.0 / _492;
    float _530 = _476 * _494;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _532;
    float _536 = fma(_534, _530, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _538 = _480 * _514;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _542 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _540;
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _544;
    float _548 = fma(_542, _530, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _550 = fma(_546, _530, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _552 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _554 = isnan(_472);
    bool _556 = _552 || _554;
    bool _558 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _560 = _556 || _558;
    float _562 = float(_560);
    float _564 = _498 * _528;
    bool _566 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _568 = isnan(_472);
    bool _570 = _566 || _568;
    bool _572 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _574 = _570 || _572;
    float _576 = float(_574);
    float _578 = -_526;
    float _580 = _578 + 1.0;
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _584 = _582 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _586 = -_576;
    float _588 = _586 + 1.0;
    float _590 = _576 * _580;
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _594 = _592 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _598 = _596 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _600 = _562 * _588;
    float _602 = -_562;
    float _604 = _602 + 1.0;
    float _606 = fma(_584, _538, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _608 = fma(_594, _538, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _610 = fma(_598, _538, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _612 = _510 * _604;
    float _614 = in.m_49.x;
    float _616 = in.m_49.y;
    float _618 = in.m_49.z;
    float _620 = _536 * _612;
    float _622 = _548 * _612;
    float _624 = _550 * _612;
    float _626 = -_510;
    float _628 = _626 + 1.0;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _632 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _630;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _636 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _634;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _638;
    float _642 = fma(_628, (*spvDescriptorSet0.vp_c9)._m0[143].x, _620);
    float _644 = fma(_628, (*spvDescriptorSet0.vp_c9)._m0[143].y, _622);
    float _646 = fma(_628, (*spvDescriptorSet0.vp_c9)._m0[143].z, _624);
    float _648 = fma(_632, _564, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _650 = fma(_636, _564, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _652 = fma(_640, _564, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _654 = fma(_606, _600, _642);
    float _656 = fma(_608, _600, _644);
    float _658 = fma(_610, _600, _646);
    float _660 = fma(_648, _590, _654);
    float _662 = fma(_650, _590, _656);
    float _664 = fma(_652, _590, _658);
    float _666 = fma(_526, (*spvDescriptorSet0.vp_c9)._m0[146].x, _660);
    float _668 = fma(_526, (*spvDescriptorSet0.vp_c9)._m0[146].y, _662);
    float _670 = fma(_526, (*spvDescriptorSet0.vp_c9)._m0[146].z, _664);
    float _672 = _666 * _614;
    float _674 = _668 * _616;
    float _676 = _670 * _618;
    bool _678 = !_512;
    float _696;
    if (!_678)
    {
        float _680 = in.m_51.x;
        float _682 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _684 = _680 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _686 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[11].x, _126);
        float _688 = _686 * _682;
        float _690 = floor(_688);
        float _692 = -_690;
        float _694 = _688 + _692;
        _696 = _694;
        _698 = true;
    }
    else
    {
        float _700 = float(_92);
        float _702 = 1.0 / _700;
        float _704 = _126 * _702;
        _696 = _704;
    }
    _698 = false;
    float _706 = _696;
    float _708 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _710 = _706 + _708;
    bool _712 = _706 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _714 = isnan(_706);
    bool _716 = _712 || _714;
    bool _718 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _720 = _716 || _718;
    float _722 = float(_720);
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _726 = _706 + _724;
    bool _728 = _706 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _730 = isnan(_706);
    bool _732 = _728 || _730;
    bool _734 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _736 = _732 || _734;
    float _738 = float(_736);
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _740;
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _746 = _744 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _748 = _706 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _750 = isnan(_706);
    bool _752 = _748 || _750;
    bool _754 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _756 = _752 || _754;
    float _758 = float(_756);
    float _760 = -_722;
    float _762 = _760 + 1.0;
    float _764 = 1.0 / _746;
    float _766 = _758 * _762;
    float _768 = -_758;
    float _770 = _768 + 1.0;
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _774 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _772;
    bool _776 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _778 = 1.0 / _742;
    float _780 = _738 * _770;
    float _782 = -_738;
    float _784 = _782 + 1.0;
    float _786 = _726 * _764;
    float _788 = _710 * _778;
    float _790 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _792 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _790;
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _796 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _794;
    float _798 = fma(_774, _788, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _800 = fma(_792, _788, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _802 = fma(_796, _788, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _804 = _798 * _780;
    float _806 = _800 * _780;
    float _808 = _802 * _780;
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _812 = _810 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _816 = _814 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _820 = _818 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _822 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[107].x, _804);
    float _824 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[107].y, _806);
    float _826 = fma(_812, _786, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _828 = fma(_816, _786, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _830 = fma(_820, _786, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _832 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[107].z, _808);
    float _834 = fma(_826, _766, _822);
    float _836 = fma(_828, _766, _824);
    float _838 = fma(_830, _766, _832);
    float _840 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[109].x, _834);
    float _842 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[109].y, _836);
    float _844 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[109].z, _838);
    bool _846 = !_776;
    float _864;
    if (!_846)
    {
        float _848 = in.m_51.x;
        float _850 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _852 = _848 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _854 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[11].y, _126);
        float _856 = _854 * _850;
        float _858 = floor(_856);
        float _860 = -_858;
        float _862 = _856 + _860;
        _864 = _862;
        _866 = true;
    }
    else
    {
        float _868 = float(_92);
        float _870 = 1.0 / _868;
        float _872 = _126 * _870;
        _864 = _872;
    }
    _866 = false;
    float _874 = _864;
    float _876 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _878 = _874 + _876;
    float _880 = _840 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _882 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _884 = _882 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _886 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _888 = _886 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _890 = _874 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _892 = isnan(_874);
    bool _894 = _890 || _892;
    bool _896 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _898 = _894 || _896;
    float _900 = float(_898);
    float _902 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _904 = _902 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _906 = _874 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _908 = isnan(_874);
    bool _910 = _906 || _908;
    bool _912 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _914 = _910 || _912;
    float _916 = float(_914);
    float _918 = 1.0 / _884;
    float _920 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _922 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _920;
    float _924 = -_900;
    float _926 = _924 + 1.0;
    bool _928 = _874 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _930 = isnan(_874);
    bool _932 = _928 || _930;
    bool _934 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _936 = _932 || _934;
    float _938 = float(_936);
    float _940 = _842 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _942 = _844 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _944 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _946 = 1.0 / _888;
    float _948 = 1.0 / _904;
    float _950 = _922 * _918;
    float _952 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _954 = _952 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _956 = _916 * _926;
    float _958 = -_916;
    float _960 = _958 + 1.0;
    float _962 = fma(_950, _878, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _964 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _966 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _964;
    float _968 = _938 * _960;
    float _970 = _954 * _946;
    float _972 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _974 = _874 + _972;
    bool _976 = _874 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _978 = isnan(_874);
    bool _980 = _976 || _978;
    bool _982 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _984 = _980 || _982;
    float _986 = float(_984);
    float _988 = _962 * _968;
    float _990 = -_938;
    float _992 = _990 + 1.0;
    float _994 = fma(_970, _974, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _996 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _998 = _874 + _996;
    float _1000 = _966 * _948;
    float _1002 = -_986;
    float _1004 = _1002 + 1.0;
    float _1006 = fma(_992, (*spvDescriptorSet0.vp_c9)._m0[115].x, _988);
    float _1008 = _880 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1010 = fma(_1000, _998, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1012 = _900 * _1004;
    float _1014 = fma(_994, _956, _1006);
    float _1016 = fma(_1010, _1012, _1014);
    float _1018 = _942 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1020 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1016);
    float _1022 = _940 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1024 = _1020 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _1008;
    out.m_53.y = _1022;
    out.m_53.z = _1018;
    out.m_53.w = _1024;
    bool _1026 = !_944;
    float _1044;
    if (!_1026)
    {
        float _1028 = in.m_51.x;
        float _1030 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1032 = _1028 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1034 = fma(_1032, (*spvDescriptorSet0.vp_c9)._m0[11].z, _126);
        float _1036 = _1034 * _1030;
        float _1038 = floor(_1036);
        float _1040 = -_1038;
        float _1042 = _1036 + _1040;
        _1044 = _1042;
        _1046 = true;
    }
    else
    {
        float _1048 = float(_92);
        float _1050 = 1.0 / _1048;
        float _1052 = _126 * _1050;
        _1044 = _1052;
    }
    _1046 = false;
    float _1054 = _1044;
    float _1056 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1058 = _1054 + _1056;
    float _1060 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1062 = _1054 + _1060;
    float _1064 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1066 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1064;
    float _1068 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1070 = _1068 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1072 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1074 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _1072;
    float _1076 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _1078 = _1076 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _1080 = 1.0 / _1066;
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1084 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1082;
    float _1086 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1088 = _1086 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1090 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1092 = _1054 + _1090;
    float _1094 = 1.0 / _1070;
    bool _1096 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1098 = 1.0 / _1074;
    float _1100 = -(*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _1102 = (*spvDescriptorSet0.vp_c9)._m0[130].w + _1100;
    float _1104 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1106 = _1054 + _1104;
    float _1108 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1110 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1108;
    float _1112 = _1106 * _1080;
    float _1114 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1116 = _1054 + _1114;
    float _1118 = 1.0 / _1084;
    float _1120 = _1092 * _1094;
    bool _1122 = _1054 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1124 = isnan(_1054);
    bool _1126 = _1122 || _1124;
    bool _1128 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1130 = _1126 || _1128;
    float _1132 = float(_1130);
    float _1134 = -_1132;
    float _1136 = _1134 + 1.0;
    float _1138 = 1.0 / _1088;
    float _1140 = _1116 * _1098;
    bool _1142 = _1054 >= (*spvDescriptorSet0.vp_c9)._m0[130].w;
    bool _1144 = isnan(_1054);
    bool _1146 = _1142 || _1144;
    bool _1148 = isnan((*spvDescriptorSet0.vp_c9)._m0[130].w);
    bool _1150 = _1146 || _1148;
    float _1152 = float(_1150);
    float _1154 = -_1152;
    float _1156 = _1154 + 1.0;
    float _1158 = 1.0 / _1078;
    float _1160 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _1162 = _1054 + _1160;
    float _1164 = _1058 * _1118;
    bool _1166 = _1054 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _1168 = isnan(_1054);
    bool _1170 = _1166 || _1168;
    bool _1172 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _1174 = _1170 || _1172;
    float _1176 = float(_1174);
    float _1178 = fma(_1110, _1164, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1180 = 1.0 / _1102;
    float _1182 = _1062 * _1138;
    float _1184 = _1176 * _1156;
    bool _1186 = _1054 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1188 = isnan(_1054);
    bool _1190 = _1186 || _1188;
    bool _1192 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1194 = _1190 || _1192;
    float _1196 = float(_1194);
    float _1198 = -_1176;
    float _1200 = _1198 + 1.0;
    bool _1202 = _1054 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1204 = isnan(_1054);
    bool _1206 = _1202 || _1204;
    bool _1208 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1210 = _1206 || _1208;
    float _1212 = float(_1210);
    float _1214 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1216 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1214;
    float _1218 = _1162 * _1158;
    float _1220 = -(*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _1222 = _1054 + _1220;
    float _1224 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1226 = _1224 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1228 = _1196 * _1200;
    float _1230 = fma(_1216, _1112, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1232 = -_1196;
    float _1234 = _1232 + 1.0;
    float _1236 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1238 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1236;
    float _1240 = _1222 * _1180;
    float _1242 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1244 = _1242 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1246 = fma(_1238, _1112, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1248 = fma(_1226, _1120, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1250 = _1132 * _1234;
    float _1252 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1254 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1252;
    float _1256 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1258 = _1256 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1260 = fma(_1244, _1120, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1262 = fma(_1254, _1112, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _1264 = _1054 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1266 = isnan(_1054);
    bool _1268 = _1264 || _1266;
    bool _1270 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1272 = _1268 || _1270;
    float _1274 = float(_1272);
    float _1276 = fma(_1258, _1120, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    bool _1278 = _1054 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1280 = isnan(_1054);
    bool _1282 = _1278 || _1280;
    bool _1284 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1286 = _1282 || _1284;
    float _1288 = float(_1286);
    float _1290 = _1274 * _1136;
    bool _1292 = _1054 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1294 = isnan(_1054);
    bool _1296 = _1292 || _1294;
    bool _1298 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1300 = _1296 || _1298;
    float _1302 = float(_1300);
    float _1304 = -_1288;
    float _1306 = _1304 + 1.0;
    float _1308 = -_1274;
    float _1310 = _1308 + 1.0;
    float _1312 = _1302 * _1306;
    float _1314 = _1212 * _1310;
    float _1316 = -_1212;
    float _1318 = _1316 + 1.0;
    float _1320 = -_1302;
    float _1322 = _1320 + 1.0;
    float _1324 = _1230 * _1312;
    float _1326 = _1246 * _1312;
    float _1328 = _1262 * _1312;
    float _1330 = _1288 * _1318;
    float _1332 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1334 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1332;
    float _1336 = fma(_1322, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1324);
    float _1338 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1340 = _1338 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1342 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1344 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1342;
    float _1346 = fma(_1322, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1326);
    float _1348 = fma(_1322, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1328);
    float _1350 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1352 = _1350 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1354 = fma(_1334, _1164, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1356 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1358 = _1356 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1360 = fma(_1248, _1330, _1336);
    float _1362 = fma(_1344, _1164, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1364 = fma(_1352, _1182, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1366 = fma(_1340, _1182, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1368 = fma(_1260, _1330, _1346);
    float _1370 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1372 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1370;
    float _1374 = fma(_1276, _1330, _1348);
    float _1376 = fma(_1354, _1314, _1360);
    float _1378 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1380 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1378;
    float _1382 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1384 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1382;
    float _1386 = fma(_1358, _1182, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1388 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _1390 = _1388 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1392 = fma(_1372, _1140, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1394 = fma(_1362, _1314, _1368);
    float _1396 = fma(_1178, _1314, _1374);
    float _1398 = fma(_1366, _1290, _1376);
    float _1400 = fma(_1380, _1140, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1402 = fma(_1384, _1140, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1404 = fma(_1390, _1218, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    float _1406 = fma(_1364, _1290, _1394);
    float _1408 = fma(_1386, _1290, _1396);
    float _1410 = fma(_1392, _1250, _1398);
    float _1412 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _1414 = _1412 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1416 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _1418 = _1416 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1420 = fma(_1414, _1218, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _1422 = fma(_1400, _1250, _1406);
    float _1424 = -(*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1426 = (*spvDescriptorSet0.vp_c9)._m0[130].x + _1424;
    float _1428 = -(*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1430 = (*spvDescriptorSet0.vp_c9)._m0[130].y + _1428;
    float _1432 = fma(_1418, _1218, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    float _1434 = fma(_1402, _1250, _1408);
    float _1436 = -(*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1438 = (*spvDescriptorSet0.vp_c9)._m0[130].z + _1436;
    float _1440 = fma(_1404, _1228, _1410);
    float _1442 = fma(_1426, _1240, (*spvDescriptorSet0.vp_c9)._m0[129].x);
    float _1444 = fma(_1430, _1240, (*spvDescriptorSet0.vp_c9)._m0[129].y);
    float _1446 = fma(_1420, _1228, _1422);
    float _1448 = fma(_1438, _1240, (*spvDescriptorSet0.vp_c9)._m0[129].z);
    float _1450 = fma(_1432, _1228, _1434);
    float _1452 = fma(_1442, _1184, _1440);
    float _1454 = fma(_1444, _1184, _1446);
    float _1456 = fma(_1448, _1184, _1450);
    float _1458 = fma(_1152, (*spvDescriptorSet0.vp_c9)._m0[130].x, _1452);
    float _1460 = fma(_1152, (*spvDescriptorSet0.vp_c9)._m0[130].y, _1454);
    float _1462 = fma(_1152, (*spvDescriptorSet0.vp_c9)._m0[130].z, _1456);
    bool _1464 = !_1096;
    int _1466 = as_type<int>(_1184);
    float _1468 = _1444;
    bool _1470 = _1096;
    float _1488;
    if (!_1464)
    {
        float _1472 = in.m_51.x;
        float _1474 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1476 = _1472 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1478 = fma(_1476, (*spvDescriptorSet0.vp_c9)._m0[11].w, _126);
        float _1480 = _1478 * _1474;
        float _1482 = floor(_1480);
        float _1484 = -_1482;
        float _1486 = _1480 + _1484;
        _1466 = as_type<int>(_1482);
        _1488 = _1486;
        _1490 = true;
    }
    else
    {
        float _1492 = float(_92);
        float _1494 = 1.0 / _1492;
        float _1496 = _126 * _1494;
        _1488 = _1496;
    }
    _1490 = false;
    int _1498 = _1466;
    float _1500 = _1488;
    float _1502 = in.m_55.x;
    float _1504 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1506 = log2(_1504);
    float _1508 = _408 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1510 = in.m_51.x;
    int _1512 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1514 = _1512 != 0;
    float _1516 = _672 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1518 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1520 = _1518 != 0;
    float _1522 = in.m_51.z;
    int _1524 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1526 = _1524 != 0;
    float _1528 = fma(_396, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1508);
    int _1530 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1532 = _1530 != 0;
    float _1534 = in.m_51.y;
    float _1536 = fma(_426, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1528);
    float _1538 = in.m_55.y;
    float _1540 = _126 * _1506;
    float _1542 = in.m_51.w;
    float _1544 = _676 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1546 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1548 = _1498;
    float _1550 = _1502;
    if (_1514)
    {
        float _1552 = -_1502;
        float _1554 = _1552 + 1.0;
        _1548 = as_type<int>(_1554);
    }
    int _1556 = _1548;
    if (!_1514)
    {
        _1468 = _1502;
    }
    float _1558 = _1468;
    float _1560 = in.m_57.y;
    float _1562 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1564 = _1558;
    if (_1514)
    {
        bool _1566 = _1510 > 0.5;
        _1470 = _1566;
    }
    bool _1568 = _1470;
    float _1570 = _1510 * 2.0;
    float _1572 = exp2(_1540);
    float _1574 = _1522 * 2.0;
    if (_1514)
    {
        float _1576 = _1568 ? as_type<float>(_1556) : _1502;
        _1564 = _1576;
    }
    float _1578 = _1564;
    bool _1580 = _1522 > 0.5;
    float _1582 = _1534 * 2.0;
    bool _1584 = _1534 > 0.5;
    float _1586 = _1534 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1588 = floor(_1574);
    float _1590 = -_1538;
    float _1592 = _1590 + 1.0;
    bool _1594 = _1500 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1596 = isnan(_1500);
    bool _1598 = _1594 || _1596;
    bool _1600 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1602 = _1598 || _1600;
    float _1604 = float(_1602);
    float _1606 = fma(_1586, -2.0, _1562);
    float _1608 = _1546 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1610 = _1580 ? as_type<int>(_1592) : as_type<int>(_1538);
    float _1612 = floor(_1570);
    int _1614 = _1584 ? as_type<int>(_1592) : as_type<int>(_1538);
    float _1616 = -_1572;
    float _1618 = _1616 + 1.0;
    bool _1620 = _1542 > 0.5;
    float _1622 = _408 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1624 = _1526 ? as_type<float>(_1610) : _1538;
    out.m_59.y = _1560;
    float _1626 = _1532 ? as_type<float>(_1614) : _1538;
    float _1628 = floor(_1582);
    bool _1630 = _1588 >= 0.0;
    bool _1632 = isnan(_1588);
    bool _1634 = _1630 || _1632;
    bool _1636 = isnan(0.0);
    bool _1638 = _1634 || _1636;
    float _1640 = fma(_396, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1622);
    float _1642 = _1538;
    if (_1520)
    {
        float _1644 = _1620 ? _1592 : _1538;
        _1642 = _1644;
    }
    float _1646 = _1642;
    bool _1648 = _1588 > 0.0;
    int _1650 = _1638 ? 0 : 1;
    float _1652 = fma(_1608, _1646, -0.5);
    bool _1654 = _1612 > 0.0;
    bool _1656 = _1612 >= 0.0;
    bool _1658 = isnan(_1612);
    bool _1660 = _1656 || _1658;
    bool _1662 = isnan(0.0);
    bool _1664 = _1660 || _1662;
    int _1666 = ~_1650;
    int _1668 = _1666 + 1;
    int _1670 = _1668 + 1;
    float _1672 = in.m_57.x;
    int _1674 = _1664 ? 0 : 1;
    bool _1676 = _1628 > 0.0;
    bool _1678 = _1628 >= 0.0;
    bool _1680 = isnan(_1628);
    bool _1682 = _1678 || _1680;
    bool _1684 = isnan(0.0);
    bool _1686 = _1682 || _1684;
    int _1688 = _1686 ? 0 : 1;
    int _1690 = ~_1674;
    int _1692 = _1690 + 1;
    int _1694 = _1692 + 1;
    int _1696 = ~_1688;
    int _1698 = _1696 + 1;
    int _1700 = _1698 + 1;
    int _1702 = _1670;
    int _1704 = _1694;
    int _1706 = _1700;
    if (!_1648)
    {
        int _1708 = ~_1650;
        int _1710 = _1708 + 1;
        _1702 = _1710;
    }
    int _1712 = _1702;
    if (!_1654)
    {
        int _1714 = ~_1674;
        int _1716 = _1714 + 1;
        _1704 = _1716;
    }
    int _1718 = _1704;
    int _1720 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1722 = _1720 != 0;
    int _1724 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1726 = _1724 != 0;
    int _1728 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1730 = _1728 != 0;
    if (!_1676)
    {
        int _1732 = ~_1688;
        int _1734 = _1732 + 1;
        _1706 = _1734;
    }
    int _1736 = _1706;
    float _1738 = in.m_61.x;
    float _1740 = in.m_61.y;
    float _1742 = in.m_61.z;
    bool _1744 = !_1722;
    int _1746 = _1744 ? 0 : 1;
    bool _1748 = !_1726;
    int _1750 = _1748 ? 0 : 1;
    out.m_59.x = _1672;
    int _1752 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1754 = _1752 != 0;
    int _1756 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1758 = _1756 != 0;
    float _1760 = _408 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _1762 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1764 = isnan(0.0);
    bool _1766 = _1762 || _1764;
    bool _1768 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1770 = _1766 || _1768;
    float _1772 = fma(_396, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1760);
    float _1774 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1776 = _1774 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1778 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1780 = _1770 ? _1618 : 0.0;
    float _1782 = _1510 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1784 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1786 = _1784 != 0;
    float _1788 = 1.0 / _1776;
    int _1790 = abs(_1746);
    float _1792 = -_1778;
    float _1794 = fma(_1782, 2.0, _1792);
    int _1796 = abs(_1750);
    float _1798 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1738);
    float _1800 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1802 = _1800 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1804 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1742);
    float _1806 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1808 = _1806 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1810 = fma(_426, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1640);
    float _1812 = fma(_426, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1772);
    float _1814 = _674 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1816 = 1.0 / _1802;
    float _1818 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1740);
    float _1820 = _1516 * _1798;
    float _1822 = _1544 * _1804;
    float _1824 = _1814 * _1818;
    float _1826 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1828 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1826;
    float _1830 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1832 = _1830 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1834 = 1.0 / _1808;
    float _1836 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1838 = _1500 + _1836;
    float _1840 = _1828 * _1788;
    float _1842 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1844 = _1500 + _1842;
    float _1846 = _1510 + _1522;
    float _1848 = float(_1712);
    float _1850 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1606);
    float _1852 = _1832 * _1816;
    float _1854 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1856 = _1534 + _1522;
    float _1858 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1860 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1858;
    float _1862 = fma(_1852, _1838, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _1864 = _1500 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1866 = isnan(_1500);
    bool _1868 = _1864 || _1866;
    bool _1870 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1872 = _1868 || _1870;
    float _1874 = float(_1872);
    float _1876 = _1856 + (-1.0);
    float _1878 = _1510 + _1534;
    float _1880 = _1846 + (-1.0);
    float _1882 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1884 = fma(_1876, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1886 = _1878 + (-1.0);
    float _1888 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1890 = _1500 + _1888;
    float _1892 = _1860 * _1834;
    float _1894 = fma(_1886, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1896 = fma(_1840, _1890, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1898 = _1854 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1900 = -_1874;
    float _1902 = _1900 + 1.0;
    float _1904 = fma(_1892, _1844, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1906 = fma(_1880, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1908 = fma(_1898, _1626, -0.5);
    bool _1910 = _1500 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1912 = isnan(_1500);
    bool _1914 = _1910 || _1912;
    bool _1916 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1918 = _1914 || _1916;
    float _1920 = float(_1918);
    int _1922 = 0;
    int _1924 = as_type<int>(_1848);
    float _1926 = as_type<float>(_1736);
    float _1928 = 0.5;
    if (_1758)
    {
        float _1930 = -_1502;
        float _1932 = _1930 + 1.0;
        _1922 = as_type<int>(_1932);
    }
    int _1934 = _1922;
    float _1936 = _1882 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1938 = float(_1796);
    float _1940 = -_1920;
    float _1942 = _1940 + 1.0;
    float _1944 = float(_1718);
    float _1946 = fma(_1624, _1936, -0.5);
    bool _1948 = _1500 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1950 = isnan(_1500);
    bool _1952 = _1948 || _1950;
    bool _1954 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1956 = _1952 || _1954;
    float _1958 = float(_1956);
    float _1960 = _1920 * _1902;
    float _1962 = _1604 * _1942;
    float _1964 = in.m_63.x;
    float _1966 = in.m_63.y;
    float _1968 = in.m_63.z;
    float _1970 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1972 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1974 = 1.0 + _1972;
    float _1976 = _1938 * _1944;
    float _1978 = -_1604;
    float _1980 = _1978 + 1.0;
    float _1982 = fma(_1534, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1970);
    float _1984 = _1510 + (-0.5);
    float _1986 = _1976 * (-2.0);
    float _1988 = 1.0 / _1974;
    float _1990 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1982);
    float _1992 = float(_1790);
    float _1994 = _1958 * _1980;
    float _1996 = _1534 + (-0.5);
    float _1998 = -_1850;
    float _2000 = fma(_1990, _1908, _1998);
    float _2002 = float(_1736);
    float _2004 = _1992 * _1848;
    float _2006 = _1896 * _1994;
    float _2008 = _1986;
    if (_1754)
    {
        float _2010 = -_1502;
        float _2012 = _2010 + 1.0;
        _1924 = as_type<int>(_2012);
    }
    int _2014 = _1924;
    float _2016 = _2004 * (-2.0);
    if (!_1754)
    {
        _1926 = _1502;
    }
    float _2018 = _1926;
    float _2020 = -_1958;
    float _2022 = _2020 + 1.0;
    float _2024 = -_126;
    float _2026 = fma(_2024, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1794);
    float _2028 = fma(_1894, _2016, _1894);
    float _2030 = fma(_2016, _1964, _1964);
    float _2032 = _1536 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2034 = fma(_1986, _1966, _1966);
    float _2036 = _1810 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2038 = fma(_1884, _1986, _1884);
    float _2040 = -_2032;
    float _2042 = _2040 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2044 = _1780 * _1988;
    bool _2046 = !_1730;
    int _2048 = _2046 ? 0 : 1;
    float _2050 = _1812 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _2052 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2054 = isnan(1.0);
    bool _2056 = _2052 || _2054;
    bool _2058 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2060 = _2056 || _2058;
    float _2062 = -_2036;
    float _2064 = _2062 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2066 = _2042 * _2042;
    float _2068 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2070 = fma(_1984, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2030);
    float _2072 = fma(_1996, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2034);
    float _2074 = -_2050;
    float _2076 = _2074 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    bool _2078 = !_2060;
    float _2080 = _2078 ? _126 : _2044;
    float _2082 = fma(_2064, _2064, _2066);
    float _2084 = fma(_2022, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2006);
    int _2086 = abs(_2048);
    float _2088 = fma(_2076, _2076, _2082);
    float _2090 = _2018;
    float _2092 = _2066;
    float _2094 = _2076;
    if (_1754)
    {
        float _2096 = _1580 ? as_type<float>(_2014) : _1502;
        _2090 = _2096;
    }
    float _2098 = _2090;
    float _2100 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2102 = float(_2086);
    float _2104 = fma(_2080, _2038, _2072);
    float _2106 = fma(_2080, _2028, _2070);
    float _2108 = rsqrt(_2088);
    if (_1786)
    {
        _2092 = _1510;
    }
    float _2110 = _2092;
    float _2112 = _2102 * _2002;
    float _2114 = _2110;
    if (!_1786)
    {
        _2114 = _1522;
    }
    float _2116 = _2114;
    float _2118 = _2106 * 0.15915493667125701904296875;
    if (!_1786)
    {
        _2008 = _1534;
    }
    float _2120 = _2008;
    float _2122 = _2112 * (-2.0);
    float _2124 = _2104 * 0.15915493667125701904296875;
    float _2126 = _2116 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2128 = _2120;
    if (_1786)
    {
        _2128 = _1510;
    }
    float _2130 = _2128;
    float _2132 = fma(_2122, _1968, _1968);
    float _2134 = _1522 + (-0.5);
    float _2136 = fma(_1906, _2122, _1906);
    float _2138 = _2124 * 6.283185482025146484375;
    float _2140 = sin(_2138);
    float _2142 = -_2100;
    float _2144 = fma(_2126, 2.0, _2142);
    float _2146 = fma(_2134, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2132);
    float _2148 = _2064 * _2108;
    float _2150 = _2076 * _2108;
    float _2152 = _2042 * _2108;
    float _2154 = fma(_2080, _2136, _2146);
    float _2156 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2158 = _2148 * _2156;
    float _2160 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2162 = _2150 * _2160;
    float _2164 = _2154 * 0.15915493667125701904296875;
    float _2166 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2168 = -_2158;
    float _2170 = fma(_2150, _2166, _2168);
    float _2172 = _2124 * 6.283185482025146484375;
    float _2174 = cos(_2172);
    float _2176 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2178 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2180 = _2152 * _2178;
    float _2182 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2184 = -_2162;
    float _2186 = fma(_2152, _2182, _2184);
    float _2188 = fma(_2130, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2176);
    float _2190 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2192 = -_2180;
    float _2194 = fma(_2148, _2190, _2192);
    if (!_1786)
    {
        _2094 = _1522;
    }
    float _2196 = _2094;
    float _2198 = _2118 * 6.283185482025146484375;
    float _2200 = sin(_2198);
    float _2202 = _2170 * _2170;
    float _2204 = _2196;
    if (_1786)
    {
        _2204 = _1534;
    }
    float _2206 = _2204;
    float _2208 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2210 = _2130 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2212 = fma(_2186, _2186, _2202);
    if (_1758)
    {
        float _2214 = _1584 ? as_type<float>(_1934) : _1502;
        _1550 = _2214;
    }
    float _2216 = _1550;
    float _2218 = fma(_1534, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2068);
    float _2220 = _2118 * 6.283185482025146484375;
    float _2222 = cos(_2220);
    float _2224 = -_2208;
    float _2226 = fma(_2210, 2.0, _2224);
    float _2228 = fma(_1862, _1962, _2084);
    float _2230 = -_126;
    float _2232 = fma(_2230, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2226);
    float _2234 = fma(_1904, _1960, _2228);
    float _2236 = _2164 * 6.283185482025146484375;
    float _2238 = cos(_2236);
    float _2240 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2242 = fma(_2194, _2194, _2212);
    float _2244 = _2164 * 6.283185482025146484375;
    float _2246 = sin(_2244);
    float _2248 = _2222 * _2140;
    float _2250 = fma(_2206, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2240);
    float _2252 = _2222 * _2174;
    float _2254 = _2200 * _2140;
    float _2256 = rsqrt(_2242);
    float _2258 = _2200 * _2174;
    float _2260 = _2174 * _2238;
    float _2262 = _2140 * _2238;
    float _2264 = _2238 * _1824;
    float _2266 = -_2248;
    float _2268 = fma(_2246, _2258, _2266);
    float _2270 = -_2258;
    float _2272 = fma(_2246, _2248, _2270);
    float _2274 = -_1824;
    float _2276 = _2246 * _2274;
    float _2278 = _2222 * _2264;
    float _2280 = fma(_2246, _2252, _2254);
    float _2282 = fma(_2246, _2254, _2252);
    float _2284 = fma(_2260, _1820, _2276);
    float _2286 = _2200 * _2264;
    float _2288 = _2186 * _2256;
    float _2290 = fma(_2280, _1820, _2278);
    float _2292 = _2170 * _2256;
    float _2294 = fma(_2268, _1820, _2286);
    float _2296 = _2152 * _2288;
    float _2298 = fma(_2262, _1822, _2284);
    float _2300 = fma(_2272, _1822, _2290);
    float _2302 = fma(_2282, _1822, _2294);
    float _2304 = _2194 * _2256;
    float _2306 = _2150 * _2292;
    float _2308 = -_2296;
    float _2310 = fma(_2148, _2292, _2308);
    float _2312 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2314 = -_2306;
    float _2316 = fma(_2152, _2304, _2314);
    float _2318 = _2310 * _2300;
    float _2320 = _2316 * _2300;
    float _2322 = fma(_2304, _2298, _2318);
    float _2324 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2326 = (*spvDescriptorSet0.vp_c9)._m0[88].z;
    if (!_1786)
    {
        _2326 = _1522;
    }
    float _2328 = _2326;
    float _2330 = fma(_2288, _2298, _2320);
    float _2332 = fma(_2150, _2302, _2322);
    float _2334 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2336 = _2328;
    float _2338 = _2330;
    if (_1786)
    {
        _2336 = _1534;
    }
    float _2340 = _2336;
    float _2342 = fma(_2148, _2302, _2330);
    float _2344 = _2050 + _2332;
    float _2346 = _2344;
    if (_1786)
    {
        _2338 = _1534;
    }
    float _2348 = _2338;
    float _2350 = fma(_1510, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2334);
    float _2352 = _2036 + _2342;
    float _2354 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2356 = _2344 + _2354;
    float _2358 = fma(_1510, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2324);
    float _2360 = _2348;
    float _2362 = _2352;
    if (!_1786)
    {
        _2360 = _1510;
    }
    float _2364 = _2360;
    float _2366 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2368 = _2352 + _2366;
    float _2370 = _2356 * _2356;
    float _2372 = _2312 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2374 = _2148 * _2304;
    float _2376 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2378 = fma(_2368, _2368, _2370);
    float _2380 = fma(_2372, _1578, -0.5);
    float _2382 = -_2374;
    float _2384 = fma(_2150, _2288, _2382);
    float _2386 = _2340 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2388 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2350);
    float _2390 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2358);
    float _2392 = sqrt(_2378);
    float _2394 = _2384 * _2300;
    float _2396 = fma(_2388, _2380, _2026);
    float _2398 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2250);
    float _2400 = fma(_2292, _2298, _2394);
    float _2402 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2404 = _2376 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2406 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2408 = fma(_2152, _2302, _2400);
    float _2410 = fma(_2404, _2098, -0.5);
    float _2412 = _2032 + _2408;
    bool _2414 = _2392 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2416 = _2402 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2418 = fma(_2386, -2.0, _2406);
    float _2420 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2188);
    float _2422 = fma(_2416, _2216, -0.5);
    float _2424 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2418);
    float _2426 = fma(_2420, _2410, _2232);
    float _2428 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2430 = _2364 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2432 = -_126;
    float _2434 = fma(_2432, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2144);
    float _2436 = fma(_2430, -2.0, _2428);
    float _2438 = fma(_2390, _2422, _2434);
    float _2440 = -_2424;
    float _2442 = fma(_2398, _1652, _2440);
    float _2444 = _2428;
    if (!_2414)
    {
        _2444 = _2412;
    }
    float _2446 = _2444;
    bool _2448 = !_2414;
    float _2450 = _2446;
    if (!_2448)
    {
        float _2452 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2454 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2456 = _2392 + _2454;
        float _2458 = rsqrt(_2378);
        float _2460 = _2456 * _2452;
        float _2462 = _2412 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2464 = _2460 * 0.15915493667125701904296875;
        float _2466 = _2464 * 6.283185482025146484375;
        float _2468 = cos(_2466);
        float _2470 = _2464 * 6.283185482025146484375;
        float _2472 = sin(_2470);
        float _2474 = _2468 + (-1.0);
        float _2476 = _2474 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2478 = fma(_2472, _2462, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2480 = fma(_2412, _2468, _2476);
        float _2482 = _2458 * _2478;
        float _2484 = fma(_2368, _2482, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2486 = fma(_2356, _2482, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2450 = _2480;
        _2362 = _2484;
        _2346 = _2486;
    }
    float _2488 = _2450;
    float _2490 = _2362;
    float _2492 = _2346;
    float _2494 = -_2032;
    float _2496 = _2494 + _2488;
    float _2498 = in.m_57.z;
    float _2500 = -_2036;
    float _2502 = _2500 + _2490;
    float _2504 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2218);
    float _2506 = _2496 * _2496;
    float _2508 = in.m_57.w;
    float _2510 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2436);
    float _2512 = -_2050;
    float _2514 = _2512 + _2492;
    float _2516 = fma(_2502, _2502, _2506);
    float _2518 = fma(_1874, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2234);
    float _2520 = -_2510;
    float _2522 = fma(_2504, _1946, _2520);
    float _2524 = _1458 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2526 = fma(_2514, _2514, _2516);
    float _2528 = _1462 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2530 = _1460 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2532 = _2524 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2534 = sqrt(_2526);
    float _2536 = _2528 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2538 = _2530 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2540 = _2000 + 0.5;
    float _2542 = _2438 + 0.5;
    float _2544 = _2396 + 0.5;
    float _2546 = _2426 + 0.5;
    float _2548 = _2518 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2550 = _2442 + 0.5;
    float _2552 = _2522 + 0.5;
    out.m_59.z = _2498;
    out.m_59.w = _2508;
    bool _2554 = _2534 > 0.0;
    out.m_65.x = _2532;
    out.m_65.y = _2538;
    out.m_65.z = _2536;
    out.m_65.w = _2548;
    out.m_67.x = _2544;
    out.m_67.y = _2540;
    out.m_67.z = _2546;
    out.m_67.w = _2550;
    out.m_69.x = _2542;
    out.m_69.y = _2552;
    bool _2556 = !_2554;
    float _2558 = _2550;
    float _2560 = _2544;
    float _2562 = _2490;
    float _2564 = _2488;
    float _2566 = _2492;
    if (!_2556)
    {
        bool _2568 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2570 = _2540;
        if (_2568)
        {
            float _2572 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2570 = _2572;
        }
        float _2574 = _2570;
        float _2576 = _2574;
        if (_2568)
        {
            float _2578 = _428 * _2574;
            _2558 = _2578;
        }
        float _2580 = _2558;
        float _2582 = _2580;
        if (_2568)
        {
            float _2584 = _430 * _2574;
            _2560 = _2584;
        }
        float _2586 = _2560;
        float _2588 = _2586;
        if (_2568)
        {
            float _2590 = _432 * _2574;
            _2576 = _2590;
        }
        float _2592 = _2576;
        float _2594 = _2592;
        if (!_2568)
        {
            float _2596 = _126 + 1.0;
            if (!_162)
            {
                float _2598 = _2596 * _2596;
                float _2600 = _2598 * 0.5;
                _128 = _2600;
            }
            float _2602 = _128;
            float _2604 = _2602;
            if (!_162)
            {
                float _2606 = _2602 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2604 = _2606;
            }
            float _2608 = _2604;
            bool _2610 = !_162;
            float _2612 = _2608;
            if (!_2610)
            {
                float _2614 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2616 = log2(_2614);
                float _2618 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2620 = 1.0 + _2618;
                float _2622 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2624 = _2616 * _2596;
                float _2626 = 1.0 / _2620;
                float _2628 = _2622 * 0.693147182464599609375;
                float _2630 = exp2(_2624);
                float _2632 = 1.0 / _2628;
                float _2634 = _2630 + (-1.0);
                float _2636 = -_2634;
                float _2638 = fma(_2636, _2632, _2596);
                float _2640 = _2638 * _2626;
                float _2642 = _2640 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2612 = _2642;
            }
            float _2644 = _2612;
            float _2646 = _2644 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2648 = _2644 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2650 = _2644 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2652 = _2646 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _2654 = _2646 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _2656 = _2646 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _2658 = fma(_2648, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2652);
            float _2660 = fma(_2648, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2654);
            float _2662 = fma(_2650, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2658);
            float _2664 = _2658;
            if (!_162)
            {
                _2664 = _2596;
            }
            float _2666 = _2664;
            bool _2668 = !_162;
            float _2670 = _2666;
            if (!_2668)
            {
                float _2672 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2674 = log2(_2672);
                float _2676 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2678 = 1.0 + _2676;
                float _2680 = 1.0 / _2678;
                float _2682 = _2674 * _2596;
                float _2684 = exp2(_2682);
                float _2686 = -_2684;
                float _2688 = _2686 + 1.0;
                float _2690 = _2688 * _2680;
                _2670 = _2690;
            }
            float _2692 = _2670;
            float _2694 = fma(_2650, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2660);
            float _2696 = fma(_2692, _166, _2662);
            float _2698 = fma(_2648, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2656);
            float _2700 = fma(_2692, _164, _2694);
            float _2702 = -_390;
            float _2704 = _2702 + _2696;
            float _2706 = fma(_2650, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2698);
            float _2708 = -_392;
            float _2710 = _2708 + _2700;
            float _2712 = _2704 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2714 = _2704 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2716 = fma(_2692, _168, _2706);
            float _2718 = _2704 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2720 = fma(_2710, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2712);
            float _2722 = fma(_2710, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2714);
            float _2724 = -_406;
            float _2726 = _2724 + _2716;
            float _2728 = fma(_2710, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2718);
            float _2730 = fma(_2726, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2720);
            float _2732 = fma(_2726, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2722);
            float _2734 = fma(_2726, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2728);
            _436 = _2732;
            _438 = _2730;
            _440 = _2734;
            _2582 = _2730;
            _2588 = _2732;
            _2594 = _2734;
        }
        float _2736 = _436;
        float _2738 = _438;
        float _2740 = _440;
        float _2742 = _2582;
        float _2744 = _2588;
        float _2746 = _2594;
        float _2748 = _2736 * _2736;
        float _2750 = rsqrt(_2526);
        float _2752 = fma(_2738, _2738, _2748);
        float _2754 = fma(_2740, _2740, _2752);
        float _2756 = sqrt(_2754);
        float _2758 = _2502 * _2750;
        float _2760 = _2496 * _2750;
        float _2762 = _2514 * _2750;
        bool _2764 = _2756 > 0.0;
        bool _2766 = !_2764;
        _130 = _2760;
        _196 = _2752;
        _198 = _2756;
        _442 = _2740;
        _444 = _2738;
        if (!_2766)
        {
            float _2768 = rsqrt(_2754);
            float _2770 = _2768 * _2736;
            float _2772 = _2768 * _2738;
            float _2774 = _2768 * _2740;
            float _2776 = _2760 * _2770;
            float _2778 = fma(_2758, _2772, _2776);
            float _2780 = fma(_2762, _2774, _2778);
            float _2782 = _2780 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2784 = fma(_2742, _2782, _2490);
            float _2786 = fma(_2744, _2782, _2488);
            float _2788 = fma(_2746, _2782, _2492);
            _2562 = _2784;
            _2564 = _2786;
            _2566 = _2788;
            _130 = _2776;
            _196 = _2774;
            _198 = _2782;
        }
    }
    float _2790 = _2562;
    float _2792 = _2564;
    float _2794 = _2566;
    float _2796 = _130;
    float _2798 = _196;
    float _2800 = _198;
    float _2802 = _442;
    float _2804 = _444;
    bool _2806 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2808 = isnan(0.5);
    bool _2810 = _2806 || _2808;
    bool _2812 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2814 = _2810 || _2812;
    float _2816 = _2798;
    float _2818 = _2796;
    float _2820 = _2800;
    float _2822 = _2794;
    float _2824 = _2804;
    float _2826 = _2802;
    if (_2814)
    {
        _2816 = _2790;
    }
    float _2828 = _2816;
    float _2830 = _2828;
    if (_2814)
    {
        _2818 = _2792;
    }
    float _2832 = _2818;
    float _2834 = _2832;
    if (_2814)
    {
        _2820 = _2794;
    }
    float _2836 = _2820;
    float _2838 = _2836;
    if (!_2814)
    {
        float _2840 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2842 = _2032 + _2840;
        float _2844 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2846 = _2036 + _2844;
        float _2848 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2850 = -_2036;
        float _2852 = _2850 + _2790;
        float _2854 = _2842 * _2842;
        float _2856 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2858 = _2050 + _2856;
        float _2860 = -_2050;
        float _2862 = _2860 + _2794;
        float _2864 = fma(_2846, _2846, _2854);
        float _2866 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2868 = fma(_2858, _2858, _2864);
        float _2870 = sqrt(_2868);
        float _2872 = _2848 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2874 = precise::min(_2870, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2876 = _2874 * _2866;
        float _2878 = -_2032;
        float _2880 = _2878 + _2792;
        float _2882 = _2872 * _2876;
        float _2884 = fma(_2852, _2882, _2036);
        float _2886 = fma(_2880, _2882, _2032);
        float _2888 = fma(_2862, _2882, _2050);
        _2834 = _2886;
        _2830 = _2884;
        _2838 = _2888;
        _2822 = _2862;
    }
    float _2890 = _2834;
    float _2892 = _2830;
    float _2894 = _2838;
    float _2896 = _2822;
    float _2898 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2900 = _2890 + _2898;
    float _2902 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2904 = _2892 + _2902;
    float _2906 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2908 = _2894 + _2906;
    float _2910 = _2900 * _2900;
    float _2912 = fma(_2904, _2904, _2910);
    float _2914 = fma(_2908, _2908, _2912);
    float _2916 = rsqrt(_2914);
    float _2918 = sqrt(_2914);
    float _2920 = _2916 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2922 = _2904 * _2920;
    float _2924 = _2908 * _2920;
    float _2926 = _2922 * _2922;
    float _2928 = _2924 * _2924;
    float _2930 = _2926 + _2928;
    float _2932 = sqrt(_2930);
    bool _2934 = _2932 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2936 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2938 = _2932 + _2936;
    float _2940 = _2908;
    float _2942 = _2938;
    float _2944 = _2900;
    float _2946 = _2896;
    if (_2934)
    {
        float _2948 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2940 = _2948;
    }
    float _2950 = _2940;
    if (_2934)
    {
        float _2952 = rsqrt(_2930);
        _2824 = _2952;
    }
    float _2954 = _2824;
    float _2956 = _2954;
    if (_2934)
    {
        float _2958 = _2938 * _2950;
        _2942 = _2958;
    }
    float _2960 = _2942;
    if (_2934)
    {
        float _2962 = _2960 * 0.15915493667125701904296875;
        _2826 = _2962;
    }
    float _2964 = _2826;
    float _2966 = _2916;
    if (_2934)
    {
        float _2968 = _2964 * 6.283185482025146484375;
        float _2970 = sin(_2968);
        _2966 = _2970;
    }
    float _2972 = _2966;
    float _2974 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2976 = precise::max(0.0, _2974);
    float _2978 = _2910;
    float _2980 = _2976;
    float _2982 = _2974;
    if (_2934)
    {
        float _2984 = _2964 * 6.283185482025146484375;
        float _2986 = cos(_2984);
        _2978 = _2986;
    }
    float _2988 = _2978;
    float _2990 = -_2920;
    float _2992 = -_2976;
    float _2994 = fma(_2900, _2990, _2992);
    if (!_2934)
    {
        _2944 = _2924;
    }
    float _2996 = _2944;
    float _2998 = _2996;
    if (_2934)
    {
        float _3000 = _2994 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2980 = _3000;
    }
    float _3002 = _2980;
    float _3004 = _3002;
    float _3006 = _2972;
    if (_2934)
    {
        float _3008 = fma(_2972, _3002, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3004 = _3008;
    }
    float _3010 = _3004;
    float _3012 = _3010;
    if (!_2934)
    {
        _3006 = _2922;
    }
    float _3014 = _3006;
    float _3016 = _3014;
    float _3018 = _2988;
    if (_2934)
    {
        float _3020 = _2988 + (-1.0);
        _2982 = _3020;
    }
    float _3022 = _2982;
    float _3024 = _3022;
    if (_2934)
    {
        float _3026 = _2954 * _3010;
        _2946 = _3026;
    }
    float _3028 = _2946;
    if (!_2934)
    {
        _3012 = _2994;
    }
    float _3030 = _3012;
    float _3032 = _3030;
    if (_2934)
    {
        float _3034 = _3022 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2956 = _3034;
    }
    float _3036 = _2956;
    if (_2934)
    {
        float _3038 = _2922 * _3028;
        _3016 = _3038;
    }
    float _3040 = _3016;
    if (!_2934)
    {
        _3024 = _2926;
    }
    float _3042 = _3024;
    float _3044 = _3042;
    if (_2934)
    {
        float _3046 = _2924 * _3028;
        _2998 = _3046;
    }
    float _3048 = _2998;
    if (_2934)
    {
        float _3050 = fma(_2994, _2988, _3036);
        _3032 = _3050;
    }
    float _3052 = _3032;
    if (_2934)
    {
        float _3054 = _3040 * _3040;
        _3044 = _3054;
    }
    float _3056 = _3044;
    if (!_2934)
    {
        _3018 = _2928;
    }
    float _3058 = _3018;
    float _3060 = _3058;
    if (_2934)
    {
        float _3062 = _3048 * _3048;
        _3060 = _3062;
    }
    float _3064 = _3060;
    float _3066 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3068 = fma(_3052, _3052, _3056);
    float _3070 = _2890 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3072 = _2890 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3074 = _3068 + _3064;
    float _3076 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3078 = fma(_2918, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3076);
    float _3080 = precise::clamp(_3078, 0.0, 1.0);
    float _3082 = fma(_2892, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3070);
    float _3084 = _2890 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3086 = rsqrt(_3074);
    float _3088 = -_3080;
    float _3090 = _3088 + 1.0;
    float _3092 = fma(_2894, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3082);
    float _3094 = _2890 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3096 = fma(_2892, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3084);
    float _3098 = _3092 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3100 = fma(_2892, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3094);
    float _3102 = fma(_2894, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3096);
    float _3104 = abs(_3090);
    float _3106 = log2(_3104);
    float _3108 = fma(_2892, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3072);
    float _3110 = fma(_2894, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3100);
    float _3112 = _3102 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3114 = _3098 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3116 = fma(_2894, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3108);
    float _3118 = _3110 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3120 = _3086 * _3040;
    float _3122 = _3112 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3124 = _3086 * _3052;
    float _3126 = -_3114;
    float _3128 = fma(_3126, _3066, 1.0);
    float _3130 = _3120 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3132 = _3116 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3134 = fma(_3118, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3122);
    float _3136 = _3086 * _3048;
    float _3138 = -_3130;
    float _3140 = fma(_3124, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3138);
    float _3142 = _3106 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3144 = fma(_3098, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3134);
    float _3146 = log2(_3128);
    float _3148 = -_3136;
    float _3150 = fma(_3148, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3140);
    float _3152 = _3112 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3154 = fma(_3132, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3144);
    float _3156 = _3112 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3158 = fma(_3150, -0.5, 0.5);
    float _3160 = fma(_3118, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3152);
    float _3162 = fma(_3150, 0.5, 0.5);
    float _3164 = exp2(_3142);
    float _3166 = fma(_3118, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3156);
    float _3168 = fma(_3098, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3160);
    float _3170 = fma(_3162, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3172 = _3124 + 1.0;
    float _3174 = fma(_3098, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3166);
    float _3176 = fma(_3132, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3168);
    float _3178 = fma(_3162, _3170, -0.212114393711090087890625);
    float _3180 = 1.0 / _3154;
    float _3182 = fma(_3132, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3174);
    float _3184 = _3146 * 0.693147182464599609375;
    float _3186 = fma(_3162, _3178, 1.570728778839111328125);
    float _3188 = _3184 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3190 = sqrt(_3158);
    float _3192 = -_3124;
    float _3194 = fma(_3164, _3172, _3192);
    float _3196 = fma(_3194, 0.5, 0.5);
    float _3198 = _3176 * _3180;
    float _3200 = _3182 * _3180;
    float _3202 = fma(_3198, 0.5, 0.5);
    float _3204 = fma(_3200, -0.5, 0.5);
    float _3206 = _3190 * 0.636619746685028076171875;
    float _3208 = -_3186;
    float _3210 = fma(_3206, _3208, 1.0);
    float3 _8457 = float3(_3202, _3204, _3188);
    float _3212 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8457, float3(0.0), isnan(_8457)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8457, float3(0.0), isnan(_8457)), level(0.0)).x;
    float3 _8468 = float3(_3202, _3204, _3188);
    float4 _3215 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8468, float3(0.0), isnan(_8468)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8468, float3(0.0), isnan(_8468)), level(0.0)).xyzw;
    float _3217 = _3215.x;
    float _3219 = _3215.y;
    float _3221 = _3215.z;
    float _3223 = _3215.w;
    float2 _8485 = float2(_3210, _3196);
    float3 _3227 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8485, float2(0.0), isnan(_8485)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8485, float2(0.0), isnan(_8485)), level(0.0)).xyz;
    float _3229 = _3227.x;
    float _3231 = _3227.y;
    float _3233 = _3227.z;
    float _3235 = _2032 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3237 = _2032 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _3239 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _3241 = isnan(0.5);
    bool _3243 = _3239 || _3241;
    bool _3245 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3247 = _3243 || _3245;
    float _3249 = fma(_2036, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3235);
    float _3251 = fma(_2036, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3237);
    float _3253 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3249);
    float _3255 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3251);
    float _3257 = _3253 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3259 = _3255 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3261 = _3253;
    float _3263 = _3106;
    if (!_3247)
    {
        _1928 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _3265 = _1928;
    float _3267 = 1.0 / _3257;
    float _3269 = _3259 + _3257;
    float _3271 = _3106 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3273 = exp2(_3271);
    float _3275 = _3269 * _3267;
    float _3277 = _3275 * 0.5;
    float _3279 = _3112 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3281 = _3265;
    float _3283 = _3277;
    if (!_3247)
    {
        float _3285 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3287 = fma(_3277, _3265, _3285);
        _3281 = _3287;
    }
    float _3289 = _3281;
    if (!_3247)
    {
        _3283 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _3291 = _3283;
    float _3293 = fma(_3118, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3279);
    float _3295 = _3154 * 0.5;
    float _3297 = _3289;
    float _3299 = _3291;
    if (!_3247)
    {
        float _3301 = 1.0 / _3289;
        _3297 = _3301;
    }
    float _3303 = _3297;
    if (!_3247)
    {
        float _3305 = -_3291;
        float _3307 = _3305 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _3261 = _3307;
    }
    float _3309 = _3261;
    float _3311 = fma(_3098, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3293);
    float _3313 = -_3273;
    float _3315 = _3313 + 1.0;
    float _3317 = fma(_3132, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3311);
    float _3319 = _2050;
    if (!_3247)
    {
        float _3321 = 1.0 / _3309;
        _3319 = _3321;
    }
    float _3323 = _3319;
    float _3325 = _3315 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3327 = _3317 + _3154;
    out.gl_Position.x = _3176;
    out.gl_Position.y = _3182;
    out.gl_Position.z = _3317;
    out.gl_Position.w = _3154;
    float _3329 = _3327 * 0.5;
    if (!_3247)
    {
        float _3331 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3333 = -_3291;
        float _3335 = fma(_3303, _3331, _3333);
        _3263 = _3335;
    }
    float _3337 = _3263;
    float _3339 = _3337;
    if (_3247)
    {
        _3299 = 1.0;
    }
    float _3341 = _3299;
    float _3343 = fma(_3182, -0.5, _3295);
    float _3345 = _3341;
    if (!_3247)
    {
        float _3347 = _3337 * _3323;
        float _3349 = precise::clamp(_3347, 0.0, 1.0);
        _3339 = _3349;
    }
    float _3351 = _3339;
    if (!_3247)
    {
        float _3353 = -_3351;
        float _3355 = _3353 + 1.0;
        _3345 = _3355;
    }
    float _3357 = _3345;
    float _3359 = _3176 + _3154;
    float _3361 = _3357 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _3363 = _3357 > 0.0;
    bool _3365 = isnan(_3357);
    bool _3367 = _3363 || _3365;
    bool _3369 = isnan(0.0);
    bool _3371 = _3367 || _3369;
    float _3373 = -_3325;
    float _3375 = _3373 + 1.0;
    float _3377 = _3359 * 0.5;
    float _3379 = _3361 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_71.x = _3377;
    out.m_71.y = _3343;
    out.m_71.z = _3329;
    out.m_71.w = _3154;
    out.m_45.x = _3379;
    float _3381 = _3325 * _3212;
    float _3383 = _3223 * _3381;
    float _3385 = _3233 * _3381;
    float _3387 = _3223 * _3375;
    float _3389 = fma(_3229, _3383, _3217);
    float _3391 = fma(_3231, _3383, _3219);
    float _3393 = fma(_3223, _3385, _3221);
    out.m_73.x = _3389;
    out.m_73.y = _3391;
    out.m_73.z = _3393;
    out.m_73.w = _3387;
    if (_3371)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _3395 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3395;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

