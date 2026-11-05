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
    float4 m_71 [[user(locn0)]];
    float4 m_65 [[user(locn1)]];
    float4 m_69 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_67 [[user(locn4)]];
    float4 m_73 [[user(locn5)]];
    float4 m_49 [[user(locn6)]];
    float4 m_53 [[user(locn7)]];
    float4 m_75 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_57 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_44 [[attribute(3)]];
    float4 m_59 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_63 [[attribute(8)]];
    float4 m_61 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
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
        float _2062 = as_type<float>(_118);
        out.gl_Position.z = _2062;
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
        float _2125 = as_type<float>(_148);
        out.gl_Position.z = _2125;
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
    float _256 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _258 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _260 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _262 = fma(_252, _168, _256);
    float _264 = fma(_252, _166, _258);
    float _266 = fma(_252, _170, _260);
    float _268 = fma(_262, _150, _174);
    float _270 = fma(_264, _150, _172);
    float _272 = fma(_266, _150, _176);
    float _274 = _100 * _152;
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
        _292 = _274;
    }
    _294 = false;
    float _296 = _292;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _300 = _296 + _298;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _304 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _302;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _308 = _306 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _312 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _310;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _316 = _314 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _318 = 1.0 / _304;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _320;
    float _324 = 1.0 / _312;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _328 = _296 + _326;
    bool _330 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _332 = isnan(_296);
    bool _334 = _330 || _332;
    bool _336 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _338 = _334 || _336;
    float _340 = float(_338);
    float _342 = 1.0 / _308;
    float _344 = _328 * _318;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _348 = _296 + _346;
    bool _350 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _352 = isnan(_296);
    bool _354 = _350 || _352;
    bool _356 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _358 = _354 || _356;
    float _360 = float(_358);
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _362;
    bool _366 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _368 = 1.0 / _316;
    float _370 = _348 * _324;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _374 = _296 + _372;
    bool _376 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _378 = isnan(_296);
    bool _380 = _376 || _378;
    bool _382 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _384 = _380 || _382;
    float _386 = float(_384);
    float _388 = fma(_364, _344, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _390 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _392 = isnan(_296);
    bool _394 = _390 || _392;
    bool _396 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _398 = _394 || _396;
    float _400 = float(_398);
    float _402 = 1.0 / _322;
    float _404 = _300 * _342;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _408 = _296 + _406;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _410;
    float _414 = fma(_412, _344, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _416 = _374 * _368;
    float _418 = -_386;
    float _420 = _418 + 1.0;
    bool _422 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _424 = isnan(_296);
    bool _426 = _422 || _424;
    bool _428 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _430 = _426 || _428;
    float _432 = float(_430);
    float _434 = _360 * _420;
    float _436 = -_360;
    float _438 = _436 + 1.0;
    float _440 = -_432;
    float _442 = _440 + 1.0;
    float _444 = _408 * _402;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _446;
    float _450 = _400 * _438;
    float _452 = -_400;
    float _454 = _452 + 1.0;
    float _456 = fma(_448, _344, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _458 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _460 = isnan(_296);
    bool _462 = _458 || _460;
    bool _464 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _466 = _462 || _464;
    float _468 = float(_466);
    float _470 = _432 * _454;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _474 = _472 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _478 = _476 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _482 = _480 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _484 = _468 * _442;
    float _486 = -_468;
    float _488 = _486 + 1.0;
    float _490 = fma(_474, _404, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _492 = fma(_478, _404, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _494 = fma(_482, _404, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _496 = _340 * _488;
    float _498 = -_340;
    float _500 = _498 + 1.0;
    float _502 = _456 * _496;
    float _504 = _388 * _496;
    float _506 = _414 * _496;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _510 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _508;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _512;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _518 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _516;
    float _520 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[143].x, _502);
    float _522 = fma(_510, _370, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _524 = fma(_514, _370, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _526 = fma(_518, _370, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _528 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[143].y, _504);
    float _530 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[143].z, _506);
    float _532 = fma(_490, _484, _520);
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _536 = _534 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _538 = fma(_492, _484, _528);
    float _540 = fma(_522, _470, _532);
    float _542 = fma(_536, _416, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _546 = _544 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _548 = fma(_494, _484, _530);
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _552 = _550 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _554 = fma(_524, _470, _538);
    float _556 = fma(_546, _416, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _558 = fma(_526, _470, _548);
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _562 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _560;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _564;
    float _568 = fma(_552, _416, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _570;
    float _574 = fma(_542, _450, _540);
    float _576 = fma(_562, _444, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _578 = fma(_566, _444, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _580 = fma(_572, _444, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _582 = fma(_556, _450, _554);
    float _584 = fma(_568, _450, _558);
    float _586 = fma(_576, _434, _574);
    float _588 = fma(_578, _434, _582);
    float _590 = fma(_580, _434, _584);
    float _592 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[148].x, _586);
    float _594 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[148].y, _588);
    float _596 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[148].z, _590);
    bool _598 = !_366;
    float _614;
    if (!_598)
    {
        float _600 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _602 = _132 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _604 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[11].y, _100);
        float _606 = _604 * _600;
        float _608 = floor(_606);
        float _610 = -_608;
        float _612 = _606 + _610;
        _614 = _612;
        _616 = true;
    }
    else
    {
        _614 = _274;
    }
    _616 = false;
    float _618 = _614;
    float _620 = in.m_51.z;
    float _622 = _132 * 2.0;
    float _624 = _136 * 2.0;
    float _626 = _268 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _628 = _268 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _630 = floor(_622);
    float _632 = _268 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _634 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[4].x, _626);
    float _636 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[5].x, _628);
    float _638 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[6].x, _632);
    float _640 = _132 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _642 = floor(_624);
    float _644 = _136 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _648 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _650 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _652 = _650 != 0;
    int _654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _656 = _654 != 0;
    int _658 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _660 = _658 != 0;
    float _662 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[4].z, _634);
    float _664 = -_646;
    float _666 = fma(_640, 2.0, _664);
    float _668 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _670 = log2(_668);
    bool _672 = _630 > 0.0;
    float _674 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[5].z, _636);
    float _676 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[6].z, _638);
    bool _678 = _630 >= 0.0;
    bool _680 = isnan(_630);
    bool _682 = _678 || _680;
    bool _684 = isnan(0.0);
    bool _686 = _682 || _684;
    float _688 = _132 + _136;
    float _690 = _620 * 2.0;
    float _692 = fma(_644, -2.0, _648);
    float _694 = _688 + (-1.0);
    int _696 = _686 ? 0 : 1;
    float _698 = _136 + _620;
    bool _700 = _642 > 0.0;
    float _702 = floor(_690);
    float _704 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _706 = _642 >= 0.0;
    bool _708 = isnan(_642);
    bool _710 = _706 || _708;
    bool _712 = isnan(0.0);
    bool _714 = _710 || _712;
    float _716 = _670 * _100;
    bool _718 = !_656;
    int _720 = _718 ? 0 : 1;
    float _722 = _698 + (-1.0);
    int _724 = ~_696;
    int _726 = _724 + 1;
    int _728 = _726 + 1;
    float _730 = _674 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _732 = exp2(_716);
    int _734 = _728;
    float _736 = _730;
    bool _738 = _656;
    if (!_672)
    {
        int _740 = ~_696;
        int _742 = _740 + 1;
        _734 = _742;
    }
    int _744 = _734;
    float _746 = _662 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _748 = _714 ? 0 : 1;
    float _750 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _752 = abs(_720);
    float _754 = _676 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _756 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _758 = _746 + _756;
    int _760 = ~_748;
    int _762 = _760 + 1;
    int _764 = _762 + 1;
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _768 = 1.0 + _766;
    int _770 = _764;
    if (!_700)
    {
        int _772 = ~_748;
        int _774 = _772 + 1;
        _770 = _774;
    }
    int _776 = _770;
    float _778 = 1.0 / _768;
    float _780 = float(_752);
    float _782 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _784 = float(_744);
    float _786 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _788 = _702 > 0.0;
    float _790 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[78].w, _782);
    bool _792 = !_660;
    int _794 = _792 ? 0 : 1;
    float _796 = _780 * _784;
    bool _798 = _702 >= 0.0;
    bool _800 = isnan(_702);
    bool _802 = _798 || _800;
    bool _804 = isnan(0.0);
    bool _806 = _802 || _804;
    float _808 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[78].z, _786);
    float _810 = in.m_57.x;
    float _812 = in.m_57.y;
    float _814 = in.m_57.z;
    bool _816 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _818 = isnan(1.0);
    bool _820 = _816 || _818;
    bool _822 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _824 = _820 || _822;
    float _826 = -_732;
    float _828 = _826 + 1.0;
    int _830 = abs(_794);
    float _832 = -_100;
    float _834 = fma(_832, (*spvDescriptorSet0.vp_c9)._m0[76].x, _666);
    int _836 = _806 ? 0 : 1;
    float _838 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[76].y, _692);
    bool _840 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _842 = isnan(0.0);
    bool _844 = _840 || _842;
    bool _846 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _848 = _844 || _846;
    float _850 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].z, _808);
    float _852 = _796 * (-2.0);
    float _854 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].w, _790);
    int _856 = ~_836;
    int _858 = _856 + 1;
    int _860 = _858 + 1;
    float _862 = _848 ? _828 : 0.0;
    int _864 = _860;
    if (!_788)
    {
        int _866 = ~_836;
        int _868 = _866 + 1;
        _864 = _868;
    }
    int _870 = _864;
    float _872 = fma(_750, _852, _750);
    float _874 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _876 = _730 + _874;
    if (_824)
    {
        float _878 = _862 * _778;
        _110 = _878;
    }
    float _880 = _110;
    float _882 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _884 = _754 + _882;
    float _886 = float(_776);
    float _888 = _876 * _876;
    float _890 = float(_830);
    float _892 = fma(_852, _812, _812);
    bool _894 = !_652;
    int _896 = _894 ? 0 : 1;
    float _898 = fma(_758, _758, _888);
    float _900 = _890 * _886;
    int _902 = abs(_896);
    float _904 = fma(_884, _884, _898);
    float _906 = float(_870);
    float _908 = _132 + _620;
    float _910 = float(_902);
    float _912 = rsqrt(_904);
    float _914 = _136 + (-0.5);
    float _916 = _908 + (-1.0);
    float _918 = _900 * (-2.0);
    float _920 = _910 * _906;
    float _922 = fma(_914, (*spvDescriptorSet0.vp_c9)._m0[196].y, _892);
    float _924 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _926 = _620 + (-0.5);
    float _928 = fma(_918, _814, _814);
    float _930 = _920 * (-2.0);
    float _932 = fma(_924, _918, _924);
    float _934 = fma(_872, _880, _922);
    float _936 = fma(_926, (*spvDescriptorSet0.vp_c9)._m0[196].z, _928);
    float _938 = fma(_704, _930, _704);
    float _940 = fma(_930, _810, _810);
    float _942 = _934 * 0.15915493667125701904296875;
    float _944 = _876 * _912;
    float _946 = _758 * _912;
    float _948 = fma(_932, _880, _936);
    float _950 = in.m_55.x;
    float _952 = in.m_55.y;
    float _954 = in.m_55.z;
    float _956 = -_944;
    float _958 = fma(_956, (*spvDescriptorSet0.vp_c9)._m0[18].w, _876);
    float _960 = -_946;
    float _962 = fma(_960, (*spvDescriptorSet0.vp_c9)._m0[18].w, _758);
    float _964 = _948 * 0.15915493667125701904296875;
    float _966 = in.m_59.x;
    float _968 = in.m_59.y;
    float _970 = in.m_59.z;
    float _972 = _958 * _958;
    float _974 = _884 * _912;
    float _976 = _132 + (-0.5);
    float _978 = in.m_61.x;
    float _980 = in.m_61.y;
    float _982 = in.m_61.z;
    float _984 = fma(_962, _962, _972);
    float _986 = -_974;
    float _988 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[18].w, _884);
    float _990 = fma(_976, (*spvDescriptorSet0.vp_c9)._m0[196].x, _940);
    float _992 = _942 * 6.283185482025146484375;
    float _994 = sin(_992);
    float _996 = fma(_988, _988, _984);
    float _998 = fma(_938, _880, _990);
    float _1000 = _274 * _274;
    float _1002 = _998 * 0.15915493667125701904296875;
    float _1004 = sqrt(_996);
    float _1006 = _596 * _954;
    float _1008 = _594 * _952;
    float _1010 = _592 * _950;
    float _1012 = _942 * 6.283185482025146484375;
    float _1014 = cos(_1012);
    float _1016 = -_968;
    float _1018 = _1016 + _980;
    float _1020 = -_966;
    float _1022 = _1020 + _978;
    float _1024 = -_970;
    float _1026 = _1024 + _982;
    float _1028 = _964 * 6.283185482025146484375;
    float _1030 = cos(_1028);
    float _1032 = fma(_1000, _1018, _968);
    float _1034 = _912 * _1004;
    float _1036 = _1008 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1038 = fma(_1000, _1022, _966);
    float _1040 = _1010 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1042 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1032);
    float _1044 = _1036 * _1034;
    float _1046 = _1002 * 6.283185482025146484375;
    float _1048 = sin(_1046);
    float _1050 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1038);
    float _1052 = _1040 * _1034;
    float _1054 = fma(_1000, _1026, _970);
    float _1056 = _1044 * _1042;
    float _1058 = _1006 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1060 = _1052 * _1050;
    float _1062 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1054);
    float _1064 = _1002 * 6.283185482025146484375;
    float _1066 = cos(_1064);
    float _1068 = _1030 * _1056;
    float _1070 = _994 * _1030;
    float _1072 = _1058 * _1034;
    float _1074 = _1014 * _1030;
    float _1076 = _1072 * _1062;
    float _1078 = _964 * 6.283185482025146484375;
    float _1080 = sin(_1078);
    float _1082 = _1048 * _994;
    float _1084 = _1066 * _1014;
    float _1086 = _1066 * _994;
    float _1088 = _1066 * _1068;
    float _1090 = _1048 * _1014;
    float _1092 = _1048 * _1068;
    float _1094 = fma(_1080, _1084, _1082);
    float _1096 = -_1056;
    float _1098 = _1080 * _1096;
    float _1100 = fma(_1080, _1082, _1084);
    float _1102 = fma(_1094, _1060, _1088);
    float _1104 = -_1090;
    float _1106 = fma(_1080, _1086, _1104);
    float _1108 = -_1086;
    float _1110 = fma(_1080, _1090, _1108);
    float _1112 = fma(_1074, _1060, _1098);
    float _1114 = fma(_1106, _1076, _1102);
    float _1116 = fma(_1110, _1060, _1092);
    float _1118 = fma(_1070, _1076, _1112);
    float _1120 = _1114 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1122 = _1114 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1124 = fma(_1100, _1076, _1116);
    float _1126 = fma(_1118, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1120);
    float _1128 = fma(_1118, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1122);
    float _1130 = fma(_1124, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1126);
    float _1132 = fma(_1124, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1128);
    float _1134 = _754 + _1130;
    float _1136 = _746 + _1132;
    float _1138 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1140 = _1134 + _1138;
    float _1142 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1144 = _1136 + _1142;
    float _1146 = _1140 * _1140;
    float _1148 = fma(_1144, _1144, _1146);
    float _1150 = _1114 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1152 = sqrt(_1148);
    float _1154 = fma(_1118, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1150);
    float _1156 = fma(_1124, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1154);
    float _1158 = _730 + _1156;
    bool _1160 = _1152 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1162 = _1150;
    float _1164 = _1124;
    float _1166 = _1114;
    float _1168 = _1120;
    float _1170 = _1152;
    if (!_1160)
    {
        _1162 = _1136;
    }
    float _1172 = _1162;
    float _1174 = _1172;
    if (!_1160)
    {
        _1164 = _1134;
    }
    float _1176 = _1164;
    float _1178 = _1176;
    if (!_1160)
    {
        _1166 = _1158;
    }
    float _1180 = _1166;
    bool _1182 = !_1160;
    float _1184 = _1180;
    if (!_1182)
    {
        float _1186 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1188 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1190 = _1152 + _1188;
        float _1192 = _1158 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1194 = _1190 * _1186;
        float _1196 = rsqrt(_1148);
        float _1198 = _1194 * 0.15915493667125701904296875;
        float _1200 = _1198 * 6.283185482025146484375;
        float _1202 = cos(_1200);
        float _1204 = _1198 * 6.283185482025146484375;
        float _1206 = sin(_1204);
        float _1208 = _1202 + (-1.0);
        float _1210 = _1208 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1212 = fma(_1206, _1192, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1214 = fma(_1158, _1202, _1210);
        float _1216 = _1196 * _1212;
        float _1218 = fma(_1144, _1216, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1220 = fma(_1140, _1216, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1184 = _1214;
        _1174 = _1218;
        _1178 = _1220;
        _1168 = _1198;
        _1170 = _1196;
    }
    float _1222 = _1184;
    float _1224 = _1174;
    float _1226 = _1178;
    float _1228 = _1168;
    float _1230 = _1170;
    float _1232 = -_944;
    float _1234 = fma(_1232, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1222);
    float _1236 = -_946;
    float _1238 = fma(_1236, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1224);
    float _1240 = -_974;
    float _1242 = fma(_1240, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1226);
    float _1244 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1246 = _1234 + _1244;
    float _1248 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1250 = _1238 + _1248;
    float _1252 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1254 = _1242 + _1252;
    float _1256 = _1246 * _1246;
    float _1258 = fma(_1250, _1250, _1256);
    float _1260 = fma(_1254, _1254, _1258);
    float _1262 = rsqrt(_1260);
    float _1264 = sqrt(_1260);
    float _1266 = _1262 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1268 = _1250 * _1266;
    float _1270 = _1254 * _1266;
    float _1272 = _1268 * _1268;
    float _1274 = _1270 * _1270;
    float _1276 = _1272 + _1274;
    float _1278 = sqrt(_1276);
    bool _1280 = _1278 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1282 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1284 = _1278 + _1282;
    float _1286 = _1262;
    float _1288 = _1284;
    float _1290 = _1228;
    float _1292 = _1246;
    if (_1280)
    {
        float _1294 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1286 = _1294;
    }
    float _1296 = _1286;
    float _1298 = _1296;
    if (_1280)
    {
        float _1300 = _1284 * _1296;
        _1288 = _1300;
    }
    float _1302 = _1288;
    if (_1280)
    {
        float _1304 = rsqrt(_1276);
        _1298 = _1304;
    }
    float _1306 = _1298;
    float _1308 = _1306;
    if (_1280)
    {
        float _1310 = _1302 * 0.15915493667125701904296875;
        _1290 = _1310;
    }
    float _1312 = _1290;
    float _1314 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1316 = _1254;
    float _1318 = _1312;
    if (_1280)
    {
        float _1320 = _1312 * 6.283185482025146484375;
        float _1322 = sin(_1320);
        _1316 = _1322;
    }
    float _1324 = _1316;
    float _1326 = precise::max(0.0, _1314);
    float _1328 = _1230;
    float _1330 = _1326;
    if (_1280)
    {
        float _1332 = _1312 * 6.283185482025146484375;
        float _1334 = cos(_1332);
        _1328 = _1334;
    }
    float _1336 = _1328;
    float _1338 = -_1266;
    float _1340 = -_1326;
    float _1342 = fma(_1246, _1338, _1340);
    if (_1280)
    {
        float _1344 = _1342 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1292 = _1344;
    }
    float _1346 = _1292;
    float _1348 = _1324;
    float _1350 = _1346;
    if (_1280)
    {
        float _1352 = fma(_1324, _1346, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1348 = _1352;
    }
    float _1354 = _1348;
    float _1356 = _1354;
    if (!_1280)
    {
        _1350 = _1342;
    }
    float _1358 = _1350;
    float _1360 = _1358;
    if (_1280)
    {
        float _1362 = _1306 * _1354;
        _736 = _1362;
    }
    float _1364 = _736;
    if (!_1280)
    {
        _1308 = _1268;
    }
    float _1366 = _1308;
    float _1368 = _1366;
    float _1370 = _1336;
    if (_1280)
    {
        float _1372 = _1336 + (-1.0);
        _1330 = _1372;
    }
    float _1374 = _1330;
    float _1376 = _1374;
    if (_1280)
    {
        float _1378 = _1268 * _1364;
        _1368 = _1378;
    }
    float _1380 = _1368;
    if (!_1280)
    {
        _1356 = _1272;
    }
    float _1382 = _1356;
    float _1384 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1386 = _1382;
    if (_1280)
    {
        float _1388 = _1374 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1318 = _1388;
    }
    float _1390 = _1318;
    if (!_1280)
    {
        _1376 = _1270;
    }
    float _1392 = _1376;
    float _1394 = _1392;
    if (_1280)
    {
        float _1396 = _1270 * _1364;
        _1394 = _1396;
    }
    float _1398 = _1394;
    if (_1280)
    {
        float _1400 = _1380 * _1380;
        _1386 = _1400;
    }
    float _1402 = _1386;
    if (_1280)
    {
        float _1404 = fma(_1342, _1336, _1390);
        _1360 = _1404;
    }
    float _1406 = _1360;
    if (!_1280)
    {
        _1370 = _1274;
    }
    float _1408 = _1370;
    float _1410 = _1408;
    if (_1280)
    {
        float _1412 = _1398 * _1398;
        _1410 = _1412;
    }
    float _1414 = _1410;
    float _1416 = fma(_1406, _1406, _1402);
    float _1418 = _1234 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1420 = _1416 + _1414;
    float _1422 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1418);
    float _1424 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1426 = fma(_1264, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1424);
    float _1428 = precise::clamp(_1426, 0.0, 1.0);
    float _1430 = _1234 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1432 = rsqrt(_1420);
    float _1434 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1422);
    float _1436 = -_1428;
    float _1438 = _1436 + 1.0;
    float _1440 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1430);
    float _1442 = _1234 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1444 = _1434 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1446 = _1234 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1448 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1440);
    float _1450 = abs(_1438);
    float _1452 = log2(_1450);
    float _1454 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1442);
    float _1456 = _1444 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1458 = _1448 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1460 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1446);
    float _1462 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1454);
    float _1464 = -_1456;
    float _1466 = fma(_1464, _1384, 1.0);
    float _1468 = _1432 * _1380;
    float _1470 = _1462 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1472 = _1432 * _1406;
    float _1474 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1476 = _1468 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1478 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1460);
    float _1480 = _1432 * _1398;
    float _1482 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1474);
    float _1484 = _1452 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1486 = -_1476;
    float _1488 = fma(_1472, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1486);
    float _1490 = log2(_1466);
    float _1492 = _1478 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1494 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1482);
    float _1496 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1498 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1494);
    float _1500 = exp2(_1484);
    float _1502 = -_1480;
    float _1504 = fma(_1502, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1488);
    float _1506 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1508 = fma(_1504, -0.5, 0.5);
    float _1510 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1506);
    float _1512 = fma(_1504, 0.5, 0.5);
    float _1514 = 1.0 / _1498;
    float _1516 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1496);
    float _1518 = _1472 + 1.0;
    float _1520 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1510);
    float _1522 = fma(_1512, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1524 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1516);
    float _1526 = _1490 * 0.693147182464599609375;
    float _1528 = sqrt(_1508);
    float _1530 = -_1472;
    float _1532 = fma(_1500, _1518, _1530);
    float _1534 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1520);
    float _1536 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1524);
    float _1538 = fma(_1512, _1522, -0.212114393711090087890625);
    float _1540 = _1526 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1542 = fma(_1532, 0.5, 0.5);
    float _1544 = _1534 * _1514;
    float _1546 = _1536 * _1514;
    float _1548 = fma(_1512, _1538, 1.570728778839111328125);
    float _1550 = fma(_1544, 0.5, 0.5);
    float _1552 = fma(_1546, -0.5, 0.5);
    float _1554 = _1528 * 0.636619746685028076171875;
    float3 _4360 = float3(_1550, _1552, _1540);
    float _1556 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4360, float3(0.0), isnan(_4360)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4360, float3(0.0), isnan(_4360)), level(0.0)).x;
    float3 _4371 = float3(_1550, _1552, _1540);
    float4 _1559 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4371, float3(0.0), isnan(_4371)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4371, float3(0.0), isnan(_4371)), level(0.0)).xyzw;
    float _1561 = _1559.x;
    float _1563 = _1559.y;
    float _1565 = _1559.z;
    float _1567 = _1559.w;
    float _1569 = -_1548;
    float _1571 = fma(_1554, _1569, 1.0);
    float2 _4393 = float2(_1571, _1542);
    float3 _1575 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4393, float2(0.0), isnan(_4393)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4393, float2(0.0), isnan(_4393)), level(0.0)).xyz;
    float _1577 = _1575.x;
    float _1579 = _1575.y;
    float _1581 = _1575.z;
    float _1583 = in.m_51.w;
    float _1585 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1587 = in.m_63.y;
    float _1589 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1591 = _1589 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1593 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1595 = _1593 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _1597 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1599 = _1597 != 0;
    float _1601 = 1.0 / _1591;
    bool _1603 = _136 > 0.5;
    float _1605 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1607 = _1605 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1609 = in.m_63.x;
    int _1611 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1613 = _1611 != 0;
    float _1615 = 1.0 / _1595;
    float _1617 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1619 = _1617 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    int _1621 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1623 = _1621 != 0;
    if (_1599)
    {
        bool _1625 = _132 > 0.5;
        _738 = _1625;
    }
    bool _1627 = _738;
    bool _1629 = _1583 > 0.5;
    float _1631 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1633 = _1631 + (*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _1635 = 1.0 / _1607;
    float _1637 = -_1587;
    float _1639 = _1637 + 1.0;
    int _1641 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1643 = _1641 != 0;
    float _1645 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1647 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1645;
    float _1649 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1651 = _1649 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1653 = 1.0 / _1619;
    float _1655 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1657 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1655;
    float _1659 = _1651 * _1601;
    float _1661 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _1663 = _1661 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1665 = -(*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1667 = (*spvDescriptorSet0.vp_c9)._m0[120].x + _1665;
    float _1669 = 1.0 / _1633;
    int _1671 = _1629 ? as_type<int>(_1639) : as_type<int>(_1587);
    float _1673 = _1663 * _1635;
    bool _1675 = _1629;
    float _1677 = _1587;
    int _1679 = as_type<int>(_1639);
    if (_1613)
    {
        bool _1681 = _620 > 0.5;
        _1675 = _1681;
    }
    bool _1683 = _1675;
    float _1685 = _1647 * _1615;
    bool _1687 = _618 >= (*spvDescriptorSet0.vp_c9)._m0[120].w;
    bool _1689 = isnan(_618);
    bool _1691 = _1687 || _1689;
    bool _1693 = isnan((*spvDescriptorSet0.vp_c9)._m0[120].w);
    bool _1695 = _1691 || _1693;
    float _1697 = float(_1695);
    bool _1699 = _618 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1701 = isnan(_618);
    bool _1703 = _1699 || _1701;
    bool _1705 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1707 = _1703 || _1705;
    float _1709 = float(_1707);
    float _1711 = _1657 * _1653;
    float _1713 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1715 = _618 + _1713;
    float _1717 = -_1697;
    float _1719 = _1717 + 1.0;
    float _1721 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1723 = _618 + _1721;
    float _1725 = -_1709;
    float _1727 = _1725 + 1.0;
    float _1729 = fma(_1659, _1715, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _1731 = _618 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1733 = isnan(_618);
    bool _1735 = _1731 || _1733;
    bool _1737 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1739 = _1735 || _1737;
    float _1741 = float(_1739);
    float _1743 = _1709 * _1719;
    float _1745 = _1667 * _1669;
    bool _1747 = _618 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1749 = isnan(_618);
    bool _1751 = _1747 || _1749;
    bool _1753 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1755 = _1751 || _1753;
    float _1757 = float(_1755);
    float _1759 = fma(_1685, _1723, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1761 = -_1741;
    float _1763 = _1761 + 1.0;
    float _1765 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1767 = _618 + _1765;
    float _1769 = _1623 ? as_type<float>(_1671) : _1587;
    float _1771 = _1757 * _1727;
    bool _1773 = _618 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1775 = isnan(_618);
    bool _1777 = _1773 || _1775;
    bool _1779 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1781 = _1777 || _1779;
    float _1783 = float(_1781);
    float _1785 = -_1757;
    float _1787 = _1785 + 1.0;
    bool _1789 = _618 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1791 = isnan(_618);
    bool _1793 = _1789 || _1791;
    bool _1795 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1797 = _1793 || _1795;
    float _1799 = float(_1797);
    float _1801 = _1769 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1803 = _1767;
    if (_1643)
    {
        float _1805 = _1603 ? _1639 : _1587;
        _1677 = _1805;
    }
    float _1807 = _1677;
    float _1809 = _1783 * _1763;
    float _1811 = -_1783;
    float _1813 = _1811 + 1.0;
    float _1815 = _1741 * _1787;
    float _1817 = fma(_1711, _1767, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1819 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1821 = _618 + _1819;
    float _1823 = _1799 * _1813;
    float _1825 = -_1799;
    float _1827 = _1825 + 1.0;
    float _1829 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1831 = _618 + _1829;
    float _1833 = fma(_1673, _1821, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1835 = _1759 * _1823;
    float _1837 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1839 = fma(_1745, _1831, (*spvDescriptorSet0.vp_c9)._m0[119].x);
    int _1841 = as_type<int>(_1809);
    float _1843 = _1807;
    if (_1599)
    {
        float _1845 = -_1609;
        float _1847 = _1845 + 1.0;
        _1679 = as_type<int>(_1847);
    }
    int _1849 = _1679;
    float _1851 = fma(_1827, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1835);
    if (!_1599)
    {
        _1803 = _1609;
    }
    float _1853 = _1803;
    float _1855 = _1585 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1857 = fma(_1729, _1809, _1851);
    float _1859 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1861 = _1853;
    if (_1599)
    {
        float _1863 = _1627 ? as_type<float>(_1849) : _1609;
        _1861 = _1863;
    }
    float _1865 = _1861;
    float _1867 = fma(_1855, _1807, -0.5);
    float _1869 = fma(_1817, _1815, _1857);
    if (_1613)
    {
        float _1871 = -_1609;
        float _1873 = _1871 + 1.0;
        _1841 = as_type<int>(_1873);
    }
    int _1875 = _1841;
    if (!_1613)
    {
        _1843 = _1609;
    }
    float _1877 = _1843;
    float _1879 = -_838;
    float _1881 = fma(_854, _1867, _1879);
    float _1883 = fma(_1833, _1771, _1869);
    float _1885 = _1837 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1887 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1889 = fma(_1839, _1743, _1883);
    float _1891 = fma(_1885, _1865, -0.5);
    float _1893 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1895 = fma(_1697, (*spvDescriptorSet0.vp_c9)._m0[120].x, _1889);
    float _1897 = _1452 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1899 = fma(_850, _1891, _834);
    float _1901 = _1801 * _1859;
    float _1903 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1905 = _1877;
    if (_1613)
    {
        float _1907 = _1683 ? as_type<float>(_1875) : _1609;
        _1905 = _1907;
    }
    float _1909 = _1905;
    float _1911 = exp2(_1897);
    float _1913 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1915 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1917 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1903);
    float _1919 = in.m_61.w;
    float _1921 = _1909 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1923 = _1893 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1925 = _1913 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1927 = _1915 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1929 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1917);
    float _1931 = _1921 * _1887;
    float _1933 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1935 = _1881 + 0.5;
    float _1937 = _1899 + 0.5;
    float _1939 = -_1911;
    float _1941 = _1939 + 1.0;
    out.m_65.x = _1923;
    out.m_65.y = _1925;
    out.m_65.z = _1927;
    float _1943 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1929);
    float _1945 = _1895 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1947 = _1941 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1949 = _1498 * 0.5;
    out.m_67.x = _1937;
    out.m_67.y = _1935;
    out.m_67.z = _1931;
    out.m_67.w = _1901;
    out.m_69.w = _1919;
    float _1951 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1953 = _1534 + _1498;
    float _1955 = _1933 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1957 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _1959 = _1943 + _1957;
    float _1961 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1963 = _1951 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1965 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1967 = _1953 * 0.5;
    float _1969 = fma(_1536, -0.5, _1949);
    float _1971 = -_1947;
    float _1973 = _1971 + 1.0;
    float _1975 = _1498 + _1959;
    float _1977 = _1961 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.gl_Position.x = _1534;
    out.gl_Position.y = _1536;
    out.gl_Position.z = _1959;
    out.gl_Position.w = _1498;
    float _1979 = _1975 * 0.5;
    out.m_71.x = _1955;
    out.m_71.y = _1963;
    out.m_71.z = _1977;
    out.m_71.w = _1945;
    out.m_73.x = _1967;
    out.m_73.y = _1969;
    out.m_73.z = _1979;
    out.m_73.w = _1498;
    out.m_49.x = _1965;
    float _1981 = _1947 * _1556;
    float _1983 = _1567 * _1973;
    float _1985 = _1567 * _1981;
    float _1987 = _1581 * _1981;
    float _1989 = fma(_1577, _1985, _1561);
    float _1991 = fma(_1579, _1985, _1563);
    float _1993 = fma(_1567, _1987, _1565);
    out.m_75.x = _1989;
    out.m_75.y = _1991;
    out.m_75.z = _1993;
    out.m_75.w = _1983;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
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
        float _2062 = as_type<float>(_118);
        out.gl_Position.z = _2062;
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
        float _2125 = as_type<float>(_148);
        out.gl_Position.z = _2125;
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
    float _256 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _258 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _260 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _262 = fma(_252, _168, _256);
    float _264 = fma(_252, _166, _258);
    float _266 = fma(_252, _170, _260);
    float _268 = fma(_262, _150, _174);
    float _270 = fma(_264, _150, _172);
    float _272 = fma(_266, _150, _176);
    float _274 = _100 * _152;
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
        _292 = _274;
    }
    _294 = false;
    float _296 = _292;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _300 = _296 + _298;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _304 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _302;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _308 = _306 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _312 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _310;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _316 = _314 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _318 = 1.0 / _304;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _320;
    float _324 = 1.0 / _312;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _328 = _296 + _326;
    bool _330 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _332 = isnan(_296);
    bool _334 = _330 || _332;
    bool _336 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _338 = _334 || _336;
    float _340 = float(_338);
    float _342 = 1.0 / _308;
    float _344 = _328 * _318;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _348 = _296 + _346;
    bool _350 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _352 = isnan(_296);
    bool _354 = _350 || _352;
    bool _356 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _358 = _354 || _356;
    float _360 = float(_358);
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _362;
    bool _366 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _368 = 1.0 / _316;
    float _370 = _348 * _324;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _374 = _296 + _372;
    bool _376 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _378 = isnan(_296);
    bool _380 = _376 || _378;
    bool _382 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _384 = _380 || _382;
    float _386 = float(_384);
    float _388 = fma(_364, _344, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _390 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _392 = isnan(_296);
    bool _394 = _390 || _392;
    bool _396 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _398 = _394 || _396;
    float _400 = float(_398);
    float _402 = 1.0 / _322;
    float _404 = _300 * _342;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _408 = _296 + _406;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _410;
    float _414 = fma(_412, _344, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _416 = _374 * _368;
    float _418 = -_386;
    float _420 = _418 + 1.0;
    bool _422 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _424 = isnan(_296);
    bool _426 = _422 || _424;
    bool _428 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _430 = _426 || _428;
    float _432 = float(_430);
    float _434 = _360 * _420;
    float _436 = -_360;
    float _438 = _436 + 1.0;
    float _440 = -_432;
    float _442 = _440 + 1.0;
    float _444 = _408 * _402;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _446;
    float _450 = _400 * _438;
    float _452 = -_400;
    float _454 = _452 + 1.0;
    float _456 = fma(_448, _344, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _458 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _460 = isnan(_296);
    bool _462 = _458 || _460;
    bool _464 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _466 = _462 || _464;
    float _468 = float(_466);
    float _470 = _432 * _454;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _474 = _472 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _478 = _476 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _482 = _480 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _484 = _468 * _442;
    float _486 = -_468;
    float _488 = _486 + 1.0;
    float _490 = fma(_474, _404, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _492 = fma(_478, _404, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _494 = fma(_482, _404, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _496 = _340 * _488;
    float _498 = -_340;
    float _500 = _498 + 1.0;
    float _502 = _456 * _496;
    float _504 = _388 * _496;
    float _506 = _414 * _496;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _510 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _508;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _512;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _518 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _516;
    float _520 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[143].x, _502);
    float _522 = fma(_510, _370, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _524 = fma(_514, _370, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _526 = fma(_518, _370, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _528 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[143].y, _504);
    float _530 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[143].z, _506);
    float _532 = fma(_490, _484, _520);
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _536 = _534 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _538 = fma(_492, _484, _528);
    float _540 = fma(_522, _470, _532);
    float _542 = fma(_536, _416, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _546 = _544 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _548 = fma(_494, _484, _530);
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _552 = _550 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _554 = fma(_524, _470, _538);
    float _556 = fma(_546, _416, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _558 = fma(_526, _470, _548);
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _562 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _560;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _564;
    float _568 = fma(_552, _416, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _570;
    float _574 = fma(_542, _450, _540);
    float _576 = fma(_562, _444, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _578 = fma(_566, _444, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _580 = fma(_572, _444, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _582 = fma(_556, _450, _554);
    float _584 = fma(_568, _450, _558);
    float _586 = fma(_576, _434, _574);
    float _588 = fma(_578, _434, _582);
    float _590 = fma(_580, _434, _584);
    float _592 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[148].x, _586);
    float _594 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[148].y, _588);
    float _596 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[148].z, _590);
    bool _598 = !_366;
    float _614;
    if (!_598)
    {
        float _600 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _602 = _132 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _604 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[11].y, _100);
        float _606 = _604 * _600;
        float _608 = floor(_606);
        float _610 = -_608;
        float _612 = _606 + _610;
        _614 = _612;
        _616 = true;
    }
    else
    {
        _614 = _274;
    }
    _616 = false;
    float _618 = _614;
    float _620 = in.m_51.z;
    float _622 = _132 * 2.0;
    float _624 = _136 * 2.0;
    float _626 = _268 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _628 = _268 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _630 = floor(_622);
    float _632 = _268 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _634 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[4].x, _626);
    float _636 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[5].x, _628);
    float _638 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[6].x, _632);
    float _640 = _132 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _642 = floor(_624);
    float _644 = _136 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _648 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _650 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _652 = _650 != 0;
    int _654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _656 = _654 != 0;
    int _658 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _660 = _658 != 0;
    float _662 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[4].z, _634);
    float _664 = -_646;
    float _666 = fma(_640, 2.0, _664);
    float _668 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _670 = log2(_668);
    bool _672 = _630 > 0.0;
    float _674 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[5].z, _636);
    float _676 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[6].z, _638);
    bool _678 = _630 >= 0.0;
    bool _680 = isnan(_630);
    bool _682 = _678 || _680;
    bool _684 = isnan(0.0);
    bool _686 = _682 || _684;
    float _688 = _132 + _136;
    float _690 = _620 * 2.0;
    float _692 = fma(_644, -2.0, _648);
    float _694 = _688 + (-1.0);
    int _696 = _686 ? 0 : 1;
    float _698 = _136 + _620;
    bool _700 = _642 > 0.0;
    float _702 = floor(_690);
    float _704 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _706 = _642 >= 0.0;
    bool _708 = isnan(_642);
    bool _710 = _706 || _708;
    bool _712 = isnan(0.0);
    bool _714 = _710 || _712;
    float _716 = _670 * _100;
    bool _718 = !_656;
    int _720 = _718 ? 0 : 1;
    float _722 = _698 + (-1.0);
    int _724 = ~_696;
    int _726 = _724 + 1;
    int _728 = _726 + 1;
    float _730 = _674 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _732 = exp2(_716);
    int _734 = _728;
    float _736 = _730;
    bool _738 = _656;
    if (!_672)
    {
        int _740 = ~_696;
        int _742 = _740 + 1;
        _734 = _742;
    }
    int _744 = _734;
    float _746 = _662 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _748 = _714 ? 0 : 1;
    float _750 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _752 = abs(_720);
    float _754 = _676 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _756 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _758 = _746 + _756;
    int _760 = ~_748;
    int _762 = _760 + 1;
    int _764 = _762 + 1;
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _768 = 1.0 + _766;
    int _770 = _764;
    if (!_700)
    {
        int _772 = ~_748;
        int _774 = _772 + 1;
        _770 = _774;
    }
    int _776 = _770;
    float _778 = 1.0 / _768;
    float _780 = float(_752);
    float _782 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _784 = float(_744);
    float _786 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _788 = _702 > 0.0;
    float _790 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[78].w, _782);
    bool _792 = !_660;
    int _794 = _792 ? 0 : 1;
    float _796 = _780 * _784;
    bool _798 = _702 >= 0.0;
    bool _800 = isnan(_702);
    bool _802 = _798 || _800;
    bool _804 = isnan(0.0);
    bool _806 = _802 || _804;
    float _808 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[78].z, _786);
    float _810 = in.m_57.x;
    float _812 = in.m_57.y;
    float _814 = in.m_57.z;
    bool _816 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _818 = isnan(1.0);
    bool _820 = _816 || _818;
    bool _822 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _824 = _820 || _822;
    float _826 = -_732;
    float _828 = _826 + 1.0;
    int _830 = abs(_794);
    float _832 = -_100;
    float _834 = fma(_832, (*spvDescriptorSet0.vp_c9)._m0[76].x, _666);
    int _836 = _806 ? 0 : 1;
    float _838 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[76].y, _692);
    bool _840 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _842 = isnan(0.0);
    bool _844 = _840 || _842;
    bool _846 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _848 = _844 || _846;
    float _850 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].z, _808);
    float _852 = _796 * (-2.0);
    float _854 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].w, _790);
    int _856 = ~_836;
    int _858 = _856 + 1;
    int _860 = _858 + 1;
    float _862 = _848 ? _828 : 0.0;
    int _864 = _860;
    if (!_788)
    {
        int _866 = ~_836;
        int _868 = _866 + 1;
        _864 = _868;
    }
    int _870 = _864;
    float _872 = fma(_750, _852, _750);
    float _874 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _876 = _730 + _874;
    if (_824)
    {
        float _878 = _862 * _778;
        _110 = _878;
    }
    float _880 = _110;
    float _882 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _884 = _754 + _882;
    float _886 = float(_776);
    float _888 = _876 * _876;
    float _890 = float(_830);
    float _892 = fma(_852, _812, _812);
    bool _894 = !_652;
    int _896 = _894 ? 0 : 1;
    float _898 = fma(_758, _758, _888);
    float _900 = _890 * _886;
    int _902 = abs(_896);
    float _904 = fma(_884, _884, _898);
    float _906 = float(_870);
    float _908 = _132 + _620;
    float _910 = float(_902);
    float _912 = rsqrt(_904);
    float _914 = _136 + (-0.5);
    float _916 = _908 + (-1.0);
    float _918 = _900 * (-2.0);
    float _920 = _910 * _906;
    float _922 = fma(_914, (*spvDescriptorSet0.vp_c9)._m0[196].y, _892);
    float _924 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _926 = _620 + (-0.5);
    float _928 = fma(_918, _814, _814);
    float _930 = _920 * (-2.0);
    float _932 = fma(_924, _918, _924);
    float _934 = fma(_872, _880, _922);
    float _936 = fma(_926, (*spvDescriptorSet0.vp_c9)._m0[196].z, _928);
    float _938 = fma(_704, _930, _704);
    float _940 = fma(_930, _810, _810);
    float _942 = _934 * 0.15915493667125701904296875;
    float _944 = _876 * _912;
    float _946 = _758 * _912;
    float _948 = fma(_932, _880, _936);
    float _950 = in.m_55.x;
    float _952 = in.m_55.y;
    float _954 = in.m_55.z;
    float _956 = -_944;
    float _958 = fma(_956, (*spvDescriptorSet0.vp_c9)._m0[18].w, _876);
    float _960 = -_946;
    float _962 = fma(_960, (*spvDescriptorSet0.vp_c9)._m0[18].w, _758);
    float _964 = _948 * 0.15915493667125701904296875;
    float _966 = in.m_59.x;
    float _968 = in.m_59.y;
    float _970 = in.m_59.z;
    float _972 = _958 * _958;
    float _974 = _884 * _912;
    float _976 = _132 + (-0.5);
    float _978 = in.m_61.x;
    float _980 = in.m_61.y;
    float _982 = in.m_61.z;
    float _984 = fma(_962, _962, _972);
    float _986 = -_974;
    float _988 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[18].w, _884);
    float _990 = fma(_976, (*spvDescriptorSet0.vp_c9)._m0[196].x, _940);
    float _992 = _942 * 6.283185482025146484375;
    float _994 = sin(_992);
    float _996 = fma(_988, _988, _984);
    float _998 = fma(_938, _880, _990);
    float _1000 = _274 * _274;
    float _1002 = _998 * 0.15915493667125701904296875;
    float _1004 = sqrt(_996);
    float _1006 = _596 * _954;
    float _1008 = _594 * _952;
    float _1010 = _592 * _950;
    float _1012 = _942 * 6.283185482025146484375;
    float _1014 = cos(_1012);
    float _1016 = -_968;
    float _1018 = _1016 + _980;
    float _1020 = -_966;
    float _1022 = _1020 + _978;
    float _1024 = -_970;
    float _1026 = _1024 + _982;
    float _1028 = _964 * 6.283185482025146484375;
    float _1030 = cos(_1028);
    float _1032 = fma(_1000, _1018, _968);
    float _1034 = _912 * _1004;
    float _1036 = _1008 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1038 = fma(_1000, _1022, _966);
    float _1040 = _1010 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1042 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1032);
    float _1044 = _1036 * _1034;
    float _1046 = _1002 * 6.283185482025146484375;
    float _1048 = sin(_1046);
    float _1050 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1038);
    float _1052 = _1040 * _1034;
    float _1054 = fma(_1000, _1026, _970);
    float _1056 = _1044 * _1042;
    float _1058 = _1006 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1060 = _1052 * _1050;
    float _1062 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1054);
    float _1064 = _1002 * 6.283185482025146484375;
    float _1066 = cos(_1064);
    float _1068 = _1030 * _1056;
    float _1070 = _994 * _1030;
    float _1072 = _1058 * _1034;
    float _1074 = _1014 * _1030;
    float _1076 = _1072 * _1062;
    float _1078 = _964 * 6.283185482025146484375;
    float _1080 = sin(_1078);
    float _1082 = _1048 * _994;
    float _1084 = _1066 * _1014;
    float _1086 = _1066 * _994;
    float _1088 = _1066 * _1068;
    float _1090 = _1048 * _1014;
    float _1092 = _1048 * _1068;
    float _1094 = fma(_1080, _1084, _1082);
    float _1096 = -_1056;
    float _1098 = _1080 * _1096;
    float _1100 = fma(_1080, _1082, _1084);
    float _1102 = fma(_1094, _1060, _1088);
    float _1104 = -_1090;
    float _1106 = fma(_1080, _1086, _1104);
    float _1108 = -_1086;
    float _1110 = fma(_1080, _1090, _1108);
    float _1112 = fma(_1074, _1060, _1098);
    float _1114 = fma(_1106, _1076, _1102);
    float _1116 = fma(_1110, _1060, _1092);
    float _1118 = fma(_1070, _1076, _1112);
    float _1120 = _1114 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1122 = _1114 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1124 = fma(_1100, _1076, _1116);
    float _1126 = fma(_1118, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1120);
    float _1128 = fma(_1118, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1122);
    float _1130 = fma(_1124, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1126);
    float _1132 = fma(_1124, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1128);
    float _1134 = _754 + _1130;
    float _1136 = _746 + _1132;
    float _1138 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1140 = _1134 + _1138;
    float _1142 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1144 = _1136 + _1142;
    float _1146 = _1140 * _1140;
    float _1148 = fma(_1144, _1144, _1146);
    float _1150 = _1114 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1152 = sqrt(_1148);
    float _1154 = fma(_1118, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1150);
    float _1156 = fma(_1124, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1154);
    float _1158 = _730 + _1156;
    bool _1160 = _1152 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1162 = _1150;
    float _1164 = _1124;
    float _1166 = _1114;
    float _1168 = _1120;
    float _1170 = _1152;
    if (!_1160)
    {
        _1162 = _1136;
    }
    float _1172 = _1162;
    float _1174 = _1172;
    if (!_1160)
    {
        _1164 = _1134;
    }
    float _1176 = _1164;
    float _1178 = _1176;
    if (!_1160)
    {
        _1166 = _1158;
    }
    float _1180 = _1166;
    bool _1182 = !_1160;
    float _1184 = _1180;
    if (!_1182)
    {
        float _1186 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1188 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1190 = _1152 + _1188;
        float _1192 = _1158 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1194 = _1190 * _1186;
        float _1196 = rsqrt(_1148);
        float _1198 = _1194 * 0.15915493667125701904296875;
        float _1200 = _1198 * 6.283185482025146484375;
        float _1202 = cos(_1200);
        float _1204 = _1198 * 6.283185482025146484375;
        float _1206 = sin(_1204);
        float _1208 = _1202 + (-1.0);
        float _1210 = _1208 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1212 = fma(_1206, _1192, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1214 = fma(_1158, _1202, _1210);
        float _1216 = _1196 * _1212;
        float _1218 = fma(_1144, _1216, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1220 = fma(_1140, _1216, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1184 = _1214;
        _1174 = _1218;
        _1178 = _1220;
        _1168 = _1198;
        _1170 = _1196;
    }
    float _1222 = _1184;
    float _1224 = _1174;
    float _1226 = _1178;
    float _1228 = _1168;
    float _1230 = _1170;
    float _1232 = -_944;
    float _1234 = fma(_1232, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1222);
    float _1236 = -_946;
    float _1238 = fma(_1236, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1224);
    float _1240 = -_974;
    float _1242 = fma(_1240, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1226);
    float _1244 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1246 = _1234 + _1244;
    float _1248 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1250 = _1238 + _1248;
    float _1252 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1254 = _1242 + _1252;
    float _1256 = _1246 * _1246;
    float _1258 = fma(_1250, _1250, _1256);
    float _1260 = fma(_1254, _1254, _1258);
    float _1262 = rsqrt(_1260);
    float _1264 = sqrt(_1260);
    float _1266 = _1262 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1268 = _1250 * _1266;
    float _1270 = _1254 * _1266;
    float _1272 = _1268 * _1268;
    float _1274 = _1270 * _1270;
    float _1276 = _1272 + _1274;
    float _1278 = sqrt(_1276);
    bool _1280 = _1278 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1282 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1284 = _1278 + _1282;
    float _1286 = _1262;
    float _1288 = _1284;
    float _1290 = _1228;
    float _1292 = _1246;
    if (_1280)
    {
        float _1294 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1286 = _1294;
    }
    float _1296 = _1286;
    float _1298 = _1296;
    if (_1280)
    {
        float _1300 = _1284 * _1296;
        _1288 = _1300;
    }
    float _1302 = _1288;
    if (_1280)
    {
        float _1304 = rsqrt(_1276);
        _1298 = _1304;
    }
    float _1306 = _1298;
    float _1308 = _1306;
    if (_1280)
    {
        float _1310 = _1302 * 0.15915493667125701904296875;
        _1290 = _1310;
    }
    float _1312 = _1290;
    float _1314 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1316 = _1254;
    float _1318 = _1312;
    if (_1280)
    {
        float _1320 = _1312 * 6.283185482025146484375;
        float _1322 = sin(_1320);
        _1316 = _1322;
    }
    float _1324 = _1316;
    float _1326 = precise::max(0.0, _1314);
    float _1328 = _1230;
    float _1330 = _1326;
    if (_1280)
    {
        float _1332 = _1312 * 6.283185482025146484375;
        float _1334 = cos(_1332);
        _1328 = _1334;
    }
    float _1336 = _1328;
    float _1338 = -_1266;
    float _1340 = -_1326;
    float _1342 = fma(_1246, _1338, _1340);
    if (_1280)
    {
        float _1344 = _1342 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1292 = _1344;
    }
    float _1346 = _1292;
    float _1348 = _1324;
    float _1350 = _1346;
    if (_1280)
    {
        float _1352 = fma(_1324, _1346, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1348 = _1352;
    }
    float _1354 = _1348;
    float _1356 = _1354;
    if (!_1280)
    {
        _1350 = _1342;
    }
    float _1358 = _1350;
    float _1360 = _1358;
    if (_1280)
    {
        float _1362 = _1306 * _1354;
        _736 = _1362;
    }
    float _1364 = _736;
    if (!_1280)
    {
        _1308 = _1268;
    }
    float _1366 = _1308;
    float _1368 = _1366;
    float _1370 = _1336;
    if (_1280)
    {
        float _1372 = _1336 + (-1.0);
        _1330 = _1372;
    }
    float _1374 = _1330;
    float _1376 = _1374;
    if (_1280)
    {
        float _1378 = _1268 * _1364;
        _1368 = _1378;
    }
    float _1380 = _1368;
    if (!_1280)
    {
        _1356 = _1272;
    }
    float _1382 = _1356;
    float _1384 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1386 = _1382;
    if (_1280)
    {
        float _1388 = _1374 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1318 = _1388;
    }
    float _1390 = _1318;
    if (!_1280)
    {
        _1376 = _1270;
    }
    float _1392 = _1376;
    float _1394 = _1392;
    if (_1280)
    {
        float _1396 = _1270 * _1364;
        _1394 = _1396;
    }
    float _1398 = _1394;
    if (_1280)
    {
        float _1400 = _1380 * _1380;
        _1386 = _1400;
    }
    float _1402 = _1386;
    if (_1280)
    {
        float _1404 = fma(_1342, _1336, _1390);
        _1360 = _1404;
    }
    float _1406 = _1360;
    if (!_1280)
    {
        _1370 = _1274;
    }
    float _1408 = _1370;
    float _1410 = _1408;
    if (_1280)
    {
        float _1412 = _1398 * _1398;
        _1410 = _1412;
    }
    float _1414 = _1410;
    float _1416 = fma(_1406, _1406, _1402);
    float _1418 = _1234 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1420 = _1416 + _1414;
    float _1422 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1418);
    float _1424 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1426 = fma(_1264, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1424);
    float _1428 = precise::clamp(_1426, 0.0, 1.0);
    float _1430 = _1234 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1432 = rsqrt(_1420);
    float _1434 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1422);
    float _1436 = -_1428;
    float _1438 = _1436 + 1.0;
    float _1440 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1430);
    float _1442 = _1234 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1444 = _1434 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1446 = _1234 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1448 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1440);
    float _1450 = abs(_1438);
    float _1452 = log2(_1450);
    float _1454 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1442);
    float _1456 = _1444 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1458 = _1448 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1460 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1446);
    float _1462 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1454);
    float _1464 = -_1456;
    float _1466 = fma(_1464, _1384, 1.0);
    float _1468 = _1432 * _1380;
    float _1470 = _1462 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1472 = _1432 * _1406;
    float _1474 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1476 = _1468 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1478 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1460);
    float _1480 = _1432 * _1398;
    float _1482 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1474);
    float _1484 = _1452 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1486 = -_1476;
    float _1488 = fma(_1472, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1486);
    float _1490 = log2(_1466);
    float _1492 = _1478 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1494 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1482);
    float _1496 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1498 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1494);
    float _1500 = exp2(_1484);
    float _1502 = -_1480;
    float _1504 = fma(_1502, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1488);
    float _1506 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1508 = fma(_1504, -0.5, 0.5);
    float _1510 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1506);
    float _1512 = fma(_1504, 0.5, 0.5);
    float _1514 = 1.0 / _1498;
    float _1516 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1496);
    float _1518 = _1472 + 1.0;
    float _1520 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1510);
    float _1522 = fma(_1512, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1524 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1516);
    float _1526 = _1490 * 0.693147182464599609375;
    float _1528 = sqrt(_1508);
    float _1530 = -_1472;
    float _1532 = fma(_1500, _1518, _1530);
    float _1534 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1520);
    float _1536 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1524);
    float _1538 = fma(_1512, _1522, -0.212114393711090087890625);
    float _1540 = _1526 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1542 = fma(_1532, 0.5, 0.5);
    float _1544 = _1534 * _1514;
    float _1546 = _1536 * _1514;
    float _1548 = fma(_1512, _1538, 1.570728778839111328125);
    float _1550 = fma(_1544, 0.5, 0.5);
    float _1552 = fma(_1546, -0.5, 0.5);
    float _1554 = _1528 * 0.636619746685028076171875;
    float3 _4360 = float3(_1550, _1552, _1540);
    float _1556 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4360, float3(0.0), isnan(_4360)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4360, float3(0.0), isnan(_4360)), level(0.0)).x;
    float3 _4371 = float3(_1550, _1552, _1540);
    float4 _1559 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4371, float3(0.0), isnan(_4371)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4371, float3(0.0), isnan(_4371)), level(0.0)).xyzw;
    float _1561 = _1559.x;
    float _1563 = _1559.y;
    float _1565 = _1559.z;
    float _1567 = _1559.w;
    float _1569 = -_1548;
    float _1571 = fma(_1554, _1569, 1.0);
    float2 _4393 = float2(_1571, _1542);
    float3 _1575 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4393, float2(0.0), isnan(_4393)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4393, float2(0.0), isnan(_4393)), level(0.0)).xyz;
    float _1577 = _1575.x;
    float _1579 = _1575.y;
    float _1581 = _1575.z;
    float _1583 = in.m_51.w;
    float _1585 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1587 = in.m_63.y;
    float _1589 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1591 = _1589 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1593 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1595 = _1593 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _1597 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1599 = _1597 != 0;
    float _1601 = 1.0 / _1591;
    bool _1603 = _136 > 0.5;
    float _1605 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1607 = _1605 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1609 = in.m_63.x;
    int _1611 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1613 = _1611 != 0;
    float _1615 = 1.0 / _1595;
    float _1617 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1619 = _1617 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    int _1621 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1623 = _1621 != 0;
    if (_1599)
    {
        bool _1625 = _132 > 0.5;
        _738 = _1625;
    }
    bool _1627 = _738;
    bool _1629 = _1583 > 0.5;
    float _1631 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1633 = _1631 + (*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _1635 = 1.0 / _1607;
    float _1637 = -_1587;
    float _1639 = _1637 + 1.0;
    int _1641 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1643 = _1641 != 0;
    float _1645 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1647 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1645;
    float _1649 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1651 = _1649 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1653 = 1.0 / _1619;
    float _1655 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1657 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1655;
    float _1659 = _1651 * _1601;
    float _1661 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _1663 = _1661 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1665 = -(*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1667 = (*spvDescriptorSet0.vp_c9)._m0[120].x + _1665;
    float _1669 = 1.0 / _1633;
    int _1671 = _1629 ? as_type<int>(_1639) : as_type<int>(_1587);
    float _1673 = _1663 * _1635;
    bool _1675 = _1629;
    float _1677 = _1587;
    int _1679 = as_type<int>(_1639);
    if (_1613)
    {
        bool _1681 = _620 > 0.5;
        _1675 = _1681;
    }
    bool _1683 = _1675;
    float _1685 = _1647 * _1615;
    bool _1687 = _618 >= (*spvDescriptorSet0.vp_c9)._m0[120].w;
    bool _1689 = isnan(_618);
    bool _1691 = _1687 || _1689;
    bool _1693 = isnan((*spvDescriptorSet0.vp_c9)._m0[120].w);
    bool _1695 = _1691 || _1693;
    float _1697 = float(_1695);
    bool _1699 = _618 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1701 = isnan(_618);
    bool _1703 = _1699 || _1701;
    bool _1705 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1707 = _1703 || _1705;
    float _1709 = float(_1707);
    float _1711 = _1657 * _1653;
    float _1713 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1715 = _618 + _1713;
    float _1717 = -_1697;
    float _1719 = _1717 + 1.0;
    float _1721 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1723 = _618 + _1721;
    float _1725 = -_1709;
    float _1727 = _1725 + 1.0;
    float _1729 = fma(_1659, _1715, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _1731 = _618 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1733 = isnan(_618);
    bool _1735 = _1731 || _1733;
    bool _1737 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1739 = _1735 || _1737;
    float _1741 = float(_1739);
    float _1743 = _1709 * _1719;
    float _1745 = _1667 * _1669;
    bool _1747 = _618 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1749 = isnan(_618);
    bool _1751 = _1747 || _1749;
    bool _1753 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1755 = _1751 || _1753;
    float _1757 = float(_1755);
    float _1759 = fma(_1685, _1723, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1761 = -_1741;
    float _1763 = _1761 + 1.0;
    float _1765 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1767 = _618 + _1765;
    float _1769 = _1623 ? as_type<float>(_1671) : _1587;
    float _1771 = _1757 * _1727;
    bool _1773 = _618 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1775 = isnan(_618);
    bool _1777 = _1773 || _1775;
    bool _1779 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1781 = _1777 || _1779;
    float _1783 = float(_1781);
    float _1785 = -_1757;
    float _1787 = _1785 + 1.0;
    bool _1789 = _618 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1791 = isnan(_618);
    bool _1793 = _1789 || _1791;
    bool _1795 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1797 = _1793 || _1795;
    float _1799 = float(_1797);
    float _1801 = _1769 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1803 = _1767;
    if (_1643)
    {
        float _1805 = _1603 ? _1639 : _1587;
        _1677 = _1805;
    }
    float _1807 = _1677;
    float _1809 = _1783 * _1763;
    float _1811 = -_1783;
    float _1813 = _1811 + 1.0;
    float _1815 = _1741 * _1787;
    float _1817 = fma(_1711, _1767, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1819 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1821 = _618 + _1819;
    float _1823 = _1799 * _1813;
    float _1825 = -_1799;
    float _1827 = _1825 + 1.0;
    float _1829 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1831 = _618 + _1829;
    float _1833 = fma(_1673, _1821, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1835 = _1759 * _1823;
    float _1837 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1839 = fma(_1745, _1831, (*spvDescriptorSet0.vp_c9)._m0[119].x);
    int _1841 = as_type<int>(_1809);
    float _1843 = _1807;
    if (_1599)
    {
        float _1845 = -_1609;
        float _1847 = _1845 + 1.0;
        _1679 = as_type<int>(_1847);
    }
    int _1849 = _1679;
    float _1851 = fma(_1827, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1835);
    if (!_1599)
    {
        _1803 = _1609;
    }
    float _1853 = _1803;
    float _1855 = _1585 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1857 = fma(_1729, _1809, _1851);
    float _1859 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1861 = _1853;
    if (_1599)
    {
        float _1863 = _1627 ? as_type<float>(_1849) : _1609;
        _1861 = _1863;
    }
    float _1865 = _1861;
    float _1867 = fma(_1855, _1807, -0.5);
    float _1869 = fma(_1817, _1815, _1857);
    if (_1613)
    {
        float _1871 = -_1609;
        float _1873 = _1871 + 1.0;
        _1841 = as_type<int>(_1873);
    }
    int _1875 = _1841;
    if (!_1613)
    {
        _1843 = _1609;
    }
    float _1877 = _1843;
    float _1879 = -_838;
    float _1881 = fma(_854, _1867, _1879);
    float _1883 = fma(_1833, _1771, _1869);
    float _1885 = _1837 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1887 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1889 = fma(_1839, _1743, _1883);
    float _1891 = fma(_1885, _1865, -0.5);
    float _1893 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1895 = fma(_1697, (*spvDescriptorSet0.vp_c9)._m0[120].x, _1889);
    float _1897 = _1452 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1899 = fma(_850, _1891, _834);
    float _1901 = _1801 * _1859;
    float _1903 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1905 = _1877;
    if (_1613)
    {
        float _1907 = _1683 ? as_type<float>(_1875) : _1609;
        _1905 = _1907;
    }
    float _1909 = _1905;
    float _1911 = exp2(_1897);
    float _1913 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1915 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1917 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1903);
    float _1919 = in.m_61.w;
    float _1921 = _1909 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1923 = _1893 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1925 = _1913 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1927 = _1915 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1929 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1917);
    float _1931 = _1921 * _1887;
    float _1933 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1935 = _1881 + 0.5;
    float _1937 = _1899 + 0.5;
    float _1939 = -_1911;
    float _1941 = _1939 + 1.0;
    out.m_65.x = _1923;
    out.m_65.y = _1925;
    out.m_65.z = _1927;
    float _1943 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1929);
    float _1945 = _1895 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1947 = _1941 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1949 = _1498 * 0.5;
    out.m_67.x = _1937;
    out.m_67.y = _1935;
    out.m_67.z = _1931;
    out.m_67.w = _1901;
    out.m_69.w = _1919;
    float _1951 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1953 = _1534 + _1498;
    float _1955 = _1933 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1957 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _1959 = _1943 + _1957;
    float _1961 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1963 = _1951 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1965 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1967 = _1953 * 0.5;
    float _1969 = fma(_1536, -0.5, _1949);
    float _1971 = -_1947;
    float _1973 = _1971 + 1.0;
    float _1975 = _1498 + _1959;
    float _1977 = _1961 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.gl_Position.x = _1534;
    out.gl_Position.y = _1536;
    out.gl_Position.z = _1959;
    out.gl_Position.w = _1498;
    float _1979 = _1975 * 0.5;
    out.m_71.x = _1955;
    out.m_71.y = _1963;
    out.m_71.z = _1977;
    out.m_71.w = _1945;
    out.m_73.x = _1967;
    out.m_73.y = _1969;
    out.m_73.z = _1979;
    out.m_73.w = _1498;
    out.m_49.x = _1965;
    float _1981 = _1947 * _1556;
    float _1983 = _1567 * _1973;
    float _1985 = _1567 * _1981;
    float _1987 = _1581 * _1981;
    float _1989 = fma(_1577, _1985, _1561);
    float _1991 = fma(_1579, _1985, _1563);
    float _1993 = fma(_1567, _1987, _1565);
    out.m_75.x = _1989;
    out.m_75.y = _1991;
    out.m_75.z = _1993;
    out.m_75.w = _1983;
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
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
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
        float _2062 = as_type<float>(_118);
        out.gl_Position.z = _2062;
    }
    if (!_104)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _2125 = as_type<float>(_148);
        out.gl_Position.z = _2125;
    }
    if (_142)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _256 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _258 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _260 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _262 = fma(_252, _168, _256);
    float _264 = fma(_252, _166, _258);
    float _266 = fma(_252, _170, _260);
    float _268 = fma(_262, _150, _174);
    float _270 = fma(_264, _150, _172);
    float _272 = fma(_266, _150, _176);
    float _274 = _100 * _152;
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
        _292 = _274;
    }
    _294 = false;
    float _296 = _292;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _300 = _296 + _298;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _304 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _302;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _308 = _306 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _312 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _310;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _316 = _314 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _318 = 1.0 / _304;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _320;
    float _324 = 1.0 / _312;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _328 = _296 + _326;
    bool _330 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _332 = isnan(_296);
    bool _334 = _330 || _332;
    bool _336 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _338 = _334 || _336;
    float _340 = float(_338);
    float _342 = 1.0 / _308;
    float _344 = _328 * _318;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _348 = _296 + _346;
    bool _350 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _352 = isnan(_296);
    bool _354 = _350 || _352;
    bool _356 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _358 = _354 || _356;
    float _360 = float(_358);
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _362;
    bool _366 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _368 = 1.0 / _316;
    float _370 = _348 * _324;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _374 = _296 + _372;
    bool _376 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _378 = isnan(_296);
    bool _380 = _376 || _378;
    bool _382 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _384 = _380 || _382;
    float _386 = float(_384);
    float _388 = fma(_364, _344, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _390 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _392 = isnan(_296);
    bool _394 = _390 || _392;
    bool _396 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _398 = _394 || _396;
    float _400 = float(_398);
    float _402 = 1.0 / _322;
    float _404 = _300 * _342;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _408 = _296 + _406;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _410;
    float _414 = fma(_412, _344, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _416 = _374 * _368;
    float _418 = -_386;
    float _420 = _418 + 1.0;
    bool _422 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _424 = isnan(_296);
    bool _426 = _422 || _424;
    bool _428 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _430 = _426 || _428;
    float _432 = float(_430);
    float _434 = _360 * _420;
    float _436 = -_360;
    float _438 = _436 + 1.0;
    float _440 = -_432;
    float _442 = _440 + 1.0;
    float _444 = _408 * _402;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _446;
    float _450 = _400 * _438;
    float _452 = -_400;
    float _454 = _452 + 1.0;
    float _456 = fma(_448, _344, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _458 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _460 = isnan(_296);
    bool _462 = _458 || _460;
    bool _464 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _466 = _462 || _464;
    float _468 = float(_466);
    float _470 = _432 * _454;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _474 = _472 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _478 = _476 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _482 = _480 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _484 = _468 * _442;
    float _486 = -_468;
    float _488 = _486 + 1.0;
    float _490 = fma(_474, _404, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _492 = fma(_478, _404, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _494 = fma(_482, _404, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _496 = _340 * _488;
    float _498 = -_340;
    float _500 = _498 + 1.0;
    float _502 = _456 * _496;
    float _504 = _388 * _496;
    float _506 = _414 * _496;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _510 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _508;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _512;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _518 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _516;
    float _520 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[143].x, _502);
    float _522 = fma(_510, _370, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _524 = fma(_514, _370, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _526 = fma(_518, _370, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _528 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[143].y, _504);
    float _530 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[143].z, _506);
    float _532 = fma(_490, _484, _520);
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _536 = _534 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _538 = fma(_492, _484, _528);
    float _540 = fma(_522, _470, _532);
    float _542 = fma(_536, _416, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _546 = _544 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _548 = fma(_494, _484, _530);
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _552 = _550 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _554 = fma(_524, _470, _538);
    float _556 = fma(_546, _416, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _558 = fma(_526, _470, _548);
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _562 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _560;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _564;
    float _568 = fma(_552, _416, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _570;
    float _574 = fma(_542, _450, _540);
    float _576 = fma(_562, _444, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _578 = fma(_566, _444, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _580 = fma(_572, _444, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _582 = fma(_556, _450, _554);
    float _584 = fma(_568, _450, _558);
    float _586 = fma(_576, _434, _574);
    float _588 = fma(_578, _434, _582);
    float _590 = fma(_580, _434, _584);
    float _592 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[148].x, _586);
    float _594 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[148].y, _588);
    float _596 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[148].z, _590);
    bool _598 = !_366;
    float _614;
    if (!_598)
    {
        float _600 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _602 = _132 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _604 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[11].y, _100);
        float _606 = _604 * _600;
        float _608 = floor(_606);
        float _610 = -_608;
        float _612 = _606 + _610;
        _614 = _612;
        _616 = true;
    }
    else
    {
        _614 = _274;
    }
    _616 = false;
    float _618 = _614;
    float _620 = in.m_51.z;
    float _622 = _132 * 2.0;
    float _624 = _136 * 2.0;
    float _626 = _268 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _628 = _268 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _630 = floor(_622);
    float _632 = _268 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _634 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[4].x, _626);
    float _636 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[5].x, _628);
    float _638 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[6].x, _632);
    float _640 = _132 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _642 = floor(_624);
    float _644 = _136 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _648 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _650 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _652 = _650 != 0;
    int _654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _656 = _654 != 0;
    int _658 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _660 = _658 != 0;
    float _662 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[4].z, _634);
    float _664 = -_646;
    float _666 = fma(_640, 2.0, _664);
    float _668 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _670 = log2(_668);
    bool _672 = _630 > 0.0;
    float _674 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[5].z, _636);
    float _676 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[6].z, _638);
    bool _678 = _630 >= 0.0;
    bool _680 = isnan(_630);
    bool _682 = _678 || _680;
    bool _684 = isnan(0.0);
    bool _686 = _682 || _684;
    float _688 = _132 + _136;
    float _690 = _620 * 2.0;
    float _692 = fma(_644, -2.0, _648);
    float _694 = _688 + (-1.0);
    int _696 = _686 ? 0 : 1;
    float _698 = _136 + _620;
    bool _700 = _642 > 0.0;
    float _702 = floor(_690);
    float _704 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _706 = _642 >= 0.0;
    bool _708 = isnan(_642);
    bool _710 = _706 || _708;
    bool _712 = isnan(0.0);
    bool _714 = _710 || _712;
    float _716 = _670 * _100;
    bool _718 = !_656;
    int _720 = _718 ? 0 : 1;
    float _722 = _698 + (-1.0);
    int _724 = ~_696;
    int _726 = _724 + 1;
    int _728 = _726 + 1;
    float _730 = _674 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _732 = exp2(_716);
    int _734 = _728;
    float _736 = _730;
    bool _738 = _656;
    if (!_672)
    {
        int _740 = ~_696;
        int _742 = _740 + 1;
        _734 = _742;
    }
    int _744 = _734;
    float _746 = _662 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _748 = _714 ? 0 : 1;
    float _750 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _752 = abs(_720);
    float _754 = _676 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _756 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _758 = _746 + _756;
    int _760 = ~_748;
    int _762 = _760 + 1;
    int _764 = _762 + 1;
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _768 = 1.0 + _766;
    int _770 = _764;
    if (!_700)
    {
        int _772 = ~_748;
        int _774 = _772 + 1;
        _770 = _774;
    }
    int _776 = _770;
    float _778 = 1.0 / _768;
    float _780 = float(_752);
    float _782 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _784 = float(_744);
    float _786 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _788 = _702 > 0.0;
    float _790 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[78].w, _782);
    bool _792 = !_660;
    int _794 = _792 ? 0 : 1;
    float _796 = _780 * _784;
    bool _798 = _702 >= 0.0;
    bool _800 = isnan(_702);
    bool _802 = _798 || _800;
    bool _804 = isnan(0.0);
    bool _806 = _802 || _804;
    float _808 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[78].z, _786);
    float _810 = in.m_57.x;
    float _812 = in.m_57.y;
    float _814 = in.m_57.z;
    bool _816 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _818 = isnan(1.0);
    bool _820 = _816 || _818;
    bool _822 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _824 = _820 || _822;
    float _826 = -_732;
    float _828 = _826 + 1.0;
    int _830 = abs(_794);
    float _832 = -_100;
    float _834 = fma(_832, (*spvDescriptorSet0.vp_c9)._m0[76].x, _666);
    int _836 = _806 ? 0 : 1;
    float _838 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[76].y, _692);
    bool _840 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _842 = isnan(0.0);
    bool _844 = _840 || _842;
    bool _846 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _848 = _844 || _846;
    float _850 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].z, _808);
    float _852 = _796 * (-2.0);
    float _854 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].w, _790);
    int _856 = ~_836;
    int _858 = _856 + 1;
    int _860 = _858 + 1;
    float _862 = _848 ? _828 : 0.0;
    int _864 = _860;
    if (!_788)
    {
        int _866 = ~_836;
        int _868 = _866 + 1;
        _864 = _868;
    }
    int _870 = _864;
    float _872 = fma(_750, _852, _750);
    float _874 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _876 = _730 + _874;
    if (_824)
    {
        float _878 = _862 * _778;
        _110 = _878;
    }
    float _880 = _110;
    float _882 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _884 = _754 + _882;
    float _886 = float(_776);
    float _888 = _876 * _876;
    float _890 = float(_830);
    float _892 = fma(_852, _812, _812);
    bool _894 = !_652;
    int _896 = _894 ? 0 : 1;
    float _898 = fma(_758, _758, _888);
    float _900 = _890 * _886;
    int _902 = abs(_896);
    float _904 = fma(_884, _884, _898);
    float _906 = float(_870);
    float _908 = _132 + _620;
    float _910 = float(_902);
    float _912 = rsqrt(_904);
    float _914 = _136 + (-0.5);
    float _916 = _908 + (-1.0);
    float _918 = _900 * (-2.0);
    float _920 = _910 * _906;
    float _922 = fma(_914, (*spvDescriptorSet0.vp_c9)._m0[196].y, _892);
    float _924 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _926 = _620 + (-0.5);
    float _928 = fma(_918, _814, _814);
    float _930 = _920 * (-2.0);
    float _932 = fma(_924, _918, _924);
    float _934 = fma(_872, _880, _922);
    float _936 = fma(_926, (*spvDescriptorSet0.vp_c9)._m0[196].z, _928);
    float _938 = fma(_704, _930, _704);
    float _940 = fma(_930, _810, _810);
    float _942 = _934 * 0.15915493667125701904296875;
    float _944 = _876 * _912;
    float _946 = _758 * _912;
    float _948 = fma(_932, _880, _936);
    float _950 = in.m_55.x;
    float _952 = in.m_55.y;
    float _954 = in.m_55.z;
    float _956 = -_944;
    float _958 = fma(_956, (*spvDescriptorSet0.vp_c9)._m0[18].w, _876);
    float _960 = -_946;
    float _962 = fma(_960, (*spvDescriptorSet0.vp_c9)._m0[18].w, _758);
    float _964 = _948 * 0.15915493667125701904296875;
    float _966 = in.m_59.x;
    float _968 = in.m_59.y;
    float _970 = in.m_59.z;
    float _972 = _958 * _958;
    float _974 = _884 * _912;
    float _976 = _132 + (-0.5);
    float _978 = in.m_61.x;
    float _980 = in.m_61.y;
    float _982 = in.m_61.z;
    float _984 = fma(_962, _962, _972);
    float _986 = -_974;
    float _988 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[18].w, _884);
    float _990 = fma(_976, (*spvDescriptorSet0.vp_c9)._m0[196].x, _940);
    float _992 = _942 * 6.283185482025146484375;
    float _994 = sin(_992);
    float _996 = fma(_988, _988, _984);
    float _998 = fma(_938, _880, _990);
    float _1000 = _274 * _274;
    float _1002 = _998 * 0.15915493667125701904296875;
    float _1004 = sqrt(_996);
    float _1006 = _596 * _954;
    float _1008 = _594 * _952;
    float _1010 = _592 * _950;
    float _1012 = _942 * 6.283185482025146484375;
    float _1014 = cos(_1012);
    float _1016 = -_968;
    float _1018 = _1016 + _980;
    float _1020 = -_966;
    float _1022 = _1020 + _978;
    float _1024 = -_970;
    float _1026 = _1024 + _982;
    float _1028 = _964 * 6.283185482025146484375;
    float _1030 = cos(_1028);
    float _1032 = fma(_1000, _1018, _968);
    float _1034 = _912 * _1004;
    float _1036 = _1008 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1038 = fma(_1000, _1022, _966);
    float _1040 = _1010 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1042 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1032);
    float _1044 = _1036 * _1034;
    float _1046 = _1002 * 6.283185482025146484375;
    float _1048 = sin(_1046);
    float _1050 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1038);
    float _1052 = _1040 * _1034;
    float _1054 = fma(_1000, _1026, _970);
    float _1056 = _1044 * _1042;
    float _1058 = _1006 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1060 = _1052 * _1050;
    float _1062 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1054);
    float _1064 = _1002 * 6.283185482025146484375;
    float _1066 = cos(_1064);
    float _1068 = _1030 * _1056;
    float _1070 = _994 * _1030;
    float _1072 = _1058 * _1034;
    float _1074 = _1014 * _1030;
    float _1076 = _1072 * _1062;
    float _1078 = _964 * 6.283185482025146484375;
    float _1080 = sin(_1078);
    float _1082 = _1048 * _994;
    float _1084 = _1066 * _1014;
    float _1086 = _1066 * _994;
    float _1088 = _1066 * _1068;
    float _1090 = _1048 * _1014;
    float _1092 = _1048 * _1068;
    float _1094 = fma(_1080, _1084, _1082);
    float _1096 = -_1056;
    float _1098 = _1080 * _1096;
    float _1100 = fma(_1080, _1082, _1084);
    float _1102 = fma(_1094, _1060, _1088);
    float _1104 = -_1090;
    float _1106 = fma(_1080, _1086, _1104);
    float _1108 = -_1086;
    float _1110 = fma(_1080, _1090, _1108);
    float _1112 = fma(_1074, _1060, _1098);
    float _1114 = fma(_1106, _1076, _1102);
    float _1116 = fma(_1110, _1060, _1092);
    float _1118 = fma(_1070, _1076, _1112);
    float _1120 = _1114 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1122 = _1114 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1124 = fma(_1100, _1076, _1116);
    float _1126 = fma(_1118, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1120);
    float _1128 = fma(_1118, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1122);
    float _1130 = fma(_1124, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1126);
    float _1132 = fma(_1124, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1128);
    float _1134 = _754 + _1130;
    float _1136 = _746 + _1132;
    float _1138 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1140 = _1134 + _1138;
    float _1142 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1144 = _1136 + _1142;
    float _1146 = _1140 * _1140;
    float _1148 = fma(_1144, _1144, _1146);
    float _1150 = _1114 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1152 = sqrt(_1148);
    float _1154 = fma(_1118, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1150);
    float _1156 = fma(_1124, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1154);
    float _1158 = _730 + _1156;
    bool _1160 = _1152 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1162 = _1150;
    float _1164 = _1124;
    float _1166 = _1114;
    float _1168 = _1120;
    float _1170 = _1152;
    if (!_1160)
    {
        _1162 = _1136;
    }
    float _1172 = _1162;
    float _1174 = _1172;
    if (!_1160)
    {
        _1164 = _1134;
    }
    float _1176 = _1164;
    float _1178 = _1176;
    if (!_1160)
    {
        _1166 = _1158;
    }
    float _1180 = _1166;
    bool _1182 = !_1160;
    float _1184 = _1180;
    if (!_1182)
    {
        float _1186 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1188 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1190 = _1152 + _1188;
        float _1192 = _1158 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1194 = _1190 * _1186;
        float _1196 = rsqrt(_1148);
        float _1198 = _1194 * 0.15915493667125701904296875;
        float _1200 = _1198 * 6.283185482025146484375;
        float _1202 = cos(_1200);
        float _1204 = _1198 * 6.283185482025146484375;
        float _1206 = sin(_1204);
        float _1208 = _1202 + (-1.0);
        float _1210 = _1208 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1212 = fma(_1206, _1192, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1214 = fma(_1158, _1202, _1210);
        float _1216 = _1196 * _1212;
        float _1218 = fma(_1144, _1216, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1220 = fma(_1140, _1216, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1184 = _1214;
        _1174 = _1218;
        _1178 = _1220;
        _1168 = _1198;
        _1170 = _1196;
    }
    float _1222 = _1184;
    float _1224 = _1174;
    float _1226 = _1178;
    float _1228 = _1168;
    float _1230 = _1170;
    float _1232 = -_944;
    float _1234 = fma(_1232, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1222);
    float _1236 = -_946;
    float _1238 = fma(_1236, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1224);
    float _1240 = -_974;
    float _1242 = fma(_1240, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1226);
    float _1244 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1246 = _1234 + _1244;
    float _1248 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1250 = _1238 + _1248;
    float _1252 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1254 = _1242 + _1252;
    float _1256 = _1246 * _1246;
    float _1258 = fma(_1250, _1250, _1256);
    float _1260 = fma(_1254, _1254, _1258);
    float _1262 = rsqrt(_1260);
    float _1264 = sqrt(_1260);
    float _1266 = _1262 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1268 = _1250 * _1266;
    float _1270 = _1254 * _1266;
    float _1272 = _1268 * _1268;
    float _1274 = _1270 * _1270;
    float _1276 = _1272 + _1274;
    float _1278 = sqrt(_1276);
    bool _1280 = _1278 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1282 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1284 = _1278 + _1282;
    float _1286 = _1262;
    float _1288 = _1284;
    float _1290 = _1228;
    float _1292 = _1246;
    if (_1280)
    {
        float _1294 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1286 = _1294;
    }
    float _1296 = _1286;
    float _1298 = _1296;
    if (_1280)
    {
        float _1300 = _1284 * _1296;
        _1288 = _1300;
    }
    float _1302 = _1288;
    if (_1280)
    {
        float _1304 = rsqrt(_1276);
        _1298 = _1304;
    }
    float _1306 = _1298;
    float _1308 = _1306;
    if (_1280)
    {
        float _1310 = _1302 * 0.15915493667125701904296875;
        _1290 = _1310;
    }
    float _1312 = _1290;
    float _1314 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1316 = _1254;
    float _1318 = _1312;
    if (_1280)
    {
        float _1320 = _1312 * 6.283185482025146484375;
        float _1322 = sin(_1320);
        _1316 = _1322;
    }
    float _1324 = _1316;
    float _1326 = precise::max(0.0, _1314);
    float _1328 = _1230;
    float _1330 = _1326;
    if (_1280)
    {
        float _1332 = _1312 * 6.283185482025146484375;
        float _1334 = cos(_1332);
        _1328 = _1334;
    }
    float _1336 = _1328;
    float _1338 = -_1266;
    float _1340 = -_1326;
    float _1342 = fma(_1246, _1338, _1340);
    if (_1280)
    {
        float _1344 = _1342 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1292 = _1344;
    }
    float _1346 = _1292;
    float _1348 = _1324;
    float _1350 = _1346;
    if (_1280)
    {
        float _1352 = fma(_1324, _1346, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1348 = _1352;
    }
    float _1354 = _1348;
    float _1356 = _1354;
    if (!_1280)
    {
        _1350 = _1342;
    }
    float _1358 = _1350;
    float _1360 = _1358;
    if (_1280)
    {
        float _1362 = _1306 * _1354;
        _736 = _1362;
    }
    float _1364 = _736;
    if (!_1280)
    {
        _1308 = _1268;
    }
    float _1366 = _1308;
    float _1368 = _1366;
    float _1370 = _1336;
    if (_1280)
    {
        float _1372 = _1336 + (-1.0);
        _1330 = _1372;
    }
    float _1374 = _1330;
    float _1376 = _1374;
    if (_1280)
    {
        float _1378 = _1268 * _1364;
        _1368 = _1378;
    }
    float _1380 = _1368;
    if (!_1280)
    {
        _1356 = _1272;
    }
    float _1382 = _1356;
    float _1384 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1386 = _1382;
    if (_1280)
    {
        float _1388 = _1374 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1318 = _1388;
    }
    float _1390 = _1318;
    if (!_1280)
    {
        _1376 = _1270;
    }
    float _1392 = _1376;
    float _1394 = _1392;
    if (_1280)
    {
        float _1396 = _1270 * _1364;
        _1394 = _1396;
    }
    float _1398 = _1394;
    if (_1280)
    {
        float _1400 = _1380 * _1380;
        _1386 = _1400;
    }
    float _1402 = _1386;
    if (_1280)
    {
        float _1404 = fma(_1342, _1336, _1390);
        _1360 = _1404;
    }
    float _1406 = _1360;
    if (!_1280)
    {
        _1370 = _1274;
    }
    float _1408 = _1370;
    float _1410 = _1408;
    if (_1280)
    {
        float _1412 = _1398 * _1398;
        _1410 = _1412;
    }
    float _1414 = _1410;
    float _1416 = fma(_1406, _1406, _1402);
    float _1418 = _1234 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1420 = _1416 + _1414;
    float _1422 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1418);
    float _1424 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1426 = fma(_1264, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1424);
    float _1428 = precise::clamp(_1426, 0.0, 1.0);
    float _1430 = _1234 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1432 = rsqrt(_1420);
    float _1434 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1422);
    float _1436 = -_1428;
    float _1438 = _1436 + 1.0;
    float _1440 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1430);
    float _1442 = _1234 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1444 = _1434 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1446 = _1234 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1448 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1440);
    float _1450 = abs(_1438);
    float _1452 = log2(_1450);
    float _1454 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1442);
    float _1456 = _1444 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1458 = _1448 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1460 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1446);
    float _1462 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1454);
    float _1464 = -_1456;
    float _1466 = fma(_1464, _1384, 1.0);
    float _1468 = _1432 * _1380;
    float _1470 = _1462 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1472 = _1432 * _1406;
    float _1474 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1476 = _1468 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1478 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1460);
    float _1480 = _1432 * _1398;
    float _1482 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1474);
    float _1484 = _1452 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1486 = -_1476;
    float _1488 = fma(_1472, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1486);
    float _1490 = log2(_1466);
    float _1492 = _1478 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1494 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1482);
    float _1496 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1498 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1494);
    float _1500 = exp2(_1484);
    float _1502 = -_1480;
    float _1504 = fma(_1502, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1488);
    float _1506 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1508 = fma(_1504, -0.5, 0.5);
    float _1510 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1506);
    float _1512 = fma(_1504, 0.5, 0.5);
    float _1514 = 1.0 / _1498;
    float _1516 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1496);
    float _1518 = _1472 + 1.0;
    float _1520 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1510);
    float _1522 = fma(_1512, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1524 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1516);
    float _1526 = _1490 * 0.693147182464599609375;
    float _1528 = sqrt(_1508);
    float _1530 = -_1472;
    float _1532 = fma(_1500, _1518, _1530);
    float _1534 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1520);
    float _1536 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1524);
    float _1538 = fma(_1512, _1522, -0.212114393711090087890625);
    float _1540 = _1526 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1542 = fma(_1532, 0.5, 0.5);
    float _1544 = _1534 * _1514;
    float _1546 = _1536 * _1514;
    float _1548 = fma(_1512, _1538, 1.570728778839111328125);
    float _1550 = fma(_1544, 0.5, 0.5);
    float _1552 = fma(_1546, -0.5, 0.5);
    float _1554 = _1528 * 0.636619746685028076171875;
    float3 _4360 = float3(_1550, _1552, _1540);
    float _1556 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4360, float3(0.0), isnan(_4360)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4360, float3(0.0), isnan(_4360)), level(0.0)).x;
    float3 _4371 = float3(_1550, _1552, _1540);
    float4 _1559 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4371, float3(0.0), isnan(_4371)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4371, float3(0.0), isnan(_4371)), level(0.0)).xyzw;
    float _1561 = _1559.x;
    float _1563 = _1559.y;
    float _1565 = _1559.z;
    float _1567 = _1559.w;
    float _1569 = -_1548;
    float _1571 = fma(_1554, _1569, 1.0);
    float2 _4393 = float2(_1571, _1542);
    float3 _1575 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4393, float2(0.0), isnan(_4393)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4393, float2(0.0), isnan(_4393)), level(0.0)).xyz;
    float _1577 = _1575.x;
    float _1579 = _1575.y;
    float _1581 = _1575.z;
    float _1583 = in.m_51.w;
    float _1585 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1587 = in.m_63.y;
    float _1589 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1591 = _1589 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1593 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1595 = _1593 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _1597 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1599 = _1597 != 0;
    float _1601 = 1.0 / _1591;
    bool _1603 = _136 > 0.5;
    float _1605 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1607 = _1605 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1609 = in.m_63.x;
    int _1611 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1613 = _1611 != 0;
    float _1615 = 1.0 / _1595;
    float _1617 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1619 = _1617 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    int _1621 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1623 = _1621 != 0;
    if (_1599)
    {
        bool _1625 = _132 > 0.5;
        _738 = _1625;
    }
    bool _1627 = _738;
    bool _1629 = _1583 > 0.5;
    float _1631 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1633 = _1631 + (*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _1635 = 1.0 / _1607;
    float _1637 = -_1587;
    float _1639 = _1637 + 1.0;
    int _1641 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1643 = _1641 != 0;
    float _1645 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1647 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1645;
    float _1649 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1651 = _1649 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1653 = 1.0 / _1619;
    float _1655 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1657 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1655;
    float _1659 = _1651 * _1601;
    float _1661 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _1663 = _1661 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1665 = -(*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1667 = (*spvDescriptorSet0.vp_c9)._m0[120].x + _1665;
    float _1669 = 1.0 / _1633;
    int _1671 = _1629 ? as_type<int>(_1639) : as_type<int>(_1587);
    float _1673 = _1663 * _1635;
    bool _1675 = _1629;
    float _1677 = _1587;
    int _1679 = as_type<int>(_1639);
    if (_1613)
    {
        bool _1681 = _620 > 0.5;
        _1675 = _1681;
    }
    bool _1683 = _1675;
    float _1685 = _1647 * _1615;
    bool _1687 = _618 >= (*spvDescriptorSet0.vp_c9)._m0[120].w;
    bool _1689 = isnan(_618);
    bool _1691 = _1687 || _1689;
    bool _1693 = isnan((*spvDescriptorSet0.vp_c9)._m0[120].w);
    bool _1695 = _1691 || _1693;
    float _1697 = float(_1695);
    bool _1699 = _618 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1701 = isnan(_618);
    bool _1703 = _1699 || _1701;
    bool _1705 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1707 = _1703 || _1705;
    float _1709 = float(_1707);
    float _1711 = _1657 * _1653;
    float _1713 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1715 = _618 + _1713;
    float _1717 = -_1697;
    float _1719 = _1717 + 1.0;
    float _1721 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1723 = _618 + _1721;
    float _1725 = -_1709;
    float _1727 = _1725 + 1.0;
    float _1729 = fma(_1659, _1715, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _1731 = _618 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1733 = isnan(_618);
    bool _1735 = _1731 || _1733;
    bool _1737 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1739 = _1735 || _1737;
    float _1741 = float(_1739);
    float _1743 = _1709 * _1719;
    float _1745 = _1667 * _1669;
    bool _1747 = _618 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1749 = isnan(_618);
    bool _1751 = _1747 || _1749;
    bool _1753 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1755 = _1751 || _1753;
    float _1757 = float(_1755);
    float _1759 = fma(_1685, _1723, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1761 = -_1741;
    float _1763 = _1761 + 1.0;
    float _1765 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1767 = _618 + _1765;
    float _1769 = _1623 ? as_type<float>(_1671) : _1587;
    float _1771 = _1757 * _1727;
    bool _1773 = _618 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1775 = isnan(_618);
    bool _1777 = _1773 || _1775;
    bool _1779 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1781 = _1777 || _1779;
    float _1783 = float(_1781);
    float _1785 = -_1757;
    float _1787 = _1785 + 1.0;
    bool _1789 = _618 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1791 = isnan(_618);
    bool _1793 = _1789 || _1791;
    bool _1795 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1797 = _1793 || _1795;
    float _1799 = float(_1797);
    float _1801 = _1769 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1803 = _1767;
    if (_1643)
    {
        float _1805 = _1603 ? _1639 : _1587;
        _1677 = _1805;
    }
    float _1807 = _1677;
    float _1809 = _1783 * _1763;
    float _1811 = -_1783;
    float _1813 = _1811 + 1.0;
    float _1815 = _1741 * _1787;
    float _1817 = fma(_1711, _1767, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1819 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1821 = _618 + _1819;
    float _1823 = _1799 * _1813;
    float _1825 = -_1799;
    float _1827 = _1825 + 1.0;
    float _1829 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1831 = _618 + _1829;
    float _1833 = fma(_1673, _1821, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1835 = _1759 * _1823;
    float _1837 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1839 = fma(_1745, _1831, (*spvDescriptorSet0.vp_c9)._m0[119].x);
    int _1841 = as_type<int>(_1809);
    float _1843 = _1807;
    if (_1599)
    {
        float _1845 = -_1609;
        float _1847 = _1845 + 1.0;
        _1679 = as_type<int>(_1847);
    }
    int _1849 = _1679;
    float _1851 = fma(_1827, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1835);
    if (!_1599)
    {
        _1803 = _1609;
    }
    float _1853 = _1803;
    float _1855 = _1585 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1857 = fma(_1729, _1809, _1851);
    float _1859 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1861 = _1853;
    if (_1599)
    {
        float _1863 = _1627 ? as_type<float>(_1849) : _1609;
        _1861 = _1863;
    }
    float _1865 = _1861;
    float _1867 = fma(_1855, _1807, -0.5);
    float _1869 = fma(_1817, _1815, _1857);
    if (_1613)
    {
        float _1871 = -_1609;
        float _1873 = _1871 + 1.0;
        _1841 = as_type<int>(_1873);
    }
    int _1875 = _1841;
    if (!_1613)
    {
        _1843 = _1609;
    }
    float _1877 = _1843;
    float _1879 = -_838;
    float _1881 = fma(_854, _1867, _1879);
    float _1883 = fma(_1833, _1771, _1869);
    float _1885 = _1837 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1887 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1889 = fma(_1839, _1743, _1883);
    float _1891 = fma(_1885, _1865, -0.5);
    float _1893 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1895 = fma(_1697, (*spvDescriptorSet0.vp_c9)._m0[120].x, _1889);
    float _1897 = _1452 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1899 = fma(_850, _1891, _834);
    float _1901 = _1801 * _1859;
    float _1903 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1905 = _1877;
    if (_1613)
    {
        float _1907 = _1683 ? as_type<float>(_1875) : _1609;
        _1905 = _1907;
    }
    float _1909 = _1905;
    float _1911 = exp2(_1897);
    float _1913 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1915 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1917 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1903);
    float _1919 = in.m_61.w;
    float _1921 = _1909 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1923 = _1893 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1925 = _1913 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1927 = _1915 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1929 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1917);
    float _1931 = _1921 * _1887;
    float _1933 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1935 = _1881 + 0.5;
    float _1937 = _1899 + 0.5;
    float _1939 = -_1911;
    float _1941 = _1939 + 1.0;
    out.m_65.x = _1923;
    out.m_65.y = _1925;
    out.m_65.z = _1927;
    float _1943 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1929);
    float _1945 = _1895 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1947 = _1941 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1949 = _1498 * 0.5;
    out.m_67.x = _1937;
    out.m_67.y = _1935;
    out.m_67.z = _1931;
    out.m_67.w = _1901;
    out.m_69.w = _1919;
    float _1951 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1953 = _1534 + _1498;
    float _1955 = _1933 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1957 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _1959 = _1943 + _1957;
    float _1961 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1963 = _1951 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1965 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1967 = _1953 * 0.5;
    float _1969 = fma(_1536, -0.5, _1949);
    float _1971 = -_1947;
    float _1973 = _1971 + 1.0;
    float _1975 = _1498 + _1959;
    float _1977 = _1961 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.gl_Position.x = _1534;
    out.gl_Position.y = _1536;
    out.gl_Position.z = _1959;
    out.gl_Position.w = _1498;
    float _1979 = _1975 * 0.5;
    out.m_71.x = _1955;
    out.m_71.y = _1963;
    out.m_71.z = _1977;
    out.m_71.w = _1945;
    out.m_73.x = _1967;
    out.m_73.y = _1969;
    out.m_73.z = _1979;
    out.m_73.w = _1498;
    out.m_49.x = _1965;
    float _1981 = _1947 * _1556;
    float _1983 = _1567 * _1973;
    float _1985 = _1567 * _1981;
    float _1987 = _1581 * _1981;
    float _1989 = fma(_1577, _1985, _1561);
    float _1991 = fma(_1579, _1985, _1563);
    float _1993 = fma(_1567, _1987, _1565);
    out.m_75.x = _1989;
    out.m_75.y = _1991;
    out.m_75.z = _1993;
    out.m_75.w = _1983;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

