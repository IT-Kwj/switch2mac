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
    float4 m_63 [[user(locn0)]];
    float4 m_61 [[user(locn1)]];
    float4 m_59 [[user(locn2)]];
    float4 m_67 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_57 [[user(locn5)]];
    float4 m_69 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_65 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_55 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1534 = false;
    bool _602 = false;
    bool _424 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_44.w;
    float _85 = trunc(_83);
    int _88 = int(_85);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _94;
    float _98 = _96;
    if (!_92)
    {
        out.m_47.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _96 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2280 = as_type<float>(_104);
        out.gl_Position.z = _2280;
    }
    if (!_92)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _108 = in.m_49.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _124 = 0.0;
    if (_118)
    {
        float _126 = float(_88);
        _124 = _126;
    }
    float _128 = _124;
    bool _130 = _122 >= _128;
    bool _132 = !_118;
    bool _134 = _130 || _132;
    if (_134)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _98;
    if (_134)
    {
        out.m_47.x = 0.0;
    }
    if (_134)
    {
        float _138 = _136 * 5.0;
        _106 = as_type<int>(_138);
    }
    int _140 = _106;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2348 = as_type<float>(_140);
        out.gl_Position.z = _2348;
    }
    if (_134)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _142 = in.m_51.x;
    float _144 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _146 = _122 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    bool _148 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _150 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _152 = _148 || _150;
    bool _154 = isnan(1.0);
    bool _156 = _152 || _154;
    float _158 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    int _160 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _162 = _160 != 0;
    float _164 = _146 * _144;
    float _166 = _122 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _168 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[20].x, _164);
    float _170 = _166 * _158;
    float _172 = floor(_168);
    float _174 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[20].y, _170);
    float _176 = _168 * 6.283185482025146484375;
    float _178 = _174 * 6.283185482025146484375;
    float _180 = _176 * 0.15915493667125701904296875;
    float _182 = in.m_49.x;
    float _184 = in.m_49.y;
    float _186 = in.m_49.z;
    float _188 = _178 * 0.15915493667125701904296875;
    float _190 = floor(_174);
    float _192 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _194 = 1.4012984643248170709237295832899e-45;
    float _196 = _192;
    float _198 = _142;
    if (!_156)
    {
        float _200 = _192 * _192;
        float _202 = _200 * 0.5;
        _194 = _202;
    }
    float _204 = _194;
    float _206 = -_172;
    float _208 = _168 + _206;
    float _210 = _180 * 6.283185482025146484375;
    float _212 = cos(_210);
    float _214 = _204;
    if (!_156)
    {
        float _216 = _204 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _214 = _216;
    }
    float _218 = _214;
    float _220 = _188 * 6.283185482025146484375;
    float _222 = cos(_220);
    float _224 = -_190;
    float _226 = _174 + _224;
    bool _228 = !_156;
    float _230 = _218;
    if (!_228)
    {
        float _232 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _234 = log2(_232);
        float _236 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _238 = _236 + 1.0;
        float _240 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _242 = _192 * _234;
        float _244 = 1.0 / _238;
        float _246 = _240 * 0.693147182464599609375;
        float _248 = exp2(_242);
        float _250 = 1.0 / _246;
        float _252 = _248 + (-1.0);
        float _254 = -_252;
        float _256 = fma(_254, _250, _192);
        float _258 = _256 * _244;
        float _260 = _258 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _230 = _260;
    }
    float _262 = _230;
    bool _264 = !_156;
    if (!_264)
    {
        float _266 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _268 = log2(_266);
        float _270 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _272 = _270 + 1.0;
        float _274 = 1.0 / _272;
        float _276 = _192 * _268;
        float _278 = exp2(_276);
        float _280 = -_278;
        float _282 = _280 + 1.0;
        float _284 = _282 * _274;
        _196 = _284;
    }
    float _286 = _196;
    float _288 = in.m_53.w;
    float _290 = in.m_44.x;
    float _292 = in.m_44.y;
    float _294 = in.m_44.z;
    float _296 = fma(_212, 0.5, 0.5);
    float _298 = fma(_222, 0.5, 0.5);
    bool _300 = _208 < 0.5;
    float _302 = float(_300);
    float _304 = -_208;
    float _306 = fma(_304, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _308 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _310 = _308 != 0;
    int _312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _314 = _312 != 0;
    float _316 = -_226;
    float _318 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _320 = _226 < 0.5;
    float _322 = float(_320);
    float _324 = -_302;
    float _326 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _328 = -_296;
    float _330 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _332 = _262 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _334 = !_162;
    int _336 = _334 ? 0 : 1;
    float _338 = -_298;
    float _340 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _342 = _262 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _344 = !_310;
    int _346 = _344 ? 0 : 1;
    float _348 = -_322;
    float _350 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _352 = fma(_286, _184, _332);
    int _354 = abs(_336);
    float _356 = fma(_286, _182, _342);
    bool _358 = !_314;
    int _360 = _358 ? 0 : 1;
    float _362 = _262 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _364 = abs(_346);
    float _366 = fma(_356, _288, _290);
    float _368 = fma(_286, _186, _362);
    int _370 = abs(_360);
    float _372 = fma(_352, _288, _292);
    bool _374 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _376 = fma(_368, _288, _294);
    float _378 = float(_364);
    float _380 = float(_354);
    float _382 = abs(_306);
    float _384 = _378 * _382;
    float _386 = abs(_318);
    float _388 = _378 * _386;
    float _390 = float(_370);
    float _392 = fma(_380, _330, _384);
    float _394 = fma(_380, _340, _388);
    float _396 = abs(_326);
    float _398 = fma(_390, _396, _392);
    float _400 = abs(_350);
    float _402 = fma(_390, _400, _394);
    bool _404 = !_374;
    bool _406 = false;
    float _422;
    if (!_404)
    {
        float _408 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _410 = _142 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _412 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _414 = _412 * _408;
        float _416 = floor(_414);
        float _418 = -_416;
        float _420 = _414 + _418;
        _422 = _420;
        _424 = true;
    }
    else
    {
        float _426 = float(_88);
        float _428 = 1.0 / _426;
        float _430 = _122 * _428;
        _422 = _430;
    }
    _424 = false;
    float _432 = _422;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _436 = _432 + _434;
    bool _438 = _432 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _440 = isnan(_432);
    bool _442 = _438 || _440;
    bool _444 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _446 = _442 || _444;
    float _448 = float(_446);
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _452 = _432 + _450;
    bool _454 = _432 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _456 = isnan(_432);
    bool _458 = _454 || _456;
    bool _460 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _462 = _458 || _460;
    float _464 = float(_462);
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _466;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _472 = _470 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _474 = _432 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _476 = isnan(_432);
    bool _478 = _474 || _476;
    bool _480 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _482 = _478 || _480;
    float _484 = float(_482);
    float _486 = -_448;
    float _488 = _486 + 1.0;
    float _490 = 1.0 / _472;
    float _492 = _484 * _488;
    float _494 = -_484;
    float _496 = _494 + 1.0;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _498;
    bool _502 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _504 = 1.0 / _468;
    float _506 = _464 * _496;
    float _508 = -_464;
    float _510 = _508 + 1.0;
    float _512 = _452 * _490;
    float _514 = _436 * _504;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _518 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _516;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _520;
    float _524 = fma(_500, _514, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _526 = fma(_518, _514, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _528 = fma(_522, _514, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _530 = in.m_53.x;
    float _532 = in.m_53.y;
    float _534 = in.m_53.z;
    float _536 = _524 * _506;
    float _538 = _526 * _506;
    float _540 = _528 * _506;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _544 = _542 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _548 = _546 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _552 = _550 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _554 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[143].x, _536);
    float _556 = fma(_544, _512, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _558 = fma(_548, _512, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _560 = fma(_552, _512, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _562 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[143].y, _538);
    float _564 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[143].z, _540);
    float _566 = fma(_556, _492, _554);
    float _568 = fma(_558, _492, _562);
    float _570 = fma(_560, _492, _564);
    float _572 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[145].x, _566);
    float _574 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[145].y, _568);
    float _576 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[145].z, _570);
    float _578 = _572 * _530;
    float _580 = _574 * _532;
    float _582 = _576 * _534;
    bool _584 = !_502;
    float _600;
    if (!_584)
    {
        float _586 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _588 = _142 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _590 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _592 = _590 * _586;
        float _594 = floor(_592);
        float _596 = -_594;
        float _598 = _592 + _596;
        _600 = _598;
        _602 = true;
    }
    else
    {
        float _604 = float(_88);
        float _606 = 1.0 / _604;
        float _608 = _122 * _606;
        _600 = _608;
    }
    _602 = false;
    float _610 = _600;
    float _612 = in.m_51.w;
    float _614 = _372 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _616 = _372 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _620 = _618 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _624 = _622 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _628 = _626 != 0;
    float _630 = 1.0 / _620;
    float _632 = _372 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _634 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _636 = _634 != 0;
    float _638 = fma(_366, (*spvDescriptorSet0.vp_c10)._m0[4].x, _614);
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _642 = _640 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _644 = fma(_366, (*spvDescriptorSet0.vp_c10)._m0[5].x, _616);
    float _646 = 1.0 / _624;
    float _648 = fma(_366, (*spvDescriptorSet0.vp_c10)._m0[6].x, _632);
    float _650 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[4].z, _638);
    int _652 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _654 = _652 != 0;
    float _656 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[6].z, _648);
    bool _658 = _612 > 0.5;
    float _660 = 1.0 / _642;
    float _662 = (*spvDescriptorSet0.vp_c9)._m0[19].y;
    bool _664 = _658;
    if (_636)
    {
        float _666 = in.m_51.z;
        _662 = _666;
    }
    float _668 = _662;
    int _670 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _672 = _670 != 0;
    float _674 = _650 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _676 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _678 = _676 != 0;
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _682 = _680 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _686 = _684 + (*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _688;
    float _692 = 1.0 / _682;
    float _694 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[5].z, _644);
    float _696 = in.m_51.y;
    bool _698 = _610 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _700 = isnan(_610);
    bool _702 = _698 || _700;
    bool _704 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _706 = _702 || _704;
    float _708 = float(_706);
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _712 = _710 + (*spvDescriptorSet0.vp_c9)._m0[121].w;
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _716 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _714;
    float _718 = in.m_55.x;
    float _720 = _694 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _722 = 1.0 / _686;
    float _724 = _690 * _630;
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _728 = _726 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _730 = _716 * _660;
    float _732 = _656 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[120].x + _734;
    float _738 = 1.0 / _712;
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _742 = _740 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _744 = _728 * _646;
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[120].x;
    float _748 = _746 + (*spvDescriptorSet0.vp_c9)._m0[121].x;
    float _750 = in.m_55.y;
    float _752 = _742 * _692;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _756 = _610 + _754;
    float _758 = _722;
    float _760 = _732;
    if (_636)
    {
        bool _762 = _668 > 0.5;
        _406 = _762;
    }
    bool _764 = _406;
    float _766 = _736 * _722;
    float _768 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _770 = _610 + _768;
    float _772 = fma(_724, _756, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _776 = _610 + _774;
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _780 = _610 + _778;
    float _782 = fma(_730, _770, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _784 = _610 >= (*spvDescriptorSet0.vp_c9)._m0[121].w;
    bool _786 = isnan(_610);
    bool _788 = _784 || _786;
    bool _790 = isnan((*spvDescriptorSet0.vp_c9)._m0[121].w);
    bool _792 = _788 || _790;
    float _794 = float(_792);
    float _796 = fma(_744, _776, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _798 = fma(_752, _780, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _800 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _802 = _610 + _800;
    bool _804 = _610 >= (*spvDescriptorSet0.vp_c9)._m0[120].w;
    bool _806 = isnan(_610);
    bool _808 = _804 || _806;
    bool _810 = isnan((*spvDescriptorSet0.vp_c9)._m0[120].w);
    bool _812 = _808 || _810;
    float _814 = float(_812);
    float _816 = -_794;
    float _818 = _816 + 1.0;
    float _820 = _748 * _738;
    float _822 = fma(_766, _802, (*spvDescriptorSet0.vp_c9)._m0[119].x);
    bool _824 = _610 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _826 = isnan(_610);
    bool _828 = _824 || _826;
    bool _830 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _832 = _828 || _830;
    float _834 = float(_832);
    float _836 = _814 * _818;
    float _838 = -_814;
    float _840 = _838 + 1.0;
    float _842 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _844 = _610 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _846 = isnan(_610);
    bool _848 = _844 || _846;
    bool _850 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _852 = _848 || _850;
    float _854 = float(_852);
    float _856 = _818;
    int _858 = as_type<int>(_772);
    if (!_628)
    {
        float _860 = in.m_51.z;
        _856 = _860;
    }
    float _862 = _856;
    float _864 = _834 * _840;
    float _866 = -_834;
    float _868 = _866 + 1.0;
    bool _870 = _610 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _872 = isnan(_610);
    bool _874 = _870 || _872;
    bool _876 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _878 = _874 || _876;
    float _880 = float(_878);
    float _882 = -_750;
    float _884 = _882 + 1.0;
    float _886 = -_854;
    float _888 = _886 + 1.0;
    float _890 = _854 * _868;
    bool _892 = _610 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _894 = isnan(_610);
    bool _896 = _892 || _894;
    bool _898 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _900 = _896 || _898;
    float _902 = float(_900);
    float _904 = -_880;
    float _906 = _904 + 1.0;
    int _908 = _658 ? as_type<int>(_884) : as_type<int>(_750);
    float _910 = _880 * _888;
    float _912 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _914 = _610 + _912;
    float _916 = _902 * _906;
    float _918 = -_902;
    float _920 = _918 + 1.0;
    float _922 = _672 ? as_type<float>(_908) : _750;
    float _924 = _842 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _926 = _902;
    float _928 = _750;
    if (!_628)
    {
        _758 = _696;
    }
    float _930 = _758;
    float _932 = _708 * _920;
    float _934 = _930;
    if (_628)
    {
        _934 = _142;
    }
    float _936 = _934;
    float _938 = fma(_924, _922, -0.5);
    float _940 = _772 * _932;
    float _942 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _944 = _862;
    if (!_628)
    {
        _926 = _862;
    }
    float _946 = _926;
    float _948 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _950 = _946;
    if (_628)
    {
        _950 = _696;
    }
    float _952 = _950;
    if (_654)
    {
        float _954 = -_718;
        float _956 = _954 + 1.0;
        _858 = as_type<int>(_956);
    }
    int _958 = _858;
    float _960 = as_type<float>(_958);
    if (_628)
    {
        _944 = _696;
    }
    float _962 = _944;
    float _964 = fma(_820, _914, (*spvDescriptorSet0.vp_c9)._m0[120].x);
    if (_654)
    {
        bool _966 = _142 > 0.5;
        _664 = _966;
    }
    bool _968 = _664;
    int _970 = 0;
    if (_636)
    {
        float _972 = -_718;
        float _974 = _972 + 1.0;
        _970 = as_type<int>(_974);
    }
    int _976 = _970;
    bool _978 = _696 > 0.5;
    float _980 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[83].z, _948);
    float _982 = _936 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (!_654)
    {
        _198 = _718;
    }
    float _984 = _198;
    float _986 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _988 = _984;
    if (_654)
    {
        float _990 = _968 ? as_type<float>(_958) : _718;
        _988 = _990;
    }
    float _992 = _988;
    float _994 = -_708;
    float _996 = _994 + 1.0;
    if (!_636)
    {
        _960 = _718;
    }
    float _998 = _960;
    float _1000 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1002 = _998;
    if (_636)
    {
        float _1004 = _764 ? as_type<float>(_976) : _718;
        _1002 = _1004;
    }
    float _1006 = _1002;
    float _1008 = fma(_962, (*spvDescriptorSet0.vp_c9)._m0[83].w, _986);
    float _1010 = fma(_996, (*spvDescriptorSet0.vp_c9)._m0[115].x, _940);
    float _1012 = _942 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1014 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1016 = _720 + _1014;
    float _1018 = -_1000;
    float _1020 = fma(_982, 2.0, _1018);
    float _1022 = fma(_796, _916, _1010);
    float _1024 = fma(_1012, _1006, -0.5);
    float _1026 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1028 = _674 + _1026;
    float _1030 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1032 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1034 = fma(_782, _910, _1022);
    float _1036 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1030);
    float _1038 = _952 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1040 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1042 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _980);
    float _1044 = -_122;
    float _1046 = fma(_1044, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1020);
    float _1048 = fma(_798, _890, _1034);
    float _1050 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1052 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1054 = _732 + _1052;
    float _1056 = fma(_1038, -2.0, _1040);
    float _1058 = fma(_1042, _1024, _1046);
    float _1060 = _1040;
    if (_678)
    {
        float _1062 = _978 ? _884 : _750;
        _928 = _1062;
    }
    float _1064 = _928;
    float _1066 = fma(_822, _864, _1048);
    float _1068 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1036);
    float _1070 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1008);
    float _1072 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1056);
    float _1074 = _992 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1076 = fma(_964, _836, _1066);
    float _1078 = _1064 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1080 = _1016 * _1016;
    bool _1082 = _1068 >= 0.0;
    float _1084 = -_1072;
    float _1086 = fma(_1070, _938, _1084);
    float _1088 = _1074 * _1032;
    float _1090 = _1078 * _1050;
    float _1092 = fma(_1028, _1028, _1080);
    float _1094 = _1058 + 0.5;
    float _1096 = fma(_1054, _1054, _1092);
    float _1098 = _1086 + 0.5;
    float _1100 = fma(_794, (*spvDescriptorSet0.vp_c9)._m0[121].x, _1076);
    float _1102 = rsqrt(_1096);
    out.m_57.x = 1.0;
    out.m_57.y = 1.0;
    out.m_57.z = 1.0;
    out.m_59.x = _1088;
    out.m_59.y = _1090;
    out.m_59.z = _1094;
    out.m_59.w = _1098;
    if (_1082)
    {
        _1060 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1104 = _1060;
    int _1106 = as_type<int>(_1104);
    if (_1082)
    {
        out.m_47.x = 0.0;
    }
    if (_1082)
    {
        float _1108 = _1104 * 5.0;
        _1106 = as_type<int>(_1108);
    }
    int _1110 = _1106;
    float _1112 = as_type<float>(_1110);
    if (_1082)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3904 = as_type<float>(_1110);
        out.gl_Position.z = _3904;
    }
    float _1114 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1116 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1118 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1120 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1122 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1124 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1126 = _1114 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1128 = _1120 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1130 = _1122 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1132 = _1116 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1134 = _1118 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1136 = _1124 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1138 = _1100 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_61.x = _1126;
    out.m_61.y = _1128;
    out.m_61.z = _1130;
    float _1140 = _1016 * _1102;
    float _1142 = _1028 * _1102;
    out.m_63.x = _1132;
    out.m_63.y = _1134;
    out.m_63.z = _1136;
    out.m_63.w = _1138;
    if (_1082)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1144 = -_1140;
    float _1146 = fma(_1144, (*spvDescriptorSet0.vp_c9)._m0[18].w, _720);
    float _1148 = _1054 * _1102;
    float _1150 = -_1142;
    float _1152 = fma(_1150, (*spvDescriptorSet0.vp_c9)._m0[18].w, _674);
    float _1154 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1156 = _1146 + _1154;
    float _1158 = -_1148;
    float _1160 = fma(_1158, (*spvDescriptorSet0.vp_c9)._m0[18].w, _732);
    float _1162 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1164 = _1152 + _1162;
    float _1166 = _1156 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1168 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1170 = _1160 + _1168;
    float _1172 = fma(_1164, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1166);
    float _1174 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1172);
    bool _1176 = _1174 >= 0.0;
    if (_1176)
    {
        _1112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1178 = _1112;
    int _1180 = as_type<int>(_1178);
    if (_1176)
    {
        out.m_47.x = 0.0;
    }
    if (_1176)
    {
        float _1182 = _1178 * 5.0;
        _1180 = as_type<int>(_1182);
    }
    int _1184 = _1180;
    if (_1176)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4075 = as_type<float>(_1184);
        out.gl_Position.z = _4075;
    }
    if (_1176)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1186 = -_1140;
    float _1188 = fma(_1186, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1016);
    float _1190 = -_1142;
    float _1192 = fma(_1190, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1028);
    float _1194 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1196 = _1188 * _1188;
    float _1198 = -_1148;
    float _1200 = fma(_1198, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1054);
    float _1202 = _398 * _578;
    float _1204 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1194);
    float _1206 = fma(_1192, _1192, _1196);
    float _1208 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1204);
    float _1210 = fma(_1200, _1200, _1206);
    float _1212 = in.m_65.x;
    float _1214 = in.m_65.y;
    float _1216 = in.m_65.z;
    float _1218 = rsqrt(_1208);
    float _1220 = (*spvDescriptorSet0.vp_c15)._m0[660].x * 0.01745329238474369049072265625;
    float _1222 = _1220 * 0.15915493667125701904296875;
    float _1224 = sqrt(_1210);
    float _1226 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1228 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1230 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1232 = _402 * _580;
    float _1234 = _1226 * _1226;
    float _1236 = _1202 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1238 = _1222 * 6.283185482025146484375;
    float _1240 = cos(_1238);
    float _1242 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1214);
    float _1244 = fma(_1228, _1228, _1234);
    float _1246 = _1102 * _1224;
    float _1248 = _1232 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1250 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1212);
    float _1252 = fma(_1230, _1230, _1244);
    float _1254 = _1246 * _1236;
    float _1256 = _582 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1258 = _1246 * _1248;
    float _1260 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1216);
    float _1262 = _1250 * _1254;
    float _1264 = rsqrt(_1252);
    float _1266 = _1246 * _1256;
    float _1268 = _1242 * _1258;
    float _1270 = -_1240;
    float _1272 = _1270 + 1.0;
    float _1274 = _1260 * _1266;
    float _1276 = _1268 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1278 = _1268 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1280 = _1222 * 6.283185482025146484375;
    float _1282 = sin(_1280);
    float _1284 = _1268 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1286 = fma(_1262, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1276);
    float _1288 = fma(_1262, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1278);
    float _1290 = fma(_1262, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1284);
    float _1292 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1286);
    float _1294 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1288);
    float _1296 = _1228 * _1264;
    float _1298 = _1230 * _1264;
    float _1300 = _1226 * _1264;
    float _1302 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1290);
    float _1304 = _1296 * _1272;
    float _1306 = _1294 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1308 = _1300 * _1272;
    float _1310 = _1292 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1312 = _1298 * _1282;
    float _1314 = _1296 * _1282;
    float _1316 = _1300 * _1282;
    float _1318 = fma(_1296, _1304, _1240);
    float _1320 = -_1312;
    float _1322 = fma(_1300, _1304, _1320);
    float _1324 = fma(_1298, _1308, _1314);
    float _1326 = _1298 * _1298;
    float _1328 = _1302 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1330 = _1306 * _1322;
    float _1332 = -_1316;
    float _1334 = fma(_1298, _1304, _1332);
    float _1336 = _1306 * _1324;
    float _1338 = fma(_1272, _1326, _1240);
    float _1340 = fma(_1310, _1318, _1330);
    float _1342 = fma(_1298, _1304, _1316);
    float _1344 = fma(_1310, _1334, _1336);
    float _1346 = fma(_1300, _1308, _1240);
    float _1348 = fma(_1300, _1304, _1312);
    float _1350 = fma(_1328, _1342, _1340);
    float _1352 = fma(_1328, _1338, _1344);
    float _1354 = _1306 * _1346;
    float _1356 = -_1314;
    float _1358 = fma(_1298, _1308, _1356);
    float _1360 = _674 + _1350;
    float _1362 = _732 + _1352;
    float _1364 = fma(_1310, _1348, _1354);
    float _1366 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1368 = _1360 + _1366;
    float _1370 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1372 = _1362 + _1370;
    float _1374 = fma(_1328, _1358, _1364);
    float _1376 = _1368 * _1368;
    float _1378 = _1372 * _1372;
    float _1380 = _720 + _1374;
    float _1382 = _1376 + _1378;
    float _1384 = sqrt(_1382);
    bool _1386 = _1384 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1388 = _1298;
    float _1390 = _1354;
    float _1392 = _1374;
    float _1394 = _1364;
    float _1396 = _1358;
    if (!_1386)
    {
        _1388 = _1378;
    }
    float _1398 = _1388;
    float _1400 = _1398;
    if (!_1386)
    {
        _1390 = _1376;
    }
    float _1402 = _1390;
    float _1404 = _1402;
    if (!_1386)
    {
        _1392 = _1360;
    }
    float _1406 = _1392;
    float _1408 = _1406;
    if (!_1386)
    {
        _1394 = _1362;
    }
    float _1410 = _1394;
    float _1412 = _1410;
    if (!_1386)
    {
        _1396 = _1380;
    }
    float _1414 = _1396;
    bool _1416 = !_1386;
    float _1418 = _1414;
    if (!_1416)
    {
        float _1420 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1422 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1424 = _1384 + _1422;
        float _1426 = rsqrt(_1382);
        float _1428 = _1424 * _1420;
        float _1430 = _1380 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1432 = _1428 * 0.15915493667125701904296875;
        float _1434 = _1432 * 6.283185482025146484375;
        float _1436 = sin(_1434);
        float _1438 = _1432 * 6.283185482025146484375;
        float _1440 = cos(_1438);
        float _1442 = fma(_1436, _1430, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1444 = _1426 * _1442;
        float _1446 = _1440 + (-1.0);
        float _1448 = fma(_1368, _1444, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1450 = fma(_1372, _1444, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1452 = _1446 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1454 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1456 = _1448 + _1454;
        float _1458 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1460 = _1450 + _1458;
        float _1462 = fma(_1380, _1440, _1452);
        float _1464 = _1456 * _1456;
        float _1466 = _1460 * _1460;
        _1418 = _1462;
        _1404 = _1464;
        _1400 = _1466;
        _1408 = _1448;
        _1412 = _1450;
    }
    float _1468 = _1418;
    float _1470 = _1404;
    float _1472 = _1400;
    float _1474 = _1408;
    float _1476 = _1412;
    float _1478 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1480 = _1468 + _1478;
    out.m_63.x = _1132;
    out.m_63.y = _1134;
    out.m_63.z = _1136;
    out.m_63.w = _1138;
    float _1482 = fma(_1480, _1480, _1470);
    out.m_61.x = _1126;
    out.m_61.y = _1128;
    out.m_61.z = _1130;
    float _1484 = _1482 + _1472;
    float _1486 = sqrt(_1484);
    bool _1488 = _1486 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1490 = isnan(_1486);
    bool _1492 = _1488 || _1490;
    bool _1494 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1496 = _1492 || _1494;
    float _1498 = _1482;
    if (!_1496)
    {
        _1498 = 1.0;
    }
    float _1500 = _1498;
    bool _1502 = !_1496;
    float _1504 = _1500;
    if (!_1502)
    {
        bool _1506 = _1486 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1508 = isnan(_1486);
        bool _1510 = _1506 || _1508;
        bool _1512 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1514 = _1510 || _1512;
        if (!_1514)
        {
            float _1516 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1518 = _1486 + _1516;
            float _1520 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1522 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1520;
            float _1524 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1526 = _1524 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1528 = 1.0 / _1522;
            float _1530 = _1518 * _1528;
            float _1532 = fma(_1530, _1526, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1504 = _1532;
            _1534 = true;
        }
        else
        {
            bool _1536 = _1486 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1538 = isnan(_1486);
            bool _1540 = _1536 || _1538;
            bool _1542 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1544 = _1540 || _1542;
            if (!_1544)
            {
                float _1546 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1548 = _1486 + _1546;
                float _1550 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1552 = _1550 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1554 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1556 = _1554 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1558 = 1.0 / _1552;
                float _1560 = _1548 * _1558;
                float _1562 = fma(_1560, _1556, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1504 = _1562;
                _1534 = true;
            }
            else
            {
                _1504 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1534 = false;
    float _1564 = _1504;
    float _1566 = _1146 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1568 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1570 = _1474 + _1568;
    float _1572 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1566);
    float _1574 = _1146 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1576 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1572);
    bool _1578 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1580 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1582 = _1578 || _1580;
    bool _1584 = isnan(0.5);
    bool _1586 = _1582 || _1584;
    bool _1588 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1590 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1592 = _1588 || _1590;
    bool _1594 = isnan(0.5);
    bool _1596 = _1592 || _1594;
    float _1598 = _1576 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1600 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1574);
    float _1602 = 1.0 / _1598;
    float _1604 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1600);
    float _1606 = _1604 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1608 = _1606 + _1598;
    float _1610 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1612 = _1476 + _1610;
    float _1614 = fma(_1570, _1564, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1616 = fma(_1612, _1564, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1618 = -_1142;
    float _1620 = fma(_1618, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1614);
    float _1622 = _1608 * _1602;
    float _1624 = _1622 * 0.5;
    float _1626 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1628 = _1468 + _1626;
    float _1630 = -_1148;
    float _1632 = fma(_1630, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1616);
    float _1634 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1636 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1634);
    float _1638 = fma(_1628, _1564, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1640 = _1624;
    float _1642 = _1620;
    float _1644 = _1632;
    float _1646 = _1628;
    if (_1596)
    {
        _1640 = 1.0;
    }
    float _1648 = _1640;
    float _1650 = 1.0 / _1636;
    float _1652 = -_1140;
    float _1654 = fma(_1652, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1638);
    float _1656 = _1654;
    float _1658 = _1648;
    if (!_1586)
    {
        float _1660 = _1156 * _1156;
        float _1662 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1664 = -_732;
        float _1666 = _1664 + _1616;
        float _1668 = -_674;
        float _1670 = _1668 + _1614;
        float _1672 = fma(_1164, _1164, _1660);
        float _1674 = -_720;
        float _1676 = _1674 + _1638;
        float _1678 = fma(_1170, _1170, _1672);
        float _1680 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1682 = sqrt(_1678);
        float _1684 = 1.0 / _1246;
        float _1686 = _1680 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1688 = precise::min(_1682, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1690 = _1688 * _1662;
        float _1692 = _1690 * _1684;
        float _1694 = _1686 * _1692;
        float _1696 = _1666 * _1692;
        float _1698 = fma(_1670, _1694, _1152);
        float _1700 = fma(_1676, _1694, _1146);
        float _1702 = fma(_1686, _1696, _1160);
        _1656 = _1700;
        _1642 = _1698;
        _1644 = _1702;
        _760 = _1696;
        _1646 = _1692;
    }
    float _1704 = _1656;
    float _1706 = _1642;
    float _1708 = _1644;
    float _1710 = _760;
    float _1712 = _1646;
    float _1714 = _1712;
    float _1716 = _1710;
    if (_1596)
    {
        _1714 = 1.0;
    }
    float _1718 = _1714;
    float _1720 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1722 = _1650 * _1720;
    float _1724 = _1718;
    float _1726 = _1722;
    if (!_1596)
    {
        float _1728 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1730 = _1728 * 0.15915493667125701904296875;
        float _1732 = _1730 * 6.283185482025146484375;
        float _1734 = cos(_1732);
        float _1736 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1738 = _1736 * 0.15915493667125701904296875;
        float _1740 = _1730 * 6.283185482025146484375;
        float _1742 = sin(_1740);
        float _1744 = 1.0 / _1734;
        float _1746 = _1738 * 6.283185482025146484375;
        float _1748 = cos(_1746);
        float _1750 = _1742 * _1744;
        float _1752 = _1738 * 6.283185482025146484375;
        float _1754 = sin(_1752);
        float _1756 = _1748 * _1750;
        float _1758 = 1.0 / _1756;
        float _1760 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1762 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1760;
        float _1764 = 1.0 / _1762;
        float _1766 = _1754 * _1758;
        float _1768 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1770 = fma(_1722, _1766, _1768);
        float _1772 = _1770 * _1764;
        float _1774 = precise::clamp(_1772, 0.0, 1.0);
        _1658 = _1774;
    }
    float _1776 = _1658;
    if (!_1596)
    {
        float _1778 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1780 = _1778 * 0.15915493667125701904296875;
        float _1782 = _1780 * 6.283185482025146484375;
        float _1784 = cos(_1782);
        float _1786 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1788 = _1786 * 0.15915493667125701904296875;
        float _1790 = _1780 * 6.283185482025146484375;
        float _1792 = sin(_1790);
        float _1794 = 1.0 / _1784;
        float _1796 = _1788 * 6.283185482025146484375;
        float _1798 = cos(_1796);
        float _1800 = _1792 * _1794;
        float _1802 = _1788 * 6.283185482025146484375;
        float _1804 = sin(_1802);
        float _1806 = _1798 * _1800;
        float _1808 = 1.0 / _1806;
        float _1810 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1812 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1810;
        float _1814 = 1.0 / _1812;
        float _1816 = _1804 * _1808;
        float _1818 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1820 = fma(_1722, _1816, _1818);
        float _1822 = _1820 * _1814;
        float _1824 = precise::clamp(_1822, 0.0, 1.0);
        float _1826 = -_1824;
        float _1828 = _1826 + 1.0;
        _1724 = _1828;
    }
    float _1830 = _1724;
    float _1832 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1834 = _1704 + _1832;
    float _1836 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1838 = _1706 + _1836;
    float _1840 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1842 = _1708 + _1840;
    float _1844 = _1834 * _1834;
    float _1846 = fma(_1838, _1838, _1844);
    float _1848 = fma(_1842, _1842, _1846);
    float _1850 = rsqrt(_1848);
    float _1852 = _1850 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1854 = _1838 * _1852;
    float _1856 = _1842 * _1852;
    float _1858 = _1854 * _1854;
    float _1860 = _1856 * _1856;
    float _1862 = _1858 + _1860;
    float _1864 = sqrt(_1862);
    bool _1866 = _1864 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1868 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1870 = _1864 + _1868;
    float _1872 = _1850;
    float _1874 = _1862;
    float _1876 = _1870;
    float _1878 = _1834;
    float _1880 = _1854;
    if (_1866)
    {
        float _1882 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1872 = _1882;
    }
    float _1884 = _1872;
    if (_1866)
    {
        float _1886 = rsqrt(_1862);
        _1874 = _1886;
    }
    float _1888 = _1874;
    if (_1866)
    {
        float _1890 = _1870 * _1884;
        _1876 = _1890;
    }
    float _1892 = _1876;
    if (_1866)
    {
        float _1894 = _1892 * 0.15915493667125701904296875;
        _1726 = _1894;
    }
    float _1896 = _1726;
    float _1898 = _1884;
    if (_1866)
    {
        float _1900 = _1896 * 6.283185482025146484375;
        float _1902 = sin(_1900);
        _1898 = _1902;
    }
    float _1904 = _1898;
    float _1906 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1908 = precise::max(0.0, _1906);
    float _1910 = _1842;
    float _1912 = _1908;
    if (_1866)
    {
        float _1914 = _1896 * 6.283185482025146484375;
        float _1916 = cos(_1914);
        _1910 = _1916;
    }
    float _1918 = _1910;
    float _1920 = -_1852;
    float _1922 = -_1908;
    float _1924 = fma(_1834, _1920, _1922);
    float _1926 = _1924;
    if (!_1866)
    {
        _1878 = _1856;
    }
    float _1928 = _1878;
    float _1930 = _1928;
    if (_1866)
    {
        float _1932 = _1924 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1912 = _1932;
    }
    float _1934 = _1912;
    float _1936 = sqrt(_1848);
    float _1938 = _1904;
    float _1940 = _1934;
    if (_1866)
    {
        float _1942 = fma(_1904, _1934, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1938 = _1942;
    }
    float _1944 = _1938;
    float _1946 = _1944;
    float _1948 = _1918;
    if (_1866)
    {
        float _1950 = _1918 + (-1.0);
        _1940 = _1950;
    }
    float _1952 = _1940;
    float _1954 = _1952;
    if (_1866)
    {
        float _1956 = _1888 * _1944;
        _1716 = _1956;
    }
    float _1958 = _1716;
    if (_1866)
    {
        float _1960 = _1952 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1946 = _1960;
    }
    float _1962 = _1946;
    if (_1866)
    {
        float _1964 = _1854 * _1958;
        _1880 = _1964;
    }
    float _1966 = _1880;
    if (!_1866)
    {
        _1954 = _1858;
    }
    float _1968 = _1954;
    float _1970 = _1968;
    if (_1866)
    {
        float _1972 = _1856 * _1958;
        _1930 = _1972;
    }
    float _1974 = _1930;
    if (_1866)
    {
        float _1976 = fma(_1924, _1918, _1962);
        _1926 = _1976;
    }
    float _1978 = _1926;
    if (_1866)
    {
        float _1980 = _1966 * _1966;
        _1970 = _1980;
    }
    float _1982 = _1970;
    if (!_1866)
    {
        _1948 = _1860;
    }
    float _1984 = _1948;
    float _1986 = _1984;
    if (_1866)
    {
        float _1988 = _1974 * _1974;
        _1986 = _1988;
    }
    float _1990 = _1986;
    float _1992 = fma(_1978, _1978, _1982);
    float _1994 = _1992 + _1990;
    float _1996 = _1704 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1998 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2000 = fma(_1936, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1998);
    float _2002 = precise::clamp(_2000, 0.0, 1.0);
    float _2004 = _1704 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2006 = rsqrt(_1994);
    float _2008 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1996);
    float _2010 = -_2002;
    float _2012 = _2010 + 1.0;
    float _2014 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2004);
    float _2016 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2018 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2008);
    float _2020 = _1704 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2022 = _1704 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2024 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2014);
    float _2026 = _2018 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2028 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2020);
    float _2030 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2022);
    float _2032 = _2024 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2034 = _2026 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2036 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2028);
    float _2038 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2030);
    float _2040 = abs(_2012);
    float _2042 = log2(_2040);
    float _2044 = _2006 * _1966;
    float _2046 = -_2034;
    float _2048 = fma(_2046, _2016, 1.0);
    float _2050 = _2036 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2052 = _2032 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2054 = _2038 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2056 = _2006 * _1978;
    float _2058 = _2044 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2060 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2052);
    float _2062 = _2006 * _1974;
    float _2064 = log2(_2048);
    float _2066 = -_2058;
    float _2068 = fma(_2056, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2066);
    float _2070 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2060);
    float _2072 = _2032 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2074 = _2056 + 1.0;
    float _2076 = -_2062;
    float _2078 = fma(_2076, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2068);
    float _2080 = fma(_2054, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2070);
    float _2082 = _2042 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2084 = _2032 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2086 = fma(_2078, -0.5, 0.5);
    float _2088 = 1.0 / _2080;
    float _2090 = fma(_2078, 0.5, 0.5);
    float _2092 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2084);
    float _2094 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2072);
    float _2096 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2092);
    float _2098 = fma(_2090, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2100 = exp2(_2082);
    float _2102 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2094);
    float _2104 = fma(_2054, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2096);
    float _2106 = fma(_2090, _2098, -0.212114393711090087890625);
    float _2108 = _2064 * 0.693147182464599609375;
    float _2110 = fma(_2054, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2102);
    float _2112 = fma(_2090, _2106, 1.570728778839111328125);
    float _2114 = sqrt(_2086);
    float _2116 = _2104 * _2088;
    float _2118 = _2110 * _2088;
    float _2120 = _2108 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2122 = fma(_2116, 0.5, 0.5);
    float _2124 = fma(_2118, -0.5, 0.5);
    float _2126 = -_2056;
    float _2128 = fma(_2100, _2074, _2126);
    float3 _5602 = float3(_2122, _2124, _2120);
    float _2130 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5602, float3(0.0), isnan(_5602)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5602, float3(0.0), isnan(_5602)), level(0.0)).x;
    float _2132 = fma(_2128, 0.5, 0.5);
    float _2134 = _2114 * 0.636619746685028076171875;
    float _2136 = -_2112;
    float _2138 = fma(_2134, _2136, 1.0);
    float3 _5623 = float3(_2122, _2124, _2120);
    float4 _2141 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5623, float3(0.0), isnan(_5623)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5623, float3(0.0), isnan(_5623)), level(0.0)).xyzw;
    float _2143 = _2141.x;
    float _2145 = _2141.y;
    float _2147 = _2141.z;
    float _2149 = _2141.w;
    float2 _5640 = float2(_2138, _2132);
    float3 _2153 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5640, float2(0.0), isnan(_5640)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5640, float2(0.0), isnan(_5640)), level(0.0)).xyz;
    float _2155 = _2153.x;
    float _2157 = _2153.y;
    float _2159 = _2153.z;
    float _2161 = _2042 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2163 = _2032 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2165 = _1776 > 0.0;
    bool _2167 = isnan(_1776);
    bool _2169 = _2165 || _2167;
    bool _2171 = isnan(0.0);
    bool _2173 = _2169 || _2171;
    float _2175 = _1776 * _1830;
    float _2177 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2163);
    float _2179 = exp2(_2161);
    bool _2181 = _1830 <= 0.0;
    bool _2183 = !_2173;
    bool _2185 = _2181 || _2183;
    float _2187 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2177);
    float _2189 = _2175 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2191 = fma(_2054, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2187);
    float _2193 = _2189 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2195 = _2191 + _2080;
    out.gl_Position.x = _2104;
    out.gl_Position.y = _2110;
    out.gl_Position.z = _2191;
    out.gl_Position.w = _2080;
    float _2197 = _2195 * 0.5;
    float _2199 = -_2179;
    float _2201 = _2199 + 1.0;
    out.m_47.x = _2193;
    float _2203 = _2201 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_67.z = _2197;
    out.m_67.w = _2080;
    float _2205 = _2203 * _2130;
    float _2207 = -_2203;
    float _2209 = _2207 + 1.0;
    float _2211 = _2149 * _2205;
    float _2213 = _2159 * _2205;
    float _2215 = fma(_2155, _2211, _2143);
    float _2217 = fma(_2157, _2211, _2145);
    float _2219 = _2149 * _2209;
    float _2221 = fma(_2149, _2213, _2147);
    out.m_69.x = _2215;
    out.m_69.y = _2217;
    out.m_69.z = _2221;
    out.m_69.w = _2219;
    if (!_2185)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2223 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2223;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1534 = false;
    bool _602 = false;
    bool _424 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_44.w;
    float _85 = trunc(_83);
    int _88 = int(_85);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _94;
    float _98 = _96;
    if (!_92)
    {
        out.m_47.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _96 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2280 = as_type<float>(_104);
        out.gl_Position.z = _2280;
    }
    if (!_92)
    {
        return out;
    }
    float _108 = in.m_49.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _124 = 0.0;
    if (_118)
    {
        float _126 = float(_88);
        _124 = _126;
    }
    float _128 = _124;
    bool _130 = _122 >= _128;
    bool _132 = !_118;
    bool _134 = _130 || _132;
    if (_134)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _98;
    if (_134)
    {
        out.m_47.x = 0.0;
    }
    if (_134)
    {
        float _138 = _136 * 5.0;
        _106 = as_type<int>(_138);
    }
    int _140 = _106;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2348 = as_type<float>(_140);
        out.gl_Position.z = _2348;
    }
    if (_134)
    {
        return out;
    }
    float _142 = in.m_51.x;
    float _144 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _146 = _122 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    bool _148 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _150 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _152 = _148 || _150;
    bool _154 = isnan(1.0);
    bool _156 = _152 || _154;
    float _158 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    int _160 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _162 = _160 != 0;
    float _164 = _146 * _144;
    float _166 = _122 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _168 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[20].x, _164);
    float _170 = _166 * _158;
    float _172 = floor(_168);
    float _174 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[20].y, _170);
    float _176 = _168 * 6.283185482025146484375;
    float _178 = _174 * 6.283185482025146484375;
    float _180 = _176 * 0.15915493667125701904296875;
    float _182 = in.m_49.x;
    float _184 = in.m_49.y;
    float _186 = in.m_49.z;
    float _188 = _178 * 0.15915493667125701904296875;
    float _190 = floor(_174);
    float _192 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _194 = 1.4012984643248170709237295832899e-45;
    float _196 = _192;
    float _198 = _142;
    if (!_156)
    {
        float _200 = _192 * _192;
        float _202 = _200 * 0.5;
        _194 = _202;
    }
    float _204 = _194;
    float _206 = -_172;
    float _208 = _168 + _206;
    float _210 = _180 * 6.283185482025146484375;
    float _212 = cos(_210);
    float _214 = _204;
    if (!_156)
    {
        float _216 = _204 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _214 = _216;
    }
    float _218 = _214;
    float _220 = _188 * 6.283185482025146484375;
    float _222 = cos(_220);
    float _224 = -_190;
    float _226 = _174 + _224;
    bool _228 = !_156;
    float _230 = _218;
    if (!_228)
    {
        float _232 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _234 = log2(_232);
        float _236 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _238 = _236 + 1.0;
        float _240 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _242 = _192 * _234;
        float _244 = 1.0 / _238;
        float _246 = _240 * 0.693147182464599609375;
        float _248 = exp2(_242);
        float _250 = 1.0 / _246;
        float _252 = _248 + (-1.0);
        float _254 = -_252;
        float _256 = fma(_254, _250, _192);
        float _258 = _256 * _244;
        float _260 = _258 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _230 = _260;
    }
    float _262 = _230;
    bool _264 = !_156;
    if (!_264)
    {
        float _266 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _268 = log2(_266);
        float _270 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _272 = _270 + 1.0;
        float _274 = 1.0 / _272;
        float _276 = _192 * _268;
        float _278 = exp2(_276);
        float _280 = -_278;
        float _282 = _280 + 1.0;
        float _284 = _282 * _274;
        _196 = _284;
    }
    float _286 = _196;
    float _288 = in.m_53.w;
    float _290 = in.m_44.x;
    float _292 = in.m_44.y;
    float _294 = in.m_44.z;
    float _296 = fma(_212, 0.5, 0.5);
    float _298 = fma(_222, 0.5, 0.5);
    bool _300 = _208 < 0.5;
    float _302 = float(_300);
    float _304 = -_208;
    float _306 = fma(_304, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _308 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _310 = _308 != 0;
    int _312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _314 = _312 != 0;
    float _316 = -_226;
    float _318 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _320 = _226 < 0.5;
    float _322 = float(_320);
    float _324 = -_302;
    float _326 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _328 = -_296;
    float _330 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _332 = _262 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _334 = !_162;
    int _336 = _334 ? 0 : 1;
    float _338 = -_298;
    float _340 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _342 = _262 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _344 = !_310;
    int _346 = _344 ? 0 : 1;
    float _348 = -_322;
    float _350 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _352 = fma(_286, _184, _332);
    int _354 = abs(_336);
    float _356 = fma(_286, _182, _342);
    bool _358 = !_314;
    int _360 = _358 ? 0 : 1;
    float _362 = _262 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _364 = abs(_346);
    float _366 = fma(_356, _288, _290);
    float _368 = fma(_286, _186, _362);
    int _370 = abs(_360);
    float _372 = fma(_352, _288, _292);
    bool _374 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _376 = fma(_368, _288, _294);
    float _378 = float(_364);
    float _380 = float(_354);
    float _382 = abs(_306);
    float _384 = _378 * _382;
    float _386 = abs(_318);
    float _388 = _378 * _386;
    float _390 = float(_370);
    float _392 = fma(_380, _330, _384);
    float _394 = fma(_380, _340, _388);
    float _396 = abs(_326);
    float _398 = fma(_390, _396, _392);
    float _400 = abs(_350);
    float _402 = fma(_390, _400, _394);
    bool _404 = !_374;
    bool _406 = false;
    float _422;
    if (!_404)
    {
        float _408 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _410 = _142 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _412 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _414 = _412 * _408;
        float _416 = floor(_414);
        float _418 = -_416;
        float _420 = _414 + _418;
        _422 = _420;
        _424 = true;
    }
    else
    {
        float _426 = float(_88);
        float _428 = 1.0 / _426;
        float _430 = _122 * _428;
        _422 = _430;
    }
    _424 = false;
    float _432 = _422;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _436 = _432 + _434;
    bool _438 = _432 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _440 = isnan(_432);
    bool _442 = _438 || _440;
    bool _444 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _446 = _442 || _444;
    float _448 = float(_446);
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _452 = _432 + _450;
    bool _454 = _432 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _456 = isnan(_432);
    bool _458 = _454 || _456;
    bool _460 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _462 = _458 || _460;
    float _464 = float(_462);
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _466;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _472 = _470 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _474 = _432 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _476 = isnan(_432);
    bool _478 = _474 || _476;
    bool _480 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _482 = _478 || _480;
    float _484 = float(_482);
    float _486 = -_448;
    float _488 = _486 + 1.0;
    float _490 = 1.0 / _472;
    float _492 = _484 * _488;
    float _494 = -_484;
    float _496 = _494 + 1.0;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _498;
    bool _502 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _504 = 1.0 / _468;
    float _506 = _464 * _496;
    float _508 = -_464;
    float _510 = _508 + 1.0;
    float _512 = _452 * _490;
    float _514 = _436 * _504;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _518 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _516;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _520;
    float _524 = fma(_500, _514, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _526 = fma(_518, _514, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _528 = fma(_522, _514, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _530 = in.m_53.x;
    float _532 = in.m_53.y;
    float _534 = in.m_53.z;
    float _536 = _524 * _506;
    float _538 = _526 * _506;
    float _540 = _528 * _506;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _544 = _542 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _548 = _546 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _552 = _550 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _554 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[143].x, _536);
    float _556 = fma(_544, _512, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _558 = fma(_548, _512, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _560 = fma(_552, _512, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _562 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[143].y, _538);
    float _564 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[143].z, _540);
    float _566 = fma(_556, _492, _554);
    float _568 = fma(_558, _492, _562);
    float _570 = fma(_560, _492, _564);
    float _572 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[145].x, _566);
    float _574 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[145].y, _568);
    float _576 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[145].z, _570);
    float _578 = _572 * _530;
    float _580 = _574 * _532;
    float _582 = _576 * _534;
    bool _584 = !_502;
    float _600;
    if (!_584)
    {
        float _586 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _588 = _142 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _590 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _592 = _590 * _586;
        float _594 = floor(_592);
        float _596 = -_594;
        float _598 = _592 + _596;
        _600 = _598;
        _602 = true;
    }
    else
    {
        float _604 = float(_88);
        float _606 = 1.0 / _604;
        float _608 = _122 * _606;
        _600 = _608;
    }
    _602 = false;
    float _610 = _600;
    float _612 = in.m_51.w;
    float _614 = _372 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _616 = _372 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _620 = _618 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _624 = _622 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _628 = _626 != 0;
    float _630 = 1.0 / _620;
    float _632 = _372 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _634 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _636 = _634 != 0;
    float _638 = fma(_366, (*spvDescriptorSet0.vp_c10)._m0[4].x, _614);
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _642 = _640 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _644 = fma(_366, (*spvDescriptorSet0.vp_c10)._m0[5].x, _616);
    float _646 = 1.0 / _624;
    float _648 = fma(_366, (*spvDescriptorSet0.vp_c10)._m0[6].x, _632);
    float _650 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[4].z, _638);
    int _652 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _654 = _652 != 0;
    float _656 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[6].z, _648);
    bool _658 = _612 > 0.5;
    float _660 = 1.0 / _642;
    float _662 = (*spvDescriptorSet0.vp_c9)._m0[19].y;
    bool _664 = _658;
    if (_636)
    {
        float _666 = in.m_51.z;
        _662 = _666;
    }
    float _668 = _662;
    int _670 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _672 = _670 != 0;
    float _674 = _650 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _676 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _678 = _676 != 0;
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _682 = _680 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _686 = _684 + (*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _688;
    float _692 = 1.0 / _682;
    float _694 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[5].z, _644);
    float _696 = in.m_51.y;
    bool _698 = _610 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _700 = isnan(_610);
    bool _702 = _698 || _700;
    bool _704 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _706 = _702 || _704;
    float _708 = float(_706);
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _712 = _710 + (*spvDescriptorSet0.vp_c9)._m0[121].w;
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _716 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _714;
    float _718 = in.m_55.x;
    float _720 = _694 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _722 = 1.0 / _686;
    float _724 = _690 * _630;
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _728 = _726 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _730 = _716 * _660;
    float _732 = _656 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[120].x + _734;
    float _738 = 1.0 / _712;
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _742 = _740 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _744 = _728 * _646;
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[120].x;
    float _748 = _746 + (*spvDescriptorSet0.vp_c9)._m0[121].x;
    float _750 = in.m_55.y;
    float _752 = _742 * _692;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _756 = _610 + _754;
    float _758 = _722;
    float _760 = _732;
    if (_636)
    {
        bool _762 = _668 > 0.5;
        _406 = _762;
    }
    bool _764 = _406;
    float _766 = _736 * _722;
    float _768 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _770 = _610 + _768;
    float _772 = fma(_724, _756, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _776 = _610 + _774;
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _780 = _610 + _778;
    float _782 = fma(_730, _770, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _784 = _610 >= (*spvDescriptorSet0.vp_c9)._m0[121].w;
    bool _786 = isnan(_610);
    bool _788 = _784 || _786;
    bool _790 = isnan((*spvDescriptorSet0.vp_c9)._m0[121].w);
    bool _792 = _788 || _790;
    float _794 = float(_792);
    float _796 = fma(_744, _776, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _798 = fma(_752, _780, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _800 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _802 = _610 + _800;
    bool _804 = _610 >= (*spvDescriptorSet0.vp_c9)._m0[120].w;
    bool _806 = isnan(_610);
    bool _808 = _804 || _806;
    bool _810 = isnan((*spvDescriptorSet0.vp_c9)._m0[120].w);
    bool _812 = _808 || _810;
    float _814 = float(_812);
    float _816 = -_794;
    float _818 = _816 + 1.0;
    float _820 = _748 * _738;
    float _822 = fma(_766, _802, (*spvDescriptorSet0.vp_c9)._m0[119].x);
    bool _824 = _610 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _826 = isnan(_610);
    bool _828 = _824 || _826;
    bool _830 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _832 = _828 || _830;
    float _834 = float(_832);
    float _836 = _814 * _818;
    float _838 = -_814;
    float _840 = _838 + 1.0;
    float _842 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _844 = _610 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _846 = isnan(_610);
    bool _848 = _844 || _846;
    bool _850 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _852 = _848 || _850;
    float _854 = float(_852);
    float _856 = _818;
    int _858 = as_type<int>(_772);
    if (!_628)
    {
        float _860 = in.m_51.z;
        _856 = _860;
    }
    float _862 = _856;
    float _864 = _834 * _840;
    float _866 = -_834;
    float _868 = _866 + 1.0;
    bool _870 = _610 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _872 = isnan(_610);
    bool _874 = _870 || _872;
    bool _876 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _878 = _874 || _876;
    float _880 = float(_878);
    float _882 = -_750;
    float _884 = _882 + 1.0;
    float _886 = -_854;
    float _888 = _886 + 1.0;
    float _890 = _854 * _868;
    bool _892 = _610 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _894 = isnan(_610);
    bool _896 = _892 || _894;
    bool _898 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _900 = _896 || _898;
    float _902 = float(_900);
    float _904 = -_880;
    float _906 = _904 + 1.0;
    int _908 = _658 ? as_type<int>(_884) : as_type<int>(_750);
    float _910 = _880 * _888;
    float _912 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _914 = _610 + _912;
    float _916 = _902 * _906;
    float _918 = -_902;
    float _920 = _918 + 1.0;
    float _922 = _672 ? as_type<float>(_908) : _750;
    float _924 = _842 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _926 = _902;
    float _928 = _750;
    if (!_628)
    {
        _758 = _696;
    }
    float _930 = _758;
    float _932 = _708 * _920;
    float _934 = _930;
    if (_628)
    {
        _934 = _142;
    }
    float _936 = _934;
    float _938 = fma(_924, _922, -0.5);
    float _940 = _772 * _932;
    float _942 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _944 = _862;
    if (!_628)
    {
        _926 = _862;
    }
    float _946 = _926;
    float _948 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _950 = _946;
    if (_628)
    {
        _950 = _696;
    }
    float _952 = _950;
    if (_654)
    {
        float _954 = -_718;
        float _956 = _954 + 1.0;
        _858 = as_type<int>(_956);
    }
    int _958 = _858;
    float _960 = as_type<float>(_958);
    if (_628)
    {
        _944 = _696;
    }
    float _962 = _944;
    float _964 = fma(_820, _914, (*spvDescriptorSet0.vp_c9)._m0[120].x);
    if (_654)
    {
        bool _966 = _142 > 0.5;
        _664 = _966;
    }
    bool _968 = _664;
    int _970 = 0;
    if (_636)
    {
        float _972 = -_718;
        float _974 = _972 + 1.0;
        _970 = as_type<int>(_974);
    }
    int _976 = _970;
    bool _978 = _696 > 0.5;
    float _980 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[83].z, _948);
    float _982 = _936 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (!_654)
    {
        _198 = _718;
    }
    float _984 = _198;
    float _986 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _988 = _984;
    if (_654)
    {
        float _990 = _968 ? as_type<float>(_958) : _718;
        _988 = _990;
    }
    float _992 = _988;
    float _994 = -_708;
    float _996 = _994 + 1.0;
    if (!_636)
    {
        _960 = _718;
    }
    float _998 = _960;
    float _1000 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1002 = _998;
    if (_636)
    {
        float _1004 = _764 ? as_type<float>(_976) : _718;
        _1002 = _1004;
    }
    float _1006 = _1002;
    float _1008 = fma(_962, (*spvDescriptorSet0.vp_c9)._m0[83].w, _986);
    float _1010 = fma(_996, (*spvDescriptorSet0.vp_c9)._m0[115].x, _940);
    float _1012 = _942 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1014 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1016 = _720 + _1014;
    float _1018 = -_1000;
    float _1020 = fma(_982, 2.0, _1018);
    float _1022 = fma(_796, _916, _1010);
    float _1024 = fma(_1012, _1006, -0.5);
    float _1026 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1028 = _674 + _1026;
    float _1030 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1032 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1034 = fma(_782, _910, _1022);
    float _1036 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1030);
    float _1038 = _952 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1040 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1042 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _980);
    float _1044 = -_122;
    float _1046 = fma(_1044, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1020);
    float _1048 = fma(_798, _890, _1034);
    float _1050 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1052 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1054 = _732 + _1052;
    float _1056 = fma(_1038, -2.0, _1040);
    float _1058 = fma(_1042, _1024, _1046);
    float _1060 = _1040;
    if (_678)
    {
        float _1062 = _978 ? _884 : _750;
        _928 = _1062;
    }
    float _1064 = _928;
    float _1066 = fma(_822, _864, _1048);
    float _1068 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1036);
    float _1070 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1008);
    float _1072 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1056);
    float _1074 = _992 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1076 = fma(_964, _836, _1066);
    float _1078 = _1064 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1080 = _1016 * _1016;
    bool _1082 = _1068 >= 0.0;
    float _1084 = -_1072;
    float _1086 = fma(_1070, _938, _1084);
    float _1088 = _1074 * _1032;
    float _1090 = _1078 * _1050;
    float _1092 = fma(_1028, _1028, _1080);
    float _1094 = _1058 + 0.5;
    float _1096 = fma(_1054, _1054, _1092);
    float _1098 = _1086 + 0.5;
    float _1100 = fma(_794, (*spvDescriptorSet0.vp_c9)._m0[121].x, _1076);
    float _1102 = rsqrt(_1096);
    out.m_57.x = 1.0;
    out.m_57.y = 1.0;
    out.m_57.z = 1.0;
    out.m_59.x = _1088;
    out.m_59.y = _1090;
    out.m_59.z = _1094;
    out.m_59.w = _1098;
    if (_1082)
    {
        _1060 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1104 = _1060;
    int _1106 = as_type<int>(_1104);
    if (_1082)
    {
        out.m_47.x = 0.0;
    }
    if (_1082)
    {
        float _1108 = _1104 * 5.0;
        _1106 = as_type<int>(_1108);
    }
    int _1110 = _1106;
    float _1112 = as_type<float>(_1110);
    if (_1082)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3904 = as_type<float>(_1110);
        out.gl_Position.z = _3904;
    }
    float _1114 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1116 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1118 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1120 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1122 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1124 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1126 = _1114 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1128 = _1120 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1130 = _1122 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1132 = _1116 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1134 = _1118 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1136 = _1124 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1138 = _1100 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_61.x = _1126;
    out.m_61.y = _1128;
    out.m_61.z = _1130;
    float _1140 = _1016 * _1102;
    float _1142 = _1028 * _1102;
    out.m_63.x = _1132;
    out.m_63.y = _1134;
    out.m_63.z = _1136;
    out.m_63.w = _1138;
    if (_1082)
    {
        return out;
    }
    float _1144 = -_1140;
    float _1146 = fma(_1144, (*spvDescriptorSet0.vp_c9)._m0[18].w, _720);
    float _1148 = _1054 * _1102;
    float _1150 = -_1142;
    float _1152 = fma(_1150, (*spvDescriptorSet0.vp_c9)._m0[18].w, _674);
    float _1154 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1156 = _1146 + _1154;
    float _1158 = -_1148;
    float _1160 = fma(_1158, (*spvDescriptorSet0.vp_c9)._m0[18].w, _732);
    float _1162 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1164 = _1152 + _1162;
    float _1166 = _1156 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1168 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1170 = _1160 + _1168;
    float _1172 = fma(_1164, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1166);
    float _1174 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1172);
    bool _1176 = _1174 >= 0.0;
    if (_1176)
    {
        _1112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1178 = _1112;
    int _1180 = as_type<int>(_1178);
    if (_1176)
    {
        out.m_47.x = 0.0;
    }
    if (_1176)
    {
        float _1182 = _1178 * 5.0;
        _1180 = as_type<int>(_1182);
    }
    int _1184 = _1180;
    if (_1176)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4075 = as_type<float>(_1184);
        out.gl_Position.z = _4075;
    }
    if (_1176)
    {
        return out;
    }
    float _1186 = -_1140;
    float _1188 = fma(_1186, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1016);
    float _1190 = -_1142;
    float _1192 = fma(_1190, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1028);
    float _1194 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1196 = _1188 * _1188;
    float _1198 = -_1148;
    float _1200 = fma(_1198, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1054);
    float _1202 = _398 * _578;
    float _1204 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1194);
    float _1206 = fma(_1192, _1192, _1196);
    float _1208 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1204);
    float _1210 = fma(_1200, _1200, _1206);
    float _1212 = in.m_65.x;
    float _1214 = in.m_65.y;
    float _1216 = in.m_65.z;
    float _1218 = rsqrt(_1208);
    float _1220 = (*spvDescriptorSet0.vp_c15)._m0[660].x * 0.01745329238474369049072265625;
    float _1222 = _1220 * 0.15915493667125701904296875;
    float _1224 = sqrt(_1210);
    float _1226 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1228 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1230 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1232 = _402 * _580;
    float _1234 = _1226 * _1226;
    float _1236 = _1202 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1238 = _1222 * 6.283185482025146484375;
    float _1240 = cos(_1238);
    float _1242 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1214);
    float _1244 = fma(_1228, _1228, _1234);
    float _1246 = _1102 * _1224;
    float _1248 = _1232 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1250 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1212);
    float _1252 = fma(_1230, _1230, _1244);
    float _1254 = _1246 * _1236;
    float _1256 = _582 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1258 = _1246 * _1248;
    float _1260 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1216);
    float _1262 = _1250 * _1254;
    float _1264 = rsqrt(_1252);
    float _1266 = _1246 * _1256;
    float _1268 = _1242 * _1258;
    float _1270 = -_1240;
    float _1272 = _1270 + 1.0;
    float _1274 = _1260 * _1266;
    float _1276 = _1268 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1278 = _1268 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1280 = _1222 * 6.283185482025146484375;
    float _1282 = sin(_1280);
    float _1284 = _1268 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1286 = fma(_1262, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1276);
    float _1288 = fma(_1262, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1278);
    float _1290 = fma(_1262, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1284);
    float _1292 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1286);
    float _1294 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1288);
    float _1296 = _1228 * _1264;
    float _1298 = _1230 * _1264;
    float _1300 = _1226 * _1264;
    float _1302 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1290);
    float _1304 = _1296 * _1272;
    float _1306 = _1294 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1308 = _1300 * _1272;
    float _1310 = _1292 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1312 = _1298 * _1282;
    float _1314 = _1296 * _1282;
    float _1316 = _1300 * _1282;
    float _1318 = fma(_1296, _1304, _1240);
    float _1320 = -_1312;
    float _1322 = fma(_1300, _1304, _1320);
    float _1324 = fma(_1298, _1308, _1314);
    float _1326 = _1298 * _1298;
    float _1328 = _1302 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1330 = _1306 * _1322;
    float _1332 = -_1316;
    float _1334 = fma(_1298, _1304, _1332);
    float _1336 = _1306 * _1324;
    float _1338 = fma(_1272, _1326, _1240);
    float _1340 = fma(_1310, _1318, _1330);
    float _1342 = fma(_1298, _1304, _1316);
    float _1344 = fma(_1310, _1334, _1336);
    float _1346 = fma(_1300, _1308, _1240);
    float _1348 = fma(_1300, _1304, _1312);
    float _1350 = fma(_1328, _1342, _1340);
    float _1352 = fma(_1328, _1338, _1344);
    float _1354 = _1306 * _1346;
    float _1356 = -_1314;
    float _1358 = fma(_1298, _1308, _1356);
    float _1360 = _674 + _1350;
    float _1362 = _732 + _1352;
    float _1364 = fma(_1310, _1348, _1354);
    float _1366 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1368 = _1360 + _1366;
    float _1370 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1372 = _1362 + _1370;
    float _1374 = fma(_1328, _1358, _1364);
    float _1376 = _1368 * _1368;
    float _1378 = _1372 * _1372;
    float _1380 = _720 + _1374;
    float _1382 = _1376 + _1378;
    float _1384 = sqrt(_1382);
    bool _1386 = _1384 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1388 = _1298;
    float _1390 = _1354;
    float _1392 = _1374;
    float _1394 = _1364;
    float _1396 = _1358;
    if (!_1386)
    {
        _1388 = _1378;
    }
    float _1398 = _1388;
    float _1400 = _1398;
    if (!_1386)
    {
        _1390 = _1376;
    }
    float _1402 = _1390;
    float _1404 = _1402;
    if (!_1386)
    {
        _1392 = _1360;
    }
    float _1406 = _1392;
    float _1408 = _1406;
    if (!_1386)
    {
        _1394 = _1362;
    }
    float _1410 = _1394;
    float _1412 = _1410;
    if (!_1386)
    {
        _1396 = _1380;
    }
    float _1414 = _1396;
    bool _1416 = !_1386;
    float _1418 = _1414;
    if (!_1416)
    {
        float _1420 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1422 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1424 = _1384 + _1422;
        float _1426 = rsqrt(_1382);
        float _1428 = _1424 * _1420;
        float _1430 = _1380 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1432 = _1428 * 0.15915493667125701904296875;
        float _1434 = _1432 * 6.283185482025146484375;
        float _1436 = sin(_1434);
        float _1438 = _1432 * 6.283185482025146484375;
        float _1440 = cos(_1438);
        float _1442 = fma(_1436, _1430, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1444 = _1426 * _1442;
        float _1446 = _1440 + (-1.0);
        float _1448 = fma(_1368, _1444, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1450 = fma(_1372, _1444, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1452 = _1446 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1454 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1456 = _1448 + _1454;
        float _1458 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1460 = _1450 + _1458;
        float _1462 = fma(_1380, _1440, _1452);
        float _1464 = _1456 * _1456;
        float _1466 = _1460 * _1460;
        _1418 = _1462;
        _1404 = _1464;
        _1400 = _1466;
        _1408 = _1448;
        _1412 = _1450;
    }
    float _1468 = _1418;
    float _1470 = _1404;
    float _1472 = _1400;
    float _1474 = _1408;
    float _1476 = _1412;
    float _1478 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1480 = _1468 + _1478;
    out.m_63.x = _1132;
    out.m_63.y = _1134;
    out.m_63.z = _1136;
    out.m_63.w = _1138;
    float _1482 = fma(_1480, _1480, _1470);
    out.m_61.x = _1126;
    out.m_61.y = _1128;
    out.m_61.z = _1130;
    float _1484 = _1482 + _1472;
    float _1486 = sqrt(_1484);
    bool _1488 = _1486 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1490 = isnan(_1486);
    bool _1492 = _1488 || _1490;
    bool _1494 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1496 = _1492 || _1494;
    float _1498 = _1482;
    if (!_1496)
    {
        _1498 = 1.0;
    }
    float _1500 = _1498;
    bool _1502 = !_1496;
    float _1504 = _1500;
    if (!_1502)
    {
        bool _1506 = _1486 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1508 = isnan(_1486);
        bool _1510 = _1506 || _1508;
        bool _1512 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1514 = _1510 || _1512;
        if (!_1514)
        {
            float _1516 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1518 = _1486 + _1516;
            float _1520 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1522 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1520;
            float _1524 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1526 = _1524 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1528 = 1.0 / _1522;
            float _1530 = _1518 * _1528;
            float _1532 = fma(_1530, _1526, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1504 = _1532;
            _1534 = true;
        }
        else
        {
            bool _1536 = _1486 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1538 = isnan(_1486);
            bool _1540 = _1536 || _1538;
            bool _1542 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1544 = _1540 || _1542;
            if (!_1544)
            {
                float _1546 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1548 = _1486 + _1546;
                float _1550 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1552 = _1550 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1554 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1556 = _1554 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1558 = 1.0 / _1552;
                float _1560 = _1548 * _1558;
                float _1562 = fma(_1560, _1556, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1504 = _1562;
                _1534 = true;
            }
            else
            {
                _1504 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1534 = false;
    float _1564 = _1504;
    float _1566 = _1146 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1568 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1570 = _1474 + _1568;
    float _1572 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1566);
    float _1574 = _1146 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1576 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1572);
    bool _1578 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1580 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1582 = _1578 || _1580;
    bool _1584 = isnan(0.5);
    bool _1586 = _1582 || _1584;
    bool _1588 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1590 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1592 = _1588 || _1590;
    bool _1594 = isnan(0.5);
    bool _1596 = _1592 || _1594;
    float _1598 = _1576 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1600 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1574);
    float _1602 = 1.0 / _1598;
    float _1604 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1600);
    float _1606 = _1604 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1608 = _1606 + _1598;
    float _1610 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1612 = _1476 + _1610;
    float _1614 = fma(_1570, _1564, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1616 = fma(_1612, _1564, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1618 = -_1142;
    float _1620 = fma(_1618, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1614);
    float _1622 = _1608 * _1602;
    float _1624 = _1622 * 0.5;
    float _1626 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1628 = _1468 + _1626;
    float _1630 = -_1148;
    float _1632 = fma(_1630, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1616);
    float _1634 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1636 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1634);
    float _1638 = fma(_1628, _1564, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1640 = _1624;
    float _1642 = _1620;
    float _1644 = _1632;
    float _1646 = _1628;
    if (_1596)
    {
        _1640 = 1.0;
    }
    float _1648 = _1640;
    float _1650 = 1.0 / _1636;
    float _1652 = -_1140;
    float _1654 = fma(_1652, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1638);
    float _1656 = _1654;
    float _1658 = _1648;
    if (!_1586)
    {
        float _1660 = _1156 * _1156;
        float _1662 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1664 = -_732;
        float _1666 = _1664 + _1616;
        float _1668 = -_674;
        float _1670 = _1668 + _1614;
        float _1672 = fma(_1164, _1164, _1660);
        float _1674 = -_720;
        float _1676 = _1674 + _1638;
        float _1678 = fma(_1170, _1170, _1672);
        float _1680 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1682 = sqrt(_1678);
        float _1684 = 1.0 / _1246;
        float _1686 = _1680 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1688 = precise::min(_1682, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1690 = _1688 * _1662;
        float _1692 = _1690 * _1684;
        float _1694 = _1686 * _1692;
        float _1696 = _1666 * _1692;
        float _1698 = fma(_1670, _1694, _1152);
        float _1700 = fma(_1676, _1694, _1146);
        float _1702 = fma(_1686, _1696, _1160);
        _1656 = _1700;
        _1642 = _1698;
        _1644 = _1702;
        _760 = _1696;
        _1646 = _1692;
    }
    float _1704 = _1656;
    float _1706 = _1642;
    float _1708 = _1644;
    float _1710 = _760;
    float _1712 = _1646;
    float _1714 = _1712;
    float _1716 = _1710;
    if (_1596)
    {
        _1714 = 1.0;
    }
    float _1718 = _1714;
    float _1720 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1722 = _1650 * _1720;
    float _1724 = _1718;
    float _1726 = _1722;
    if (!_1596)
    {
        float _1728 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1730 = _1728 * 0.15915493667125701904296875;
        float _1732 = _1730 * 6.283185482025146484375;
        float _1734 = cos(_1732);
        float _1736 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1738 = _1736 * 0.15915493667125701904296875;
        float _1740 = _1730 * 6.283185482025146484375;
        float _1742 = sin(_1740);
        float _1744 = 1.0 / _1734;
        float _1746 = _1738 * 6.283185482025146484375;
        float _1748 = cos(_1746);
        float _1750 = _1742 * _1744;
        float _1752 = _1738 * 6.283185482025146484375;
        float _1754 = sin(_1752);
        float _1756 = _1748 * _1750;
        float _1758 = 1.0 / _1756;
        float _1760 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1762 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1760;
        float _1764 = 1.0 / _1762;
        float _1766 = _1754 * _1758;
        float _1768 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1770 = fma(_1722, _1766, _1768);
        float _1772 = _1770 * _1764;
        float _1774 = precise::clamp(_1772, 0.0, 1.0);
        _1658 = _1774;
    }
    float _1776 = _1658;
    if (!_1596)
    {
        float _1778 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1780 = _1778 * 0.15915493667125701904296875;
        float _1782 = _1780 * 6.283185482025146484375;
        float _1784 = cos(_1782);
        float _1786 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1788 = _1786 * 0.15915493667125701904296875;
        float _1790 = _1780 * 6.283185482025146484375;
        float _1792 = sin(_1790);
        float _1794 = 1.0 / _1784;
        float _1796 = _1788 * 6.283185482025146484375;
        float _1798 = cos(_1796);
        float _1800 = _1792 * _1794;
        float _1802 = _1788 * 6.283185482025146484375;
        float _1804 = sin(_1802);
        float _1806 = _1798 * _1800;
        float _1808 = 1.0 / _1806;
        float _1810 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1812 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1810;
        float _1814 = 1.0 / _1812;
        float _1816 = _1804 * _1808;
        float _1818 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1820 = fma(_1722, _1816, _1818);
        float _1822 = _1820 * _1814;
        float _1824 = precise::clamp(_1822, 0.0, 1.0);
        float _1826 = -_1824;
        float _1828 = _1826 + 1.0;
        _1724 = _1828;
    }
    float _1830 = _1724;
    float _1832 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1834 = _1704 + _1832;
    float _1836 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1838 = _1706 + _1836;
    float _1840 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1842 = _1708 + _1840;
    float _1844 = _1834 * _1834;
    float _1846 = fma(_1838, _1838, _1844);
    float _1848 = fma(_1842, _1842, _1846);
    float _1850 = rsqrt(_1848);
    float _1852 = _1850 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1854 = _1838 * _1852;
    float _1856 = _1842 * _1852;
    float _1858 = _1854 * _1854;
    float _1860 = _1856 * _1856;
    float _1862 = _1858 + _1860;
    float _1864 = sqrt(_1862);
    bool _1866 = _1864 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1868 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1870 = _1864 + _1868;
    float _1872 = _1850;
    float _1874 = _1862;
    float _1876 = _1870;
    float _1878 = _1834;
    float _1880 = _1854;
    if (_1866)
    {
        float _1882 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1872 = _1882;
    }
    float _1884 = _1872;
    if (_1866)
    {
        float _1886 = rsqrt(_1862);
        _1874 = _1886;
    }
    float _1888 = _1874;
    if (_1866)
    {
        float _1890 = _1870 * _1884;
        _1876 = _1890;
    }
    float _1892 = _1876;
    if (_1866)
    {
        float _1894 = _1892 * 0.15915493667125701904296875;
        _1726 = _1894;
    }
    float _1896 = _1726;
    float _1898 = _1884;
    if (_1866)
    {
        float _1900 = _1896 * 6.283185482025146484375;
        float _1902 = sin(_1900);
        _1898 = _1902;
    }
    float _1904 = _1898;
    float _1906 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1908 = precise::max(0.0, _1906);
    float _1910 = _1842;
    float _1912 = _1908;
    if (_1866)
    {
        float _1914 = _1896 * 6.283185482025146484375;
        float _1916 = cos(_1914);
        _1910 = _1916;
    }
    float _1918 = _1910;
    float _1920 = -_1852;
    float _1922 = -_1908;
    float _1924 = fma(_1834, _1920, _1922);
    float _1926 = _1924;
    if (!_1866)
    {
        _1878 = _1856;
    }
    float _1928 = _1878;
    float _1930 = _1928;
    if (_1866)
    {
        float _1932 = _1924 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1912 = _1932;
    }
    float _1934 = _1912;
    float _1936 = sqrt(_1848);
    float _1938 = _1904;
    float _1940 = _1934;
    if (_1866)
    {
        float _1942 = fma(_1904, _1934, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1938 = _1942;
    }
    float _1944 = _1938;
    float _1946 = _1944;
    float _1948 = _1918;
    if (_1866)
    {
        float _1950 = _1918 + (-1.0);
        _1940 = _1950;
    }
    float _1952 = _1940;
    float _1954 = _1952;
    if (_1866)
    {
        float _1956 = _1888 * _1944;
        _1716 = _1956;
    }
    float _1958 = _1716;
    if (_1866)
    {
        float _1960 = _1952 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1946 = _1960;
    }
    float _1962 = _1946;
    if (_1866)
    {
        float _1964 = _1854 * _1958;
        _1880 = _1964;
    }
    float _1966 = _1880;
    if (!_1866)
    {
        _1954 = _1858;
    }
    float _1968 = _1954;
    float _1970 = _1968;
    if (_1866)
    {
        float _1972 = _1856 * _1958;
        _1930 = _1972;
    }
    float _1974 = _1930;
    if (_1866)
    {
        float _1976 = fma(_1924, _1918, _1962);
        _1926 = _1976;
    }
    float _1978 = _1926;
    if (_1866)
    {
        float _1980 = _1966 * _1966;
        _1970 = _1980;
    }
    float _1982 = _1970;
    if (!_1866)
    {
        _1948 = _1860;
    }
    float _1984 = _1948;
    float _1986 = _1984;
    if (_1866)
    {
        float _1988 = _1974 * _1974;
        _1986 = _1988;
    }
    float _1990 = _1986;
    float _1992 = fma(_1978, _1978, _1982);
    float _1994 = _1992 + _1990;
    float _1996 = _1704 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1998 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2000 = fma(_1936, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1998);
    float _2002 = precise::clamp(_2000, 0.0, 1.0);
    float _2004 = _1704 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2006 = rsqrt(_1994);
    float _2008 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1996);
    float _2010 = -_2002;
    float _2012 = _2010 + 1.0;
    float _2014 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2004);
    float _2016 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2018 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2008);
    float _2020 = _1704 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2022 = _1704 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2024 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2014);
    float _2026 = _2018 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2028 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2020);
    float _2030 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2022);
    float _2032 = _2024 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2034 = _2026 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2036 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2028);
    float _2038 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2030);
    float _2040 = abs(_2012);
    float _2042 = log2(_2040);
    float _2044 = _2006 * _1966;
    float _2046 = -_2034;
    float _2048 = fma(_2046, _2016, 1.0);
    float _2050 = _2036 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2052 = _2032 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2054 = _2038 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2056 = _2006 * _1978;
    float _2058 = _2044 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2060 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2052);
    float _2062 = _2006 * _1974;
    float _2064 = log2(_2048);
    float _2066 = -_2058;
    float _2068 = fma(_2056, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2066);
    float _2070 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2060);
    float _2072 = _2032 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2074 = _2056 + 1.0;
    float _2076 = -_2062;
    float _2078 = fma(_2076, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2068);
    float _2080 = fma(_2054, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2070);
    float _2082 = _2042 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2084 = _2032 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2086 = fma(_2078, -0.5, 0.5);
    float _2088 = 1.0 / _2080;
    float _2090 = fma(_2078, 0.5, 0.5);
    float _2092 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2084);
    float _2094 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2072);
    float _2096 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2092);
    float _2098 = fma(_2090, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2100 = exp2(_2082);
    float _2102 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2094);
    float _2104 = fma(_2054, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2096);
    float _2106 = fma(_2090, _2098, -0.212114393711090087890625);
    float _2108 = _2064 * 0.693147182464599609375;
    float _2110 = fma(_2054, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2102);
    float _2112 = fma(_2090, _2106, 1.570728778839111328125);
    float _2114 = sqrt(_2086);
    float _2116 = _2104 * _2088;
    float _2118 = _2110 * _2088;
    float _2120 = _2108 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2122 = fma(_2116, 0.5, 0.5);
    float _2124 = fma(_2118, -0.5, 0.5);
    float _2126 = -_2056;
    float _2128 = fma(_2100, _2074, _2126);
    float3 _5602 = float3(_2122, _2124, _2120);
    float _2130 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5602, float3(0.0), isnan(_5602)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5602, float3(0.0), isnan(_5602)), level(0.0)).x;
    float _2132 = fma(_2128, 0.5, 0.5);
    float _2134 = _2114 * 0.636619746685028076171875;
    float _2136 = -_2112;
    float _2138 = fma(_2134, _2136, 1.0);
    float3 _5623 = float3(_2122, _2124, _2120);
    float4 _2141 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5623, float3(0.0), isnan(_5623)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5623, float3(0.0), isnan(_5623)), level(0.0)).xyzw;
    float _2143 = _2141.x;
    float _2145 = _2141.y;
    float _2147 = _2141.z;
    float _2149 = _2141.w;
    float2 _5640 = float2(_2138, _2132);
    float3 _2153 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5640, float2(0.0), isnan(_5640)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5640, float2(0.0), isnan(_5640)), level(0.0)).xyz;
    float _2155 = _2153.x;
    float _2157 = _2153.y;
    float _2159 = _2153.z;
    float _2161 = _2042 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2163 = _2032 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2165 = _1776 > 0.0;
    bool _2167 = isnan(_1776);
    bool _2169 = _2165 || _2167;
    bool _2171 = isnan(0.0);
    bool _2173 = _2169 || _2171;
    float _2175 = _1776 * _1830;
    float _2177 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2163);
    float _2179 = exp2(_2161);
    bool _2181 = _1830 <= 0.0;
    bool _2183 = !_2173;
    bool _2185 = _2181 || _2183;
    float _2187 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2177);
    float _2189 = _2175 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2191 = fma(_2054, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2187);
    float _2193 = _2189 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2195 = _2191 + _2080;
    out.gl_Position.x = _2104;
    out.gl_Position.y = _2110;
    out.gl_Position.z = _2191;
    out.gl_Position.w = _2080;
    float _2197 = _2195 * 0.5;
    float _2199 = -_2179;
    float _2201 = _2199 + 1.0;
    out.m_47.x = _2193;
    float _2203 = _2201 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_67.z = _2197;
    out.m_67.w = _2080;
    float _2205 = _2203 * _2130;
    float _2207 = -_2203;
    float _2209 = _2207 + 1.0;
    float _2211 = _2149 * _2205;
    float _2213 = _2159 * _2205;
    float _2215 = fma(_2155, _2211, _2143);
    float _2217 = fma(_2157, _2211, _2145);
    float _2219 = _2149 * _2209;
    float _2221 = fma(_2149, _2213, _2147);
    out.m_69.x = _2215;
    out.m_69.y = _2217;
    out.m_69.z = _2221;
    out.m_69.w = _2219;
    if (!_2185)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2223 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2223;
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
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1534 = false;
    bool _602 = false;
    bool _424 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_44.w;
    float _85 = trunc(_83);
    int _88 = int(_85);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _94;
    float _98 = _96;
    if (!_92)
    {
        out.m_47.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _96 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2280 = as_type<float>(_104);
        out.gl_Position.z = _2280;
    }
    if (!_92)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _108 = in.m_49.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _124 = 0.0;
    if (_118)
    {
        float _126 = float(_88);
        _124 = _126;
    }
    float _128 = _124;
    bool _130 = _122 >= _128;
    bool _132 = !_118;
    bool _134 = _130 || _132;
    if (_134)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _98;
    if (_134)
    {
        out.m_47.x = 0.0;
    }
    if (_134)
    {
        float _138 = _136 * 5.0;
        _106 = as_type<int>(_138);
    }
    int _140 = _106;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2348 = as_type<float>(_140);
        out.gl_Position.z = _2348;
    }
    if (_134)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _142 = in.m_51.x;
    float _144 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _146 = _122 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    bool _148 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _150 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _152 = _148 || _150;
    bool _154 = isnan(1.0);
    bool _156 = _152 || _154;
    float _158 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    int _160 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _162 = _160 != 0;
    float _164 = _146 * _144;
    float _166 = _122 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _168 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[20].x, _164);
    float _170 = _166 * _158;
    float _172 = floor(_168);
    float _174 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[20].y, _170);
    float _176 = _168 * 6.283185482025146484375;
    float _178 = _174 * 6.283185482025146484375;
    float _180 = _176 * 0.15915493667125701904296875;
    float _182 = in.m_49.x;
    float _184 = in.m_49.y;
    float _186 = in.m_49.z;
    float _188 = _178 * 0.15915493667125701904296875;
    float _190 = floor(_174);
    float _192 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _194 = 1.4012984643248170709237295832899e-45;
    float _196 = _192;
    float _198 = _142;
    if (!_156)
    {
        float _200 = _192 * _192;
        float _202 = _200 * 0.5;
        _194 = _202;
    }
    float _204 = _194;
    float _206 = -_172;
    float _208 = _168 + _206;
    float _210 = _180 * 6.283185482025146484375;
    float _212 = cos(_210);
    float _214 = _204;
    if (!_156)
    {
        float _216 = _204 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _214 = _216;
    }
    float _218 = _214;
    float _220 = _188 * 6.283185482025146484375;
    float _222 = cos(_220);
    float _224 = -_190;
    float _226 = _174 + _224;
    bool _228 = !_156;
    float _230 = _218;
    if (!_228)
    {
        float _232 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _234 = log2(_232);
        float _236 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _238 = _236 + 1.0;
        float _240 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _242 = _192 * _234;
        float _244 = 1.0 / _238;
        float _246 = _240 * 0.693147182464599609375;
        float _248 = exp2(_242);
        float _250 = 1.0 / _246;
        float _252 = _248 + (-1.0);
        float _254 = -_252;
        float _256 = fma(_254, _250, _192);
        float _258 = _256 * _244;
        float _260 = _258 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _230 = _260;
    }
    float _262 = _230;
    bool _264 = !_156;
    if (!_264)
    {
        float _266 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _268 = log2(_266);
        float _270 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _272 = _270 + 1.0;
        float _274 = 1.0 / _272;
        float _276 = _192 * _268;
        float _278 = exp2(_276);
        float _280 = -_278;
        float _282 = _280 + 1.0;
        float _284 = _282 * _274;
        _196 = _284;
    }
    float _286 = _196;
    float _288 = in.m_53.w;
    float _290 = in.m_44.x;
    float _292 = in.m_44.y;
    float _294 = in.m_44.z;
    float _296 = fma(_212, 0.5, 0.5);
    float _298 = fma(_222, 0.5, 0.5);
    bool _300 = _208 < 0.5;
    float _302 = float(_300);
    float _304 = -_208;
    float _306 = fma(_304, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _308 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _310 = _308 != 0;
    int _312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _314 = _312 != 0;
    float _316 = -_226;
    float _318 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _320 = _226 < 0.5;
    float _322 = float(_320);
    float _324 = -_302;
    float _326 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _328 = -_296;
    float _330 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _332 = _262 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _334 = !_162;
    int _336 = _334 ? 0 : 1;
    float _338 = -_298;
    float _340 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _342 = _262 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _344 = !_310;
    int _346 = _344 ? 0 : 1;
    float _348 = -_322;
    float _350 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _352 = fma(_286, _184, _332);
    int _354 = abs(_336);
    float _356 = fma(_286, _182, _342);
    bool _358 = !_314;
    int _360 = _358 ? 0 : 1;
    float _362 = _262 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _364 = abs(_346);
    float _366 = fma(_356, _288, _290);
    float _368 = fma(_286, _186, _362);
    int _370 = abs(_360);
    float _372 = fma(_352, _288, _292);
    bool _374 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _376 = fma(_368, _288, _294);
    float _378 = float(_364);
    float _380 = float(_354);
    float _382 = abs(_306);
    float _384 = _378 * _382;
    float _386 = abs(_318);
    float _388 = _378 * _386;
    float _390 = float(_370);
    float _392 = fma(_380, _330, _384);
    float _394 = fma(_380, _340, _388);
    float _396 = abs(_326);
    float _398 = fma(_390, _396, _392);
    float _400 = abs(_350);
    float _402 = fma(_390, _400, _394);
    bool _404 = !_374;
    bool _406 = false;
    float _422;
    if (!_404)
    {
        float _408 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _410 = _142 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _412 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _414 = _412 * _408;
        float _416 = floor(_414);
        float _418 = -_416;
        float _420 = _414 + _418;
        _422 = _420;
        _424 = true;
    }
    else
    {
        float _426 = float(_88);
        float _428 = 1.0 / _426;
        float _430 = _122 * _428;
        _422 = _430;
    }
    _424 = false;
    float _432 = _422;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _436 = _432 + _434;
    bool _438 = _432 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _440 = isnan(_432);
    bool _442 = _438 || _440;
    bool _444 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _446 = _442 || _444;
    float _448 = float(_446);
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _452 = _432 + _450;
    bool _454 = _432 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _456 = isnan(_432);
    bool _458 = _454 || _456;
    bool _460 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _462 = _458 || _460;
    float _464 = float(_462);
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _466;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _472 = _470 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _474 = _432 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _476 = isnan(_432);
    bool _478 = _474 || _476;
    bool _480 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _482 = _478 || _480;
    float _484 = float(_482);
    float _486 = -_448;
    float _488 = _486 + 1.0;
    float _490 = 1.0 / _472;
    float _492 = _484 * _488;
    float _494 = -_484;
    float _496 = _494 + 1.0;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _498;
    bool _502 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _504 = 1.0 / _468;
    float _506 = _464 * _496;
    float _508 = -_464;
    float _510 = _508 + 1.0;
    float _512 = _452 * _490;
    float _514 = _436 * _504;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _518 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _516;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _520;
    float _524 = fma(_500, _514, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _526 = fma(_518, _514, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _528 = fma(_522, _514, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _530 = in.m_53.x;
    float _532 = in.m_53.y;
    float _534 = in.m_53.z;
    float _536 = _524 * _506;
    float _538 = _526 * _506;
    float _540 = _528 * _506;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _544 = _542 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _548 = _546 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _552 = _550 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _554 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[143].x, _536);
    float _556 = fma(_544, _512, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _558 = fma(_548, _512, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _560 = fma(_552, _512, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _562 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[143].y, _538);
    float _564 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[143].z, _540);
    float _566 = fma(_556, _492, _554);
    float _568 = fma(_558, _492, _562);
    float _570 = fma(_560, _492, _564);
    float _572 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[145].x, _566);
    float _574 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[145].y, _568);
    float _576 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[145].z, _570);
    float _578 = _572 * _530;
    float _580 = _574 * _532;
    float _582 = _576 * _534;
    bool _584 = !_502;
    float _600;
    if (!_584)
    {
        float _586 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _588 = _142 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _590 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _592 = _590 * _586;
        float _594 = floor(_592);
        float _596 = -_594;
        float _598 = _592 + _596;
        _600 = _598;
        _602 = true;
    }
    else
    {
        float _604 = float(_88);
        float _606 = 1.0 / _604;
        float _608 = _122 * _606;
        _600 = _608;
    }
    _602 = false;
    float _610 = _600;
    float _612 = in.m_51.w;
    float _614 = _372 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _616 = _372 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _620 = _618 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _624 = _622 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _628 = _626 != 0;
    float _630 = 1.0 / _620;
    float _632 = _372 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _634 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _636 = _634 != 0;
    float _638 = fma(_366, (*spvDescriptorSet0.vp_c10)._m0[4].x, _614);
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _642 = _640 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _644 = fma(_366, (*spvDescriptorSet0.vp_c10)._m0[5].x, _616);
    float _646 = 1.0 / _624;
    float _648 = fma(_366, (*spvDescriptorSet0.vp_c10)._m0[6].x, _632);
    float _650 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[4].z, _638);
    int _652 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _654 = _652 != 0;
    float _656 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[6].z, _648);
    bool _658 = _612 > 0.5;
    float _660 = 1.0 / _642;
    float _662 = (*spvDescriptorSet0.vp_c9)._m0[19].y;
    bool _664 = _658;
    if (_636)
    {
        float _666 = in.m_51.z;
        _662 = _666;
    }
    float _668 = _662;
    int _670 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _672 = _670 != 0;
    float _674 = _650 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _676 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _678 = _676 != 0;
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _682 = _680 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _686 = _684 + (*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _688;
    float _692 = 1.0 / _682;
    float _694 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[5].z, _644);
    float _696 = in.m_51.y;
    bool _698 = _610 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _700 = isnan(_610);
    bool _702 = _698 || _700;
    bool _704 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _706 = _702 || _704;
    float _708 = float(_706);
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _712 = _710 + (*spvDescriptorSet0.vp_c9)._m0[121].w;
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _716 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _714;
    float _718 = in.m_55.x;
    float _720 = _694 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _722 = 1.0 / _686;
    float _724 = _690 * _630;
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _728 = _726 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _730 = _716 * _660;
    float _732 = _656 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[120].x + _734;
    float _738 = 1.0 / _712;
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _742 = _740 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _744 = _728 * _646;
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[120].x;
    float _748 = _746 + (*spvDescriptorSet0.vp_c9)._m0[121].x;
    float _750 = in.m_55.y;
    float _752 = _742 * _692;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _756 = _610 + _754;
    float _758 = _722;
    float _760 = _732;
    if (_636)
    {
        bool _762 = _668 > 0.5;
        _406 = _762;
    }
    bool _764 = _406;
    float _766 = _736 * _722;
    float _768 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _770 = _610 + _768;
    float _772 = fma(_724, _756, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _776 = _610 + _774;
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _780 = _610 + _778;
    float _782 = fma(_730, _770, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _784 = _610 >= (*spvDescriptorSet0.vp_c9)._m0[121].w;
    bool _786 = isnan(_610);
    bool _788 = _784 || _786;
    bool _790 = isnan((*spvDescriptorSet0.vp_c9)._m0[121].w);
    bool _792 = _788 || _790;
    float _794 = float(_792);
    float _796 = fma(_744, _776, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _798 = fma(_752, _780, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _800 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _802 = _610 + _800;
    bool _804 = _610 >= (*spvDescriptorSet0.vp_c9)._m0[120].w;
    bool _806 = isnan(_610);
    bool _808 = _804 || _806;
    bool _810 = isnan((*spvDescriptorSet0.vp_c9)._m0[120].w);
    bool _812 = _808 || _810;
    float _814 = float(_812);
    float _816 = -_794;
    float _818 = _816 + 1.0;
    float _820 = _748 * _738;
    float _822 = fma(_766, _802, (*spvDescriptorSet0.vp_c9)._m0[119].x);
    bool _824 = _610 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _826 = isnan(_610);
    bool _828 = _824 || _826;
    bool _830 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _832 = _828 || _830;
    float _834 = float(_832);
    float _836 = _814 * _818;
    float _838 = -_814;
    float _840 = _838 + 1.0;
    float _842 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _844 = _610 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _846 = isnan(_610);
    bool _848 = _844 || _846;
    bool _850 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _852 = _848 || _850;
    float _854 = float(_852);
    float _856 = _818;
    int _858 = as_type<int>(_772);
    if (!_628)
    {
        float _860 = in.m_51.z;
        _856 = _860;
    }
    float _862 = _856;
    float _864 = _834 * _840;
    float _866 = -_834;
    float _868 = _866 + 1.0;
    bool _870 = _610 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _872 = isnan(_610);
    bool _874 = _870 || _872;
    bool _876 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _878 = _874 || _876;
    float _880 = float(_878);
    float _882 = -_750;
    float _884 = _882 + 1.0;
    float _886 = -_854;
    float _888 = _886 + 1.0;
    float _890 = _854 * _868;
    bool _892 = _610 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _894 = isnan(_610);
    bool _896 = _892 || _894;
    bool _898 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _900 = _896 || _898;
    float _902 = float(_900);
    float _904 = -_880;
    float _906 = _904 + 1.0;
    int _908 = _658 ? as_type<int>(_884) : as_type<int>(_750);
    float _910 = _880 * _888;
    float _912 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _914 = _610 + _912;
    float _916 = _902 * _906;
    float _918 = -_902;
    float _920 = _918 + 1.0;
    float _922 = _672 ? as_type<float>(_908) : _750;
    float _924 = _842 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _926 = _902;
    float _928 = _750;
    if (!_628)
    {
        _758 = _696;
    }
    float _930 = _758;
    float _932 = _708 * _920;
    float _934 = _930;
    if (_628)
    {
        _934 = _142;
    }
    float _936 = _934;
    float _938 = fma(_924, _922, -0.5);
    float _940 = _772 * _932;
    float _942 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _944 = _862;
    if (!_628)
    {
        _926 = _862;
    }
    float _946 = _926;
    float _948 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _950 = _946;
    if (_628)
    {
        _950 = _696;
    }
    float _952 = _950;
    if (_654)
    {
        float _954 = -_718;
        float _956 = _954 + 1.0;
        _858 = as_type<int>(_956);
    }
    int _958 = _858;
    float _960 = as_type<float>(_958);
    if (_628)
    {
        _944 = _696;
    }
    float _962 = _944;
    float _964 = fma(_820, _914, (*spvDescriptorSet0.vp_c9)._m0[120].x);
    if (_654)
    {
        bool _966 = _142 > 0.5;
        _664 = _966;
    }
    bool _968 = _664;
    int _970 = 0;
    if (_636)
    {
        float _972 = -_718;
        float _974 = _972 + 1.0;
        _970 = as_type<int>(_974);
    }
    int _976 = _970;
    bool _978 = _696 > 0.5;
    float _980 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[83].z, _948);
    float _982 = _936 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (!_654)
    {
        _198 = _718;
    }
    float _984 = _198;
    float _986 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _988 = _984;
    if (_654)
    {
        float _990 = _968 ? as_type<float>(_958) : _718;
        _988 = _990;
    }
    float _992 = _988;
    float _994 = -_708;
    float _996 = _994 + 1.0;
    if (!_636)
    {
        _960 = _718;
    }
    float _998 = _960;
    float _1000 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1002 = _998;
    if (_636)
    {
        float _1004 = _764 ? as_type<float>(_976) : _718;
        _1002 = _1004;
    }
    float _1006 = _1002;
    float _1008 = fma(_962, (*spvDescriptorSet0.vp_c9)._m0[83].w, _986);
    float _1010 = fma(_996, (*spvDescriptorSet0.vp_c9)._m0[115].x, _940);
    float _1012 = _942 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1014 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1016 = _720 + _1014;
    float _1018 = -_1000;
    float _1020 = fma(_982, 2.0, _1018);
    float _1022 = fma(_796, _916, _1010);
    float _1024 = fma(_1012, _1006, -0.5);
    float _1026 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1028 = _674 + _1026;
    float _1030 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1032 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1034 = fma(_782, _910, _1022);
    float _1036 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1030);
    float _1038 = _952 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1040 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1042 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _980);
    float _1044 = -_122;
    float _1046 = fma(_1044, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1020);
    float _1048 = fma(_798, _890, _1034);
    float _1050 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1052 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1054 = _732 + _1052;
    float _1056 = fma(_1038, -2.0, _1040);
    float _1058 = fma(_1042, _1024, _1046);
    float _1060 = _1040;
    if (_678)
    {
        float _1062 = _978 ? _884 : _750;
        _928 = _1062;
    }
    float _1064 = _928;
    float _1066 = fma(_822, _864, _1048);
    float _1068 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1036);
    float _1070 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1008);
    float _1072 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1056);
    float _1074 = _992 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1076 = fma(_964, _836, _1066);
    float _1078 = _1064 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1080 = _1016 * _1016;
    bool _1082 = _1068 >= 0.0;
    float _1084 = -_1072;
    float _1086 = fma(_1070, _938, _1084);
    float _1088 = _1074 * _1032;
    float _1090 = _1078 * _1050;
    float _1092 = fma(_1028, _1028, _1080);
    float _1094 = _1058 + 0.5;
    float _1096 = fma(_1054, _1054, _1092);
    float _1098 = _1086 + 0.5;
    float _1100 = fma(_794, (*spvDescriptorSet0.vp_c9)._m0[121].x, _1076);
    float _1102 = rsqrt(_1096);
    out.m_57.x = 1.0;
    out.m_57.y = 1.0;
    out.m_57.z = 1.0;
    out.m_59.x = _1088;
    out.m_59.y = _1090;
    out.m_59.z = _1094;
    out.m_59.w = _1098;
    if (_1082)
    {
        _1060 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1104 = _1060;
    int _1106 = as_type<int>(_1104);
    if (_1082)
    {
        out.m_47.x = 0.0;
    }
    if (_1082)
    {
        float _1108 = _1104 * 5.0;
        _1106 = as_type<int>(_1108);
    }
    int _1110 = _1106;
    float _1112 = as_type<float>(_1110);
    if (_1082)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3904 = as_type<float>(_1110);
        out.gl_Position.z = _3904;
    }
    float _1114 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1116 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1118 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1120 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1122 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1124 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1126 = _1114 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1128 = _1120 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1130 = _1122 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1132 = _1116 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1134 = _1118 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1136 = _1124 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1138 = _1100 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_61.x = _1126;
    out.m_61.y = _1128;
    out.m_61.z = _1130;
    float _1140 = _1016 * _1102;
    float _1142 = _1028 * _1102;
    out.m_63.x = _1132;
    out.m_63.y = _1134;
    out.m_63.z = _1136;
    out.m_63.w = _1138;
    if (_1082)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1144 = -_1140;
    float _1146 = fma(_1144, (*spvDescriptorSet0.vp_c9)._m0[18].w, _720);
    float _1148 = _1054 * _1102;
    float _1150 = -_1142;
    float _1152 = fma(_1150, (*spvDescriptorSet0.vp_c9)._m0[18].w, _674);
    float _1154 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1156 = _1146 + _1154;
    float _1158 = -_1148;
    float _1160 = fma(_1158, (*spvDescriptorSet0.vp_c9)._m0[18].w, _732);
    float _1162 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1164 = _1152 + _1162;
    float _1166 = _1156 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1168 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1170 = _1160 + _1168;
    float _1172 = fma(_1164, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1166);
    float _1174 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1172);
    bool _1176 = _1174 >= 0.0;
    if (_1176)
    {
        _1112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1178 = _1112;
    int _1180 = as_type<int>(_1178);
    if (_1176)
    {
        out.m_47.x = 0.0;
    }
    if (_1176)
    {
        float _1182 = _1178 * 5.0;
        _1180 = as_type<int>(_1182);
    }
    int _1184 = _1180;
    if (_1176)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4075 = as_type<float>(_1184);
        out.gl_Position.z = _4075;
    }
    if (_1176)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1186 = -_1140;
    float _1188 = fma(_1186, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1016);
    float _1190 = -_1142;
    float _1192 = fma(_1190, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1028);
    float _1194 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1196 = _1188 * _1188;
    float _1198 = -_1148;
    float _1200 = fma(_1198, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1054);
    float _1202 = _398 * _578;
    float _1204 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1194);
    float _1206 = fma(_1192, _1192, _1196);
    float _1208 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1204);
    float _1210 = fma(_1200, _1200, _1206);
    float _1212 = in.m_65.x;
    float _1214 = in.m_65.y;
    float _1216 = in.m_65.z;
    float _1218 = rsqrt(_1208);
    float _1220 = (*spvDescriptorSet0.vp_c15)._m0[660].x * 0.01745329238474369049072265625;
    float _1222 = _1220 * 0.15915493667125701904296875;
    float _1224 = sqrt(_1210);
    float _1226 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1228 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1230 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1232 = _402 * _580;
    float _1234 = _1226 * _1226;
    float _1236 = _1202 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1238 = _1222 * 6.283185482025146484375;
    float _1240 = cos(_1238);
    float _1242 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1214);
    float _1244 = fma(_1228, _1228, _1234);
    float _1246 = _1102 * _1224;
    float _1248 = _1232 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1250 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1212);
    float _1252 = fma(_1230, _1230, _1244);
    float _1254 = _1246 * _1236;
    float _1256 = _582 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1258 = _1246 * _1248;
    float _1260 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1216);
    float _1262 = _1250 * _1254;
    float _1264 = rsqrt(_1252);
    float _1266 = _1246 * _1256;
    float _1268 = _1242 * _1258;
    float _1270 = -_1240;
    float _1272 = _1270 + 1.0;
    float _1274 = _1260 * _1266;
    float _1276 = _1268 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1278 = _1268 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1280 = _1222 * 6.283185482025146484375;
    float _1282 = sin(_1280);
    float _1284 = _1268 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1286 = fma(_1262, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1276);
    float _1288 = fma(_1262, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1278);
    float _1290 = fma(_1262, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1284);
    float _1292 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1286);
    float _1294 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1288);
    float _1296 = _1228 * _1264;
    float _1298 = _1230 * _1264;
    float _1300 = _1226 * _1264;
    float _1302 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1290);
    float _1304 = _1296 * _1272;
    float _1306 = _1294 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1308 = _1300 * _1272;
    float _1310 = _1292 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1312 = _1298 * _1282;
    float _1314 = _1296 * _1282;
    float _1316 = _1300 * _1282;
    float _1318 = fma(_1296, _1304, _1240);
    float _1320 = -_1312;
    float _1322 = fma(_1300, _1304, _1320);
    float _1324 = fma(_1298, _1308, _1314);
    float _1326 = _1298 * _1298;
    float _1328 = _1302 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1330 = _1306 * _1322;
    float _1332 = -_1316;
    float _1334 = fma(_1298, _1304, _1332);
    float _1336 = _1306 * _1324;
    float _1338 = fma(_1272, _1326, _1240);
    float _1340 = fma(_1310, _1318, _1330);
    float _1342 = fma(_1298, _1304, _1316);
    float _1344 = fma(_1310, _1334, _1336);
    float _1346 = fma(_1300, _1308, _1240);
    float _1348 = fma(_1300, _1304, _1312);
    float _1350 = fma(_1328, _1342, _1340);
    float _1352 = fma(_1328, _1338, _1344);
    float _1354 = _1306 * _1346;
    float _1356 = -_1314;
    float _1358 = fma(_1298, _1308, _1356);
    float _1360 = _674 + _1350;
    float _1362 = _732 + _1352;
    float _1364 = fma(_1310, _1348, _1354);
    float _1366 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1368 = _1360 + _1366;
    float _1370 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1372 = _1362 + _1370;
    float _1374 = fma(_1328, _1358, _1364);
    float _1376 = _1368 * _1368;
    float _1378 = _1372 * _1372;
    float _1380 = _720 + _1374;
    float _1382 = _1376 + _1378;
    float _1384 = sqrt(_1382);
    bool _1386 = _1384 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1388 = _1298;
    float _1390 = _1354;
    float _1392 = _1374;
    float _1394 = _1364;
    float _1396 = _1358;
    if (!_1386)
    {
        _1388 = _1378;
    }
    float _1398 = _1388;
    float _1400 = _1398;
    if (!_1386)
    {
        _1390 = _1376;
    }
    float _1402 = _1390;
    float _1404 = _1402;
    if (!_1386)
    {
        _1392 = _1360;
    }
    float _1406 = _1392;
    float _1408 = _1406;
    if (!_1386)
    {
        _1394 = _1362;
    }
    float _1410 = _1394;
    float _1412 = _1410;
    if (!_1386)
    {
        _1396 = _1380;
    }
    float _1414 = _1396;
    bool _1416 = !_1386;
    float _1418 = _1414;
    if (!_1416)
    {
        float _1420 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1422 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1424 = _1384 + _1422;
        float _1426 = rsqrt(_1382);
        float _1428 = _1424 * _1420;
        float _1430 = _1380 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1432 = _1428 * 0.15915493667125701904296875;
        float _1434 = _1432 * 6.283185482025146484375;
        float _1436 = sin(_1434);
        float _1438 = _1432 * 6.283185482025146484375;
        float _1440 = cos(_1438);
        float _1442 = fma(_1436, _1430, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1444 = _1426 * _1442;
        float _1446 = _1440 + (-1.0);
        float _1448 = fma(_1368, _1444, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1450 = fma(_1372, _1444, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1452 = _1446 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1454 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1456 = _1448 + _1454;
        float _1458 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1460 = _1450 + _1458;
        float _1462 = fma(_1380, _1440, _1452);
        float _1464 = _1456 * _1456;
        float _1466 = _1460 * _1460;
        _1418 = _1462;
        _1404 = _1464;
        _1400 = _1466;
        _1408 = _1448;
        _1412 = _1450;
    }
    float _1468 = _1418;
    float _1470 = _1404;
    float _1472 = _1400;
    float _1474 = _1408;
    float _1476 = _1412;
    float _1478 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1480 = _1468 + _1478;
    out.m_63.x = _1132;
    out.m_63.y = _1134;
    out.m_63.z = _1136;
    out.m_63.w = _1138;
    float _1482 = fma(_1480, _1480, _1470);
    out.m_61.x = _1126;
    out.m_61.y = _1128;
    out.m_61.z = _1130;
    float _1484 = _1482 + _1472;
    float _1486 = sqrt(_1484);
    bool _1488 = _1486 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1490 = isnan(_1486);
    bool _1492 = _1488 || _1490;
    bool _1494 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1496 = _1492 || _1494;
    float _1498 = _1482;
    if (!_1496)
    {
        _1498 = 1.0;
    }
    float _1500 = _1498;
    bool _1502 = !_1496;
    float _1504 = _1500;
    if (!_1502)
    {
        bool _1506 = _1486 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1508 = isnan(_1486);
        bool _1510 = _1506 || _1508;
        bool _1512 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1514 = _1510 || _1512;
        if (!_1514)
        {
            float _1516 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1518 = _1486 + _1516;
            float _1520 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1522 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1520;
            float _1524 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1526 = _1524 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1528 = 1.0 / _1522;
            float _1530 = _1518 * _1528;
            float _1532 = fma(_1530, _1526, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1504 = _1532;
            _1534 = true;
        }
        else
        {
            bool _1536 = _1486 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1538 = isnan(_1486);
            bool _1540 = _1536 || _1538;
            bool _1542 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1544 = _1540 || _1542;
            if (!_1544)
            {
                float _1546 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1548 = _1486 + _1546;
                float _1550 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1552 = _1550 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1554 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1556 = _1554 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1558 = 1.0 / _1552;
                float _1560 = _1548 * _1558;
                float _1562 = fma(_1560, _1556, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1504 = _1562;
                _1534 = true;
            }
            else
            {
                _1504 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1534 = false;
    float _1564 = _1504;
    float _1566 = _1146 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1568 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1570 = _1474 + _1568;
    float _1572 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1566);
    float _1574 = _1146 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1576 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1572);
    bool _1578 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1580 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1582 = _1578 || _1580;
    bool _1584 = isnan(0.5);
    bool _1586 = _1582 || _1584;
    bool _1588 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1590 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1592 = _1588 || _1590;
    bool _1594 = isnan(0.5);
    bool _1596 = _1592 || _1594;
    float _1598 = _1576 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1600 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1574);
    float _1602 = 1.0 / _1598;
    float _1604 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1600);
    float _1606 = _1604 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1608 = _1606 + _1598;
    float _1610 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1612 = _1476 + _1610;
    float _1614 = fma(_1570, _1564, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1616 = fma(_1612, _1564, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1618 = -_1142;
    float _1620 = fma(_1618, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1614);
    float _1622 = _1608 * _1602;
    float _1624 = _1622 * 0.5;
    float _1626 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1628 = _1468 + _1626;
    float _1630 = -_1148;
    float _1632 = fma(_1630, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1616);
    float _1634 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1636 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1634);
    float _1638 = fma(_1628, _1564, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1640 = _1624;
    float _1642 = _1620;
    float _1644 = _1632;
    float _1646 = _1628;
    if (_1596)
    {
        _1640 = 1.0;
    }
    float _1648 = _1640;
    float _1650 = 1.0 / _1636;
    float _1652 = -_1140;
    float _1654 = fma(_1652, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1638);
    float _1656 = _1654;
    float _1658 = _1648;
    if (!_1586)
    {
        float _1660 = _1156 * _1156;
        float _1662 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1664 = -_732;
        float _1666 = _1664 + _1616;
        float _1668 = -_674;
        float _1670 = _1668 + _1614;
        float _1672 = fma(_1164, _1164, _1660);
        float _1674 = -_720;
        float _1676 = _1674 + _1638;
        float _1678 = fma(_1170, _1170, _1672);
        float _1680 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1682 = sqrt(_1678);
        float _1684 = 1.0 / _1246;
        float _1686 = _1680 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1688 = precise::min(_1682, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1690 = _1688 * _1662;
        float _1692 = _1690 * _1684;
        float _1694 = _1686 * _1692;
        float _1696 = _1666 * _1692;
        float _1698 = fma(_1670, _1694, _1152);
        float _1700 = fma(_1676, _1694, _1146);
        float _1702 = fma(_1686, _1696, _1160);
        _1656 = _1700;
        _1642 = _1698;
        _1644 = _1702;
        _760 = _1696;
        _1646 = _1692;
    }
    float _1704 = _1656;
    float _1706 = _1642;
    float _1708 = _1644;
    float _1710 = _760;
    float _1712 = _1646;
    float _1714 = _1712;
    float _1716 = _1710;
    if (_1596)
    {
        _1714 = 1.0;
    }
    float _1718 = _1714;
    float _1720 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1722 = _1650 * _1720;
    float _1724 = _1718;
    float _1726 = _1722;
    if (!_1596)
    {
        float _1728 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1730 = _1728 * 0.15915493667125701904296875;
        float _1732 = _1730 * 6.283185482025146484375;
        float _1734 = cos(_1732);
        float _1736 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1738 = _1736 * 0.15915493667125701904296875;
        float _1740 = _1730 * 6.283185482025146484375;
        float _1742 = sin(_1740);
        float _1744 = 1.0 / _1734;
        float _1746 = _1738 * 6.283185482025146484375;
        float _1748 = cos(_1746);
        float _1750 = _1742 * _1744;
        float _1752 = _1738 * 6.283185482025146484375;
        float _1754 = sin(_1752);
        float _1756 = _1748 * _1750;
        float _1758 = 1.0 / _1756;
        float _1760 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1762 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1760;
        float _1764 = 1.0 / _1762;
        float _1766 = _1754 * _1758;
        float _1768 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1770 = fma(_1722, _1766, _1768);
        float _1772 = _1770 * _1764;
        float _1774 = precise::clamp(_1772, 0.0, 1.0);
        _1658 = _1774;
    }
    float _1776 = _1658;
    if (!_1596)
    {
        float _1778 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1780 = _1778 * 0.15915493667125701904296875;
        float _1782 = _1780 * 6.283185482025146484375;
        float _1784 = cos(_1782);
        float _1786 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1788 = _1786 * 0.15915493667125701904296875;
        float _1790 = _1780 * 6.283185482025146484375;
        float _1792 = sin(_1790);
        float _1794 = 1.0 / _1784;
        float _1796 = _1788 * 6.283185482025146484375;
        float _1798 = cos(_1796);
        float _1800 = _1792 * _1794;
        float _1802 = _1788 * 6.283185482025146484375;
        float _1804 = sin(_1802);
        float _1806 = _1798 * _1800;
        float _1808 = 1.0 / _1806;
        float _1810 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1812 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1810;
        float _1814 = 1.0 / _1812;
        float _1816 = _1804 * _1808;
        float _1818 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1820 = fma(_1722, _1816, _1818);
        float _1822 = _1820 * _1814;
        float _1824 = precise::clamp(_1822, 0.0, 1.0);
        float _1826 = -_1824;
        float _1828 = _1826 + 1.0;
        _1724 = _1828;
    }
    float _1830 = _1724;
    float _1832 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1834 = _1704 + _1832;
    float _1836 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1838 = _1706 + _1836;
    float _1840 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1842 = _1708 + _1840;
    float _1844 = _1834 * _1834;
    float _1846 = fma(_1838, _1838, _1844);
    float _1848 = fma(_1842, _1842, _1846);
    float _1850 = rsqrt(_1848);
    float _1852 = _1850 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1854 = _1838 * _1852;
    float _1856 = _1842 * _1852;
    float _1858 = _1854 * _1854;
    float _1860 = _1856 * _1856;
    float _1862 = _1858 + _1860;
    float _1864 = sqrt(_1862);
    bool _1866 = _1864 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1868 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1870 = _1864 + _1868;
    float _1872 = _1850;
    float _1874 = _1862;
    float _1876 = _1870;
    float _1878 = _1834;
    float _1880 = _1854;
    if (_1866)
    {
        float _1882 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1872 = _1882;
    }
    float _1884 = _1872;
    if (_1866)
    {
        float _1886 = rsqrt(_1862);
        _1874 = _1886;
    }
    float _1888 = _1874;
    if (_1866)
    {
        float _1890 = _1870 * _1884;
        _1876 = _1890;
    }
    float _1892 = _1876;
    if (_1866)
    {
        float _1894 = _1892 * 0.15915493667125701904296875;
        _1726 = _1894;
    }
    float _1896 = _1726;
    float _1898 = _1884;
    if (_1866)
    {
        float _1900 = _1896 * 6.283185482025146484375;
        float _1902 = sin(_1900);
        _1898 = _1902;
    }
    float _1904 = _1898;
    float _1906 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1908 = precise::max(0.0, _1906);
    float _1910 = _1842;
    float _1912 = _1908;
    if (_1866)
    {
        float _1914 = _1896 * 6.283185482025146484375;
        float _1916 = cos(_1914);
        _1910 = _1916;
    }
    float _1918 = _1910;
    float _1920 = -_1852;
    float _1922 = -_1908;
    float _1924 = fma(_1834, _1920, _1922);
    float _1926 = _1924;
    if (!_1866)
    {
        _1878 = _1856;
    }
    float _1928 = _1878;
    float _1930 = _1928;
    if (_1866)
    {
        float _1932 = _1924 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1912 = _1932;
    }
    float _1934 = _1912;
    float _1936 = sqrt(_1848);
    float _1938 = _1904;
    float _1940 = _1934;
    if (_1866)
    {
        float _1942 = fma(_1904, _1934, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1938 = _1942;
    }
    float _1944 = _1938;
    float _1946 = _1944;
    float _1948 = _1918;
    if (_1866)
    {
        float _1950 = _1918 + (-1.0);
        _1940 = _1950;
    }
    float _1952 = _1940;
    float _1954 = _1952;
    if (_1866)
    {
        float _1956 = _1888 * _1944;
        _1716 = _1956;
    }
    float _1958 = _1716;
    if (_1866)
    {
        float _1960 = _1952 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1946 = _1960;
    }
    float _1962 = _1946;
    if (_1866)
    {
        float _1964 = _1854 * _1958;
        _1880 = _1964;
    }
    float _1966 = _1880;
    if (!_1866)
    {
        _1954 = _1858;
    }
    float _1968 = _1954;
    float _1970 = _1968;
    if (_1866)
    {
        float _1972 = _1856 * _1958;
        _1930 = _1972;
    }
    float _1974 = _1930;
    if (_1866)
    {
        float _1976 = fma(_1924, _1918, _1962);
        _1926 = _1976;
    }
    float _1978 = _1926;
    if (_1866)
    {
        float _1980 = _1966 * _1966;
        _1970 = _1980;
    }
    float _1982 = _1970;
    if (!_1866)
    {
        _1948 = _1860;
    }
    float _1984 = _1948;
    float _1986 = _1984;
    if (_1866)
    {
        float _1988 = _1974 * _1974;
        _1986 = _1988;
    }
    float _1990 = _1986;
    float _1992 = fma(_1978, _1978, _1982);
    float _1994 = _1992 + _1990;
    float _1996 = _1704 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1998 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2000 = fma(_1936, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1998);
    float _2002 = precise::clamp(_2000, 0.0, 1.0);
    float _2004 = _1704 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2006 = rsqrt(_1994);
    float _2008 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1996);
    float _2010 = -_2002;
    float _2012 = _2010 + 1.0;
    float _2014 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2004);
    float _2016 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2018 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2008);
    float _2020 = _1704 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2022 = _1704 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2024 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2014);
    float _2026 = _2018 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2028 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2020);
    float _2030 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2022);
    float _2032 = _2024 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2034 = _2026 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2036 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2028);
    float _2038 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2030);
    float _2040 = abs(_2012);
    float _2042 = log2(_2040);
    float _2044 = _2006 * _1966;
    float _2046 = -_2034;
    float _2048 = fma(_2046, _2016, 1.0);
    float _2050 = _2036 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2052 = _2032 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2054 = _2038 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2056 = _2006 * _1978;
    float _2058 = _2044 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2060 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2052);
    float _2062 = _2006 * _1974;
    float _2064 = log2(_2048);
    float _2066 = -_2058;
    float _2068 = fma(_2056, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2066);
    float _2070 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2060);
    float _2072 = _2032 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2074 = _2056 + 1.0;
    float _2076 = -_2062;
    float _2078 = fma(_2076, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2068);
    float _2080 = fma(_2054, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2070);
    float _2082 = _2042 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2084 = _2032 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2086 = fma(_2078, -0.5, 0.5);
    float _2088 = 1.0 / _2080;
    float _2090 = fma(_2078, 0.5, 0.5);
    float _2092 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2084);
    float _2094 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2072);
    float _2096 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2092);
    float _2098 = fma(_2090, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2100 = exp2(_2082);
    float _2102 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2094);
    float _2104 = fma(_2054, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2096);
    float _2106 = fma(_2090, _2098, -0.212114393711090087890625);
    float _2108 = _2064 * 0.693147182464599609375;
    float _2110 = fma(_2054, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2102);
    float _2112 = fma(_2090, _2106, 1.570728778839111328125);
    float _2114 = sqrt(_2086);
    float _2116 = _2104 * _2088;
    float _2118 = _2110 * _2088;
    float _2120 = _2108 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2122 = fma(_2116, 0.5, 0.5);
    float _2124 = fma(_2118, -0.5, 0.5);
    float _2126 = -_2056;
    float _2128 = fma(_2100, _2074, _2126);
    float3 _5602 = float3(_2122, _2124, _2120);
    float _2130 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5602, float3(0.0), isnan(_5602)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5602, float3(0.0), isnan(_5602)), level(0.0)).x;
    float _2132 = fma(_2128, 0.5, 0.5);
    float _2134 = _2114 * 0.636619746685028076171875;
    float _2136 = -_2112;
    float _2138 = fma(_2134, _2136, 1.0);
    float3 _5623 = float3(_2122, _2124, _2120);
    float4 _2141 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5623, float3(0.0), isnan(_5623)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5623, float3(0.0), isnan(_5623)), level(0.0)).xyzw;
    float _2143 = _2141.x;
    float _2145 = _2141.y;
    float _2147 = _2141.z;
    float _2149 = _2141.w;
    float2 _5640 = float2(_2138, _2132);
    float3 _2153 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5640, float2(0.0), isnan(_5640)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5640, float2(0.0), isnan(_5640)), level(0.0)).xyz;
    float _2155 = _2153.x;
    float _2157 = _2153.y;
    float _2159 = _2153.z;
    float _2161 = _2042 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2163 = _2032 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2165 = _1776 > 0.0;
    bool _2167 = isnan(_1776);
    bool _2169 = _2165 || _2167;
    bool _2171 = isnan(0.0);
    bool _2173 = _2169 || _2171;
    float _2175 = _1776 * _1830;
    float _2177 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2163);
    float _2179 = exp2(_2161);
    bool _2181 = _1830 <= 0.0;
    bool _2183 = !_2173;
    bool _2185 = _2181 || _2183;
    float _2187 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2177);
    float _2189 = _2175 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2191 = fma(_2054, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2187);
    float _2193 = _2189 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2195 = _2191 + _2080;
    out.gl_Position.x = _2104;
    out.gl_Position.y = _2110;
    out.gl_Position.z = _2191;
    out.gl_Position.w = _2080;
    float _2197 = _2195 * 0.5;
    float _2199 = -_2179;
    float _2201 = _2199 + 1.0;
    out.m_47.x = _2193;
    float _2203 = _2201 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_67.z = _2197;
    out.m_67.w = _2080;
    float _2205 = _2203 * _2130;
    float _2207 = -_2203;
    float _2209 = _2207 + 1.0;
    float _2211 = _2149 * _2205;
    float _2213 = _2159 * _2205;
    float _2215 = fma(_2155, _2211, _2143);
    float _2217 = fma(_2157, _2211, _2145);
    float _2219 = _2149 * _2209;
    float _2221 = fma(_2149, _2213, _2147);
    out.m_69.x = _2215;
    out.m_69.y = _2217;
    out.m_69.z = _2221;
    out.m_69.w = _2219;
    if (!_2185)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2223 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2223;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

