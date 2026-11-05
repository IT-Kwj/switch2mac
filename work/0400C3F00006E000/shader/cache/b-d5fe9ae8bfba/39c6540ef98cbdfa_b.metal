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
    float4 m_55 [[user(locn0)]];
    float4 m_63 [[user(locn1)]];
    float4 m_65 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_61 [[user(locn4)]];
    float4 m_67 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_57 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_59 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1574 = false;
    bool _992 = false;
    bool _850 = false;
    bool _574 = false;
    bool _284 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _81 = in.m_44.w;
    float _83 = trunc(_81);
    int _86 = int(_83);
    bool _90 = _86 >= 1;
    float _92 = 0.0;
    if (!_90)
    {
        _92 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _94 = _92;
    if (!_90)
    {
        out.m_47.x = 0.0;
    }
    int _96 = 0;
    if (!_90)
    {
        float _98 = _94 * 5.0;
        _96 = as_type<int>(_98);
    }
    int _100 = _96;
    int _102 = _100;
    if (!_90)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2175 = as_type<float>(_100);
        out.gl_Position.z = _2175;
    }
    if (!_90)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _104 = in.m_49.w;
    bool _106 = _104 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _108 = isnan(_104);
    bool _110 = _106 || _108;
    bool _112 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _114 = _110 || _112;
    float _116 = -_104;
    float _118 = _116 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _120 = 0.0;
    float _122 = _118;
    if (_114)
    {
        float _124 = float(_86);
        _120 = _124;
    }
    float _126 = _120;
    bool _128 = _118 >= _126;
    bool _130 = !_114;
    bool _132 = _128 || _130;
    float _134 = 0.0;
    if (_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _134;
    float _138 = _136;
    if (_132)
    {
        out.m_47.x = 0.0;
    }
    if (_132)
    {
        float _140 = _136 * 5.0;
        _102 = as_type<int>(_140);
    }
    int _142 = _102;
    if (_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2245 = as_type<float>(_142);
        out.gl_Position.z = _2245;
    }
    if (_132)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _144 = in.m_51.w;
    float _146 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _148 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _150 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _152 = _148 || _150;
    bool _154 = isnan(1.0);
    bool _156 = _152 || _154;
    float _158 = in.m_49.x;
    float _160 = in.m_49.y;
    float _162 = in.m_49.z;
    float _164 = in.m_44.x;
    float _166 = in.m_44.y;
    float _168 = in.m_44.z;
    float _170 = _146;
    if (!_156)
    {
        float _172 = _146 * _146;
        float _174 = _172 * 0.5;
        _138 = _174;
    }
    float _176 = _138;
    float _178 = _176;
    if (!_156)
    {
        float _180 = _176 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _180;
    }
    float _182 = _178;
    bool _184 = !_156;
    float _186 = _182;
    if (!_184)
    {
        float _188 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _190 = log2(_188);
        float _192 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _194 = _192 + 1.0;
        float _196 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = _146 * _190;
        float _200 = 1.0 / _194;
        float _202 = _196 * 0.693147182464599609375;
        float _204 = exp2(_198);
        float _206 = 1.0 / _202;
        float _208 = _204 + (-1.0);
        float _210 = -_208;
        float _212 = fma(_210, _206, _146);
        float _214 = _212 * _200;
        float _216 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _216;
    }
    float _218 = _186;
    bool _220 = !_156;
    if (!_220)
    {
        float _222 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _224 = log2(_222);
        float _226 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _228 = _226 + 1.0;
        float _230 = 1.0 / _228;
        float _232 = _146 * _224;
        float _234 = exp2(_232);
        float _236 = -_234;
        float _238 = _236 + 1.0;
        float _240 = _238 * _230;
        _170 = _240;
    }
    float _242 = _170;
    bool _244 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _246 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _248 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _250 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _252 = fma(_242, _158, _246);
    float _254 = fma(_242, _160, _248);
    float _256 = fma(_242, _162, _250);
    float _258 = fma(_252, _144, _164);
    float _260 = fma(_254, _144, _166);
    float _262 = fma(_256, _144, _168);
    bool _264 = !_244;
    float _282;
    if (!_264)
    {
        float _266 = in.m_53.x;
        float _268 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _270 = _266 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _272 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[12].x, _118);
        float _274 = _272 * _268;
        float _276 = floor(_274);
        float _278 = -_276;
        float _280 = _274 + _278;
        _282 = _280;
        _284 = true;
    }
    else
    {
        float _286 = float(_86);
        float _288 = 1.0 / _286;
        float _290 = _118 * _288;
        _282 = _290;
    }
    _284 = false;
    float _292 = _282;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _296 = _292 + _294;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _300 = _292 + _298;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _304 = _292 + _302;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _308 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _306;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _312 = _310 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _316 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _314;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _320 = _318 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _322 = 1.0 / _308;
    bool _324 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _326 = isnan(_292);
    bool _328 = _324 || _326;
    bool _330 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _332 = _328 || _330;
    float _334 = float(_332);
    bool _336 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _338 = isnan(_292);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    float _348 = 1.0 / _312;
    float _350 = -_346;
    float _352 = _350 + 1.0;
    bool _354 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _356 = 1.0 / _316;
    float _358 = _296 * _322;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _362 = _292 + _360;
    float _364 = 1.0 / _320;
    float _366 = _300 * _348;
    bool _368 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _370 = isnan(_292);
    bool _372 = _368 || _370;
    bool _374 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _376 = _372 || _374;
    float _378 = float(_376);
    float _380 = -_378;
    float _382 = _380 + 1.0;
    float _384 = _304 * _356;
    float _386 = _362 * _364;
    bool _388 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _390 = isnan(_292);
    bool _392 = _388 || _390;
    bool _394 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _396 = _392 || _394;
    float _398 = float(_396);
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _400;
    float _404 = _398 * _382;
    float _406 = -_398;
    float _408 = _406 + 1.0;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _410;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _414;
    float _418 = fma(_402, _358, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _420 = _334 * _408;
    float _422 = -_334;
    float _424 = _422 + 1.0;
    float _426 = fma(_412, _358, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _428 = fma(_416, _358, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _430 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _432 = isnan(_292);
    bool _434 = _430 || _432;
    bool _436 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _438 = _434 || _436;
    float _440 = float(_438);
    float _442 = _346 * _424;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _450 = _448 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _454 = _452 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _456 = _440 * _352;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _458;
    float _462 = fma(_450, _366, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _464 = fma(_454, _366, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _466 = _426 * _456;
    float _468 = _428 * _456;
    float _470 = _418 * _456;
    float _472 = -_440;
    float _474 = _472 + 1.0;
    float _476 = in.m_51.x;
    float _478 = in.m_51.y;
    float _480 = in.m_51.z;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _482;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _486;
    float _490 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[143].x, _466);
    float _492 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[143].y, _468);
    float _494 = fma(_446, _366, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _496 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[143].z, _470);
    float _498 = fma(_484, _384, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _500 = fma(_460, _384, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _502 = fma(_488, _384, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _504 = fma(_462, _442, _490);
    float _506 = fma(_464, _442, _492);
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _510 = _508 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _514 = _512 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _518 = _516 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _520 = fma(_494, _442, _496);
    float _522 = fma(_510, _386, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _524 = fma(_514, _386, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _526 = fma(_518, _386, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _528 = fma(_498, _420, _504);
    float _530 = fma(_500, _420, _506);
    float _532 = fma(_502, _420, _520);
    float _534 = fma(_522, _404, _528);
    float _536 = fma(_524, _404, _530);
    float _538 = fma(_526, _404, _532);
    float _540 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[147].x, _534);
    float _542 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[147].y, _536);
    float _544 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[147].z, _538);
    float _546 = _540 * _476;
    float _548 = _542 * _478;
    float _550 = _544 * _480;
    bool _552 = !_354;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _572;
    if (!_552)
    {
        float _556 = in.m_53.x;
        float _558 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _560 = _556 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _562 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[11].x, _118);
        float _564 = _562 * _558;
        float _566 = floor(_564);
        float _568 = -_566;
        float _570 = _564 + _568;
        _572 = _570;
        _574 = true;
    }
    else
    {
        float _576 = float(_86);
        float _578 = 1.0 / _576;
        float _580 = _118 * _578;
        _572 = _580;
    }
    _574 = false;
    float _582 = _572;
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _586 = _582 + _584;
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _590 = _582 + _588;
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _594 = _582 + _592;
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _596;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _602 = _600 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _604;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _610 = _608 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _612 = 1.0 / _602;
    float _614 = 1.0 / _606;
    bool _616 = _582 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _618 = isnan(_582);
    bool _620 = _616 || _618;
    bool _622 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _624 = _620 || _622;
    float _626 = float(_624);
    bool _628 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _630 = 1.0 / _610;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _634 = _582 + _632;
    float _636 = 1.0 / _598;
    float _638 = _634 * _612;
    bool _640 = _582 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _642 = isnan(_582);
    bool _644 = _640 || _642;
    bool _646 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _648 = _644 || _646;
    float _650 = float(_648);
    float _652 = _586 * _614;
    bool _654 = _582 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _656 = isnan(_582);
    bool _658 = _654 || _656;
    bool _660 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _662 = _658 || _660;
    float _664 = float(_662);
    bool _666 = _582 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _668 = isnan(_582);
    bool _670 = _666 || _668;
    bool _672 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _674 = _670 || _672;
    float _676 = float(_674);
    float _678 = -_650;
    float _680 = _678 + 1.0;
    float _682 = _590 * _630;
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _684;
    bool _688 = _582 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _690 = isnan(_582);
    bool _692 = _688 || _690;
    bool _694 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _696 = _692 || _694;
    float _698 = float(_696);
    float _700 = _664 * _680;
    float _702 = -_664;
    float _704 = _702 + 1.0;
    float _706 = fma(_686, _652, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _708 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _710 = _708 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _712 = _594 * _636;
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _716 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _714;
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _720 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _718;
    float _722 = _626 * _704;
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _726 = _724 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _728 = fma(_716, _652, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _730 = fma(_720, _652, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _732 = -_626;
    float _734 = _732 + 1.0;
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _738 = _736 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _740 = fma(_710, _682, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _742 = fma(_726, _682, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _744 = _676 * _734;
    float _746 = -_676;
    float _748 = _746 + 1.0;
    float _750 = fma(_738, _682, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _752 = _698 * _748;
    float _754 = -_698;
    float _756 = _754 + 1.0;
    float _758 = _706 * _752;
    float _760 = _728 * _752;
    float _762 = _730 * _752;
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _766 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _764;
    float _768 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[107].x, _758);
    float _770 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[107].y, _760);
    float _772 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[107].z, _762);
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _776 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _774;
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _780 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _778;
    float _782 = fma(_766, _712, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _784 = fma(_740, _744, _768);
    float _786 = fma(_750, _744, _770);
    float _788 = fma(_742, _744, _772);
    float _790 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _792 = _790 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _796 = _794 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _798 = fma(_776, _712, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _800 = fma(_780, _712, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _804 = _802 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _806 = fma(_782, _722, _784);
    float _808 = fma(_792, _638, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _810 = fma(_796, _638, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _812 = fma(_804, _638, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _814 = fma(_798, _722, _786);
    float _816 = fma(_800, _722, _788);
    float _818 = fma(_808, _700, _806);
    float _820 = fma(_810, _700, _814);
    float _822 = fma(_812, _700, _816);
    float _824 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[111].x, _818);
    float _826 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[111].y, _820);
    float _828 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[111].z, _822);
    bool _830 = !_628;
    float _848;
    if (!_830)
    {
        float _832 = in.m_53.x;
        float _834 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _836 = _832 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _838 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[11].y, _118);
        float _840 = _838 * _834;
        float _842 = floor(_840);
        float _844 = -_842;
        float _846 = _840 + _844;
        _848 = _846;
        _850 = true;
    }
    else
    {
        float _852 = float(_86);
        float _854 = 1.0 / _852;
        float _856 = _118 * _854;
        _848 = _856;
    }
    _850 = false;
    float _858 = _848;
    float _860 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _862 = _858 + _860;
    float _864 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _866 = _864 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _868 = _858 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _870 = isnan(_858);
    bool _872 = _868 || _870;
    bool _874 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _876 = _872 || _874;
    float _878 = float(_876);
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _882 = _880 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _884 = _858 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _886 = isnan(_858);
    bool _888 = _884 || _886;
    bool _890 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _892 = _888 || _890;
    float _894 = float(_892);
    float _896 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _898 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _896;
    bool _900 = _858 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _902 = isnan(_858);
    bool _904 = _900 || _902;
    bool _906 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _908 = _904 || _906;
    float _910 = float(_908);
    float _912 = 1.0 / _866;
    float _914 = -_878;
    float _916 = _914 + 1.0;
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _920 = _858 + _918;
    bool _922 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _924 = _894 * _916;
    float _926 = -_894;
    float _928 = _926 + 1.0;
    float _930 = 1.0 / _882;
    float _932 = _898 * _912;
    float _934 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _936 = _934 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _938 = fma(_932, _862, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _940 = _936 * _930;
    float _942 = -_910;
    float _944 = _942 + 1.0;
    float _946 = _938 * _924;
    float _948 = _826 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _950 = fma(_940, _920, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _952 = _878 * _944;
    float _954 = fma(_928, (*spvDescriptorSet0.vp_c9)._m0[115].x, _946);
    float _956 = _828 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _958 = _948 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _960 = fma(_950, _952, _954);
    float _962 = _824 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _964 = _956 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _966 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[117].x, _960);
    float _968 = _962 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _970 = _966 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _968;
    out.m_55.y = _958;
    out.m_55.z = _964;
    out.m_55.w = _970;
    bool _972 = !_922;
    float _990;
    if (!_972)
    {
        float _974 = in.m_53.x;
        float _976 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _978 = _974 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _980 = fma(_978, (*spvDescriptorSet0.vp_c9)._m0[11].w, _118);
        float _982 = _980 * _976;
        float _984 = floor(_982);
        float _986 = -_984;
        float _988 = _982 + _986;
        _990 = _988;
        _992 = true;
    }
    else
    {
        float _994 = float(_86);
        float _996 = 1.0 / _994;
        float _998 = _118 * _996;
        _990 = _998;
    }
    _992 = false;
    float _1000 = _990;
    float _1002 = in.m_53.w;
    float _1004 = _260 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1006 = _260 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1008 = in.m_57.x;
    float _1010 = in.m_57.y;
    float _1012 = in.m_57.z;
    int _1014 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1016 = _1014 != 0;
    float _1018 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1004);
    int _1020 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1022 = _1020 != 0;
    float _1024 = in.m_53.x;
    int _1026 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1028 = _1026 != 0;
    float _1030 = _260 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _1032 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1034 = _1032 != 0;
    float _1036 = in.m_53.y;
    float _1038 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1006);
    float _1040 = in.m_59.y;
    float _1042 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1030);
    float _1044 = _548 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1046 = in.m_59.x;
    float _1048 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1050 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1052 = _1050 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1054 = _1002 > 0.5;
    float _1056 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1058 = _1018;
    bool _1060 = _1054;
    if (_1022)
    {
        float _1062 = in.m_53.z;
        _554 = _1062;
    }
    float _1064 = _554;
    float _1066 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1008);
    float _1068 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1070 = _1068 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _1072 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1074 = _1072 != 0;
    float _1076 = 1.0 / _1052;
    float _1078 = _1024 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1080 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1012);
    float _1082 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1010);
    float _1084 = _546 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1086 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1088 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1038);
    float _1090 = 1.0 / _1070;
    float _1092 = -_1086;
    float _1094 = fma(_1078, 2.0, _1092);
    float _1096 = _550 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1098 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1042);
    float _1100 = _550;
    float _1102 = _1024;
    float _1104 = _1098;
    if (!_1074)
    {
        float _1106 = in.m_53.z;
        _1100 = _1106;
    }
    float _1108 = _1100;
    float _1110 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1018);
    float _1112 = _1096 * _1080;
    float _1114 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1116 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1114;
    float _1118 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1120 = _1036 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1122 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1124 = _1122 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1126 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1128 = _1000 + _1126;
    float _1130 = _1044 * _1082;
    float _1132 = fma(_1120, -2.0, _1056);
    float _1134 = -_1040;
    float _1136 = _1134 + 1.0;
    float _1138 = _1124 * _1090;
    float _1140 = _1084 * _1066;
    float _1142 = _1116 * _1076;
    float _1144 = fma(_1138, _1128, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1146 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1148 = _1000 + _1146;
    float _1150 = _1130 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1152 = _1130 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1154 = _1054 ? _1136 : _1040;
    float _1156 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1158 = fma(_1142, _1148, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1160 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1150);
    float _1162 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1152);
    float _1164 = _1028 ? _1154 : _1040;
    float _1166 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1168 = _1118 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1170 = fma(_1024, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1156);
    float _1172 = _1130 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1174 = _1156;
    float _1176 = _1108;
    float _1178 = _1040;
    float _1180 = _1154;
    if (!_1074)
    {
        _1174 = _1108;
    }
    float _1182 = _1174;
    float _1184 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1160);
    float _1186 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1162);
    float _1188 = _1182;
    if (!_1074)
    {
        _1058 = _1036;
    }
    float _1190 = _1058;
    float _1192 = fma(_1036, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1166);
    bool _1194 = _1036 > 0.5;
    float _1196 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1172);
    float _1198 = _1190;
    if (_1074)
    {
        _1188 = _1036;
    }
    float _1200 = _1188;
    float _1202 = _1184 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1204 = _1200;
    if (_1074)
    {
        _1176 = _1036;
    }
    float _1206 = _1176;
    float _1208 = fma(_1164, _1168, -0.5);
    float _1210 = _1088 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1212 = _1110 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1214 = _1186 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _1216 = as_type<int>(_1206);
    float _1218 = _1212;
    if (_1016)
    {
        bool _1220 = _1024 > 0.5;
        _1060 = _1220;
    }
    bool _1222 = _1060;
    float _1224 = _1210 + _1202;
    if (_1074)
    {
        _1198 = _1024;
    }
    float _1226 = _1198;
    float _1228 = _1212 + _1214;
    if (!_1016)
    {
        _1102 = _1046;
    }
    float _1230 = _1102;
    float _1232 = _1048 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1234 = _1000 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1236 = isnan(_1000);
    bool _1238 = _1234 || _1236;
    bool _1240 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1242 = _1238 || _1240;
    float _1244 = float(_1242);
    float _1246 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1248 = _1228 + _1246;
    float _1250 = _1230;
    float _1252 = _1244;
    if (_1034)
    {
        float _1254 = _1194 ? _1136 : _1040;
        _1178 = _1254;
    }
    float _1256 = _1178;
    float _1258 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1260 = _1224 + _1258;
    if (!_1016)
    {
        _1180 = _1230;
    }
    float _1262 = _1180;
    float _1264 = -_1244;
    float _1266 = _1264 + 1.0;
    bool _1268 = _1000 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1270 = isnan(_1000);
    bool _1272 = _1268 || _1270;
    bool _1274 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1276 = _1272 || _1274;
    float _1278 = float(_1276);
    float _1280 = _1248 * _1248;
    float _1282 = _1262;
    float _1284 = _1280;
    if (_1016)
    {
        _1250 = _1046;
    }
    float _1286 = _1250;
    float _1288 = _1260 * _1260;
    bool _1290 = false;
    float _1292 = _1286;
    float _1294 = _1288;
    if (_1022)
    {
        bool _1296 = _1064 > 0.5;
        _1290 = _1296;
    }
    bool _1298 = _1290;
    float _1300 = _1278 * _1266;
    bool _1302 = _1000 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1304 = isnan(_1000);
    bool _1306 = _1302 || _1304;
    bool _1308 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1310 = _1306 || _1308;
    float _1312 = float(_1310);
    float _1314 = -_1278;
    float _1316 = _1314 + 1.0;
    float _1318 = _1288 + _1280;
    float _1320 = fma(_1232, _1256, -0.5);
    float _1322 = sqrt(_1318);
    float _1324 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1326 = _1312 * _1316;
    float _1328 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1330 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1196);
    float _1332 = fma(_1226, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1324);
    float _1334 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1192);
    float _1336 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1132);
    float _1338 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1340 = _1226 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1342 = fma(_1206, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1328);
    int _1344 = as_type<int>(_1340);
    float _1346 = _1334;
    if (_1016)
    {
        float _1348 = -_1286;
        float _1350 = _1348 + 1.0;
        _1216 = as_type<int>(_1350);
    }
    int _1352 = _1216;
    float _1354 = _1158 * _1326;
    float _1356 = -_1336;
    float _1358 = fma(_1334, _1320, _1356);
    float _1360 = -_1338;
    float _1362 = fma(_1340, 2.0, _1360);
    bool _1364 = _1322 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1366 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_1022)
    {
        float _1368 = -_1286;
        float _1370 = _1368 + 1.0;
        _1344 = as_type<int>(_1370);
    }
    int _1372 = _1344;
    if (_1016)
    {
        float _1374 = _1222 ? as_type<float>(_1352) : _1286;
        _1282 = _1374;
    }
    float _1376 = _1282;
    float _1378 = _1098 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1380 = _1330 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1382 = -_1312;
    float _1384 = _1382 + 1.0;
    if (_1022)
    {
        float _1386 = _1298 ? as_type<float>(_1372) : _1286;
        _1292 = _1386;
    }
    float _1388 = _1292;
    float _1390 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1392 = _1378 + _1380;
    float _1394 = fma(_1384, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1354);
    float _1396 = _1200 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (!_1364)
    {
        _1104 = _1224;
    }
    float _1398 = _1104;
    float _1400 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1402 = _1398;
    if (!_1364)
    {
        _1204 = _1228;
    }
    float _1404 = _1204;
    float _1406 = _1404;
    if (!_1364)
    {
        _1346 = _1392;
    }
    float _1408 = _1346;
    bool _1410 = !_1364;
    float _1412 = _1408;
    if (!_1410)
    {
        float _1414 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1416 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1418 = _1322 + _1416;
        float _1420 = rsqrt(_1318);
        float _1422 = _1418 * _1414;
        float _1424 = _1392 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1426 = _1422 * 0.15915493667125701904296875;
        float _1428 = _1426 * 6.283185482025146484375;
        float _1430 = sin(_1428);
        float _1432 = _1426 * 6.283185482025146484375;
        float _1434 = cos(_1432);
        float _1436 = fma(_1430, _1424, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1438 = _1420 * _1436;
        float _1440 = _1434 + (-1.0);
        float _1442 = fma(_1260, _1438, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1444 = fma(_1248, _1438, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1446 = _1440 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1448 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1450 = _1442 + _1448;
        float _1452 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1454 = _1444 + _1452;
        float _1456 = fma(_1392, _1434, _1446);
        float _1458 = _1450 * _1450;
        float _1460 = _1454 * _1454;
        _1412 = _1456;
        _1294 = _1458;
        _1284 = _1460;
        _1402 = _1442;
        _1406 = _1444;
    }
    float _1462 = _1412;
    float _1464 = _1294;
    float _1466 = _1284;
    float _1468 = _1402;
    float _1470 = _1406;
    float _1472 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1474 = _1462 + _1472;
    float _1476 = fma(_1396, -2.0, _1400);
    float _1478 = _1366 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1480 = _1390 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1482 = fma(_1474, _1474, _1464);
    float _1484 = fma(_1144, _1300, _1394);
    float _1486 = fma(_1478, _1376, -0.5);
    float _1488 = fma(_1480, _1388, -0.5);
    float _1490 = _1482 + _1466;
    float _1492 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1170);
    float _1494 = -_118;
    float _1496 = fma(_1494, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1094);
    float _1498 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1332);
    float _1500 = -_118;
    float _1502 = fma(_1500, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1362);
    float _1504 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1342);
    float _1506 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1476);
    float _1508 = sqrt(_1490);
    float _1510 = fma(_1492, _1486, _1496);
    float _1512 = fma(_1498, _1488, _1502);
    float _1514 = -_1506;
    float _1516 = fma(_1504, _1208, _1514);
    float _1518 = fma(_1244, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1484);
    float _1520 = _1358 + 0.5;
    float _1522 = _1510 + 0.5;
    float _1524 = _1512 + 0.5;
    float _1526 = _1516 + 0.5;
    float _1528 = _1518 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_61.x = _1522;
    out.m_61.y = _1520;
    out.m_61.z = _1524;
    out.m_61.w = _1526;
    bool _1530 = _1508 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1532 = isnan(_1508);
    bool _1534 = _1530 || _1532;
    bool _1536 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1538 = _1534 || _1536;
    out.m_63.w = _1528;
    if (!_1538)
    {
        _122 = 1.0;
    }
    float _1540 = _122;
    bool _1542 = !_1538;
    float _1544 = _1540;
    if (!_1542)
    {
        bool _1546 = _1508 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1548 = isnan(_1508);
        bool _1550 = _1546 || _1548;
        bool _1552 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1554 = _1550 || _1552;
        if (!_1554)
        {
            float _1556 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1558 = _1508 + _1556;
            float _1560 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1562 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1560;
            float _1564 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1566 = _1564 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1568 = 1.0 / _1562;
            float _1570 = _1558 * _1568;
            float _1572 = fma(_1570, _1566, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1544 = _1572;
            _1574 = true;
        }
        else
        {
            bool _1576 = _1508 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1578 = isnan(_1508);
            bool _1580 = _1576 || _1578;
            bool _1582 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1584 = _1580 || _1582;
            if (!_1584)
            {
                float _1586 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1588 = _1508 + _1586;
                float _1590 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1592 = _1590 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1594 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1596 = _1594 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1598 = 1.0 / _1592;
                float _1600 = _1588 * _1598;
                float _1602 = fma(_1600, _1596, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1544 = _1602;
                _1574 = true;
            }
            else
            {
                _1544 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1574 = false;
    float _1604 = _1544;
    float _1606 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1608 = _1462 + _1606;
    float _1610 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1612 = _1468 + _1610;
    float _1614 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1616 = _1470 + _1614;
    float _1618 = fma(_1608, _1604, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1620 = fma(_1612, _1604, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1622 = fma(_1616, _1604, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1624 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1626 = _1618 + _1624;
    float _1628 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1630 = _1620 + _1628;
    float _1632 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1634 = _1622 + _1632;
    float _1636 = _1626 * _1626;
    float _1638 = fma(_1630, _1630, _1636);
    float _1640 = fma(_1634, _1634, _1638);
    float _1642 = rsqrt(_1640);
    float _1644 = _1642 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1646 = _1630 * _1644;
    float _1648 = _1634 * _1644;
    float _1650 = _1646 * _1646;
    float _1652 = _1648 * _1648;
    float _1654 = _1650 + _1652;
    float _1656 = sqrt(_1654);
    bool _1658 = _1656 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1660 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1662 = _1656 + _1660;
    float _1664 = _1470;
    float _1666 = _1654;
    float _1668 = _1662;
    float _1670 = _1626;
    float _1672 = _1644;
    float _1674 = _1646;
    if (_1658)
    {
        float _1676 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1664 = _1676;
    }
    float _1678 = _1664;
    if (_1658)
    {
        float _1680 = rsqrt(_1654);
        _1666 = _1680;
    }
    float _1682 = _1666;
    float _1684 = _1678;
    float _1686 = _1682;
    if (_1658)
    {
        float _1688 = _1662 * _1678;
        _1668 = _1688;
    }
    float _1690 = _1668;
    if (_1658)
    {
        float _1692 = _1690 * 0.15915493667125701904296875;
        _1252 = _1692;
    }
    float _1694 = _1252;
    float _1696 = _1634;
    if (_1658)
    {
        float _1698 = _1694 * 6.283185482025146484375;
        float _1700 = sin(_1698);
        _1696 = _1700;
    }
    float _1702 = _1696;
    float _1704 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1706 = precise::max(0.0, _1704);
    float _1708 = _1358;
    float _1710 = _1706;
    if (_1658)
    {
        float _1712 = _1694 * 6.283185482025146484375;
        float _1714 = cos(_1712);
        _1708 = _1714;
    }
    float _1716 = _1708;
    float _1718 = -_1644;
    float _1720 = -_1706;
    float _1722 = fma(_1626, _1718, _1720);
    if (_1658)
    {
        float _1724 = _1722 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1670 = _1724;
    }
    float _1726 = _1670;
    float _1728 = sqrt(_1640);
    float _1730 = _1702;
    float _1732 = _1726;
    if (_1658)
    {
        float _1734 = fma(_1702, _1726, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1730 = _1734;
    }
    float _1736 = _1730;
    float _1738 = _1736;
    if (!_1658)
    {
        _1732 = _1648;
    }
    float _1740 = _1732;
    float _1742 = _1740;
    if (_1658)
    {
        float _1744 = _1716 + (-1.0);
        _1710 = _1744;
    }
    float _1746 = _1710;
    float _1748 = _1746;
    if (_1658)
    {
        float _1750 = _1682 * _1736;
        _1672 = _1750;
    }
    float _1752 = _1672;
    if (!_1658)
    {
        _1738 = _1722;
    }
    float _1754 = _1738;
    float _1756 = _1754;
    if (_1658)
    {
        float _1758 = _1746 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1684 = _1758;
    }
    float _1760 = _1684;
    if (_1658)
    {
        float _1762 = _1646 * _1752;
        _1674 = _1762;
    }
    float _1764 = _1674;
    if (!_1658)
    {
        _1686 = _1650;
    }
    float _1766 = _1686;
    float _1768 = _1766;
    if (_1658)
    {
        float _1770 = _1648 * _1752;
        _1742 = _1770;
    }
    float _1772 = _1742;
    if (_1658)
    {
        float _1774 = fma(_1722, _1716, _1760);
        _1756 = _1774;
    }
    float _1776 = _1756;
    if (_1658)
    {
        float _1778 = _1764 * _1764;
        _1768 = _1778;
    }
    float _1780 = _1768;
    if (!_1658)
    {
        _1748 = _1652;
    }
    float _1782 = _1748;
    float _1784 = _1782;
    if (_1658)
    {
        float _1786 = _1772 * _1772;
        _1784 = _1786;
    }
    float _1788 = _1784;
    float _1790 = fma(_1776, _1776, _1780);
    float _1792 = _1790 + _1788;
    float _1794 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1796 = fma(_1728, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1794);
    float _1798 = precise::clamp(_1796, 0.0, 1.0);
    float _1800 = _1618 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1802 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1804 = rsqrt(_1792);
    float _1806 = _1618 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1808 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1800);
    float _1810 = -_1798;
    float _1812 = _1810 + 1.0;
    float _1814 = _1618 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1816 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1806);
    float _1818 = _1618 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1820 = fma(_1622, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1808);
    float _1822 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1814);
    float _1824 = fma(_1622, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1816);
    float _1826 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1818);
    float _1828 = abs(_1812);
    float _1830 = log2(_1828);
    float _1832 = fma(_1622, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1822);
    float _1834 = _1824 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1836 = fma(_1622, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1826);
    float _1838 = _1820 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1840 = _1804 * _1764;
    float _1842 = _1804 * _1776;
    float _1844 = _1832 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1846 = _1834 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1848 = _1840 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1850 = _1836 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1852 = _1804 * _1772;
    float _1854 = fma(_1844, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1846);
    float _1856 = -_1848;
    float _1858 = fma(_1842, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1856);
    float _1860 = _1838 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1862 = fma(_1838, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1854);
    float _1864 = -_1852;
    float _1866 = fma(_1864, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1858);
    float _1868 = -_1860;
    float _1870 = fma(_1868, _1802, 1.0);
    float _1872 = _1830 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1874 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1862);
    float _1876 = fma(_1866, -0.5, 0.5);
    float _1878 = _1834 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1880 = exp2(_1872);
    float _1882 = _1834 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1884 = fma(_1866, 0.5, 0.5);
    float _1886 = fma(_1844, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1878);
    float _1888 = _1842 + 1.0;
    float _1890 = fma(_1844, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1882);
    float _1892 = fma(_1884, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1894 = fma(_1838, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1886);
    float _1896 = log2(_1870);
    float _1898 = fma(_1838, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1890);
    float _1900 = fma(_1884, _1892, -0.212114393711090087890625);
    float _1902 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1894);
    float _1904 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1898);
    float _1906 = fma(_1884, _1900, 1.570728778839111328125);
    float _1908 = 1.0 / _1874;
    float _1910 = -_1842;
    float _1912 = fma(_1880, _1888, _1910);
    float _1914 = fma(_1912, 0.5, 0.5);
    float _1916 = sqrt(_1876);
    float _1918 = _1896 * 0.693147182464599609375;
    float _1920 = _1918 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1922 = _1902 * _1908;
    float _1924 = _1904 * _1908;
    float _1926 = fma(_1922, 0.5, 0.5);
    float _1928 = fma(_1924, -0.5, 0.5);
    float _1930 = _1916 * 0.636619746685028076171875;
    float _1932 = -_1906;
    float _1934 = fma(_1930, _1932, 1.0);
    float3 _5218 = float3(_1926, _1928, _1920);
    float _1936 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5218, float3(0.0), isnan(_5218)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5218, float3(0.0), isnan(_5218)), level(0.0)).x;
    float3 _5229 = float3(_1926, _1928, _1920);
    float4 _1939 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5229, float3(0.0), isnan(_5229)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5229, float3(0.0), isnan(_5229)), level(0.0)).xyzw;
    float _1941 = _1939.x;
    float _1943 = _1939.y;
    float _1945 = _1939.z;
    float _1947 = _1939.w;
    float2 _5246 = float2(_1934, _1914);
    float3 _1951 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5246, float2(0.0), isnan(_5246)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5246, float2(0.0), isnan(_5246)), level(0.0)).xyz;
    float _1953 = _1951.x;
    float _1955 = _1951.y;
    float _1957 = _1951.z;
    float _1959 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1961 = _1830 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1963 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1959);
    bool _1965 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1967 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1969 = _1965 || _1967;
    bool _1971 = isnan(0.5);
    bool _1973 = _1969 || _1971;
    float _1975 = exp2(_1961);
    float _1977 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1963);
    float _1979 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1981 = _1977 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1983 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1979);
    float _1985 = _1834 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1987 = 1.0 / _1981;
    float _1989 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1983);
    float _1991 = fma(_1844, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1985);
    if (_1973)
    {
        _1218 = 1.0;
    }
    float _1993 = _1218;
    float _1995 = _1989 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1997 = fma(_1838, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1991);
    float _1999 = _1995 + _1981;
    float _2001 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1997);
    float _2003 = _1999 * _1987;
    float _2005 = _2003 * 0.5;
    float _2007 = _1993;
    if (!_1973)
    {
        float _2009 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2011 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2013 = fma(_2005, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2011);
        float _2015 = _2009 * 0.15915493667125701904296875;
        float _2017 = _2015 * 6.283185482025146484375;
        float _2019 = cos(_2017);
        float _2021 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2023 = _2021 * 0.15915493667125701904296875;
        float _2025 = _2015 * 6.283185482025146484375;
        float _2027 = sin(_2025);
        float _2029 = 1.0 / _2019;
        float _2031 = _2023 * 6.283185482025146484375;
        float _2033 = cos(_2031);
        float _2035 = _2027 * _2029;
        float _2037 = 1.0 / _2013;
        float _2039 = _2033 * _2035;
        float _2041 = _2023 * 6.283185482025146484375;
        float _2043 = sin(_2041);
        float _2045 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2047 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2045;
        float _2049 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2051 = _2037 * _2049;
        float _2053 = 1.0 / _2039;
        float _2055 = 1.0 / _2047;
        float _2057 = _2043 * _2053;
        float _2059 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2061 = fma(_2057, _2051, _2059);
        float _2063 = _2061 * _2055;
        float _2065 = precise::clamp(_2063, 0.0, 1.0);
        _2007 = _2065;
    }
    float _2067 = _2007;
    float _2069 = _1874 * 0.5;
    float _2071 = -_1975;
    float _2073 = _2071 + 1.0;
    float _2075 = _2067 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2077 = _2067 > 0.0;
    bool _2079 = isnan(_2067);
    bool _2081 = _2077 || _2079;
    bool _2083 = isnan(0.0);
    bool _2085 = _2081 || _2083;
    float _2087 = fma(_1904, -0.5, _2069);
    float _2089 = _2073 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2091 = _2075 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2093 = _2001 + _1874;
    float _2095 = _1902 + _1874;
    float _2097 = _2089 * _1936;
    float _2099 = -_2089;
    float _2101 = _2099 + 1.0;
    out.gl_Position.x = _1902;
    out.gl_Position.y = _1904;
    out.gl_Position.z = _2001;
    out.gl_Position.w = _1874;
    float _2103 = _1947 * _2097;
    float _2105 = _1957 * _2097;
    float _2107 = _2093 * 0.5;
    float _2109 = _2095 * 0.5;
    float _2111 = fma(_1953, _2103, _1941);
    float _2113 = fma(_1955, _2103, _1943);
    float _2115 = _1947 * _2101;
    float _2117 = fma(_1947, _2105, _1945);
    out.m_65.x = _2109;
    out.m_65.y = _2087;
    out.m_65.z = _2107;
    out.m_65.w = _1874;
    out.m_47.x = _2091;
    out.m_67.x = _2111;
    out.m_67.y = _2113;
    out.m_67.z = _2117;
    out.m_67.w = _2115;
    if (_2085)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2119 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2119;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1574 = false;
    bool _992 = false;
    bool _850 = false;
    bool _574 = false;
    bool _284 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _81 = in.m_44.w;
    float _83 = trunc(_81);
    int _86 = int(_83);
    bool _90 = _86 >= 1;
    float _92 = 0.0;
    if (!_90)
    {
        _92 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _94 = _92;
    if (!_90)
    {
        out.m_47.x = 0.0;
    }
    int _96 = 0;
    if (!_90)
    {
        float _98 = _94 * 5.0;
        _96 = as_type<int>(_98);
    }
    int _100 = _96;
    int _102 = _100;
    if (!_90)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2175 = as_type<float>(_100);
        out.gl_Position.z = _2175;
    }
    if (!_90)
    {
        return out;
    }
    float _104 = in.m_49.w;
    bool _106 = _104 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _108 = isnan(_104);
    bool _110 = _106 || _108;
    bool _112 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _114 = _110 || _112;
    float _116 = -_104;
    float _118 = _116 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _120 = 0.0;
    float _122 = _118;
    if (_114)
    {
        float _124 = float(_86);
        _120 = _124;
    }
    float _126 = _120;
    bool _128 = _118 >= _126;
    bool _130 = !_114;
    bool _132 = _128 || _130;
    float _134 = 0.0;
    if (_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _134;
    float _138 = _136;
    if (_132)
    {
        out.m_47.x = 0.0;
    }
    if (_132)
    {
        float _140 = _136 * 5.0;
        _102 = as_type<int>(_140);
    }
    int _142 = _102;
    if (_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2245 = as_type<float>(_142);
        out.gl_Position.z = _2245;
    }
    if (_132)
    {
        return out;
    }
    float _144 = in.m_51.w;
    float _146 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _148 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _150 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _152 = _148 || _150;
    bool _154 = isnan(1.0);
    bool _156 = _152 || _154;
    float _158 = in.m_49.x;
    float _160 = in.m_49.y;
    float _162 = in.m_49.z;
    float _164 = in.m_44.x;
    float _166 = in.m_44.y;
    float _168 = in.m_44.z;
    float _170 = _146;
    if (!_156)
    {
        float _172 = _146 * _146;
        float _174 = _172 * 0.5;
        _138 = _174;
    }
    float _176 = _138;
    float _178 = _176;
    if (!_156)
    {
        float _180 = _176 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _180;
    }
    float _182 = _178;
    bool _184 = !_156;
    float _186 = _182;
    if (!_184)
    {
        float _188 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _190 = log2(_188);
        float _192 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _194 = _192 + 1.0;
        float _196 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = _146 * _190;
        float _200 = 1.0 / _194;
        float _202 = _196 * 0.693147182464599609375;
        float _204 = exp2(_198);
        float _206 = 1.0 / _202;
        float _208 = _204 + (-1.0);
        float _210 = -_208;
        float _212 = fma(_210, _206, _146);
        float _214 = _212 * _200;
        float _216 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _216;
    }
    float _218 = _186;
    bool _220 = !_156;
    if (!_220)
    {
        float _222 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _224 = log2(_222);
        float _226 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _228 = _226 + 1.0;
        float _230 = 1.0 / _228;
        float _232 = _146 * _224;
        float _234 = exp2(_232);
        float _236 = -_234;
        float _238 = _236 + 1.0;
        float _240 = _238 * _230;
        _170 = _240;
    }
    float _242 = _170;
    bool _244 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _246 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _248 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _250 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _252 = fma(_242, _158, _246);
    float _254 = fma(_242, _160, _248);
    float _256 = fma(_242, _162, _250);
    float _258 = fma(_252, _144, _164);
    float _260 = fma(_254, _144, _166);
    float _262 = fma(_256, _144, _168);
    bool _264 = !_244;
    float _282;
    if (!_264)
    {
        float _266 = in.m_53.x;
        float _268 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _270 = _266 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _272 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[12].x, _118);
        float _274 = _272 * _268;
        float _276 = floor(_274);
        float _278 = -_276;
        float _280 = _274 + _278;
        _282 = _280;
        _284 = true;
    }
    else
    {
        float _286 = float(_86);
        float _288 = 1.0 / _286;
        float _290 = _118 * _288;
        _282 = _290;
    }
    _284 = false;
    float _292 = _282;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _296 = _292 + _294;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _300 = _292 + _298;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _304 = _292 + _302;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _308 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _306;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _312 = _310 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _316 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _314;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _320 = _318 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _322 = 1.0 / _308;
    bool _324 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _326 = isnan(_292);
    bool _328 = _324 || _326;
    bool _330 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _332 = _328 || _330;
    float _334 = float(_332);
    bool _336 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _338 = isnan(_292);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    float _348 = 1.0 / _312;
    float _350 = -_346;
    float _352 = _350 + 1.0;
    bool _354 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _356 = 1.0 / _316;
    float _358 = _296 * _322;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _362 = _292 + _360;
    float _364 = 1.0 / _320;
    float _366 = _300 * _348;
    bool _368 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _370 = isnan(_292);
    bool _372 = _368 || _370;
    bool _374 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _376 = _372 || _374;
    float _378 = float(_376);
    float _380 = -_378;
    float _382 = _380 + 1.0;
    float _384 = _304 * _356;
    float _386 = _362 * _364;
    bool _388 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _390 = isnan(_292);
    bool _392 = _388 || _390;
    bool _394 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _396 = _392 || _394;
    float _398 = float(_396);
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _400;
    float _404 = _398 * _382;
    float _406 = -_398;
    float _408 = _406 + 1.0;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _410;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _414;
    float _418 = fma(_402, _358, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _420 = _334 * _408;
    float _422 = -_334;
    float _424 = _422 + 1.0;
    float _426 = fma(_412, _358, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _428 = fma(_416, _358, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _430 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _432 = isnan(_292);
    bool _434 = _430 || _432;
    bool _436 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _438 = _434 || _436;
    float _440 = float(_438);
    float _442 = _346 * _424;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _450 = _448 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _454 = _452 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _456 = _440 * _352;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _458;
    float _462 = fma(_450, _366, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _464 = fma(_454, _366, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _466 = _426 * _456;
    float _468 = _428 * _456;
    float _470 = _418 * _456;
    float _472 = -_440;
    float _474 = _472 + 1.0;
    float _476 = in.m_51.x;
    float _478 = in.m_51.y;
    float _480 = in.m_51.z;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _482;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _486;
    float _490 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[143].x, _466);
    float _492 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[143].y, _468);
    float _494 = fma(_446, _366, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _496 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[143].z, _470);
    float _498 = fma(_484, _384, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _500 = fma(_460, _384, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _502 = fma(_488, _384, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _504 = fma(_462, _442, _490);
    float _506 = fma(_464, _442, _492);
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _510 = _508 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _514 = _512 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _518 = _516 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _520 = fma(_494, _442, _496);
    float _522 = fma(_510, _386, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _524 = fma(_514, _386, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _526 = fma(_518, _386, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _528 = fma(_498, _420, _504);
    float _530 = fma(_500, _420, _506);
    float _532 = fma(_502, _420, _520);
    float _534 = fma(_522, _404, _528);
    float _536 = fma(_524, _404, _530);
    float _538 = fma(_526, _404, _532);
    float _540 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[147].x, _534);
    float _542 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[147].y, _536);
    float _544 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[147].z, _538);
    float _546 = _540 * _476;
    float _548 = _542 * _478;
    float _550 = _544 * _480;
    bool _552 = !_354;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _572;
    if (!_552)
    {
        float _556 = in.m_53.x;
        float _558 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _560 = _556 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _562 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[11].x, _118);
        float _564 = _562 * _558;
        float _566 = floor(_564);
        float _568 = -_566;
        float _570 = _564 + _568;
        _572 = _570;
        _574 = true;
    }
    else
    {
        float _576 = float(_86);
        float _578 = 1.0 / _576;
        float _580 = _118 * _578;
        _572 = _580;
    }
    _574 = false;
    float _582 = _572;
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _586 = _582 + _584;
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _590 = _582 + _588;
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _594 = _582 + _592;
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _596;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _602 = _600 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _604;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _610 = _608 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _612 = 1.0 / _602;
    float _614 = 1.0 / _606;
    bool _616 = _582 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _618 = isnan(_582);
    bool _620 = _616 || _618;
    bool _622 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _624 = _620 || _622;
    float _626 = float(_624);
    bool _628 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _630 = 1.0 / _610;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _634 = _582 + _632;
    float _636 = 1.0 / _598;
    float _638 = _634 * _612;
    bool _640 = _582 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _642 = isnan(_582);
    bool _644 = _640 || _642;
    bool _646 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _648 = _644 || _646;
    float _650 = float(_648);
    float _652 = _586 * _614;
    bool _654 = _582 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _656 = isnan(_582);
    bool _658 = _654 || _656;
    bool _660 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _662 = _658 || _660;
    float _664 = float(_662);
    bool _666 = _582 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _668 = isnan(_582);
    bool _670 = _666 || _668;
    bool _672 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _674 = _670 || _672;
    float _676 = float(_674);
    float _678 = -_650;
    float _680 = _678 + 1.0;
    float _682 = _590 * _630;
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _684;
    bool _688 = _582 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _690 = isnan(_582);
    bool _692 = _688 || _690;
    bool _694 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _696 = _692 || _694;
    float _698 = float(_696);
    float _700 = _664 * _680;
    float _702 = -_664;
    float _704 = _702 + 1.0;
    float _706 = fma(_686, _652, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _708 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _710 = _708 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _712 = _594 * _636;
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _716 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _714;
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _720 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _718;
    float _722 = _626 * _704;
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _726 = _724 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _728 = fma(_716, _652, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _730 = fma(_720, _652, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _732 = -_626;
    float _734 = _732 + 1.0;
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _738 = _736 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _740 = fma(_710, _682, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _742 = fma(_726, _682, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _744 = _676 * _734;
    float _746 = -_676;
    float _748 = _746 + 1.0;
    float _750 = fma(_738, _682, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _752 = _698 * _748;
    float _754 = -_698;
    float _756 = _754 + 1.0;
    float _758 = _706 * _752;
    float _760 = _728 * _752;
    float _762 = _730 * _752;
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _766 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _764;
    float _768 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[107].x, _758);
    float _770 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[107].y, _760);
    float _772 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[107].z, _762);
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _776 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _774;
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _780 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _778;
    float _782 = fma(_766, _712, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _784 = fma(_740, _744, _768);
    float _786 = fma(_750, _744, _770);
    float _788 = fma(_742, _744, _772);
    float _790 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _792 = _790 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _796 = _794 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _798 = fma(_776, _712, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _800 = fma(_780, _712, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _804 = _802 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _806 = fma(_782, _722, _784);
    float _808 = fma(_792, _638, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _810 = fma(_796, _638, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _812 = fma(_804, _638, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _814 = fma(_798, _722, _786);
    float _816 = fma(_800, _722, _788);
    float _818 = fma(_808, _700, _806);
    float _820 = fma(_810, _700, _814);
    float _822 = fma(_812, _700, _816);
    float _824 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[111].x, _818);
    float _826 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[111].y, _820);
    float _828 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[111].z, _822);
    bool _830 = !_628;
    float _848;
    if (!_830)
    {
        float _832 = in.m_53.x;
        float _834 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _836 = _832 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _838 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[11].y, _118);
        float _840 = _838 * _834;
        float _842 = floor(_840);
        float _844 = -_842;
        float _846 = _840 + _844;
        _848 = _846;
        _850 = true;
    }
    else
    {
        float _852 = float(_86);
        float _854 = 1.0 / _852;
        float _856 = _118 * _854;
        _848 = _856;
    }
    _850 = false;
    float _858 = _848;
    float _860 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _862 = _858 + _860;
    float _864 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _866 = _864 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _868 = _858 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _870 = isnan(_858);
    bool _872 = _868 || _870;
    bool _874 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _876 = _872 || _874;
    float _878 = float(_876);
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _882 = _880 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _884 = _858 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _886 = isnan(_858);
    bool _888 = _884 || _886;
    bool _890 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _892 = _888 || _890;
    float _894 = float(_892);
    float _896 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _898 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _896;
    bool _900 = _858 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _902 = isnan(_858);
    bool _904 = _900 || _902;
    bool _906 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _908 = _904 || _906;
    float _910 = float(_908);
    float _912 = 1.0 / _866;
    float _914 = -_878;
    float _916 = _914 + 1.0;
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _920 = _858 + _918;
    bool _922 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _924 = _894 * _916;
    float _926 = -_894;
    float _928 = _926 + 1.0;
    float _930 = 1.0 / _882;
    float _932 = _898 * _912;
    float _934 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _936 = _934 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _938 = fma(_932, _862, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _940 = _936 * _930;
    float _942 = -_910;
    float _944 = _942 + 1.0;
    float _946 = _938 * _924;
    float _948 = _826 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _950 = fma(_940, _920, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _952 = _878 * _944;
    float _954 = fma(_928, (*spvDescriptorSet0.vp_c9)._m0[115].x, _946);
    float _956 = _828 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _958 = _948 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _960 = fma(_950, _952, _954);
    float _962 = _824 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _964 = _956 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _966 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[117].x, _960);
    float _968 = _962 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _970 = _966 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _968;
    out.m_55.y = _958;
    out.m_55.z = _964;
    out.m_55.w = _970;
    bool _972 = !_922;
    float _990;
    if (!_972)
    {
        float _974 = in.m_53.x;
        float _976 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _978 = _974 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _980 = fma(_978, (*spvDescriptorSet0.vp_c9)._m0[11].w, _118);
        float _982 = _980 * _976;
        float _984 = floor(_982);
        float _986 = -_984;
        float _988 = _982 + _986;
        _990 = _988;
        _992 = true;
    }
    else
    {
        float _994 = float(_86);
        float _996 = 1.0 / _994;
        float _998 = _118 * _996;
        _990 = _998;
    }
    _992 = false;
    float _1000 = _990;
    float _1002 = in.m_53.w;
    float _1004 = _260 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1006 = _260 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1008 = in.m_57.x;
    float _1010 = in.m_57.y;
    float _1012 = in.m_57.z;
    int _1014 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1016 = _1014 != 0;
    float _1018 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1004);
    int _1020 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1022 = _1020 != 0;
    float _1024 = in.m_53.x;
    int _1026 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1028 = _1026 != 0;
    float _1030 = _260 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _1032 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1034 = _1032 != 0;
    float _1036 = in.m_53.y;
    float _1038 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1006);
    float _1040 = in.m_59.y;
    float _1042 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1030);
    float _1044 = _548 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1046 = in.m_59.x;
    float _1048 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1050 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1052 = _1050 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1054 = _1002 > 0.5;
    float _1056 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1058 = _1018;
    bool _1060 = _1054;
    if (_1022)
    {
        float _1062 = in.m_53.z;
        _554 = _1062;
    }
    float _1064 = _554;
    float _1066 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1008);
    float _1068 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1070 = _1068 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _1072 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1074 = _1072 != 0;
    float _1076 = 1.0 / _1052;
    float _1078 = _1024 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1080 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1012);
    float _1082 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1010);
    float _1084 = _546 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1086 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1088 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1038);
    float _1090 = 1.0 / _1070;
    float _1092 = -_1086;
    float _1094 = fma(_1078, 2.0, _1092);
    float _1096 = _550 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1098 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1042);
    float _1100 = _550;
    float _1102 = _1024;
    float _1104 = _1098;
    if (!_1074)
    {
        float _1106 = in.m_53.z;
        _1100 = _1106;
    }
    float _1108 = _1100;
    float _1110 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1018);
    float _1112 = _1096 * _1080;
    float _1114 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1116 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1114;
    float _1118 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1120 = _1036 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1122 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1124 = _1122 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1126 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1128 = _1000 + _1126;
    float _1130 = _1044 * _1082;
    float _1132 = fma(_1120, -2.0, _1056);
    float _1134 = -_1040;
    float _1136 = _1134 + 1.0;
    float _1138 = _1124 * _1090;
    float _1140 = _1084 * _1066;
    float _1142 = _1116 * _1076;
    float _1144 = fma(_1138, _1128, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1146 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1148 = _1000 + _1146;
    float _1150 = _1130 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1152 = _1130 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1154 = _1054 ? _1136 : _1040;
    float _1156 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1158 = fma(_1142, _1148, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1160 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1150);
    float _1162 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1152);
    float _1164 = _1028 ? _1154 : _1040;
    float _1166 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1168 = _1118 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1170 = fma(_1024, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1156);
    float _1172 = _1130 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1174 = _1156;
    float _1176 = _1108;
    float _1178 = _1040;
    float _1180 = _1154;
    if (!_1074)
    {
        _1174 = _1108;
    }
    float _1182 = _1174;
    float _1184 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1160);
    float _1186 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1162);
    float _1188 = _1182;
    if (!_1074)
    {
        _1058 = _1036;
    }
    float _1190 = _1058;
    float _1192 = fma(_1036, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1166);
    bool _1194 = _1036 > 0.5;
    float _1196 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1172);
    float _1198 = _1190;
    if (_1074)
    {
        _1188 = _1036;
    }
    float _1200 = _1188;
    float _1202 = _1184 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1204 = _1200;
    if (_1074)
    {
        _1176 = _1036;
    }
    float _1206 = _1176;
    float _1208 = fma(_1164, _1168, -0.5);
    float _1210 = _1088 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1212 = _1110 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1214 = _1186 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _1216 = as_type<int>(_1206);
    float _1218 = _1212;
    if (_1016)
    {
        bool _1220 = _1024 > 0.5;
        _1060 = _1220;
    }
    bool _1222 = _1060;
    float _1224 = _1210 + _1202;
    if (_1074)
    {
        _1198 = _1024;
    }
    float _1226 = _1198;
    float _1228 = _1212 + _1214;
    if (!_1016)
    {
        _1102 = _1046;
    }
    float _1230 = _1102;
    float _1232 = _1048 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1234 = _1000 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1236 = isnan(_1000);
    bool _1238 = _1234 || _1236;
    bool _1240 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1242 = _1238 || _1240;
    float _1244 = float(_1242);
    float _1246 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1248 = _1228 + _1246;
    float _1250 = _1230;
    float _1252 = _1244;
    if (_1034)
    {
        float _1254 = _1194 ? _1136 : _1040;
        _1178 = _1254;
    }
    float _1256 = _1178;
    float _1258 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1260 = _1224 + _1258;
    if (!_1016)
    {
        _1180 = _1230;
    }
    float _1262 = _1180;
    float _1264 = -_1244;
    float _1266 = _1264 + 1.0;
    bool _1268 = _1000 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1270 = isnan(_1000);
    bool _1272 = _1268 || _1270;
    bool _1274 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1276 = _1272 || _1274;
    float _1278 = float(_1276);
    float _1280 = _1248 * _1248;
    float _1282 = _1262;
    float _1284 = _1280;
    if (_1016)
    {
        _1250 = _1046;
    }
    float _1286 = _1250;
    float _1288 = _1260 * _1260;
    bool _1290 = false;
    float _1292 = _1286;
    float _1294 = _1288;
    if (_1022)
    {
        bool _1296 = _1064 > 0.5;
        _1290 = _1296;
    }
    bool _1298 = _1290;
    float _1300 = _1278 * _1266;
    bool _1302 = _1000 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1304 = isnan(_1000);
    bool _1306 = _1302 || _1304;
    bool _1308 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1310 = _1306 || _1308;
    float _1312 = float(_1310);
    float _1314 = -_1278;
    float _1316 = _1314 + 1.0;
    float _1318 = _1288 + _1280;
    float _1320 = fma(_1232, _1256, -0.5);
    float _1322 = sqrt(_1318);
    float _1324 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1326 = _1312 * _1316;
    float _1328 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1330 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1196);
    float _1332 = fma(_1226, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1324);
    float _1334 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1192);
    float _1336 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1132);
    float _1338 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1340 = _1226 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1342 = fma(_1206, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1328);
    int _1344 = as_type<int>(_1340);
    float _1346 = _1334;
    if (_1016)
    {
        float _1348 = -_1286;
        float _1350 = _1348 + 1.0;
        _1216 = as_type<int>(_1350);
    }
    int _1352 = _1216;
    float _1354 = _1158 * _1326;
    float _1356 = -_1336;
    float _1358 = fma(_1334, _1320, _1356);
    float _1360 = -_1338;
    float _1362 = fma(_1340, 2.0, _1360);
    bool _1364 = _1322 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1366 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_1022)
    {
        float _1368 = -_1286;
        float _1370 = _1368 + 1.0;
        _1344 = as_type<int>(_1370);
    }
    int _1372 = _1344;
    if (_1016)
    {
        float _1374 = _1222 ? as_type<float>(_1352) : _1286;
        _1282 = _1374;
    }
    float _1376 = _1282;
    float _1378 = _1098 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1380 = _1330 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1382 = -_1312;
    float _1384 = _1382 + 1.0;
    if (_1022)
    {
        float _1386 = _1298 ? as_type<float>(_1372) : _1286;
        _1292 = _1386;
    }
    float _1388 = _1292;
    float _1390 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1392 = _1378 + _1380;
    float _1394 = fma(_1384, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1354);
    float _1396 = _1200 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (!_1364)
    {
        _1104 = _1224;
    }
    float _1398 = _1104;
    float _1400 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1402 = _1398;
    if (!_1364)
    {
        _1204 = _1228;
    }
    float _1404 = _1204;
    float _1406 = _1404;
    if (!_1364)
    {
        _1346 = _1392;
    }
    float _1408 = _1346;
    bool _1410 = !_1364;
    float _1412 = _1408;
    if (!_1410)
    {
        float _1414 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1416 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1418 = _1322 + _1416;
        float _1420 = rsqrt(_1318);
        float _1422 = _1418 * _1414;
        float _1424 = _1392 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1426 = _1422 * 0.15915493667125701904296875;
        float _1428 = _1426 * 6.283185482025146484375;
        float _1430 = sin(_1428);
        float _1432 = _1426 * 6.283185482025146484375;
        float _1434 = cos(_1432);
        float _1436 = fma(_1430, _1424, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1438 = _1420 * _1436;
        float _1440 = _1434 + (-1.0);
        float _1442 = fma(_1260, _1438, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1444 = fma(_1248, _1438, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1446 = _1440 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1448 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1450 = _1442 + _1448;
        float _1452 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1454 = _1444 + _1452;
        float _1456 = fma(_1392, _1434, _1446);
        float _1458 = _1450 * _1450;
        float _1460 = _1454 * _1454;
        _1412 = _1456;
        _1294 = _1458;
        _1284 = _1460;
        _1402 = _1442;
        _1406 = _1444;
    }
    float _1462 = _1412;
    float _1464 = _1294;
    float _1466 = _1284;
    float _1468 = _1402;
    float _1470 = _1406;
    float _1472 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1474 = _1462 + _1472;
    float _1476 = fma(_1396, -2.0, _1400);
    float _1478 = _1366 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1480 = _1390 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1482 = fma(_1474, _1474, _1464);
    float _1484 = fma(_1144, _1300, _1394);
    float _1486 = fma(_1478, _1376, -0.5);
    float _1488 = fma(_1480, _1388, -0.5);
    float _1490 = _1482 + _1466;
    float _1492 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1170);
    float _1494 = -_118;
    float _1496 = fma(_1494, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1094);
    float _1498 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1332);
    float _1500 = -_118;
    float _1502 = fma(_1500, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1362);
    float _1504 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1342);
    float _1506 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1476);
    float _1508 = sqrt(_1490);
    float _1510 = fma(_1492, _1486, _1496);
    float _1512 = fma(_1498, _1488, _1502);
    float _1514 = -_1506;
    float _1516 = fma(_1504, _1208, _1514);
    float _1518 = fma(_1244, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1484);
    float _1520 = _1358 + 0.5;
    float _1522 = _1510 + 0.5;
    float _1524 = _1512 + 0.5;
    float _1526 = _1516 + 0.5;
    float _1528 = _1518 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_61.x = _1522;
    out.m_61.y = _1520;
    out.m_61.z = _1524;
    out.m_61.w = _1526;
    bool _1530 = _1508 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1532 = isnan(_1508);
    bool _1534 = _1530 || _1532;
    bool _1536 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1538 = _1534 || _1536;
    out.m_63.w = _1528;
    if (!_1538)
    {
        _122 = 1.0;
    }
    float _1540 = _122;
    bool _1542 = !_1538;
    float _1544 = _1540;
    if (!_1542)
    {
        bool _1546 = _1508 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1548 = isnan(_1508);
        bool _1550 = _1546 || _1548;
        bool _1552 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1554 = _1550 || _1552;
        if (!_1554)
        {
            float _1556 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1558 = _1508 + _1556;
            float _1560 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1562 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1560;
            float _1564 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1566 = _1564 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1568 = 1.0 / _1562;
            float _1570 = _1558 * _1568;
            float _1572 = fma(_1570, _1566, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1544 = _1572;
            _1574 = true;
        }
        else
        {
            bool _1576 = _1508 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1578 = isnan(_1508);
            bool _1580 = _1576 || _1578;
            bool _1582 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1584 = _1580 || _1582;
            if (!_1584)
            {
                float _1586 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1588 = _1508 + _1586;
                float _1590 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1592 = _1590 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1594 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1596 = _1594 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1598 = 1.0 / _1592;
                float _1600 = _1588 * _1598;
                float _1602 = fma(_1600, _1596, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1544 = _1602;
                _1574 = true;
            }
            else
            {
                _1544 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1574 = false;
    float _1604 = _1544;
    float _1606 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1608 = _1462 + _1606;
    float _1610 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1612 = _1468 + _1610;
    float _1614 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1616 = _1470 + _1614;
    float _1618 = fma(_1608, _1604, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1620 = fma(_1612, _1604, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1622 = fma(_1616, _1604, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1624 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1626 = _1618 + _1624;
    float _1628 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1630 = _1620 + _1628;
    float _1632 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1634 = _1622 + _1632;
    float _1636 = _1626 * _1626;
    float _1638 = fma(_1630, _1630, _1636);
    float _1640 = fma(_1634, _1634, _1638);
    float _1642 = rsqrt(_1640);
    float _1644 = _1642 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1646 = _1630 * _1644;
    float _1648 = _1634 * _1644;
    float _1650 = _1646 * _1646;
    float _1652 = _1648 * _1648;
    float _1654 = _1650 + _1652;
    float _1656 = sqrt(_1654);
    bool _1658 = _1656 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1660 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1662 = _1656 + _1660;
    float _1664 = _1470;
    float _1666 = _1654;
    float _1668 = _1662;
    float _1670 = _1626;
    float _1672 = _1644;
    float _1674 = _1646;
    if (_1658)
    {
        float _1676 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1664 = _1676;
    }
    float _1678 = _1664;
    if (_1658)
    {
        float _1680 = rsqrt(_1654);
        _1666 = _1680;
    }
    float _1682 = _1666;
    float _1684 = _1678;
    float _1686 = _1682;
    if (_1658)
    {
        float _1688 = _1662 * _1678;
        _1668 = _1688;
    }
    float _1690 = _1668;
    if (_1658)
    {
        float _1692 = _1690 * 0.15915493667125701904296875;
        _1252 = _1692;
    }
    float _1694 = _1252;
    float _1696 = _1634;
    if (_1658)
    {
        float _1698 = _1694 * 6.283185482025146484375;
        float _1700 = sin(_1698);
        _1696 = _1700;
    }
    float _1702 = _1696;
    float _1704 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1706 = precise::max(0.0, _1704);
    float _1708 = _1358;
    float _1710 = _1706;
    if (_1658)
    {
        float _1712 = _1694 * 6.283185482025146484375;
        float _1714 = cos(_1712);
        _1708 = _1714;
    }
    float _1716 = _1708;
    float _1718 = -_1644;
    float _1720 = -_1706;
    float _1722 = fma(_1626, _1718, _1720);
    if (_1658)
    {
        float _1724 = _1722 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1670 = _1724;
    }
    float _1726 = _1670;
    float _1728 = sqrt(_1640);
    float _1730 = _1702;
    float _1732 = _1726;
    if (_1658)
    {
        float _1734 = fma(_1702, _1726, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1730 = _1734;
    }
    float _1736 = _1730;
    float _1738 = _1736;
    if (!_1658)
    {
        _1732 = _1648;
    }
    float _1740 = _1732;
    float _1742 = _1740;
    if (_1658)
    {
        float _1744 = _1716 + (-1.0);
        _1710 = _1744;
    }
    float _1746 = _1710;
    float _1748 = _1746;
    if (_1658)
    {
        float _1750 = _1682 * _1736;
        _1672 = _1750;
    }
    float _1752 = _1672;
    if (!_1658)
    {
        _1738 = _1722;
    }
    float _1754 = _1738;
    float _1756 = _1754;
    if (_1658)
    {
        float _1758 = _1746 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1684 = _1758;
    }
    float _1760 = _1684;
    if (_1658)
    {
        float _1762 = _1646 * _1752;
        _1674 = _1762;
    }
    float _1764 = _1674;
    if (!_1658)
    {
        _1686 = _1650;
    }
    float _1766 = _1686;
    float _1768 = _1766;
    if (_1658)
    {
        float _1770 = _1648 * _1752;
        _1742 = _1770;
    }
    float _1772 = _1742;
    if (_1658)
    {
        float _1774 = fma(_1722, _1716, _1760);
        _1756 = _1774;
    }
    float _1776 = _1756;
    if (_1658)
    {
        float _1778 = _1764 * _1764;
        _1768 = _1778;
    }
    float _1780 = _1768;
    if (!_1658)
    {
        _1748 = _1652;
    }
    float _1782 = _1748;
    float _1784 = _1782;
    if (_1658)
    {
        float _1786 = _1772 * _1772;
        _1784 = _1786;
    }
    float _1788 = _1784;
    float _1790 = fma(_1776, _1776, _1780);
    float _1792 = _1790 + _1788;
    float _1794 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1796 = fma(_1728, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1794);
    float _1798 = precise::clamp(_1796, 0.0, 1.0);
    float _1800 = _1618 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1802 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1804 = rsqrt(_1792);
    float _1806 = _1618 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1808 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1800);
    float _1810 = -_1798;
    float _1812 = _1810 + 1.0;
    float _1814 = _1618 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1816 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1806);
    float _1818 = _1618 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1820 = fma(_1622, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1808);
    float _1822 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1814);
    float _1824 = fma(_1622, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1816);
    float _1826 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1818);
    float _1828 = abs(_1812);
    float _1830 = log2(_1828);
    float _1832 = fma(_1622, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1822);
    float _1834 = _1824 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1836 = fma(_1622, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1826);
    float _1838 = _1820 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1840 = _1804 * _1764;
    float _1842 = _1804 * _1776;
    float _1844 = _1832 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1846 = _1834 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1848 = _1840 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1850 = _1836 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1852 = _1804 * _1772;
    float _1854 = fma(_1844, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1846);
    float _1856 = -_1848;
    float _1858 = fma(_1842, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1856);
    float _1860 = _1838 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1862 = fma(_1838, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1854);
    float _1864 = -_1852;
    float _1866 = fma(_1864, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1858);
    float _1868 = -_1860;
    float _1870 = fma(_1868, _1802, 1.0);
    float _1872 = _1830 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1874 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1862);
    float _1876 = fma(_1866, -0.5, 0.5);
    float _1878 = _1834 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1880 = exp2(_1872);
    float _1882 = _1834 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1884 = fma(_1866, 0.5, 0.5);
    float _1886 = fma(_1844, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1878);
    float _1888 = _1842 + 1.0;
    float _1890 = fma(_1844, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1882);
    float _1892 = fma(_1884, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1894 = fma(_1838, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1886);
    float _1896 = log2(_1870);
    float _1898 = fma(_1838, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1890);
    float _1900 = fma(_1884, _1892, -0.212114393711090087890625);
    float _1902 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1894);
    float _1904 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1898);
    float _1906 = fma(_1884, _1900, 1.570728778839111328125);
    float _1908 = 1.0 / _1874;
    float _1910 = -_1842;
    float _1912 = fma(_1880, _1888, _1910);
    float _1914 = fma(_1912, 0.5, 0.5);
    float _1916 = sqrt(_1876);
    float _1918 = _1896 * 0.693147182464599609375;
    float _1920 = _1918 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1922 = _1902 * _1908;
    float _1924 = _1904 * _1908;
    float _1926 = fma(_1922, 0.5, 0.5);
    float _1928 = fma(_1924, -0.5, 0.5);
    float _1930 = _1916 * 0.636619746685028076171875;
    float _1932 = -_1906;
    float _1934 = fma(_1930, _1932, 1.0);
    float3 _5218 = float3(_1926, _1928, _1920);
    float _1936 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5218, float3(0.0), isnan(_5218)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5218, float3(0.0), isnan(_5218)), level(0.0)).x;
    float3 _5229 = float3(_1926, _1928, _1920);
    float4 _1939 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5229, float3(0.0), isnan(_5229)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5229, float3(0.0), isnan(_5229)), level(0.0)).xyzw;
    float _1941 = _1939.x;
    float _1943 = _1939.y;
    float _1945 = _1939.z;
    float _1947 = _1939.w;
    float2 _5246 = float2(_1934, _1914);
    float3 _1951 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5246, float2(0.0), isnan(_5246)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5246, float2(0.0), isnan(_5246)), level(0.0)).xyz;
    float _1953 = _1951.x;
    float _1955 = _1951.y;
    float _1957 = _1951.z;
    float _1959 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1961 = _1830 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1963 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1959);
    bool _1965 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1967 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1969 = _1965 || _1967;
    bool _1971 = isnan(0.5);
    bool _1973 = _1969 || _1971;
    float _1975 = exp2(_1961);
    float _1977 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1963);
    float _1979 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1981 = _1977 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1983 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1979);
    float _1985 = _1834 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1987 = 1.0 / _1981;
    float _1989 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1983);
    float _1991 = fma(_1844, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1985);
    if (_1973)
    {
        _1218 = 1.0;
    }
    float _1993 = _1218;
    float _1995 = _1989 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1997 = fma(_1838, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1991);
    float _1999 = _1995 + _1981;
    float _2001 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1997);
    float _2003 = _1999 * _1987;
    float _2005 = _2003 * 0.5;
    float _2007 = _1993;
    if (!_1973)
    {
        float _2009 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2011 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2013 = fma(_2005, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2011);
        float _2015 = _2009 * 0.15915493667125701904296875;
        float _2017 = _2015 * 6.283185482025146484375;
        float _2019 = cos(_2017);
        float _2021 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2023 = _2021 * 0.15915493667125701904296875;
        float _2025 = _2015 * 6.283185482025146484375;
        float _2027 = sin(_2025);
        float _2029 = 1.0 / _2019;
        float _2031 = _2023 * 6.283185482025146484375;
        float _2033 = cos(_2031);
        float _2035 = _2027 * _2029;
        float _2037 = 1.0 / _2013;
        float _2039 = _2033 * _2035;
        float _2041 = _2023 * 6.283185482025146484375;
        float _2043 = sin(_2041);
        float _2045 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2047 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2045;
        float _2049 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2051 = _2037 * _2049;
        float _2053 = 1.0 / _2039;
        float _2055 = 1.0 / _2047;
        float _2057 = _2043 * _2053;
        float _2059 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2061 = fma(_2057, _2051, _2059);
        float _2063 = _2061 * _2055;
        float _2065 = precise::clamp(_2063, 0.0, 1.0);
        _2007 = _2065;
    }
    float _2067 = _2007;
    float _2069 = _1874 * 0.5;
    float _2071 = -_1975;
    float _2073 = _2071 + 1.0;
    float _2075 = _2067 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2077 = _2067 > 0.0;
    bool _2079 = isnan(_2067);
    bool _2081 = _2077 || _2079;
    bool _2083 = isnan(0.0);
    bool _2085 = _2081 || _2083;
    float _2087 = fma(_1904, -0.5, _2069);
    float _2089 = _2073 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2091 = _2075 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2093 = _2001 + _1874;
    float _2095 = _1902 + _1874;
    float _2097 = _2089 * _1936;
    float _2099 = -_2089;
    float _2101 = _2099 + 1.0;
    out.gl_Position.x = _1902;
    out.gl_Position.y = _1904;
    out.gl_Position.z = _2001;
    out.gl_Position.w = _1874;
    float _2103 = _1947 * _2097;
    float _2105 = _1957 * _2097;
    float _2107 = _2093 * 0.5;
    float _2109 = _2095 * 0.5;
    float _2111 = fma(_1953, _2103, _1941);
    float _2113 = fma(_1955, _2103, _1943);
    float _2115 = _1947 * _2101;
    float _2117 = fma(_1947, _2105, _1945);
    out.m_65.x = _2109;
    out.m_65.y = _2087;
    out.m_65.z = _2107;
    out.m_65.w = _1874;
    out.m_47.x = _2091;
    out.m_67.x = _2111;
    out.m_67.y = _2113;
    out.m_67.z = _2117;
    out.m_67.w = _2115;
    if (_2085)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2119 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2119;
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
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1574 = false;
    bool _992 = false;
    bool _850 = false;
    bool _574 = false;
    bool _284 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _81 = in.m_44.w;
    float _83 = trunc(_81);
    int _86 = int(_83);
    bool _90 = _86 >= 1;
    float _92 = 0.0;
    if (!_90)
    {
        _92 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _94 = _92;
    if (!_90)
    {
        out.m_47.x = 0.0;
    }
    int _96 = 0;
    if (!_90)
    {
        float _98 = _94 * 5.0;
        _96 = as_type<int>(_98);
    }
    int _100 = _96;
    int _102 = _100;
    if (!_90)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2175 = as_type<float>(_100);
        out.gl_Position.z = _2175;
    }
    if (!_90)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _104 = in.m_49.w;
    bool _106 = _104 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _108 = isnan(_104);
    bool _110 = _106 || _108;
    bool _112 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _114 = _110 || _112;
    float _116 = -_104;
    float _118 = _116 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _120 = 0.0;
    float _122 = _118;
    if (_114)
    {
        float _124 = float(_86);
        _120 = _124;
    }
    float _126 = _120;
    bool _128 = _118 >= _126;
    bool _130 = !_114;
    bool _132 = _128 || _130;
    float _134 = 0.0;
    if (_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _134;
    float _138 = _136;
    if (_132)
    {
        out.m_47.x = 0.0;
    }
    if (_132)
    {
        float _140 = _136 * 5.0;
        _102 = as_type<int>(_140);
    }
    int _142 = _102;
    if (_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2245 = as_type<float>(_142);
        out.gl_Position.z = _2245;
    }
    if (_132)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _144 = in.m_51.w;
    float _146 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _148 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _150 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _152 = _148 || _150;
    bool _154 = isnan(1.0);
    bool _156 = _152 || _154;
    float _158 = in.m_49.x;
    float _160 = in.m_49.y;
    float _162 = in.m_49.z;
    float _164 = in.m_44.x;
    float _166 = in.m_44.y;
    float _168 = in.m_44.z;
    float _170 = _146;
    if (!_156)
    {
        float _172 = _146 * _146;
        float _174 = _172 * 0.5;
        _138 = _174;
    }
    float _176 = _138;
    float _178 = _176;
    if (!_156)
    {
        float _180 = _176 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _180;
    }
    float _182 = _178;
    bool _184 = !_156;
    float _186 = _182;
    if (!_184)
    {
        float _188 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _190 = log2(_188);
        float _192 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _194 = _192 + 1.0;
        float _196 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = _146 * _190;
        float _200 = 1.0 / _194;
        float _202 = _196 * 0.693147182464599609375;
        float _204 = exp2(_198);
        float _206 = 1.0 / _202;
        float _208 = _204 + (-1.0);
        float _210 = -_208;
        float _212 = fma(_210, _206, _146);
        float _214 = _212 * _200;
        float _216 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _216;
    }
    float _218 = _186;
    bool _220 = !_156;
    if (!_220)
    {
        float _222 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _224 = log2(_222);
        float _226 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _228 = _226 + 1.0;
        float _230 = 1.0 / _228;
        float _232 = _146 * _224;
        float _234 = exp2(_232);
        float _236 = -_234;
        float _238 = _236 + 1.0;
        float _240 = _238 * _230;
        _170 = _240;
    }
    float _242 = _170;
    bool _244 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _246 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _248 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _250 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _252 = fma(_242, _158, _246);
    float _254 = fma(_242, _160, _248);
    float _256 = fma(_242, _162, _250);
    float _258 = fma(_252, _144, _164);
    float _260 = fma(_254, _144, _166);
    float _262 = fma(_256, _144, _168);
    bool _264 = !_244;
    float _282;
    if (!_264)
    {
        float _266 = in.m_53.x;
        float _268 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _270 = _266 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _272 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[12].x, _118);
        float _274 = _272 * _268;
        float _276 = floor(_274);
        float _278 = -_276;
        float _280 = _274 + _278;
        _282 = _280;
        _284 = true;
    }
    else
    {
        float _286 = float(_86);
        float _288 = 1.0 / _286;
        float _290 = _118 * _288;
        _282 = _290;
    }
    _284 = false;
    float _292 = _282;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _296 = _292 + _294;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _300 = _292 + _298;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _304 = _292 + _302;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _308 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _306;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _312 = _310 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _316 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _314;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _320 = _318 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _322 = 1.0 / _308;
    bool _324 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _326 = isnan(_292);
    bool _328 = _324 || _326;
    bool _330 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _332 = _328 || _330;
    float _334 = float(_332);
    bool _336 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _338 = isnan(_292);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    float _348 = 1.0 / _312;
    float _350 = -_346;
    float _352 = _350 + 1.0;
    bool _354 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _356 = 1.0 / _316;
    float _358 = _296 * _322;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _362 = _292 + _360;
    float _364 = 1.0 / _320;
    float _366 = _300 * _348;
    bool _368 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _370 = isnan(_292);
    bool _372 = _368 || _370;
    bool _374 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _376 = _372 || _374;
    float _378 = float(_376);
    float _380 = -_378;
    float _382 = _380 + 1.0;
    float _384 = _304 * _356;
    float _386 = _362 * _364;
    bool _388 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _390 = isnan(_292);
    bool _392 = _388 || _390;
    bool _394 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _396 = _392 || _394;
    float _398 = float(_396);
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _400;
    float _404 = _398 * _382;
    float _406 = -_398;
    float _408 = _406 + 1.0;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _410;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _414;
    float _418 = fma(_402, _358, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _420 = _334 * _408;
    float _422 = -_334;
    float _424 = _422 + 1.0;
    float _426 = fma(_412, _358, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _428 = fma(_416, _358, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _430 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _432 = isnan(_292);
    bool _434 = _430 || _432;
    bool _436 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _438 = _434 || _436;
    float _440 = float(_438);
    float _442 = _346 * _424;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _450 = _448 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _454 = _452 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _456 = _440 * _352;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _458;
    float _462 = fma(_450, _366, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _464 = fma(_454, _366, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _466 = _426 * _456;
    float _468 = _428 * _456;
    float _470 = _418 * _456;
    float _472 = -_440;
    float _474 = _472 + 1.0;
    float _476 = in.m_51.x;
    float _478 = in.m_51.y;
    float _480 = in.m_51.z;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _482;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _486;
    float _490 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[143].x, _466);
    float _492 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[143].y, _468);
    float _494 = fma(_446, _366, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _496 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[143].z, _470);
    float _498 = fma(_484, _384, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _500 = fma(_460, _384, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _502 = fma(_488, _384, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _504 = fma(_462, _442, _490);
    float _506 = fma(_464, _442, _492);
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _510 = _508 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _514 = _512 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _518 = _516 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _520 = fma(_494, _442, _496);
    float _522 = fma(_510, _386, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _524 = fma(_514, _386, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _526 = fma(_518, _386, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _528 = fma(_498, _420, _504);
    float _530 = fma(_500, _420, _506);
    float _532 = fma(_502, _420, _520);
    float _534 = fma(_522, _404, _528);
    float _536 = fma(_524, _404, _530);
    float _538 = fma(_526, _404, _532);
    float _540 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[147].x, _534);
    float _542 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[147].y, _536);
    float _544 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[147].z, _538);
    float _546 = _540 * _476;
    float _548 = _542 * _478;
    float _550 = _544 * _480;
    bool _552 = !_354;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _572;
    if (!_552)
    {
        float _556 = in.m_53.x;
        float _558 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _560 = _556 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _562 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[11].x, _118);
        float _564 = _562 * _558;
        float _566 = floor(_564);
        float _568 = -_566;
        float _570 = _564 + _568;
        _572 = _570;
        _574 = true;
    }
    else
    {
        float _576 = float(_86);
        float _578 = 1.0 / _576;
        float _580 = _118 * _578;
        _572 = _580;
    }
    _574 = false;
    float _582 = _572;
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _586 = _582 + _584;
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _590 = _582 + _588;
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _594 = _582 + _592;
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _596;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _602 = _600 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _604;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _610 = _608 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _612 = 1.0 / _602;
    float _614 = 1.0 / _606;
    bool _616 = _582 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _618 = isnan(_582);
    bool _620 = _616 || _618;
    bool _622 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _624 = _620 || _622;
    float _626 = float(_624);
    bool _628 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _630 = 1.0 / _610;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _634 = _582 + _632;
    float _636 = 1.0 / _598;
    float _638 = _634 * _612;
    bool _640 = _582 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _642 = isnan(_582);
    bool _644 = _640 || _642;
    bool _646 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _648 = _644 || _646;
    float _650 = float(_648);
    float _652 = _586 * _614;
    bool _654 = _582 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _656 = isnan(_582);
    bool _658 = _654 || _656;
    bool _660 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _662 = _658 || _660;
    float _664 = float(_662);
    bool _666 = _582 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _668 = isnan(_582);
    bool _670 = _666 || _668;
    bool _672 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _674 = _670 || _672;
    float _676 = float(_674);
    float _678 = -_650;
    float _680 = _678 + 1.0;
    float _682 = _590 * _630;
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _684;
    bool _688 = _582 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _690 = isnan(_582);
    bool _692 = _688 || _690;
    bool _694 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _696 = _692 || _694;
    float _698 = float(_696);
    float _700 = _664 * _680;
    float _702 = -_664;
    float _704 = _702 + 1.0;
    float _706 = fma(_686, _652, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _708 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _710 = _708 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _712 = _594 * _636;
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _716 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _714;
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _720 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _718;
    float _722 = _626 * _704;
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _726 = _724 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _728 = fma(_716, _652, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _730 = fma(_720, _652, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _732 = -_626;
    float _734 = _732 + 1.0;
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _738 = _736 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _740 = fma(_710, _682, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _742 = fma(_726, _682, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _744 = _676 * _734;
    float _746 = -_676;
    float _748 = _746 + 1.0;
    float _750 = fma(_738, _682, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _752 = _698 * _748;
    float _754 = -_698;
    float _756 = _754 + 1.0;
    float _758 = _706 * _752;
    float _760 = _728 * _752;
    float _762 = _730 * _752;
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _766 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _764;
    float _768 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[107].x, _758);
    float _770 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[107].y, _760);
    float _772 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[107].z, _762);
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _776 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _774;
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _780 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _778;
    float _782 = fma(_766, _712, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _784 = fma(_740, _744, _768);
    float _786 = fma(_750, _744, _770);
    float _788 = fma(_742, _744, _772);
    float _790 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _792 = _790 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _796 = _794 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _798 = fma(_776, _712, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _800 = fma(_780, _712, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _804 = _802 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _806 = fma(_782, _722, _784);
    float _808 = fma(_792, _638, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _810 = fma(_796, _638, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _812 = fma(_804, _638, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _814 = fma(_798, _722, _786);
    float _816 = fma(_800, _722, _788);
    float _818 = fma(_808, _700, _806);
    float _820 = fma(_810, _700, _814);
    float _822 = fma(_812, _700, _816);
    float _824 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[111].x, _818);
    float _826 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[111].y, _820);
    float _828 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[111].z, _822);
    bool _830 = !_628;
    float _848;
    if (!_830)
    {
        float _832 = in.m_53.x;
        float _834 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _836 = _832 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _838 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[11].y, _118);
        float _840 = _838 * _834;
        float _842 = floor(_840);
        float _844 = -_842;
        float _846 = _840 + _844;
        _848 = _846;
        _850 = true;
    }
    else
    {
        float _852 = float(_86);
        float _854 = 1.0 / _852;
        float _856 = _118 * _854;
        _848 = _856;
    }
    _850 = false;
    float _858 = _848;
    float _860 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _862 = _858 + _860;
    float _864 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _866 = _864 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _868 = _858 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _870 = isnan(_858);
    bool _872 = _868 || _870;
    bool _874 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _876 = _872 || _874;
    float _878 = float(_876);
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _882 = _880 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _884 = _858 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _886 = isnan(_858);
    bool _888 = _884 || _886;
    bool _890 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _892 = _888 || _890;
    float _894 = float(_892);
    float _896 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _898 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _896;
    bool _900 = _858 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _902 = isnan(_858);
    bool _904 = _900 || _902;
    bool _906 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _908 = _904 || _906;
    float _910 = float(_908);
    float _912 = 1.0 / _866;
    float _914 = -_878;
    float _916 = _914 + 1.0;
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _920 = _858 + _918;
    bool _922 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _924 = _894 * _916;
    float _926 = -_894;
    float _928 = _926 + 1.0;
    float _930 = 1.0 / _882;
    float _932 = _898 * _912;
    float _934 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _936 = _934 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _938 = fma(_932, _862, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _940 = _936 * _930;
    float _942 = -_910;
    float _944 = _942 + 1.0;
    float _946 = _938 * _924;
    float _948 = _826 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _950 = fma(_940, _920, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _952 = _878 * _944;
    float _954 = fma(_928, (*spvDescriptorSet0.vp_c9)._m0[115].x, _946);
    float _956 = _828 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _958 = _948 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _960 = fma(_950, _952, _954);
    float _962 = _824 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _964 = _956 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _966 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[117].x, _960);
    float _968 = _962 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _970 = _966 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _968;
    out.m_55.y = _958;
    out.m_55.z = _964;
    out.m_55.w = _970;
    bool _972 = !_922;
    float _990;
    if (!_972)
    {
        float _974 = in.m_53.x;
        float _976 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _978 = _974 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _980 = fma(_978, (*spvDescriptorSet0.vp_c9)._m0[11].w, _118);
        float _982 = _980 * _976;
        float _984 = floor(_982);
        float _986 = -_984;
        float _988 = _982 + _986;
        _990 = _988;
        _992 = true;
    }
    else
    {
        float _994 = float(_86);
        float _996 = 1.0 / _994;
        float _998 = _118 * _996;
        _990 = _998;
    }
    _992 = false;
    float _1000 = _990;
    float _1002 = in.m_53.w;
    float _1004 = _260 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1006 = _260 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1008 = in.m_57.x;
    float _1010 = in.m_57.y;
    float _1012 = in.m_57.z;
    int _1014 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1016 = _1014 != 0;
    float _1018 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1004);
    int _1020 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1022 = _1020 != 0;
    float _1024 = in.m_53.x;
    int _1026 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1028 = _1026 != 0;
    float _1030 = _260 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _1032 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1034 = _1032 != 0;
    float _1036 = in.m_53.y;
    float _1038 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1006);
    float _1040 = in.m_59.y;
    float _1042 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1030);
    float _1044 = _548 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1046 = in.m_59.x;
    float _1048 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1050 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1052 = _1050 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1054 = _1002 > 0.5;
    float _1056 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1058 = _1018;
    bool _1060 = _1054;
    if (_1022)
    {
        float _1062 = in.m_53.z;
        _554 = _1062;
    }
    float _1064 = _554;
    float _1066 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1008);
    float _1068 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1070 = _1068 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _1072 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1074 = _1072 != 0;
    float _1076 = 1.0 / _1052;
    float _1078 = _1024 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1080 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1012);
    float _1082 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1010);
    float _1084 = _546 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1086 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1088 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1038);
    float _1090 = 1.0 / _1070;
    float _1092 = -_1086;
    float _1094 = fma(_1078, 2.0, _1092);
    float _1096 = _550 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1098 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1042);
    float _1100 = _550;
    float _1102 = _1024;
    float _1104 = _1098;
    if (!_1074)
    {
        float _1106 = in.m_53.z;
        _1100 = _1106;
    }
    float _1108 = _1100;
    float _1110 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1018);
    float _1112 = _1096 * _1080;
    float _1114 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1116 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1114;
    float _1118 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1120 = _1036 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1122 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1124 = _1122 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1126 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1128 = _1000 + _1126;
    float _1130 = _1044 * _1082;
    float _1132 = fma(_1120, -2.0, _1056);
    float _1134 = -_1040;
    float _1136 = _1134 + 1.0;
    float _1138 = _1124 * _1090;
    float _1140 = _1084 * _1066;
    float _1142 = _1116 * _1076;
    float _1144 = fma(_1138, _1128, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1146 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1148 = _1000 + _1146;
    float _1150 = _1130 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1152 = _1130 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1154 = _1054 ? _1136 : _1040;
    float _1156 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1158 = fma(_1142, _1148, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1160 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1150);
    float _1162 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1152);
    float _1164 = _1028 ? _1154 : _1040;
    float _1166 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1168 = _1118 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1170 = fma(_1024, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1156);
    float _1172 = _1130 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1174 = _1156;
    float _1176 = _1108;
    float _1178 = _1040;
    float _1180 = _1154;
    if (!_1074)
    {
        _1174 = _1108;
    }
    float _1182 = _1174;
    float _1184 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1160);
    float _1186 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1162);
    float _1188 = _1182;
    if (!_1074)
    {
        _1058 = _1036;
    }
    float _1190 = _1058;
    float _1192 = fma(_1036, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1166);
    bool _1194 = _1036 > 0.5;
    float _1196 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1172);
    float _1198 = _1190;
    if (_1074)
    {
        _1188 = _1036;
    }
    float _1200 = _1188;
    float _1202 = _1184 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1204 = _1200;
    if (_1074)
    {
        _1176 = _1036;
    }
    float _1206 = _1176;
    float _1208 = fma(_1164, _1168, -0.5);
    float _1210 = _1088 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1212 = _1110 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1214 = _1186 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _1216 = as_type<int>(_1206);
    float _1218 = _1212;
    if (_1016)
    {
        bool _1220 = _1024 > 0.5;
        _1060 = _1220;
    }
    bool _1222 = _1060;
    float _1224 = _1210 + _1202;
    if (_1074)
    {
        _1198 = _1024;
    }
    float _1226 = _1198;
    float _1228 = _1212 + _1214;
    if (!_1016)
    {
        _1102 = _1046;
    }
    float _1230 = _1102;
    float _1232 = _1048 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1234 = _1000 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1236 = isnan(_1000);
    bool _1238 = _1234 || _1236;
    bool _1240 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1242 = _1238 || _1240;
    float _1244 = float(_1242);
    float _1246 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1248 = _1228 + _1246;
    float _1250 = _1230;
    float _1252 = _1244;
    if (_1034)
    {
        float _1254 = _1194 ? _1136 : _1040;
        _1178 = _1254;
    }
    float _1256 = _1178;
    float _1258 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1260 = _1224 + _1258;
    if (!_1016)
    {
        _1180 = _1230;
    }
    float _1262 = _1180;
    float _1264 = -_1244;
    float _1266 = _1264 + 1.0;
    bool _1268 = _1000 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1270 = isnan(_1000);
    bool _1272 = _1268 || _1270;
    bool _1274 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1276 = _1272 || _1274;
    float _1278 = float(_1276);
    float _1280 = _1248 * _1248;
    float _1282 = _1262;
    float _1284 = _1280;
    if (_1016)
    {
        _1250 = _1046;
    }
    float _1286 = _1250;
    float _1288 = _1260 * _1260;
    bool _1290 = false;
    float _1292 = _1286;
    float _1294 = _1288;
    if (_1022)
    {
        bool _1296 = _1064 > 0.5;
        _1290 = _1296;
    }
    bool _1298 = _1290;
    float _1300 = _1278 * _1266;
    bool _1302 = _1000 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1304 = isnan(_1000);
    bool _1306 = _1302 || _1304;
    bool _1308 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1310 = _1306 || _1308;
    float _1312 = float(_1310);
    float _1314 = -_1278;
    float _1316 = _1314 + 1.0;
    float _1318 = _1288 + _1280;
    float _1320 = fma(_1232, _1256, -0.5);
    float _1322 = sqrt(_1318);
    float _1324 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1326 = _1312 * _1316;
    float _1328 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1330 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1196);
    float _1332 = fma(_1226, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1324);
    float _1334 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1192);
    float _1336 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1132);
    float _1338 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1340 = _1226 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1342 = fma(_1206, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1328);
    int _1344 = as_type<int>(_1340);
    float _1346 = _1334;
    if (_1016)
    {
        float _1348 = -_1286;
        float _1350 = _1348 + 1.0;
        _1216 = as_type<int>(_1350);
    }
    int _1352 = _1216;
    float _1354 = _1158 * _1326;
    float _1356 = -_1336;
    float _1358 = fma(_1334, _1320, _1356);
    float _1360 = -_1338;
    float _1362 = fma(_1340, 2.0, _1360);
    bool _1364 = _1322 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1366 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_1022)
    {
        float _1368 = -_1286;
        float _1370 = _1368 + 1.0;
        _1344 = as_type<int>(_1370);
    }
    int _1372 = _1344;
    if (_1016)
    {
        float _1374 = _1222 ? as_type<float>(_1352) : _1286;
        _1282 = _1374;
    }
    float _1376 = _1282;
    float _1378 = _1098 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1380 = _1330 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1382 = -_1312;
    float _1384 = _1382 + 1.0;
    if (_1022)
    {
        float _1386 = _1298 ? as_type<float>(_1372) : _1286;
        _1292 = _1386;
    }
    float _1388 = _1292;
    float _1390 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1392 = _1378 + _1380;
    float _1394 = fma(_1384, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1354);
    float _1396 = _1200 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (!_1364)
    {
        _1104 = _1224;
    }
    float _1398 = _1104;
    float _1400 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1402 = _1398;
    if (!_1364)
    {
        _1204 = _1228;
    }
    float _1404 = _1204;
    float _1406 = _1404;
    if (!_1364)
    {
        _1346 = _1392;
    }
    float _1408 = _1346;
    bool _1410 = !_1364;
    float _1412 = _1408;
    if (!_1410)
    {
        float _1414 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1416 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1418 = _1322 + _1416;
        float _1420 = rsqrt(_1318);
        float _1422 = _1418 * _1414;
        float _1424 = _1392 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1426 = _1422 * 0.15915493667125701904296875;
        float _1428 = _1426 * 6.283185482025146484375;
        float _1430 = sin(_1428);
        float _1432 = _1426 * 6.283185482025146484375;
        float _1434 = cos(_1432);
        float _1436 = fma(_1430, _1424, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1438 = _1420 * _1436;
        float _1440 = _1434 + (-1.0);
        float _1442 = fma(_1260, _1438, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1444 = fma(_1248, _1438, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1446 = _1440 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1448 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1450 = _1442 + _1448;
        float _1452 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1454 = _1444 + _1452;
        float _1456 = fma(_1392, _1434, _1446);
        float _1458 = _1450 * _1450;
        float _1460 = _1454 * _1454;
        _1412 = _1456;
        _1294 = _1458;
        _1284 = _1460;
        _1402 = _1442;
        _1406 = _1444;
    }
    float _1462 = _1412;
    float _1464 = _1294;
    float _1466 = _1284;
    float _1468 = _1402;
    float _1470 = _1406;
    float _1472 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1474 = _1462 + _1472;
    float _1476 = fma(_1396, -2.0, _1400);
    float _1478 = _1366 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1480 = _1390 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1482 = fma(_1474, _1474, _1464);
    float _1484 = fma(_1144, _1300, _1394);
    float _1486 = fma(_1478, _1376, -0.5);
    float _1488 = fma(_1480, _1388, -0.5);
    float _1490 = _1482 + _1466;
    float _1492 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1170);
    float _1494 = -_118;
    float _1496 = fma(_1494, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1094);
    float _1498 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1332);
    float _1500 = -_118;
    float _1502 = fma(_1500, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1362);
    float _1504 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1342);
    float _1506 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1476);
    float _1508 = sqrt(_1490);
    float _1510 = fma(_1492, _1486, _1496);
    float _1512 = fma(_1498, _1488, _1502);
    float _1514 = -_1506;
    float _1516 = fma(_1504, _1208, _1514);
    float _1518 = fma(_1244, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1484);
    float _1520 = _1358 + 0.5;
    float _1522 = _1510 + 0.5;
    float _1524 = _1512 + 0.5;
    float _1526 = _1516 + 0.5;
    float _1528 = _1518 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_61.x = _1522;
    out.m_61.y = _1520;
    out.m_61.z = _1524;
    out.m_61.w = _1526;
    bool _1530 = _1508 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1532 = isnan(_1508);
    bool _1534 = _1530 || _1532;
    bool _1536 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1538 = _1534 || _1536;
    out.m_63.w = _1528;
    if (!_1538)
    {
        _122 = 1.0;
    }
    float _1540 = _122;
    bool _1542 = !_1538;
    float _1544 = _1540;
    if (!_1542)
    {
        bool _1546 = _1508 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1548 = isnan(_1508);
        bool _1550 = _1546 || _1548;
        bool _1552 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1554 = _1550 || _1552;
        if (!_1554)
        {
            float _1556 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1558 = _1508 + _1556;
            float _1560 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1562 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1560;
            float _1564 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1566 = _1564 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1568 = 1.0 / _1562;
            float _1570 = _1558 * _1568;
            float _1572 = fma(_1570, _1566, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1544 = _1572;
            _1574 = true;
        }
        else
        {
            bool _1576 = _1508 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1578 = isnan(_1508);
            bool _1580 = _1576 || _1578;
            bool _1582 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1584 = _1580 || _1582;
            if (!_1584)
            {
                float _1586 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1588 = _1508 + _1586;
                float _1590 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1592 = _1590 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1594 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1596 = _1594 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1598 = 1.0 / _1592;
                float _1600 = _1588 * _1598;
                float _1602 = fma(_1600, _1596, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1544 = _1602;
                _1574 = true;
            }
            else
            {
                _1544 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1574 = false;
    float _1604 = _1544;
    float _1606 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1608 = _1462 + _1606;
    float _1610 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1612 = _1468 + _1610;
    float _1614 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1616 = _1470 + _1614;
    float _1618 = fma(_1608, _1604, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1620 = fma(_1612, _1604, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1622 = fma(_1616, _1604, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1624 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1626 = _1618 + _1624;
    float _1628 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1630 = _1620 + _1628;
    float _1632 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1634 = _1622 + _1632;
    float _1636 = _1626 * _1626;
    float _1638 = fma(_1630, _1630, _1636);
    float _1640 = fma(_1634, _1634, _1638);
    float _1642 = rsqrt(_1640);
    float _1644 = _1642 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1646 = _1630 * _1644;
    float _1648 = _1634 * _1644;
    float _1650 = _1646 * _1646;
    float _1652 = _1648 * _1648;
    float _1654 = _1650 + _1652;
    float _1656 = sqrt(_1654);
    bool _1658 = _1656 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1660 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1662 = _1656 + _1660;
    float _1664 = _1470;
    float _1666 = _1654;
    float _1668 = _1662;
    float _1670 = _1626;
    float _1672 = _1644;
    float _1674 = _1646;
    if (_1658)
    {
        float _1676 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1664 = _1676;
    }
    float _1678 = _1664;
    if (_1658)
    {
        float _1680 = rsqrt(_1654);
        _1666 = _1680;
    }
    float _1682 = _1666;
    float _1684 = _1678;
    float _1686 = _1682;
    if (_1658)
    {
        float _1688 = _1662 * _1678;
        _1668 = _1688;
    }
    float _1690 = _1668;
    if (_1658)
    {
        float _1692 = _1690 * 0.15915493667125701904296875;
        _1252 = _1692;
    }
    float _1694 = _1252;
    float _1696 = _1634;
    if (_1658)
    {
        float _1698 = _1694 * 6.283185482025146484375;
        float _1700 = sin(_1698);
        _1696 = _1700;
    }
    float _1702 = _1696;
    float _1704 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1706 = precise::max(0.0, _1704);
    float _1708 = _1358;
    float _1710 = _1706;
    if (_1658)
    {
        float _1712 = _1694 * 6.283185482025146484375;
        float _1714 = cos(_1712);
        _1708 = _1714;
    }
    float _1716 = _1708;
    float _1718 = -_1644;
    float _1720 = -_1706;
    float _1722 = fma(_1626, _1718, _1720);
    if (_1658)
    {
        float _1724 = _1722 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1670 = _1724;
    }
    float _1726 = _1670;
    float _1728 = sqrt(_1640);
    float _1730 = _1702;
    float _1732 = _1726;
    if (_1658)
    {
        float _1734 = fma(_1702, _1726, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1730 = _1734;
    }
    float _1736 = _1730;
    float _1738 = _1736;
    if (!_1658)
    {
        _1732 = _1648;
    }
    float _1740 = _1732;
    float _1742 = _1740;
    if (_1658)
    {
        float _1744 = _1716 + (-1.0);
        _1710 = _1744;
    }
    float _1746 = _1710;
    float _1748 = _1746;
    if (_1658)
    {
        float _1750 = _1682 * _1736;
        _1672 = _1750;
    }
    float _1752 = _1672;
    if (!_1658)
    {
        _1738 = _1722;
    }
    float _1754 = _1738;
    float _1756 = _1754;
    if (_1658)
    {
        float _1758 = _1746 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1684 = _1758;
    }
    float _1760 = _1684;
    if (_1658)
    {
        float _1762 = _1646 * _1752;
        _1674 = _1762;
    }
    float _1764 = _1674;
    if (!_1658)
    {
        _1686 = _1650;
    }
    float _1766 = _1686;
    float _1768 = _1766;
    if (_1658)
    {
        float _1770 = _1648 * _1752;
        _1742 = _1770;
    }
    float _1772 = _1742;
    if (_1658)
    {
        float _1774 = fma(_1722, _1716, _1760);
        _1756 = _1774;
    }
    float _1776 = _1756;
    if (_1658)
    {
        float _1778 = _1764 * _1764;
        _1768 = _1778;
    }
    float _1780 = _1768;
    if (!_1658)
    {
        _1748 = _1652;
    }
    float _1782 = _1748;
    float _1784 = _1782;
    if (_1658)
    {
        float _1786 = _1772 * _1772;
        _1784 = _1786;
    }
    float _1788 = _1784;
    float _1790 = fma(_1776, _1776, _1780);
    float _1792 = _1790 + _1788;
    float _1794 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1796 = fma(_1728, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1794);
    float _1798 = precise::clamp(_1796, 0.0, 1.0);
    float _1800 = _1618 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1802 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1804 = rsqrt(_1792);
    float _1806 = _1618 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1808 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1800);
    float _1810 = -_1798;
    float _1812 = _1810 + 1.0;
    float _1814 = _1618 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1816 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1806);
    float _1818 = _1618 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1820 = fma(_1622, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1808);
    float _1822 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1814);
    float _1824 = fma(_1622, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1816);
    float _1826 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1818);
    float _1828 = abs(_1812);
    float _1830 = log2(_1828);
    float _1832 = fma(_1622, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1822);
    float _1834 = _1824 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1836 = fma(_1622, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1826);
    float _1838 = _1820 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1840 = _1804 * _1764;
    float _1842 = _1804 * _1776;
    float _1844 = _1832 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1846 = _1834 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1848 = _1840 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1850 = _1836 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1852 = _1804 * _1772;
    float _1854 = fma(_1844, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1846);
    float _1856 = -_1848;
    float _1858 = fma(_1842, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1856);
    float _1860 = _1838 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1862 = fma(_1838, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1854);
    float _1864 = -_1852;
    float _1866 = fma(_1864, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1858);
    float _1868 = -_1860;
    float _1870 = fma(_1868, _1802, 1.0);
    float _1872 = _1830 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1874 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1862);
    float _1876 = fma(_1866, -0.5, 0.5);
    float _1878 = _1834 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1880 = exp2(_1872);
    float _1882 = _1834 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1884 = fma(_1866, 0.5, 0.5);
    float _1886 = fma(_1844, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1878);
    float _1888 = _1842 + 1.0;
    float _1890 = fma(_1844, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1882);
    float _1892 = fma(_1884, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1894 = fma(_1838, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1886);
    float _1896 = log2(_1870);
    float _1898 = fma(_1838, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1890);
    float _1900 = fma(_1884, _1892, -0.212114393711090087890625);
    float _1902 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1894);
    float _1904 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1898);
    float _1906 = fma(_1884, _1900, 1.570728778839111328125);
    float _1908 = 1.0 / _1874;
    float _1910 = -_1842;
    float _1912 = fma(_1880, _1888, _1910);
    float _1914 = fma(_1912, 0.5, 0.5);
    float _1916 = sqrt(_1876);
    float _1918 = _1896 * 0.693147182464599609375;
    float _1920 = _1918 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1922 = _1902 * _1908;
    float _1924 = _1904 * _1908;
    float _1926 = fma(_1922, 0.5, 0.5);
    float _1928 = fma(_1924, -0.5, 0.5);
    float _1930 = _1916 * 0.636619746685028076171875;
    float _1932 = -_1906;
    float _1934 = fma(_1930, _1932, 1.0);
    float3 _5218 = float3(_1926, _1928, _1920);
    float _1936 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5218, float3(0.0), isnan(_5218)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5218, float3(0.0), isnan(_5218)), level(0.0)).x;
    float3 _5229 = float3(_1926, _1928, _1920);
    float4 _1939 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5229, float3(0.0), isnan(_5229)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5229, float3(0.0), isnan(_5229)), level(0.0)).xyzw;
    float _1941 = _1939.x;
    float _1943 = _1939.y;
    float _1945 = _1939.z;
    float _1947 = _1939.w;
    float2 _5246 = float2(_1934, _1914);
    float3 _1951 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5246, float2(0.0), isnan(_5246)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5246, float2(0.0), isnan(_5246)), level(0.0)).xyz;
    float _1953 = _1951.x;
    float _1955 = _1951.y;
    float _1957 = _1951.z;
    float _1959 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1961 = _1830 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1963 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1959);
    bool _1965 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1967 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1969 = _1965 || _1967;
    bool _1971 = isnan(0.5);
    bool _1973 = _1969 || _1971;
    float _1975 = exp2(_1961);
    float _1977 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1963);
    float _1979 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1981 = _1977 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1983 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1979);
    float _1985 = _1834 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1987 = 1.0 / _1981;
    float _1989 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1983);
    float _1991 = fma(_1844, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1985);
    if (_1973)
    {
        _1218 = 1.0;
    }
    float _1993 = _1218;
    float _1995 = _1989 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1997 = fma(_1838, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1991);
    float _1999 = _1995 + _1981;
    float _2001 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1997);
    float _2003 = _1999 * _1987;
    float _2005 = _2003 * 0.5;
    float _2007 = _1993;
    if (!_1973)
    {
        float _2009 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2011 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2013 = fma(_2005, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2011);
        float _2015 = _2009 * 0.15915493667125701904296875;
        float _2017 = _2015 * 6.283185482025146484375;
        float _2019 = cos(_2017);
        float _2021 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2023 = _2021 * 0.15915493667125701904296875;
        float _2025 = _2015 * 6.283185482025146484375;
        float _2027 = sin(_2025);
        float _2029 = 1.0 / _2019;
        float _2031 = _2023 * 6.283185482025146484375;
        float _2033 = cos(_2031);
        float _2035 = _2027 * _2029;
        float _2037 = 1.0 / _2013;
        float _2039 = _2033 * _2035;
        float _2041 = _2023 * 6.283185482025146484375;
        float _2043 = sin(_2041);
        float _2045 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2047 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2045;
        float _2049 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2051 = _2037 * _2049;
        float _2053 = 1.0 / _2039;
        float _2055 = 1.0 / _2047;
        float _2057 = _2043 * _2053;
        float _2059 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2061 = fma(_2057, _2051, _2059);
        float _2063 = _2061 * _2055;
        float _2065 = precise::clamp(_2063, 0.0, 1.0);
        _2007 = _2065;
    }
    float _2067 = _2007;
    float _2069 = _1874 * 0.5;
    float _2071 = -_1975;
    float _2073 = _2071 + 1.0;
    float _2075 = _2067 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2077 = _2067 > 0.0;
    bool _2079 = isnan(_2067);
    bool _2081 = _2077 || _2079;
    bool _2083 = isnan(0.0);
    bool _2085 = _2081 || _2083;
    float _2087 = fma(_1904, -0.5, _2069);
    float _2089 = _2073 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2091 = _2075 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2093 = _2001 + _1874;
    float _2095 = _1902 + _1874;
    float _2097 = _2089 * _1936;
    float _2099 = -_2089;
    float _2101 = _2099 + 1.0;
    out.gl_Position.x = _1902;
    out.gl_Position.y = _1904;
    out.gl_Position.z = _2001;
    out.gl_Position.w = _1874;
    float _2103 = _1947 * _2097;
    float _2105 = _1957 * _2097;
    float _2107 = _2093 * 0.5;
    float _2109 = _2095 * 0.5;
    float _2111 = fma(_1953, _2103, _1941);
    float _2113 = fma(_1955, _2103, _1943);
    float _2115 = _1947 * _2101;
    float _2117 = fma(_1947, _2105, _1945);
    out.m_65.x = _2109;
    out.m_65.y = _2087;
    out.m_65.z = _2107;
    out.m_65.w = _1874;
    out.m_47.x = _2091;
    out.m_67.x = _2111;
    out.m_67.y = _2113;
    out.m_67.z = _2117;
    out.m_67.w = _2115;
    if (_2085)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2119 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2119;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

