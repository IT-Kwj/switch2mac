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
    constant _16* vp_c7 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c16 [[id(5)]];
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
    float4 m_67 [[user(locn1)]];
    float4 m_83 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_65 [[user(locn4)]];
    float4 m_77 [[user(locn5)]];
    float4 m_79 [[user(locn6)]];
    float4 m_81 [[user(locn7)]];
    float4 m_85 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_57 [[attribute(1)]];
    float4 m_59 [[attribute(2)]];
    float4 m_61 [[attribute(3)]];
    float4 m_63 [[attribute(4)]];
    float4 m_44 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_73 [[attribute(7)]];
    float4 m_71 [[attribute(8)]];
    float4 m_51 [[attribute(9)]];
    float4 m_53 [[attribute(10)]];
    float4 m_75 [[attribute(11)]];
    float4 m_55 [[attribute(12)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2008 = false;
    bool _666 = false;
    bool _488 = false;
    bool _268 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _99 = in.m_44.w;
    float _101 = trunc(_99);
    int _104 = int(_101);
    bool _108 = _104 >= 1;
    float _110 = 0.0;
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _110;
    float _114 = _112;
    if (!_108)
    {
        out.m_47.x = 0.0;
    }
    int _116 = 0;
    if (!_108)
    {
        float _118 = _112 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2762 = as_type<float>(_120);
        out.gl_Position.z = _2762;
    }
    if (!_108)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _124 = in.m_49.w;
    bool _126 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _128 = isnan(_124);
    bool _130 = _126 || _128;
    bool _132 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _134 = _130 || _132;
    float _136 = -_124;
    float _138 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _140 = _138;
    if (_134)
    {
        float _142 = float(_104);
        _114 = _142;
    }
    float _144 = _114;
    bool _146 = _138 >= _144;
    bool _148 = !_134;
    bool _150 = _146 || _148;
    float _152 = _144;
    if (_150)
    {
        _152 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _152;
    if (_150)
    {
        out.m_47.x = 0.0;
    }
    if (_150)
    {
        float _156 = _154 * 5.0;
        _122 = as_type<int>(_156);
    }
    int _158 = _122;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2832 = as_type<float>(_158);
        out.gl_Position.z = _2832;
    }
    if (_150)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _160 = in.m_51.x;
    float _162 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _164 = _138 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _166 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _168 = _166 != 0;
    int _170 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _172 = _170 != 0;
    int _174 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _176 = _174 != 0;
    float _178 = _164 * _162;
    float _180 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[20].x, _178);
    float _182 = _180 * 6.283185482025146484375;
    float _184 = floor(_180);
    float _186 = _182 * 0.15915493667125701904296875;
    bool _188 = !_168;
    int _190 = _188 ? 0 : 1;
    int _192 = abs(_190);
    float _194 = _186 * 6.283185482025146484375;
    float _196 = cos(_194);
    bool _198 = !_176;
    int _200 = _198 ? 0 : 1;
    bool _202 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _204 = abs(_200);
    float _206 = -_184;
    float _208 = _180 + _206;
    bool _210 = !_172;
    int _212 = _210 ? 0 : 1;
    float _214 = float(_192);
    int _216 = abs(_212);
    float _218 = -_208;
    float _220 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _222 = _208 < 0.5;
    float _224 = float(_222);
    float _226 = fma(_196, 0.5, 0.5);
    float _228 = abs(_220);
    float _230 = _214 * _228;
    float _232 = float(_204);
    float _234 = -_224;
    float _236 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _238 = -_226;
    float _240 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _242 = float(_216);
    float _244 = fma(_232, _240, _230);
    float _246 = abs(_236);
    float _248 = fma(_242, _246, _244);
    bool _250 = !_202;
    float _266;
    if (!_250)
    {
        float _252 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _254 = _160 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _256 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[12].x, _138);
        float _258 = _256 * _252;
        float _260 = floor(_258);
        float _262 = -_260;
        float _264 = _258 + _262;
        _266 = _264;
        _268 = true;
    }
    else
    {
        float _270 = float(_104);
        float _272 = 1.0 / _270;
        float _274 = _138 * _272;
        _266 = _274;
    }
    _268 = false;
    float _276 = _266;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _280 = _276 + _278;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _284 = _276 + _282;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _288 = _276 + _286;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _292 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _290;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _296 = _294 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _298;
    float _302 = 1.0 / _292;
    bool _304 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _306 = 1.0 / _300;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _308;
    float _312 = 1.0 / _296;
    float _314 = _280 * _302;
    bool _316 = _276 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _318 = isnan(_276);
    bool _320 = _316 || _318;
    bool _322 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _324 = _320 || _322;
    float _326 = float(_324);
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _328;
    float _332 = fma(_310, _314, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _334 = fma(_330, _314, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _336 = _284 * _306;
    bool _338 = _276 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _340 = isnan(_276);
    bool _342 = _338 || _340;
    bool _344 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _346 = _342 || _344;
    float _348 = float(_346);
    float _350 = -_326;
    float _352 = _350 + 1.0;
    float _354 = _348 * _352;
    bool _356 = _276 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _358 = isnan(_276);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = _288 * _312;
    bool _370 = _276 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _372 = isnan(_276);
    bool _374 = _370 || _372;
    bool _376 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _378 = _374 || _376;
    float _380 = float(_378);
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _382;
    float _386 = -_348;
    float _388 = _386 + 1.0;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _392 = _390 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _394 = fma(_384, _314, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _396 = -_380;
    float _398 = _396 + 1.0;
    float _400 = _380 * _388;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _410 = _366 * _398;
    float _412 = -_366;
    float _414 = _412 + 1.0;
    float _416 = fma(_392, _368, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _418 = fma(_404, _368, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _420 = _332 * _410;
    float _422 = _334 * _410;
    float _424 = _394 * _410;
    float _426 = fma(_414, (*spvDescriptorSet0.vp_c9)._m0[143].x, _420);
    float _428 = fma(_414, (*spvDescriptorSet0.vp_c9)._m0[143].y, _422);
    float _430 = fma(_414, (*spvDescriptorSet0.vp_c9)._m0[143].z, _424);
    float _432 = fma(_408, _368, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _434;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _438;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _444 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _442;
    float _446 = fma(_416, _400, _426);
    float _448 = fma(_436, _336, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _450 = fma(_440, _336, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _452 = fma(_444, _336, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _454 = fma(_418, _400, _428);
    float _456 = fma(_432, _400, _430);
    float _458 = fma(_448, _354, _446);
    float _460 = fma(_450, _354, _454);
    float _462 = fma(_452, _354, _456);
    float _464 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[146].x, _458);
    float _466 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[146].y, _460);
    float _468 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[146].z, _462);
    bool _470 = !_304;
    float _486;
    if (!_470)
    {
        float _472 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _474 = _160 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _476 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[11].x, _138);
        float _478 = _476 * _472;
        float _480 = floor(_478);
        float _482 = -_480;
        float _484 = _478 + _482;
        _486 = _484;
        _488 = true;
    }
    else
    {
        float _490 = float(_104);
        float _492 = 1.0 / _490;
        float _494 = _138 * _492;
        _486 = _494;
    }
    _488 = false;
    float _496 = _486;
    float _498 = in.m_53.x;
    float _500 = in.m_53.y;
    float _502 = in.m_53.z;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _506 = _496 + _504;
    bool _508 = _496 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _510 = isnan(_496);
    bool _512 = _508 || _510;
    bool _514 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _516 = _512 || _514;
    float _518 = float(_516);
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _520;
    bool _524 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _526 = 1.0 / _522;
    float _528 = _466 * _500;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _532 = _530 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _534 = _468 * _502;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _538 = _496 + _536;
    float _540 = _506 * _526;
    float _542 = 1.0 / _532;
    bool _544 = _496 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _546 = isnan(_496);
    bool _548 = _544 || _546;
    bool _550 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _552 = _548 || _550;
    float _554 = float(_552);
    float _556 = -_518;
    float _558 = _556 + 1.0;
    bool _560 = _496 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _562 = isnan(_496);
    bool _564 = _560 || _562;
    bool _566 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _568 = _564 || _566;
    float _570 = float(_568);
    float _572 = _570 * _558;
    float _574 = -_570;
    float _576 = _574 + 1.0;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _578;
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _582;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _586;
    float _590 = _554 * _576;
    float _592 = fma(_580, _540, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _594 = fma(_584, _540, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _596 = fma(_588, _540, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _598 = _538 * _542;
    float _600 = _592 * _590;
    float _602 = _594 * _590;
    float _604 = _596 * _590;
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _608 = _606 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _612 = _610 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _614 = -_554;
    float _616 = _614 + 1.0;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _620 = _618 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _622 = fma(_608, _598, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _624 = fma(_612, _598, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _626 = fma(_616, (*spvDescriptorSet0.vp_c9)._m0[107].x, _600);
    float _628 = fma(_616, (*spvDescriptorSet0.vp_c9)._m0[107].y, _602);
    float _630 = fma(_620, _598, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _632 = fma(_616, (*spvDescriptorSet0.vp_c9)._m0[107].z, _604);
    float _634 = fma(_622, _572, _626);
    float _636 = fma(_624, _572, _628);
    float _638 = _464 * _498;
    float _640 = fma(_630, _572, _632);
    float _642 = fma(_518, (*spvDescriptorSet0.vp_c9)._m0[109].x, _634);
    float _644 = fma(_518, (*spvDescriptorSet0.vp_c9)._m0[109].y, _636);
    float _646 = fma(_518, (*spvDescriptorSet0.vp_c9)._m0[109].z, _640);
    bool _648 = !_524;
    float _664;
    if (!_648)
    {
        float _650 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _652 = _160 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _654 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[11].y, _138);
        float _656 = _654 * _650;
        float _658 = floor(_656);
        float _660 = -_658;
        float _662 = _656 + _660;
        _664 = _662;
        _666 = true;
    }
    else
    {
        float _668 = float(_104);
        float _670 = 1.0 / _668;
        float _672 = _138 * _670;
        _664 = _672;
    }
    _666 = false;
    float _674 = _664;
    float _676 = in.m_55.y;
    float _678 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _680 = log2(_678);
    float _682 = _160 * 2.0;
    float _684 = in.m_51.w;
    int _686 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _688 = _686 != 0;
    float _690 = in.m_44.x;
    float _692 = in.m_44.y;
    float _694 = in.m_44.z;
    int _696 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _698 = _696 != 0;
    int _700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _702 = _700 != 0;
    int _704 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _706 = _704 != 0;
    float _708 = floor(_682);
    int _710 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _712 = _710 != 0;
    float _714 = in.m_57.x;
    float _716 = in.m_57.y;
    float _718 = in.m_57.z;
    int _720 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _722 = _720 != 0;
    float _724 = in.m_51.y;
    float _726 = _680 * _138;
    float _728 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _730 = _728 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _732 = in.m_59.x;
    float _734 = in.m_59.y;
    float _736 = in.m_59.z;
    float _738 = 1.0 / _730;
    float _740 = in.m_61.x;
    float _742 = in.m_61.y;
    float _744 = in.m_61.z;
    float _746 = -_676;
    float _748 = _746 + 1.0;
    float _750 = in.m_55.x;
    bool _752 = _684 > 0.5;
    float _754 = exp2(_726);
    float _756 = in.m_51.z;
    int _758 = _752 ? as_type<int>(_748) : as_type<int>(_676);
    int _760 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _762 = _760 != 0;
    float _764 = _692 * _716;
    float _766 = _762 ? as_type<float>(_758) : _676;
    float _768 = fma(_690, _714, _764);
    bool _770 = _724 > 0.5;
    float _772 = _692 * _734;
    float _774 = _676;
    bool _776 = _712;
    int _778 = as_type<int>(_742);
    float _780 = _684;
    float _782 = _714;
    if (_712)
    {
        float _784 = _770 ? _748 : _676;
        _774 = _784;
    }
    float _786 = _774;
    if (_688)
    {
        bool _788 = _160 > 0.5;
        _776 = _788;
    }
    bool _790 = _776;
    float _792 = _692 * _742;
    float _794 = fma(_690, _732, _772);
    float _796 = -_754;
    float _798 = _796 + 1.0;
    bool _800 = _790;
    if (_688)
    {
        float _802 = -_750;
        float _804 = _802 + 1.0;
        _778 = as_type<int>(_804);
    }
    int _806 = _778;
    float _808 = fma(_690, _740, _792);
    if (!_688)
    {
        _780 = _750;
    }
    float _810 = _780;
    float _812 = fma(_694, _736, _794);
    float _814 = _756 * 2.0;
    float _816 = _810;
    if (_688)
    {
        float _818 = _790 ? as_type<float>(_806) : _750;
        _816 = _818;
    }
    float _820 = _816;
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _824 = 1.0 + _822;
    float _826 = fma(_694, _718, _768);
    float _828 = _724 * 2.0;
    float _830 = fma(_694, _744, _808);
    float _832 = _724 + _756;
    float _834 = 1.0 / _824;
    int _836 = 0;
    if (_722)
    {
        float _838 = -_750;
        float _840 = _838 + 1.0;
        _836 = as_type<int>(_840);
    }
    int _842 = _836;
    float _844 = _832 + (-1.0);
    if (_722)
    {
        bool _846 = _756 > 0.5;
        _800 = _846;
    }
    bool _848 = _800;
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _852 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _850;
    bool _854 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _856 = isnan(1.0);
    bool _858 = _854 || _856;
    bool _860 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _862 = _858 || _860;
    float _864 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _866 = floor(_814);
    if (!_722)
    {
        _782 = _750;
    }
    float _868 = _782;
    float _870 = _852 * _738;
    float _872 = _868;
    if (_722)
    {
        float _874 = _848 ? as_type<float>(_842) : _750;
        _872 = _874;
    }
    float _876 = _872;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _880 = _674 + _878;
    bool _882 = _674 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _884 = isnan(_674);
    bool _886 = _882 || _884;
    bool _888 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _890 = _886 || _888;
    float _892 = float(_890);
    float _894 = _160 + _756;
    bool _896 = _708 > 0.0;
    float _898 = floor(_828);
    bool _900 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _902 = isnan(0.0);
    bool _904 = _900 || _902;
    bool _906 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _908 = _904 || _906;
    float _910 = fma(_870, _880, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _912 = _674 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _914 = isnan(_674);
    bool _916 = _912 || _914;
    bool _918 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _920 = _916 || _918;
    float _922 = float(_920);
    float _924 = -_892;
    float _926 = _924 + 1.0;
    bool _928 = _708 >= 0.0;
    bool _930 = isnan(_708);
    bool _932 = _928 || _930;
    bool _934 = isnan(0.0);
    bool _936 = _932 || _934;
    float _938 = _894 + (-1.0);
    float _940 = _908 ? _798 : 0.0;
    float _942 = _922 * _926;
    float _944 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _946 = _936 ? 0 : 1;
    if (_862)
    {
        float _948 = _940 * _834;
        _140 = _948;
    }
    float _950 = _140;
    bool _952 = _866 > 0.0;
    float _954 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _956 = _910 * _942;
    bool _958 = _898 > 0.0;
    float _960 = -_922;
    float _962 = _960 + 1.0;
    bool _964 = _898 >= 0.0;
    bool _966 = isnan(_898);
    bool _968 = _964 || _966;
    bool _970 = isnan(0.0);
    bool _972 = _968 || _970;
    float _974 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _976 = ~_946;
    int _978 = _976 + 1;
    int _980 = _978 + 1;
    float _982 = fma(_962, (*spvDescriptorSet0.vp_c9)._m0[115].x, _956);
    int _984 = _980;
    if (!_896)
    {
        int _986 = ~_946;
        int _988 = _986 + 1;
        _984 = _988;
    }
    int _990 = _984;
    float _992 = _820 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _994 = !_702;
    int _996 = _994 ? 0 : 1;
    float _998 = fma(_892, (*spvDescriptorSet0.vp_c9)._m0[116].x, _982);
    bool _1000 = _866 >= 0.0;
    bool _1002 = isnan(_866);
    bool _1004 = _1000 || _1002;
    bool _1006 = isnan(0.0);
    bool _1008 = _1004 || _1006;
    float _1010 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1012 = abs(_996);
    float _1014 = _756 + (-0.5);
    int _1016 = _1008 ? 0 : 1;
    float _1018 = float(_1012);
    int _1020 = ~_1016;
    int _1022 = _1020 + 1;
    int _1024 = _1022 + 1;
    float _1026 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1028 = _1024;
    if (!_952)
    {
        int _1030 = ~_1016;
        int _1032 = _1030 + 1;
        _1028 = _1032;
    }
    int _1034 = _1028;
    float _1036 = _766 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1038 = float(_990);
    float _1040 = _786 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _1042 = _972 ? 0 : 1;
    float _1044 = _1036 * _944;
    bool _1046 = !_706;
    int _1048 = _1046 ? 0 : 1;
    float _1050 = _1018 * _1038;
    float _1052 = _1040 * _974;
    int _1054 = ~_1042;
    int _1056 = _1054 + 1;
    int _1058 = _1056 + 1;
    float _1060 = in.m_63.x;
    float _1062 = in.m_63.y;
    float _1064 = in.m_63.z;
    int _1066 = _1058;
    if (!_958)
    {
        int _1068 = ~_1042;
        int _1070 = _1068 + 1;
        _1066 = _1070;
    }
    int _1072 = _1066;
    float _1074 = _876 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _1076 = !_698;
    int _1078 = _1076 ? 0 : 1;
    float _1080 = _992 * _1010;
    int _1082 = abs(_1048);
    float _1084 = _812 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1086 = abs(_1078);
    float _1088 = _1074 * _1026;
    float _1090 = _826 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1092 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1094 = _1084 + _1092;
    float _1096 = float(_1072);
    out.m_65.x = _1080;
    out.m_65.y = _1052;
    out.m_65.z = _1088;
    out.m_65.w = _1044;
    float _1098 = float(_1082);
    float _1100 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1102 = _1090 + _1100;
    float _1104 = float(_1034);
    float _1106 = _830 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1108 = _1094 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1110 = _1098 * _1096;
    float _1112 = _724 + (-0.5);
    float _1114 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1116 = _1106 + _1114;
    float _1118 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1108);
    float _1120 = _1050 * (-2.0);
    float _1122 = _1110 * (-2.0);
    float _1124 = float(_1086);
    float _1126 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1118);
    float _1128 = fma(_1120, _1062, _1062);
    float _1130 = _1094 * _1094;
    float _1132 = fma(_864, _1120, _864);
    float _1134 = fma(_1112, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1128);
    bool _1136 = _1126 >= 0.0;
    float _1138 = fma(_1102, _1102, _1130);
    float _1140 = fma(_1132, _950, _1134);
    float _1142 = _642 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1144 = fma(_1116, _1116, _1138);
    float _1146 = _1124 * _1104;
    float _1148 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1150 = fma(_1122, _1064, _1064);
    float _1152 = rsqrt(_1144);
    float _1154 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1156 = (*spvDescriptorSet0.vp_c9)._m0[123].z;
    int _1158 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1160 = _1090;
    if (_1136)
    {
        _1156 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1162 = _1156;
    float _1164 = fma(_954, _1122, _954);
    float _1166 = _644 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1168 = _646 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1170 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1172 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    if (_1136)
    {
        float _1174 = _1162 * 5.0;
        _1158 = as_type<int>(_1174);
    }
    int _1176 = _1158;
    float _1178 = _1142 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1180 = _1166 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1182 = _1168 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1184 = _1148 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1186 = _1170 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1188 = _1154 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1190 = _998 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1192 = fma(_1014, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1150);
    if (_1136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4441 = as_type<float>(_1176);
        out.gl_Position.z = _4441;
    }
    float _1194 = _1094 * _1152;
    float _1196 = _1102 * _1152;
    float _1198 = fma(_1164, _950, _1192);
    out.m_67.x = _1184;
    out.m_67.y = _1186;
    out.m_67.z = _1188;
    out.m_67.w = _1172;
    float _1200 = _1140 * 0.15915493667125701904296875;
    out.m_69.x = _1178;
    out.m_69.y = _1180;
    out.m_69.z = _1182;
    out.m_69.w = _1190;
    float _1202 = _1198;
    if (_1136)
    {
        out.m_47.x = 0.0;
    }
    if (_1136)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1204 = -_1194;
    float _1206 = fma(_1204, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1084);
    float _1208 = _1116 * _1152;
    float _1210 = -_1196;
    float _1212 = fma(_1210, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1090);
    float _1214 = _160 + _724;
    float _1216 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1218 = _1206 + _1216;
    float _1220 = -_1208;
    float _1222 = fma(_1220, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1106);
    float _1224 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1226 = _1212 + _1224;
    float _1228 = _1214 + (-1.0);
    float _1230 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1232 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1234 = _1222 + _1232;
    float _1236 = _1146 * (-2.0);
    float _1238 = fma(_1228, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1240 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1230);
    float _1242 = _160 + (-0.5);
    float _1244 = fma(_1236, _1060, _1060);
    float _1246 = -_1194;
    float _1248 = fma(_1246, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1094);
    float _1250 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1240);
    float _1252 = fma(_1238, _1236, _1238);
    float _1254 = fma(_1242, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1244);
    float _1256 = -_1196;
    float _1258 = fma(_1256, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1102);
    float _1260 = _1248 * _1248;
    bool _1262 = _1250 >= 0.0;
    float _1264 = fma(_1252, _950, _1254);
    float _1266 = -_1208;
    float _1268 = fma(_1266, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1116);
    float _1270 = fma(_1258, _1258, _1260);
    float _1272 = _1198 * 0.15915493667125701904296875;
    float _1274 = _1264 * 0.15915493667125701904296875;
    float _1276 = _1200 * 6.283185482025146484375;
    float _1278 = sin(_1276);
    float _1280 = fma(_1268, _1268, _1270);
    if (_1262)
    {
        _1202 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1282 = _1202;
    float _1284 = _1200 * 6.283185482025146484375;
    float _1286 = cos(_1284);
    int _1288 = as_type<int>(_1282);
    if (_1262)
    {
        out.m_47.x = 0.0;
    }
    if (_1262)
    {
        float _1290 = _1282 * 5.0;
        _1288 = as_type<int>(_1290);
    }
    int _1292 = _1288;
    float _1294 = _1272 * 6.283185482025146484375;
    float _1296 = sin(_1294);
    if (_1262)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4644 = as_type<float>(_1292);
        out.gl_Position.z = _4644;
    }
    float _1298 = _1272 * 6.283185482025146484375;
    float _1300 = cos(_1298);
    float _1302 = _1274 * 6.283185482025146484375;
    float _1304 = sin(_1302);
    float _1306 = sqrt(_1280);
    if (_1262)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1308 = -_1084;
    float _1310 = _1308 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1312 = -_1090;
    float _1314 = _1312 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1316 = _1274 * 6.283185482025146484375;
    float _1318 = cos(_1316);
    float _1320 = -_1106;
    float _1322 = _1320 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1324 = _1310 * _1310;
    float _1326 = _1286 * _1300;
    float _1328 = _1278 * _1296;
    float _1330 = _1152 * _1306;
    float _1332 = fma(_1314, _1314, _1324);
    float _1334 = _1286 * _1296;
    float _1336 = fma(_1304, _1328, _1326);
    float _1338 = fma(_1304, _1326, _1328);
    float _1340 = fma(_1322, _1322, _1332);
    float _1342 = _1278 * _1300;
    float _1344 = _638 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1346 = 0.0 + (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _1348 = precise::clamp(_1346, 0.0, 1.0);
    float _1350 = rsqrt(_1340);
    float _1352 = _1296 * _1318;
    float _1354 = _1300 * _1318;
    float _1356 = _1278 * _1318;
    float _1358 = _1286 * _1318;
    float _1360 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1362 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _1360;
    float _1364 = in.m_71.x;
    float _1366 = in.m_71.y;
    float _1368 = in.m_71.z;
    float _1370 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1372 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _1370;
    float _1374 = _1362 * _1362;
    float _1376 = -_1342;
    float _1378 = fma(_1304, _1334, _1376);
    float _1380 = -_1334;
    float _1382 = fma(_1304, _1342, _1380);
    float _1384 = _1330 * _1344;
    float _1386 = fma(_1348, -0.64999997615814208984375, 1.0);
    float _1388 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1390 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _1388;
    float _1392 = _1314 * _1350;
    float _1394 = _1322 * _1350;
    float _1396 = _1310 * _1350;
    float _1398 = fma(_1372, _1372, _1374);
    float _1400 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1402 = _1392 * _1400;
    float _1404 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1406 = _1394 * _1404;
    float _1408 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1410 = _1396 * _1408;
    float _1412 = fma(_1390, _1390, _1398);
    float _1414 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1416 = -_1402;
    float _1418 = fma(_1394, _1414, _1416);
    float _1420 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1422 = -_1406;
    float _1424 = fma(_1396, _1420, _1422);
    float _1426 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1428 = -_1410;
    float _1430 = fma(_1392, _1426, _1428);
    float _1432 = _528 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1434 = _1418 * _1418;
    float _1436 = rsqrt(_1412);
    float _1438 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1364);
    float _1440 = _1330 * _1432;
    float _1442 = fma(_1424, _1424, _1434);
    float _1444 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1366);
    float _1446 = _1438 * _1384;
    float _1448 = _534 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1450 = fma(_1430, _1430, _1442);
    float _1452 = sqrt(_1412);
    float _1454 = _1444 * _1440;
    float _1456 = _1330 * _1448;
    float _1458 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1368);
    bool _1460 = _1366 != 0.0;
    bool _1462 = isnan(_1366);
    bool _1464 = _1460 || _1462;
    bool _1466 = isnan(0.0);
    bool _1468 = _1464 || _1466;
    float _1470 = _1354 * _1454;
    float _1472 = _1338 * _1454;
    float _1474 = _1458 * _1456;
    float _1476 = rsqrt(_1450);
    float _1478 = _1382 * _1454;
    float _1480 = _1436 * (-0.20000000298023223876953125);
    float _1482 = fma(_1352, _1446, _1470);
    float _1484 = fma(_1378, _1446, _1472);
    float _1486 = fma(_1336, _1446, _1478);
    float _1488 = fma(_1372, _1480, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    bool _1490 = _1364 == 0.0;
    bool _1492 = !_1468;
    bool _1494 = _1490 && _1492;
    float _1496 = _1452 * 0.066666670143604278564453125;
    float _1498 = fma(_1356, _1474, _1486);
    float _1500 = fma(_1362, _1480, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _1502 = -_1304;
    float _1504 = fma(_1502, _1474, _1482);
    float _1506 = fma(_1358, _1474, _1484);
    float _1508 = fma(_1390, _1480, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _1510 = -_1500;
    float _1512 = _1510 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1514 = precise::max(_1496, 1.0);
    float _1516 = _1430 * _1476;
    float _1518 = _1418 * _1476;
    float _1520 = _1424 * _1476;
    float _1522 = _1512 * _1512;
    float _1524 = _1392 * _1516;
    float _1526 = _1394 * _1518;
    float _1528 = precise::min(_1514, 2.0);
    float _1530 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1532 = _1500 + _1530;
    float _1534 = -_1524;
    float _1536 = fma(_1394, _1520, _1534);
    float _1538 = _1396 * _1520;
    float _1540 = -_1526;
    float _1542 = fma(_1396, _1516, _1540);
    float _1544 = _1528 * _1386;
    float _1546 = _1536 * _1504;
    float _1548 = -_1538;
    float _1550 = fma(_1392, _1518, _1548);
    float _1552 = _1542 * _1504;
    float _1554 = -_1488;
    float _1556 = _1554 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1558 = fma(_1518, _1498, _1546);
    float _1560 = _1550 * _1504;
    float _1562 = fma(_1520, _1498, _1552);
    bool _1564 = _1368 == 0.0;
    bool _1566 = _1564 && _1494;
    float _1568 = fma(_1396, _1506, _1558);
    float _1570 = fma(_1516, _1498, _1560);
    float _1572 = fma(_1392, _1506, _1562);
    float _1574 = fma(_1556, _1556, _1522);
    float _1576 = _1084 + _1568;
    float _1578 = -_1508;
    float _1580 = _1578 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1582 = _1090 + _1572;
    float _1584 = in.m_73.x;
    float _1586 = in.m_73.y;
    float _1588 = in.m_73.z;
    float _1590 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1592 = _1576 + _1590;
    float _1594 = fma(_1394, _1506, _1570);
    float _1596 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1598 = _1582 + _1596;
    float _1600 = fma(_1580, _1580, _1574);
    float _1602 = fma(_1592, _1544, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _1604 = _1106 + _1594;
    float _1606 = fma(_1598, _1544, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _1608 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1610 = _1488 + _1608;
    float _1612 = -_1602;
    float _1614 = _1612 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1616 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1618 = _1604 + _1616;
    float _1620 = -_1606;
    float _1622 = _1620 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1624 = _1532 * _1532;
    float _1626 = _1614 * _1614;
    float _1628 = fma(_1618, _1544, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _1630 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1632 = _1508 + _1630;
    float _1634 = fma(_1610, _1610, _1624);
    float _1636 = fma(_1622, _1622, _1626);
    float _1638 = -_1628;
    float _1640 = _1638 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1642 = in.m_75.x;
    float _1644 = in.m_75.y;
    float _1646 = in.m_75.z;
    float _1648 = in.m_75.w;
    float _1650 = fma(_1632, _1632, _1634);
    float _1652 = sqrt(_1600);
    float _1654 = fma(_1640, _1640, _1636);
    float _1656 = _1352 * _1536;
    float _1658 = _1636;
    float _1660 = _1634;
    float _1662 = _1640;
    float _1664 = _1584;
    float _1666 = _1338;
    if (_1566)
    {
        _1658 = _1584;
    }
    float _1668 = _1658;
    float _1670 = _1352 * _1550;
    float _1672 = _1668;
    if (_1566)
    {
        _1660 = _1588;
    }
    float _1674 = _1660;
    float _1676 = _1674;
    if (!_1566)
    {
        float _1678 = fma(_1368, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1588);
        _1676 = _1678;
    }
    float _1680 = _1676;
    if (_1566)
    {
        _1662 = _1668;
    }
    float _1682 = _1662;
    float _1684 = sqrt(_1654);
    float _1686 = _1682;
    if (!_1566)
    {
        _1672 = _1584;
    }
    float _1688 = _1672;
    float _1690 = fma(_1336, _1516, _1670);
    if (_1566)
    {
        _1664 = _1586;
    }
    float _1692 = _1664;
    float _1694 = _1692;
    if (!_1566)
    {
        float _1696 = fma(_1366, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1586);
        _1694 = _1696;
    }
    float _1698 = _1694;
    if (!_1566)
    {
        float _1700 = fma(_1364, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1688);
        _1686 = _1700;
    }
    float _1702 = _1686;
    float _1704 = rsqrt(_1650);
    float _1706 = _1646 * _1688;
    float _1708 = _1644 * _1588;
    float _1710 = -_1652;
    float _1712 = _1684 + _1710;
    float _1714 = _1642 * _1586;
    float _1716 = -_1706;
    float _1718 = fma(_1642, _1588, _1716);
    float _1720 = -_1708;
    float _1722 = fma(_1646, _1586, _1720);
    float _1724 = _1354 * _1550;
    float _1726 = -_1714;
    float _1728 = fma(_1644, _1688, _1726);
    float _1730 = _1718 * _1648;
    float _1732 = _1722 * _1648;
    float _1734 = _1704 * _1712;
    float _1736 = _1728 * _1648;
    float _1738 = _1352 * _1542;
    float _1740 = _1354 * _1542;
    float _1742 = -_1734;
    float _1744 = fma(_1610, _1742, _1606);
    float _1746 = -_1734;
    float _1748 = fma(_1632, _1746, _1628);
    float _1750 = _1354 * _1536;
    float _1752 = -_1542;
    float _1754 = _1304 * _1752;
    float _1756 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1758 = _1744 + _1756;
    float _1760 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1762 = _1748 + _1760;
    float _1764 = -_1536;
    float _1766 = _1304 * _1764;
    float _1768 = -_1550;
    float _1770 = _1304 * _1768;
    float _1772 = _1758 * _1758;
    float _1774 = _1762 * _1762;
    float _1776 = fma(_1382, _1520, _1740);
    float _1778 = fma(_1382, _1518, _1750);
    float _1780 = fma(_1382, _1516, _1724);
    float _1782 = _1772 + _1774;
    float _1784 = fma(_1336, _1520, _1738);
    float _1786 = fma(_1336, _1518, _1656);
    float _1788 = fma(_1356, _1516, _1770);
    float _1790 = sqrt(_1782);
    float _1792 = fma(_1356, _1520, _1754);
    float _1794 = fma(_1356, _1518, _1766);
    float _1796 = fma(_1338, _1392, _1776);
    float _1798 = fma(_1338, _1396, _1778);
    float _1800 = fma(_1338, _1394, _1780);
    float _1802 = fma(_1378, _1392, _1784);
    float _1804 = fma(_1378, _1396, _1786);
    float _1806 = fma(_1378, _1394, _1690);
    float _1808 = fma(_1358, _1394, _1788);
    float _1810 = fma(_1358, _1392, _1792);
    float _1812 = fma(_1358, _1396, _1794);
    float _1814 = _1796 * _1644;
    float _1816 = _1798 * _1644;
    float _1818 = _1800 * _1644;
    float _1820 = _1796 * _1698;
    bool _1822 = _1790 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1824 = _1730 * _1796;
    float _1826 = _1798 * _1698;
    float _1828 = _1730 * _1798;
    float _1830 = _1800 * _1698;
    float _1832 = _1730 * _1800;
    float _1834 = -_1734;
    float _1836 = fma(_1532, _1834, _1602);
    float _1838 = _1836;
    float _1840 = _1772;
    float _1842 = _1774;
    float _1844 = _1748;
    float _1846 = _1736;
    if (!_1822)
    {
        _1666 = _1744;
    }
    float _1848 = _1666;
    bool _1850 = !_1822;
    float _1852 = _1848;
    if (!_1850)
    {
        float _1854 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1856 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1858 = _1790 + _1856;
        float _1860 = rsqrt(_1782);
        float _1862 = _1858 * _1854;
        float _1864 = _1836 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1866 = _1862 * 0.15915493667125701904296875;
        float _1868 = _1866 * 6.283185482025146484375;
        float _1870 = sin(_1868);
        float _1872 = _1866 * 6.283185482025146484375;
        float _1874 = cos(_1872);
        float _1876 = fma(_1870, _1864, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1878 = _1860 * _1876;
        float _1880 = fma(_1758, _1878, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1882 = _1874 + (-1.0);
        float _1884 = fma(_1762, _1878, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1886 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1888 = _1880 + _1886;
        float _1890 = _1882 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1892 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1894 = _1884 + _1892;
        float _1896 = _1888 * _1888;
        float _1898 = fma(_1836, _1874, _1890);
        float _1900 = _1894 * _1894;
        _1838 = _1898;
        _1840 = _1896;
        _1842 = _1900;
        _1852 = _1880;
        _1844 = _1884;
    }
    float _1902 = _1838;
    float _1904 = _1840;
    float _1906 = _1842;
    float _1908 = _1852;
    float _1910 = _1844;
    float _1912 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1914 = _1902 + _1912;
    float _1916 = fma(_1802, _1702, _1820);
    float _1918 = fma(_1802, _1642, _1814);
    float _1920 = fma(_1804, _1642, _1816);
    float _1922 = fma(_1914, _1914, _1904);
    float _1924 = fma(_1804, _1702, _1826);
    float _1926 = fma(_1806, _1702, _1830);
    float _1928 = fma(_1732, _1802, _1824);
    float _1930 = _1922 + _1906;
    float _1932 = fma(_1806, _1642, _1818);
    float _1934 = fma(_1732, _1804, _1828);
    float _1936 = fma(_1732, _1806, _1832);
    float _1938 = fma(_1810, _1646, _1918);
    float _1940 = fma(_1812, _1646, _1920);
    float _1942 = sqrt(_1930);
    float _1944 = fma(_1810, _1680, _1916);
    float _1946 = fma(_1736, _1810, _1928);
    float _1948 = fma(_1812, _1680, _1924);
    float _1950 = fma(_1736, _1812, _1934);
    float _1952 = fma(_1736, _1808, _1936);
    float _1954 = fma(_1808, _1680, _1926);
    float _1956 = fma(_1808, _1646, _1932);
    out.m_69.x = _1178;
    out.m_69.y = _1180;
    out.m_69.z = _1182;
    out.m_69.w = _1190;
    out.m_67.x = _1184;
    out.m_67.y = _1186;
    out.m_67.z = _1188;
    out.m_67.w = _1172;
    out.m_77.x = _1946;
    out.m_77.y = _1950;
    out.m_77.z = _1952;
    bool _1958 = _1942 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1960 = isnan(_1942);
    bool _1962 = _1958 || _1960;
    bool _1964 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1966 = _1962 || _1964;
    out.m_79.x = _1944;
    out.m_79.y = _1948;
    out.m_79.z = _1954;
    out.m_81.x = _1938;
    out.m_81.y = _1940;
    out.m_81.z = _1956;
    float _1968 = _1956;
    float _1970 = _1946;
    float _1972 = _1950;
    if (!_1966)
    {
        _1846 = 1.0;
    }
    float _1974 = _1846;
    bool _1976 = !_1966;
    float _1978 = _1974;
    if (!_1976)
    {
        bool _1980 = _1942 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1982 = isnan(_1942);
        bool _1984 = _1980 || _1982;
        bool _1986 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1988 = _1984 || _1986;
        if (!_1988)
        {
            float _1990 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1992 = _1942 + _1990;
            float _1994 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1996 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1994;
            float _1998 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2000 = _1998 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2002 = 1.0 / _1996;
            float _2004 = _1992 * _2002;
            float _2006 = fma(_2004, _2000, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1978 = _2006;
            _2008 = true;
        }
        else
        {
            bool _2010 = _1942 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2012 = isnan(_1942);
            bool _2014 = _2010 || _2012;
            bool _2016 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2018 = _2014 || _2016;
            if (!_2018)
            {
                float _2020 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2022 = _1942 + _2020;
                float _2024 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2026 = _2024 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2028 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2030 = _2028 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2032 = 1.0 / _2026;
                float _2034 = _2022 * _2032;
                float _2036 = fma(_2034, _2030, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1978 = _2036;
                _2008 = true;
            }
            else
            {
                _1978 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2008 = false;
    float _2038 = _1978;
    float _2040 = _1206 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2042 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2044 = _1908 + _2042;
    float _2046 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2040);
    float _2048 = _1206 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2050 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2052 = _1902 + _2050;
    float _2054 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2046);
    bool _2056 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2058 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2060 = _2056 || _2058;
    bool _2062 = isnan(0.5);
    bool _2064 = _2060 || _2062;
    float _2066 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2068 = _1910 + _2066;
    bool _2070 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2072 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2074 = _2070 || _2072;
    bool _2076 = isnan(0.5);
    bool _2078 = _2074 || _2076;
    float _2080 = _2054 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2082 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2048);
    float _2084 = fma(_2052, _2038, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2086 = fma(_2068, _2038, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2088 = 1.0 / _2080;
    float _2090 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2082);
    float _2092 = _2090 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2094 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_2078)
    {
        _2094 = 1.0;
    }
    float _2096 = _2094;
    float _2098 = _2092 + _2080;
    float _2100 = -_1194;
    float _2102 = fma(_2100, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2084);
    float _2104 = _2098 * _2088;
    float _2106 = _2104 * 0.5;
    float _2108 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2110 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2108);
    float _2112 = fma(_2044, _2038, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2114 = -_1208;
    float _2116 = fma(_2114, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2086);
    float _2118 = 1.0 / _2110;
    float _2120 = -_1196;
    float _2122 = fma(_2120, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2112);
    float _2124 = _2102;
    float _2126 = _2122;
    float _2128 = _2116;
    float _2130 = _2112;
    float _2132 = _2096;
    if (!_2064)
    {
        float _2134 = _1218 * _1218;
        float _2136 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2138 = -_1106;
        float _2140 = _2138 + _2086;
        float _2142 = -_1084;
        float _2144 = _2142 + _2084;
        float _2146 = fma(_1226, _1226, _2134);
        float _2148 = fma(_1234, _1234, _2146);
        float _2150 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2152 = sqrt(_2148);
        float _2154 = 1.0 / _1330;
        float _2156 = precise::min(_2152, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2158 = _2156 * _2136;
        float _2160 = _2150 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2162 = _2158 * _2154;
        float _2164 = -_1090;
        float _2166 = _2164 + _2112;
        float _2168 = _2160 * _2162;
        float _2170 = _2140 * _2162;
        float _2172 = fma(_2166, _2168, _1212);
        float _2174 = fma(_2144, _2168, _1206);
        float _2176 = fma(_2160, _2170, _1222);
        _2124 = _2174;
        _2126 = _2172;
        _2128 = _2176;
    }
    float _2178 = _2124;
    float _2180 = _2126;
    float _2182 = _2128;
    if (_2078)
    {
        _2130 = 1.0;
    }
    float _2184 = _2130;
    float _2186 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2188 = _2118 * _2186;
    float _2190 = _2184;
    if (!_2078)
    {
        float _2192 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2194 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2196 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2194;
        float _2198 = _2192 * 0.15915493667125701904296875;
        float _2200 = _2198 * 6.283185482025146484375;
        float _2202 = cos(_2200);
        float _2204 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2206 = _2204 * 0.15915493667125701904296875;
        float _2208 = _2198 * 6.283185482025146484375;
        float _2210 = sin(_2208);
        float _2212 = 1.0 / _2202;
        float _2214 = _2206 * 6.283185482025146484375;
        float _2216 = cos(_2214);
        float _2218 = _2210 * _2212;
        float _2220 = _2206 * 6.283185482025146484375;
        float _2222 = sin(_2220);
        float _2224 = _2216 * _2218;
        float _2226 = 1.0 / _2196;
        float _2228 = 1.0 / _2224;
        float _2230 = _2222 * _2228;
        float _2232 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2234 = fma(_2188, _2230, _2232);
        float _2236 = _2234 * _2226;
        float _2238 = precise::clamp(_2236, 0.0, 1.0);
        _1968 = _2226;
        _2132 = _2238;
    }
    float _2240 = _1968;
    float _2242 = _2132;
    float _2244 = _2240;
    if (!_2078)
    {
        float _2246 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2248 = _2246 * 0.15915493667125701904296875;
        float _2250 = _2248 * 6.283185482025146484375;
        float _2252 = cos(_2250);
        float _2254 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2256 = _2254 * 0.15915493667125701904296875;
        float _2258 = _2248 * 6.283185482025146484375;
        float _2260 = sin(_2258);
        float _2262 = 1.0 / _2252;
        float _2264 = _2256 * 6.283185482025146484375;
        float _2266 = cos(_2264);
        float _2268 = _2260 * _2262;
        float _2270 = _2256 * 6.283185482025146484375;
        float _2272 = sin(_2270);
        float _2274 = _2266 * _2268;
        float _2276 = 1.0 / _2274;
        float _2278 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2280 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2278;
        float _2282 = 1.0 / _2280;
        float _2284 = _2272 * _2276;
        float _2286 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2288 = fma(_2188, _2284, _2286);
        float _2290 = _2288 * _2282;
        float _2292 = precise::clamp(_2290, 0.0, 1.0);
        float _2294 = -_2292;
        float _2296 = _2294 + 1.0;
        _2244 = _2252;
        _2190 = _2296;
    }
    float _2298 = _2244;
    float _2300 = _2190;
    float _2302 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2304 = _2178 + _2302;
    float _2306 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2308 = _2180 + _2306;
    float _2310 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2312 = _2182 + _2310;
    float _2314 = _2304 * _2304;
    float _2316 = fma(_2308, _2308, _2314);
    float _2318 = fma(_2312, _2312, _2316);
    float _2320 = rsqrt(_2318);
    float _2322 = _2320 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2324 = _2308 * _2322;
    float _2326 = _2312 * _2322;
    float _2328 = _2324 * _2324;
    float _2330 = _2326 * _2326;
    float _2332 = _2328 + _2330;
    float _2334 = sqrt(_2332);
    bool _2336 = _2334 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2338 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2340 = _2334 + _2338;
    float _2342 = _2312;
    float _2344 = _2332;
    float _2346 = _2340;
    float _2348 = _2324;
    if (_2336)
    {
        float _2350 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2342 = _2350;
    }
    float _2352 = _2342;
    if (_2336)
    {
        float _2354 = rsqrt(_2332);
        _2344 = _2354;
    }
    float _2356 = _2344;
    float _2358 = _2356;
    if (_2336)
    {
        float _2360 = _2340 * _2352;
        _2346 = _2360;
    }
    float _2362 = _2346;
    if (_2336)
    {
        float _2364 = _2362 * 0.15915493667125701904296875;
        _1970 = _2364;
    }
    float _2366 = _1970;
    float _2368 = _2320;
    if (_2336)
    {
        float _2370 = _2366 * 6.283185482025146484375;
        float _2372 = sin(_2370);
        _2368 = _2372;
    }
    float _2374 = _2368;
    float _2376 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2378 = precise::max(0.0, _2376);
    float _2380 = _2298;
    float _2382 = _2378;
    float _2384 = _2376;
    if (_2336)
    {
        float _2386 = _2366 * 6.283185482025146484375;
        float _2388 = cos(_2386);
        _2380 = _2388;
    }
    float _2390 = _2380;
    float _2392 = -_2322;
    float _2394 = -_2378;
    float _2396 = fma(_2304, _2392, _2394);
    if (_2336)
    {
        float _2398 = _2396 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2382 = _2398;
    }
    float _2400 = _2382;
    float _2402 = sqrt(_2318);
    float _2404 = _2178 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2406 = _2374;
    float _2408 = _2400;
    if (_2336)
    {
        float _2410 = fma(_2374, _2400, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2406 = _2410;
    }
    float _2412 = _2406;
    float _2414 = _2412;
    if (!_2336)
    {
        _2408 = _2326;
    }
    float _2416 = _2408;
    float _2418 = _2416;
    if (_2336)
    {
        float _2420 = _2390 + (-1.0);
        _2384 = _2420;
    }
    float _2422 = _2384;
    float _2424 = _2422;
    if (_2336)
    {
        float _2426 = _2356 * _2412;
        _1160 = _2426;
    }
    float _2428 = _1160;
    if (!_2336)
    {
        _2414 = _2396;
    }
    float _2430 = _2414;
    float _2432 = _2430;
    if (_2336)
    {
        float _2434 = _2422 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1972 = _2434;
    }
    float _2436 = _1972;
    if (_2336)
    {
        float _2438 = _2324 * _2428;
        _2348 = _2438;
    }
    float _2440 = _2348;
    if (!_2336)
    {
        _2358 = _2328;
    }
    float _2442 = _2358;
    float _2444 = _2442;
    if (_2336)
    {
        float _2446 = _2326 * _2428;
        _2418 = _2446;
    }
    float _2448 = _2418;
    if (_2336)
    {
        float _2450 = fma(_2396, _2390, _2436);
        _2432 = _2450;
    }
    float _2452 = _2432;
    if (_2336)
    {
        float _2454 = _2440 * _2440;
        _2444 = _2454;
    }
    float _2456 = _2444;
    if (!_2336)
    {
        _2424 = _2330;
    }
    float _2458 = _2424;
    float _2460 = _2458;
    if (_2336)
    {
        float _2462 = _2448 * _2448;
        _2460 = _2462;
    }
    float _2464 = _2460;
    float _2466 = fma(_2452, _2452, _2456);
    float _2468 = _2466 + _2464;
    float _2470 = _2178 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2472 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2474 = fma(_2402, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2472);
    float _2476 = precise::clamp(_2474, 0.0, 1.0);
    float _2478 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2480 = rsqrt(_2468);
    float _2482 = fma(_2180, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2470);
    float _2484 = _2178 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2486 = -_2476;
    float _2488 = _2486 + 1.0;
    float _2490 = _2178 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2492 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2482);
    float _2494 = fma(_2180, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2484);
    float _2496 = fma(_2180, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2490);
    float _2498 = _2492 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2500 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2494);
    float _2502 = abs(_2488);
    float _2504 = log2(_2502);
    float _2506 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2496);
    float _2508 = fma(_2180, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2404);
    float _2510 = _2500 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2512 = _2498 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2514 = _2480 * _2440;
    float _2516 = _2506 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2518 = _2510 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2520 = _2480 * _2452;
    float _2522 = _2514 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2524 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2508);
    float _2526 = fma(_2516, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2518);
    float _2528 = _2480 * _2448;
    float _2530 = -_2522;
    float _2532 = fma(_2520, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2530);
    float _2534 = _2524 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2536 = fma(_2498, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2526);
    float _2538 = _2504 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2540 = -_2528;
    float _2542 = fma(_2540, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2532);
    float _2544 = -_2512;
    float _2546 = fma(_2544, _2478, 1.0);
    float _2548 = fma(_2534, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2536);
    float _2550 = _2510 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2552 = fma(_2542, -0.5, 0.5);
    float _2554 = exp2(_2538);
    float _2556 = _2510 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2558 = fma(_2516, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2550);
    float _2560 = fma(_2542, 0.5, 0.5);
    float _2562 = _2520 + 1.0;
    float _2564 = fma(_2516, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2556);
    float _2566 = fma(_2498, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2558);
    float _2568 = fma(_2560, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2570 = log2(_2546);
    float _2572 = fma(_2498, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2564);
    float _2574 = fma(_2560, _2568, -0.212114393711090087890625);
    float _2576 = fma(_2560, _2574, 1.570728778839111328125);
    float _2578 = 1.0 / _2548;
    float _2580 = -_2520;
    float _2582 = fma(_2554, _2562, _2580);
    float _2584 = fma(_2534, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2566);
    float _2586 = fma(_2534, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2572);
    float _2588 = fma(_2582, 0.5, 0.5);
    float _2590 = sqrt(_2552);
    float _2592 = _2570 * 0.693147182464599609375;
    float _2594 = _2592 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2596 = _2584 * _2578;
    float _2598 = _2586 * _2578;
    float _2600 = fma(_2596, 0.5, 0.5);
    float _2602 = fma(_2598, -0.5, 0.5);
    float _2604 = _2590 * 0.636619746685028076171875;
    float _2606 = -_2576;
    float _2608 = fma(_2604, _2606, 1.0);
    float3 _6752 = float3(_2600, _2602, _2594);
    float _2610 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6752, float3(0.0), isnan(_6752)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6752, float3(0.0), isnan(_6752)), level(0.0)).x;
    float3 _6763 = float3(_2600, _2602, _2594);
    float4 _2613 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6763, float3(0.0), isnan(_6763)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6763, float3(0.0), isnan(_6763)), level(0.0)).xyzw;
    float _2615 = _2613.x;
    float _2617 = _2613.y;
    float _2619 = _2613.z;
    float _2621 = _2613.w;
    float2 _6780 = float2(_2608, _2588);
    float3 _2625 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6780, float2(0.0), isnan(_6780)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6780, float2(0.0), isnan(_6780)), level(0.0)).xyz;
    float _2627 = _2625.x;
    float _2629 = _2625.y;
    float _2631 = _2625.z;
    float _2633 = _2504 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2635 = _2510 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2637 = _2242 * _2300;
    bool _2639 = _2242 > 0.0;
    bool _2641 = isnan(_2242);
    bool _2643 = _2639 || _2641;
    bool _2645 = isnan(0.0);
    bool _2647 = _2643 || _2645;
    float _2649 = fma(_2516, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2635);
    float _2651 = exp2(_2633);
    float _2653 = _2637 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2655 = _2300 <= 0.0;
    bool _2657 = !_2647;
    bool _2659 = _2655 || _2657;
    float _2661 = fma(_2498, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2649);
    float _2663 = _2548 * 0.5;
    float _2665 = _248 * _2653;
    float _2667 = _2584 + _2548;
    float _2669 = fma(_2534, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2661);
    float _2671 = fma(_2586, -0.5, _2663);
    float _2673 = _2667 * 0.5;
    float _2675 = _2669 + _2548;
    out.gl_Position.x = _2584;
    out.gl_Position.y = _2586;
    out.gl_Position.z = _2669;
    out.gl_Position.w = _2548;
    float _2677 = _2665 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2679 = _2675 * 0.5;
    float _2681 = -_2651;
    float _2683 = _2681 + 1.0;
    out.m_47.x = _2677;
    float _2685 = _2683 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_83.x = _2673;
    out.m_83.y = _2671;
    out.m_83.z = _2679;
    out.m_83.w = _2548;
    float _2687 = -_2685;
    float _2689 = _2687 + 1.0;
    float _2691 = _2685 * _2610;
    float _2693 = _2621 * _2689;
    float _2695 = _2621 * _2691;
    float _2697 = _2631 * _2691;
    float _2699 = fma(_2627, _2695, _2615);
    float _2701 = fma(_2629, _2695, _2617);
    float _2703 = fma(_2621, _2697, _2619);
    out.m_85.x = _2699;
    out.m_85.y = _2701;
    out.m_85.z = _2703;
    out.m_85.w = _2693;
    if (!_2659)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2705 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2705;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2008 = false;
    bool _666 = false;
    bool _488 = false;
    bool _268 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _99 = in.m_44.w;
    float _101 = trunc(_99);
    int _104 = int(_101);
    bool _108 = _104 >= 1;
    float _110 = 0.0;
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _110;
    float _114 = _112;
    if (!_108)
    {
        out.m_47.x = 0.0;
    }
    int _116 = 0;
    if (!_108)
    {
        float _118 = _112 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2762 = as_type<float>(_120);
        out.gl_Position.z = _2762;
    }
    if (!_108)
    {
        return out;
    }
    float _124 = in.m_49.w;
    bool _126 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _128 = isnan(_124);
    bool _130 = _126 || _128;
    bool _132 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _134 = _130 || _132;
    float _136 = -_124;
    float _138 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _140 = _138;
    if (_134)
    {
        float _142 = float(_104);
        _114 = _142;
    }
    float _144 = _114;
    bool _146 = _138 >= _144;
    bool _148 = !_134;
    bool _150 = _146 || _148;
    float _152 = _144;
    if (_150)
    {
        _152 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _152;
    if (_150)
    {
        out.m_47.x = 0.0;
    }
    if (_150)
    {
        float _156 = _154 * 5.0;
        _122 = as_type<int>(_156);
    }
    int _158 = _122;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2832 = as_type<float>(_158);
        out.gl_Position.z = _2832;
    }
    if (_150)
    {
        return out;
    }
    float _160 = in.m_51.x;
    float _162 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _164 = _138 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _166 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _168 = _166 != 0;
    int _170 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _172 = _170 != 0;
    int _174 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _176 = _174 != 0;
    float _178 = _164 * _162;
    float _180 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[20].x, _178);
    float _182 = _180 * 6.283185482025146484375;
    float _184 = floor(_180);
    float _186 = _182 * 0.15915493667125701904296875;
    bool _188 = !_168;
    int _190 = _188 ? 0 : 1;
    int _192 = abs(_190);
    float _194 = _186 * 6.283185482025146484375;
    float _196 = cos(_194);
    bool _198 = !_176;
    int _200 = _198 ? 0 : 1;
    bool _202 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _204 = abs(_200);
    float _206 = -_184;
    float _208 = _180 + _206;
    bool _210 = !_172;
    int _212 = _210 ? 0 : 1;
    float _214 = float(_192);
    int _216 = abs(_212);
    float _218 = -_208;
    float _220 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _222 = _208 < 0.5;
    float _224 = float(_222);
    float _226 = fma(_196, 0.5, 0.5);
    float _228 = abs(_220);
    float _230 = _214 * _228;
    float _232 = float(_204);
    float _234 = -_224;
    float _236 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _238 = -_226;
    float _240 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _242 = float(_216);
    float _244 = fma(_232, _240, _230);
    float _246 = abs(_236);
    float _248 = fma(_242, _246, _244);
    bool _250 = !_202;
    float _266;
    if (!_250)
    {
        float _252 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _254 = _160 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _256 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[12].x, _138);
        float _258 = _256 * _252;
        float _260 = floor(_258);
        float _262 = -_260;
        float _264 = _258 + _262;
        _266 = _264;
        _268 = true;
    }
    else
    {
        float _270 = float(_104);
        float _272 = 1.0 / _270;
        float _274 = _138 * _272;
        _266 = _274;
    }
    _268 = false;
    float _276 = _266;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _280 = _276 + _278;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _284 = _276 + _282;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _288 = _276 + _286;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _292 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _290;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _296 = _294 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _298;
    float _302 = 1.0 / _292;
    bool _304 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _306 = 1.0 / _300;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _308;
    float _312 = 1.0 / _296;
    float _314 = _280 * _302;
    bool _316 = _276 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _318 = isnan(_276);
    bool _320 = _316 || _318;
    bool _322 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _324 = _320 || _322;
    float _326 = float(_324);
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _328;
    float _332 = fma(_310, _314, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _334 = fma(_330, _314, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _336 = _284 * _306;
    bool _338 = _276 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _340 = isnan(_276);
    bool _342 = _338 || _340;
    bool _344 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _346 = _342 || _344;
    float _348 = float(_346);
    float _350 = -_326;
    float _352 = _350 + 1.0;
    float _354 = _348 * _352;
    bool _356 = _276 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _358 = isnan(_276);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = _288 * _312;
    bool _370 = _276 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _372 = isnan(_276);
    bool _374 = _370 || _372;
    bool _376 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _378 = _374 || _376;
    float _380 = float(_378);
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _382;
    float _386 = -_348;
    float _388 = _386 + 1.0;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _392 = _390 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _394 = fma(_384, _314, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _396 = -_380;
    float _398 = _396 + 1.0;
    float _400 = _380 * _388;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _410 = _366 * _398;
    float _412 = -_366;
    float _414 = _412 + 1.0;
    float _416 = fma(_392, _368, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _418 = fma(_404, _368, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _420 = _332 * _410;
    float _422 = _334 * _410;
    float _424 = _394 * _410;
    float _426 = fma(_414, (*spvDescriptorSet0.vp_c9)._m0[143].x, _420);
    float _428 = fma(_414, (*spvDescriptorSet0.vp_c9)._m0[143].y, _422);
    float _430 = fma(_414, (*spvDescriptorSet0.vp_c9)._m0[143].z, _424);
    float _432 = fma(_408, _368, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _434;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _438;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _444 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _442;
    float _446 = fma(_416, _400, _426);
    float _448 = fma(_436, _336, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _450 = fma(_440, _336, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _452 = fma(_444, _336, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _454 = fma(_418, _400, _428);
    float _456 = fma(_432, _400, _430);
    float _458 = fma(_448, _354, _446);
    float _460 = fma(_450, _354, _454);
    float _462 = fma(_452, _354, _456);
    float _464 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[146].x, _458);
    float _466 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[146].y, _460);
    float _468 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[146].z, _462);
    bool _470 = !_304;
    float _486;
    if (!_470)
    {
        float _472 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _474 = _160 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _476 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[11].x, _138);
        float _478 = _476 * _472;
        float _480 = floor(_478);
        float _482 = -_480;
        float _484 = _478 + _482;
        _486 = _484;
        _488 = true;
    }
    else
    {
        float _490 = float(_104);
        float _492 = 1.0 / _490;
        float _494 = _138 * _492;
        _486 = _494;
    }
    _488 = false;
    float _496 = _486;
    float _498 = in.m_53.x;
    float _500 = in.m_53.y;
    float _502 = in.m_53.z;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _506 = _496 + _504;
    bool _508 = _496 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _510 = isnan(_496);
    bool _512 = _508 || _510;
    bool _514 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _516 = _512 || _514;
    float _518 = float(_516);
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _520;
    bool _524 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _526 = 1.0 / _522;
    float _528 = _466 * _500;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _532 = _530 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _534 = _468 * _502;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _538 = _496 + _536;
    float _540 = _506 * _526;
    float _542 = 1.0 / _532;
    bool _544 = _496 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _546 = isnan(_496);
    bool _548 = _544 || _546;
    bool _550 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _552 = _548 || _550;
    float _554 = float(_552);
    float _556 = -_518;
    float _558 = _556 + 1.0;
    bool _560 = _496 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _562 = isnan(_496);
    bool _564 = _560 || _562;
    bool _566 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _568 = _564 || _566;
    float _570 = float(_568);
    float _572 = _570 * _558;
    float _574 = -_570;
    float _576 = _574 + 1.0;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _578;
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _582;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _586;
    float _590 = _554 * _576;
    float _592 = fma(_580, _540, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _594 = fma(_584, _540, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _596 = fma(_588, _540, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _598 = _538 * _542;
    float _600 = _592 * _590;
    float _602 = _594 * _590;
    float _604 = _596 * _590;
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _608 = _606 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _612 = _610 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _614 = -_554;
    float _616 = _614 + 1.0;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _620 = _618 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _622 = fma(_608, _598, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _624 = fma(_612, _598, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _626 = fma(_616, (*spvDescriptorSet0.vp_c9)._m0[107].x, _600);
    float _628 = fma(_616, (*spvDescriptorSet0.vp_c9)._m0[107].y, _602);
    float _630 = fma(_620, _598, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _632 = fma(_616, (*spvDescriptorSet0.vp_c9)._m0[107].z, _604);
    float _634 = fma(_622, _572, _626);
    float _636 = fma(_624, _572, _628);
    float _638 = _464 * _498;
    float _640 = fma(_630, _572, _632);
    float _642 = fma(_518, (*spvDescriptorSet0.vp_c9)._m0[109].x, _634);
    float _644 = fma(_518, (*spvDescriptorSet0.vp_c9)._m0[109].y, _636);
    float _646 = fma(_518, (*spvDescriptorSet0.vp_c9)._m0[109].z, _640);
    bool _648 = !_524;
    float _664;
    if (!_648)
    {
        float _650 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _652 = _160 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _654 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[11].y, _138);
        float _656 = _654 * _650;
        float _658 = floor(_656);
        float _660 = -_658;
        float _662 = _656 + _660;
        _664 = _662;
        _666 = true;
    }
    else
    {
        float _668 = float(_104);
        float _670 = 1.0 / _668;
        float _672 = _138 * _670;
        _664 = _672;
    }
    _666 = false;
    float _674 = _664;
    float _676 = in.m_55.y;
    float _678 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _680 = log2(_678);
    float _682 = _160 * 2.0;
    float _684 = in.m_51.w;
    int _686 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _688 = _686 != 0;
    float _690 = in.m_44.x;
    float _692 = in.m_44.y;
    float _694 = in.m_44.z;
    int _696 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _698 = _696 != 0;
    int _700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _702 = _700 != 0;
    int _704 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _706 = _704 != 0;
    float _708 = floor(_682);
    int _710 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _712 = _710 != 0;
    float _714 = in.m_57.x;
    float _716 = in.m_57.y;
    float _718 = in.m_57.z;
    int _720 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _722 = _720 != 0;
    float _724 = in.m_51.y;
    float _726 = _680 * _138;
    float _728 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _730 = _728 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _732 = in.m_59.x;
    float _734 = in.m_59.y;
    float _736 = in.m_59.z;
    float _738 = 1.0 / _730;
    float _740 = in.m_61.x;
    float _742 = in.m_61.y;
    float _744 = in.m_61.z;
    float _746 = -_676;
    float _748 = _746 + 1.0;
    float _750 = in.m_55.x;
    bool _752 = _684 > 0.5;
    float _754 = exp2(_726);
    float _756 = in.m_51.z;
    int _758 = _752 ? as_type<int>(_748) : as_type<int>(_676);
    int _760 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _762 = _760 != 0;
    float _764 = _692 * _716;
    float _766 = _762 ? as_type<float>(_758) : _676;
    float _768 = fma(_690, _714, _764);
    bool _770 = _724 > 0.5;
    float _772 = _692 * _734;
    float _774 = _676;
    bool _776 = _712;
    int _778 = as_type<int>(_742);
    float _780 = _684;
    float _782 = _714;
    if (_712)
    {
        float _784 = _770 ? _748 : _676;
        _774 = _784;
    }
    float _786 = _774;
    if (_688)
    {
        bool _788 = _160 > 0.5;
        _776 = _788;
    }
    bool _790 = _776;
    float _792 = _692 * _742;
    float _794 = fma(_690, _732, _772);
    float _796 = -_754;
    float _798 = _796 + 1.0;
    bool _800 = _790;
    if (_688)
    {
        float _802 = -_750;
        float _804 = _802 + 1.0;
        _778 = as_type<int>(_804);
    }
    int _806 = _778;
    float _808 = fma(_690, _740, _792);
    if (!_688)
    {
        _780 = _750;
    }
    float _810 = _780;
    float _812 = fma(_694, _736, _794);
    float _814 = _756 * 2.0;
    float _816 = _810;
    if (_688)
    {
        float _818 = _790 ? as_type<float>(_806) : _750;
        _816 = _818;
    }
    float _820 = _816;
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _824 = 1.0 + _822;
    float _826 = fma(_694, _718, _768);
    float _828 = _724 * 2.0;
    float _830 = fma(_694, _744, _808);
    float _832 = _724 + _756;
    float _834 = 1.0 / _824;
    int _836 = 0;
    if (_722)
    {
        float _838 = -_750;
        float _840 = _838 + 1.0;
        _836 = as_type<int>(_840);
    }
    int _842 = _836;
    float _844 = _832 + (-1.0);
    if (_722)
    {
        bool _846 = _756 > 0.5;
        _800 = _846;
    }
    bool _848 = _800;
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _852 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _850;
    bool _854 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _856 = isnan(1.0);
    bool _858 = _854 || _856;
    bool _860 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _862 = _858 || _860;
    float _864 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _866 = floor(_814);
    if (!_722)
    {
        _782 = _750;
    }
    float _868 = _782;
    float _870 = _852 * _738;
    float _872 = _868;
    if (_722)
    {
        float _874 = _848 ? as_type<float>(_842) : _750;
        _872 = _874;
    }
    float _876 = _872;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _880 = _674 + _878;
    bool _882 = _674 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _884 = isnan(_674);
    bool _886 = _882 || _884;
    bool _888 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _890 = _886 || _888;
    float _892 = float(_890);
    float _894 = _160 + _756;
    bool _896 = _708 > 0.0;
    float _898 = floor(_828);
    bool _900 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _902 = isnan(0.0);
    bool _904 = _900 || _902;
    bool _906 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _908 = _904 || _906;
    float _910 = fma(_870, _880, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _912 = _674 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _914 = isnan(_674);
    bool _916 = _912 || _914;
    bool _918 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _920 = _916 || _918;
    float _922 = float(_920);
    float _924 = -_892;
    float _926 = _924 + 1.0;
    bool _928 = _708 >= 0.0;
    bool _930 = isnan(_708);
    bool _932 = _928 || _930;
    bool _934 = isnan(0.0);
    bool _936 = _932 || _934;
    float _938 = _894 + (-1.0);
    float _940 = _908 ? _798 : 0.0;
    float _942 = _922 * _926;
    float _944 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _946 = _936 ? 0 : 1;
    if (_862)
    {
        float _948 = _940 * _834;
        _140 = _948;
    }
    float _950 = _140;
    bool _952 = _866 > 0.0;
    float _954 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _956 = _910 * _942;
    bool _958 = _898 > 0.0;
    float _960 = -_922;
    float _962 = _960 + 1.0;
    bool _964 = _898 >= 0.0;
    bool _966 = isnan(_898);
    bool _968 = _964 || _966;
    bool _970 = isnan(0.0);
    bool _972 = _968 || _970;
    float _974 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _976 = ~_946;
    int _978 = _976 + 1;
    int _980 = _978 + 1;
    float _982 = fma(_962, (*spvDescriptorSet0.vp_c9)._m0[115].x, _956);
    int _984 = _980;
    if (!_896)
    {
        int _986 = ~_946;
        int _988 = _986 + 1;
        _984 = _988;
    }
    int _990 = _984;
    float _992 = _820 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _994 = !_702;
    int _996 = _994 ? 0 : 1;
    float _998 = fma(_892, (*spvDescriptorSet0.vp_c9)._m0[116].x, _982);
    bool _1000 = _866 >= 0.0;
    bool _1002 = isnan(_866);
    bool _1004 = _1000 || _1002;
    bool _1006 = isnan(0.0);
    bool _1008 = _1004 || _1006;
    float _1010 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1012 = abs(_996);
    float _1014 = _756 + (-0.5);
    int _1016 = _1008 ? 0 : 1;
    float _1018 = float(_1012);
    int _1020 = ~_1016;
    int _1022 = _1020 + 1;
    int _1024 = _1022 + 1;
    float _1026 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1028 = _1024;
    if (!_952)
    {
        int _1030 = ~_1016;
        int _1032 = _1030 + 1;
        _1028 = _1032;
    }
    int _1034 = _1028;
    float _1036 = _766 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1038 = float(_990);
    float _1040 = _786 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _1042 = _972 ? 0 : 1;
    float _1044 = _1036 * _944;
    bool _1046 = !_706;
    int _1048 = _1046 ? 0 : 1;
    float _1050 = _1018 * _1038;
    float _1052 = _1040 * _974;
    int _1054 = ~_1042;
    int _1056 = _1054 + 1;
    int _1058 = _1056 + 1;
    float _1060 = in.m_63.x;
    float _1062 = in.m_63.y;
    float _1064 = in.m_63.z;
    int _1066 = _1058;
    if (!_958)
    {
        int _1068 = ~_1042;
        int _1070 = _1068 + 1;
        _1066 = _1070;
    }
    int _1072 = _1066;
    float _1074 = _876 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _1076 = !_698;
    int _1078 = _1076 ? 0 : 1;
    float _1080 = _992 * _1010;
    int _1082 = abs(_1048);
    float _1084 = _812 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1086 = abs(_1078);
    float _1088 = _1074 * _1026;
    float _1090 = _826 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1092 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1094 = _1084 + _1092;
    float _1096 = float(_1072);
    out.m_65.x = _1080;
    out.m_65.y = _1052;
    out.m_65.z = _1088;
    out.m_65.w = _1044;
    float _1098 = float(_1082);
    float _1100 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1102 = _1090 + _1100;
    float _1104 = float(_1034);
    float _1106 = _830 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1108 = _1094 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1110 = _1098 * _1096;
    float _1112 = _724 + (-0.5);
    float _1114 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1116 = _1106 + _1114;
    float _1118 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1108);
    float _1120 = _1050 * (-2.0);
    float _1122 = _1110 * (-2.0);
    float _1124 = float(_1086);
    float _1126 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1118);
    float _1128 = fma(_1120, _1062, _1062);
    float _1130 = _1094 * _1094;
    float _1132 = fma(_864, _1120, _864);
    float _1134 = fma(_1112, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1128);
    bool _1136 = _1126 >= 0.0;
    float _1138 = fma(_1102, _1102, _1130);
    float _1140 = fma(_1132, _950, _1134);
    float _1142 = _642 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1144 = fma(_1116, _1116, _1138);
    float _1146 = _1124 * _1104;
    float _1148 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1150 = fma(_1122, _1064, _1064);
    float _1152 = rsqrt(_1144);
    float _1154 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1156 = (*spvDescriptorSet0.vp_c9)._m0[123].z;
    int _1158 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1160 = _1090;
    if (_1136)
    {
        _1156 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1162 = _1156;
    float _1164 = fma(_954, _1122, _954);
    float _1166 = _644 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1168 = _646 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1170 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1172 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    if (_1136)
    {
        float _1174 = _1162 * 5.0;
        _1158 = as_type<int>(_1174);
    }
    int _1176 = _1158;
    float _1178 = _1142 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1180 = _1166 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1182 = _1168 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1184 = _1148 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1186 = _1170 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1188 = _1154 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1190 = _998 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1192 = fma(_1014, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1150);
    if (_1136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4441 = as_type<float>(_1176);
        out.gl_Position.z = _4441;
    }
    float _1194 = _1094 * _1152;
    float _1196 = _1102 * _1152;
    float _1198 = fma(_1164, _950, _1192);
    out.m_67.x = _1184;
    out.m_67.y = _1186;
    out.m_67.z = _1188;
    out.m_67.w = _1172;
    float _1200 = _1140 * 0.15915493667125701904296875;
    out.m_69.x = _1178;
    out.m_69.y = _1180;
    out.m_69.z = _1182;
    out.m_69.w = _1190;
    float _1202 = _1198;
    if (_1136)
    {
        out.m_47.x = 0.0;
    }
    if (_1136)
    {
        return out;
    }
    float _1204 = -_1194;
    float _1206 = fma(_1204, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1084);
    float _1208 = _1116 * _1152;
    float _1210 = -_1196;
    float _1212 = fma(_1210, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1090);
    float _1214 = _160 + _724;
    float _1216 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1218 = _1206 + _1216;
    float _1220 = -_1208;
    float _1222 = fma(_1220, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1106);
    float _1224 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1226 = _1212 + _1224;
    float _1228 = _1214 + (-1.0);
    float _1230 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1232 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1234 = _1222 + _1232;
    float _1236 = _1146 * (-2.0);
    float _1238 = fma(_1228, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1240 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1230);
    float _1242 = _160 + (-0.5);
    float _1244 = fma(_1236, _1060, _1060);
    float _1246 = -_1194;
    float _1248 = fma(_1246, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1094);
    float _1250 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1240);
    float _1252 = fma(_1238, _1236, _1238);
    float _1254 = fma(_1242, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1244);
    float _1256 = -_1196;
    float _1258 = fma(_1256, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1102);
    float _1260 = _1248 * _1248;
    bool _1262 = _1250 >= 0.0;
    float _1264 = fma(_1252, _950, _1254);
    float _1266 = -_1208;
    float _1268 = fma(_1266, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1116);
    float _1270 = fma(_1258, _1258, _1260);
    float _1272 = _1198 * 0.15915493667125701904296875;
    float _1274 = _1264 * 0.15915493667125701904296875;
    float _1276 = _1200 * 6.283185482025146484375;
    float _1278 = sin(_1276);
    float _1280 = fma(_1268, _1268, _1270);
    if (_1262)
    {
        _1202 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1282 = _1202;
    float _1284 = _1200 * 6.283185482025146484375;
    float _1286 = cos(_1284);
    int _1288 = as_type<int>(_1282);
    if (_1262)
    {
        out.m_47.x = 0.0;
    }
    if (_1262)
    {
        float _1290 = _1282 * 5.0;
        _1288 = as_type<int>(_1290);
    }
    int _1292 = _1288;
    float _1294 = _1272 * 6.283185482025146484375;
    float _1296 = sin(_1294);
    if (_1262)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4644 = as_type<float>(_1292);
        out.gl_Position.z = _4644;
    }
    float _1298 = _1272 * 6.283185482025146484375;
    float _1300 = cos(_1298);
    float _1302 = _1274 * 6.283185482025146484375;
    float _1304 = sin(_1302);
    float _1306 = sqrt(_1280);
    if (_1262)
    {
        return out;
    }
    float _1308 = -_1084;
    float _1310 = _1308 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1312 = -_1090;
    float _1314 = _1312 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1316 = _1274 * 6.283185482025146484375;
    float _1318 = cos(_1316);
    float _1320 = -_1106;
    float _1322 = _1320 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1324 = _1310 * _1310;
    float _1326 = _1286 * _1300;
    float _1328 = _1278 * _1296;
    float _1330 = _1152 * _1306;
    float _1332 = fma(_1314, _1314, _1324);
    float _1334 = _1286 * _1296;
    float _1336 = fma(_1304, _1328, _1326);
    float _1338 = fma(_1304, _1326, _1328);
    float _1340 = fma(_1322, _1322, _1332);
    float _1342 = _1278 * _1300;
    float _1344 = _638 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1346 = 0.0 + (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _1348 = precise::clamp(_1346, 0.0, 1.0);
    float _1350 = rsqrt(_1340);
    float _1352 = _1296 * _1318;
    float _1354 = _1300 * _1318;
    float _1356 = _1278 * _1318;
    float _1358 = _1286 * _1318;
    float _1360 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1362 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _1360;
    float _1364 = in.m_71.x;
    float _1366 = in.m_71.y;
    float _1368 = in.m_71.z;
    float _1370 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1372 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _1370;
    float _1374 = _1362 * _1362;
    float _1376 = -_1342;
    float _1378 = fma(_1304, _1334, _1376);
    float _1380 = -_1334;
    float _1382 = fma(_1304, _1342, _1380);
    float _1384 = _1330 * _1344;
    float _1386 = fma(_1348, -0.64999997615814208984375, 1.0);
    float _1388 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1390 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _1388;
    float _1392 = _1314 * _1350;
    float _1394 = _1322 * _1350;
    float _1396 = _1310 * _1350;
    float _1398 = fma(_1372, _1372, _1374);
    float _1400 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1402 = _1392 * _1400;
    float _1404 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1406 = _1394 * _1404;
    float _1408 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1410 = _1396 * _1408;
    float _1412 = fma(_1390, _1390, _1398);
    float _1414 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1416 = -_1402;
    float _1418 = fma(_1394, _1414, _1416);
    float _1420 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1422 = -_1406;
    float _1424 = fma(_1396, _1420, _1422);
    float _1426 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1428 = -_1410;
    float _1430 = fma(_1392, _1426, _1428);
    float _1432 = _528 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1434 = _1418 * _1418;
    float _1436 = rsqrt(_1412);
    float _1438 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1364);
    float _1440 = _1330 * _1432;
    float _1442 = fma(_1424, _1424, _1434);
    float _1444 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1366);
    float _1446 = _1438 * _1384;
    float _1448 = _534 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1450 = fma(_1430, _1430, _1442);
    float _1452 = sqrt(_1412);
    float _1454 = _1444 * _1440;
    float _1456 = _1330 * _1448;
    float _1458 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1368);
    bool _1460 = _1366 != 0.0;
    bool _1462 = isnan(_1366);
    bool _1464 = _1460 || _1462;
    bool _1466 = isnan(0.0);
    bool _1468 = _1464 || _1466;
    float _1470 = _1354 * _1454;
    float _1472 = _1338 * _1454;
    float _1474 = _1458 * _1456;
    float _1476 = rsqrt(_1450);
    float _1478 = _1382 * _1454;
    float _1480 = _1436 * (-0.20000000298023223876953125);
    float _1482 = fma(_1352, _1446, _1470);
    float _1484 = fma(_1378, _1446, _1472);
    float _1486 = fma(_1336, _1446, _1478);
    float _1488 = fma(_1372, _1480, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    bool _1490 = _1364 == 0.0;
    bool _1492 = !_1468;
    bool _1494 = _1490 && _1492;
    float _1496 = _1452 * 0.066666670143604278564453125;
    float _1498 = fma(_1356, _1474, _1486);
    float _1500 = fma(_1362, _1480, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _1502 = -_1304;
    float _1504 = fma(_1502, _1474, _1482);
    float _1506 = fma(_1358, _1474, _1484);
    float _1508 = fma(_1390, _1480, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _1510 = -_1500;
    float _1512 = _1510 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1514 = precise::max(_1496, 1.0);
    float _1516 = _1430 * _1476;
    float _1518 = _1418 * _1476;
    float _1520 = _1424 * _1476;
    float _1522 = _1512 * _1512;
    float _1524 = _1392 * _1516;
    float _1526 = _1394 * _1518;
    float _1528 = precise::min(_1514, 2.0);
    float _1530 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1532 = _1500 + _1530;
    float _1534 = -_1524;
    float _1536 = fma(_1394, _1520, _1534);
    float _1538 = _1396 * _1520;
    float _1540 = -_1526;
    float _1542 = fma(_1396, _1516, _1540);
    float _1544 = _1528 * _1386;
    float _1546 = _1536 * _1504;
    float _1548 = -_1538;
    float _1550 = fma(_1392, _1518, _1548);
    float _1552 = _1542 * _1504;
    float _1554 = -_1488;
    float _1556 = _1554 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1558 = fma(_1518, _1498, _1546);
    float _1560 = _1550 * _1504;
    float _1562 = fma(_1520, _1498, _1552);
    bool _1564 = _1368 == 0.0;
    bool _1566 = _1564 && _1494;
    float _1568 = fma(_1396, _1506, _1558);
    float _1570 = fma(_1516, _1498, _1560);
    float _1572 = fma(_1392, _1506, _1562);
    float _1574 = fma(_1556, _1556, _1522);
    float _1576 = _1084 + _1568;
    float _1578 = -_1508;
    float _1580 = _1578 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1582 = _1090 + _1572;
    float _1584 = in.m_73.x;
    float _1586 = in.m_73.y;
    float _1588 = in.m_73.z;
    float _1590 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1592 = _1576 + _1590;
    float _1594 = fma(_1394, _1506, _1570);
    float _1596 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1598 = _1582 + _1596;
    float _1600 = fma(_1580, _1580, _1574);
    float _1602 = fma(_1592, _1544, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _1604 = _1106 + _1594;
    float _1606 = fma(_1598, _1544, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _1608 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1610 = _1488 + _1608;
    float _1612 = -_1602;
    float _1614 = _1612 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1616 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1618 = _1604 + _1616;
    float _1620 = -_1606;
    float _1622 = _1620 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1624 = _1532 * _1532;
    float _1626 = _1614 * _1614;
    float _1628 = fma(_1618, _1544, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _1630 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1632 = _1508 + _1630;
    float _1634 = fma(_1610, _1610, _1624);
    float _1636 = fma(_1622, _1622, _1626);
    float _1638 = -_1628;
    float _1640 = _1638 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1642 = in.m_75.x;
    float _1644 = in.m_75.y;
    float _1646 = in.m_75.z;
    float _1648 = in.m_75.w;
    float _1650 = fma(_1632, _1632, _1634);
    float _1652 = sqrt(_1600);
    float _1654 = fma(_1640, _1640, _1636);
    float _1656 = _1352 * _1536;
    float _1658 = _1636;
    float _1660 = _1634;
    float _1662 = _1640;
    float _1664 = _1584;
    float _1666 = _1338;
    if (_1566)
    {
        _1658 = _1584;
    }
    float _1668 = _1658;
    float _1670 = _1352 * _1550;
    float _1672 = _1668;
    if (_1566)
    {
        _1660 = _1588;
    }
    float _1674 = _1660;
    float _1676 = _1674;
    if (!_1566)
    {
        float _1678 = fma(_1368, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1588);
        _1676 = _1678;
    }
    float _1680 = _1676;
    if (_1566)
    {
        _1662 = _1668;
    }
    float _1682 = _1662;
    float _1684 = sqrt(_1654);
    float _1686 = _1682;
    if (!_1566)
    {
        _1672 = _1584;
    }
    float _1688 = _1672;
    float _1690 = fma(_1336, _1516, _1670);
    if (_1566)
    {
        _1664 = _1586;
    }
    float _1692 = _1664;
    float _1694 = _1692;
    if (!_1566)
    {
        float _1696 = fma(_1366, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1586);
        _1694 = _1696;
    }
    float _1698 = _1694;
    if (!_1566)
    {
        float _1700 = fma(_1364, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1688);
        _1686 = _1700;
    }
    float _1702 = _1686;
    float _1704 = rsqrt(_1650);
    float _1706 = _1646 * _1688;
    float _1708 = _1644 * _1588;
    float _1710 = -_1652;
    float _1712 = _1684 + _1710;
    float _1714 = _1642 * _1586;
    float _1716 = -_1706;
    float _1718 = fma(_1642, _1588, _1716);
    float _1720 = -_1708;
    float _1722 = fma(_1646, _1586, _1720);
    float _1724 = _1354 * _1550;
    float _1726 = -_1714;
    float _1728 = fma(_1644, _1688, _1726);
    float _1730 = _1718 * _1648;
    float _1732 = _1722 * _1648;
    float _1734 = _1704 * _1712;
    float _1736 = _1728 * _1648;
    float _1738 = _1352 * _1542;
    float _1740 = _1354 * _1542;
    float _1742 = -_1734;
    float _1744 = fma(_1610, _1742, _1606);
    float _1746 = -_1734;
    float _1748 = fma(_1632, _1746, _1628);
    float _1750 = _1354 * _1536;
    float _1752 = -_1542;
    float _1754 = _1304 * _1752;
    float _1756 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1758 = _1744 + _1756;
    float _1760 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1762 = _1748 + _1760;
    float _1764 = -_1536;
    float _1766 = _1304 * _1764;
    float _1768 = -_1550;
    float _1770 = _1304 * _1768;
    float _1772 = _1758 * _1758;
    float _1774 = _1762 * _1762;
    float _1776 = fma(_1382, _1520, _1740);
    float _1778 = fma(_1382, _1518, _1750);
    float _1780 = fma(_1382, _1516, _1724);
    float _1782 = _1772 + _1774;
    float _1784 = fma(_1336, _1520, _1738);
    float _1786 = fma(_1336, _1518, _1656);
    float _1788 = fma(_1356, _1516, _1770);
    float _1790 = sqrt(_1782);
    float _1792 = fma(_1356, _1520, _1754);
    float _1794 = fma(_1356, _1518, _1766);
    float _1796 = fma(_1338, _1392, _1776);
    float _1798 = fma(_1338, _1396, _1778);
    float _1800 = fma(_1338, _1394, _1780);
    float _1802 = fma(_1378, _1392, _1784);
    float _1804 = fma(_1378, _1396, _1786);
    float _1806 = fma(_1378, _1394, _1690);
    float _1808 = fma(_1358, _1394, _1788);
    float _1810 = fma(_1358, _1392, _1792);
    float _1812 = fma(_1358, _1396, _1794);
    float _1814 = _1796 * _1644;
    float _1816 = _1798 * _1644;
    float _1818 = _1800 * _1644;
    float _1820 = _1796 * _1698;
    bool _1822 = _1790 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1824 = _1730 * _1796;
    float _1826 = _1798 * _1698;
    float _1828 = _1730 * _1798;
    float _1830 = _1800 * _1698;
    float _1832 = _1730 * _1800;
    float _1834 = -_1734;
    float _1836 = fma(_1532, _1834, _1602);
    float _1838 = _1836;
    float _1840 = _1772;
    float _1842 = _1774;
    float _1844 = _1748;
    float _1846 = _1736;
    if (!_1822)
    {
        _1666 = _1744;
    }
    float _1848 = _1666;
    bool _1850 = !_1822;
    float _1852 = _1848;
    if (!_1850)
    {
        float _1854 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1856 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1858 = _1790 + _1856;
        float _1860 = rsqrt(_1782);
        float _1862 = _1858 * _1854;
        float _1864 = _1836 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1866 = _1862 * 0.15915493667125701904296875;
        float _1868 = _1866 * 6.283185482025146484375;
        float _1870 = sin(_1868);
        float _1872 = _1866 * 6.283185482025146484375;
        float _1874 = cos(_1872);
        float _1876 = fma(_1870, _1864, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1878 = _1860 * _1876;
        float _1880 = fma(_1758, _1878, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1882 = _1874 + (-1.0);
        float _1884 = fma(_1762, _1878, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1886 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1888 = _1880 + _1886;
        float _1890 = _1882 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1892 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1894 = _1884 + _1892;
        float _1896 = _1888 * _1888;
        float _1898 = fma(_1836, _1874, _1890);
        float _1900 = _1894 * _1894;
        _1838 = _1898;
        _1840 = _1896;
        _1842 = _1900;
        _1852 = _1880;
        _1844 = _1884;
    }
    float _1902 = _1838;
    float _1904 = _1840;
    float _1906 = _1842;
    float _1908 = _1852;
    float _1910 = _1844;
    float _1912 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1914 = _1902 + _1912;
    float _1916 = fma(_1802, _1702, _1820);
    float _1918 = fma(_1802, _1642, _1814);
    float _1920 = fma(_1804, _1642, _1816);
    float _1922 = fma(_1914, _1914, _1904);
    float _1924 = fma(_1804, _1702, _1826);
    float _1926 = fma(_1806, _1702, _1830);
    float _1928 = fma(_1732, _1802, _1824);
    float _1930 = _1922 + _1906;
    float _1932 = fma(_1806, _1642, _1818);
    float _1934 = fma(_1732, _1804, _1828);
    float _1936 = fma(_1732, _1806, _1832);
    float _1938 = fma(_1810, _1646, _1918);
    float _1940 = fma(_1812, _1646, _1920);
    float _1942 = sqrt(_1930);
    float _1944 = fma(_1810, _1680, _1916);
    float _1946 = fma(_1736, _1810, _1928);
    float _1948 = fma(_1812, _1680, _1924);
    float _1950 = fma(_1736, _1812, _1934);
    float _1952 = fma(_1736, _1808, _1936);
    float _1954 = fma(_1808, _1680, _1926);
    float _1956 = fma(_1808, _1646, _1932);
    out.m_69.x = _1178;
    out.m_69.y = _1180;
    out.m_69.z = _1182;
    out.m_69.w = _1190;
    out.m_67.x = _1184;
    out.m_67.y = _1186;
    out.m_67.z = _1188;
    out.m_67.w = _1172;
    out.m_77.x = _1946;
    out.m_77.y = _1950;
    out.m_77.z = _1952;
    bool _1958 = _1942 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1960 = isnan(_1942);
    bool _1962 = _1958 || _1960;
    bool _1964 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1966 = _1962 || _1964;
    out.m_79.x = _1944;
    out.m_79.y = _1948;
    out.m_79.z = _1954;
    out.m_81.x = _1938;
    out.m_81.y = _1940;
    out.m_81.z = _1956;
    float _1968 = _1956;
    float _1970 = _1946;
    float _1972 = _1950;
    if (!_1966)
    {
        _1846 = 1.0;
    }
    float _1974 = _1846;
    bool _1976 = !_1966;
    float _1978 = _1974;
    if (!_1976)
    {
        bool _1980 = _1942 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1982 = isnan(_1942);
        bool _1984 = _1980 || _1982;
        bool _1986 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1988 = _1984 || _1986;
        if (!_1988)
        {
            float _1990 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1992 = _1942 + _1990;
            float _1994 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1996 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1994;
            float _1998 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2000 = _1998 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2002 = 1.0 / _1996;
            float _2004 = _1992 * _2002;
            float _2006 = fma(_2004, _2000, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1978 = _2006;
            _2008 = true;
        }
        else
        {
            bool _2010 = _1942 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2012 = isnan(_1942);
            bool _2014 = _2010 || _2012;
            bool _2016 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2018 = _2014 || _2016;
            if (!_2018)
            {
                float _2020 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2022 = _1942 + _2020;
                float _2024 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2026 = _2024 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2028 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2030 = _2028 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2032 = 1.0 / _2026;
                float _2034 = _2022 * _2032;
                float _2036 = fma(_2034, _2030, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1978 = _2036;
                _2008 = true;
            }
            else
            {
                _1978 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2008 = false;
    float _2038 = _1978;
    float _2040 = _1206 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2042 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2044 = _1908 + _2042;
    float _2046 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2040);
    float _2048 = _1206 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2050 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2052 = _1902 + _2050;
    float _2054 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2046);
    bool _2056 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2058 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2060 = _2056 || _2058;
    bool _2062 = isnan(0.5);
    bool _2064 = _2060 || _2062;
    float _2066 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2068 = _1910 + _2066;
    bool _2070 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2072 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2074 = _2070 || _2072;
    bool _2076 = isnan(0.5);
    bool _2078 = _2074 || _2076;
    float _2080 = _2054 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2082 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2048);
    float _2084 = fma(_2052, _2038, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2086 = fma(_2068, _2038, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2088 = 1.0 / _2080;
    float _2090 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2082);
    float _2092 = _2090 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2094 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_2078)
    {
        _2094 = 1.0;
    }
    float _2096 = _2094;
    float _2098 = _2092 + _2080;
    float _2100 = -_1194;
    float _2102 = fma(_2100, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2084);
    float _2104 = _2098 * _2088;
    float _2106 = _2104 * 0.5;
    float _2108 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2110 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2108);
    float _2112 = fma(_2044, _2038, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2114 = -_1208;
    float _2116 = fma(_2114, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2086);
    float _2118 = 1.0 / _2110;
    float _2120 = -_1196;
    float _2122 = fma(_2120, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2112);
    float _2124 = _2102;
    float _2126 = _2122;
    float _2128 = _2116;
    float _2130 = _2112;
    float _2132 = _2096;
    if (!_2064)
    {
        float _2134 = _1218 * _1218;
        float _2136 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2138 = -_1106;
        float _2140 = _2138 + _2086;
        float _2142 = -_1084;
        float _2144 = _2142 + _2084;
        float _2146 = fma(_1226, _1226, _2134);
        float _2148 = fma(_1234, _1234, _2146);
        float _2150 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2152 = sqrt(_2148);
        float _2154 = 1.0 / _1330;
        float _2156 = precise::min(_2152, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2158 = _2156 * _2136;
        float _2160 = _2150 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2162 = _2158 * _2154;
        float _2164 = -_1090;
        float _2166 = _2164 + _2112;
        float _2168 = _2160 * _2162;
        float _2170 = _2140 * _2162;
        float _2172 = fma(_2166, _2168, _1212);
        float _2174 = fma(_2144, _2168, _1206);
        float _2176 = fma(_2160, _2170, _1222);
        _2124 = _2174;
        _2126 = _2172;
        _2128 = _2176;
    }
    float _2178 = _2124;
    float _2180 = _2126;
    float _2182 = _2128;
    if (_2078)
    {
        _2130 = 1.0;
    }
    float _2184 = _2130;
    float _2186 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2188 = _2118 * _2186;
    float _2190 = _2184;
    if (!_2078)
    {
        float _2192 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2194 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2196 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2194;
        float _2198 = _2192 * 0.15915493667125701904296875;
        float _2200 = _2198 * 6.283185482025146484375;
        float _2202 = cos(_2200);
        float _2204 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2206 = _2204 * 0.15915493667125701904296875;
        float _2208 = _2198 * 6.283185482025146484375;
        float _2210 = sin(_2208);
        float _2212 = 1.0 / _2202;
        float _2214 = _2206 * 6.283185482025146484375;
        float _2216 = cos(_2214);
        float _2218 = _2210 * _2212;
        float _2220 = _2206 * 6.283185482025146484375;
        float _2222 = sin(_2220);
        float _2224 = _2216 * _2218;
        float _2226 = 1.0 / _2196;
        float _2228 = 1.0 / _2224;
        float _2230 = _2222 * _2228;
        float _2232 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2234 = fma(_2188, _2230, _2232);
        float _2236 = _2234 * _2226;
        float _2238 = precise::clamp(_2236, 0.0, 1.0);
        _1968 = _2226;
        _2132 = _2238;
    }
    float _2240 = _1968;
    float _2242 = _2132;
    float _2244 = _2240;
    if (!_2078)
    {
        float _2246 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2248 = _2246 * 0.15915493667125701904296875;
        float _2250 = _2248 * 6.283185482025146484375;
        float _2252 = cos(_2250);
        float _2254 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2256 = _2254 * 0.15915493667125701904296875;
        float _2258 = _2248 * 6.283185482025146484375;
        float _2260 = sin(_2258);
        float _2262 = 1.0 / _2252;
        float _2264 = _2256 * 6.283185482025146484375;
        float _2266 = cos(_2264);
        float _2268 = _2260 * _2262;
        float _2270 = _2256 * 6.283185482025146484375;
        float _2272 = sin(_2270);
        float _2274 = _2266 * _2268;
        float _2276 = 1.0 / _2274;
        float _2278 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2280 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2278;
        float _2282 = 1.0 / _2280;
        float _2284 = _2272 * _2276;
        float _2286 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2288 = fma(_2188, _2284, _2286);
        float _2290 = _2288 * _2282;
        float _2292 = precise::clamp(_2290, 0.0, 1.0);
        float _2294 = -_2292;
        float _2296 = _2294 + 1.0;
        _2244 = _2252;
        _2190 = _2296;
    }
    float _2298 = _2244;
    float _2300 = _2190;
    float _2302 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2304 = _2178 + _2302;
    float _2306 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2308 = _2180 + _2306;
    float _2310 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2312 = _2182 + _2310;
    float _2314 = _2304 * _2304;
    float _2316 = fma(_2308, _2308, _2314);
    float _2318 = fma(_2312, _2312, _2316);
    float _2320 = rsqrt(_2318);
    float _2322 = _2320 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2324 = _2308 * _2322;
    float _2326 = _2312 * _2322;
    float _2328 = _2324 * _2324;
    float _2330 = _2326 * _2326;
    float _2332 = _2328 + _2330;
    float _2334 = sqrt(_2332);
    bool _2336 = _2334 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2338 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2340 = _2334 + _2338;
    float _2342 = _2312;
    float _2344 = _2332;
    float _2346 = _2340;
    float _2348 = _2324;
    if (_2336)
    {
        float _2350 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2342 = _2350;
    }
    float _2352 = _2342;
    if (_2336)
    {
        float _2354 = rsqrt(_2332);
        _2344 = _2354;
    }
    float _2356 = _2344;
    float _2358 = _2356;
    if (_2336)
    {
        float _2360 = _2340 * _2352;
        _2346 = _2360;
    }
    float _2362 = _2346;
    if (_2336)
    {
        float _2364 = _2362 * 0.15915493667125701904296875;
        _1970 = _2364;
    }
    float _2366 = _1970;
    float _2368 = _2320;
    if (_2336)
    {
        float _2370 = _2366 * 6.283185482025146484375;
        float _2372 = sin(_2370);
        _2368 = _2372;
    }
    float _2374 = _2368;
    float _2376 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2378 = precise::max(0.0, _2376);
    float _2380 = _2298;
    float _2382 = _2378;
    float _2384 = _2376;
    if (_2336)
    {
        float _2386 = _2366 * 6.283185482025146484375;
        float _2388 = cos(_2386);
        _2380 = _2388;
    }
    float _2390 = _2380;
    float _2392 = -_2322;
    float _2394 = -_2378;
    float _2396 = fma(_2304, _2392, _2394);
    if (_2336)
    {
        float _2398 = _2396 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2382 = _2398;
    }
    float _2400 = _2382;
    float _2402 = sqrt(_2318);
    float _2404 = _2178 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2406 = _2374;
    float _2408 = _2400;
    if (_2336)
    {
        float _2410 = fma(_2374, _2400, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2406 = _2410;
    }
    float _2412 = _2406;
    float _2414 = _2412;
    if (!_2336)
    {
        _2408 = _2326;
    }
    float _2416 = _2408;
    float _2418 = _2416;
    if (_2336)
    {
        float _2420 = _2390 + (-1.0);
        _2384 = _2420;
    }
    float _2422 = _2384;
    float _2424 = _2422;
    if (_2336)
    {
        float _2426 = _2356 * _2412;
        _1160 = _2426;
    }
    float _2428 = _1160;
    if (!_2336)
    {
        _2414 = _2396;
    }
    float _2430 = _2414;
    float _2432 = _2430;
    if (_2336)
    {
        float _2434 = _2422 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1972 = _2434;
    }
    float _2436 = _1972;
    if (_2336)
    {
        float _2438 = _2324 * _2428;
        _2348 = _2438;
    }
    float _2440 = _2348;
    if (!_2336)
    {
        _2358 = _2328;
    }
    float _2442 = _2358;
    float _2444 = _2442;
    if (_2336)
    {
        float _2446 = _2326 * _2428;
        _2418 = _2446;
    }
    float _2448 = _2418;
    if (_2336)
    {
        float _2450 = fma(_2396, _2390, _2436);
        _2432 = _2450;
    }
    float _2452 = _2432;
    if (_2336)
    {
        float _2454 = _2440 * _2440;
        _2444 = _2454;
    }
    float _2456 = _2444;
    if (!_2336)
    {
        _2424 = _2330;
    }
    float _2458 = _2424;
    float _2460 = _2458;
    if (_2336)
    {
        float _2462 = _2448 * _2448;
        _2460 = _2462;
    }
    float _2464 = _2460;
    float _2466 = fma(_2452, _2452, _2456);
    float _2468 = _2466 + _2464;
    float _2470 = _2178 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2472 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2474 = fma(_2402, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2472);
    float _2476 = precise::clamp(_2474, 0.0, 1.0);
    float _2478 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2480 = rsqrt(_2468);
    float _2482 = fma(_2180, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2470);
    float _2484 = _2178 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2486 = -_2476;
    float _2488 = _2486 + 1.0;
    float _2490 = _2178 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2492 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2482);
    float _2494 = fma(_2180, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2484);
    float _2496 = fma(_2180, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2490);
    float _2498 = _2492 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2500 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2494);
    float _2502 = abs(_2488);
    float _2504 = log2(_2502);
    float _2506 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2496);
    float _2508 = fma(_2180, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2404);
    float _2510 = _2500 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2512 = _2498 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2514 = _2480 * _2440;
    float _2516 = _2506 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2518 = _2510 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2520 = _2480 * _2452;
    float _2522 = _2514 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2524 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2508);
    float _2526 = fma(_2516, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2518);
    float _2528 = _2480 * _2448;
    float _2530 = -_2522;
    float _2532 = fma(_2520, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2530);
    float _2534 = _2524 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2536 = fma(_2498, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2526);
    float _2538 = _2504 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2540 = -_2528;
    float _2542 = fma(_2540, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2532);
    float _2544 = -_2512;
    float _2546 = fma(_2544, _2478, 1.0);
    float _2548 = fma(_2534, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2536);
    float _2550 = _2510 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2552 = fma(_2542, -0.5, 0.5);
    float _2554 = exp2(_2538);
    float _2556 = _2510 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2558 = fma(_2516, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2550);
    float _2560 = fma(_2542, 0.5, 0.5);
    float _2562 = _2520 + 1.0;
    float _2564 = fma(_2516, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2556);
    float _2566 = fma(_2498, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2558);
    float _2568 = fma(_2560, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2570 = log2(_2546);
    float _2572 = fma(_2498, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2564);
    float _2574 = fma(_2560, _2568, -0.212114393711090087890625);
    float _2576 = fma(_2560, _2574, 1.570728778839111328125);
    float _2578 = 1.0 / _2548;
    float _2580 = -_2520;
    float _2582 = fma(_2554, _2562, _2580);
    float _2584 = fma(_2534, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2566);
    float _2586 = fma(_2534, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2572);
    float _2588 = fma(_2582, 0.5, 0.5);
    float _2590 = sqrt(_2552);
    float _2592 = _2570 * 0.693147182464599609375;
    float _2594 = _2592 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2596 = _2584 * _2578;
    float _2598 = _2586 * _2578;
    float _2600 = fma(_2596, 0.5, 0.5);
    float _2602 = fma(_2598, -0.5, 0.5);
    float _2604 = _2590 * 0.636619746685028076171875;
    float _2606 = -_2576;
    float _2608 = fma(_2604, _2606, 1.0);
    float3 _6752 = float3(_2600, _2602, _2594);
    float _2610 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6752, float3(0.0), isnan(_6752)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6752, float3(0.0), isnan(_6752)), level(0.0)).x;
    float3 _6763 = float3(_2600, _2602, _2594);
    float4 _2613 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6763, float3(0.0), isnan(_6763)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6763, float3(0.0), isnan(_6763)), level(0.0)).xyzw;
    float _2615 = _2613.x;
    float _2617 = _2613.y;
    float _2619 = _2613.z;
    float _2621 = _2613.w;
    float2 _6780 = float2(_2608, _2588);
    float3 _2625 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6780, float2(0.0), isnan(_6780)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6780, float2(0.0), isnan(_6780)), level(0.0)).xyz;
    float _2627 = _2625.x;
    float _2629 = _2625.y;
    float _2631 = _2625.z;
    float _2633 = _2504 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2635 = _2510 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2637 = _2242 * _2300;
    bool _2639 = _2242 > 0.0;
    bool _2641 = isnan(_2242);
    bool _2643 = _2639 || _2641;
    bool _2645 = isnan(0.0);
    bool _2647 = _2643 || _2645;
    float _2649 = fma(_2516, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2635);
    float _2651 = exp2(_2633);
    float _2653 = _2637 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2655 = _2300 <= 0.0;
    bool _2657 = !_2647;
    bool _2659 = _2655 || _2657;
    float _2661 = fma(_2498, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2649);
    float _2663 = _2548 * 0.5;
    float _2665 = _248 * _2653;
    float _2667 = _2584 + _2548;
    float _2669 = fma(_2534, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2661);
    float _2671 = fma(_2586, -0.5, _2663);
    float _2673 = _2667 * 0.5;
    float _2675 = _2669 + _2548;
    out.gl_Position.x = _2584;
    out.gl_Position.y = _2586;
    out.gl_Position.z = _2669;
    out.gl_Position.w = _2548;
    float _2677 = _2665 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2679 = _2675 * 0.5;
    float _2681 = -_2651;
    float _2683 = _2681 + 1.0;
    out.m_47.x = _2677;
    float _2685 = _2683 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_83.x = _2673;
    out.m_83.y = _2671;
    out.m_83.z = _2679;
    out.m_83.w = _2548;
    float _2687 = -_2685;
    float _2689 = _2687 + 1.0;
    float _2691 = _2685 * _2610;
    float _2693 = _2621 * _2689;
    float _2695 = _2621 * _2691;
    float _2697 = _2631 * _2691;
    float _2699 = fma(_2627, _2695, _2615);
    float _2701 = fma(_2629, _2695, _2617);
    float _2703 = fma(_2621, _2697, _2619);
    out.m_85.x = _2699;
    out.m_85.y = _2701;
    out.m_85.z = _2703;
    out.m_85.w = _2693;
    if (!_2659)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2705 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2705;
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
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2008 = false;
    bool _666 = false;
    bool _488 = false;
    bool _268 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _99 = in.m_44.w;
    float _101 = trunc(_99);
    int _104 = int(_101);
    bool _108 = _104 >= 1;
    float _110 = 0.0;
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _110;
    float _114 = _112;
    if (!_108)
    {
        out.m_47.x = 0.0;
    }
    int _116 = 0;
    if (!_108)
    {
        float _118 = _112 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2762 = as_type<float>(_120);
        out.gl_Position.z = _2762;
    }
    if (!_108)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _124 = in.m_49.w;
    bool _126 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _128 = isnan(_124);
    bool _130 = _126 || _128;
    bool _132 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _134 = _130 || _132;
    float _136 = -_124;
    float _138 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _140 = _138;
    if (_134)
    {
        float _142 = float(_104);
        _114 = _142;
    }
    float _144 = _114;
    bool _146 = _138 >= _144;
    bool _148 = !_134;
    bool _150 = _146 || _148;
    float _152 = _144;
    if (_150)
    {
        _152 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _152;
    if (_150)
    {
        out.m_47.x = 0.0;
    }
    if (_150)
    {
        float _156 = _154 * 5.0;
        _122 = as_type<int>(_156);
    }
    int _158 = _122;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2832 = as_type<float>(_158);
        out.gl_Position.z = _2832;
    }
    if (_150)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _160 = in.m_51.x;
    float _162 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _164 = _138 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _166 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _168 = _166 != 0;
    int _170 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _172 = _170 != 0;
    int _174 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _176 = _174 != 0;
    float _178 = _164 * _162;
    float _180 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[20].x, _178);
    float _182 = _180 * 6.283185482025146484375;
    float _184 = floor(_180);
    float _186 = _182 * 0.15915493667125701904296875;
    bool _188 = !_168;
    int _190 = _188 ? 0 : 1;
    int _192 = abs(_190);
    float _194 = _186 * 6.283185482025146484375;
    float _196 = cos(_194);
    bool _198 = !_176;
    int _200 = _198 ? 0 : 1;
    bool _202 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _204 = abs(_200);
    float _206 = -_184;
    float _208 = _180 + _206;
    bool _210 = !_172;
    int _212 = _210 ? 0 : 1;
    float _214 = float(_192);
    int _216 = abs(_212);
    float _218 = -_208;
    float _220 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _222 = _208 < 0.5;
    float _224 = float(_222);
    float _226 = fma(_196, 0.5, 0.5);
    float _228 = abs(_220);
    float _230 = _214 * _228;
    float _232 = float(_204);
    float _234 = -_224;
    float _236 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _238 = -_226;
    float _240 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _242 = float(_216);
    float _244 = fma(_232, _240, _230);
    float _246 = abs(_236);
    float _248 = fma(_242, _246, _244);
    bool _250 = !_202;
    float _266;
    if (!_250)
    {
        float _252 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _254 = _160 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _256 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[12].x, _138);
        float _258 = _256 * _252;
        float _260 = floor(_258);
        float _262 = -_260;
        float _264 = _258 + _262;
        _266 = _264;
        _268 = true;
    }
    else
    {
        float _270 = float(_104);
        float _272 = 1.0 / _270;
        float _274 = _138 * _272;
        _266 = _274;
    }
    _268 = false;
    float _276 = _266;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _280 = _276 + _278;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _284 = _276 + _282;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _288 = _276 + _286;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _292 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _290;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _296 = _294 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _298;
    float _302 = 1.0 / _292;
    bool _304 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _306 = 1.0 / _300;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _308;
    float _312 = 1.0 / _296;
    float _314 = _280 * _302;
    bool _316 = _276 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _318 = isnan(_276);
    bool _320 = _316 || _318;
    bool _322 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _324 = _320 || _322;
    float _326 = float(_324);
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _328;
    float _332 = fma(_310, _314, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _334 = fma(_330, _314, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _336 = _284 * _306;
    bool _338 = _276 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _340 = isnan(_276);
    bool _342 = _338 || _340;
    bool _344 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _346 = _342 || _344;
    float _348 = float(_346);
    float _350 = -_326;
    float _352 = _350 + 1.0;
    float _354 = _348 * _352;
    bool _356 = _276 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _358 = isnan(_276);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = _288 * _312;
    bool _370 = _276 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _372 = isnan(_276);
    bool _374 = _370 || _372;
    bool _376 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _378 = _374 || _376;
    float _380 = float(_378);
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _382;
    float _386 = -_348;
    float _388 = _386 + 1.0;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _392 = _390 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _394 = fma(_384, _314, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _396 = -_380;
    float _398 = _396 + 1.0;
    float _400 = _380 * _388;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _410 = _366 * _398;
    float _412 = -_366;
    float _414 = _412 + 1.0;
    float _416 = fma(_392, _368, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _418 = fma(_404, _368, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _420 = _332 * _410;
    float _422 = _334 * _410;
    float _424 = _394 * _410;
    float _426 = fma(_414, (*spvDescriptorSet0.vp_c9)._m0[143].x, _420);
    float _428 = fma(_414, (*spvDescriptorSet0.vp_c9)._m0[143].y, _422);
    float _430 = fma(_414, (*spvDescriptorSet0.vp_c9)._m0[143].z, _424);
    float _432 = fma(_408, _368, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _434;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _438;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _444 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _442;
    float _446 = fma(_416, _400, _426);
    float _448 = fma(_436, _336, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _450 = fma(_440, _336, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _452 = fma(_444, _336, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _454 = fma(_418, _400, _428);
    float _456 = fma(_432, _400, _430);
    float _458 = fma(_448, _354, _446);
    float _460 = fma(_450, _354, _454);
    float _462 = fma(_452, _354, _456);
    float _464 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[146].x, _458);
    float _466 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[146].y, _460);
    float _468 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[146].z, _462);
    bool _470 = !_304;
    float _486;
    if (!_470)
    {
        float _472 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _474 = _160 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _476 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[11].x, _138);
        float _478 = _476 * _472;
        float _480 = floor(_478);
        float _482 = -_480;
        float _484 = _478 + _482;
        _486 = _484;
        _488 = true;
    }
    else
    {
        float _490 = float(_104);
        float _492 = 1.0 / _490;
        float _494 = _138 * _492;
        _486 = _494;
    }
    _488 = false;
    float _496 = _486;
    float _498 = in.m_53.x;
    float _500 = in.m_53.y;
    float _502 = in.m_53.z;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _506 = _496 + _504;
    bool _508 = _496 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _510 = isnan(_496);
    bool _512 = _508 || _510;
    bool _514 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _516 = _512 || _514;
    float _518 = float(_516);
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _520;
    bool _524 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _526 = 1.0 / _522;
    float _528 = _466 * _500;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _532 = _530 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _534 = _468 * _502;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _538 = _496 + _536;
    float _540 = _506 * _526;
    float _542 = 1.0 / _532;
    bool _544 = _496 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _546 = isnan(_496);
    bool _548 = _544 || _546;
    bool _550 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _552 = _548 || _550;
    float _554 = float(_552);
    float _556 = -_518;
    float _558 = _556 + 1.0;
    bool _560 = _496 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _562 = isnan(_496);
    bool _564 = _560 || _562;
    bool _566 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _568 = _564 || _566;
    float _570 = float(_568);
    float _572 = _570 * _558;
    float _574 = -_570;
    float _576 = _574 + 1.0;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _578;
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _582;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _586;
    float _590 = _554 * _576;
    float _592 = fma(_580, _540, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _594 = fma(_584, _540, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _596 = fma(_588, _540, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _598 = _538 * _542;
    float _600 = _592 * _590;
    float _602 = _594 * _590;
    float _604 = _596 * _590;
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _608 = _606 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _612 = _610 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _614 = -_554;
    float _616 = _614 + 1.0;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _620 = _618 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _622 = fma(_608, _598, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _624 = fma(_612, _598, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _626 = fma(_616, (*spvDescriptorSet0.vp_c9)._m0[107].x, _600);
    float _628 = fma(_616, (*spvDescriptorSet0.vp_c9)._m0[107].y, _602);
    float _630 = fma(_620, _598, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _632 = fma(_616, (*spvDescriptorSet0.vp_c9)._m0[107].z, _604);
    float _634 = fma(_622, _572, _626);
    float _636 = fma(_624, _572, _628);
    float _638 = _464 * _498;
    float _640 = fma(_630, _572, _632);
    float _642 = fma(_518, (*spvDescriptorSet0.vp_c9)._m0[109].x, _634);
    float _644 = fma(_518, (*spvDescriptorSet0.vp_c9)._m0[109].y, _636);
    float _646 = fma(_518, (*spvDescriptorSet0.vp_c9)._m0[109].z, _640);
    bool _648 = !_524;
    float _664;
    if (!_648)
    {
        float _650 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _652 = _160 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _654 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[11].y, _138);
        float _656 = _654 * _650;
        float _658 = floor(_656);
        float _660 = -_658;
        float _662 = _656 + _660;
        _664 = _662;
        _666 = true;
    }
    else
    {
        float _668 = float(_104);
        float _670 = 1.0 / _668;
        float _672 = _138 * _670;
        _664 = _672;
    }
    _666 = false;
    float _674 = _664;
    float _676 = in.m_55.y;
    float _678 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _680 = log2(_678);
    float _682 = _160 * 2.0;
    float _684 = in.m_51.w;
    int _686 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _688 = _686 != 0;
    float _690 = in.m_44.x;
    float _692 = in.m_44.y;
    float _694 = in.m_44.z;
    int _696 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _698 = _696 != 0;
    int _700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _702 = _700 != 0;
    int _704 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _706 = _704 != 0;
    float _708 = floor(_682);
    int _710 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _712 = _710 != 0;
    float _714 = in.m_57.x;
    float _716 = in.m_57.y;
    float _718 = in.m_57.z;
    int _720 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _722 = _720 != 0;
    float _724 = in.m_51.y;
    float _726 = _680 * _138;
    float _728 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _730 = _728 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _732 = in.m_59.x;
    float _734 = in.m_59.y;
    float _736 = in.m_59.z;
    float _738 = 1.0 / _730;
    float _740 = in.m_61.x;
    float _742 = in.m_61.y;
    float _744 = in.m_61.z;
    float _746 = -_676;
    float _748 = _746 + 1.0;
    float _750 = in.m_55.x;
    bool _752 = _684 > 0.5;
    float _754 = exp2(_726);
    float _756 = in.m_51.z;
    int _758 = _752 ? as_type<int>(_748) : as_type<int>(_676);
    int _760 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _762 = _760 != 0;
    float _764 = _692 * _716;
    float _766 = _762 ? as_type<float>(_758) : _676;
    float _768 = fma(_690, _714, _764);
    bool _770 = _724 > 0.5;
    float _772 = _692 * _734;
    float _774 = _676;
    bool _776 = _712;
    int _778 = as_type<int>(_742);
    float _780 = _684;
    float _782 = _714;
    if (_712)
    {
        float _784 = _770 ? _748 : _676;
        _774 = _784;
    }
    float _786 = _774;
    if (_688)
    {
        bool _788 = _160 > 0.5;
        _776 = _788;
    }
    bool _790 = _776;
    float _792 = _692 * _742;
    float _794 = fma(_690, _732, _772);
    float _796 = -_754;
    float _798 = _796 + 1.0;
    bool _800 = _790;
    if (_688)
    {
        float _802 = -_750;
        float _804 = _802 + 1.0;
        _778 = as_type<int>(_804);
    }
    int _806 = _778;
    float _808 = fma(_690, _740, _792);
    if (!_688)
    {
        _780 = _750;
    }
    float _810 = _780;
    float _812 = fma(_694, _736, _794);
    float _814 = _756 * 2.0;
    float _816 = _810;
    if (_688)
    {
        float _818 = _790 ? as_type<float>(_806) : _750;
        _816 = _818;
    }
    float _820 = _816;
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _824 = 1.0 + _822;
    float _826 = fma(_694, _718, _768);
    float _828 = _724 * 2.0;
    float _830 = fma(_694, _744, _808);
    float _832 = _724 + _756;
    float _834 = 1.0 / _824;
    int _836 = 0;
    if (_722)
    {
        float _838 = -_750;
        float _840 = _838 + 1.0;
        _836 = as_type<int>(_840);
    }
    int _842 = _836;
    float _844 = _832 + (-1.0);
    if (_722)
    {
        bool _846 = _756 > 0.5;
        _800 = _846;
    }
    bool _848 = _800;
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _852 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _850;
    bool _854 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _856 = isnan(1.0);
    bool _858 = _854 || _856;
    bool _860 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _862 = _858 || _860;
    float _864 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _866 = floor(_814);
    if (!_722)
    {
        _782 = _750;
    }
    float _868 = _782;
    float _870 = _852 * _738;
    float _872 = _868;
    if (_722)
    {
        float _874 = _848 ? as_type<float>(_842) : _750;
        _872 = _874;
    }
    float _876 = _872;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _880 = _674 + _878;
    bool _882 = _674 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _884 = isnan(_674);
    bool _886 = _882 || _884;
    bool _888 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _890 = _886 || _888;
    float _892 = float(_890);
    float _894 = _160 + _756;
    bool _896 = _708 > 0.0;
    float _898 = floor(_828);
    bool _900 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _902 = isnan(0.0);
    bool _904 = _900 || _902;
    bool _906 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _908 = _904 || _906;
    float _910 = fma(_870, _880, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _912 = _674 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _914 = isnan(_674);
    bool _916 = _912 || _914;
    bool _918 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _920 = _916 || _918;
    float _922 = float(_920);
    float _924 = -_892;
    float _926 = _924 + 1.0;
    bool _928 = _708 >= 0.0;
    bool _930 = isnan(_708);
    bool _932 = _928 || _930;
    bool _934 = isnan(0.0);
    bool _936 = _932 || _934;
    float _938 = _894 + (-1.0);
    float _940 = _908 ? _798 : 0.0;
    float _942 = _922 * _926;
    float _944 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _946 = _936 ? 0 : 1;
    if (_862)
    {
        float _948 = _940 * _834;
        _140 = _948;
    }
    float _950 = _140;
    bool _952 = _866 > 0.0;
    float _954 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _956 = _910 * _942;
    bool _958 = _898 > 0.0;
    float _960 = -_922;
    float _962 = _960 + 1.0;
    bool _964 = _898 >= 0.0;
    bool _966 = isnan(_898);
    bool _968 = _964 || _966;
    bool _970 = isnan(0.0);
    bool _972 = _968 || _970;
    float _974 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _976 = ~_946;
    int _978 = _976 + 1;
    int _980 = _978 + 1;
    float _982 = fma(_962, (*spvDescriptorSet0.vp_c9)._m0[115].x, _956);
    int _984 = _980;
    if (!_896)
    {
        int _986 = ~_946;
        int _988 = _986 + 1;
        _984 = _988;
    }
    int _990 = _984;
    float _992 = _820 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _994 = !_702;
    int _996 = _994 ? 0 : 1;
    float _998 = fma(_892, (*spvDescriptorSet0.vp_c9)._m0[116].x, _982);
    bool _1000 = _866 >= 0.0;
    bool _1002 = isnan(_866);
    bool _1004 = _1000 || _1002;
    bool _1006 = isnan(0.0);
    bool _1008 = _1004 || _1006;
    float _1010 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1012 = abs(_996);
    float _1014 = _756 + (-0.5);
    int _1016 = _1008 ? 0 : 1;
    float _1018 = float(_1012);
    int _1020 = ~_1016;
    int _1022 = _1020 + 1;
    int _1024 = _1022 + 1;
    float _1026 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1028 = _1024;
    if (!_952)
    {
        int _1030 = ~_1016;
        int _1032 = _1030 + 1;
        _1028 = _1032;
    }
    int _1034 = _1028;
    float _1036 = _766 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1038 = float(_990);
    float _1040 = _786 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _1042 = _972 ? 0 : 1;
    float _1044 = _1036 * _944;
    bool _1046 = !_706;
    int _1048 = _1046 ? 0 : 1;
    float _1050 = _1018 * _1038;
    float _1052 = _1040 * _974;
    int _1054 = ~_1042;
    int _1056 = _1054 + 1;
    int _1058 = _1056 + 1;
    float _1060 = in.m_63.x;
    float _1062 = in.m_63.y;
    float _1064 = in.m_63.z;
    int _1066 = _1058;
    if (!_958)
    {
        int _1068 = ~_1042;
        int _1070 = _1068 + 1;
        _1066 = _1070;
    }
    int _1072 = _1066;
    float _1074 = _876 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _1076 = !_698;
    int _1078 = _1076 ? 0 : 1;
    float _1080 = _992 * _1010;
    int _1082 = abs(_1048);
    float _1084 = _812 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1086 = abs(_1078);
    float _1088 = _1074 * _1026;
    float _1090 = _826 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1092 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1094 = _1084 + _1092;
    float _1096 = float(_1072);
    out.m_65.x = _1080;
    out.m_65.y = _1052;
    out.m_65.z = _1088;
    out.m_65.w = _1044;
    float _1098 = float(_1082);
    float _1100 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1102 = _1090 + _1100;
    float _1104 = float(_1034);
    float _1106 = _830 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1108 = _1094 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1110 = _1098 * _1096;
    float _1112 = _724 + (-0.5);
    float _1114 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1116 = _1106 + _1114;
    float _1118 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1108);
    float _1120 = _1050 * (-2.0);
    float _1122 = _1110 * (-2.0);
    float _1124 = float(_1086);
    float _1126 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1118);
    float _1128 = fma(_1120, _1062, _1062);
    float _1130 = _1094 * _1094;
    float _1132 = fma(_864, _1120, _864);
    float _1134 = fma(_1112, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1128);
    bool _1136 = _1126 >= 0.0;
    float _1138 = fma(_1102, _1102, _1130);
    float _1140 = fma(_1132, _950, _1134);
    float _1142 = _642 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1144 = fma(_1116, _1116, _1138);
    float _1146 = _1124 * _1104;
    float _1148 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1150 = fma(_1122, _1064, _1064);
    float _1152 = rsqrt(_1144);
    float _1154 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1156 = (*spvDescriptorSet0.vp_c9)._m0[123].z;
    int _1158 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1160 = _1090;
    if (_1136)
    {
        _1156 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1162 = _1156;
    float _1164 = fma(_954, _1122, _954);
    float _1166 = _644 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1168 = _646 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1170 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1172 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    if (_1136)
    {
        float _1174 = _1162 * 5.0;
        _1158 = as_type<int>(_1174);
    }
    int _1176 = _1158;
    float _1178 = _1142 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1180 = _1166 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1182 = _1168 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1184 = _1148 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1186 = _1170 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1188 = _1154 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1190 = _998 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1192 = fma(_1014, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1150);
    if (_1136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4441 = as_type<float>(_1176);
        out.gl_Position.z = _4441;
    }
    float _1194 = _1094 * _1152;
    float _1196 = _1102 * _1152;
    float _1198 = fma(_1164, _950, _1192);
    out.m_67.x = _1184;
    out.m_67.y = _1186;
    out.m_67.z = _1188;
    out.m_67.w = _1172;
    float _1200 = _1140 * 0.15915493667125701904296875;
    out.m_69.x = _1178;
    out.m_69.y = _1180;
    out.m_69.z = _1182;
    out.m_69.w = _1190;
    float _1202 = _1198;
    if (_1136)
    {
        out.m_47.x = 0.0;
    }
    if (_1136)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1204 = -_1194;
    float _1206 = fma(_1204, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1084);
    float _1208 = _1116 * _1152;
    float _1210 = -_1196;
    float _1212 = fma(_1210, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1090);
    float _1214 = _160 + _724;
    float _1216 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1218 = _1206 + _1216;
    float _1220 = -_1208;
    float _1222 = fma(_1220, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1106);
    float _1224 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1226 = _1212 + _1224;
    float _1228 = _1214 + (-1.0);
    float _1230 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1232 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1234 = _1222 + _1232;
    float _1236 = _1146 * (-2.0);
    float _1238 = fma(_1228, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1240 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1230);
    float _1242 = _160 + (-0.5);
    float _1244 = fma(_1236, _1060, _1060);
    float _1246 = -_1194;
    float _1248 = fma(_1246, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1094);
    float _1250 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1240);
    float _1252 = fma(_1238, _1236, _1238);
    float _1254 = fma(_1242, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1244);
    float _1256 = -_1196;
    float _1258 = fma(_1256, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1102);
    float _1260 = _1248 * _1248;
    bool _1262 = _1250 >= 0.0;
    float _1264 = fma(_1252, _950, _1254);
    float _1266 = -_1208;
    float _1268 = fma(_1266, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1116);
    float _1270 = fma(_1258, _1258, _1260);
    float _1272 = _1198 * 0.15915493667125701904296875;
    float _1274 = _1264 * 0.15915493667125701904296875;
    float _1276 = _1200 * 6.283185482025146484375;
    float _1278 = sin(_1276);
    float _1280 = fma(_1268, _1268, _1270);
    if (_1262)
    {
        _1202 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1282 = _1202;
    float _1284 = _1200 * 6.283185482025146484375;
    float _1286 = cos(_1284);
    int _1288 = as_type<int>(_1282);
    if (_1262)
    {
        out.m_47.x = 0.0;
    }
    if (_1262)
    {
        float _1290 = _1282 * 5.0;
        _1288 = as_type<int>(_1290);
    }
    int _1292 = _1288;
    float _1294 = _1272 * 6.283185482025146484375;
    float _1296 = sin(_1294);
    if (_1262)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4644 = as_type<float>(_1292);
        out.gl_Position.z = _4644;
    }
    float _1298 = _1272 * 6.283185482025146484375;
    float _1300 = cos(_1298);
    float _1302 = _1274 * 6.283185482025146484375;
    float _1304 = sin(_1302);
    float _1306 = sqrt(_1280);
    if (_1262)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1308 = -_1084;
    float _1310 = _1308 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1312 = -_1090;
    float _1314 = _1312 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1316 = _1274 * 6.283185482025146484375;
    float _1318 = cos(_1316);
    float _1320 = -_1106;
    float _1322 = _1320 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1324 = _1310 * _1310;
    float _1326 = _1286 * _1300;
    float _1328 = _1278 * _1296;
    float _1330 = _1152 * _1306;
    float _1332 = fma(_1314, _1314, _1324);
    float _1334 = _1286 * _1296;
    float _1336 = fma(_1304, _1328, _1326);
    float _1338 = fma(_1304, _1326, _1328);
    float _1340 = fma(_1322, _1322, _1332);
    float _1342 = _1278 * _1300;
    float _1344 = _638 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1346 = 0.0 + (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _1348 = precise::clamp(_1346, 0.0, 1.0);
    float _1350 = rsqrt(_1340);
    float _1352 = _1296 * _1318;
    float _1354 = _1300 * _1318;
    float _1356 = _1278 * _1318;
    float _1358 = _1286 * _1318;
    float _1360 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1362 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _1360;
    float _1364 = in.m_71.x;
    float _1366 = in.m_71.y;
    float _1368 = in.m_71.z;
    float _1370 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1372 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _1370;
    float _1374 = _1362 * _1362;
    float _1376 = -_1342;
    float _1378 = fma(_1304, _1334, _1376);
    float _1380 = -_1334;
    float _1382 = fma(_1304, _1342, _1380);
    float _1384 = _1330 * _1344;
    float _1386 = fma(_1348, -0.64999997615814208984375, 1.0);
    float _1388 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1390 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _1388;
    float _1392 = _1314 * _1350;
    float _1394 = _1322 * _1350;
    float _1396 = _1310 * _1350;
    float _1398 = fma(_1372, _1372, _1374);
    float _1400 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1402 = _1392 * _1400;
    float _1404 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1406 = _1394 * _1404;
    float _1408 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1410 = _1396 * _1408;
    float _1412 = fma(_1390, _1390, _1398);
    float _1414 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1416 = -_1402;
    float _1418 = fma(_1394, _1414, _1416);
    float _1420 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1422 = -_1406;
    float _1424 = fma(_1396, _1420, _1422);
    float _1426 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1428 = -_1410;
    float _1430 = fma(_1392, _1426, _1428);
    float _1432 = _528 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1434 = _1418 * _1418;
    float _1436 = rsqrt(_1412);
    float _1438 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1364);
    float _1440 = _1330 * _1432;
    float _1442 = fma(_1424, _1424, _1434);
    float _1444 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1366);
    float _1446 = _1438 * _1384;
    float _1448 = _534 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1450 = fma(_1430, _1430, _1442);
    float _1452 = sqrt(_1412);
    float _1454 = _1444 * _1440;
    float _1456 = _1330 * _1448;
    float _1458 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1368);
    bool _1460 = _1366 != 0.0;
    bool _1462 = isnan(_1366);
    bool _1464 = _1460 || _1462;
    bool _1466 = isnan(0.0);
    bool _1468 = _1464 || _1466;
    float _1470 = _1354 * _1454;
    float _1472 = _1338 * _1454;
    float _1474 = _1458 * _1456;
    float _1476 = rsqrt(_1450);
    float _1478 = _1382 * _1454;
    float _1480 = _1436 * (-0.20000000298023223876953125);
    float _1482 = fma(_1352, _1446, _1470);
    float _1484 = fma(_1378, _1446, _1472);
    float _1486 = fma(_1336, _1446, _1478);
    float _1488 = fma(_1372, _1480, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    bool _1490 = _1364 == 0.0;
    bool _1492 = !_1468;
    bool _1494 = _1490 && _1492;
    float _1496 = _1452 * 0.066666670143604278564453125;
    float _1498 = fma(_1356, _1474, _1486);
    float _1500 = fma(_1362, _1480, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _1502 = -_1304;
    float _1504 = fma(_1502, _1474, _1482);
    float _1506 = fma(_1358, _1474, _1484);
    float _1508 = fma(_1390, _1480, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _1510 = -_1500;
    float _1512 = _1510 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1514 = precise::max(_1496, 1.0);
    float _1516 = _1430 * _1476;
    float _1518 = _1418 * _1476;
    float _1520 = _1424 * _1476;
    float _1522 = _1512 * _1512;
    float _1524 = _1392 * _1516;
    float _1526 = _1394 * _1518;
    float _1528 = precise::min(_1514, 2.0);
    float _1530 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1532 = _1500 + _1530;
    float _1534 = -_1524;
    float _1536 = fma(_1394, _1520, _1534);
    float _1538 = _1396 * _1520;
    float _1540 = -_1526;
    float _1542 = fma(_1396, _1516, _1540);
    float _1544 = _1528 * _1386;
    float _1546 = _1536 * _1504;
    float _1548 = -_1538;
    float _1550 = fma(_1392, _1518, _1548);
    float _1552 = _1542 * _1504;
    float _1554 = -_1488;
    float _1556 = _1554 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1558 = fma(_1518, _1498, _1546);
    float _1560 = _1550 * _1504;
    float _1562 = fma(_1520, _1498, _1552);
    bool _1564 = _1368 == 0.0;
    bool _1566 = _1564 && _1494;
    float _1568 = fma(_1396, _1506, _1558);
    float _1570 = fma(_1516, _1498, _1560);
    float _1572 = fma(_1392, _1506, _1562);
    float _1574 = fma(_1556, _1556, _1522);
    float _1576 = _1084 + _1568;
    float _1578 = -_1508;
    float _1580 = _1578 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1582 = _1090 + _1572;
    float _1584 = in.m_73.x;
    float _1586 = in.m_73.y;
    float _1588 = in.m_73.z;
    float _1590 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1592 = _1576 + _1590;
    float _1594 = fma(_1394, _1506, _1570);
    float _1596 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1598 = _1582 + _1596;
    float _1600 = fma(_1580, _1580, _1574);
    float _1602 = fma(_1592, _1544, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _1604 = _1106 + _1594;
    float _1606 = fma(_1598, _1544, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _1608 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1610 = _1488 + _1608;
    float _1612 = -_1602;
    float _1614 = _1612 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1616 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1618 = _1604 + _1616;
    float _1620 = -_1606;
    float _1622 = _1620 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1624 = _1532 * _1532;
    float _1626 = _1614 * _1614;
    float _1628 = fma(_1618, _1544, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _1630 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1632 = _1508 + _1630;
    float _1634 = fma(_1610, _1610, _1624);
    float _1636 = fma(_1622, _1622, _1626);
    float _1638 = -_1628;
    float _1640 = _1638 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1642 = in.m_75.x;
    float _1644 = in.m_75.y;
    float _1646 = in.m_75.z;
    float _1648 = in.m_75.w;
    float _1650 = fma(_1632, _1632, _1634);
    float _1652 = sqrt(_1600);
    float _1654 = fma(_1640, _1640, _1636);
    float _1656 = _1352 * _1536;
    float _1658 = _1636;
    float _1660 = _1634;
    float _1662 = _1640;
    float _1664 = _1584;
    float _1666 = _1338;
    if (_1566)
    {
        _1658 = _1584;
    }
    float _1668 = _1658;
    float _1670 = _1352 * _1550;
    float _1672 = _1668;
    if (_1566)
    {
        _1660 = _1588;
    }
    float _1674 = _1660;
    float _1676 = _1674;
    if (!_1566)
    {
        float _1678 = fma(_1368, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1588);
        _1676 = _1678;
    }
    float _1680 = _1676;
    if (_1566)
    {
        _1662 = _1668;
    }
    float _1682 = _1662;
    float _1684 = sqrt(_1654);
    float _1686 = _1682;
    if (!_1566)
    {
        _1672 = _1584;
    }
    float _1688 = _1672;
    float _1690 = fma(_1336, _1516, _1670);
    if (_1566)
    {
        _1664 = _1586;
    }
    float _1692 = _1664;
    float _1694 = _1692;
    if (!_1566)
    {
        float _1696 = fma(_1366, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1586);
        _1694 = _1696;
    }
    float _1698 = _1694;
    if (!_1566)
    {
        float _1700 = fma(_1364, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1688);
        _1686 = _1700;
    }
    float _1702 = _1686;
    float _1704 = rsqrt(_1650);
    float _1706 = _1646 * _1688;
    float _1708 = _1644 * _1588;
    float _1710 = -_1652;
    float _1712 = _1684 + _1710;
    float _1714 = _1642 * _1586;
    float _1716 = -_1706;
    float _1718 = fma(_1642, _1588, _1716);
    float _1720 = -_1708;
    float _1722 = fma(_1646, _1586, _1720);
    float _1724 = _1354 * _1550;
    float _1726 = -_1714;
    float _1728 = fma(_1644, _1688, _1726);
    float _1730 = _1718 * _1648;
    float _1732 = _1722 * _1648;
    float _1734 = _1704 * _1712;
    float _1736 = _1728 * _1648;
    float _1738 = _1352 * _1542;
    float _1740 = _1354 * _1542;
    float _1742 = -_1734;
    float _1744 = fma(_1610, _1742, _1606);
    float _1746 = -_1734;
    float _1748 = fma(_1632, _1746, _1628);
    float _1750 = _1354 * _1536;
    float _1752 = -_1542;
    float _1754 = _1304 * _1752;
    float _1756 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1758 = _1744 + _1756;
    float _1760 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1762 = _1748 + _1760;
    float _1764 = -_1536;
    float _1766 = _1304 * _1764;
    float _1768 = -_1550;
    float _1770 = _1304 * _1768;
    float _1772 = _1758 * _1758;
    float _1774 = _1762 * _1762;
    float _1776 = fma(_1382, _1520, _1740);
    float _1778 = fma(_1382, _1518, _1750);
    float _1780 = fma(_1382, _1516, _1724);
    float _1782 = _1772 + _1774;
    float _1784 = fma(_1336, _1520, _1738);
    float _1786 = fma(_1336, _1518, _1656);
    float _1788 = fma(_1356, _1516, _1770);
    float _1790 = sqrt(_1782);
    float _1792 = fma(_1356, _1520, _1754);
    float _1794 = fma(_1356, _1518, _1766);
    float _1796 = fma(_1338, _1392, _1776);
    float _1798 = fma(_1338, _1396, _1778);
    float _1800 = fma(_1338, _1394, _1780);
    float _1802 = fma(_1378, _1392, _1784);
    float _1804 = fma(_1378, _1396, _1786);
    float _1806 = fma(_1378, _1394, _1690);
    float _1808 = fma(_1358, _1394, _1788);
    float _1810 = fma(_1358, _1392, _1792);
    float _1812 = fma(_1358, _1396, _1794);
    float _1814 = _1796 * _1644;
    float _1816 = _1798 * _1644;
    float _1818 = _1800 * _1644;
    float _1820 = _1796 * _1698;
    bool _1822 = _1790 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1824 = _1730 * _1796;
    float _1826 = _1798 * _1698;
    float _1828 = _1730 * _1798;
    float _1830 = _1800 * _1698;
    float _1832 = _1730 * _1800;
    float _1834 = -_1734;
    float _1836 = fma(_1532, _1834, _1602);
    float _1838 = _1836;
    float _1840 = _1772;
    float _1842 = _1774;
    float _1844 = _1748;
    float _1846 = _1736;
    if (!_1822)
    {
        _1666 = _1744;
    }
    float _1848 = _1666;
    bool _1850 = !_1822;
    float _1852 = _1848;
    if (!_1850)
    {
        float _1854 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1856 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1858 = _1790 + _1856;
        float _1860 = rsqrt(_1782);
        float _1862 = _1858 * _1854;
        float _1864 = _1836 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1866 = _1862 * 0.15915493667125701904296875;
        float _1868 = _1866 * 6.283185482025146484375;
        float _1870 = sin(_1868);
        float _1872 = _1866 * 6.283185482025146484375;
        float _1874 = cos(_1872);
        float _1876 = fma(_1870, _1864, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1878 = _1860 * _1876;
        float _1880 = fma(_1758, _1878, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1882 = _1874 + (-1.0);
        float _1884 = fma(_1762, _1878, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1886 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1888 = _1880 + _1886;
        float _1890 = _1882 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1892 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1894 = _1884 + _1892;
        float _1896 = _1888 * _1888;
        float _1898 = fma(_1836, _1874, _1890);
        float _1900 = _1894 * _1894;
        _1838 = _1898;
        _1840 = _1896;
        _1842 = _1900;
        _1852 = _1880;
        _1844 = _1884;
    }
    float _1902 = _1838;
    float _1904 = _1840;
    float _1906 = _1842;
    float _1908 = _1852;
    float _1910 = _1844;
    float _1912 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1914 = _1902 + _1912;
    float _1916 = fma(_1802, _1702, _1820);
    float _1918 = fma(_1802, _1642, _1814);
    float _1920 = fma(_1804, _1642, _1816);
    float _1922 = fma(_1914, _1914, _1904);
    float _1924 = fma(_1804, _1702, _1826);
    float _1926 = fma(_1806, _1702, _1830);
    float _1928 = fma(_1732, _1802, _1824);
    float _1930 = _1922 + _1906;
    float _1932 = fma(_1806, _1642, _1818);
    float _1934 = fma(_1732, _1804, _1828);
    float _1936 = fma(_1732, _1806, _1832);
    float _1938 = fma(_1810, _1646, _1918);
    float _1940 = fma(_1812, _1646, _1920);
    float _1942 = sqrt(_1930);
    float _1944 = fma(_1810, _1680, _1916);
    float _1946 = fma(_1736, _1810, _1928);
    float _1948 = fma(_1812, _1680, _1924);
    float _1950 = fma(_1736, _1812, _1934);
    float _1952 = fma(_1736, _1808, _1936);
    float _1954 = fma(_1808, _1680, _1926);
    float _1956 = fma(_1808, _1646, _1932);
    out.m_69.x = _1178;
    out.m_69.y = _1180;
    out.m_69.z = _1182;
    out.m_69.w = _1190;
    out.m_67.x = _1184;
    out.m_67.y = _1186;
    out.m_67.z = _1188;
    out.m_67.w = _1172;
    out.m_77.x = _1946;
    out.m_77.y = _1950;
    out.m_77.z = _1952;
    bool _1958 = _1942 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1960 = isnan(_1942);
    bool _1962 = _1958 || _1960;
    bool _1964 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1966 = _1962 || _1964;
    out.m_79.x = _1944;
    out.m_79.y = _1948;
    out.m_79.z = _1954;
    out.m_81.x = _1938;
    out.m_81.y = _1940;
    out.m_81.z = _1956;
    float _1968 = _1956;
    float _1970 = _1946;
    float _1972 = _1950;
    if (!_1966)
    {
        _1846 = 1.0;
    }
    float _1974 = _1846;
    bool _1976 = !_1966;
    float _1978 = _1974;
    if (!_1976)
    {
        bool _1980 = _1942 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1982 = isnan(_1942);
        bool _1984 = _1980 || _1982;
        bool _1986 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1988 = _1984 || _1986;
        if (!_1988)
        {
            float _1990 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1992 = _1942 + _1990;
            float _1994 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1996 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1994;
            float _1998 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2000 = _1998 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2002 = 1.0 / _1996;
            float _2004 = _1992 * _2002;
            float _2006 = fma(_2004, _2000, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1978 = _2006;
            _2008 = true;
        }
        else
        {
            bool _2010 = _1942 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2012 = isnan(_1942);
            bool _2014 = _2010 || _2012;
            bool _2016 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2018 = _2014 || _2016;
            if (!_2018)
            {
                float _2020 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2022 = _1942 + _2020;
                float _2024 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2026 = _2024 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2028 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2030 = _2028 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2032 = 1.0 / _2026;
                float _2034 = _2022 * _2032;
                float _2036 = fma(_2034, _2030, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1978 = _2036;
                _2008 = true;
            }
            else
            {
                _1978 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2008 = false;
    float _2038 = _1978;
    float _2040 = _1206 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2042 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2044 = _1908 + _2042;
    float _2046 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2040);
    float _2048 = _1206 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2050 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2052 = _1902 + _2050;
    float _2054 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2046);
    bool _2056 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2058 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2060 = _2056 || _2058;
    bool _2062 = isnan(0.5);
    bool _2064 = _2060 || _2062;
    float _2066 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2068 = _1910 + _2066;
    bool _2070 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2072 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2074 = _2070 || _2072;
    bool _2076 = isnan(0.5);
    bool _2078 = _2074 || _2076;
    float _2080 = _2054 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2082 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2048);
    float _2084 = fma(_2052, _2038, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2086 = fma(_2068, _2038, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2088 = 1.0 / _2080;
    float _2090 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2082);
    float _2092 = _2090 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2094 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_2078)
    {
        _2094 = 1.0;
    }
    float _2096 = _2094;
    float _2098 = _2092 + _2080;
    float _2100 = -_1194;
    float _2102 = fma(_2100, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2084);
    float _2104 = _2098 * _2088;
    float _2106 = _2104 * 0.5;
    float _2108 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2110 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2108);
    float _2112 = fma(_2044, _2038, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2114 = -_1208;
    float _2116 = fma(_2114, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2086);
    float _2118 = 1.0 / _2110;
    float _2120 = -_1196;
    float _2122 = fma(_2120, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2112);
    float _2124 = _2102;
    float _2126 = _2122;
    float _2128 = _2116;
    float _2130 = _2112;
    float _2132 = _2096;
    if (!_2064)
    {
        float _2134 = _1218 * _1218;
        float _2136 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2138 = -_1106;
        float _2140 = _2138 + _2086;
        float _2142 = -_1084;
        float _2144 = _2142 + _2084;
        float _2146 = fma(_1226, _1226, _2134);
        float _2148 = fma(_1234, _1234, _2146);
        float _2150 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2152 = sqrt(_2148);
        float _2154 = 1.0 / _1330;
        float _2156 = precise::min(_2152, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2158 = _2156 * _2136;
        float _2160 = _2150 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2162 = _2158 * _2154;
        float _2164 = -_1090;
        float _2166 = _2164 + _2112;
        float _2168 = _2160 * _2162;
        float _2170 = _2140 * _2162;
        float _2172 = fma(_2166, _2168, _1212);
        float _2174 = fma(_2144, _2168, _1206);
        float _2176 = fma(_2160, _2170, _1222);
        _2124 = _2174;
        _2126 = _2172;
        _2128 = _2176;
    }
    float _2178 = _2124;
    float _2180 = _2126;
    float _2182 = _2128;
    if (_2078)
    {
        _2130 = 1.0;
    }
    float _2184 = _2130;
    float _2186 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2188 = _2118 * _2186;
    float _2190 = _2184;
    if (!_2078)
    {
        float _2192 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2194 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2196 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2194;
        float _2198 = _2192 * 0.15915493667125701904296875;
        float _2200 = _2198 * 6.283185482025146484375;
        float _2202 = cos(_2200);
        float _2204 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2206 = _2204 * 0.15915493667125701904296875;
        float _2208 = _2198 * 6.283185482025146484375;
        float _2210 = sin(_2208);
        float _2212 = 1.0 / _2202;
        float _2214 = _2206 * 6.283185482025146484375;
        float _2216 = cos(_2214);
        float _2218 = _2210 * _2212;
        float _2220 = _2206 * 6.283185482025146484375;
        float _2222 = sin(_2220);
        float _2224 = _2216 * _2218;
        float _2226 = 1.0 / _2196;
        float _2228 = 1.0 / _2224;
        float _2230 = _2222 * _2228;
        float _2232 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2234 = fma(_2188, _2230, _2232);
        float _2236 = _2234 * _2226;
        float _2238 = precise::clamp(_2236, 0.0, 1.0);
        _1968 = _2226;
        _2132 = _2238;
    }
    float _2240 = _1968;
    float _2242 = _2132;
    float _2244 = _2240;
    if (!_2078)
    {
        float _2246 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2248 = _2246 * 0.15915493667125701904296875;
        float _2250 = _2248 * 6.283185482025146484375;
        float _2252 = cos(_2250);
        float _2254 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2256 = _2254 * 0.15915493667125701904296875;
        float _2258 = _2248 * 6.283185482025146484375;
        float _2260 = sin(_2258);
        float _2262 = 1.0 / _2252;
        float _2264 = _2256 * 6.283185482025146484375;
        float _2266 = cos(_2264);
        float _2268 = _2260 * _2262;
        float _2270 = _2256 * 6.283185482025146484375;
        float _2272 = sin(_2270);
        float _2274 = _2266 * _2268;
        float _2276 = 1.0 / _2274;
        float _2278 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2280 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2278;
        float _2282 = 1.0 / _2280;
        float _2284 = _2272 * _2276;
        float _2286 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2288 = fma(_2188, _2284, _2286);
        float _2290 = _2288 * _2282;
        float _2292 = precise::clamp(_2290, 0.0, 1.0);
        float _2294 = -_2292;
        float _2296 = _2294 + 1.0;
        _2244 = _2252;
        _2190 = _2296;
    }
    float _2298 = _2244;
    float _2300 = _2190;
    float _2302 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2304 = _2178 + _2302;
    float _2306 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2308 = _2180 + _2306;
    float _2310 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2312 = _2182 + _2310;
    float _2314 = _2304 * _2304;
    float _2316 = fma(_2308, _2308, _2314);
    float _2318 = fma(_2312, _2312, _2316);
    float _2320 = rsqrt(_2318);
    float _2322 = _2320 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2324 = _2308 * _2322;
    float _2326 = _2312 * _2322;
    float _2328 = _2324 * _2324;
    float _2330 = _2326 * _2326;
    float _2332 = _2328 + _2330;
    float _2334 = sqrt(_2332);
    bool _2336 = _2334 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2338 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2340 = _2334 + _2338;
    float _2342 = _2312;
    float _2344 = _2332;
    float _2346 = _2340;
    float _2348 = _2324;
    if (_2336)
    {
        float _2350 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2342 = _2350;
    }
    float _2352 = _2342;
    if (_2336)
    {
        float _2354 = rsqrt(_2332);
        _2344 = _2354;
    }
    float _2356 = _2344;
    float _2358 = _2356;
    if (_2336)
    {
        float _2360 = _2340 * _2352;
        _2346 = _2360;
    }
    float _2362 = _2346;
    if (_2336)
    {
        float _2364 = _2362 * 0.15915493667125701904296875;
        _1970 = _2364;
    }
    float _2366 = _1970;
    float _2368 = _2320;
    if (_2336)
    {
        float _2370 = _2366 * 6.283185482025146484375;
        float _2372 = sin(_2370);
        _2368 = _2372;
    }
    float _2374 = _2368;
    float _2376 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2378 = precise::max(0.0, _2376);
    float _2380 = _2298;
    float _2382 = _2378;
    float _2384 = _2376;
    if (_2336)
    {
        float _2386 = _2366 * 6.283185482025146484375;
        float _2388 = cos(_2386);
        _2380 = _2388;
    }
    float _2390 = _2380;
    float _2392 = -_2322;
    float _2394 = -_2378;
    float _2396 = fma(_2304, _2392, _2394);
    if (_2336)
    {
        float _2398 = _2396 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2382 = _2398;
    }
    float _2400 = _2382;
    float _2402 = sqrt(_2318);
    float _2404 = _2178 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2406 = _2374;
    float _2408 = _2400;
    if (_2336)
    {
        float _2410 = fma(_2374, _2400, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2406 = _2410;
    }
    float _2412 = _2406;
    float _2414 = _2412;
    if (!_2336)
    {
        _2408 = _2326;
    }
    float _2416 = _2408;
    float _2418 = _2416;
    if (_2336)
    {
        float _2420 = _2390 + (-1.0);
        _2384 = _2420;
    }
    float _2422 = _2384;
    float _2424 = _2422;
    if (_2336)
    {
        float _2426 = _2356 * _2412;
        _1160 = _2426;
    }
    float _2428 = _1160;
    if (!_2336)
    {
        _2414 = _2396;
    }
    float _2430 = _2414;
    float _2432 = _2430;
    if (_2336)
    {
        float _2434 = _2422 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1972 = _2434;
    }
    float _2436 = _1972;
    if (_2336)
    {
        float _2438 = _2324 * _2428;
        _2348 = _2438;
    }
    float _2440 = _2348;
    if (!_2336)
    {
        _2358 = _2328;
    }
    float _2442 = _2358;
    float _2444 = _2442;
    if (_2336)
    {
        float _2446 = _2326 * _2428;
        _2418 = _2446;
    }
    float _2448 = _2418;
    if (_2336)
    {
        float _2450 = fma(_2396, _2390, _2436);
        _2432 = _2450;
    }
    float _2452 = _2432;
    if (_2336)
    {
        float _2454 = _2440 * _2440;
        _2444 = _2454;
    }
    float _2456 = _2444;
    if (!_2336)
    {
        _2424 = _2330;
    }
    float _2458 = _2424;
    float _2460 = _2458;
    if (_2336)
    {
        float _2462 = _2448 * _2448;
        _2460 = _2462;
    }
    float _2464 = _2460;
    float _2466 = fma(_2452, _2452, _2456);
    float _2468 = _2466 + _2464;
    float _2470 = _2178 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2472 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2474 = fma(_2402, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2472);
    float _2476 = precise::clamp(_2474, 0.0, 1.0);
    float _2478 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2480 = rsqrt(_2468);
    float _2482 = fma(_2180, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2470);
    float _2484 = _2178 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2486 = -_2476;
    float _2488 = _2486 + 1.0;
    float _2490 = _2178 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2492 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2482);
    float _2494 = fma(_2180, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2484);
    float _2496 = fma(_2180, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2490);
    float _2498 = _2492 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2500 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2494);
    float _2502 = abs(_2488);
    float _2504 = log2(_2502);
    float _2506 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2496);
    float _2508 = fma(_2180, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2404);
    float _2510 = _2500 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2512 = _2498 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2514 = _2480 * _2440;
    float _2516 = _2506 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2518 = _2510 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2520 = _2480 * _2452;
    float _2522 = _2514 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2524 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2508);
    float _2526 = fma(_2516, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2518);
    float _2528 = _2480 * _2448;
    float _2530 = -_2522;
    float _2532 = fma(_2520, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2530);
    float _2534 = _2524 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2536 = fma(_2498, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2526);
    float _2538 = _2504 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2540 = -_2528;
    float _2542 = fma(_2540, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2532);
    float _2544 = -_2512;
    float _2546 = fma(_2544, _2478, 1.0);
    float _2548 = fma(_2534, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2536);
    float _2550 = _2510 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2552 = fma(_2542, -0.5, 0.5);
    float _2554 = exp2(_2538);
    float _2556 = _2510 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2558 = fma(_2516, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2550);
    float _2560 = fma(_2542, 0.5, 0.5);
    float _2562 = _2520 + 1.0;
    float _2564 = fma(_2516, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2556);
    float _2566 = fma(_2498, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2558);
    float _2568 = fma(_2560, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2570 = log2(_2546);
    float _2572 = fma(_2498, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2564);
    float _2574 = fma(_2560, _2568, -0.212114393711090087890625);
    float _2576 = fma(_2560, _2574, 1.570728778839111328125);
    float _2578 = 1.0 / _2548;
    float _2580 = -_2520;
    float _2582 = fma(_2554, _2562, _2580);
    float _2584 = fma(_2534, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2566);
    float _2586 = fma(_2534, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2572);
    float _2588 = fma(_2582, 0.5, 0.5);
    float _2590 = sqrt(_2552);
    float _2592 = _2570 * 0.693147182464599609375;
    float _2594 = _2592 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2596 = _2584 * _2578;
    float _2598 = _2586 * _2578;
    float _2600 = fma(_2596, 0.5, 0.5);
    float _2602 = fma(_2598, -0.5, 0.5);
    float _2604 = _2590 * 0.636619746685028076171875;
    float _2606 = -_2576;
    float _2608 = fma(_2604, _2606, 1.0);
    float3 _6752 = float3(_2600, _2602, _2594);
    float _2610 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6752, float3(0.0), isnan(_6752)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6752, float3(0.0), isnan(_6752)), level(0.0)).x;
    float3 _6763 = float3(_2600, _2602, _2594);
    float4 _2613 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6763, float3(0.0), isnan(_6763)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6763, float3(0.0), isnan(_6763)), level(0.0)).xyzw;
    float _2615 = _2613.x;
    float _2617 = _2613.y;
    float _2619 = _2613.z;
    float _2621 = _2613.w;
    float2 _6780 = float2(_2608, _2588);
    float3 _2625 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6780, float2(0.0), isnan(_6780)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6780, float2(0.0), isnan(_6780)), level(0.0)).xyz;
    float _2627 = _2625.x;
    float _2629 = _2625.y;
    float _2631 = _2625.z;
    float _2633 = _2504 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2635 = _2510 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2637 = _2242 * _2300;
    bool _2639 = _2242 > 0.0;
    bool _2641 = isnan(_2242);
    bool _2643 = _2639 || _2641;
    bool _2645 = isnan(0.0);
    bool _2647 = _2643 || _2645;
    float _2649 = fma(_2516, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2635);
    float _2651 = exp2(_2633);
    float _2653 = _2637 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2655 = _2300 <= 0.0;
    bool _2657 = !_2647;
    bool _2659 = _2655 || _2657;
    float _2661 = fma(_2498, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2649);
    float _2663 = _2548 * 0.5;
    float _2665 = _248 * _2653;
    float _2667 = _2584 + _2548;
    float _2669 = fma(_2534, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2661);
    float _2671 = fma(_2586, -0.5, _2663);
    float _2673 = _2667 * 0.5;
    float _2675 = _2669 + _2548;
    out.gl_Position.x = _2584;
    out.gl_Position.y = _2586;
    out.gl_Position.z = _2669;
    out.gl_Position.w = _2548;
    float _2677 = _2665 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2679 = _2675 * 0.5;
    float _2681 = -_2651;
    float _2683 = _2681 + 1.0;
    out.m_47.x = _2677;
    float _2685 = _2683 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_83.x = _2673;
    out.m_83.y = _2671;
    out.m_83.z = _2679;
    out.m_83.w = _2548;
    float _2687 = -_2685;
    float _2689 = _2687 + 1.0;
    float _2691 = _2685 * _2610;
    float _2693 = _2621 * _2689;
    float _2695 = _2621 * _2691;
    float _2697 = _2631 * _2691;
    float _2699 = fma(_2627, _2695, _2615);
    float _2701 = fma(_2629, _2695, _2617);
    float _2703 = fma(_2621, _2697, _2619);
    out.m_85.x = _2699;
    out.m_85.y = _2701;
    out.m_85.z = _2703;
    out.m_85.w = _2693;
    if (!_2659)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2705 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2705;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

