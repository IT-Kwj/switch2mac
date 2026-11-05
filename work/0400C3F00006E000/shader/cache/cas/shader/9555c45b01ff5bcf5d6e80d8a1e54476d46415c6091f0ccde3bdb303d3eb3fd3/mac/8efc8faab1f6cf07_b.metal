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
    float4 m_57 [[user(locn0)]];
    float4 m_71 [[user(locn1)]];
    float4 m_67 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_69 [[user(locn4)]];
    float4 m_73 [[user(locn5)]];
    float4 m_49 [[user(locn6)]];
    float4 m_53 [[user(locn7)]];
    float4 m_75 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_59 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_44 [[attribute(3)]];
    float4 m_63 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_65 [[attribute(8)]];
    float4 m_61 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1090 = false;
    bool _842 = false;
    bool _616 = false;
    bool _294 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_42.w;
    float _91 = in.m_44.w;
    float _93 = trunc(_89);
    int _96 = int(_93);
    float _98 = -_91;
    float _100 = _98 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_47.y = _100;
    bool _104 = _96 >= 1;
    float _106 = 0.0;
    float _108 = as_type<float>(_96);
    float _110 = _100;
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _106;
    if (!_104)
    {
        out.m_49.x = 0.0;
    }
    int _114 = 0;
    if (!_104)
    {
        float _116 = _112 * 5.0;
        _114 = as_type<int>(_116);
    }
    int _118 = _114;
    int _120 = _118;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2378 = as_type<float>(_118);
        out.gl_Position.z = _2378;
    }
    if (!_104)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _122 = _91 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _124 = isnan(_91);
    bool _126 = _122 || _124;
    bool _128 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _130 = _126 || _128;
    float _132 = in.m_51.x;
    float _134 = float(_96);
    float _136 = in.m_51.y;
    bool _138 = _100 >= _134;
    bool _140 = !_130;
    bool _142 = _138 || _140;
    if (_142)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _144 = _108;
    if (_142)
    {
        out.m_49.x = 0.0;
    }
    if (_142)
    {
        float _146 = _144 * 5.0;
        _120 = as_type<int>(_146);
    }
    int _148 = _120;
    out.m_53.x = _132;
    out.m_53.y = _136;
    if (_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2441 = as_type<float>(_148);
        out.gl_Position.z = _2441;
    }
    if (_142)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _150 = in.m_55.w;
    float _152 = 1.0 / _134;
    float _154 = _100 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _156 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _158 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _160 = _156 || _158;
    bool _162 = isnan(1.0);
    bool _164 = _160 || _162;
    float _166 = in.m_44.x;
    float _168 = in.m_44.y;
    float _170 = in.m_44.z;
    float _172 = in.m_42.x;
    float _174 = in.m_42.y;
    float _176 = in.m_42.z;
    float _178 = 0.0;
    float _180 = _154;
    if (!_164)
    {
        float _182 = _154 * _154;
        float _184 = _182 * 0.5;
        _178 = _184;
    }
    float _186 = _178;
    float _188 = _186;
    if (!_164)
    {
        float _190 = _186 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _188 = _190;
    }
    float _192 = _188;
    bool _194 = !_164;
    float _196 = _192;
    if (!_194)
    {
        float _198 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _200 = log2(_198);
        float _202 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _204 = _202 + 1.0;
        float _206 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _208 = _154 * _200;
        float _210 = 1.0 / _204;
        float _212 = _206 * 0.693147182464599609375;
        float _214 = exp2(_208);
        float _216 = 1.0 / _212;
        float _218 = _214 + (-1.0);
        float _220 = -_218;
        float _222 = fma(_220, _216, _154);
        float _224 = _222 * _210;
        float _226 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _196 = _226;
    }
    float _228 = _196;
    bool _230 = !_164;
    if (!_230)
    {
        float _232 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _234 = log2(_232);
        float _236 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _238 = _236 + 1.0;
        float _240 = 1.0 / _238;
        float _242 = _154 * _234;
        float _244 = exp2(_242);
        float _246 = -_244;
        float _248 = _246 + 1.0;
        float _250 = _248 * _240;
        _180 = _250;
    }
    float _252 = _180;
    bool _254 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _256 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _258 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _260 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _262 = _100 * _152;
    float _264 = fma(_252, _166, _256);
    float _266 = fma(_252, _168, _258);
    float _268 = fma(_252, _170, _260);
    float _270 = fma(_264, _150, _172);
    float _272 = fma(_266, _150, _174);
    float _274 = fma(_268, _150, _176);
    bool _276 = !_254;
    float _292;
    if (!_276)
    {
        float _278 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _280 = _132 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _282 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[12].x, _100);
        float _284 = _282 * _278;
        float _286 = floor(_284);
        float _288 = -_286;
        float _290 = _284 + _288;
        _292 = _290;
        _294 = true;
    }
    else
    {
        _292 = _262;
    }
    _294 = false;
    float _296 = _292;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _300 = _296 + _298;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _304 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _302;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _308 = _306 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _312 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _310;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _316 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _314;
    float _318 = 1.0 / _308;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _322 = _320 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _324 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _326 = isnan(_296);
    bool _328 = _324 || _326;
    bool _330 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _332 = _328 || _330;
    float _334 = float(_332);
    float _336 = 1.0 / _304;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _340 = _296 + _338;
    bool _342 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _344 = isnan(_296);
    bool _346 = _342 || _344;
    bool _348 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _350 = _346 || _348;
    float _352 = float(_350);
    float _354 = 1.0 / _322;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _358 = _296 + _356;
    float _360 = _300 * _318;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _364 = _296 + _362;
    bool _366 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _368 = isnan(_296);
    bool _370 = _366 || _368;
    bool _372 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _374 = _370 || _372;
    float _376 = float(_374);
    bool _378 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _380 = 1.0 / _312;
    float _382 = _358 * _336;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _386 = _296 + _384;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _388;
    float _392 = -_376;
    float _394 = _392 + 1.0;
    float _396 = fma(_390, _382, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _398 = 1.0 / _316;
    float _400 = _340 * _354;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _402;
    float _406 = fma(_404, _382, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _408 = _364 * _380;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _410;
    bool _414 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _416 = isnan(_296);
    bool _418 = _414 || _416;
    bool _420 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _422 = _418 || _420;
    float _424 = float(_422);
    float _426 = fma(_412, _382, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _428 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _430 = isnan(_296);
    bool _432 = _428 || _430;
    bool _434 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _436 = _432 || _434;
    float _438 = float(_436);
    float _440 = _386 * _398;
    bool _442 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _444 = isnan(_296);
    bool _446 = _442 || _444;
    bool _448 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _450 = _446 || _448;
    float _452 = float(_450);
    float _454 = -_424;
    float _456 = _454 + 1.0;
    float _458 = _438 * _394;
    float _460 = -_438;
    float _462 = _460 + 1.0;
    float _464 = -_452;
    float _466 = _464 + 1.0;
    float _468 = _352 * _462;
    float _470 = _424 * _466;
    float _472 = _334 * _456;
    float _474 = -_334;
    float _476 = _474 + 1.0;
    float _478 = _426 * _468;
    float _480 = _406 * _468;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _484 = _482 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _486 = _376 * _476;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _490 = _488 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _496 = _396 * _468;
    float _498 = -_352;
    float _500 = _498 + 1.0;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _502;
    float _506 = fma(_490, _360, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _510 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _508;
    float _512 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[143].x, _478);
    float _514 = fma(_504, _440, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _516 = fma(_494, _360, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _518 = fma(_484, _360, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _520 = fma(_510, _440, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _524 = _522 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _526 = fma(_506, _458, _512);
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _528;
    float _532 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[143].y, _496);
    float _534 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[143].z, _480);
    float _536 = fma(_524, _400, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _538 = fma(_520, _486, _526);
    float _540 = fma(_530, _440, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _542 = fma(_516, _458, _532);
    float _544 = fma(_518, _458, _534);
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _548 = _546 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _552 = _550 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _554 = fma(_540, _486, _542);
    float _556 = fma(_548, _400, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _558;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _562;
    float _566 = fma(_552, _400, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _568 = fma(_514, _486, _544);
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _570;
    float _574 = fma(_536, _472, _538);
    float _576 = fma(_560, _408, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _578 = fma(_564, _408, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _580 = fma(_556, _472, _554);
    float _582 = fma(_572, _408, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _584 = fma(_566, _472, _568);
    float _586 = fma(_576, _470, _574);
    float _588 = fma(_578, _470, _580);
    float _590 = fma(_582, _470, _584);
    float _592 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[148].x, _586);
    float _594 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[148].y, _588);
    float _596 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[148].z, _590);
    bool _598 = !_378;
    float _614;
    if (!_598)
    {
        float _600 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _602 = _132 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _604 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[11].x, _100);
        float _606 = _604 * _600;
        float _608 = floor(_606);
        float _610 = -_608;
        float _612 = _606 + _610;
        _614 = _612;
        _616 = true;
    }
    else
    {
        _614 = _262;
    }
    _616 = false;
    float _618 = _614;
    float _620 = in.m_55.x;
    float _622 = in.m_55.y;
    float _624 = in.m_55.z;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _628 = _618 + _626;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _632 = _618 + _630;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _636 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _634;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _640 = _638 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _644 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _642;
    float _646 = 1.0 / _636;
    bool _648 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _650 = 1.0 / _644;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _652;
    float _656 = _596 * _624;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _660 = _618 + _658;
    float _662 = 1.0 / _640;
    float _664 = _594 * _622;
    float _666 = _660 * _646;
    bool _668 = _618 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _670 = isnan(_618);
    bool _672 = _668 || _670;
    bool _674 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _676 = _672 || _674;
    float _678 = float(_676);
    float _680 = fma(_654, _666, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _682 = _628 * _650;
    bool _684 = _618 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _686 = isnan(_618);
    bool _688 = _684 || _686;
    bool _690 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _692 = _688 || _690;
    float _694 = float(_692);
    float _696 = -_678;
    float _698 = _696 + 1.0;
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _702 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _700;
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _706 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _704;
    float _708 = _694 * _698;
    bool _710 = _618 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _712 = isnan(_618);
    bool _714 = _710 || _712;
    bool _716 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _718 = _714 || _716;
    float _720 = float(_718);
    float _722 = _632 * _662;
    bool _724 = _618 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _726 = isnan(_618);
    bool _728 = _724 || _726;
    bool _730 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _732 = _728 || _730;
    float _734 = float(_732);
    float _736 = -_694;
    float _738 = _736 + 1.0;
    float _740 = fma(_702, _666, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _742 = fma(_706, _666, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _746 = _744 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _748 = -_734;
    float _750 = _748 + 1.0;
    float _752 = _734 * _738;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _756 = _754 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _760 = _758 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _762 = _720 * _750;
    float _764 = -_720;
    float _766 = _764 + 1.0;
    float _768 = fma(_746, _722, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _770 = _740 * _762;
    float _772 = _680 * _762;
    float _774 = _742 * _762;
    float _776 = fma(_766, (*spvDescriptorSet0.vp_c9)._m0[107].x, _770);
    float _778 = fma(_766, (*spvDescriptorSet0.vp_c9)._m0[107].y, _772);
    float _780 = fma(_756, _722, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _784 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _782;
    float _786 = fma(_760, _722, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _790 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _788;
    float _792 = fma(_766, (*spvDescriptorSet0.vp_c9)._m0[107].z, _774);
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _796 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _794;
    float _798 = fma(_768, _752, _776);
    float _800 = fma(_784, _682, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _802 = fma(_790, _682, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _804 = fma(_780, _752, _778);
    float _806 = fma(_796, _682, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _808 = fma(_786, _752, _792);
    float _810 = fma(_800, _708, _798);
    float _812 = fma(_802, _708, _804);
    float _814 = _592 * _620;
    float _816 = fma(_806, _708, _808);
    float _818 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[110].x, _810);
    float _820 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[110].y, _812);
    float _822 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[110].z, _816);
    bool _824 = !_648;
    float _840;
    if (!_824)
    {
        float _826 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _828 = _132 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _830 = fma(_828, (*spvDescriptorSet0.vp_c9)._m0[11].y, _100);
        float _832 = _830 * _826;
        float _834 = floor(_832);
        float _836 = -_834;
        float _838 = _832 + _836;
        _840 = _838;
        _842 = true;
    }
    else
    {
        _840 = _262;
    }
    _842 = false;
    float _844 = _840;
    float _846 = _818 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _848 = _820 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _852 = _850 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _854 = _844 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _856 = isnan(_844);
    bool _858 = _854 || _856;
    bool _860 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _862 = _858 || _860;
    float _864 = float(_862);
    float _866 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _868 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _866;
    bool _870 = _844 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _872 = isnan(_844);
    bool _874 = _870 || _872;
    bool _876 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _878 = _874 || _876;
    float _880 = float(_878);
    float _882 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _884 = _882 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _886 = _844 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _888 = isnan(_844);
    bool _890 = _886 || _888;
    bool _892 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _894 = _890 || _892;
    float _896 = float(_894);
    float _898 = 1.0 / _852;
    float _900 = -_864;
    float _902 = _900 + 1.0;
    float _904 = -_880;
    float _906 = _904 + 1.0;
    bool _908 = _844 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _910 = isnan(_844);
    bool _912 = _908 || _910;
    bool _914 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _916 = _912 || _914;
    float _918 = float(_916);
    float _920 = _822 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _922 = 1.0 / _884;
    bool _924 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _926 = _868 * _898;
    float _928 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _930 = _928 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _932 = _896 * _906;
    float _934 = -_918;
    float _936 = _934 + 1.0;
    float _938 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _940 = _938 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _942 = _880 * _902;
    float _944 = -_896;
    float _946 = _944 + 1.0;
    bool _948 = _844 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _950 = isnan(_844);
    bool _952 = _948 || _950;
    bool _954 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _956 = _952 || _954;
    float _958 = float(_956);
    float _960 = 1.0 / _940;
    float _962 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _964 = _844 + _962;
    float _966 = _918 * _946;
    float _968 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _970 = _968 + (*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _972 = _958 * _936;
    float _974 = fma(_926, _964, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _976 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _978 = _844 + _976;
    float _980 = -_958;
    float _982 = _980 + 1.0;
    float _984 = 1.0 / _930;
    float _986 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _988 = _986 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _990 = _974 * _972;
    float _992 = _988 * _922;
    float _994 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _996 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _994;
    float _998 = 1.0 / _970;
    float _1000 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _1002 = _1000 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1004 = fma(_992, _978, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1006 = _996 * _960;
    float _1008 = fma(_982, (*spvDescriptorSet0.vp_c9)._m0[115].x, _990);
    float _1010 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1012 = _844 + _1010;
    bool _1014 = _844 >= (*spvDescriptorSet0.vp_c9)._m0[120].w;
    bool _1016 = isnan(_844);
    bool _1018 = _1014 || _1016;
    bool _1020 = isnan((*spvDescriptorSet0.vp_c9)._m0[120].w);
    bool _1022 = _1018 || _1020;
    float _1024 = float(_1022);
    float _1026 = _1002 * _984;
    float _1028 = -(*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1030 = (*spvDescriptorSet0.vp_c9)._m0[120].x + _1028;
    float _1032 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1034 = _844 + _1032;
    float _1036 = fma(_1006, _1012, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1038 = fma(_1004, _966, _1008);
    float _1040 = -_1024;
    float _1042 = _1040 + 1.0;
    float _1044 = fma(_1026, _1034, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1046 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1048 = _844 + _1046;
    float _1050 = _1030 * _998;
    float _1052 = fma(_1036, _932, _1038);
    float _1054 = _864 * _1042;
    float _1056 = _846 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1058 = fma(_1050, _1048, (*spvDescriptorSet0.vp_c9)._m0[119].x);
    float _1060 = fma(_1044, _942, _1052);
    float _1062 = _848 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1064 = _920 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1066 = fma(_1058, _1054, _1060);
    float _1068 = fma(_1024, (*spvDescriptorSet0.vp_c9)._m0[120].x, _1066);
    float _1070 = _1068 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _1056;
    out.m_57.y = _1062;
    out.m_57.z = _1064;
    out.m_57.w = _1070;
    bool _1072 = !_924;
    float _1088;
    if (!_1072)
    {
        float _1074 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1076 = _132 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1078 = fma(_1076, (*spvDescriptorSet0.vp_c9)._m0[11].z, _100);
        float _1080 = _1078 * _1074;
        float _1082 = floor(_1080);
        float _1084 = -_1082;
        float _1086 = _1080 + _1084;
        _1088 = _1086;
        _1090 = true;
    }
    else
    {
        _1088 = _262;
    }
    _1090 = false;
    float _1092 = _1088;
    float _1094 = in.m_51.z;
    float _1096 = _272 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1098 = _272 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1100 = _272 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1102 = _136 * 2.0;
    float _1104 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1096);
    float _1106 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1098);
    float _1108 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1100);
    float _1110 = _132 * 2.0;
    float _1112 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1104);
    float _1114 = floor(_1102);
    float _1116 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1106);
    float _1118 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1108);
    float _1120 = _136 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1122 = _132 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1124 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1126 = _1124 != 0;
    int _1128 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1130 = _1128 != 0;
    int _1132 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1134 = _1132 != 0;
    float _1136 = floor(_1110);
    float _1138 = _1116 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1140 = _1112 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1142 = _1094 * 2.0;
    float _1144 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1146 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1148 = log2(_1146);
    float _1150 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1152 = _136 + _1094;
    bool _1154 = _1114 > 0.0;
    float _1156 = -_1144;
    float _1158 = fma(_1122, 2.0, _1156);
    float _1160 = fma(_1120, -2.0, _1150);
    float _1162 = _1152 + (-1.0);
    float _1164 = floor(_1142);
    bool _1166 = _1136 > 0.0;
    float _1168 = _132 + _1094;
    bool _1170 = _1136 >= 0.0;
    bool _1172 = isnan(_1136);
    bool _1174 = _1170 || _1172;
    bool _1176 = isnan(0.0);
    bool _1178 = _1174 || _1176;
    float _1180 = fma(_1162, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1182 = _1168 + (-1.0);
    int _1184 = _1178 ? 0 : 1;
    float _1186 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1188 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1190 = 1.0 + _1188;
    int _1192 = ~_1184;
    int _1194 = _1192 + 1;
    int _1196 = _1194 + 1;
    float _1198 = fma(_1182, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1200 = -_100;
    float _1202 = fma(_1200, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1158);
    int _1204 = _1196;
    if (!_1166)
    {
        int _1206 = ~_1184;
        int _1208 = _1206 + 1;
        _1204 = _1208;
    }
    int _1210 = _1204;
    float _1212 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1214 = _1164 >= 0.0;
    bool _1216 = isnan(_1164);
    bool _1218 = _1214 || _1216;
    bool _1220 = isnan(0.0);
    bool _1222 = _1218 || _1220;
    float _1224 = 1.0 / _1190;
    bool _1226 = _1164 > 0.0;
    float _1228 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1186);
    int _1230 = _1222 ? 0 : 1;
    float _1232 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1212);
    bool _1234 = _1114 >= 0.0;
    bool _1236 = isnan(_1114);
    bool _1238 = _1234 || _1236;
    bool _1240 = isnan(0.0);
    bool _1242 = _1238 || _1240;
    float _1244 = _1148 * _100;
    bool _1246 = !_1130;
    int _1248 = _1246 ? 0 : 1;
    float _1250 = in.m_59.x;
    float _1252 = in.m_59.y;
    float _1254 = in.m_59.z;
    bool _1256 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1258 = isnan(1.0);
    bool _1260 = _1256 || _1258;
    bool _1262 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1264 = _1260 || _1262;
    float _1266 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1228);
    int _1268 = abs(_1248);
    float _1270 = exp2(_1244);
    float _1272 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1232);
    int _1274 = _1242 ? 0 : 1;
    float _1276 = _1118 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1278 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1280 = isnan(0.0);
    bool _1282 = _1278 || _1280;
    bool _1284 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1286 = _1282 || _1284;
    float _1288 = _664 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1290 = float(_1268);
    float _1292 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1294 = _1276 + _1292;
    float _1296 = float(_1210);
    float _1298 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1300 = _1140 + _1298;
    int _1302 = ~_1274;
    int _1304 = _1302 + 1;
    int _1306 = _1304 + 1;
    float _1308 = _814 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1310 = _1306;
    bool _1312 = _1264;
    if (!_1154)
    {
        int _1314 = ~_1274;
        int _1316 = _1314 + 1;
        _1310 = _1316;
    }
    int _1318 = _1310;
    float _1320 = _1290 * _1296;
    bool _1322 = !_1134;
    int _1324 = _1322 ? 0 : 1;
    float _1326 = _656 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1328 = -_1270;
    float _1330 = _1328 + 1.0;
    float _1332 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1160);
    int _1334 = abs(_1324);
    float _1336 = _1320 * (-2.0);
    float _1338 = float(_1318);
    float _1340 = _1286 ? _1330 : 0.0;
    float _1342 = fma(_1336, _1252, _1252);
    float _1344 = float(_1334);
    float _1346 = fma(_1180, _1336, _1180);
    int _1348 = ~_1230;
    int _1350 = _1348 + 1;
    int _1352 = _1350 + 1;
    int _1354 = _1352;
    if (_1264)
    {
        float _1356 = _1340 * _1224;
        _110 = _1356;
    }
    float _1358 = _110;
    float _1360 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1362 = _1138 + _1360;
    float _1364 = _136 + (-0.5);
    float _1366 = _1344 * _1338;
    if (!_1226)
    {
        int _1368 = ~_1230;
        int _1370 = _1368 + 1;
        _1354 = _1370;
    }
    int _1372 = _1354;
    float _1374 = _1362 * _1362;
    float _1376 = fma(_1364, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1342);
    bool _1378 = !_1126;
    int _1380 = _1378 ? 0 : 1;
    float _1382 = _1366 * (-2.0);
    float _1384 = fma(_1300, _1300, _1374);
    float _1386 = fma(_1346, _1358, _1376);
    int _1388 = abs(_1380);
    float _1390 = fma(_1382, _1254, _1254);
    float _1392 = fma(_1294, _1294, _1384);
    float _1394 = fma(_1198, _1382, _1198);
    float _1396 = _1094 + (-0.5);
    float _1398 = rsqrt(_1392);
    float _1400 = _132 + _136;
    float _1402 = float(_1388);
    float _1404 = fma(_1396, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1390);
    float _1406 = float(_1372);
    float _1408 = _1400 + (-1.0);
    float _1410 = fma(_1394, _1358, _1404);
    float _1412 = _1386 * 0.15915493667125701904296875;
    float _1414 = _1402 * _1406;
    float _1416 = fma(_1408, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1418 = in.m_61.x;
    float _1420 = in.m_61.y;
    float _1422 = in.m_61.z;
    float _1424 = _1414 * (-2.0);
    float _1426 = _1410 * 0.15915493667125701904296875;
    float _1428 = _1412 * 6.283185482025146484375;
    float _1430 = sin(_1428);
    float _1432 = _1362 * _1398;
    float _1434 = _1300 * _1398;
    float _1436 = in.m_63.x;
    float _1438 = in.m_63.y;
    float _1440 = in.m_63.z;
    float _1442 = fma(_1416, _1424, _1416);
    float _1444 = -_1432;
    float _1446 = fma(_1444, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1362);
    float _1448 = -_1434;
    float _1450 = fma(_1448, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1300);
    float _1452 = _1412 * 6.283185482025146484375;
    float _1454 = cos(_1452);
    float _1456 = _1446 * _1446;
    float _1458 = fma(_1424, _1250, _1250);
    float _1460 = _1294 * _1398;
    float _1462 = fma(_1450, _1450, _1456);
    float _1464 = _132 + (-0.5);
    float _1466 = -_1460;
    float _1468 = fma(_1466, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1294);
    float _1470 = _1426 * 6.283185482025146484375;
    float _1472 = cos(_1470);
    float _1474 = fma(_1464, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1458);
    float _1476 = fma(_1468, _1468, _1462);
    float _1478 = _262 * _262;
    float _1480 = fma(_1442, _1358, _1474);
    float _1482 = sqrt(_1476);
    float _1484 = _1480 * 0.15915493667125701904296875;
    float _1486 = -_1436;
    float _1488 = _1486 + _1418;
    float _1490 = -_1438;
    float _1492 = _1490 + _1420;
    float _1494 = -_1440;
    float _1496 = _1494 + _1422;
    float _1498 = fma(_1478, _1488, _1436);
    float _1500 = _1484 * 6.283185482025146484375;
    float _1502 = sin(_1500);
    float _1504 = fma(_1478, _1492, _1438);
    float _1506 = fma(_1478, _1496, _1440);
    float _1508 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1498);
    float _1510 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1504);
    float _1512 = _1430 * _1472;
    float _1514 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1506);
    float _1516 = _1484 * 6.283185482025146484375;
    float _1518 = cos(_1516);
    float _1520 = _1398 * _1482;
    float _1522 = _1288 * _1520;
    float _1524 = _1308 * _1520;
    float _1526 = _1326 * _1520;
    float _1528 = _1426 * 6.283185482025146484375;
    float _1530 = sin(_1528);
    float _1532 = _1522 * _1510;
    float _1534 = _1524 * _1508;
    float _1536 = _1502 * _1430;
    float _1538 = _1526 * _1514;
    float _1540 = _1472 * _1532;
    float _1542 = _1454 * _1472;
    float _1544 = _1518 * _1454;
    float _1546 = _1518 * _1430;
    float _1548 = _1518 * _1540;
    float _1550 = _1502 * _1454;
    float _1552 = fma(_1530, _1544, _1536);
    float _1554 = -_1532;
    float _1556 = _1530 * _1554;
    float _1558 = fma(_1552, _1534, _1548);
    float _1560 = -_1550;
    float _1562 = fma(_1530, _1546, _1560);
    float _1564 = -_1546;
    float _1566 = fma(_1530, _1550, _1564);
    float _1568 = _1502 * _1540;
    float _1570 = fma(_1542, _1534, _1556);
    float _1572 = fma(_1562, _1538, _1558);
    float _1574 = fma(_1530, _1536, _1544);
    float _1576 = fma(_1566, _1534, _1568);
    float _1578 = fma(_1512, _1538, _1570);
    float _1580 = _1572 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1582 = _1572 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1584 = fma(_1574, _1538, _1576);
    float _1586 = fma(_1578, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1580);
    float _1588 = fma(_1578, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1582);
    float _1590 = fma(_1584, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1586);
    float _1592 = fma(_1584, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1588);
    float _1594 = _1572 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1596 = _1276 + _1590;
    float _1598 = _1140 + _1592;
    float _1600 = fma(_1578, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1594);
    float _1602 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1604 = _1596 + _1602;
    float _1606 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1608 = _1598 + _1606;
    float _1610 = fma(_1584, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1600);
    float _1612 = _1604 * _1604;
    float _1614 = _1138 + _1610;
    float _1616 = fma(_1608, _1608, _1612);
    float _1618 = sqrt(_1616);
    bool _1620 = _1618 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1622 = _1572;
    float _1624 = _1584;
    float _1626 = _1612;
    float _1628 = _1618;
    float _1630 = _1578;
    float _1632 = _1604;
    float _1634 = _1596;
    if (!_1620)
    {
        _1622 = _1598;
    }
    float _1636 = _1622;
    float _1638 = _1636;
    if (!_1620)
    {
        _1624 = _1596;
    }
    float _1640 = _1624;
    float _1642 = _1640;
    if (!_1620)
    {
        _1626 = _1614;
    }
    float _1644 = _1626;
    bool _1646 = !_1620;
    float _1648 = _1644;
    if (!_1646)
    {
        float _1650 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1652 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1654 = _1618 + _1652;
        float _1656 = _1614 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1658 = _1654 * _1650;
        float _1660 = rsqrt(_1616);
        float _1662 = _1658 * 0.15915493667125701904296875;
        float _1664 = _1662 * 6.283185482025146484375;
        float _1666 = sin(_1664);
        float _1668 = _1662 * 6.283185482025146484375;
        float _1670 = cos(_1668);
        float _1672 = fma(_1666, _1656, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1674 = _1660 * _1672;
        float _1676 = _1670 + (-1.0);
        float _1678 = _1676 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1680 = fma(_1608, _1674, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1682 = fma(_1604, _1674, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1684 = fma(_1614, _1670, _1678);
        _1648 = _1684;
        _1638 = _1680;
        _1642 = _1682;
        _1628 = _1660;
        _1630 = _1662;
    }
    float _1686 = _1648;
    float _1688 = _1638;
    float _1690 = _1642;
    float _1692 = _1628;
    float _1694 = _1630;
    float _1696 = -_1432;
    float _1698 = fma(_1696, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1686);
    float _1700 = -_1434;
    float _1702 = fma(_1700, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1688);
    float _1704 = -_1460;
    float _1706 = fma(_1704, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1690);
    float _1708 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1710 = _1698 + _1708;
    float _1712 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1714 = _1702 + _1712;
    float _1716 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1718 = _1706 + _1716;
    float _1720 = _1710 * _1710;
    float _1722 = fma(_1714, _1714, _1720);
    float _1724 = fma(_1718, _1718, _1722);
    float _1726 = rsqrt(_1724);
    float _1728 = sqrt(_1724);
    float _1730 = _1726 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1732 = _1714 * _1730;
    float _1734 = _1718 * _1730;
    float _1736 = _1732 * _1732;
    float _1738 = _1734 * _1734;
    float _1740 = _1736 + _1738;
    float _1742 = sqrt(_1740);
    bool _1744 = _1742 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1746 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1748 = _1742 + _1746;
    float _1750 = _1726;
    float _1752 = _1694;
    float _1754 = _1748;
    if (_1744)
    {
        float _1756 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1750 = _1756;
    }
    float _1758 = _1750;
    if (_1744)
    {
        float _1760 = rsqrt(_1740);
        _1752 = _1760;
    }
    float _1762 = _1752;
    float _1764 = _1762;
    if (_1744)
    {
        float _1766 = _1748 * _1758;
        _1754 = _1766;
    }
    float _1768 = _1754;
    float _1770 = _1698 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_1744)
    {
        float _1772 = _1768 * 0.15915493667125701904296875;
        _1632 = _1772;
    }
    float _1774 = _1632;
    float _1776 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1770);
    float _1778 = _1718;
    if (_1744)
    {
        float _1780 = _1774 * 6.283185482025146484375;
        float _1782 = sin(_1780);
        _1778 = _1782;
    }
    float _1784 = _1778;
    float _1786 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1788 = precise::max(0.0, _1786);
    float _1790 = _1692;
    float _1792 = _1788;
    float _1794 = _1786;
    if (_1744)
    {
        float _1796 = _1774 * 6.283185482025146484375;
        float _1798 = cos(_1796);
        _1790 = _1798;
    }
    float _1800 = _1790;
    float _1802 = -_1730;
    float _1804 = -_1788;
    float _1806 = fma(_1710, _1802, _1804);
    float _1808 = _1806;
    if (_1744)
    {
        float _1810 = _1806 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1792 = _1810;
    }
    float _1812 = _1792;
    float _1814 = _1812;
    float _1816 = _1784;
    if (_1744)
    {
        float _1818 = fma(_1784, _1812, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1814 = _1818;
    }
    float _1820 = _1814;
    float _1822 = _1820;
    if (!_1744)
    {
        _1816 = _1732;
    }
    float _1824 = _1816;
    float _1826 = _1824;
    float _1828 = _1800;
    if (_1744)
    {
        float _1830 = _1800 + (-1.0);
        _1794 = _1830;
    }
    float _1832 = _1794;
    float _1834 = _1832;
    if (_1744)
    {
        float _1836 = _1762 * _1820;
        _1634 = _1836;
    }
    float _1838 = _1634;
    if (!_1744)
    {
        _1822 = _1736;
    }
    float _1840 = _1822;
    float _1842 = _1840;
    if (_1744)
    {
        float _1844 = _1832 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1764 = _1844;
    }
    float _1846 = _1764;
    if (_1744)
    {
        float _1848 = _1732 * _1838;
        _1826 = _1848;
    }
    float _1850 = _1826;
    if (!_1744)
    {
        _1834 = _1734;
    }
    float _1852 = _1834;
    float _1854 = _1852;
    if (_1744)
    {
        float _1856 = _1734 * _1838;
        _1854 = _1856;
    }
    float _1858 = _1854;
    if (_1744)
    {
        float _1860 = fma(_1806, _1800, _1846);
        _1808 = _1860;
    }
    float _1862 = _1808;
    if (_1744)
    {
        float _1864 = _1850 * _1850;
        _1842 = _1864;
    }
    float _1866 = _1842;
    if (!_1744)
    {
        _1828 = _1738;
    }
    float _1868 = _1828;
    float _1870 = _1868;
    if (_1744)
    {
        float _1872 = _1858 * _1858;
        _1870 = _1872;
    }
    float _1874 = _1870;
    float _1876 = fma(_1862, _1862, _1866);
    float _1878 = _1698 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1880 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1882 = _1876 + _1874;
    float _1884 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1878);
    float _1886 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1888 = fma(_1728, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1886);
    float _1890 = precise::clamp(_1888, 0.0, 1.0);
    float _1892 = _1698 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1894 = rsqrt(_1882);
    float _1896 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1884);
    float _1898 = -_1890;
    float _1900 = _1898 + 1.0;
    float _1902 = _1698 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1904 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1892);
    float _1906 = _1896 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1908 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1902);
    float _1910 = abs(_1900);
    float _1912 = log2(_1910);
    float _1914 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1904);
    float _1916 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1776);
    float _1918 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1908);
    float _1920 = _1906 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1922 = _1914 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1924 = _1916 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1926 = _1918 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1928 = _1894 * _1850;
    float _1930 = _1922 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1932 = _1894 * _1862;
    float _1934 = _1894 * _1858;
    float _1936 = _1928 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1938 = fma(_1926, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1930);
    float _1940 = -_1920;
    float _1942 = fma(_1940, _1880, 1.0);
    float _1944 = _1912 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1946 = -_1936;
    float _1948 = fma(_1932, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1946);
    float _1950 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1938);
    float _1952 = log2(_1942);
    float _1954 = -_1934;
    float _1956 = fma(_1954, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1948);
    float _1958 = fma(_1924, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1950);
    float _1960 = _1922 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1962 = fma(_1956, -0.5, 0.5);
    float _1964 = fma(_1956, 0.5, 0.5);
    float _1966 = exp2(_1944);
    float _1968 = _1922 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1970 = fma(_1926, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1960);
    float _1972 = _1932 + 1.0;
    float _1974 = fma(_1926, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1968);
    float _1976 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1970);
    float _1978 = fma(_1964, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1980 = 1.0 / _1958;
    float _1982 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1974);
    float _1984 = _1952 * 0.693147182464599609375;
    float _1986 = fma(_1964, _1978, -0.212114393711090087890625);
    float _1988 = _1984 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1990 = fma(_1964, _1986, 1.570728778839111328125);
    float _1992 = sqrt(_1962);
    float _1994 = -_1932;
    float _1996 = fma(_1966, _1972, _1994);
    float _1998 = fma(_1924, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1976);
    float _2000 = fma(_1924, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1982);
    float _2002 = fma(_1996, 0.5, 0.5);
    float _2004 = _1998 * _1980;
    float _2006 = _2000 * _1980;
    float _2008 = fma(_2004, 0.5, 0.5);
    float _2010 = fma(_2006, -0.5, 0.5);
    float _2012 = _1992 * 0.636619746685028076171875;
    float3 _5424 = float3(_2008, _2010, _1988);
    float _2014 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5424, float3(0.0), isnan(_5424)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5424, float3(0.0), isnan(_5424)), level(0.0)).x;
    float3 _5435 = float3(_2008, _2010, _1988);
    float4 _2017 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5435, float3(0.0), isnan(_5435)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5435, float3(0.0), isnan(_5435)), level(0.0)).xyzw;
    float _2019 = _2017.x;
    float _2021 = _2017.y;
    float _2023 = _2017.z;
    float _2025 = _2017.w;
    float _2027 = -_1990;
    float _2029 = fma(_2012, _2027, 1.0);
    float2 _5457 = float2(_2029, _2002);
    float3 _2033 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5457, float2(0.0), isnan(_5457)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5457, float2(0.0), isnan(_5457)), level(0.0)).xyz;
    float _2035 = _2033.x;
    float _2037 = _2033.y;
    float _2039 = _2033.z;
    float _2041 = in.m_65.y;
    float _2043 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2045 = in.m_51.w;
    bool _2047 = _136 > 0.5;
    float _2049 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _2051 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _2049;
    int _2053 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2055 = _2053 != 0;
    float _2057 = in.m_61.w;
    int _2059 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2061 = _2059 != 0;
    float _2063 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _2065 = _1092 + _2063;
    int _2067 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2069 = _2067 != 0;
    float _2071 = 1.0 / _2051;
    float _2073 = in.m_65.x;
    int _2075 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2077 = _2075 != 0;
    float _2079 = _1922 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2081 = fma(_1926, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2079);
    int _2083 = as_type<int>(_2043);
    if (_2055)
    {
        bool _2085 = _132 > 0.5;
        _1312 = _2085;
    }
    bool _2087 = _1312;
    float _2089 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2091 = -_2041;
    float _2093 = _2091 + 1.0;
    float _2095 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2081);
    float _2097 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _2099 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _2097;
    bool _2101 = _2045 > 0.5;
    float _2103 = _2065 * _2071;
    bool _2105 = _1092 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _2107 = isnan(_1092);
    bool _2109 = _2105 || _2107;
    bool _2111 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _2113 = _2109 || _2111;
    float _2115 = float(_2113);
    float _2117 = fma(_1924, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2095);
    int _2119 = _2101 ? as_type<int>(_2093) : as_type<int>(_2041);
    out.m_67.w = _2057;
    bool _2121 = _2101;
    float _2123 = _2099;
    float _2125 = _2041;
    if (_2061)
    {
        bool _2127 = _1094 > 0.5;
        _2121 = _2127;
    }
    bool _2129 = _2121;
    float _2131 = fma(_2099, _2103, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _2133 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _2135 = _2117 + _2133;
    bool _2137 = _1092 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _2139 = isnan(_1092);
    bool _2141 = _2137 || _2139;
    bool _2143 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _2145 = _2141 || _2143;
    float _2147 = float(_2145);
    float _2149 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _2151 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _2149;
    float _2153 = _2069 ? as_type<float>(_2119) : _2041;
    float _2155 = -_2147;
    float _2157 = _2155 + 1.0;
    if (!_2055)
    {
        _2123 = _2073;
    }
    float _2159 = _2123;
    float _2161 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _2163 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _2161;
    float _2165 = fma(_2151, _2103, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _2167 = _2115 * _2157;
    float _2169 = _2165;
    float _2171 = _2159;
    if (_2077)
    {
        float _2173 = _2047 ? _2093 : _2041;
        _2125 = _2173;
    }
    float _2175 = _2125;
    float _2177 = fma(_2163, _2103, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _2179 = _2043 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2181 = _2165 * _2167;
    float _2183 = _2131 * _2167;
    float _2185 = _2177 * _2167;
    int _2187 = as_type<int>(_2177);
    if (_2055)
    {
        float _2189 = -_2073;
        float _2191 = _2189 + 1.0;
        _2187 = as_type<int>(_2191);
    }
    int _2193 = _2187;
    float _2195 = fma(_2179, _2175, -0.5);
    float _2197 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (_2061)
    {
        float _2199 = -_2073;
        float _2201 = _2199 + 1.0;
        _2083 = as_type<int>(_2201);
    }
    int _2203 = _2083;
    if (!_2061)
    {
        _2169 = _2073;
    }
    float _2205 = _2169;
    float _2207 = -_1332;
    float _2209 = fma(_1272, _2195, _2207);
    float _2211 = _2205;
    if (_2055)
    {
        float _2213 = _2087 ? as_type<float>(_2193) : _2073;
        _2171 = _2213;
    }
    float _2215 = _2171;
    float _2217 = _2089 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_2061)
    {
        float _2219 = _2129 ? as_type<float>(_2203) : _2073;
        _2211 = _2219;
    }
    float _2221 = _2211;
    float _2223 = _2153 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2225 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2227 = fma(_2217, _2215, -0.5);
    float _2229 = _2209 + 0.5;
    float _2231 = _2221 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2233 = -_2115;
    float _2235 = _2233 + 1.0;
    float _2237 = fma(_1266, _2227, _1202);
    float _2239 = _1912 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.gl_Position.x = _1998;
    out.gl_Position.y = _2000;
    out.gl_Position.z = _2135;
    out.gl_Position.w = _1958;
    float _2241 = _2223 * _2197;
    float _2243 = _2237 + 0.5;
    float _2245 = fma(_2235, (*spvDescriptorSet0.vp_c9)._m0[123].x, _2181);
    float _2247 = fma(_2235, (*spvDescriptorSet0.vp_c9)._m0[123].y, _2183);
    float _2249 = exp2(_2239);
    float _2251 = fma(_2235, (*spvDescriptorSet0.vp_c9)._m0[123].z, _2185);
    float _2253 = fma(_2147, (*spvDescriptorSet0.vp_c9)._m0[124].x, _2245);
    float _2255 = fma(_2147, (*spvDescriptorSet0.vp_c9)._m0[124].y, _2247);
    float _2257 = _2231 * _2225;
    float _2259 = _1998 + _1958;
    float _2261 = fma(_2147, (*spvDescriptorSet0.vp_c9)._m0[124].z, _2251);
    float _2263 = _1958 + _2135;
    float _2265 = _2253 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    out.m_69.x = _2243;
    out.m_69.y = _2229;
    out.m_69.z = _2257;
    out.m_69.w = _2241;
    float _2267 = _2255 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2269 = _2261 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2271 = _2265 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2273 = _2267 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2275 = _2269 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2277 = -_2249;
    float _2279 = _2277 + 1.0;
    out.m_71.x = _2271;
    out.m_71.y = _2273;
    out.m_71.z = _2275;
    float _2281 = _2259 * 0.5;
    float _2283 = _2279 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2285 = _1958 * 0.5;
    float _2287 = fma(_2000, -0.5, _2285);
    float _2289 = _2263 * 0.5;
    out.m_73.x = _2281;
    out.m_73.y = _2287;
    out.m_73.z = _2289;
    out.m_73.w = _1958;
    float _2291 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_49.x = _2291;
    float _2293 = _2283 * _2014;
    float _2295 = _2025 * _2293;
    float _2297 = _2039 * _2293;
    float _2299 = -_2283;
    float _2301 = _2299 + 1.0;
    float _2303 = fma(_2035, _2295, _2019);
    float _2305 = fma(_2037, _2295, _2021);
    float _2307 = _2025 * _2301;
    float _2309 = fma(_2025, _2297, _2023);
    out.m_75.x = _2303;
    out.m_75.y = _2305;
    out.m_75.z = _2309;
    out.m_75.w = _2307;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1090 = false;
    bool _842 = false;
    bool _616 = false;
    bool _294 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_42.w;
    float _91 = in.m_44.w;
    float _93 = trunc(_89);
    int _96 = int(_93);
    float _98 = -_91;
    float _100 = _98 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_47.y = _100;
    bool _104 = _96 >= 1;
    float _106 = 0.0;
    float _108 = as_type<float>(_96);
    float _110 = _100;
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _106;
    if (!_104)
    {
        out.m_49.x = 0.0;
    }
    int _114 = 0;
    if (!_104)
    {
        float _116 = _112 * 5.0;
        _114 = as_type<int>(_116);
    }
    int _118 = _114;
    int _120 = _118;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2378 = as_type<float>(_118);
        out.gl_Position.z = _2378;
    }
    if (!_104)
    {
        return out;
    }
    bool _122 = _91 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _124 = isnan(_91);
    bool _126 = _122 || _124;
    bool _128 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _130 = _126 || _128;
    float _132 = in.m_51.x;
    float _134 = float(_96);
    float _136 = in.m_51.y;
    bool _138 = _100 >= _134;
    bool _140 = !_130;
    bool _142 = _138 || _140;
    if (_142)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _144 = _108;
    if (_142)
    {
        out.m_49.x = 0.0;
    }
    if (_142)
    {
        float _146 = _144 * 5.0;
        _120 = as_type<int>(_146);
    }
    int _148 = _120;
    out.m_53.x = _132;
    out.m_53.y = _136;
    if (_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2441 = as_type<float>(_148);
        out.gl_Position.z = _2441;
    }
    if (_142)
    {
        return out;
    }
    float _150 = in.m_55.w;
    float _152 = 1.0 / _134;
    float _154 = _100 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _156 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _158 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _160 = _156 || _158;
    bool _162 = isnan(1.0);
    bool _164 = _160 || _162;
    float _166 = in.m_44.x;
    float _168 = in.m_44.y;
    float _170 = in.m_44.z;
    float _172 = in.m_42.x;
    float _174 = in.m_42.y;
    float _176 = in.m_42.z;
    float _178 = 0.0;
    float _180 = _154;
    if (!_164)
    {
        float _182 = _154 * _154;
        float _184 = _182 * 0.5;
        _178 = _184;
    }
    float _186 = _178;
    float _188 = _186;
    if (!_164)
    {
        float _190 = _186 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _188 = _190;
    }
    float _192 = _188;
    bool _194 = !_164;
    float _196 = _192;
    if (!_194)
    {
        float _198 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _200 = log2(_198);
        float _202 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _204 = _202 + 1.0;
        float _206 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _208 = _154 * _200;
        float _210 = 1.0 / _204;
        float _212 = _206 * 0.693147182464599609375;
        float _214 = exp2(_208);
        float _216 = 1.0 / _212;
        float _218 = _214 + (-1.0);
        float _220 = -_218;
        float _222 = fma(_220, _216, _154);
        float _224 = _222 * _210;
        float _226 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _196 = _226;
    }
    float _228 = _196;
    bool _230 = !_164;
    if (!_230)
    {
        float _232 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _234 = log2(_232);
        float _236 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _238 = _236 + 1.0;
        float _240 = 1.0 / _238;
        float _242 = _154 * _234;
        float _244 = exp2(_242);
        float _246 = -_244;
        float _248 = _246 + 1.0;
        float _250 = _248 * _240;
        _180 = _250;
    }
    float _252 = _180;
    bool _254 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _256 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _258 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _260 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _262 = _100 * _152;
    float _264 = fma(_252, _166, _256);
    float _266 = fma(_252, _168, _258);
    float _268 = fma(_252, _170, _260);
    float _270 = fma(_264, _150, _172);
    float _272 = fma(_266, _150, _174);
    float _274 = fma(_268, _150, _176);
    bool _276 = !_254;
    float _292;
    if (!_276)
    {
        float _278 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _280 = _132 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _282 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[12].x, _100);
        float _284 = _282 * _278;
        float _286 = floor(_284);
        float _288 = -_286;
        float _290 = _284 + _288;
        _292 = _290;
        _294 = true;
    }
    else
    {
        _292 = _262;
    }
    _294 = false;
    float _296 = _292;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _300 = _296 + _298;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _304 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _302;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _308 = _306 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _312 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _310;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _316 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _314;
    float _318 = 1.0 / _308;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _322 = _320 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _324 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _326 = isnan(_296);
    bool _328 = _324 || _326;
    bool _330 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _332 = _328 || _330;
    float _334 = float(_332);
    float _336 = 1.0 / _304;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _340 = _296 + _338;
    bool _342 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _344 = isnan(_296);
    bool _346 = _342 || _344;
    bool _348 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _350 = _346 || _348;
    float _352 = float(_350);
    float _354 = 1.0 / _322;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _358 = _296 + _356;
    float _360 = _300 * _318;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _364 = _296 + _362;
    bool _366 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _368 = isnan(_296);
    bool _370 = _366 || _368;
    bool _372 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _374 = _370 || _372;
    float _376 = float(_374);
    bool _378 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _380 = 1.0 / _312;
    float _382 = _358 * _336;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _386 = _296 + _384;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _388;
    float _392 = -_376;
    float _394 = _392 + 1.0;
    float _396 = fma(_390, _382, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _398 = 1.0 / _316;
    float _400 = _340 * _354;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _402;
    float _406 = fma(_404, _382, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _408 = _364 * _380;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _410;
    bool _414 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _416 = isnan(_296);
    bool _418 = _414 || _416;
    bool _420 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _422 = _418 || _420;
    float _424 = float(_422);
    float _426 = fma(_412, _382, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _428 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _430 = isnan(_296);
    bool _432 = _428 || _430;
    bool _434 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _436 = _432 || _434;
    float _438 = float(_436);
    float _440 = _386 * _398;
    bool _442 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _444 = isnan(_296);
    bool _446 = _442 || _444;
    bool _448 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _450 = _446 || _448;
    float _452 = float(_450);
    float _454 = -_424;
    float _456 = _454 + 1.0;
    float _458 = _438 * _394;
    float _460 = -_438;
    float _462 = _460 + 1.0;
    float _464 = -_452;
    float _466 = _464 + 1.0;
    float _468 = _352 * _462;
    float _470 = _424 * _466;
    float _472 = _334 * _456;
    float _474 = -_334;
    float _476 = _474 + 1.0;
    float _478 = _426 * _468;
    float _480 = _406 * _468;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _484 = _482 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _486 = _376 * _476;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _490 = _488 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _496 = _396 * _468;
    float _498 = -_352;
    float _500 = _498 + 1.0;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _502;
    float _506 = fma(_490, _360, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _510 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _508;
    float _512 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[143].x, _478);
    float _514 = fma(_504, _440, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _516 = fma(_494, _360, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _518 = fma(_484, _360, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _520 = fma(_510, _440, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _524 = _522 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _526 = fma(_506, _458, _512);
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _528;
    float _532 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[143].y, _496);
    float _534 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[143].z, _480);
    float _536 = fma(_524, _400, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _538 = fma(_520, _486, _526);
    float _540 = fma(_530, _440, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _542 = fma(_516, _458, _532);
    float _544 = fma(_518, _458, _534);
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _548 = _546 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _552 = _550 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _554 = fma(_540, _486, _542);
    float _556 = fma(_548, _400, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _558;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _562;
    float _566 = fma(_552, _400, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _568 = fma(_514, _486, _544);
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _570;
    float _574 = fma(_536, _472, _538);
    float _576 = fma(_560, _408, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _578 = fma(_564, _408, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _580 = fma(_556, _472, _554);
    float _582 = fma(_572, _408, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _584 = fma(_566, _472, _568);
    float _586 = fma(_576, _470, _574);
    float _588 = fma(_578, _470, _580);
    float _590 = fma(_582, _470, _584);
    float _592 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[148].x, _586);
    float _594 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[148].y, _588);
    float _596 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[148].z, _590);
    bool _598 = !_378;
    float _614;
    if (!_598)
    {
        float _600 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _602 = _132 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _604 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[11].x, _100);
        float _606 = _604 * _600;
        float _608 = floor(_606);
        float _610 = -_608;
        float _612 = _606 + _610;
        _614 = _612;
        _616 = true;
    }
    else
    {
        _614 = _262;
    }
    _616 = false;
    float _618 = _614;
    float _620 = in.m_55.x;
    float _622 = in.m_55.y;
    float _624 = in.m_55.z;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _628 = _618 + _626;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _632 = _618 + _630;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _636 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _634;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _640 = _638 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _644 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _642;
    float _646 = 1.0 / _636;
    bool _648 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _650 = 1.0 / _644;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _652;
    float _656 = _596 * _624;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _660 = _618 + _658;
    float _662 = 1.0 / _640;
    float _664 = _594 * _622;
    float _666 = _660 * _646;
    bool _668 = _618 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _670 = isnan(_618);
    bool _672 = _668 || _670;
    bool _674 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _676 = _672 || _674;
    float _678 = float(_676);
    float _680 = fma(_654, _666, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _682 = _628 * _650;
    bool _684 = _618 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _686 = isnan(_618);
    bool _688 = _684 || _686;
    bool _690 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _692 = _688 || _690;
    float _694 = float(_692);
    float _696 = -_678;
    float _698 = _696 + 1.0;
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _702 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _700;
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _706 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _704;
    float _708 = _694 * _698;
    bool _710 = _618 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _712 = isnan(_618);
    bool _714 = _710 || _712;
    bool _716 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _718 = _714 || _716;
    float _720 = float(_718);
    float _722 = _632 * _662;
    bool _724 = _618 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _726 = isnan(_618);
    bool _728 = _724 || _726;
    bool _730 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _732 = _728 || _730;
    float _734 = float(_732);
    float _736 = -_694;
    float _738 = _736 + 1.0;
    float _740 = fma(_702, _666, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _742 = fma(_706, _666, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _746 = _744 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _748 = -_734;
    float _750 = _748 + 1.0;
    float _752 = _734 * _738;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _756 = _754 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _760 = _758 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _762 = _720 * _750;
    float _764 = -_720;
    float _766 = _764 + 1.0;
    float _768 = fma(_746, _722, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _770 = _740 * _762;
    float _772 = _680 * _762;
    float _774 = _742 * _762;
    float _776 = fma(_766, (*spvDescriptorSet0.vp_c9)._m0[107].x, _770);
    float _778 = fma(_766, (*spvDescriptorSet0.vp_c9)._m0[107].y, _772);
    float _780 = fma(_756, _722, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _784 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _782;
    float _786 = fma(_760, _722, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _790 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _788;
    float _792 = fma(_766, (*spvDescriptorSet0.vp_c9)._m0[107].z, _774);
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _796 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _794;
    float _798 = fma(_768, _752, _776);
    float _800 = fma(_784, _682, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _802 = fma(_790, _682, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _804 = fma(_780, _752, _778);
    float _806 = fma(_796, _682, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _808 = fma(_786, _752, _792);
    float _810 = fma(_800, _708, _798);
    float _812 = fma(_802, _708, _804);
    float _814 = _592 * _620;
    float _816 = fma(_806, _708, _808);
    float _818 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[110].x, _810);
    float _820 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[110].y, _812);
    float _822 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[110].z, _816);
    bool _824 = !_648;
    float _840;
    if (!_824)
    {
        float _826 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _828 = _132 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _830 = fma(_828, (*spvDescriptorSet0.vp_c9)._m0[11].y, _100);
        float _832 = _830 * _826;
        float _834 = floor(_832);
        float _836 = -_834;
        float _838 = _832 + _836;
        _840 = _838;
        _842 = true;
    }
    else
    {
        _840 = _262;
    }
    _842 = false;
    float _844 = _840;
    float _846 = _818 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _848 = _820 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _852 = _850 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _854 = _844 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _856 = isnan(_844);
    bool _858 = _854 || _856;
    bool _860 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _862 = _858 || _860;
    float _864 = float(_862);
    float _866 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _868 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _866;
    bool _870 = _844 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _872 = isnan(_844);
    bool _874 = _870 || _872;
    bool _876 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _878 = _874 || _876;
    float _880 = float(_878);
    float _882 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _884 = _882 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _886 = _844 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _888 = isnan(_844);
    bool _890 = _886 || _888;
    bool _892 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _894 = _890 || _892;
    float _896 = float(_894);
    float _898 = 1.0 / _852;
    float _900 = -_864;
    float _902 = _900 + 1.0;
    float _904 = -_880;
    float _906 = _904 + 1.0;
    bool _908 = _844 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _910 = isnan(_844);
    bool _912 = _908 || _910;
    bool _914 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _916 = _912 || _914;
    float _918 = float(_916);
    float _920 = _822 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _922 = 1.0 / _884;
    bool _924 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _926 = _868 * _898;
    float _928 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _930 = _928 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _932 = _896 * _906;
    float _934 = -_918;
    float _936 = _934 + 1.0;
    float _938 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _940 = _938 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _942 = _880 * _902;
    float _944 = -_896;
    float _946 = _944 + 1.0;
    bool _948 = _844 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _950 = isnan(_844);
    bool _952 = _948 || _950;
    bool _954 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _956 = _952 || _954;
    float _958 = float(_956);
    float _960 = 1.0 / _940;
    float _962 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _964 = _844 + _962;
    float _966 = _918 * _946;
    float _968 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _970 = _968 + (*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _972 = _958 * _936;
    float _974 = fma(_926, _964, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _976 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _978 = _844 + _976;
    float _980 = -_958;
    float _982 = _980 + 1.0;
    float _984 = 1.0 / _930;
    float _986 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _988 = _986 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _990 = _974 * _972;
    float _992 = _988 * _922;
    float _994 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _996 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _994;
    float _998 = 1.0 / _970;
    float _1000 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _1002 = _1000 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1004 = fma(_992, _978, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1006 = _996 * _960;
    float _1008 = fma(_982, (*spvDescriptorSet0.vp_c9)._m0[115].x, _990);
    float _1010 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1012 = _844 + _1010;
    bool _1014 = _844 >= (*spvDescriptorSet0.vp_c9)._m0[120].w;
    bool _1016 = isnan(_844);
    bool _1018 = _1014 || _1016;
    bool _1020 = isnan((*spvDescriptorSet0.vp_c9)._m0[120].w);
    bool _1022 = _1018 || _1020;
    float _1024 = float(_1022);
    float _1026 = _1002 * _984;
    float _1028 = -(*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1030 = (*spvDescriptorSet0.vp_c9)._m0[120].x + _1028;
    float _1032 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1034 = _844 + _1032;
    float _1036 = fma(_1006, _1012, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1038 = fma(_1004, _966, _1008);
    float _1040 = -_1024;
    float _1042 = _1040 + 1.0;
    float _1044 = fma(_1026, _1034, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1046 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1048 = _844 + _1046;
    float _1050 = _1030 * _998;
    float _1052 = fma(_1036, _932, _1038);
    float _1054 = _864 * _1042;
    float _1056 = _846 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1058 = fma(_1050, _1048, (*spvDescriptorSet0.vp_c9)._m0[119].x);
    float _1060 = fma(_1044, _942, _1052);
    float _1062 = _848 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1064 = _920 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1066 = fma(_1058, _1054, _1060);
    float _1068 = fma(_1024, (*spvDescriptorSet0.vp_c9)._m0[120].x, _1066);
    float _1070 = _1068 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _1056;
    out.m_57.y = _1062;
    out.m_57.z = _1064;
    out.m_57.w = _1070;
    bool _1072 = !_924;
    float _1088;
    if (!_1072)
    {
        float _1074 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1076 = _132 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1078 = fma(_1076, (*spvDescriptorSet0.vp_c9)._m0[11].z, _100);
        float _1080 = _1078 * _1074;
        float _1082 = floor(_1080);
        float _1084 = -_1082;
        float _1086 = _1080 + _1084;
        _1088 = _1086;
        _1090 = true;
    }
    else
    {
        _1088 = _262;
    }
    _1090 = false;
    float _1092 = _1088;
    float _1094 = in.m_51.z;
    float _1096 = _272 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1098 = _272 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1100 = _272 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1102 = _136 * 2.0;
    float _1104 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1096);
    float _1106 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1098);
    float _1108 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1100);
    float _1110 = _132 * 2.0;
    float _1112 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1104);
    float _1114 = floor(_1102);
    float _1116 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1106);
    float _1118 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1108);
    float _1120 = _136 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1122 = _132 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1124 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1126 = _1124 != 0;
    int _1128 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1130 = _1128 != 0;
    int _1132 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1134 = _1132 != 0;
    float _1136 = floor(_1110);
    float _1138 = _1116 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1140 = _1112 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1142 = _1094 * 2.0;
    float _1144 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1146 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1148 = log2(_1146);
    float _1150 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1152 = _136 + _1094;
    bool _1154 = _1114 > 0.0;
    float _1156 = -_1144;
    float _1158 = fma(_1122, 2.0, _1156);
    float _1160 = fma(_1120, -2.0, _1150);
    float _1162 = _1152 + (-1.0);
    float _1164 = floor(_1142);
    bool _1166 = _1136 > 0.0;
    float _1168 = _132 + _1094;
    bool _1170 = _1136 >= 0.0;
    bool _1172 = isnan(_1136);
    bool _1174 = _1170 || _1172;
    bool _1176 = isnan(0.0);
    bool _1178 = _1174 || _1176;
    float _1180 = fma(_1162, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1182 = _1168 + (-1.0);
    int _1184 = _1178 ? 0 : 1;
    float _1186 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1188 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1190 = 1.0 + _1188;
    int _1192 = ~_1184;
    int _1194 = _1192 + 1;
    int _1196 = _1194 + 1;
    float _1198 = fma(_1182, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1200 = -_100;
    float _1202 = fma(_1200, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1158);
    int _1204 = _1196;
    if (!_1166)
    {
        int _1206 = ~_1184;
        int _1208 = _1206 + 1;
        _1204 = _1208;
    }
    int _1210 = _1204;
    float _1212 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1214 = _1164 >= 0.0;
    bool _1216 = isnan(_1164);
    bool _1218 = _1214 || _1216;
    bool _1220 = isnan(0.0);
    bool _1222 = _1218 || _1220;
    float _1224 = 1.0 / _1190;
    bool _1226 = _1164 > 0.0;
    float _1228 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1186);
    int _1230 = _1222 ? 0 : 1;
    float _1232 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1212);
    bool _1234 = _1114 >= 0.0;
    bool _1236 = isnan(_1114);
    bool _1238 = _1234 || _1236;
    bool _1240 = isnan(0.0);
    bool _1242 = _1238 || _1240;
    float _1244 = _1148 * _100;
    bool _1246 = !_1130;
    int _1248 = _1246 ? 0 : 1;
    float _1250 = in.m_59.x;
    float _1252 = in.m_59.y;
    float _1254 = in.m_59.z;
    bool _1256 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1258 = isnan(1.0);
    bool _1260 = _1256 || _1258;
    bool _1262 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1264 = _1260 || _1262;
    float _1266 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1228);
    int _1268 = abs(_1248);
    float _1270 = exp2(_1244);
    float _1272 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1232);
    int _1274 = _1242 ? 0 : 1;
    float _1276 = _1118 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1278 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1280 = isnan(0.0);
    bool _1282 = _1278 || _1280;
    bool _1284 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1286 = _1282 || _1284;
    float _1288 = _664 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1290 = float(_1268);
    float _1292 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1294 = _1276 + _1292;
    float _1296 = float(_1210);
    float _1298 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1300 = _1140 + _1298;
    int _1302 = ~_1274;
    int _1304 = _1302 + 1;
    int _1306 = _1304 + 1;
    float _1308 = _814 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1310 = _1306;
    bool _1312 = _1264;
    if (!_1154)
    {
        int _1314 = ~_1274;
        int _1316 = _1314 + 1;
        _1310 = _1316;
    }
    int _1318 = _1310;
    float _1320 = _1290 * _1296;
    bool _1322 = !_1134;
    int _1324 = _1322 ? 0 : 1;
    float _1326 = _656 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1328 = -_1270;
    float _1330 = _1328 + 1.0;
    float _1332 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1160);
    int _1334 = abs(_1324);
    float _1336 = _1320 * (-2.0);
    float _1338 = float(_1318);
    float _1340 = _1286 ? _1330 : 0.0;
    float _1342 = fma(_1336, _1252, _1252);
    float _1344 = float(_1334);
    float _1346 = fma(_1180, _1336, _1180);
    int _1348 = ~_1230;
    int _1350 = _1348 + 1;
    int _1352 = _1350 + 1;
    int _1354 = _1352;
    if (_1264)
    {
        float _1356 = _1340 * _1224;
        _110 = _1356;
    }
    float _1358 = _110;
    float _1360 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1362 = _1138 + _1360;
    float _1364 = _136 + (-0.5);
    float _1366 = _1344 * _1338;
    if (!_1226)
    {
        int _1368 = ~_1230;
        int _1370 = _1368 + 1;
        _1354 = _1370;
    }
    int _1372 = _1354;
    float _1374 = _1362 * _1362;
    float _1376 = fma(_1364, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1342);
    bool _1378 = !_1126;
    int _1380 = _1378 ? 0 : 1;
    float _1382 = _1366 * (-2.0);
    float _1384 = fma(_1300, _1300, _1374);
    float _1386 = fma(_1346, _1358, _1376);
    int _1388 = abs(_1380);
    float _1390 = fma(_1382, _1254, _1254);
    float _1392 = fma(_1294, _1294, _1384);
    float _1394 = fma(_1198, _1382, _1198);
    float _1396 = _1094 + (-0.5);
    float _1398 = rsqrt(_1392);
    float _1400 = _132 + _136;
    float _1402 = float(_1388);
    float _1404 = fma(_1396, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1390);
    float _1406 = float(_1372);
    float _1408 = _1400 + (-1.0);
    float _1410 = fma(_1394, _1358, _1404);
    float _1412 = _1386 * 0.15915493667125701904296875;
    float _1414 = _1402 * _1406;
    float _1416 = fma(_1408, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1418 = in.m_61.x;
    float _1420 = in.m_61.y;
    float _1422 = in.m_61.z;
    float _1424 = _1414 * (-2.0);
    float _1426 = _1410 * 0.15915493667125701904296875;
    float _1428 = _1412 * 6.283185482025146484375;
    float _1430 = sin(_1428);
    float _1432 = _1362 * _1398;
    float _1434 = _1300 * _1398;
    float _1436 = in.m_63.x;
    float _1438 = in.m_63.y;
    float _1440 = in.m_63.z;
    float _1442 = fma(_1416, _1424, _1416);
    float _1444 = -_1432;
    float _1446 = fma(_1444, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1362);
    float _1448 = -_1434;
    float _1450 = fma(_1448, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1300);
    float _1452 = _1412 * 6.283185482025146484375;
    float _1454 = cos(_1452);
    float _1456 = _1446 * _1446;
    float _1458 = fma(_1424, _1250, _1250);
    float _1460 = _1294 * _1398;
    float _1462 = fma(_1450, _1450, _1456);
    float _1464 = _132 + (-0.5);
    float _1466 = -_1460;
    float _1468 = fma(_1466, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1294);
    float _1470 = _1426 * 6.283185482025146484375;
    float _1472 = cos(_1470);
    float _1474 = fma(_1464, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1458);
    float _1476 = fma(_1468, _1468, _1462);
    float _1478 = _262 * _262;
    float _1480 = fma(_1442, _1358, _1474);
    float _1482 = sqrt(_1476);
    float _1484 = _1480 * 0.15915493667125701904296875;
    float _1486 = -_1436;
    float _1488 = _1486 + _1418;
    float _1490 = -_1438;
    float _1492 = _1490 + _1420;
    float _1494 = -_1440;
    float _1496 = _1494 + _1422;
    float _1498 = fma(_1478, _1488, _1436);
    float _1500 = _1484 * 6.283185482025146484375;
    float _1502 = sin(_1500);
    float _1504 = fma(_1478, _1492, _1438);
    float _1506 = fma(_1478, _1496, _1440);
    float _1508 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1498);
    float _1510 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1504);
    float _1512 = _1430 * _1472;
    float _1514 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1506);
    float _1516 = _1484 * 6.283185482025146484375;
    float _1518 = cos(_1516);
    float _1520 = _1398 * _1482;
    float _1522 = _1288 * _1520;
    float _1524 = _1308 * _1520;
    float _1526 = _1326 * _1520;
    float _1528 = _1426 * 6.283185482025146484375;
    float _1530 = sin(_1528);
    float _1532 = _1522 * _1510;
    float _1534 = _1524 * _1508;
    float _1536 = _1502 * _1430;
    float _1538 = _1526 * _1514;
    float _1540 = _1472 * _1532;
    float _1542 = _1454 * _1472;
    float _1544 = _1518 * _1454;
    float _1546 = _1518 * _1430;
    float _1548 = _1518 * _1540;
    float _1550 = _1502 * _1454;
    float _1552 = fma(_1530, _1544, _1536);
    float _1554 = -_1532;
    float _1556 = _1530 * _1554;
    float _1558 = fma(_1552, _1534, _1548);
    float _1560 = -_1550;
    float _1562 = fma(_1530, _1546, _1560);
    float _1564 = -_1546;
    float _1566 = fma(_1530, _1550, _1564);
    float _1568 = _1502 * _1540;
    float _1570 = fma(_1542, _1534, _1556);
    float _1572 = fma(_1562, _1538, _1558);
    float _1574 = fma(_1530, _1536, _1544);
    float _1576 = fma(_1566, _1534, _1568);
    float _1578 = fma(_1512, _1538, _1570);
    float _1580 = _1572 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1582 = _1572 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1584 = fma(_1574, _1538, _1576);
    float _1586 = fma(_1578, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1580);
    float _1588 = fma(_1578, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1582);
    float _1590 = fma(_1584, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1586);
    float _1592 = fma(_1584, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1588);
    float _1594 = _1572 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1596 = _1276 + _1590;
    float _1598 = _1140 + _1592;
    float _1600 = fma(_1578, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1594);
    float _1602 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1604 = _1596 + _1602;
    float _1606 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1608 = _1598 + _1606;
    float _1610 = fma(_1584, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1600);
    float _1612 = _1604 * _1604;
    float _1614 = _1138 + _1610;
    float _1616 = fma(_1608, _1608, _1612);
    float _1618 = sqrt(_1616);
    bool _1620 = _1618 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1622 = _1572;
    float _1624 = _1584;
    float _1626 = _1612;
    float _1628 = _1618;
    float _1630 = _1578;
    float _1632 = _1604;
    float _1634 = _1596;
    if (!_1620)
    {
        _1622 = _1598;
    }
    float _1636 = _1622;
    float _1638 = _1636;
    if (!_1620)
    {
        _1624 = _1596;
    }
    float _1640 = _1624;
    float _1642 = _1640;
    if (!_1620)
    {
        _1626 = _1614;
    }
    float _1644 = _1626;
    bool _1646 = !_1620;
    float _1648 = _1644;
    if (!_1646)
    {
        float _1650 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1652 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1654 = _1618 + _1652;
        float _1656 = _1614 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1658 = _1654 * _1650;
        float _1660 = rsqrt(_1616);
        float _1662 = _1658 * 0.15915493667125701904296875;
        float _1664 = _1662 * 6.283185482025146484375;
        float _1666 = sin(_1664);
        float _1668 = _1662 * 6.283185482025146484375;
        float _1670 = cos(_1668);
        float _1672 = fma(_1666, _1656, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1674 = _1660 * _1672;
        float _1676 = _1670 + (-1.0);
        float _1678 = _1676 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1680 = fma(_1608, _1674, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1682 = fma(_1604, _1674, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1684 = fma(_1614, _1670, _1678);
        _1648 = _1684;
        _1638 = _1680;
        _1642 = _1682;
        _1628 = _1660;
        _1630 = _1662;
    }
    float _1686 = _1648;
    float _1688 = _1638;
    float _1690 = _1642;
    float _1692 = _1628;
    float _1694 = _1630;
    float _1696 = -_1432;
    float _1698 = fma(_1696, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1686);
    float _1700 = -_1434;
    float _1702 = fma(_1700, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1688);
    float _1704 = -_1460;
    float _1706 = fma(_1704, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1690);
    float _1708 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1710 = _1698 + _1708;
    float _1712 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1714 = _1702 + _1712;
    float _1716 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1718 = _1706 + _1716;
    float _1720 = _1710 * _1710;
    float _1722 = fma(_1714, _1714, _1720);
    float _1724 = fma(_1718, _1718, _1722);
    float _1726 = rsqrt(_1724);
    float _1728 = sqrt(_1724);
    float _1730 = _1726 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1732 = _1714 * _1730;
    float _1734 = _1718 * _1730;
    float _1736 = _1732 * _1732;
    float _1738 = _1734 * _1734;
    float _1740 = _1736 + _1738;
    float _1742 = sqrt(_1740);
    bool _1744 = _1742 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1746 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1748 = _1742 + _1746;
    float _1750 = _1726;
    float _1752 = _1694;
    float _1754 = _1748;
    if (_1744)
    {
        float _1756 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1750 = _1756;
    }
    float _1758 = _1750;
    if (_1744)
    {
        float _1760 = rsqrt(_1740);
        _1752 = _1760;
    }
    float _1762 = _1752;
    float _1764 = _1762;
    if (_1744)
    {
        float _1766 = _1748 * _1758;
        _1754 = _1766;
    }
    float _1768 = _1754;
    float _1770 = _1698 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_1744)
    {
        float _1772 = _1768 * 0.15915493667125701904296875;
        _1632 = _1772;
    }
    float _1774 = _1632;
    float _1776 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1770);
    float _1778 = _1718;
    if (_1744)
    {
        float _1780 = _1774 * 6.283185482025146484375;
        float _1782 = sin(_1780);
        _1778 = _1782;
    }
    float _1784 = _1778;
    float _1786 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1788 = precise::max(0.0, _1786);
    float _1790 = _1692;
    float _1792 = _1788;
    float _1794 = _1786;
    if (_1744)
    {
        float _1796 = _1774 * 6.283185482025146484375;
        float _1798 = cos(_1796);
        _1790 = _1798;
    }
    float _1800 = _1790;
    float _1802 = -_1730;
    float _1804 = -_1788;
    float _1806 = fma(_1710, _1802, _1804);
    float _1808 = _1806;
    if (_1744)
    {
        float _1810 = _1806 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1792 = _1810;
    }
    float _1812 = _1792;
    float _1814 = _1812;
    float _1816 = _1784;
    if (_1744)
    {
        float _1818 = fma(_1784, _1812, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1814 = _1818;
    }
    float _1820 = _1814;
    float _1822 = _1820;
    if (!_1744)
    {
        _1816 = _1732;
    }
    float _1824 = _1816;
    float _1826 = _1824;
    float _1828 = _1800;
    if (_1744)
    {
        float _1830 = _1800 + (-1.0);
        _1794 = _1830;
    }
    float _1832 = _1794;
    float _1834 = _1832;
    if (_1744)
    {
        float _1836 = _1762 * _1820;
        _1634 = _1836;
    }
    float _1838 = _1634;
    if (!_1744)
    {
        _1822 = _1736;
    }
    float _1840 = _1822;
    float _1842 = _1840;
    if (_1744)
    {
        float _1844 = _1832 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1764 = _1844;
    }
    float _1846 = _1764;
    if (_1744)
    {
        float _1848 = _1732 * _1838;
        _1826 = _1848;
    }
    float _1850 = _1826;
    if (!_1744)
    {
        _1834 = _1734;
    }
    float _1852 = _1834;
    float _1854 = _1852;
    if (_1744)
    {
        float _1856 = _1734 * _1838;
        _1854 = _1856;
    }
    float _1858 = _1854;
    if (_1744)
    {
        float _1860 = fma(_1806, _1800, _1846);
        _1808 = _1860;
    }
    float _1862 = _1808;
    if (_1744)
    {
        float _1864 = _1850 * _1850;
        _1842 = _1864;
    }
    float _1866 = _1842;
    if (!_1744)
    {
        _1828 = _1738;
    }
    float _1868 = _1828;
    float _1870 = _1868;
    if (_1744)
    {
        float _1872 = _1858 * _1858;
        _1870 = _1872;
    }
    float _1874 = _1870;
    float _1876 = fma(_1862, _1862, _1866);
    float _1878 = _1698 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1880 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1882 = _1876 + _1874;
    float _1884 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1878);
    float _1886 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1888 = fma(_1728, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1886);
    float _1890 = precise::clamp(_1888, 0.0, 1.0);
    float _1892 = _1698 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1894 = rsqrt(_1882);
    float _1896 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1884);
    float _1898 = -_1890;
    float _1900 = _1898 + 1.0;
    float _1902 = _1698 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1904 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1892);
    float _1906 = _1896 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1908 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1902);
    float _1910 = abs(_1900);
    float _1912 = log2(_1910);
    float _1914 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1904);
    float _1916 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1776);
    float _1918 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1908);
    float _1920 = _1906 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1922 = _1914 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1924 = _1916 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1926 = _1918 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1928 = _1894 * _1850;
    float _1930 = _1922 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1932 = _1894 * _1862;
    float _1934 = _1894 * _1858;
    float _1936 = _1928 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1938 = fma(_1926, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1930);
    float _1940 = -_1920;
    float _1942 = fma(_1940, _1880, 1.0);
    float _1944 = _1912 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1946 = -_1936;
    float _1948 = fma(_1932, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1946);
    float _1950 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1938);
    float _1952 = log2(_1942);
    float _1954 = -_1934;
    float _1956 = fma(_1954, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1948);
    float _1958 = fma(_1924, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1950);
    float _1960 = _1922 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1962 = fma(_1956, -0.5, 0.5);
    float _1964 = fma(_1956, 0.5, 0.5);
    float _1966 = exp2(_1944);
    float _1968 = _1922 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1970 = fma(_1926, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1960);
    float _1972 = _1932 + 1.0;
    float _1974 = fma(_1926, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1968);
    float _1976 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1970);
    float _1978 = fma(_1964, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1980 = 1.0 / _1958;
    float _1982 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1974);
    float _1984 = _1952 * 0.693147182464599609375;
    float _1986 = fma(_1964, _1978, -0.212114393711090087890625);
    float _1988 = _1984 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1990 = fma(_1964, _1986, 1.570728778839111328125);
    float _1992 = sqrt(_1962);
    float _1994 = -_1932;
    float _1996 = fma(_1966, _1972, _1994);
    float _1998 = fma(_1924, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1976);
    float _2000 = fma(_1924, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1982);
    float _2002 = fma(_1996, 0.5, 0.5);
    float _2004 = _1998 * _1980;
    float _2006 = _2000 * _1980;
    float _2008 = fma(_2004, 0.5, 0.5);
    float _2010 = fma(_2006, -0.5, 0.5);
    float _2012 = _1992 * 0.636619746685028076171875;
    float3 _5424 = float3(_2008, _2010, _1988);
    float _2014 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5424, float3(0.0), isnan(_5424)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5424, float3(0.0), isnan(_5424)), level(0.0)).x;
    float3 _5435 = float3(_2008, _2010, _1988);
    float4 _2017 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5435, float3(0.0), isnan(_5435)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5435, float3(0.0), isnan(_5435)), level(0.0)).xyzw;
    float _2019 = _2017.x;
    float _2021 = _2017.y;
    float _2023 = _2017.z;
    float _2025 = _2017.w;
    float _2027 = -_1990;
    float _2029 = fma(_2012, _2027, 1.0);
    float2 _5457 = float2(_2029, _2002);
    float3 _2033 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5457, float2(0.0), isnan(_5457)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5457, float2(0.0), isnan(_5457)), level(0.0)).xyz;
    float _2035 = _2033.x;
    float _2037 = _2033.y;
    float _2039 = _2033.z;
    float _2041 = in.m_65.y;
    float _2043 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2045 = in.m_51.w;
    bool _2047 = _136 > 0.5;
    float _2049 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _2051 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _2049;
    int _2053 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2055 = _2053 != 0;
    float _2057 = in.m_61.w;
    int _2059 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2061 = _2059 != 0;
    float _2063 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _2065 = _1092 + _2063;
    int _2067 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2069 = _2067 != 0;
    float _2071 = 1.0 / _2051;
    float _2073 = in.m_65.x;
    int _2075 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2077 = _2075 != 0;
    float _2079 = _1922 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2081 = fma(_1926, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2079);
    int _2083 = as_type<int>(_2043);
    if (_2055)
    {
        bool _2085 = _132 > 0.5;
        _1312 = _2085;
    }
    bool _2087 = _1312;
    float _2089 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2091 = -_2041;
    float _2093 = _2091 + 1.0;
    float _2095 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2081);
    float _2097 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _2099 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _2097;
    bool _2101 = _2045 > 0.5;
    float _2103 = _2065 * _2071;
    bool _2105 = _1092 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _2107 = isnan(_1092);
    bool _2109 = _2105 || _2107;
    bool _2111 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _2113 = _2109 || _2111;
    float _2115 = float(_2113);
    float _2117 = fma(_1924, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2095);
    int _2119 = _2101 ? as_type<int>(_2093) : as_type<int>(_2041);
    out.m_67.w = _2057;
    bool _2121 = _2101;
    float _2123 = _2099;
    float _2125 = _2041;
    if (_2061)
    {
        bool _2127 = _1094 > 0.5;
        _2121 = _2127;
    }
    bool _2129 = _2121;
    float _2131 = fma(_2099, _2103, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _2133 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _2135 = _2117 + _2133;
    bool _2137 = _1092 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _2139 = isnan(_1092);
    bool _2141 = _2137 || _2139;
    bool _2143 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _2145 = _2141 || _2143;
    float _2147 = float(_2145);
    float _2149 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _2151 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _2149;
    float _2153 = _2069 ? as_type<float>(_2119) : _2041;
    float _2155 = -_2147;
    float _2157 = _2155 + 1.0;
    if (!_2055)
    {
        _2123 = _2073;
    }
    float _2159 = _2123;
    float _2161 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _2163 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _2161;
    float _2165 = fma(_2151, _2103, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _2167 = _2115 * _2157;
    float _2169 = _2165;
    float _2171 = _2159;
    if (_2077)
    {
        float _2173 = _2047 ? _2093 : _2041;
        _2125 = _2173;
    }
    float _2175 = _2125;
    float _2177 = fma(_2163, _2103, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _2179 = _2043 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2181 = _2165 * _2167;
    float _2183 = _2131 * _2167;
    float _2185 = _2177 * _2167;
    int _2187 = as_type<int>(_2177);
    if (_2055)
    {
        float _2189 = -_2073;
        float _2191 = _2189 + 1.0;
        _2187 = as_type<int>(_2191);
    }
    int _2193 = _2187;
    float _2195 = fma(_2179, _2175, -0.5);
    float _2197 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (_2061)
    {
        float _2199 = -_2073;
        float _2201 = _2199 + 1.0;
        _2083 = as_type<int>(_2201);
    }
    int _2203 = _2083;
    if (!_2061)
    {
        _2169 = _2073;
    }
    float _2205 = _2169;
    float _2207 = -_1332;
    float _2209 = fma(_1272, _2195, _2207);
    float _2211 = _2205;
    if (_2055)
    {
        float _2213 = _2087 ? as_type<float>(_2193) : _2073;
        _2171 = _2213;
    }
    float _2215 = _2171;
    float _2217 = _2089 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_2061)
    {
        float _2219 = _2129 ? as_type<float>(_2203) : _2073;
        _2211 = _2219;
    }
    float _2221 = _2211;
    float _2223 = _2153 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2225 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2227 = fma(_2217, _2215, -0.5);
    float _2229 = _2209 + 0.5;
    float _2231 = _2221 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2233 = -_2115;
    float _2235 = _2233 + 1.0;
    float _2237 = fma(_1266, _2227, _1202);
    float _2239 = _1912 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.gl_Position.x = _1998;
    out.gl_Position.y = _2000;
    out.gl_Position.z = _2135;
    out.gl_Position.w = _1958;
    float _2241 = _2223 * _2197;
    float _2243 = _2237 + 0.5;
    float _2245 = fma(_2235, (*spvDescriptorSet0.vp_c9)._m0[123].x, _2181);
    float _2247 = fma(_2235, (*spvDescriptorSet0.vp_c9)._m0[123].y, _2183);
    float _2249 = exp2(_2239);
    float _2251 = fma(_2235, (*spvDescriptorSet0.vp_c9)._m0[123].z, _2185);
    float _2253 = fma(_2147, (*spvDescriptorSet0.vp_c9)._m0[124].x, _2245);
    float _2255 = fma(_2147, (*spvDescriptorSet0.vp_c9)._m0[124].y, _2247);
    float _2257 = _2231 * _2225;
    float _2259 = _1998 + _1958;
    float _2261 = fma(_2147, (*spvDescriptorSet0.vp_c9)._m0[124].z, _2251);
    float _2263 = _1958 + _2135;
    float _2265 = _2253 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    out.m_69.x = _2243;
    out.m_69.y = _2229;
    out.m_69.z = _2257;
    out.m_69.w = _2241;
    float _2267 = _2255 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2269 = _2261 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2271 = _2265 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2273 = _2267 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2275 = _2269 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2277 = -_2249;
    float _2279 = _2277 + 1.0;
    out.m_71.x = _2271;
    out.m_71.y = _2273;
    out.m_71.z = _2275;
    float _2281 = _2259 * 0.5;
    float _2283 = _2279 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2285 = _1958 * 0.5;
    float _2287 = fma(_2000, -0.5, _2285);
    float _2289 = _2263 * 0.5;
    out.m_73.x = _2281;
    out.m_73.y = _2287;
    out.m_73.z = _2289;
    out.m_73.w = _1958;
    float _2291 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_49.x = _2291;
    float _2293 = _2283 * _2014;
    float _2295 = _2025 * _2293;
    float _2297 = _2039 * _2293;
    float _2299 = -_2283;
    float _2301 = _2299 + 1.0;
    float _2303 = fma(_2035, _2295, _2019);
    float _2305 = fma(_2037, _2295, _2021);
    float _2307 = _2025 * _2301;
    float _2309 = fma(_2025, _2297, _2023);
    out.m_75.x = _2303;
    out.m_75.y = _2305;
    out.m_75.z = _2309;
    out.m_75.w = _2307;
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
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1090 = false;
    bool _842 = false;
    bool _616 = false;
    bool _294 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_42.w;
    float _91 = in.m_44.w;
    float _93 = trunc(_89);
    int _96 = int(_93);
    float _98 = -_91;
    float _100 = _98 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_47.y = _100;
    bool _104 = _96 >= 1;
    float _106 = 0.0;
    float _108 = as_type<float>(_96);
    float _110 = _100;
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _106;
    if (!_104)
    {
        out.m_49.x = 0.0;
    }
    int _114 = 0;
    if (!_104)
    {
        float _116 = _112 * 5.0;
        _114 = as_type<int>(_116);
    }
    int _118 = _114;
    int _120 = _118;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2378 = as_type<float>(_118);
        out.gl_Position.z = _2378;
    }
    if (!_104)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _122 = _91 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _124 = isnan(_91);
    bool _126 = _122 || _124;
    bool _128 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _130 = _126 || _128;
    float _132 = in.m_51.x;
    float _134 = float(_96);
    float _136 = in.m_51.y;
    bool _138 = _100 >= _134;
    bool _140 = !_130;
    bool _142 = _138 || _140;
    if (_142)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _144 = _108;
    if (_142)
    {
        out.m_49.x = 0.0;
    }
    if (_142)
    {
        float _146 = _144 * 5.0;
        _120 = as_type<int>(_146);
    }
    int _148 = _120;
    out.m_53.x = _132;
    out.m_53.y = _136;
    if (_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2441 = as_type<float>(_148);
        out.gl_Position.z = _2441;
    }
    if (_142)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _150 = in.m_55.w;
    float _152 = 1.0 / _134;
    float _154 = _100 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _156 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _158 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _160 = _156 || _158;
    bool _162 = isnan(1.0);
    bool _164 = _160 || _162;
    float _166 = in.m_44.x;
    float _168 = in.m_44.y;
    float _170 = in.m_44.z;
    float _172 = in.m_42.x;
    float _174 = in.m_42.y;
    float _176 = in.m_42.z;
    float _178 = 0.0;
    float _180 = _154;
    if (!_164)
    {
        float _182 = _154 * _154;
        float _184 = _182 * 0.5;
        _178 = _184;
    }
    float _186 = _178;
    float _188 = _186;
    if (!_164)
    {
        float _190 = _186 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _188 = _190;
    }
    float _192 = _188;
    bool _194 = !_164;
    float _196 = _192;
    if (!_194)
    {
        float _198 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _200 = log2(_198);
        float _202 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _204 = _202 + 1.0;
        float _206 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _208 = _154 * _200;
        float _210 = 1.0 / _204;
        float _212 = _206 * 0.693147182464599609375;
        float _214 = exp2(_208);
        float _216 = 1.0 / _212;
        float _218 = _214 + (-1.0);
        float _220 = -_218;
        float _222 = fma(_220, _216, _154);
        float _224 = _222 * _210;
        float _226 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _196 = _226;
    }
    float _228 = _196;
    bool _230 = !_164;
    if (!_230)
    {
        float _232 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _234 = log2(_232);
        float _236 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _238 = _236 + 1.0;
        float _240 = 1.0 / _238;
        float _242 = _154 * _234;
        float _244 = exp2(_242);
        float _246 = -_244;
        float _248 = _246 + 1.0;
        float _250 = _248 * _240;
        _180 = _250;
    }
    float _252 = _180;
    bool _254 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _256 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _258 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _260 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _262 = _100 * _152;
    float _264 = fma(_252, _166, _256);
    float _266 = fma(_252, _168, _258);
    float _268 = fma(_252, _170, _260);
    float _270 = fma(_264, _150, _172);
    float _272 = fma(_266, _150, _174);
    float _274 = fma(_268, _150, _176);
    bool _276 = !_254;
    float _292;
    if (!_276)
    {
        float _278 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _280 = _132 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _282 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[12].x, _100);
        float _284 = _282 * _278;
        float _286 = floor(_284);
        float _288 = -_286;
        float _290 = _284 + _288;
        _292 = _290;
        _294 = true;
    }
    else
    {
        _292 = _262;
    }
    _294 = false;
    float _296 = _292;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _300 = _296 + _298;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _304 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _302;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _308 = _306 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _312 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _310;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _316 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _314;
    float _318 = 1.0 / _308;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _322 = _320 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _324 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _326 = isnan(_296);
    bool _328 = _324 || _326;
    bool _330 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _332 = _328 || _330;
    float _334 = float(_332);
    float _336 = 1.0 / _304;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _340 = _296 + _338;
    bool _342 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _344 = isnan(_296);
    bool _346 = _342 || _344;
    bool _348 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _350 = _346 || _348;
    float _352 = float(_350);
    float _354 = 1.0 / _322;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _358 = _296 + _356;
    float _360 = _300 * _318;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _364 = _296 + _362;
    bool _366 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _368 = isnan(_296);
    bool _370 = _366 || _368;
    bool _372 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _374 = _370 || _372;
    float _376 = float(_374);
    bool _378 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _380 = 1.0 / _312;
    float _382 = _358 * _336;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _386 = _296 + _384;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _388;
    float _392 = -_376;
    float _394 = _392 + 1.0;
    float _396 = fma(_390, _382, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _398 = 1.0 / _316;
    float _400 = _340 * _354;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _402;
    float _406 = fma(_404, _382, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _408 = _364 * _380;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _410;
    bool _414 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _416 = isnan(_296);
    bool _418 = _414 || _416;
    bool _420 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _422 = _418 || _420;
    float _424 = float(_422);
    float _426 = fma(_412, _382, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _428 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _430 = isnan(_296);
    bool _432 = _428 || _430;
    bool _434 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _436 = _432 || _434;
    float _438 = float(_436);
    float _440 = _386 * _398;
    bool _442 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _444 = isnan(_296);
    bool _446 = _442 || _444;
    bool _448 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _450 = _446 || _448;
    float _452 = float(_450);
    float _454 = -_424;
    float _456 = _454 + 1.0;
    float _458 = _438 * _394;
    float _460 = -_438;
    float _462 = _460 + 1.0;
    float _464 = -_452;
    float _466 = _464 + 1.0;
    float _468 = _352 * _462;
    float _470 = _424 * _466;
    float _472 = _334 * _456;
    float _474 = -_334;
    float _476 = _474 + 1.0;
    float _478 = _426 * _468;
    float _480 = _406 * _468;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _484 = _482 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _486 = _376 * _476;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _490 = _488 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _496 = _396 * _468;
    float _498 = -_352;
    float _500 = _498 + 1.0;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _502;
    float _506 = fma(_490, _360, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _510 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _508;
    float _512 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[143].x, _478);
    float _514 = fma(_504, _440, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _516 = fma(_494, _360, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _518 = fma(_484, _360, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _520 = fma(_510, _440, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _524 = _522 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _526 = fma(_506, _458, _512);
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _528;
    float _532 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[143].y, _496);
    float _534 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[143].z, _480);
    float _536 = fma(_524, _400, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _538 = fma(_520, _486, _526);
    float _540 = fma(_530, _440, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _542 = fma(_516, _458, _532);
    float _544 = fma(_518, _458, _534);
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _548 = _546 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _552 = _550 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _554 = fma(_540, _486, _542);
    float _556 = fma(_548, _400, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _558;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _562;
    float _566 = fma(_552, _400, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _568 = fma(_514, _486, _544);
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _570;
    float _574 = fma(_536, _472, _538);
    float _576 = fma(_560, _408, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _578 = fma(_564, _408, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _580 = fma(_556, _472, _554);
    float _582 = fma(_572, _408, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _584 = fma(_566, _472, _568);
    float _586 = fma(_576, _470, _574);
    float _588 = fma(_578, _470, _580);
    float _590 = fma(_582, _470, _584);
    float _592 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[148].x, _586);
    float _594 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[148].y, _588);
    float _596 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[148].z, _590);
    bool _598 = !_378;
    float _614;
    if (!_598)
    {
        float _600 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _602 = _132 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _604 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[11].x, _100);
        float _606 = _604 * _600;
        float _608 = floor(_606);
        float _610 = -_608;
        float _612 = _606 + _610;
        _614 = _612;
        _616 = true;
    }
    else
    {
        _614 = _262;
    }
    _616 = false;
    float _618 = _614;
    float _620 = in.m_55.x;
    float _622 = in.m_55.y;
    float _624 = in.m_55.z;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _628 = _618 + _626;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _632 = _618 + _630;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _636 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _634;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _640 = _638 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _644 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _642;
    float _646 = 1.0 / _636;
    bool _648 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _650 = 1.0 / _644;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _652;
    float _656 = _596 * _624;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _660 = _618 + _658;
    float _662 = 1.0 / _640;
    float _664 = _594 * _622;
    float _666 = _660 * _646;
    bool _668 = _618 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _670 = isnan(_618);
    bool _672 = _668 || _670;
    bool _674 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _676 = _672 || _674;
    float _678 = float(_676);
    float _680 = fma(_654, _666, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _682 = _628 * _650;
    bool _684 = _618 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _686 = isnan(_618);
    bool _688 = _684 || _686;
    bool _690 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _692 = _688 || _690;
    float _694 = float(_692);
    float _696 = -_678;
    float _698 = _696 + 1.0;
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _702 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _700;
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _706 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _704;
    float _708 = _694 * _698;
    bool _710 = _618 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _712 = isnan(_618);
    bool _714 = _710 || _712;
    bool _716 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _718 = _714 || _716;
    float _720 = float(_718);
    float _722 = _632 * _662;
    bool _724 = _618 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _726 = isnan(_618);
    bool _728 = _724 || _726;
    bool _730 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _732 = _728 || _730;
    float _734 = float(_732);
    float _736 = -_694;
    float _738 = _736 + 1.0;
    float _740 = fma(_702, _666, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _742 = fma(_706, _666, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _746 = _744 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _748 = -_734;
    float _750 = _748 + 1.0;
    float _752 = _734 * _738;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _756 = _754 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _760 = _758 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _762 = _720 * _750;
    float _764 = -_720;
    float _766 = _764 + 1.0;
    float _768 = fma(_746, _722, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _770 = _740 * _762;
    float _772 = _680 * _762;
    float _774 = _742 * _762;
    float _776 = fma(_766, (*spvDescriptorSet0.vp_c9)._m0[107].x, _770);
    float _778 = fma(_766, (*spvDescriptorSet0.vp_c9)._m0[107].y, _772);
    float _780 = fma(_756, _722, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _784 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _782;
    float _786 = fma(_760, _722, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _790 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _788;
    float _792 = fma(_766, (*spvDescriptorSet0.vp_c9)._m0[107].z, _774);
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _796 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _794;
    float _798 = fma(_768, _752, _776);
    float _800 = fma(_784, _682, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _802 = fma(_790, _682, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _804 = fma(_780, _752, _778);
    float _806 = fma(_796, _682, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _808 = fma(_786, _752, _792);
    float _810 = fma(_800, _708, _798);
    float _812 = fma(_802, _708, _804);
    float _814 = _592 * _620;
    float _816 = fma(_806, _708, _808);
    float _818 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[110].x, _810);
    float _820 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[110].y, _812);
    float _822 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[110].z, _816);
    bool _824 = !_648;
    float _840;
    if (!_824)
    {
        float _826 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _828 = _132 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _830 = fma(_828, (*spvDescriptorSet0.vp_c9)._m0[11].y, _100);
        float _832 = _830 * _826;
        float _834 = floor(_832);
        float _836 = -_834;
        float _838 = _832 + _836;
        _840 = _838;
        _842 = true;
    }
    else
    {
        _840 = _262;
    }
    _842 = false;
    float _844 = _840;
    float _846 = _818 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _848 = _820 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _852 = _850 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _854 = _844 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _856 = isnan(_844);
    bool _858 = _854 || _856;
    bool _860 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _862 = _858 || _860;
    float _864 = float(_862);
    float _866 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _868 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _866;
    bool _870 = _844 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _872 = isnan(_844);
    bool _874 = _870 || _872;
    bool _876 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _878 = _874 || _876;
    float _880 = float(_878);
    float _882 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _884 = _882 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _886 = _844 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _888 = isnan(_844);
    bool _890 = _886 || _888;
    bool _892 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _894 = _890 || _892;
    float _896 = float(_894);
    float _898 = 1.0 / _852;
    float _900 = -_864;
    float _902 = _900 + 1.0;
    float _904 = -_880;
    float _906 = _904 + 1.0;
    bool _908 = _844 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _910 = isnan(_844);
    bool _912 = _908 || _910;
    bool _914 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _916 = _912 || _914;
    float _918 = float(_916);
    float _920 = _822 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _922 = 1.0 / _884;
    bool _924 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _926 = _868 * _898;
    float _928 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _930 = _928 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _932 = _896 * _906;
    float _934 = -_918;
    float _936 = _934 + 1.0;
    float _938 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _940 = _938 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _942 = _880 * _902;
    float _944 = -_896;
    float _946 = _944 + 1.0;
    bool _948 = _844 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _950 = isnan(_844);
    bool _952 = _948 || _950;
    bool _954 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _956 = _952 || _954;
    float _958 = float(_956);
    float _960 = 1.0 / _940;
    float _962 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _964 = _844 + _962;
    float _966 = _918 * _946;
    float _968 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _970 = _968 + (*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _972 = _958 * _936;
    float _974 = fma(_926, _964, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _976 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _978 = _844 + _976;
    float _980 = -_958;
    float _982 = _980 + 1.0;
    float _984 = 1.0 / _930;
    float _986 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _988 = _986 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _990 = _974 * _972;
    float _992 = _988 * _922;
    float _994 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _996 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _994;
    float _998 = 1.0 / _970;
    float _1000 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _1002 = _1000 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1004 = fma(_992, _978, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1006 = _996 * _960;
    float _1008 = fma(_982, (*spvDescriptorSet0.vp_c9)._m0[115].x, _990);
    float _1010 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1012 = _844 + _1010;
    bool _1014 = _844 >= (*spvDescriptorSet0.vp_c9)._m0[120].w;
    bool _1016 = isnan(_844);
    bool _1018 = _1014 || _1016;
    bool _1020 = isnan((*spvDescriptorSet0.vp_c9)._m0[120].w);
    bool _1022 = _1018 || _1020;
    float _1024 = float(_1022);
    float _1026 = _1002 * _984;
    float _1028 = -(*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1030 = (*spvDescriptorSet0.vp_c9)._m0[120].x + _1028;
    float _1032 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1034 = _844 + _1032;
    float _1036 = fma(_1006, _1012, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1038 = fma(_1004, _966, _1008);
    float _1040 = -_1024;
    float _1042 = _1040 + 1.0;
    float _1044 = fma(_1026, _1034, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1046 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1048 = _844 + _1046;
    float _1050 = _1030 * _998;
    float _1052 = fma(_1036, _932, _1038);
    float _1054 = _864 * _1042;
    float _1056 = _846 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1058 = fma(_1050, _1048, (*spvDescriptorSet0.vp_c9)._m0[119].x);
    float _1060 = fma(_1044, _942, _1052);
    float _1062 = _848 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1064 = _920 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1066 = fma(_1058, _1054, _1060);
    float _1068 = fma(_1024, (*spvDescriptorSet0.vp_c9)._m0[120].x, _1066);
    float _1070 = _1068 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _1056;
    out.m_57.y = _1062;
    out.m_57.z = _1064;
    out.m_57.w = _1070;
    bool _1072 = !_924;
    float _1088;
    if (!_1072)
    {
        float _1074 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1076 = _132 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1078 = fma(_1076, (*spvDescriptorSet0.vp_c9)._m0[11].z, _100);
        float _1080 = _1078 * _1074;
        float _1082 = floor(_1080);
        float _1084 = -_1082;
        float _1086 = _1080 + _1084;
        _1088 = _1086;
        _1090 = true;
    }
    else
    {
        _1088 = _262;
    }
    _1090 = false;
    float _1092 = _1088;
    float _1094 = in.m_51.z;
    float _1096 = _272 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1098 = _272 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1100 = _272 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1102 = _136 * 2.0;
    float _1104 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1096);
    float _1106 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1098);
    float _1108 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1100);
    float _1110 = _132 * 2.0;
    float _1112 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1104);
    float _1114 = floor(_1102);
    float _1116 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1106);
    float _1118 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1108);
    float _1120 = _136 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1122 = _132 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1124 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1126 = _1124 != 0;
    int _1128 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1130 = _1128 != 0;
    int _1132 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1134 = _1132 != 0;
    float _1136 = floor(_1110);
    float _1138 = _1116 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1140 = _1112 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1142 = _1094 * 2.0;
    float _1144 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1146 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1148 = log2(_1146);
    float _1150 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1152 = _136 + _1094;
    bool _1154 = _1114 > 0.0;
    float _1156 = -_1144;
    float _1158 = fma(_1122, 2.0, _1156);
    float _1160 = fma(_1120, -2.0, _1150);
    float _1162 = _1152 + (-1.0);
    float _1164 = floor(_1142);
    bool _1166 = _1136 > 0.0;
    float _1168 = _132 + _1094;
    bool _1170 = _1136 >= 0.0;
    bool _1172 = isnan(_1136);
    bool _1174 = _1170 || _1172;
    bool _1176 = isnan(0.0);
    bool _1178 = _1174 || _1176;
    float _1180 = fma(_1162, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1182 = _1168 + (-1.0);
    int _1184 = _1178 ? 0 : 1;
    float _1186 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1188 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1190 = 1.0 + _1188;
    int _1192 = ~_1184;
    int _1194 = _1192 + 1;
    int _1196 = _1194 + 1;
    float _1198 = fma(_1182, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1200 = -_100;
    float _1202 = fma(_1200, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1158);
    int _1204 = _1196;
    if (!_1166)
    {
        int _1206 = ~_1184;
        int _1208 = _1206 + 1;
        _1204 = _1208;
    }
    int _1210 = _1204;
    float _1212 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1214 = _1164 >= 0.0;
    bool _1216 = isnan(_1164);
    bool _1218 = _1214 || _1216;
    bool _1220 = isnan(0.0);
    bool _1222 = _1218 || _1220;
    float _1224 = 1.0 / _1190;
    bool _1226 = _1164 > 0.0;
    float _1228 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1186);
    int _1230 = _1222 ? 0 : 1;
    float _1232 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1212);
    bool _1234 = _1114 >= 0.0;
    bool _1236 = isnan(_1114);
    bool _1238 = _1234 || _1236;
    bool _1240 = isnan(0.0);
    bool _1242 = _1238 || _1240;
    float _1244 = _1148 * _100;
    bool _1246 = !_1130;
    int _1248 = _1246 ? 0 : 1;
    float _1250 = in.m_59.x;
    float _1252 = in.m_59.y;
    float _1254 = in.m_59.z;
    bool _1256 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1258 = isnan(1.0);
    bool _1260 = _1256 || _1258;
    bool _1262 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1264 = _1260 || _1262;
    float _1266 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1228);
    int _1268 = abs(_1248);
    float _1270 = exp2(_1244);
    float _1272 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1232);
    int _1274 = _1242 ? 0 : 1;
    float _1276 = _1118 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1278 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1280 = isnan(0.0);
    bool _1282 = _1278 || _1280;
    bool _1284 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1286 = _1282 || _1284;
    float _1288 = _664 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1290 = float(_1268);
    float _1292 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1294 = _1276 + _1292;
    float _1296 = float(_1210);
    float _1298 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1300 = _1140 + _1298;
    int _1302 = ~_1274;
    int _1304 = _1302 + 1;
    int _1306 = _1304 + 1;
    float _1308 = _814 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1310 = _1306;
    bool _1312 = _1264;
    if (!_1154)
    {
        int _1314 = ~_1274;
        int _1316 = _1314 + 1;
        _1310 = _1316;
    }
    int _1318 = _1310;
    float _1320 = _1290 * _1296;
    bool _1322 = !_1134;
    int _1324 = _1322 ? 0 : 1;
    float _1326 = _656 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1328 = -_1270;
    float _1330 = _1328 + 1.0;
    float _1332 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1160);
    int _1334 = abs(_1324);
    float _1336 = _1320 * (-2.0);
    float _1338 = float(_1318);
    float _1340 = _1286 ? _1330 : 0.0;
    float _1342 = fma(_1336, _1252, _1252);
    float _1344 = float(_1334);
    float _1346 = fma(_1180, _1336, _1180);
    int _1348 = ~_1230;
    int _1350 = _1348 + 1;
    int _1352 = _1350 + 1;
    int _1354 = _1352;
    if (_1264)
    {
        float _1356 = _1340 * _1224;
        _110 = _1356;
    }
    float _1358 = _110;
    float _1360 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1362 = _1138 + _1360;
    float _1364 = _136 + (-0.5);
    float _1366 = _1344 * _1338;
    if (!_1226)
    {
        int _1368 = ~_1230;
        int _1370 = _1368 + 1;
        _1354 = _1370;
    }
    int _1372 = _1354;
    float _1374 = _1362 * _1362;
    float _1376 = fma(_1364, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1342);
    bool _1378 = !_1126;
    int _1380 = _1378 ? 0 : 1;
    float _1382 = _1366 * (-2.0);
    float _1384 = fma(_1300, _1300, _1374);
    float _1386 = fma(_1346, _1358, _1376);
    int _1388 = abs(_1380);
    float _1390 = fma(_1382, _1254, _1254);
    float _1392 = fma(_1294, _1294, _1384);
    float _1394 = fma(_1198, _1382, _1198);
    float _1396 = _1094 + (-0.5);
    float _1398 = rsqrt(_1392);
    float _1400 = _132 + _136;
    float _1402 = float(_1388);
    float _1404 = fma(_1396, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1390);
    float _1406 = float(_1372);
    float _1408 = _1400 + (-1.0);
    float _1410 = fma(_1394, _1358, _1404);
    float _1412 = _1386 * 0.15915493667125701904296875;
    float _1414 = _1402 * _1406;
    float _1416 = fma(_1408, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1418 = in.m_61.x;
    float _1420 = in.m_61.y;
    float _1422 = in.m_61.z;
    float _1424 = _1414 * (-2.0);
    float _1426 = _1410 * 0.15915493667125701904296875;
    float _1428 = _1412 * 6.283185482025146484375;
    float _1430 = sin(_1428);
    float _1432 = _1362 * _1398;
    float _1434 = _1300 * _1398;
    float _1436 = in.m_63.x;
    float _1438 = in.m_63.y;
    float _1440 = in.m_63.z;
    float _1442 = fma(_1416, _1424, _1416);
    float _1444 = -_1432;
    float _1446 = fma(_1444, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1362);
    float _1448 = -_1434;
    float _1450 = fma(_1448, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1300);
    float _1452 = _1412 * 6.283185482025146484375;
    float _1454 = cos(_1452);
    float _1456 = _1446 * _1446;
    float _1458 = fma(_1424, _1250, _1250);
    float _1460 = _1294 * _1398;
    float _1462 = fma(_1450, _1450, _1456);
    float _1464 = _132 + (-0.5);
    float _1466 = -_1460;
    float _1468 = fma(_1466, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1294);
    float _1470 = _1426 * 6.283185482025146484375;
    float _1472 = cos(_1470);
    float _1474 = fma(_1464, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1458);
    float _1476 = fma(_1468, _1468, _1462);
    float _1478 = _262 * _262;
    float _1480 = fma(_1442, _1358, _1474);
    float _1482 = sqrt(_1476);
    float _1484 = _1480 * 0.15915493667125701904296875;
    float _1486 = -_1436;
    float _1488 = _1486 + _1418;
    float _1490 = -_1438;
    float _1492 = _1490 + _1420;
    float _1494 = -_1440;
    float _1496 = _1494 + _1422;
    float _1498 = fma(_1478, _1488, _1436);
    float _1500 = _1484 * 6.283185482025146484375;
    float _1502 = sin(_1500);
    float _1504 = fma(_1478, _1492, _1438);
    float _1506 = fma(_1478, _1496, _1440);
    float _1508 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1498);
    float _1510 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1504);
    float _1512 = _1430 * _1472;
    float _1514 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1506);
    float _1516 = _1484 * 6.283185482025146484375;
    float _1518 = cos(_1516);
    float _1520 = _1398 * _1482;
    float _1522 = _1288 * _1520;
    float _1524 = _1308 * _1520;
    float _1526 = _1326 * _1520;
    float _1528 = _1426 * 6.283185482025146484375;
    float _1530 = sin(_1528);
    float _1532 = _1522 * _1510;
    float _1534 = _1524 * _1508;
    float _1536 = _1502 * _1430;
    float _1538 = _1526 * _1514;
    float _1540 = _1472 * _1532;
    float _1542 = _1454 * _1472;
    float _1544 = _1518 * _1454;
    float _1546 = _1518 * _1430;
    float _1548 = _1518 * _1540;
    float _1550 = _1502 * _1454;
    float _1552 = fma(_1530, _1544, _1536);
    float _1554 = -_1532;
    float _1556 = _1530 * _1554;
    float _1558 = fma(_1552, _1534, _1548);
    float _1560 = -_1550;
    float _1562 = fma(_1530, _1546, _1560);
    float _1564 = -_1546;
    float _1566 = fma(_1530, _1550, _1564);
    float _1568 = _1502 * _1540;
    float _1570 = fma(_1542, _1534, _1556);
    float _1572 = fma(_1562, _1538, _1558);
    float _1574 = fma(_1530, _1536, _1544);
    float _1576 = fma(_1566, _1534, _1568);
    float _1578 = fma(_1512, _1538, _1570);
    float _1580 = _1572 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1582 = _1572 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1584 = fma(_1574, _1538, _1576);
    float _1586 = fma(_1578, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1580);
    float _1588 = fma(_1578, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1582);
    float _1590 = fma(_1584, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1586);
    float _1592 = fma(_1584, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1588);
    float _1594 = _1572 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1596 = _1276 + _1590;
    float _1598 = _1140 + _1592;
    float _1600 = fma(_1578, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1594);
    float _1602 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1604 = _1596 + _1602;
    float _1606 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1608 = _1598 + _1606;
    float _1610 = fma(_1584, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1600);
    float _1612 = _1604 * _1604;
    float _1614 = _1138 + _1610;
    float _1616 = fma(_1608, _1608, _1612);
    float _1618 = sqrt(_1616);
    bool _1620 = _1618 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1622 = _1572;
    float _1624 = _1584;
    float _1626 = _1612;
    float _1628 = _1618;
    float _1630 = _1578;
    float _1632 = _1604;
    float _1634 = _1596;
    if (!_1620)
    {
        _1622 = _1598;
    }
    float _1636 = _1622;
    float _1638 = _1636;
    if (!_1620)
    {
        _1624 = _1596;
    }
    float _1640 = _1624;
    float _1642 = _1640;
    if (!_1620)
    {
        _1626 = _1614;
    }
    float _1644 = _1626;
    bool _1646 = !_1620;
    float _1648 = _1644;
    if (!_1646)
    {
        float _1650 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1652 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1654 = _1618 + _1652;
        float _1656 = _1614 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1658 = _1654 * _1650;
        float _1660 = rsqrt(_1616);
        float _1662 = _1658 * 0.15915493667125701904296875;
        float _1664 = _1662 * 6.283185482025146484375;
        float _1666 = sin(_1664);
        float _1668 = _1662 * 6.283185482025146484375;
        float _1670 = cos(_1668);
        float _1672 = fma(_1666, _1656, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1674 = _1660 * _1672;
        float _1676 = _1670 + (-1.0);
        float _1678 = _1676 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1680 = fma(_1608, _1674, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1682 = fma(_1604, _1674, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1684 = fma(_1614, _1670, _1678);
        _1648 = _1684;
        _1638 = _1680;
        _1642 = _1682;
        _1628 = _1660;
        _1630 = _1662;
    }
    float _1686 = _1648;
    float _1688 = _1638;
    float _1690 = _1642;
    float _1692 = _1628;
    float _1694 = _1630;
    float _1696 = -_1432;
    float _1698 = fma(_1696, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1686);
    float _1700 = -_1434;
    float _1702 = fma(_1700, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1688);
    float _1704 = -_1460;
    float _1706 = fma(_1704, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1690);
    float _1708 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1710 = _1698 + _1708;
    float _1712 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1714 = _1702 + _1712;
    float _1716 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1718 = _1706 + _1716;
    float _1720 = _1710 * _1710;
    float _1722 = fma(_1714, _1714, _1720);
    float _1724 = fma(_1718, _1718, _1722);
    float _1726 = rsqrt(_1724);
    float _1728 = sqrt(_1724);
    float _1730 = _1726 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1732 = _1714 * _1730;
    float _1734 = _1718 * _1730;
    float _1736 = _1732 * _1732;
    float _1738 = _1734 * _1734;
    float _1740 = _1736 + _1738;
    float _1742 = sqrt(_1740);
    bool _1744 = _1742 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1746 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1748 = _1742 + _1746;
    float _1750 = _1726;
    float _1752 = _1694;
    float _1754 = _1748;
    if (_1744)
    {
        float _1756 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1750 = _1756;
    }
    float _1758 = _1750;
    if (_1744)
    {
        float _1760 = rsqrt(_1740);
        _1752 = _1760;
    }
    float _1762 = _1752;
    float _1764 = _1762;
    if (_1744)
    {
        float _1766 = _1748 * _1758;
        _1754 = _1766;
    }
    float _1768 = _1754;
    float _1770 = _1698 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_1744)
    {
        float _1772 = _1768 * 0.15915493667125701904296875;
        _1632 = _1772;
    }
    float _1774 = _1632;
    float _1776 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1770);
    float _1778 = _1718;
    if (_1744)
    {
        float _1780 = _1774 * 6.283185482025146484375;
        float _1782 = sin(_1780);
        _1778 = _1782;
    }
    float _1784 = _1778;
    float _1786 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1788 = precise::max(0.0, _1786);
    float _1790 = _1692;
    float _1792 = _1788;
    float _1794 = _1786;
    if (_1744)
    {
        float _1796 = _1774 * 6.283185482025146484375;
        float _1798 = cos(_1796);
        _1790 = _1798;
    }
    float _1800 = _1790;
    float _1802 = -_1730;
    float _1804 = -_1788;
    float _1806 = fma(_1710, _1802, _1804);
    float _1808 = _1806;
    if (_1744)
    {
        float _1810 = _1806 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1792 = _1810;
    }
    float _1812 = _1792;
    float _1814 = _1812;
    float _1816 = _1784;
    if (_1744)
    {
        float _1818 = fma(_1784, _1812, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1814 = _1818;
    }
    float _1820 = _1814;
    float _1822 = _1820;
    if (!_1744)
    {
        _1816 = _1732;
    }
    float _1824 = _1816;
    float _1826 = _1824;
    float _1828 = _1800;
    if (_1744)
    {
        float _1830 = _1800 + (-1.0);
        _1794 = _1830;
    }
    float _1832 = _1794;
    float _1834 = _1832;
    if (_1744)
    {
        float _1836 = _1762 * _1820;
        _1634 = _1836;
    }
    float _1838 = _1634;
    if (!_1744)
    {
        _1822 = _1736;
    }
    float _1840 = _1822;
    float _1842 = _1840;
    if (_1744)
    {
        float _1844 = _1832 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1764 = _1844;
    }
    float _1846 = _1764;
    if (_1744)
    {
        float _1848 = _1732 * _1838;
        _1826 = _1848;
    }
    float _1850 = _1826;
    if (!_1744)
    {
        _1834 = _1734;
    }
    float _1852 = _1834;
    float _1854 = _1852;
    if (_1744)
    {
        float _1856 = _1734 * _1838;
        _1854 = _1856;
    }
    float _1858 = _1854;
    if (_1744)
    {
        float _1860 = fma(_1806, _1800, _1846);
        _1808 = _1860;
    }
    float _1862 = _1808;
    if (_1744)
    {
        float _1864 = _1850 * _1850;
        _1842 = _1864;
    }
    float _1866 = _1842;
    if (!_1744)
    {
        _1828 = _1738;
    }
    float _1868 = _1828;
    float _1870 = _1868;
    if (_1744)
    {
        float _1872 = _1858 * _1858;
        _1870 = _1872;
    }
    float _1874 = _1870;
    float _1876 = fma(_1862, _1862, _1866);
    float _1878 = _1698 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1880 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1882 = _1876 + _1874;
    float _1884 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1878);
    float _1886 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1888 = fma(_1728, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1886);
    float _1890 = precise::clamp(_1888, 0.0, 1.0);
    float _1892 = _1698 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1894 = rsqrt(_1882);
    float _1896 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1884);
    float _1898 = -_1890;
    float _1900 = _1898 + 1.0;
    float _1902 = _1698 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1904 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1892);
    float _1906 = _1896 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1908 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1902);
    float _1910 = abs(_1900);
    float _1912 = log2(_1910);
    float _1914 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1904);
    float _1916 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1776);
    float _1918 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1908);
    float _1920 = _1906 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1922 = _1914 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1924 = _1916 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1926 = _1918 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1928 = _1894 * _1850;
    float _1930 = _1922 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1932 = _1894 * _1862;
    float _1934 = _1894 * _1858;
    float _1936 = _1928 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1938 = fma(_1926, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1930);
    float _1940 = -_1920;
    float _1942 = fma(_1940, _1880, 1.0);
    float _1944 = _1912 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1946 = -_1936;
    float _1948 = fma(_1932, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1946);
    float _1950 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1938);
    float _1952 = log2(_1942);
    float _1954 = -_1934;
    float _1956 = fma(_1954, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1948);
    float _1958 = fma(_1924, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1950);
    float _1960 = _1922 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1962 = fma(_1956, -0.5, 0.5);
    float _1964 = fma(_1956, 0.5, 0.5);
    float _1966 = exp2(_1944);
    float _1968 = _1922 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1970 = fma(_1926, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1960);
    float _1972 = _1932 + 1.0;
    float _1974 = fma(_1926, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1968);
    float _1976 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1970);
    float _1978 = fma(_1964, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1980 = 1.0 / _1958;
    float _1982 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1974);
    float _1984 = _1952 * 0.693147182464599609375;
    float _1986 = fma(_1964, _1978, -0.212114393711090087890625);
    float _1988 = _1984 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1990 = fma(_1964, _1986, 1.570728778839111328125);
    float _1992 = sqrt(_1962);
    float _1994 = -_1932;
    float _1996 = fma(_1966, _1972, _1994);
    float _1998 = fma(_1924, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1976);
    float _2000 = fma(_1924, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1982);
    float _2002 = fma(_1996, 0.5, 0.5);
    float _2004 = _1998 * _1980;
    float _2006 = _2000 * _1980;
    float _2008 = fma(_2004, 0.5, 0.5);
    float _2010 = fma(_2006, -0.5, 0.5);
    float _2012 = _1992 * 0.636619746685028076171875;
    float3 _5424 = float3(_2008, _2010, _1988);
    float _2014 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5424, float3(0.0), isnan(_5424)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5424, float3(0.0), isnan(_5424)), level(0.0)).x;
    float3 _5435 = float3(_2008, _2010, _1988);
    float4 _2017 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5435, float3(0.0), isnan(_5435)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5435, float3(0.0), isnan(_5435)), level(0.0)).xyzw;
    float _2019 = _2017.x;
    float _2021 = _2017.y;
    float _2023 = _2017.z;
    float _2025 = _2017.w;
    float _2027 = -_1990;
    float _2029 = fma(_2012, _2027, 1.0);
    float2 _5457 = float2(_2029, _2002);
    float3 _2033 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5457, float2(0.0), isnan(_5457)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5457, float2(0.0), isnan(_5457)), level(0.0)).xyz;
    float _2035 = _2033.x;
    float _2037 = _2033.y;
    float _2039 = _2033.z;
    float _2041 = in.m_65.y;
    float _2043 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2045 = in.m_51.w;
    bool _2047 = _136 > 0.5;
    float _2049 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _2051 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _2049;
    int _2053 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2055 = _2053 != 0;
    float _2057 = in.m_61.w;
    int _2059 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2061 = _2059 != 0;
    float _2063 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _2065 = _1092 + _2063;
    int _2067 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2069 = _2067 != 0;
    float _2071 = 1.0 / _2051;
    float _2073 = in.m_65.x;
    int _2075 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2077 = _2075 != 0;
    float _2079 = _1922 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2081 = fma(_1926, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2079);
    int _2083 = as_type<int>(_2043);
    if (_2055)
    {
        bool _2085 = _132 > 0.5;
        _1312 = _2085;
    }
    bool _2087 = _1312;
    float _2089 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2091 = -_2041;
    float _2093 = _2091 + 1.0;
    float _2095 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2081);
    float _2097 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _2099 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _2097;
    bool _2101 = _2045 > 0.5;
    float _2103 = _2065 * _2071;
    bool _2105 = _1092 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _2107 = isnan(_1092);
    bool _2109 = _2105 || _2107;
    bool _2111 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _2113 = _2109 || _2111;
    float _2115 = float(_2113);
    float _2117 = fma(_1924, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2095);
    int _2119 = _2101 ? as_type<int>(_2093) : as_type<int>(_2041);
    out.m_67.w = _2057;
    bool _2121 = _2101;
    float _2123 = _2099;
    float _2125 = _2041;
    if (_2061)
    {
        bool _2127 = _1094 > 0.5;
        _2121 = _2127;
    }
    bool _2129 = _2121;
    float _2131 = fma(_2099, _2103, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _2133 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _2135 = _2117 + _2133;
    bool _2137 = _1092 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _2139 = isnan(_1092);
    bool _2141 = _2137 || _2139;
    bool _2143 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _2145 = _2141 || _2143;
    float _2147 = float(_2145);
    float _2149 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _2151 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _2149;
    float _2153 = _2069 ? as_type<float>(_2119) : _2041;
    float _2155 = -_2147;
    float _2157 = _2155 + 1.0;
    if (!_2055)
    {
        _2123 = _2073;
    }
    float _2159 = _2123;
    float _2161 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _2163 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _2161;
    float _2165 = fma(_2151, _2103, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _2167 = _2115 * _2157;
    float _2169 = _2165;
    float _2171 = _2159;
    if (_2077)
    {
        float _2173 = _2047 ? _2093 : _2041;
        _2125 = _2173;
    }
    float _2175 = _2125;
    float _2177 = fma(_2163, _2103, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _2179 = _2043 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2181 = _2165 * _2167;
    float _2183 = _2131 * _2167;
    float _2185 = _2177 * _2167;
    int _2187 = as_type<int>(_2177);
    if (_2055)
    {
        float _2189 = -_2073;
        float _2191 = _2189 + 1.0;
        _2187 = as_type<int>(_2191);
    }
    int _2193 = _2187;
    float _2195 = fma(_2179, _2175, -0.5);
    float _2197 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (_2061)
    {
        float _2199 = -_2073;
        float _2201 = _2199 + 1.0;
        _2083 = as_type<int>(_2201);
    }
    int _2203 = _2083;
    if (!_2061)
    {
        _2169 = _2073;
    }
    float _2205 = _2169;
    float _2207 = -_1332;
    float _2209 = fma(_1272, _2195, _2207);
    float _2211 = _2205;
    if (_2055)
    {
        float _2213 = _2087 ? as_type<float>(_2193) : _2073;
        _2171 = _2213;
    }
    float _2215 = _2171;
    float _2217 = _2089 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_2061)
    {
        float _2219 = _2129 ? as_type<float>(_2203) : _2073;
        _2211 = _2219;
    }
    float _2221 = _2211;
    float _2223 = _2153 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2225 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2227 = fma(_2217, _2215, -0.5);
    float _2229 = _2209 + 0.5;
    float _2231 = _2221 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2233 = -_2115;
    float _2235 = _2233 + 1.0;
    float _2237 = fma(_1266, _2227, _1202);
    float _2239 = _1912 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.gl_Position.x = _1998;
    out.gl_Position.y = _2000;
    out.gl_Position.z = _2135;
    out.gl_Position.w = _1958;
    float _2241 = _2223 * _2197;
    float _2243 = _2237 + 0.5;
    float _2245 = fma(_2235, (*spvDescriptorSet0.vp_c9)._m0[123].x, _2181);
    float _2247 = fma(_2235, (*spvDescriptorSet0.vp_c9)._m0[123].y, _2183);
    float _2249 = exp2(_2239);
    float _2251 = fma(_2235, (*spvDescriptorSet0.vp_c9)._m0[123].z, _2185);
    float _2253 = fma(_2147, (*spvDescriptorSet0.vp_c9)._m0[124].x, _2245);
    float _2255 = fma(_2147, (*spvDescriptorSet0.vp_c9)._m0[124].y, _2247);
    float _2257 = _2231 * _2225;
    float _2259 = _1998 + _1958;
    float _2261 = fma(_2147, (*spvDescriptorSet0.vp_c9)._m0[124].z, _2251);
    float _2263 = _1958 + _2135;
    float _2265 = _2253 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    out.m_69.x = _2243;
    out.m_69.y = _2229;
    out.m_69.z = _2257;
    out.m_69.w = _2241;
    float _2267 = _2255 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2269 = _2261 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2271 = _2265 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2273 = _2267 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2275 = _2269 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2277 = -_2249;
    float _2279 = _2277 + 1.0;
    out.m_71.x = _2271;
    out.m_71.y = _2273;
    out.m_71.z = _2275;
    float _2281 = _2259 * 0.5;
    float _2283 = _2279 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2285 = _1958 * 0.5;
    float _2287 = fma(_2000, -0.5, _2285);
    float _2289 = _2263 * 0.5;
    out.m_73.x = _2281;
    out.m_73.y = _2287;
    out.m_73.z = _2289;
    out.m_73.w = _1958;
    float _2291 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_49.x = _2291;
    float _2293 = _2283 * _2014;
    float _2295 = _2025 * _2293;
    float _2297 = _2039 * _2293;
    float _2299 = -_2283;
    float _2301 = _2299 + 1.0;
    float _2303 = fma(_2035, _2295, _2019);
    float _2305 = fma(_2037, _2295, _2021);
    float _2307 = _2025 * _2301;
    float _2309 = fma(_2025, _2297, _2023);
    out.m_75.x = _2303;
    out.m_75.y = _2305;
    out.m_75.z = _2309;
    out.m_75.w = _2307;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

