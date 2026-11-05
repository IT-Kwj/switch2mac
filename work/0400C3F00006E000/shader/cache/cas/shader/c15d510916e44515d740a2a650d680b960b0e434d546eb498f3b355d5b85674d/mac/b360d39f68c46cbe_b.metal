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
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_A [[id(6)]];
    sampler vp_t_tcb_ASmplr [[id(7)]];
    texture2d<float> vp_t_tcb_24 [[id(8)]];
    sampler vp_t_tcb_24Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_32 [[id(10)]];
    sampler vp_t_tcb_32Smplr [[id(11)]];
    texture3d<float> vp_t_tcb_30 [[id(12)]];
    sampler vp_t_tcb_30Smplr [[id(13)]];
    texture2d<float> vp_t_tcb_1C [[id(14)]];
    sampler vp_t_tcb_1CSmplr [[id(15)]];
    sampler vp_t_tcb_ASmplr_w [[id(16)]];
    sampler vp_t_tcb_24Smplr_w [[id(17)]];
    sampler vp_t_tcb_32Smplr_w [[id(18)]];
    sampler vp_t_tcb_30Smplr_w [[id(19)]];
    sampler vp_t_tcb_1CSmplr_w [[id(20)]];
    constant dm_border_t* dm_border [[id(21)]];
};

struct main0_out
{
    float4 m_63 [[user(locn0)]];
    float4 m_65 [[user(locn1)]];
    float4 m_91 [[user(locn2)]];
    float4 m_53 [[user(locn3)]];
    float4 m_93 [[user(locn4)]];
    float4 m_101 [[user(locn5)]];
    float4 m_83 [[user(locn6)]];
    float4 m_103 [[user(locn7)]];
    float4 m_95 [[user(locn8)]];
    float4 m_89 [[user(locn9)]];
    float4 m_81 [[user(locn10)]];
    float4 m_107 [[user(locn11)]];
    float4 m_55 [[user(locn12)]];
    float4 m_59 [[user(locn13)]];
    float4 m_99 [[user(locn14)]];
    float4 m_111 [[user(locn15)]];
    float4 m_105 [[user(locn16)]];
    float4 m_109 [[user(locn17)]];
    float4 m_113 [[user(locn18)]];
    float4 m_67 [[user(locn19)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_97 [[attribute(0)]];
    float4 m_71 [[attribute(1)]];
    float4 m_73 [[attribute(2)]];
    float4 m_75 [[attribute(3)]];
    float4 m_48 [[attribute(5)]];
    float4 m_50 [[attribute(6)]];
    float4 m_85 [[attribute(7)]];
    float4 m_77 [[attribute(8)]];
    float4 m_57 [[attribute(9)]];
    float4 m_61 [[attribute(10)]];
    float4 m_87 [[attribute(11)]];
    float4 m_69 [[attribute(12)]];
    float4 m_79 [[attribute(13)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_113 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3768 = false;
    bool _1256 = false;
    bool _1160 = false;
    bool _1000 = false;
    bool _790 = false;
    bool _618 = false;
    bool _296 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _127 = in.m_48.w;
    float _129 = in.m_50.w;
    float _131 = trunc(_127);
    int _134 = int(_131);
    float _136 = -_129;
    float _138 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _138;
    bool _142 = _134 >= 1;
    float _144 = 0.0;
    float _146 = _129;
    if (!_142)
    {
        _144 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _144;
    if (!_142)
    {
        out.m_55.x = 0.0;
    }
    int _150 = 0;
    if (!_142)
    {
        float _152 = _148 * 5.0;
        _150 = as_type<int>(_152);
    }
    int _154 = _150;
    int _156 = _154;
    if (!_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4025 = as_type<float>(_154);
        out.gl_Position.z = _4025;
    }
    if (!_142)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _158 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _160 = isnan(_129);
    bool _162 = _158 || _160;
    bool _164 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _166 = _162 || _164;
    float _168 = float(_134);
    float _170 = in.m_57.x;
    bool _172 = _138 >= _168;
    bool _174 = !_166;
    bool _176 = _172 || _174;
    float _178 = 1.0 / _168;
    if (_176)
    {
        _146 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _180 = _146;
    if (_176)
    {
        out.m_55.x = 0.0;
    }
    if (_176)
    {
        float _182 = _180 * 5.0;
        _156 = as_type<int>(_182);
    }
    int _184 = _156;
    float _186 = _138 * _178;
    out.m_59.x = _170;
    float _188 = _186;
    if (_176)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4090 = as_type<float>(_184);
        out.gl_Position.z = _4090;
    }
    out.m_53.x = _186;
    if (_176)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _190 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _192 = _138 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _194 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _196 = _194 != 0;
    int _198 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _200 = _198 != 0;
    int _202 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _204 = _202 != 0;
    float _206 = _192 * _190;
    float _208 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[20].x, _206);
    float _210 = _208 * 6.283185482025146484375;
    float _212 = floor(_208);
    float _214 = _210 * 0.15915493667125701904296875;
    bool _216 = !_196;
    int _218 = _216 ? 0 : 1;
    int _220 = abs(_218);
    float _222 = _214 * 6.283185482025146484375;
    float _224 = cos(_222);
    bool _226 = !_204;
    int _228 = _226 ? 0 : 1;
    bool _230 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _232 = abs(_228);
    float _234 = -_212;
    float _236 = _208 + _234;
    bool _238 = !_200;
    int _240 = _238 ? 0 : 1;
    float _242 = float(_220);
    int _244 = abs(_240);
    float _246 = -_236;
    float _248 = fma(_246, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _250 = _236 < 0.5;
    float _252 = float(_250);
    float _254 = fma(_224, 0.5, 0.5);
    float _256 = abs(_248);
    float _258 = _242 * _256;
    float _260 = float(_232);
    float _262 = -_252;
    float _264 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _266 = -_254;
    float _268 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _270 = float(_244);
    float _272 = fma(_260, _268, _258);
    float _274 = abs(_264);
    float _276 = fma(_270, _274, _272);
    bool _278 = !_230;
    float _294;
    if (!_278)
    {
        float _280 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _282 = _170 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _284 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[12].x, _138);
        float _286 = _284 * _280;
        float _288 = floor(_286);
        float _290 = -_288;
        float _292 = _286 + _290;
        _294 = _292;
        _296 = true;
    }
    else
    {
        _294 = _186;
    }
    _296 = false;
    float _298 = _294;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _302 = _298 + _300;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _306 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _304;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _310 = _308 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _314 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _312;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _318 = _316 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _320 = 1.0 / _306;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _324 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _322;
    bool _326 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _328 = isnan(_298);
    bool _330 = _326 || _328;
    bool _332 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _334 = _330 || _332;
    float _336 = float(_334);
    bool _338 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _340 = isnan(_298);
    bool _342 = _338 || _340;
    bool _344 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _346 = _342 || _344;
    float _348 = float(_346);
    float _350 = 1.0 / _314;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _354 = _298 + _352;
    float _356 = 1.0 / _310;
    float _358 = _354 * _320;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _362 = _298 + _360;
    bool _364 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _366 = isnan(_298);
    bool _368 = _364 || _366;
    bool _370 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _372 = _368 || _370;
    float _374 = float(_372);
    bool _376 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _378 = 1.0 / _324;
    float _380 = _362 * _350;
    bool _382 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _384 = isnan(_298);
    bool _386 = _382 || _384;
    bool _388 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _390 = _386 || _388;
    float _392 = float(_390);
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _396 = _298 + _394;
    bool _398 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _400 = isnan(_298);
    bool _402 = _398 || _400;
    bool _404 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _406 = _402 || _404;
    float _408 = float(_406);
    float _410 = 1.0 / _318;
    float _412 = _302 * _356;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _416 = _298 + _414;
    float _418 = -_392;
    float _420 = _418 + 1.0;
    bool _422 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _424 = isnan(_298);
    bool _426 = _422 || _424;
    bool _428 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _430 = _426 || _428;
    float _432 = float(_430);
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _436 = _434 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _438 = _416 * _378;
    float _440 = -_374;
    float _442 = _440 + 1.0;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _444;
    float _448 = fma(_436, _412, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _450 = _336 * _442;
    float _452 = -_336;
    float _454 = _452 + 1.0;
    float _456 = fma(_446, _358, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _458 = _396 * _410;
    float _460 = _408 * _420;
    float _462 = -_408;
    float _464 = _462 + 1.0;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _466;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _470;
    float _474 = _432 * _454;
    float _476 = _348 * _464;
    float _478 = -_348;
    float _480 = _478 + 1.0;
    float _482 = fma(_468, _358, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _484 = fma(_472, _358, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _486 = _456 * _474;
    float _488 = _374 * _480;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _492 = _490 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _496 = _494 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _498 = -_432;
    float _500 = _498 + 1.0;
    float _502 = _482 * _474;
    float _504 = fma(_492, _412, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _506 = fma(_496, _412, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _508 = _484 * _474;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _510;
    float _514 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[143].x, _486);
    float _516 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[143].z, _502);
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _522 = fma(_512, _380, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _524 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[143].y, _508);
    float _526 = fma(_448, _450, _514);
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _528;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _534 = _532 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _536;
    float _540 = fma(_520, _458, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _542 = fma(_506, _450, _516);
    float _544 = fma(_522, _488, _526);
    float _546 = fma(_530, _380, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _548 = fma(_534, _458, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _550 = fma(_504, _450, _524);
    float _552 = fma(_538, _380, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _556 = _554 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _558 = fma(_546, _488, _550);
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _562 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _560;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _564;
    float _568 = fma(_556, _458, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _570 = fma(_552, _488, _542);
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _572;
    float _576 = fma(_548, _476, _544);
    float _578 = fma(_562, _438, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _580 = fma(_566, _438, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _582 = fma(_574, _438, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _584 = fma(_568, _476, _558);
    float _586 = fma(_540, _476, _570);
    float _588 = fma(_578, _460, _576);
    float _590 = fma(_580, _460, _584);
    float _592 = fma(_582, _460, _586);
    float _594 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[148].x, _588);
    float _596 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[148].y, _590);
    float _598 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[148].z, _592);
    bool _600 = !_376;
    float _616;
    if (!_600)
    {
        float _602 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _604 = _170 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _606 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[11].x, _138);
        float _608 = _606 * _602;
        float _610 = floor(_608);
        float _612 = -_610;
        float _614 = _608 + _612;
        _616 = _614;
        _618 = true;
    }
    else
    {
        _616 = _186;
    }
    _618 = false;
    float _620 = _616;
    float _622 = in.m_61.x;
    float _624 = in.m_61.y;
    float _626 = in.m_61.z;
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _630 = _620 + _628;
    bool _632 = _620 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _634 = isnan(_620);
    bool _636 = _632 || _634;
    bool _638 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _640 = _636 || _638;
    float _642 = float(_640);
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _644;
    bool _648 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _650 = 1.0 / _646;
    float _652 = _596 * _624;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _656 = _654 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _658 = _598 * _626;
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _662 = _620 + _660;
    bool _664 = _620 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _666 = isnan(_620);
    bool _668 = _664 || _666;
    bool _670 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _672 = _668 || _670;
    float _674 = float(_672);
    float _676 = _630 * _650;
    bool _678 = _620 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _680 = isnan(_620);
    bool _682 = _678 || _680;
    bool _684 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _686 = _682 || _684;
    float _688 = float(_686);
    float _690 = 1.0 / _656;
    float _692 = -_642;
    float _694 = _692 + 1.0;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _696;
    float _700 = -_688;
    float _702 = _700 + 1.0;
    float _704 = _688 * _694;
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _706;
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _712 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _710;
    float _714 = _674 * _702;
    float _716 = fma(_698, _676, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _718 = fma(_708, _676, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _720 = fma(_712, _676, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _722 = -_674;
    float _724 = _722 + 1.0;
    float _726 = _594 * _622;
    float _728 = _720 * _714;
    float _730 = _662 * _690;
    float _732 = _718 * _714;
    float _734 = _716 * _714;
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _738 = _736 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _742 = _740 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _746 = _744 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _748 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[107].x, _732);
    float _750 = fma(_738, _730, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _752 = fma(_742, _730, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _754 = fma(_746, _730, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _756 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[107].y, _728);
    float _758 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[107].z, _734);
    float _760 = fma(_750, _704, _748);
    float _762 = fma(_752, _704, _756);
    float _764 = fma(_754, _704, _758);
    float _766 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[109].x, _760);
    float _768 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[109].y, _762);
    float _770 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[109].z, _764);
    bool _772 = !_648;
    float _788;
    if (!_772)
    {
        float _774 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _776 = _170 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _778 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[11].y, _138);
        float _780 = _778 * _774;
        float _782 = floor(_780);
        float _784 = -_782;
        float _786 = _780 + _784;
        _788 = _786;
        _790 = true;
    }
    else
    {
        _788 = _186;
    }
    _790 = false;
    float _792 = _788;
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _796 = _792 + _794;
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _800 = _798 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _804 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _802;
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _808 = _806 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _810 = _792 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _812 = isnan(_792);
    bool _814 = _810 || _812;
    bool _816 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _818 = _814 || _816;
    float _820 = float(_818);
    float _822 = 1.0 / _800;
    float _824 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _826 = _824 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _828 = _792 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _830 = isnan(_792);
    bool _832 = _828 || _830;
    bool _834 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _836 = _832 || _834;
    float _838 = float(_836);
    bool _840 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _842 = 1.0 / _808;
    float _844 = _804 * _822;
    bool _846 = _792 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _848 = isnan(_792);
    bool _850 = _846 || _848;
    bool _852 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _854 = _850 || _852;
    float _856 = float(_854);
    float _858 = 1.0 / _826;
    float _860 = -_820;
    float _862 = _860 + 1.0;
    float _864 = fma(_844, _796, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _866 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _868 = _866 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _870 = _792 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _872 = isnan(_792);
    bool _874 = _870 || _872;
    bool _876 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _878 = _874 || _876;
    float _880 = float(_878);
    float _882 = -_856;
    float _884 = _882 + 1.0;
    float _886 = _856 * _862;
    float _888 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _890 = _888 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _892 = 1.0 / _868;
    float _894 = -_880;
    float _896 = _894 + 1.0;
    float _898 = _838 * _884;
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _902 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _900;
    float _904 = _890 * _842;
    float _906 = _820 * _896;
    float _908 = _864 * _898;
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _912 = _792 + _910;
    float _914 = -_838;
    float _916 = _914 + 1.0;
    bool _918 = _792 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _920 = isnan(_792);
    bool _922 = _918 || _920;
    bool _924 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _926 = _922 || _924;
    float _928 = float(_926);
    float _930 = _902 * _858;
    float _932 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _934 = _932 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _936 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _938 = _792 + _936;
    float _940 = fma(_904, _912, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _942 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[115].x, _908);
    float _944 = -_928;
    float _946 = _944 + 1.0;
    float _948 = _934 * _892;
    float _950 = fma(_930, _938, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _952 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _954 = _792 + _952;
    float _956 = fma(_940, _886, _942);
    float _958 = _880 * _946;
    float _960 = _768 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _962 = fma(_948, _954, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _964 = fma(_950, _906, _956);
    float _966 = _960 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _968 = fma(_962, _958, _964);
    float _970 = _766 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _972 = _770 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _974 = fma(_928, (*spvDescriptorSet0.vp_c9)._m0[119].x, _968);
    float _976 = _970 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _978 = _972 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _980 = _974 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_63.x = _976;
    out.m_63.y = _966;
    out.m_63.z = _978;
    out.m_63.w = _980;
    bool _982 = !_840;
    float _998;
    if (!_982)
    {
        float _984 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _986 = _170 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _988 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[11].z, _138);
        float _990 = _988 * _984;
        float _992 = floor(_990);
        float _994 = -_992;
        float _996 = _990 + _994;
        _998 = _996;
        _1000 = true;
    }
    else
    {
        _998 = _186;
    }
    _1000 = false;
    float _1002 = _998;
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1006 = _1002 + _1004;
    bool _1008 = _1002 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1010 = isnan(_1002);
    bool _1012 = _1008 || _1010;
    bool _1014 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1016 = _1012 || _1014;
    float _1018 = float(_1016);
    float _1020 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1022 = _1002 + _1020;
    bool _1024 = _1002 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1026 = isnan(_1002);
    bool _1028 = _1024 || _1026;
    bool _1030 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1032 = _1028 || _1030;
    float _1034 = float(_1032);
    float _1036 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1038 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1036;
    float _1040 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1042 = _1040 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1044 = _1002 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1046 = isnan(_1002);
    bool _1048 = _1044 || _1046;
    bool _1050 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1052 = _1048 || _1050;
    float _1054 = float(_1052);
    float _1056 = -_1018;
    float _1058 = _1056 + 1.0;
    float _1060 = 1.0 / _1042;
    float _1062 = _1054 * _1058;
    float _1064 = -_1054;
    float _1066 = _1064 + 1.0;
    float _1068 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1070 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1068;
    bool _1072 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1074 = 1.0 / _1038;
    float _1076 = _1034 * _1066;
    float _1078 = -_1034;
    float _1080 = _1078 + 1.0;
    float _1082 = _1022 * _1060;
    float _1084 = _1006 * _1074;
    float _1086 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1088 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1086;
    float _1090 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1092 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1090;
    float _1094 = fma(_1070, _1084, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1096 = fma(_1088, _1084, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1098 = fma(_1092, _1084, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1100 = _1094 * _1076;
    float _1102 = _1096 * _1076;
    float _1104 = _1098 * _1076;
    float _1106 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1108 = _1106 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1110 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1112 = _1110 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1114 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1116 = _1114 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1118 = fma(_1080, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1100);
    float _1120 = fma(_1080, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1102);
    float _1122 = fma(_1108, _1082, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1124 = fma(_1112, _1082, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1126 = fma(_1116, _1082, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1128 = fma(_1080, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1104);
    float _1130 = fma(_1122, _1062, _1118);
    float _1132 = fma(_1124, _1062, _1120);
    float _1134 = fma(_1126, _1062, _1128);
    float _1136 = fma(_1018, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1130);
    float _1138 = fma(_1018, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1132);
    float _1140 = fma(_1018, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1134);
    bool _1142 = !_1072;
    float _1158;
    if (!_1142)
    {
        float _1144 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1146 = _170 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1148 = fma(_1146, (*spvDescriptorSet0.vp_c9)._m0[11].w, _138);
        float _1150 = _1148 * _1144;
        float _1152 = floor(_1150);
        float _1154 = -_1152;
        float _1156 = _1150 + _1154;
        _1158 = _1156;
        _1160 = true;
    }
    else
    {
        _1158 = _186;
    }
    _1160 = false;
    float _1162 = _1158;
    bool _1164 = _1162 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1166 = isnan(_1162);
    bool _1168 = _1164 || _1166;
    bool _1170 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1172 = _1168 || _1170;
    float _1174 = float(_1172);
    float _1176 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1178 = _1176 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1180 = _1162 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1182 = isnan(_1162);
    bool _1184 = _1180 || _1182;
    bool _1186 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1188 = _1184 || _1186;
    float _1190 = float(_1188);
    float _1192 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1194 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1192;
    float _1196 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1198 = _1162 + _1196;
    float _1200 = -_1174;
    float _1202 = _1200 + 1.0;
    bool _1204 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1206 = 1.0 / _1178;
    float _1208 = _1190 * _1202;
    float _1210 = -_1190;
    float _1212 = _1210 + 1.0;
    float _1214 = _1194 * _1206;
    float _1216 = _1140 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1218 = fma(_1214, _1198, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1220 = _1138 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1222 = _1216 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1224 = _1218 * _1208;
    float _1226 = _1220 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1228 = fma(_1212, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1224);
    float _1230 = _1136 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1232 = fma(_1174, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1228);
    float _1234 = _1230 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1236 = _1232 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_65.x = _1234;
    out.m_65.y = _1226;
    out.m_65.z = _1222;
    out.m_65.w = _1236;
    bool _1238 = !_1204;
    float _1254;
    if (!_1238)
    {
        float _1240 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1242 = _170 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1244 = fma(_1242, (*spvDescriptorSet0.vp_c9)._m0[14].x, _138);
        float _1246 = _1244 * _1240;
        float _1248 = floor(_1246);
        float _1250 = -_1248;
        float _1252 = _1246 + _1250;
        _1254 = _1252;
        _1256 = true;
    }
    else
    {
        _1254 = _186;
    }
    _1256 = false;
    float _1258 = _1254;
    float _1260 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1262 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _1260;
    float _1264 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1266 = _1264 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1268 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1270 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _1268;
    float _1272 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1274 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _1272;
    float _1276 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1278 = _1276 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1280 = 1.0 / _1262;
    float _1282 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1284 = _1282 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1286 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1288 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _1286;
    bool _1290 = _1258 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1292 = isnan(_1258);
    bool _1294 = _1290 || _1292;
    bool _1296 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1298 = _1294 || _1296;
    float _1300 = float(_1298);
    float _1302 = 1.0 / _1266;
    float _1304 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1306 = _1258 + _1304;
    bool _1308 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _1310 = 1.0 / _1278;
    float _1312 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1314 = _1258 + _1312;
    float _1316 = _1306 * _1280;
    bool _1318 = _1258 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1320 = isnan(_1258);
    bool _1322 = _1318 || _1320;
    bool _1324 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1326 = _1322 || _1324;
    float _1328 = float(_1326);
    float _1330 = 1.0 / _1274;
    float _1332 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1334 = _1258 + _1332;
    float _1336 = _1314 * _1302;
    float _1338 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1340 = _1258 + _1338;
    float _1342 = 1.0 / _1270;
    float _1344 = 1.0 / _1288;
    float _1346 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1348 = _1258 + _1346;
    float _1350 = _1334 * _1330;
    float _1352 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1354 = _1258 + _1352;
    bool _1356 = _1258 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1358 = isnan(_1258);
    bool _1360 = _1356 || _1358;
    bool _1362 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1364 = _1360 || _1362;
    float _1366 = float(_1364);
    float _1368 = _1348 * _1310;
    bool _1370 = _1258 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1372 = isnan(_1258);
    bool _1374 = _1370 || _1372;
    bool _1376 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1378 = _1374 || _1376;
    float _1380 = float(_1378);
    float _1382 = _1340 * _1342;
    float _1384 = -_1328;
    float _1386 = _1384 + 1.0;
    float _1388 = -_1380;
    float _1390 = _1388 + 1.0;
    bool _1392 = _1258 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1394 = isnan(_1258);
    bool _1396 = _1392 || _1394;
    bool _1398 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1400 = _1396 || _1398;
    float _1402 = float(_1400);
    float _1404 = _1380 * _1386;
    float _1406 = 1.0 / _1284;
    float _1408 = _1366 * _1390;
    float _1410 = _1354 * _1344;
    bool _1412 = _1258 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1414 = isnan(_1258);
    bool _1416 = _1412 || _1414;
    bool _1418 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1420 = _1416 || _1418;
    float _1422 = float(_1420);
    float _1424 = -_1366;
    float _1426 = _1424 + 1.0;
    float _1428 = -_1422;
    float _1430 = _1428 + 1.0;
    float _1432 = _1422 * _1426;
    float _1434 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1436 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1434;
    float _1438 = -(*spvDescriptorSet0.vp_c9)._m0[159].z;
    float _1440 = (*spvDescriptorSet0.vp_c9)._m0[160].z + _1438;
    float _1442 = _1402 * _1430;
    float _1444 = -_1402;
    float _1446 = _1444 + 1.0;
    bool _1448 = _1258 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1450 = isnan(_1258);
    bool _1452 = _1448 || _1450;
    bool _1454 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1456 = _1452 || _1454;
    float _1458 = float(_1456);
    float _1460 = fma(_1436, _1316, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1462 = fma(_1440, _1316, (*spvDescriptorSet0.vp_c9)._m0[159].z);
    float _1464 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1466 = _1258 + _1464;
    bool _1468 = _1258 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1470 = isnan(_1258);
    bool _1472 = _1468 || _1470;
    bool _1474 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1476 = _1472 || _1474;
    float _1478 = float(_1476);
    float _1480 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1482 = _1480 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1484 = -_1458;
    float _1486 = _1484 + 1.0;
    float _1488 = _1300 * _1446;
    float _1490 = -_1300;
    float _1492 = _1490 + 1.0;
    float _1494 = _1466 * _1406;
    float _1496 = _1478 * _1486;
    float _1498 = -_1478;
    float _1500 = _1498 + 1.0;
    float _1502 = _1458 * _1492;
    float _1504 = -(*spvDescriptorSet0.vp_c9)._m0[160].z;
    float _1506 = _1504 + (*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _1508 = _1460 * _1496;
    float _1510 = _1462 * _1496;
    float _1512 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1514 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1512;
    float _1516 = fma(_1482, _1336, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1518 = fma(_1500, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1508);
    float _1520 = -(*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _1522 = (*spvDescriptorSet0.vp_c9)._m0[162].z + _1520;
    float _1524 = fma(_1506, _1336, (*spvDescriptorSet0.vp_c9)._m0[160].z);
    float _1526 = fma(_1500, (*spvDescriptorSet0.vp_c9)._m0[159].z, _1510);
    float _1528 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1530 = _1528 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1532 = fma(_1514, _1382, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1534 = fma(_1516, _1502, _1518);
    float _1536 = fma(_1522, _1382, (*spvDescriptorSet0.vp_c9)._m0[161].z);
    float _1538 = fma(_1524, _1502, _1526);
    float _1540 = -(*spvDescriptorSet0.vp_c9)._m0[162].z;
    float _1542 = _1540 + (*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _1544 = fma(_1532, _1488, _1534);
    float _1546 = -(*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _1548 = (*spvDescriptorSet0.vp_c9)._m0[164].z + _1546;
    float _1550 = fma(_1536, _1488, _1538);
    float _1552 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1554 = _1552 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1556 = -(*spvDescriptorSet0.vp_c9)._m0[164].z;
    float _1558 = _1556 + (*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _1560 = fma(_1530, _1368, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1562 = fma(_1542, _1368, (*spvDescriptorSet0.vp_c9)._m0[162].z);
    float _1564 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1566 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1564;
    float _1568 = fma(_1548, _1350, (*spvDescriptorSet0.vp_c9)._m0[163].z);
    float _1570 = fma(_1554, _1494, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1572 = fma(_1558, _1494, (*spvDescriptorSet0.vp_c9)._m0[164].z);
    float _1574 = fma(_1566, _1350, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1576 = fma(_1560, _1442, _1544);
    float _1578 = fma(_1562, _1442, _1550);
    float _1580 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1582 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1580;
    float _1584 = -(*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _1586 = (*spvDescriptorSet0.vp_c9)._m0[166].z + _1584;
    float _1588 = fma(_1574, _1432, _1576);
    float _1590 = fma(_1568, _1432, _1578);
    float _1592 = fma(_1582, _1410, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1594 = fma(_1586, _1410, (*spvDescriptorSet0.vp_c9)._m0[165].z);
    float _1596 = fma(_1570, _1408, _1588);
    float _1598 = fma(_1572, _1408, _1590);
    float _1600 = fma(_1592, _1404, _1596);
    float _1602 = fma(_1594, _1404, _1598);
    float _1604 = fma(_1328, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1600);
    float _1606 = fma(_1328, (*spvDescriptorSet0.vp_c9)._m0[166].z, _1602);
    out.m_67.x = _1604;
    out.m_67.z = _1606;
    bool _1608 = !_1308;
    float _1610 = _1404;
    int _1612 = as_type<int>(_1606);
    float _1614 = _1568;
    if (!_1608)
    {
        float _1616 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1618 = _170 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1620 = fma(_1618, (*spvDescriptorSet0.vp_c9)._m0[14].y, _138);
        float _1622 = _1620 * _1616;
        float _1624 = floor(_1622);
        float _1626 = -_1624;
        float _1628 = _1622 + _1626;
        _1610 = _1616;
        _188 = _1628;
    }
    float _1630 = _1610;
    float _1632 = _188;
    float _1634 = in.m_69.y;
    float _1636 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1638 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1640 = _1638 != 0;
    float _1642 = in.m_57.w;
    int _1644 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1646 = _1644 != 0;
    int _1648 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1650 = _1648 != 0;
    float _1652 = in.m_69.x;
    float _1654 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1656 = in.m_57.y;
    float _1658 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1660 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1662 = _1660 != 0;
    float _1664 = _1432;
    if (_1640)
    {
        float _1666 = in.m_57.z;
        _1664 = _1666;
    }
    float _1668 = _1664;
    float _1670 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1672 = _1636 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1674 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1676 = _1630;
    float _1678 = _1672;
    if (!_1646)
    {
        float _1680 = in.m_57.z;
        _1676 = _1680;
    }
    float _1682 = _1676;
    float _1684 = -_1634;
    float _1686 = _1684 + 1.0;
    bool _1688 = _1642 > 0.5;
    int _1690 = _1688 ? as_type<int>(_1686) : as_type<int>(_1634);
    bool _1692 = _1688;
    float _1694 = _1668;
    float _1696 = _1634;
    if (_1640)
    {
        float _1698 = -_1652;
        float _1700 = _1698 + 1.0;
        _1612 = as_type<int>(_1700);
    }
    int _1702 = _1612;
    if (!_1662)
    {
        _1614 = _1652;
    }
    float _1704 = _1614;
    float _1706 = _1650 ? as_type<float>(_1690) : _1634;
    float _1708 = _1706;
    float _1710 = _1704;
    if (_1640)
    {
        bool _1712 = _1668 > 0.5;
        _1692 = _1712;
    }
    bool _1714 = _1692;
    float _1716 = fma(_1706, _1672, -0.5);
    if (!_1640)
    {
        _1694 = _1652;
    }
    float _1718 = _1694;
    float _1720 = _1718;
    if (!_1646)
    {
        _1708 = _1656;
    }
    float _1722 = _1708;
    float _1724 = _1722;
    if (_1640)
    {
        float _1726 = _1714 ? as_type<float>(_1702) : _1652;
        _1720 = _1726;
    }
    float _1728 = _1720;
    if (_1646)
    {
        _1724 = _170;
    }
    float _1730 = _1724;
    float _1732 = _1682;
    if (!_1646)
    {
        _1678 = _1682;
    }
    float _1734 = _1678;
    float _1736 = fma(_1730, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1658);
    float _1738 = _1734;
    if (_1646)
    {
        _1738 = _1656;
    }
    float _1740 = _1738;
    float _1742 = _1730 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_1646)
    {
        _1732 = _1656;
    }
    float _1744 = _1732;
    float _1746 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1748 = _1654 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1750 = _1740 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1752 = -_1746;
    float _1754 = fma(_1742, 2.0, _1752);
    float _1756 = fma(_1744, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1674);
    float _1758 = fma(_1750, -2.0, _1670);
    float _1760 = fma(_1748, _1728, -0.5);
    float _1762 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1736);
    float _1764 = -_138;
    float _1766 = fma(_1764, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1754);
    float _1768 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1756);
    float _1770 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1758);
    float _1772 = fma(_1762, _1760, _1766);
    float _1774 = -_1770;
    float _1776 = fma(_1768, _1716, _1774);
    float _1778 = _1772 + 0.5;
    float _1780 = _1776 + 0.5;
    float2 _6706 = float2(_1778, _1780);
    float _1782 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_6706, float2(0.0), isnan(_6706)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_6706, float2(0.0), isnan(_6706)), level(0.0)).w;
    float _1784 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1786 = int(_1784);
    float _1788 = in.m_71.x;
    float _1790 = in.m_71.y;
    float _1792 = in.m_71.z;
    float _1794 = in.m_71.w;
    float _1796 = _276 * _726;
    float _1798 = _276 * _652;
    bool _1800 = !_1646;
    float _1802 = _1800 ? 7.345489978790283203125 : 1.0;
    float _1804 = _276 * _658;
    int _1806 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1808 = _1806 != 0;
    int _1810 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1812 = _1810 != 0;
    int _1814 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1816 = _1814 != 0;
    float _1818 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1820 = int(_1818);
    int _1822 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1824 = _1822 != 0;
    float _1826 = _1802 * _170;
    int _1828 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1830 = _1828 != 0;
    float _1832 = _1798 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1834 = _1796 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1836 = _1804 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _1838 = !_1830;
    int _1840 = _1838 ? 0 : 1;
    float _1842 = float(_1786);
    bool _1844 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1846 = isnan(0.5);
    bool _1848 = _1844 || _1846;
    bool _1850 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1852 = _1848 || _1850;
    float _1854 = 1.0 / _1842;
    float _1856 = float(uint(_1820));
    int _1858 = ~_1820;
    int _1860 = _1858 + 1;
    float _1862 = 1.0 / _1856;
    float _1864 = _138 * _1854;
    int _1866 = ~_1820;
    int _1868 = _1866 + 1;
    float _1870 = trunc(_1864);
    int _1872 = int(_1870);
    int _1874 = as_type<int>(_1862) + (-2);
    float _1876 = float(uint(_1872));
    float _1878 = float(_1872);
    float _1880 = as_type<float>(_1874) * _1876;
    float _1882 = in.m_73.x;
    float _1884 = in.m_73.y;
    float _1886 = in.m_73.z;
    float _1888 = in.m_73.w;
    float _1890 = trunc(_1880);
    float _1892 = precise::max(_1890, 0.0);
    uint _1895 = uint(_1892);
    float _1897 = in.m_75.x;
    float _1899 = in.m_75.y;
    float _1901 = in.m_75.z;
    float _1903 = in.m_75.w;
    int _1905 = _1868 * int(_1895);
    int _1907 = _1905 + _1872;
    float _1909 = float(uint(_1907));
    float _1911 = as_type<float>(_1874) * _1909;
    float _1913 = in.m_48.x;
    float _1915 = in.m_48.y;
    float _1917 = in.m_48.z;
    float _1919 = trunc(_1911);
    float _1921 = precise::max(_1919, 0.0);
    uint _1923 = uint(_1921);
    int _1925 = int(_1895) + int(_1923);
    float _1927 = float(_1820);
    float _1929 = floor(_1826);
    float _1931 = _1915 * _1790;
    int _1933 = _1860 * _1925;
    int _1935 = _1933 + _1872;
    bool _1937 = _1878 >= _1927;
    bool _1939 = isnan(_1878);
    bool _1941 = _1937 || _1939;
    bool _1943 = isnan(_1927);
    bool _1945 = _1941 || _1943;
    float _1947 = float(_1945);
    float _1949 = _1915 * _1884;
    float _1951 = _1915 * _1899;
    float _1953 = fma(_1913, _1788, _1931);
    bool _1955 = uint(_1935) >= uint(_1820);
    float _1957 = fma(_1913, _1882, _1949);
    float _1959 = trunc(_1947);
    int _1961 = int(_1959);
    float _1963 = fma(_1917, _1792, _1953);
    bool _1965 = !_1955;
    int _1967 = _1965 ? 0 : (-1);
    float _1969 = fma(_1917, _1886, _1957);
    bool _1971 = _1820 == 0;
    int _1973 = ~_1925;
    int _1975 = _1973 + _1967;
    int _1977 = _1975 + 1;
    float _1979 = -_1929;
    float _1981 = _1826 + _1979;
    float _1983 = fma(_1913, _1897, _1951);
    float _1985 = _138 * _1927;
    int _1987 = _1820 + (-1);
    int _1989 = _1820 * _1977;
    int _1991 = _1989 + _1872;
    float _1993 = _1981 * _1927;
    float _1995 = _1985 * _178;
    bool _1997 = !_1808;
    int _1999 = _1997 ? 0 : 1;
    float _2001 = fma(_1917, _1901, _1983);
    int _2003 = ~_1961;
    int _2005 = _2003 + 1;
    int _2007 = _2005 + 1;
    float _2009 = trunc(_1993);
    int _2011 = int(_2009);
    bool _2013 = !_1971;
    int _2015 = _2013 ? _1991 : (-1);
    float _2017 = _2001 + _1903;
    int _2019 = abs(_1999);
    int _2021 = abs(_1840);
    int _2023 = _2015 * _2007;
    bool _2025 = !_1812;
    int _2027 = _2025 ? 0 : 1;
    float _2029 = trunc(_1995);
    int _2031 = int(_2029);
    bool _2033 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2035 = isnan(0.5);
    bool _2037 = _2033 || _2035;
    bool _2039 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2041 = _2037 || _2039;
    int _2043 = _1961 * _1987;
    int _2045 = _2043 + _2023;
    int _2047 = abs(_2027);
    float _2049 = _170 * 6.283185482025146484375;
    bool _2051 = !_1816;
    int _2053 = _2051 ? 0 : 1;
    int _2055 = _2045 * _2047;
    int _2057 = abs(_2053);
    int _2059 = _2011 * _2021;
    int _2061 = _2059 + _1872;
    float _2063 = _2049 * 0.15915493667125701904296875;
    float _2065 = _138 + _2049;
    bool _2067 = !_1824;
    int _2069 = _2067 ? 0 : 1;
    float _2071 = _2063 * 6.283185482025146484375;
    float _2073 = cos(_2071);
    int _2075 = _2031 * _2019;
    int _2077 = _2075 + _2055;
    float _2079 = _2065 * 0.070000000298023223876953125;
    float _2081 = _1963 + _1794;
    int _2083 = abs(_2069);
    int _2085 = _2061 * _2057;
    int _2087 = _2085 + _2077;
    float _2089 = _1969 + _1888;
    float _2091 = in.m_77.x;
    float _2093 = in.m_77.y;
    float _2095 = in.m_77.z;
    float _2097 = _2063 * 6.283185482025146484375;
    float _2099 = sin(_2097);
    int _2101 = _2011 * _2083;
    int _2103 = _2101 + _2087;
    float _2105 = _2073 * _2093;
    float _2107 = fma(_2099, _2091, _2105);
    float _2109 = fma(_1782, 6.283185482025146484375, _2079);
    float _2111 = _2109 * 0.15915493667125701904296875;
    float _2113 = _2099 * _2093;
    float _2115 = _2111 * 6.283185482025146484375;
    float _2117 = sin(_2115);
    float _2119 = -_2113;
    float _2121 = fma(_2073, _2091, _2119);
    float _2123 = _2117 * 0.100000001490116119384765625;
    float _2125 = fma(_2107, _2123, _2107);
    float _2127 = fma(_2121, _2123, _2121);
    float _2129 = fma(_2123, _2095, _2095);
    float _2131 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2125);
    float _2133 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2129);
    float _2135 = _1832 * _2131;
    float _2137 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2127);
    float _2139 = _1836 * _2133;
    float _2141 = _2089 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2143 = _2135 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2145 = _1834 * _2137;
    float _2147 = _2135 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2149 = fma(_2081, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2141);
    float _2151 = _2089 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2153 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2143);
    float _2155 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2147);
    float _2157 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2149);
    float _2159 = fma(_2081, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2151);
    float _2161 = fma(_2139, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2153);
    float _2163 = fma(_2139, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2155);
    float _2165 = _2157 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2167 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2159);
    float _2169 = _2161 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2171 = _2163 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2173 = _2167 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2175 = _2017 + _2169;
    float _2177 = _2081 + _2171;
    float _2179 = _2165 + _2173;
    float _2181 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2183 = _2175 + _2181;
    float _2185 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2187 = _2177 + _2185;
    float _2189 = 1.0 / _2173;
    float _2191 = _2183 * _2183;
    float _2193 = fma(_2187, _2187, _2191);
    float _2195 = _2135 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2197 = sqrt(_2193);
    float _2199 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2195);
    float _2201 = fma(_2139, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2199);
    float _2203 = _2179 * _2189;
    float _2205 = _2203 * 0.5;
    float _2207 = _2201 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2209 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2211 = fma(_2205, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2209);
    float _2213 = _2089 + _2207;
    float _2215 = 1.0 / _2211;
    bool _2217 = _2197 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2219 = _2207;
    float _2221 = _2205;
    float _2223 = _2177;
    float _2225 = _2175;
    float _2227 = _2145;
    float _2229 = _2187;
    float _2231 = _1993;
    if (!_2217)
    {
        _2219 = _2177;
    }
    float _2233 = _2219;
    float _2235 = _2233;
    if (!_2217)
    {
        _2221 = _2175;
    }
    float _2237 = _2221;
    float _2239 = _2237;
    if (!_2217)
    {
        _2223 = _2213;
    }
    float _2241 = _2223;
    bool _2243 = !_2217;
    float _2245 = _2241;
    if (!_2243)
    {
        float _2247 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2249 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2251 = _2197 + _2249;
        float _2253 = _2213 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2255 = rsqrt(_2193);
        float _2257 = _2251 * _2247;
        float _2259 = _2257 * 0.15915493667125701904296875;
        float _2261 = _2259 * 6.283185482025146484375;
        float _2263 = cos(_2261);
        float _2265 = _2259 * 6.283185482025146484375;
        float _2267 = sin(_2265);
        float _2269 = _2263 + (-1.0);
        float _2271 = _2269 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2273 = fma(_2267, _2253, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2275 = fma(_2213, _2263, _2271);
        float _2277 = _2255 * _2273;
        float _2279 = fma(_2187, _2277, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2281 = fma(_2183, _2277, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2235 = _2279;
        _2245 = _2275;
        _2239 = _2281;
    }
    float _2283 = _2235;
    float _2285 = _2245;
    float _2287 = _2239;
    float _2289 = _2285;
    float _2291 = _2283;
    float _2293 = _2287;
    if (!_1852)
    {
        float _2295 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2297 = _2089 + _2295;
        float _2299 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2301 = _2081 + _2299;
        float _2303 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2305 = _2297 * _2297;
        float _2307 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2309 = _2017 + _2307;
        float _2311 = fma(_2301, _2301, _2305);
        float _2313 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2315 = fma(_2309, _2309, _2311);
        float _2317 = sqrt(_2315);
        float _2319 = _2303 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2321 = precise::min(_2317, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2323 = _2321 * _2313;
        float _2325 = -_2081;
        float _2327 = _2325 + _2283;
        float _2329 = _2319 * _2323;
        float _2331 = -_2089;
        float _2333 = _2331 + _2285;
        float _2335 = -_2017;
        float _2337 = _2335 + _2287;
        float _2339 = fma(_2327, _2329, _2081);
        float _2341 = fma(_2333, _2329, _2089);
        float _2343 = fma(_2337, _2329, _2017);
        _2289 = _2341;
        _2291 = _2339;
        _2293 = _2343;
        _2225 = _2313;
    }
    float _2345 = _2289;
    float _2347 = _2291;
    float _2349 = _2293;
    float _2351 = _2225;
    float _2353 = _2351;
    if (_2041)
    {
        _2227 = 1.0;
    }
    float _2355 = _2227;
    float _2357 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2359 = _2215 * _2357;
    float _2361 = _2355;
    if (!_2041)
    {
        float _2363 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2365 = _2363 * 0.15915493667125701904296875;
        float _2367 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2369 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2371 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2369;
        float _2373 = _2365 * 6.283185482025146484375;
        float _2375 = cos(_2373);
        float _2377 = _2367 * 0.15915493667125701904296875;
        float _2379 = _2365 * 6.283185482025146484375;
        float _2381 = sin(_2379);
        float _2383 = 1.0 / _2375;
        float _2385 = _2377 * 6.283185482025146484375;
        float _2387 = cos(_2385);
        float _2389 = _2381 * _2383;
        float _2391 = _2377 * 6.283185482025146484375;
        float _2393 = sin(_2391);
        float _2395 = _2387 * _2389;
        float _2397 = 1.0 / _2371;
        float _2399 = 1.0 / _2395;
        float _2401 = _2393 * _2399;
        float _2403 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2405 = fma(_2359, _2401, _2403);
        float _2407 = _2405 * _2397;
        float _2409 = precise::clamp(_2407, 0.0, 1.0);
        _2353 = _2397;
        _2229 = _2377;
        _2361 = _2409;
    }
    float _2411 = _2353;
    float _2413 = _2229;
    float _2415 = _2361;
    float _2417 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2419 = _2345 + _2417;
    float _2421 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2423 = _2347 + _2421;
    float _2425 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2427 = _2349 + _2425;
    float _2429 = in.m_79.w;
    float _2431 = _2419 * _2419;
    float _2433 = fma(_2423, _2423, _2431);
    float _2435 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2437 = _2435 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2439 = fma(_2427, _2427, _2433);
    float _2441 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2443 = _2441 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2445 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2447 = _2445 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2449 = rsqrt(_2439);
    float _2451 = sqrt(_2439);
    float _2453 = _2449 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2455 = 1.0 / _2437;
    float _2457 = _2423 * _2453;
    float _2459 = _2427 * _2453;
    float _2461 = _2457 * _2457;
    float _2463 = _2459 * _2459;
    float _2465 = 1.0 / _2443;
    float _2467 = _2461 + _2463;
    float _2469 = sqrt(_2467);
    float _2471 = 1.0 / _2447;
    bool _2473 = _2469 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2475 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2477 = _2469 + _2475;
    float _2479 = _2427;
    float _2481 = _2431;
    float _2483 = _2477;
    float _2485 = _2411;
    float _2487 = _2419;
    float _2489 = _2413;
    bool _2491 = _2473;
    if (_2473)
    {
        float _2493 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2479 = _2493;
    }
    float _2495 = _2479;
    if (_2473)
    {
        float _2497 = rsqrt(_2467);
        _2481 = _2497;
    }
    float _2499 = _2481;
    float _2501 = _2499;
    if (_2473)
    {
        float _2503 = _2477 * _2495;
        _2483 = _2503;
    }
    float _2505 = _2483;
    if (_2473)
    {
        float _2507 = _2505 * 0.15915493667125701904296875;
        _2485 = _2507;
    }
    float _2509 = _2485;
    float _2511 = fma(_2081, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2513 = _2495;
    if (_2473)
    {
        float _2515 = _2509 * 6.283185482025146484375;
        float _2517 = sin(_2515);
        _2513 = _2517;
    }
    float _2519 = _2513;
    float _2521 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2523 = precise::max(0.0, _2521);
    float _2525 = _2449;
    float _2527 = _2523;
    if (_2473)
    {
        float _2529 = _2509 * 6.283185482025146484375;
        float _2531 = cos(_2529);
        _2525 = _2531;
    }
    float _2533 = _2525;
    float _2535 = -_2453;
    float _2537 = -_2523;
    float _2539 = fma(_2419, _2535, _2537);
    if (_2473)
    {
        float _2541 = _2539 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2527 = _2541;
    }
    float _2543 = _2527;
    float _2545 = floor(_2511);
    float _2547 = _2543;
    float _2549 = _2519;
    if (_2473)
    {
        float _2551 = fma(_2519, _2543, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2547 = _2551;
    }
    float _2553 = _2547;
    float _2555 = _2553;
    if (!_2473)
    {
        _2549 = _2457;
    }
    float _2557 = _2549;
    float _2559 = _2557;
    float _2561 = _2533;
    if (_2473)
    {
        float _2563 = _2533 + (-1.0);
        _2487 = _2563;
    }
    float _2565 = _2487;
    float _2567 = _2565;
    if (_2473)
    {
        float _2569 = _2499 * _2553;
        _2231 = _2569;
    }
    float _2571 = _2231;
    if (!_2473)
    {
        _2555 = _2539;
    }
    float _2573 = _2555;
    float _2575 = _2573;
    if (_2473)
    {
        float _2577 = _2565 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2489 = _2577;
    }
    float _2579 = _2489;
    if (_2473)
    {
        float _2581 = _2457 * _2571;
        _2559 = _2581;
    }
    float _2583 = _2559;
    if (!_2473)
    {
        _2567 = _2459;
    }
    float _2585 = _2567;
    float _2587 = _2585;
    if (_2473)
    {
        float _2589 = _2459 * _2571;
        _2587 = _2589;
    }
    float _2591 = _2587;
    if (!_2473)
    {
        _2501 = _2461;
    }
    float _2593 = _2501;
    float _2595 = _2593;
    if (_2473)
    {
        float _2597 = fma(_2539, _2533, _2579);
        _2575 = _2597;
    }
    float _2599 = _2575;
    if (_2473)
    {
        float _2601 = _2583 * _2583;
        _2595 = _2601;
    }
    float _2603 = _2595;
    if (!_2473)
    {
        _2561 = _2463;
    }
    float _2605 = _2561;
    float _2607 = _2605;
    if (_2473)
    {
        float _2609 = _2591 * _2591;
        _2607 = _2609;
    }
    float _2611 = _2607;
    float _2613 = fma(_2599, _2599, _2603);
    float _2615 = -_2545;
    float _2617 = _2511 + _2615;
    float _2619 = _2613 + _2611;
    float _2621 = fma(_2017, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2623 = _2345 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2625 = rsqrt(_2619);
    float _2627 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2629 = fma(_2451, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2627);
    float _2631 = precise::clamp(_2629, 0.0, 1.0);
    float _2633 = fma(_2347, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2623);
    float _2635 = -_2631;
    float _2637 = _2635 + 1.0;
    float _2639 = _2345 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2641 = fma(_2349, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2633);
    float _2643 = floor(_2621);
    float _2645 = fma(_2347, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2639);
    float _2647 = _2641 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2649 = fma(_2349, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2645);
    float _2651 = _2625 * _2583;
    float _2653 = _2345 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2655 = _2625 * _2591;
    float _2657 = _2345 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2659 = abs(_2637);
    float _2661 = log2(_2659);
    float _2663 = fma(_2347, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2653);
    float _2665 = _2649 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2667 = fma(_2347, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2657);
    float _2669 = _2625 * _2599;
    float _2671 = fma(_2349, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2663);
    float _2673 = -_2643;
    float _2675 = _2621 + _2673;
    float _2677 = fma(_2349, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2667);
    float _2679 = _2669 + 1.0;
    float _2681 = _2671 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2683 = _2651 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2685 = _2677 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2687 = _2681 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2689 = _2661 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2691 = fma(_2685, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2687);
    float _2693 = fma(_2665, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2691);
    float _2695 = -_2683;
    float _2697 = fma(_2669, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2695);
    float _2699 = exp2(_2689);
    float _2701 = fma(_2647, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2693);
    float _2703 = -_2655;
    float _2705 = fma(_2703, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2697);
    float _2707 = fma(_2705, 0.5, 0.5);
    float _2709 = fma(_2705, -0.5, 0.5);
    float _2711 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2713 = _2665 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2715 = 1.0 / _2701;
    float _2717 = fma(_2707, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2719 = -_2713;
    float _2721 = fma(_2719, _2711, 1.0);
    float _2723 = _2681 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2725 = -_2669;
    float _2727 = fma(_2699, _2679, _2725);
    float _2729 = _2681 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2731 = fma(_2707, _2717, -0.212114393711090087890625);
    float _2733 = sqrt(_2709);
    float _2735 = fma(_2685, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2723);
    float _2737 = fma(_2685, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2729);
    float _2739 = fma(_2707, _2731, 1.570728778839111328125);
    float _2741 = fma(_2665, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2735);
    float _2743 = fma(_2665, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2737);
    float _2745 = log2(_2721);
    float _2747 = fma(_2647, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2741);
    float _2749 = fma(_2647, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2743);
    float2 _8179 = float2(_2617, _2675);
    float _2751 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8179, float2(0.0), isnan(_8179)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8179, float2(0.0), isnan(_8179)), level(0.0)).x;
    float _2753 = fma(_2727, 0.5, 0.5);
    float _2755 = _2747 * _2715;
    float _2757 = _2733 * 0.636619746685028076171875;
    float _2759 = -_2739;
    float _2761 = fma(_2757, _2759, 1.0);
    float _2763 = _2749 * _2715;
    float _2765 = fma(_2755, 0.5, 0.5);
    float _2767 = _2745 * 0.693147182464599609375;
    float _2769 = fma(_2763, -0.5, 0.5);
    float _2771 = float(uint(_2103));
    float _2773 = _2767 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float3 _8218 = float3(_2765, _2769, _2773);
    float _2775 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8218, float3(0.0), isnan(_8218)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8218, float3(0.0), isnan(_8218)), level(0.0)).x;
    float3 _8229 = float3(_2765, _2769, _2773);
    float4 _2778 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8229, float3(0.0), isnan(_8229)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8229, float3(0.0), isnan(_8229)), level(0.0)).xyzw;
    float _2780 = _2778.x;
    float _2782 = _2778.y;
    float _2784 = _2778.z;
    float _2786 = _2778.w;
    float2 _8245 = float2(_2761, _2753);
    float3 _2790 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8245, float2(0.0), isnan(_8245)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8245, float2(0.0), isnan(_8245)), level(0.0)).xyz;
    float _2792 = _2790.x;
    float _2794 = _2790.y;
    float _2796 = _2790.z;
    float _2798 = as_type<float>(_1874) * _2771;
    float _2800 = _170 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    out.m_81.w = _2429;
    float _2802 = trunc(_2798);
    float _2804 = precise::max(_2802, 0.0);
    uint _2806 = uint(_2804);
    float _2808 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2810 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    if (_1662)
    {
        bool _2812 = _170 > 0.5;
        _2491 = _2812;
    }
    bool _2814 = _2491;
    float _2816 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _2818 = ~_1820;
    int _2820 = _2818 + 1;
    float _2822 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2808);
    float _2824 = -_2810;
    float _2826 = fma(_2800, 2.0, _2824);
    float _2828 = _1656 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    out.m_83.x = _2081;
    out.m_83.y = _2089;
    out.m_83.z = _2017;
    float _2830 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2832 = _2830 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2834 = fma(_2828, -2.0, _2816);
    int _2836 = _2820 * int(_2806);
    int _2838 = _2836 + _2103;
    float _2840 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2842 = 1.0 / _2832;
    float _2844 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _2846 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _2844;
    float _2848 = float(uint(_2838));
    float _2850 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _2852 = _2850 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    int _2854 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2856 = _2854 != 0;
    float _2858 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2860 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _2858;
    int _2862 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2864 = _2862 != 0;
    float _2866 = as_type<float>(_1874) * _2848;
    float _2868 = _2852 * _2455;
    float _2870 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2872 = _2870 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2874 = _2846 * _2465;
    float _2876 = trunc(_2866);
    float _2878 = precise::max(_2876, 0.0);
    uint _2880 = uint(_2878);
    float _2882 = in.m_85.x;
    float _2884 = in.m_85.y;
    bool _2886 = _1656 > 0.5;
    float _2888 = fma(_1656, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2840);
    float _2890 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2892 = _2890 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _2894 = _2860 * _2471;
    float _2896 = in.m_87.x;
    float _2898 = in.m_87.y;
    float _2900 = 1.0 / _2872;
    float _2902 = -_138;
    float _2904 = fma(_2902, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2826);
    float _2906 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _2908 = _2906 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    int _2910 = ~_1820;
    int _2912 = _2910 + 1;
    float _2914 = _2661 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2916 = _1632 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _2918 = isnan(_1632);
    bool _2920 = _2916 || _2918;
    bool _2922 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _2924 = _2920 || _2922;
    float _2926 = float(_2924);
    float _2928 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2930 = _2928 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    int _2932 = int(_2806) + int(_2880);
    float _2934 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _2936 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _2934;
    int _2938 = ~_1820;
    int _2940 = _2938 + 1;
    float _2942 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _2944 = _2942 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2946 = 1.0 / _2892;
    float _2948 = -_2926;
    float _2950 = _2948 + 1.0;
    if (_2864)
    {
        float _2952 = _2886 ? _1686 : _1634;
        _1696 = _2952;
    }
    float _2954 = _1696;
    float _2956 = _2944 * _2842;
    int _2958 = _2940 * _2932;
    int _2960 = _2958 + _2103;
    float _2962 = _2936 * _2900;
    float _2964 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2888);
    float _2966 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2968 = _1632 + _2966;
    float _2970 = 1.0 / _2930;
    bool _2972 = uint(_2960) >= uint(_1820);
    float _2974 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2976 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _2974;
    float _2978 = _2073 * _2884;
    float _2980 = _2099 * _2898;
    bool _2982 = !_2972;
    int _2984 = _2982 ? 0 : (-1);
    out.m_89.x = _2347;
    out.m_89.y = _2345;
    out.m_89.z = _2349;
    float _2986 = fma(_2099, _2882, _2978);
    float _2988 = _2976 * _2946;
    float _2990 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2822);
    int _2992 = ~_2932;
    int _2994 = _2992 + _2984;
    int _2996 = _2994 + 1;
    float _2998 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2834);
    float _3000 = _2099 * _2884;
    float _3002 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _3004 = _1632 + _3002;
    float _3006 = exp2(_2914);
    int _3008 = _1820 * _2996;
    int _3010 = _3008 + _2103;
    float _3012 = -_3000;
    float _3014 = fma(_2073, _2882, _3012);
    float _3016 = _2073 * _2898;
    float _3018 = -_2980;
    float _3020 = fma(_2073, _2896, _3018);
    float _3022 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _3024 = _1632 + _3022;
    float _3026 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _3028 = _1632 + _3026;
    bool _3030 = !_1971;
    int _3032 = _3030 ? _3010 : (-1);
    float _3034 = fma(_2099, _2896, _3016);
    float _3036 = fma(_2874, _3024, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _3038 = fma(_2868, _3028, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _3040 = fma(_2894, _3004, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _3042 = float(uint(_2061));
    float _3044 = _2908 * _2970;
    bool _3046 = _1632 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _3048 = isnan(_1632);
    bool _3050 = _3046 || _3048;
    bool _3052 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _3054 = _3050 || _3052;
    float _3056 = float(_3054);
    int _3058 = _3032 >> 31;
    float _3060 = as_type<float>(_1874) * _3042;
    bool _3062 = _1632 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _3064 = isnan(_1632);
    bool _3066 = _3062 || _3064;
    bool _3068 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _3070 = _3066 || _3068;
    float _3072 = float(_3070);
    float _3074 = -_3056;
    float _3076 = _3074 + 1.0;
    int _3078 = _3058 & 3;
    float _3080 = -_3006;
    float _3082 = _3080 + 1.0;
    bool _3084 = _1632 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _3086 = isnan(_1632);
    bool _3088 = _3084 || _3086;
    bool _3090 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _3092 = _3088 || _3090;
    float _3094 = float(_3092);
    float _3096 = _3072 * _3076;
    int _3098 = _3032 + _3078;
    float _3100 = -_3072;
    float _3102 = _3100 + 1.0;
    float _3104 = trunc(_3060);
    float _3106 = precise::max(_3104, 0.0);
    uint _3108 = uint(_3106);
    bool _3110 = _1632 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _3112 = isnan(_1632);
    bool _3114 = _3110 || _3112;
    bool _3116 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _3118 = _3114 || _3116;
    float _3120 = float(_3118);
    float _3122 = -_3094;
    float _3124 = _3122 + 1.0;
    int _3126 = _3098 >> 2;
    float _3128 = _3094 * _3102;
    bool _3130 = _1632 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _3132 = isnan(_1632);
    bool _3134 = _3130 || _3132;
    bool _3136 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _3138 = _3134 || _3136;
    float _3140 = float(_3138);
    float _3142 = -_3120;
    float _3144 = _3142 + 1.0;
    int _3146 = _3126 << 4;
    int _3148 = _3146 + 368;
    float _3150 = _3120 * _3124;
    bool _3152 = _1632 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _3154 = isnan(_1632);
    bool _3156 = _3152 || _3154;
    bool _3158 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _3160 = _3156 || _3158;
    float _3162 = float(_3160);
    float _3164 = _3140 * _3144;
    float _3166 = -_3140;
    float _3168 = _3166 + 1.0;
    bool _3170 = _1632 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _3172 = isnan(_1632);
    bool _3174 = _3170 || _3172;
    bool _3176 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _3178 = _3174 || _3176;
    float _3180 = float(_3178);
    uint _3182 = uint(int(uint(_3148) >> uint(2)));
    uint _3184 = uint(int(uint(int(_3182)) >> uint(2)));
    int _3186 = int(_3182) & 3;
    float _3188 = (*spvDescriptorSet0.vp_c9)._m0[int(_3184)][_3186];
    int _3190 = int(_3182) + 1;
    uint _3192 = uint(int(uint(_3190) >> uint(2)));
    int _3194 = _3190 & 3;
    float _3196 = (*spvDescriptorSet0.vp_c9)._m0[int(_3192)][_3194];
    float _3198 = -_3162;
    float _3200 = _3198 + 1.0;
    float _3202 = _3162 * _3168;
    int _3204 = _2912 * int(_3108);
    int _3206 = _3204 + _2061;
    float _3208 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _3210 = _1632 + _3208;
    float _3212 = _2926 * _3200;
    float _3214 = _3180 * _2950;
    int _3216 = _3032 & 3;
    bool _3218 = _3216 != 0;
    float _3220 = fma(_3044, _3210, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _3222 = float(uint(_3206));
    float _3224 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3226 = _1632 + _3224;
    float _3228 = _3036 * _3214;
    float _3230 = _3082 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _3232 = _3148 + 8;
    uint _3234 = uint(int(uint(_3232) >> uint(2)));
    uint _3236 = uint(int(uint(int(_3234)) >> uint(2)));
    int _3238 = int(_3234) & 3;
    float _3240 = (*spvDescriptorSet0.vp_c9)._m0[int(_3236)][_3238];
    int _3242 = int(_3234) + 1;
    uint _3244 = uint(int(uint(_3242) >> uint(2)));
    int _3246 = _3242 & 3;
    float _3248 = (*spvDescriptorSet0.vp_c9)._m0[int(_3244)][_3246];
    float _3250 = as_type<float>(_1874) * _3222;
    float _3252 = fma(_2962, _3226, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    int _3254 = _3032 & 3;
    bool _3256 = _3254 != 0;
    float _3258 = -_3180;
    float _3260 = _3258 + 1.0;
    int _3262 = _3218 ? 0 : 1;
    float _3264 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3266 = _1632 + _3264;
    bool _3268 = uint(_3254) > 1u;
    float _3270 = trunc(_3250);
    float _3272 = precise::max(_3270, 0.0);
    uint _3274 = uint(_3272);
    float _3276 = fma(_2956, _2968, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _3278 = fma(_3260, (*spvDescriptorSet0.vp_c9)._m0[167].x, _3228);
    int _3280 = ~_3262;
    int _3282 = _3280 + 1;
    int _3284 = _3282 + 1;
    float _3286 = fma(_2988, _3266, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    bool _3288 = uint(_3254) >= 2u;
    float _3290 = fma(_3038, _3212, _3278);
    int _3292 = ~_1820;
    int _3294 = _3292 + 1;
    int _3296 = _3288 ? 0 : 1;
    float _3298 = fma(_3040, _3202, _3290);
    int _3300 = _3284;
    float _3302 = _3014;
    if (!_3268)
    {
        int _3304 = ~_3262;
        int _3306 = _3304 + 1;
        _3300 = _3306;
    }
    int _3308 = _3300;
    bool _3310 = _3254 != 3;
    float _3312 = fma(_3220, _3164, _3298);
    int _3314 = abs(_3308);
    bool _3316 = !_3256;
    int _3318 = _3316 ? 0 : 1;
    float _3320 = fma(_3252, _3150, _3312);
    int _3322 = ~_3314;
    int _3324 = _3322 + 1;
    int _3326 = _3324 + 1;
    int _3328 = int(_3108) + int(_3274);
    float _3330 = fma(_3276, _3128, _3320);
    bool _3332 = _3254 != 3;
    int _3334 = abs(_3318);
    int _3336 = _3326 * as_type<int>(_3196);
    bool _3338 = !_2856;
    int _3340 = _3338 ? 0 : 1;
    int _3342 = _3294 * _3328;
    int _3344 = _3342 + _2061;
    int _3346 = ~_3296;
    int _3348 = _3346 + 1;
    int _3350 = _3348 + 1;
    float _3352 = fma(_3286, _3096, _3330);
    int _3354 = abs(_3340);
    int _3356 = ~_3334;
    int _3358 = _3356 + 1;
    int _3360 = _3358 + 1;
    float _3362 = fma(_3056, (*spvDescriptorSet0.vp_c9)._m0[174].x, _3352);
    int _3364 = _3350;
    if (_3310)
    {
        int _3366 = ~_3296;
        int _3368 = _3366 + 1;
        _3364 = _3368;
    }
    int _3370 = _3364;
    float _3372 = abs(_2359);
    float _3374 = log2(_3372);
    bool _3376 = !_3332;
    int _3378 = _3376 ? 0 : (-1);
    int _3380 = _3360 * as_type<int>(_3188);
    int _3382 = _3380 + _3336;
    bool _3384 = uint(_3344) >= uint(_1820);
    out.m_91.x = _3362;
    int _3386 = abs(_3370);
    int _3388 = abs(_3378);
    bool _3390 = !_3384;
    int _3392 = _3390 ? 0 : (-1);
    int _3394 = ~_3386;
    int _3396 = _3394 + 1;
    int _3398 = _3396 + 1;
    float _3400 = _3034 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3402 = ~_3328;
    int _3404 = _3402 + _3392;
    int _3406 = _3404 + 1;
    int _3408 = _3398 * as_type<int>(_3240);
    int _3410 = _3408 + _3382;
    int _3412 = ~_3388;
    int _3414 = _3412 + 1;
    int _3416 = _3414 + 1;
    float _3418 = _3374 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _3420 = ~_3354;
    int _3422 = _3420 + 1;
    int _3424 = _3422 + 1;
    int _3426 = _3382;
    if (_1662)
    {
        float _3428 = -_1652;
        float _3430 = _3428 + 1.0;
        _3426 = as_type<int>(_3430);
    }
    int _3432 = _3426;
    int _3434 = _1820 * _3406;
    int _3436 = _3434 + _2061;
    int _3438 = _3416 * as_type<int>(_3248);
    int _3440 = _3438 + _3410;
    float _3442 = exp2(_3418);
    if (_1662)
    {
        float _3444 = _2814 ? as_type<float>(_3432) : _1652;
        _1710 = _3444;
    }
    float _3446 = _1710;
    float _3448 = in.m_85.z;
    int _3450 = _3440 * _3424;
    float _3452 = _3034 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _3454 = !_1971;
    int _3456 = _3454 ? _3436 : (-1);
    float _3458 = fma((*spvDescriptorSet0.vp_c9)._m0[80].y, _2954, -0.5);
    bool _3460 = _2125 != 0.0;
    bool _3462 = isnan(_2125);
    bool _3464 = _3460 || _3462;
    bool _3466 = isnan(0.0);
    bool _3468 = _3464 || _3466;
    float _3470 = in.m_87.z;
    float _3472 = in.m_87.w;
    int _3474 = _3456 * _3354;
    int _3476 = _3474 + _3450;
    float _3478 = -_2998;
    float _3480 = fma(_2964, _3458, _3478);
    float _3482 = fma(_3446, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    bool _3484 = _2127 == 0.0;
    bool _3486 = !_3468;
    bool _3488 = _3484 && _3486;
    float _3490 = _3480 + 0.5;
    float _3492 = float(_3476);
    float _3494 = fma(_3442, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3496 = precise::clamp(_3494, 0.0, 1.0);
    bool _3498 = _2129 == 0.0;
    bool _3500 = _3498 && _3488;
    float _3502 = fma(_2990, _3482, _2904);
    float _3504 = _3034 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3506 = fma(_3496, -2.0, 3.0);
    float _3508 = _3496 * _3496;
    out.m_93.x = _3492;
    float _3510 = fma(_3020, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3452);
    float _3512 = _3502 + 0.5;
    float _3514 = _3508 * _3506;
    float _3516 = fma(_3020, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3400);
    bool _3518 = _2359 <= 8000.0;
    bool _3520 = isnan(_2359);
    bool _3522 = _3518 || _3520;
    bool _3524 = isnan(8000.0);
    bool _3526 = _3522 || _3524;
    float _3528 = float(_3526);
    out.m_95.x = _3512;
    out.m_95.y = _3490;
    out.m_95.z = _1778;
    out.m_95.w = _1780;
    float _3530 = fma(_3020, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3504);
    float _3532 = _3452;
    if (_3500)
    {
        _3532 = _3448;
    }
    float _3534 = _3532;
    float _3536 = fma(_3470, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3516);
    float _3538 = _2986 * _3020;
    float _3540 = _3014 * _3470;
    float _3542 = fma(_3470, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3530);
    float _3544 = fma(_3470, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3510);
    float _3546 = -_3538;
    float _3548 = fma(_3014, _3034, _3546);
    float _3550 = _3034 * _3448;
    float _3552 = -_3540;
    float _3554 = fma(_3020, _3448, _3552);
    float _3556 = _3534;
    if (!_3500)
    {
        float _3558 = fma(_2129, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3448);
        _3556 = _3558;
    }
    float _3560 = _3556;
    float _3562 = -_3514;
    float _3564 = _3562 + 1.0;
    float _3566 = -_3550;
    float _3568 = fma(_2986, _3470, _3566);
    float _3570 = _3554 * _3472;
    float _3572 = in.m_97.x;
    float _3574 = fma(_3564, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3514);
    float _3576 = _3568 * _3472;
    float _3578 = _3570 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    out.m_99.x = _3542;
    out.m_99.y = _3536;
    out.m_99.z = _3544;
    float _3580 = _3570 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3582 = _3528 * _3574;
    float _3584 = _3548 * _3472;
    float _3586 = fma(_3576, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3578);
    float _3588 = fma(_3576, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3580);
    float _3590 = _2681 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3592 = _3582 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3594 = fma(_3584, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3586);
    float _3596 = fma(_3584, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3588);
    float _3598 = _3574;
    if (_3500)
    {
        _3598 = _2986;
    }
    float _3600 = _3598;
    float _3602 = fma(_2685, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3590);
    float _3604 = _3570 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3606 = _3600;
    if (!_3500)
    {
        float _3608 = fma(_2125, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2986);
        _3606 = _3608;
    }
    float _3610 = _3606;
    if (!_3500)
    {
        float _3612 = fma(_2127, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3014);
        _3302 = _3612;
    }
    float _3614 = _3302;
    float _3616 = fma(_2665, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3602);
    float _3618 = fma(_3576, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3604);
    float _3620 = _2701 * 0.5;
    float _3622 = _3610 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3624 = _3610 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3626 = fma(_3584, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3618);
    float _3628 = fma(_2749, -0.5, _3620);
    float _3630 = _3610 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3632 = -_2751;
    float _3634 = _3632 + 1.0;
    out.m_101.x = _3594;
    out.m_101.y = _3596;
    out.m_101.z = _3626;
    float _3636 = fma(_3614, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3622);
    float _3638 = fma(_3614, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3624);
    float _3640 = _3634 * _3592;
    float _3642 = precise::clamp(_3640, 0.0, 1.0);
    float _3644 = fma(_3614, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3630);
    float _3646 = fma(_3560, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3636);
    float _3648 = fma(_3560, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3638);
    float _3650 = -_3642;
    float _3652 = fma(_3650, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3654 = fma(_2647, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3616);
    float _3656 = fma(_3560, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3644);
    bool _3658 = _2451 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3660 = isnan(_2451);
    bool _3662 = _3658 || _3660;
    bool _3664 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3666 = _3662 || _3664;
    float _3668 = _3652 * _3572;
    float _3670 = _3654 + _2701;
    out.gl_Position.x = _2747;
    out.gl_Position.y = _2749;
    out.gl_Position.z = _3654;
    out.gl_Position.w = _2701;
    float _3672 = _2747 + _2701;
    float _3674 = _3668 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_103.x = _3646;
    out.m_103.y = _3648;
    out.m_103.z = _3656;
    float _3676 = _3670 * 0.5;
    float _3678 = _3672 * 0.5;
    float _3680 = _3230 * _2775;
    float _3682 = -_3230;
    float _3684 = _3682 + 1.0;
    out.m_105.x = _3674;
    float _3686 = _3626;
    float _3688 = _3680;
    if (!_3666)
    {
        _3686 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3690 = _3686;
    float _3692 = _2786 * _3680;
    float _3694 = _2796 * _3680;
    out.m_107.x = _3678;
    out.m_107.y = _3628;
    out.m_107.z = _3676;
    out.m_107.w = _2701;
    float _3696 = _3692;
    float _3698 = _3690;
    float _3700 = _3690;
    if (!_3666)
    {
        _3688 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3702 = _3688;
    float _3704 = fma(_2792, _3692, _2780);
    float _3706 = fma(_2794, _3692, _2782);
    float _3708 = _2786 * _3684;
    float _3710 = fma(_2786, _3694, _2784);
    float _3712 = _3702;
    float _3714 = _3702;
    if (!_3666)
    {
        _3696 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3716 = _3696;
    out.m_109.x = _3704;
    out.m_109.y = _3706;
    out.m_109.z = _3710;
    out.m_109.w = _3708;
    float _3718 = _2415 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _3720 = !_3666;
    float _3722 = _3716;
    float _3724 = _3716;
    if (!_3720)
    {
        bool _3726 = _2451 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3728 = isnan(_2451);
        bool _3730 = _3726 || _3728;
        bool _3732 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3734 = _3730 || _3732;
        if (!_3734)
        {
            float _3736 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3738 = _2451 + _3736;
            float _3740 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3742 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3740;
            float _3744 = 1.0 / _3742;
            float _3746 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3748 = _3746 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3750 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3752 = _3750 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3754 = _3738 * _3744;
            float _3756 = precise::clamp(_3754, 0.0, 1.0);
            float _3758 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3760 = _3758 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3762 = fma(_3756, _3752, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3764 = fma(_3756, _3760, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3766 = fma(_3756, _3748, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _3724 = _3766;
            _3700 = _3764;
            _3714 = _3762;
            _3768 = true;
        }
        else
        {
            bool _3770 = _2451 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3772 = isnan(_2451);
            bool _3774 = _3770 || _3772;
            bool _3776 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3778 = _3774 || _3776;
            if (!_3778)
            {
                _3698 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3780 = _3698;
            _3700 = _3780;
            if (!_3778)
            {
                _3722 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3782 = _3722;
            _3724 = _3782;
            if (!_3778)
            {
                _3712 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3784 = _3712;
            bool _3786 = !_3778;
            _3714 = _3784;
            if (!_3786)
            {
                bool _3788 = _2451 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3790 = isnan(_2451);
                bool _3792 = _3788 || _3790;
                bool _3794 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3796 = _3792 || _3794;
                if (!_3796)
                {
                    float _3798 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3800 = _2451 + _3798;
                    float _3802 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3804 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3802;
                    float _3806 = 1.0 / _3804;
                    float _3808 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3810 = _3808 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3812 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3814 = _3812 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3816 = _3800 * _3806;
                    float _3818 = precise::clamp(_3816, 0.0, 1.0);
                    float _3820 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3822 = _3820 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3824 = fma(_3818, _3814, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3826 = fma(_3818, _3822, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3828 = fma(_3818, _3810, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _3724 = _3828;
                    _3700 = _3826;
                    _3714 = _3824;
                    _3768 = true;
                }
                else
                {
                    _3724 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3700 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3714 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _3768 = false;
    float _3830 = _3724;
    float _3832 = _3700;
    float _3834 = _3714;
    float _3836 = _3718 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_111.x = 0.0;
    float _3838 = _3830 * 0.586610972881317138671875;
    bool _3840 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_55.x = _3836;
    float _3842 = fma(_3832, 0.298911988735198974609375, _3838);
    bool _3844 = _2415 > 0.0;
    bool _3846 = isnan(_2415);
    bool _3848 = _3844 || _3846;
    bool _3850 = isnan(0.0);
    bool _3852 = _3848 || _3850;
    float _3854 = fma(_3834, 0.114477999508380889892578125, _3842);
    float _3856 = -_3854;
    float _3858 = _3856 + _3832;
    float _3860 = -_3854;
    float _3862 = _3860 + _3830;
    float _3864 = -_3854;
    float _3866 = _3864 + _3834;
    float _3868 = fma(_3858, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3854);
    float _3870 = fma(_3862, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3854);
    float _3872 = fma(_3866, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3854);
    bool _3874 = !_3840;
    if (!_3874)
    {
        float _3876 = -_2345;
        float _3878 = _3876 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3880 = -_2347;
        float _3882 = _3880 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3884 = -_2349;
        float _3886 = _3884 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3888 = _3878 * _3878;
        float _3890 = fma(_3882, _3882, _3888);
        float _3892 = fma(_3886, _3886, _3890);
        float _3894 = sqrt(_3892);
        float _3896 = rsqrt(_3892);
        float _3898 = -_3894;
        float _3900 = _3898 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3902 = _3900 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3904 = precise::clamp(_3902, 0.0, 1.0);
        float _3906 = _3882 * _3896;
        float _3908 = _3878 * _3896;
        float _3910 = abs(_3904);
        float _3912 = log2(_3910);
        float _3914 = _3886 * _3896;
        float _3916 = _3906 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3918 = _3648 * _3908;
        float _3920 = -_3908;
        float _3922 = -_3916;
        float _3924 = fma(_3920, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3922);
        float _3926 = fma(_3646, _3906, _3918);
        float _3928 = -_3914;
        float _3930 = fma(_3928, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3924);
        float _3932 = fma(_3656, _3914, _3926);
        float _3934 = precise::clamp(_3932, 0.0, 1.0);
        float _3936 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3938 = _3930 + _3936;
        float _3940 = _3912 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3942 = _3938 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3944 = precise::clamp(_3942, 0.0, 1.0);
        float _3946 = exp2(_3940);
        float _3948 = _3946 * _3944;
        float _3950 = _3934 * _3948;
        float _3952 = _3950 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3954 = _3950 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3956 = _3950 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_111.x = _3952;
        out.m_111.y = _3954;
        out.m_111.z = _3956;
    }
    out.m_113.x = _3868;
    out.m_113.y = _3870;
    out.m_113.z = _3872;
    if (_3852)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_55.x = 0.0;
    float _3958 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3958;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_113 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3768 = false;
    bool _1256 = false;
    bool _1160 = false;
    bool _1000 = false;
    bool _790 = false;
    bool _618 = false;
    bool _296 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _127 = in.m_48.w;
    float _129 = in.m_50.w;
    float _131 = trunc(_127);
    int _134 = int(_131);
    float _136 = -_129;
    float _138 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _138;
    bool _142 = _134 >= 1;
    float _144 = 0.0;
    float _146 = _129;
    if (!_142)
    {
        _144 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _144;
    if (!_142)
    {
        out.m_55.x = 0.0;
    }
    int _150 = 0;
    if (!_142)
    {
        float _152 = _148 * 5.0;
        _150 = as_type<int>(_152);
    }
    int _154 = _150;
    int _156 = _154;
    if (!_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4025 = as_type<float>(_154);
        out.gl_Position.z = _4025;
    }
    if (!_142)
    {
        return out;
    }
    bool _158 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _160 = isnan(_129);
    bool _162 = _158 || _160;
    bool _164 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _166 = _162 || _164;
    float _168 = float(_134);
    float _170 = in.m_57.x;
    bool _172 = _138 >= _168;
    bool _174 = !_166;
    bool _176 = _172 || _174;
    float _178 = 1.0 / _168;
    if (_176)
    {
        _146 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _180 = _146;
    if (_176)
    {
        out.m_55.x = 0.0;
    }
    if (_176)
    {
        float _182 = _180 * 5.0;
        _156 = as_type<int>(_182);
    }
    int _184 = _156;
    float _186 = _138 * _178;
    out.m_59.x = _170;
    float _188 = _186;
    if (_176)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4090 = as_type<float>(_184);
        out.gl_Position.z = _4090;
    }
    out.m_53.x = _186;
    if (_176)
    {
        return out;
    }
    float _190 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _192 = _138 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _194 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _196 = _194 != 0;
    int _198 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _200 = _198 != 0;
    int _202 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _204 = _202 != 0;
    float _206 = _192 * _190;
    float _208 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[20].x, _206);
    float _210 = _208 * 6.283185482025146484375;
    float _212 = floor(_208);
    float _214 = _210 * 0.15915493667125701904296875;
    bool _216 = !_196;
    int _218 = _216 ? 0 : 1;
    int _220 = abs(_218);
    float _222 = _214 * 6.283185482025146484375;
    float _224 = cos(_222);
    bool _226 = !_204;
    int _228 = _226 ? 0 : 1;
    bool _230 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _232 = abs(_228);
    float _234 = -_212;
    float _236 = _208 + _234;
    bool _238 = !_200;
    int _240 = _238 ? 0 : 1;
    float _242 = float(_220);
    int _244 = abs(_240);
    float _246 = -_236;
    float _248 = fma(_246, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _250 = _236 < 0.5;
    float _252 = float(_250);
    float _254 = fma(_224, 0.5, 0.5);
    float _256 = abs(_248);
    float _258 = _242 * _256;
    float _260 = float(_232);
    float _262 = -_252;
    float _264 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _266 = -_254;
    float _268 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _270 = float(_244);
    float _272 = fma(_260, _268, _258);
    float _274 = abs(_264);
    float _276 = fma(_270, _274, _272);
    bool _278 = !_230;
    float _294;
    if (!_278)
    {
        float _280 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _282 = _170 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _284 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[12].x, _138);
        float _286 = _284 * _280;
        float _288 = floor(_286);
        float _290 = -_288;
        float _292 = _286 + _290;
        _294 = _292;
        _296 = true;
    }
    else
    {
        _294 = _186;
    }
    _296 = false;
    float _298 = _294;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _302 = _298 + _300;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _306 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _304;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _310 = _308 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _314 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _312;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _318 = _316 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _320 = 1.0 / _306;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _324 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _322;
    bool _326 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _328 = isnan(_298);
    bool _330 = _326 || _328;
    bool _332 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _334 = _330 || _332;
    float _336 = float(_334);
    bool _338 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _340 = isnan(_298);
    bool _342 = _338 || _340;
    bool _344 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _346 = _342 || _344;
    float _348 = float(_346);
    float _350 = 1.0 / _314;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _354 = _298 + _352;
    float _356 = 1.0 / _310;
    float _358 = _354 * _320;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _362 = _298 + _360;
    bool _364 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _366 = isnan(_298);
    bool _368 = _364 || _366;
    bool _370 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _372 = _368 || _370;
    float _374 = float(_372);
    bool _376 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _378 = 1.0 / _324;
    float _380 = _362 * _350;
    bool _382 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _384 = isnan(_298);
    bool _386 = _382 || _384;
    bool _388 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _390 = _386 || _388;
    float _392 = float(_390);
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _396 = _298 + _394;
    bool _398 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _400 = isnan(_298);
    bool _402 = _398 || _400;
    bool _404 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _406 = _402 || _404;
    float _408 = float(_406);
    float _410 = 1.0 / _318;
    float _412 = _302 * _356;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _416 = _298 + _414;
    float _418 = -_392;
    float _420 = _418 + 1.0;
    bool _422 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _424 = isnan(_298);
    bool _426 = _422 || _424;
    bool _428 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _430 = _426 || _428;
    float _432 = float(_430);
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _436 = _434 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _438 = _416 * _378;
    float _440 = -_374;
    float _442 = _440 + 1.0;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _444;
    float _448 = fma(_436, _412, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _450 = _336 * _442;
    float _452 = -_336;
    float _454 = _452 + 1.0;
    float _456 = fma(_446, _358, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _458 = _396 * _410;
    float _460 = _408 * _420;
    float _462 = -_408;
    float _464 = _462 + 1.0;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _466;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _470;
    float _474 = _432 * _454;
    float _476 = _348 * _464;
    float _478 = -_348;
    float _480 = _478 + 1.0;
    float _482 = fma(_468, _358, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _484 = fma(_472, _358, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _486 = _456 * _474;
    float _488 = _374 * _480;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _492 = _490 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _496 = _494 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _498 = -_432;
    float _500 = _498 + 1.0;
    float _502 = _482 * _474;
    float _504 = fma(_492, _412, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _506 = fma(_496, _412, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _508 = _484 * _474;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _510;
    float _514 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[143].x, _486);
    float _516 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[143].z, _502);
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _522 = fma(_512, _380, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _524 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[143].y, _508);
    float _526 = fma(_448, _450, _514);
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _528;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _534 = _532 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _536;
    float _540 = fma(_520, _458, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _542 = fma(_506, _450, _516);
    float _544 = fma(_522, _488, _526);
    float _546 = fma(_530, _380, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _548 = fma(_534, _458, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _550 = fma(_504, _450, _524);
    float _552 = fma(_538, _380, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _556 = _554 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _558 = fma(_546, _488, _550);
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _562 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _560;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _564;
    float _568 = fma(_556, _458, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _570 = fma(_552, _488, _542);
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _572;
    float _576 = fma(_548, _476, _544);
    float _578 = fma(_562, _438, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _580 = fma(_566, _438, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _582 = fma(_574, _438, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _584 = fma(_568, _476, _558);
    float _586 = fma(_540, _476, _570);
    float _588 = fma(_578, _460, _576);
    float _590 = fma(_580, _460, _584);
    float _592 = fma(_582, _460, _586);
    float _594 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[148].x, _588);
    float _596 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[148].y, _590);
    float _598 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[148].z, _592);
    bool _600 = !_376;
    float _616;
    if (!_600)
    {
        float _602 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _604 = _170 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _606 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[11].x, _138);
        float _608 = _606 * _602;
        float _610 = floor(_608);
        float _612 = -_610;
        float _614 = _608 + _612;
        _616 = _614;
        _618 = true;
    }
    else
    {
        _616 = _186;
    }
    _618 = false;
    float _620 = _616;
    float _622 = in.m_61.x;
    float _624 = in.m_61.y;
    float _626 = in.m_61.z;
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _630 = _620 + _628;
    bool _632 = _620 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _634 = isnan(_620);
    bool _636 = _632 || _634;
    bool _638 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _640 = _636 || _638;
    float _642 = float(_640);
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _644;
    bool _648 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _650 = 1.0 / _646;
    float _652 = _596 * _624;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _656 = _654 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _658 = _598 * _626;
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _662 = _620 + _660;
    bool _664 = _620 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _666 = isnan(_620);
    bool _668 = _664 || _666;
    bool _670 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _672 = _668 || _670;
    float _674 = float(_672);
    float _676 = _630 * _650;
    bool _678 = _620 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _680 = isnan(_620);
    bool _682 = _678 || _680;
    bool _684 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _686 = _682 || _684;
    float _688 = float(_686);
    float _690 = 1.0 / _656;
    float _692 = -_642;
    float _694 = _692 + 1.0;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _696;
    float _700 = -_688;
    float _702 = _700 + 1.0;
    float _704 = _688 * _694;
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _706;
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _712 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _710;
    float _714 = _674 * _702;
    float _716 = fma(_698, _676, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _718 = fma(_708, _676, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _720 = fma(_712, _676, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _722 = -_674;
    float _724 = _722 + 1.0;
    float _726 = _594 * _622;
    float _728 = _720 * _714;
    float _730 = _662 * _690;
    float _732 = _718 * _714;
    float _734 = _716 * _714;
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _738 = _736 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _742 = _740 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _746 = _744 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _748 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[107].x, _732);
    float _750 = fma(_738, _730, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _752 = fma(_742, _730, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _754 = fma(_746, _730, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _756 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[107].y, _728);
    float _758 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[107].z, _734);
    float _760 = fma(_750, _704, _748);
    float _762 = fma(_752, _704, _756);
    float _764 = fma(_754, _704, _758);
    float _766 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[109].x, _760);
    float _768 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[109].y, _762);
    float _770 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[109].z, _764);
    bool _772 = !_648;
    float _788;
    if (!_772)
    {
        float _774 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _776 = _170 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _778 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[11].y, _138);
        float _780 = _778 * _774;
        float _782 = floor(_780);
        float _784 = -_782;
        float _786 = _780 + _784;
        _788 = _786;
        _790 = true;
    }
    else
    {
        _788 = _186;
    }
    _790 = false;
    float _792 = _788;
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _796 = _792 + _794;
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _800 = _798 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _804 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _802;
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _808 = _806 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _810 = _792 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _812 = isnan(_792);
    bool _814 = _810 || _812;
    bool _816 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _818 = _814 || _816;
    float _820 = float(_818);
    float _822 = 1.0 / _800;
    float _824 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _826 = _824 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _828 = _792 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _830 = isnan(_792);
    bool _832 = _828 || _830;
    bool _834 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _836 = _832 || _834;
    float _838 = float(_836);
    bool _840 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _842 = 1.0 / _808;
    float _844 = _804 * _822;
    bool _846 = _792 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _848 = isnan(_792);
    bool _850 = _846 || _848;
    bool _852 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _854 = _850 || _852;
    float _856 = float(_854);
    float _858 = 1.0 / _826;
    float _860 = -_820;
    float _862 = _860 + 1.0;
    float _864 = fma(_844, _796, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _866 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _868 = _866 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _870 = _792 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _872 = isnan(_792);
    bool _874 = _870 || _872;
    bool _876 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _878 = _874 || _876;
    float _880 = float(_878);
    float _882 = -_856;
    float _884 = _882 + 1.0;
    float _886 = _856 * _862;
    float _888 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _890 = _888 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _892 = 1.0 / _868;
    float _894 = -_880;
    float _896 = _894 + 1.0;
    float _898 = _838 * _884;
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _902 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _900;
    float _904 = _890 * _842;
    float _906 = _820 * _896;
    float _908 = _864 * _898;
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _912 = _792 + _910;
    float _914 = -_838;
    float _916 = _914 + 1.0;
    bool _918 = _792 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _920 = isnan(_792);
    bool _922 = _918 || _920;
    bool _924 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _926 = _922 || _924;
    float _928 = float(_926);
    float _930 = _902 * _858;
    float _932 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _934 = _932 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _936 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _938 = _792 + _936;
    float _940 = fma(_904, _912, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _942 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[115].x, _908);
    float _944 = -_928;
    float _946 = _944 + 1.0;
    float _948 = _934 * _892;
    float _950 = fma(_930, _938, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _952 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _954 = _792 + _952;
    float _956 = fma(_940, _886, _942);
    float _958 = _880 * _946;
    float _960 = _768 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _962 = fma(_948, _954, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _964 = fma(_950, _906, _956);
    float _966 = _960 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _968 = fma(_962, _958, _964);
    float _970 = _766 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _972 = _770 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _974 = fma(_928, (*spvDescriptorSet0.vp_c9)._m0[119].x, _968);
    float _976 = _970 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _978 = _972 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _980 = _974 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_63.x = _976;
    out.m_63.y = _966;
    out.m_63.z = _978;
    out.m_63.w = _980;
    bool _982 = !_840;
    float _998;
    if (!_982)
    {
        float _984 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _986 = _170 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _988 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[11].z, _138);
        float _990 = _988 * _984;
        float _992 = floor(_990);
        float _994 = -_992;
        float _996 = _990 + _994;
        _998 = _996;
        _1000 = true;
    }
    else
    {
        _998 = _186;
    }
    _1000 = false;
    float _1002 = _998;
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1006 = _1002 + _1004;
    bool _1008 = _1002 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1010 = isnan(_1002);
    bool _1012 = _1008 || _1010;
    bool _1014 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1016 = _1012 || _1014;
    float _1018 = float(_1016);
    float _1020 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1022 = _1002 + _1020;
    bool _1024 = _1002 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1026 = isnan(_1002);
    bool _1028 = _1024 || _1026;
    bool _1030 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1032 = _1028 || _1030;
    float _1034 = float(_1032);
    float _1036 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1038 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1036;
    float _1040 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1042 = _1040 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1044 = _1002 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1046 = isnan(_1002);
    bool _1048 = _1044 || _1046;
    bool _1050 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1052 = _1048 || _1050;
    float _1054 = float(_1052);
    float _1056 = -_1018;
    float _1058 = _1056 + 1.0;
    float _1060 = 1.0 / _1042;
    float _1062 = _1054 * _1058;
    float _1064 = -_1054;
    float _1066 = _1064 + 1.0;
    float _1068 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1070 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1068;
    bool _1072 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1074 = 1.0 / _1038;
    float _1076 = _1034 * _1066;
    float _1078 = -_1034;
    float _1080 = _1078 + 1.0;
    float _1082 = _1022 * _1060;
    float _1084 = _1006 * _1074;
    float _1086 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1088 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1086;
    float _1090 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1092 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1090;
    float _1094 = fma(_1070, _1084, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1096 = fma(_1088, _1084, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1098 = fma(_1092, _1084, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1100 = _1094 * _1076;
    float _1102 = _1096 * _1076;
    float _1104 = _1098 * _1076;
    float _1106 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1108 = _1106 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1110 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1112 = _1110 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1114 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1116 = _1114 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1118 = fma(_1080, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1100);
    float _1120 = fma(_1080, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1102);
    float _1122 = fma(_1108, _1082, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1124 = fma(_1112, _1082, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1126 = fma(_1116, _1082, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1128 = fma(_1080, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1104);
    float _1130 = fma(_1122, _1062, _1118);
    float _1132 = fma(_1124, _1062, _1120);
    float _1134 = fma(_1126, _1062, _1128);
    float _1136 = fma(_1018, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1130);
    float _1138 = fma(_1018, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1132);
    float _1140 = fma(_1018, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1134);
    bool _1142 = !_1072;
    float _1158;
    if (!_1142)
    {
        float _1144 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1146 = _170 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1148 = fma(_1146, (*spvDescriptorSet0.vp_c9)._m0[11].w, _138);
        float _1150 = _1148 * _1144;
        float _1152 = floor(_1150);
        float _1154 = -_1152;
        float _1156 = _1150 + _1154;
        _1158 = _1156;
        _1160 = true;
    }
    else
    {
        _1158 = _186;
    }
    _1160 = false;
    float _1162 = _1158;
    bool _1164 = _1162 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1166 = isnan(_1162);
    bool _1168 = _1164 || _1166;
    bool _1170 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1172 = _1168 || _1170;
    float _1174 = float(_1172);
    float _1176 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1178 = _1176 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1180 = _1162 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1182 = isnan(_1162);
    bool _1184 = _1180 || _1182;
    bool _1186 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1188 = _1184 || _1186;
    float _1190 = float(_1188);
    float _1192 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1194 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1192;
    float _1196 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1198 = _1162 + _1196;
    float _1200 = -_1174;
    float _1202 = _1200 + 1.0;
    bool _1204 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1206 = 1.0 / _1178;
    float _1208 = _1190 * _1202;
    float _1210 = -_1190;
    float _1212 = _1210 + 1.0;
    float _1214 = _1194 * _1206;
    float _1216 = _1140 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1218 = fma(_1214, _1198, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1220 = _1138 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1222 = _1216 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1224 = _1218 * _1208;
    float _1226 = _1220 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1228 = fma(_1212, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1224);
    float _1230 = _1136 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1232 = fma(_1174, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1228);
    float _1234 = _1230 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1236 = _1232 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_65.x = _1234;
    out.m_65.y = _1226;
    out.m_65.z = _1222;
    out.m_65.w = _1236;
    bool _1238 = !_1204;
    float _1254;
    if (!_1238)
    {
        float _1240 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1242 = _170 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1244 = fma(_1242, (*spvDescriptorSet0.vp_c9)._m0[14].x, _138);
        float _1246 = _1244 * _1240;
        float _1248 = floor(_1246);
        float _1250 = -_1248;
        float _1252 = _1246 + _1250;
        _1254 = _1252;
        _1256 = true;
    }
    else
    {
        _1254 = _186;
    }
    _1256 = false;
    float _1258 = _1254;
    float _1260 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1262 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _1260;
    float _1264 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1266 = _1264 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1268 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1270 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _1268;
    float _1272 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1274 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _1272;
    float _1276 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1278 = _1276 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1280 = 1.0 / _1262;
    float _1282 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1284 = _1282 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1286 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1288 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _1286;
    bool _1290 = _1258 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1292 = isnan(_1258);
    bool _1294 = _1290 || _1292;
    bool _1296 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1298 = _1294 || _1296;
    float _1300 = float(_1298);
    float _1302 = 1.0 / _1266;
    float _1304 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1306 = _1258 + _1304;
    bool _1308 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _1310 = 1.0 / _1278;
    float _1312 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1314 = _1258 + _1312;
    float _1316 = _1306 * _1280;
    bool _1318 = _1258 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1320 = isnan(_1258);
    bool _1322 = _1318 || _1320;
    bool _1324 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1326 = _1322 || _1324;
    float _1328 = float(_1326);
    float _1330 = 1.0 / _1274;
    float _1332 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1334 = _1258 + _1332;
    float _1336 = _1314 * _1302;
    float _1338 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1340 = _1258 + _1338;
    float _1342 = 1.0 / _1270;
    float _1344 = 1.0 / _1288;
    float _1346 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1348 = _1258 + _1346;
    float _1350 = _1334 * _1330;
    float _1352 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1354 = _1258 + _1352;
    bool _1356 = _1258 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1358 = isnan(_1258);
    bool _1360 = _1356 || _1358;
    bool _1362 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1364 = _1360 || _1362;
    float _1366 = float(_1364);
    float _1368 = _1348 * _1310;
    bool _1370 = _1258 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1372 = isnan(_1258);
    bool _1374 = _1370 || _1372;
    bool _1376 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1378 = _1374 || _1376;
    float _1380 = float(_1378);
    float _1382 = _1340 * _1342;
    float _1384 = -_1328;
    float _1386 = _1384 + 1.0;
    float _1388 = -_1380;
    float _1390 = _1388 + 1.0;
    bool _1392 = _1258 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1394 = isnan(_1258);
    bool _1396 = _1392 || _1394;
    bool _1398 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1400 = _1396 || _1398;
    float _1402 = float(_1400);
    float _1404 = _1380 * _1386;
    float _1406 = 1.0 / _1284;
    float _1408 = _1366 * _1390;
    float _1410 = _1354 * _1344;
    bool _1412 = _1258 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1414 = isnan(_1258);
    bool _1416 = _1412 || _1414;
    bool _1418 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1420 = _1416 || _1418;
    float _1422 = float(_1420);
    float _1424 = -_1366;
    float _1426 = _1424 + 1.0;
    float _1428 = -_1422;
    float _1430 = _1428 + 1.0;
    float _1432 = _1422 * _1426;
    float _1434 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1436 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1434;
    float _1438 = -(*spvDescriptorSet0.vp_c9)._m0[159].z;
    float _1440 = (*spvDescriptorSet0.vp_c9)._m0[160].z + _1438;
    float _1442 = _1402 * _1430;
    float _1444 = -_1402;
    float _1446 = _1444 + 1.0;
    bool _1448 = _1258 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1450 = isnan(_1258);
    bool _1452 = _1448 || _1450;
    bool _1454 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1456 = _1452 || _1454;
    float _1458 = float(_1456);
    float _1460 = fma(_1436, _1316, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1462 = fma(_1440, _1316, (*spvDescriptorSet0.vp_c9)._m0[159].z);
    float _1464 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1466 = _1258 + _1464;
    bool _1468 = _1258 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1470 = isnan(_1258);
    bool _1472 = _1468 || _1470;
    bool _1474 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1476 = _1472 || _1474;
    float _1478 = float(_1476);
    float _1480 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1482 = _1480 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1484 = -_1458;
    float _1486 = _1484 + 1.0;
    float _1488 = _1300 * _1446;
    float _1490 = -_1300;
    float _1492 = _1490 + 1.0;
    float _1494 = _1466 * _1406;
    float _1496 = _1478 * _1486;
    float _1498 = -_1478;
    float _1500 = _1498 + 1.0;
    float _1502 = _1458 * _1492;
    float _1504 = -(*spvDescriptorSet0.vp_c9)._m0[160].z;
    float _1506 = _1504 + (*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _1508 = _1460 * _1496;
    float _1510 = _1462 * _1496;
    float _1512 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1514 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1512;
    float _1516 = fma(_1482, _1336, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1518 = fma(_1500, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1508);
    float _1520 = -(*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _1522 = (*spvDescriptorSet0.vp_c9)._m0[162].z + _1520;
    float _1524 = fma(_1506, _1336, (*spvDescriptorSet0.vp_c9)._m0[160].z);
    float _1526 = fma(_1500, (*spvDescriptorSet0.vp_c9)._m0[159].z, _1510);
    float _1528 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1530 = _1528 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1532 = fma(_1514, _1382, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1534 = fma(_1516, _1502, _1518);
    float _1536 = fma(_1522, _1382, (*spvDescriptorSet0.vp_c9)._m0[161].z);
    float _1538 = fma(_1524, _1502, _1526);
    float _1540 = -(*spvDescriptorSet0.vp_c9)._m0[162].z;
    float _1542 = _1540 + (*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _1544 = fma(_1532, _1488, _1534);
    float _1546 = -(*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _1548 = (*spvDescriptorSet0.vp_c9)._m0[164].z + _1546;
    float _1550 = fma(_1536, _1488, _1538);
    float _1552 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1554 = _1552 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1556 = -(*spvDescriptorSet0.vp_c9)._m0[164].z;
    float _1558 = _1556 + (*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _1560 = fma(_1530, _1368, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1562 = fma(_1542, _1368, (*spvDescriptorSet0.vp_c9)._m0[162].z);
    float _1564 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1566 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1564;
    float _1568 = fma(_1548, _1350, (*spvDescriptorSet0.vp_c9)._m0[163].z);
    float _1570 = fma(_1554, _1494, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1572 = fma(_1558, _1494, (*spvDescriptorSet0.vp_c9)._m0[164].z);
    float _1574 = fma(_1566, _1350, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1576 = fma(_1560, _1442, _1544);
    float _1578 = fma(_1562, _1442, _1550);
    float _1580 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1582 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1580;
    float _1584 = -(*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _1586 = (*spvDescriptorSet0.vp_c9)._m0[166].z + _1584;
    float _1588 = fma(_1574, _1432, _1576);
    float _1590 = fma(_1568, _1432, _1578);
    float _1592 = fma(_1582, _1410, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1594 = fma(_1586, _1410, (*spvDescriptorSet0.vp_c9)._m0[165].z);
    float _1596 = fma(_1570, _1408, _1588);
    float _1598 = fma(_1572, _1408, _1590);
    float _1600 = fma(_1592, _1404, _1596);
    float _1602 = fma(_1594, _1404, _1598);
    float _1604 = fma(_1328, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1600);
    float _1606 = fma(_1328, (*spvDescriptorSet0.vp_c9)._m0[166].z, _1602);
    out.m_67.x = _1604;
    out.m_67.z = _1606;
    bool _1608 = !_1308;
    float _1610 = _1404;
    int _1612 = as_type<int>(_1606);
    float _1614 = _1568;
    if (!_1608)
    {
        float _1616 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1618 = _170 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1620 = fma(_1618, (*spvDescriptorSet0.vp_c9)._m0[14].y, _138);
        float _1622 = _1620 * _1616;
        float _1624 = floor(_1622);
        float _1626 = -_1624;
        float _1628 = _1622 + _1626;
        _1610 = _1616;
        _188 = _1628;
    }
    float _1630 = _1610;
    float _1632 = _188;
    float _1634 = in.m_69.y;
    float _1636 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1638 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1640 = _1638 != 0;
    float _1642 = in.m_57.w;
    int _1644 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1646 = _1644 != 0;
    int _1648 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1650 = _1648 != 0;
    float _1652 = in.m_69.x;
    float _1654 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1656 = in.m_57.y;
    float _1658 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1660 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1662 = _1660 != 0;
    float _1664 = _1432;
    if (_1640)
    {
        float _1666 = in.m_57.z;
        _1664 = _1666;
    }
    float _1668 = _1664;
    float _1670 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1672 = _1636 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1674 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1676 = _1630;
    float _1678 = _1672;
    if (!_1646)
    {
        float _1680 = in.m_57.z;
        _1676 = _1680;
    }
    float _1682 = _1676;
    float _1684 = -_1634;
    float _1686 = _1684 + 1.0;
    bool _1688 = _1642 > 0.5;
    int _1690 = _1688 ? as_type<int>(_1686) : as_type<int>(_1634);
    bool _1692 = _1688;
    float _1694 = _1668;
    float _1696 = _1634;
    if (_1640)
    {
        float _1698 = -_1652;
        float _1700 = _1698 + 1.0;
        _1612 = as_type<int>(_1700);
    }
    int _1702 = _1612;
    if (!_1662)
    {
        _1614 = _1652;
    }
    float _1704 = _1614;
    float _1706 = _1650 ? as_type<float>(_1690) : _1634;
    float _1708 = _1706;
    float _1710 = _1704;
    if (_1640)
    {
        bool _1712 = _1668 > 0.5;
        _1692 = _1712;
    }
    bool _1714 = _1692;
    float _1716 = fma(_1706, _1672, -0.5);
    if (!_1640)
    {
        _1694 = _1652;
    }
    float _1718 = _1694;
    float _1720 = _1718;
    if (!_1646)
    {
        _1708 = _1656;
    }
    float _1722 = _1708;
    float _1724 = _1722;
    if (_1640)
    {
        float _1726 = _1714 ? as_type<float>(_1702) : _1652;
        _1720 = _1726;
    }
    float _1728 = _1720;
    if (_1646)
    {
        _1724 = _170;
    }
    float _1730 = _1724;
    float _1732 = _1682;
    if (!_1646)
    {
        _1678 = _1682;
    }
    float _1734 = _1678;
    float _1736 = fma(_1730, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1658);
    float _1738 = _1734;
    if (_1646)
    {
        _1738 = _1656;
    }
    float _1740 = _1738;
    float _1742 = _1730 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_1646)
    {
        _1732 = _1656;
    }
    float _1744 = _1732;
    float _1746 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1748 = _1654 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1750 = _1740 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1752 = -_1746;
    float _1754 = fma(_1742, 2.0, _1752);
    float _1756 = fma(_1744, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1674);
    float _1758 = fma(_1750, -2.0, _1670);
    float _1760 = fma(_1748, _1728, -0.5);
    float _1762 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1736);
    float _1764 = -_138;
    float _1766 = fma(_1764, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1754);
    float _1768 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1756);
    float _1770 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1758);
    float _1772 = fma(_1762, _1760, _1766);
    float _1774 = -_1770;
    float _1776 = fma(_1768, _1716, _1774);
    float _1778 = _1772 + 0.5;
    float _1780 = _1776 + 0.5;
    float2 _6706 = float2(_1778, _1780);
    float _1782 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_6706, float2(0.0), isnan(_6706)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_6706, float2(0.0), isnan(_6706)), level(0.0)).w;
    float _1784 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1786 = int(_1784);
    float _1788 = in.m_71.x;
    float _1790 = in.m_71.y;
    float _1792 = in.m_71.z;
    float _1794 = in.m_71.w;
    float _1796 = _276 * _726;
    float _1798 = _276 * _652;
    bool _1800 = !_1646;
    float _1802 = _1800 ? 7.345489978790283203125 : 1.0;
    float _1804 = _276 * _658;
    int _1806 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1808 = _1806 != 0;
    int _1810 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1812 = _1810 != 0;
    int _1814 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1816 = _1814 != 0;
    float _1818 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1820 = int(_1818);
    int _1822 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1824 = _1822 != 0;
    float _1826 = _1802 * _170;
    int _1828 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1830 = _1828 != 0;
    float _1832 = _1798 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1834 = _1796 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1836 = _1804 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _1838 = !_1830;
    int _1840 = _1838 ? 0 : 1;
    float _1842 = float(_1786);
    bool _1844 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1846 = isnan(0.5);
    bool _1848 = _1844 || _1846;
    bool _1850 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1852 = _1848 || _1850;
    float _1854 = 1.0 / _1842;
    float _1856 = float(uint(_1820));
    int _1858 = ~_1820;
    int _1860 = _1858 + 1;
    float _1862 = 1.0 / _1856;
    float _1864 = _138 * _1854;
    int _1866 = ~_1820;
    int _1868 = _1866 + 1;
    float _1870 = trunc(_1864);
    int _1872 = int(_1870);
    int _1874 = as_type<int>(_1862) + (-2);
    float _1876 = float(uint(_1872));
    float _1878 = float(_1872);
    float _1880 = as_type<float>(_1874) * _1876;
    float _1882 = in.m_73.x;
    float _1884 = in.m_73.y;
    float _1886 = in.m_73.z;
    float _1888 = in.m_73.w;
    float _1890 = trunc(_1880);
    float _1892 = precise::max(_1890, 0.0);
    uint _1895 = uint(_1892);
    float _1897 = in.m_75.x;
    float _1899 = in.m_75.y;
    float _1901 = in.m_75.z;
    float _1903 = in.m_75.w;
    int _1905 = _1868 * int(_1895);
    int _1907 = _1905 + _1872;
    float _1909 = float(uint(_1907));
    float _1911 = as_type<float>(_1874) * _1909;
    float _1913 = in.m_48.x;
    float _1915 = in.m_48.y;
    float _1917 = in.m_48.z;
    float _1919 = trunc(_1911);
    float _1921 = precise::max(_1919, 0.0);
    uint _1923 = uint(_1921);
    int _1925 = int(_1895) + int(_1923);
    float _1927 = float(_1820);
    float _1929 = floor(_1826);
    float _1931 = _1915 * _1790;
    int _1933 = _1860 * _1925;
    int _1935 = _1933 + _1872;
    bool _1937 = _1878 >= _1927;
    bool _1939 = isnan(_1878);
    bool _1941 = _1937 || _1939;
    bool _1943 = isnan(_1927);
    bool _1945 = _1941 || _1943;
    float _1947 = float(_1945);
    float _1949 = _1915 * _1884;
    float _1951 = _1915 * _1899;
    float _1953 = fma(_1913, _1788, _1931);
    bool _1955 = uint(_1935) >= uint(_1820);
    float _1957 = fma(_1913, _1882, _1949);
    float _1959 = trunc(_1947);
    int _1961 = int(_1959);
    float _1963 = fma(_1917, _1792, _1953);
    bool _1965 = !_1955;
    int _1967 = _1965 ? 0 : (-1);
    float _1969 = fma(_1917, _1886, _1957);
    bool _1971 = _1820 == 0;
    int _1973 = ~_1925;
    int _1975 = _1973 + _1967;
    int _1977 = _1975 + 1;
    float _1979 = -_1929;
    float _1981 = _1826 + _1979;
    float _1983 = fma(_1913, _1897, _1951);
    float _1985 = _138 * _1927;
    int _1987 = _1820 + (-1);
    int _1989 = _1820 * _1977;
    int _1991 = _1989 + _1872;
    float _1993 = _1981 * _1927;
    float _1995 = _1985 * _178;
    bool _1997 = !_1808;
    int _1999 = _1997 ? 0 : 1;
    float _2001 = fma(_1917, _1901, _1983);
    int _2003 = ~_1961;
    int _2005 = _2003 + 1;
    int _2007 = _2005 + 1;
    float _2009 = trunc(_1993);
    int _2011 = int(_2009);
    bool _2013 = !_1971;
    int _2015 = _2013 ? _1991 : (-1);
    float _2017 = _2001 + _1903;
    int _2019 = abs(_1999);
    int _2021 = abs(_1840);
    int _2023 = _2015 * _2007;
    bool _2025 = !_1812;
    int _2027 = _2025 ? 0 : 1;
    float _2029 = trunc(_1995);
    int _2031 = int(_2029);
    bool _2033 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2035 = isnan(0.5);
    bool _2037 = _2033 || _2035;
    bool _2039 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2041 = _2037 || _2039;
    int _2043 = _1961 * _1987;
    int _2045 = _2043 + _2023;
    int _2047 = abs(_2027);
    float _2049 = _170 * 6.283185482025146484375;
    bool _2051 = !_1816;
    int _2053 = _2051 ? 0 : 1;
    int _2055 = _2045 * _2047;
    int _2057 = abs(_2053);
    int _2059 = _2011 * _2021;
    int _2061 = _2059 + _1872;
    float _2063 = _2049 * 0.15915493667125701904296875;
    float _2065 = _138 + _2049;
    bool _2067 = !_1824;
    int _2069 = _2067 ? 0 : 1;
    float _2071 = _2063 * 6.283185482025146484375;
    float _2073 = cos(_2071);
    int _2075 = _2031 * _2019;
    int _2077 = _2075 + _2055;
    float _2079 = _2065 * 0.070000000298023223876953125;
    float _2081 = _1963 + _1794;
    int _2083 = abs(_2069);
    int _2085 = _2061 * _2057;
    int _2087 = _2085 + _2077;
    float _2089 = _1969 + _1888;
    float _2091 = in.m_77.x;
    float _2093 = in.m_77.y;
    float _2095 = in.m_77.z;
    float _2097 = _2063 * 6.283185482025146484375;
    float _2099 = sin(_2097);
    int _2101 = _2011 * _2083;
    int _2103 = _2101 + _2087;
    float _2105 = _2073 * _2093;
    float _2107 = fma(_2099, _2091, _2105);
    float _2109 = fma(_1782, 6.283185482025146484375, _2079);
    float _2111 = _2109 * 0.15915493667125701904296875;
    float _2113 = _2099 * _2093;
    float _2115 = _2111 * 6.283185482025146484375;
    float _2117 = sin(_2115);
    float _2119 = -_2113;
    float _2121 = fma(_2073, _2091, _2119);
    float _2123 = _2117 * 0.100000001490116119384765625;
    float _2125 = fma(_2107, _2123, _2107);
    float _2127 = fma(_2121, _2123, _2121);
    float _2129 = fma(_2123, _2095, _2095);
    float _2131 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2125);
    float _2133 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2129);
    float _2135 = _1832 * _2131;
    float _2137 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2127);
    float _2139 = _1836 * _2133;
    float _2141 = _2089 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2143 = _2135 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2145 = _1834 * _2137;
    float _2147 = _2135 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2149 = fma(_2081, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2141);
    float _2151 = _2089 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2153 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2143);
    float _2155 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2147);
    float _2157 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2149);
    float _2159 = fma(_2081, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2151);
    float _2161 = fma(_2139, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2153);
    float _2163 = fma(_2139, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2155);
    float _2165 = _2157 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2167 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2159);
    float _2169 = _2161 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2171 = _2163 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2173 = _2167 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2175 = _2017 + _2169;
    float _2177 = _2081 + _2171;
    float _2179 = _2165 + _2173;
    float _2181 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2183 = _2175 + _2181;
    float _2185 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2187 = _2177 + _2185;
    float _2189 = 1.0 / _2173;
    float _2191 = _2183 * _2183;
    float _2193 = fma(_2187, _2187, _2191);
    float _2195 = _2135 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2197 = sqrt(_2193);
    float _2199 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2195);
    float _2201 = fma(_2139, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2199);
    float _2203 = _2179 * _2189;
    float _2205 = _2203 * 0.5;
    float _2207 = _2201 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2209 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2211 = fma(_2205, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2209);
    float _2213 = _2089 + _2207;
    float _2215 = 1.0 / _2211;
    bool _2217 = _2197 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2219 = _2207;
    float _2221 = _2205;
    float _2223 = _2177;
    float _2225 = _2175;
    float _2227 = _2145;
    float _2229 = _2187;
    float _2231 = _1993;
    if (!_2217)
    {
        _2219 = _2177;
    }
    float _2233 = _2219;
    float _2235 = _2233;
    if (!_2217)
    {
        _2221 = _2175;
    }
    float _2237 = _2221;
    float _2239 = _2237;
    if (!_2217)
    {
        _2223 = _2213;
    }
    float _2241 = _2223;
    bool _2243 = !_2217;
    float _2245 = _2241;
    if (!_2243)
    {
        float _2247 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2249 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2251 = _2197 + _2249;
        float _2253 = _2213 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2255 = rsqrt(_2193);
        float _2257 = _2251 * _2247;
        float _2259 = _2257 * 0.15915493667125701904296875;
        float _2261 = _2259 * 6.283185482025146484375;
        float _2263 = cos(_2261);
        float _2265 = _2259 * 6.283185482025146484375;
        float _2267 = sin(_2265);
        float _2269 = _2263 + (-1.0);
        float _2271 = _2269 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2273 = fma(_2267, _2253, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2275 = fma(_2213, _2263, _2271);
        float _2277 = _2255 * _2273;
        float _2279 = fma(_2187, _2277, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2281 = fma(_2183, _2277, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2235 = _2279;
        _2245 = _2275;
        _2239 = _2281;
    }
    float _2283 = _2235;
    float _2285 = _2245;
    float _2287 = _2239;
    float _2289 = _2285;
    float _2291 = _2283;
    float _2293 = _2287;
    if (!_1852)
    {
        float _2295 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2297 = _2089 + _2295;
        float _2299 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2301 = _2081 + _2299;
        float _2303 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2305 = _2297 * _2297;
        float _2307 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2309 = _2017 + _2307;
        float _2311 = fma(_2301, _2301, _2305);
        float _2313 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2315 = fma(_2309, _2309, _2311);
        float _2317 = sqrt(_2315);
        float _2319 = _2303 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2321 = precise::min(_2317, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2323 = _2321 * _2313;
        float _2325 = -_2081;
        float _2327 = _2325 + _2283;
        float _2329 = _2319 * _2323;
        float _2331 = -_2089;
        float _2333 = _2331 + _2285;
        float _2335 = -_2017;
        float _2337 = _2335 + _2287;
        float _2339 = fma(_2327, _2329, _2081);
        float _2341 = fma(_2333, _2329, _2089);
        float _2343 = fma(_2337, _2329, _2017);
        _2289 = _2341;
        _2291 = _2339;
        _2293 = _2343;
        _2225 = _2313;
    }
    float _2345 = _2289;
    float _2347 = _2291;
    float _2349 = _2293;
    float _2351 = _2225;
    float _2353 = _2351;
    if (_2041)
    {
        _2227 = 1.0;
    }
    float _2355 = _2227;
    float _2357 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2359 = _2215 * _2357;
    float _2361 = _2355;
    if (!_2041)
    {
        float _2363 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2365 = _2363 * 0.15915493667125701904296875;
        float _2367 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2369 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2371 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2369;
        float _2373 = _2365 * 6.283185482025146484375;
        float _2375 = cos(_2373);
        float _2377 = _2367 * 0.15915493667125701904296875;
        float _2379 = _2365 * 6.283185482025146484375;
        float _2381 = sin(_2379);
        float _2383 = 1.0 / _2375;
        float _2385 = _2377 * 6.283185482025146484375;
        float _2387 = cos(_2385);
        float _2389 = _2381 * _2383;
        float _2391 = _2377 * 6.283185482025146484375;
        float _2393 = sin(_2391);
        float _2395 = _2387 * _2389;
        float _2397 = 1.0 / _2371;
        float _2399 = 1.0 / _2395;
        float _2401 = _2393 * _2399;
        float _2403 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2405 = fma(_2359, _2401, _2403);
        float _2407 = _2405 * _2397;
        float _2409 = precise::clamp(_2407, 0.0, 1.0);
        _2353 = _2397;
        _2229 = _2377;
        _2361 = _2409;
    }
    float _2411 = _2353;
    float _2413 = _2229;
    float _2415 = _2361;
    float _2417 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2419 = _2345 + _2417;
    float _2421 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2423 = _2347 + _2421;
    float _2425 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2427 = _2349 + _2425;
    float _2429 = in.m_79.w;
    float _2431 = _2419 * _2419;
    float _2433 = fma(_2423, _2423, _2431);
    float _2435 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2437 = _2435 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2439 = fma(_2427, _2427, _2433);
    float _2441 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2443 = _2441 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2445 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2447 = _2445 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2449 = rsqrt(_2439);
    float _2451 = sqrt(_2439);
    float _2453 = _2449 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2455 = 1.0 / _2437;
    float _2457 = _2423 * _2453;
    float _2459 = _2427 * _2453;
    float _2461 = _2457 * _2457;
    float _2463 = _2459 * _2459;
    float _2465 = 1.0 / _2443;
    float _2467 = _2461 + _2463;
    float _2469 = sqrt(_2467);
    float _2471 = 1.0 / _2447;
    bool _2473 = _2469 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2475 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2477 = _2469 + _2475;
    float _2479 = _2427;
    float _2481 = _2431;
    float _2483 = _2477;
    float _2485 = _2411;
    float _2487 = _2419;
    float _2489 = _2413;
    bool _2491 = _2473;
    if (_2473)
    {
        float _2493 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2479 = _2493;
    }
    float _2495 = _2479;
    if (_2473)
    {
        float _2497 = rsqrt(_2467);
        _2481 = _2497;
    }
    float _2499 = _2481;
    float _2501 = _2499;
    if (_2473)
    {
        float _2503 = _2477 * _2495;
        _2483 = _2503;
    }
    float _2505 = _2483;
    if (_2473)
    {
        float _2507 = _2505 * 0.15915493667125701904296875;
        _2485 = _2507;
    }
    float _2509 = _2485;
    float _2511 = fma(_2081, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2513 = _2495;
    if (_2473)
    {
        float _2515 = _2509 * 6.283185482025146484375;
        float _2517 = sin(_2515);
        _2513 = _2517;
    }
    float _2519 = _2513;
    float _2521 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2523 = precise::max(0.0, _2521);
    float _2525 = _2449;
    float _2527 = _2523;
    if (_2473)
    {
        float _2529 = _2509 * 6.283185482025146484375;
        float _2531 = cos(_2529);
        _2525 = _2531;
    }
    float _2533 = _2525;
    float _2535 = -_2453;
    float _2537 = -_2523;
    float _2539 = fma(_2419, _2535, _2537);
    if (_2473)
    {
        float _2541 = _2539 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2527 = _2541;
    }
    float _2543 = _2527;
    float _2545 = floor(_2511);
    float _2547 = _2543;
    float _2549 = _2519;
    if (_2473)
    {
        float _2551 = fma(_2519, _2543, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2547 = _2551;
    }
    float _2553 = _2547;
    float _2555 = _2553;
    if (!_2473)
    {
        _2549 = _2457;
    }
    float _2557 = _2549;
    float _2559 = _2557;
    float _2561 = _2533;
    if (_2473)
    {
        float _2563 = _2533 + (-1.0);
        _2487 = _2563;
    }
    float _2565 = _2487;
    float _2567 = _2565;
    if (_2473)
    {
        float _2569 = _2499 * _2553;
        _2231 = _2569;
    }
    float _2571 = _2231;
    if (!_2473)
    {
        _2555 = _2539;
    }
    float _2573 = _2555;
    float _2575 = _2573;
    if (_2473)
    {
        float _2577 = _2565 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2489 = _2577;
    }
    float _2579 = _2489;
    if (_2473)
    {
        float _2581 = _2457 * _2571;
        _2559 = _2581;
    }
    float _2583 = _2559;
    if (!_2473)
    {
        _2567 = _2459;
    }
    float _2585 = _2567;
    float _2587 = _2585;
    if (_2473)
    {
        float _2589 = _2459 * _2571;
        _2587 = _2589;
    }
    float _2591 = _2587;
    if (!_2473)
    {
        _2501 = _2461;
    }
    float _2593 = _2501;
    float _2595 = _2593;
    if (_2473)
    {
        float _2597 = fma(_2539, _2533, _2579);
        _2575 = _2597;
    }
    float _2599 = _2575;
    if (_2473)
    {
        float _2601 = _2583 * _2583;
        _2595 = _2601;
    }
    float _2603 = _2595;
    if (!_2473)
    {
        _2561 = _2463;
    }
    float _2605 = _2561;
    float _2607 = _2605;
    if (_2473)
    {
        float _2609 = _2591 * _2591;
        _2607 = _2609;
    }
    float _2611 = _2607;
    float _2613 = fma(_2599, _2599, _2603);
    float _2615 = -_2545;
    float _2617 = _2511 + _2615;
    float _2619 = _2613 + _2611;
    float _2621 = fma(_2017, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2623 = _2345 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2625 = rsqrt(_2619);
    float _2627 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2629 = fma(_2451, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2627);
    float _2631 = precise::clamp(_2629, 0.0, 1.0);
    float _2633 = fma(_2347, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2623);
    float _2635 = -_2631;
    float _2637 = _2635 + 1.0;
    float _2639 = _2345 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2641 = fma(_2349, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2633);
    float _2643 = floor(_2621);
    float _2645 = fma(_2347, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2639);
    float _2647 = _2641 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2649 = fma(_2349, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2645);
    float _2651 = _2625 * _2583;
    float _2653 = _2345 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2655 = _2625 * _2591;
    float _2657 = _2345 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2659 = abs(_2637);
    float _2661 = log2(_2659);
    float _2663 = fma(_2347, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2653);
    float _2665 = _2649 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2667 = fma(_2347, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2657);
    float _2669 = _2625 * _2599;
    float _2671 = fma(_2349, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2663);
    float _2673 = -_2643;
    float _2675 = _2621 + _2673;
    float _2677 = fma(_2349, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2667);
    float _2679 = _2669 + 1.0;
    float _2681 = _2671 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2683 = _2651 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2685 = _2677 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2687 = _2681 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2689 = _2661 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2691 = fma(_2685, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2687);
    float _2693 = fma(_2665, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2691);
    float _2695 = -_2683;
    float _2697 = fma(_2669, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2695);
    float _2699 = exp2(_2689);
    float _2701 = fma(_2647, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2693);
    float _2703 = -_2655;
    float _2705 = fma(_2703, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2697);
    float _2707 = fma(_2705, 0.5, 0.5);
    float _2709 = fma(_2705, -0.5, 0.5);
    float _2711 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2713 = _2665 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2715 = 1.0 / _2701;
    float _2717 = fma(_2707, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2719 = -_2713;
    float _2721 = fma(_2719, _2711, 1.0);
    float _2723 = _2681 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2725 = -_2669;
    float _2727 = fma(_2699, _2679, _2725);
    float _2729 = _2681 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2731 = fma(_2707, _2717, -0.212114393711090087890625);
    float _2733 = sqrt(_2709);
    float _2735 = fma(_2685, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2723);
    float _2737 = fma(_2685, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2729);
    float _2739 = fma(_2707, _2731, 1.570728778839111328125);
    float _2741 = fma(_2665, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2735);
    float _2743 = fma(_2665, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2737);
    float _2745 = log2(_2721);
    float _2747 = fma(_2647, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2741);
    float _2749 = fma(_2647, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2743);
    float2 _8179 = float2(_2617, _2675);
    float _2751 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8179, float2(0.0), isnan(_8179)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8179, float2(0.0), isnan(_8179)), level(0.0)).x;
    float _2753 = fma(_2727, 0.5, 0.5);
    float _2755 = _2747 * _2715;
    float _2757 = _2733 * 0.636619746685028076171875;
    float _2759 = -_2739;
    float _2761 = fma(_2757, _2759, 1.0);
    float _2763 = _2749 * _2715;
    float _2765 = fma(_2755, 0.5, 0.5);
    float _2767 = _2745 * 0.693147182464599609375;
    float _2769 = fma(_2763, -0.5, 0.5);
    float _2771 = float(uint(_2103));
    float _2773 = _2767 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float3 _8218 = float3(_2765, _2769, _2773);
    float _2775 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8218, float3(0.0), isnan(_8218)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8218, float3(0.0), isnan(_8218)), level(0.0)).x;
    float3 _8229 = float3(_2765, _2769, _2773);
    float4 _2778 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8229, float3(0.0), isnan(_8229)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8229, float3(0.0), isnan(_8229)), level(0.0)).xyzw;
    float _2780 = _2778.x;
    float _2782 = _2778.y;
    float _2784 = _2778.z;
    float _2786 = _2778.w;
    float2 _8245 = float2(_2761, _2753);
    float3 _2790 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8245, float2(0.0), isnan(_8245)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8245, float2(0.0), isnan(_8245)), level(0.0)).xyz;
    float _2792 = _2790.x;
    float _2794 = _2790.y;
    float _2796 = _2790.z;
    float _2798 = as_type<float>(_1874) * _2771;
    float _2800 = _170 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    out.m_81.w = _2429;
    float _2802 = trunc(_2798);
    float _2804 = precise::max(_2802, 0.0);
    uint _2806 = uint(_2804);
    float _2808 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2810 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    if (_1662)
    {
        bool _2812 = _170 > 0.5;
        _2491 = _2812;
    }
    bool _2814 = _2491;
    float _2816 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _2818 = ~_1820;
    int _2820 = _2818 + 1;
    float _2822 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2808);
    float _2824 = -_2810;
    float _2826 = fma(_2800, 2.0, _2824);
    float _2828 = _1656 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    out.m_83.x = _2081;
    out.m_83.y = _2089;
    out.m_83.z = _2017;
    float _2830 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2832 = _2830 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2834 = fma(_2828, -2.0, _2816);
    int _2836 = _2820 * int(_2806);
    int _2838 = _2836 + _2103;
    float _2840 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2842 = 1.0 / _2832;
    float _2844 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _2846 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _2844;
    float _2848 = float(uint(_2838));
    float _2850 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _2852 = _2850 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    int _2854 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2856 = _2854 != 0;
    float _2858 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2860 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _2858;
    int _2862 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2864 = _2862 != 0;
    float _2866 = as_type<float>(_1874) * _2848;
    float _2868 = _2852 * _2455;
    float _2870 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2872 = _2870 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2874 = _2846 * _2465;
    float _2876 = trunc(_2866);
    float _2878 = precise::max(_2876, 0.0);
    uint _2880 = uint(_2878);
    float _2882 = in.m_85.x;
    float _2884 = in.m_85.y;
    bool _2886 = _1656 > 0.5;
    float _2888 = fma(_1656, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2840);
    float _2890 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2892 = _2890 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _2894 = _2860 * _2471;
    float _2896 = in.m_87.x;
    float _2898 = in.m_87.y;
    float _2900 = 1.0 / _2872;
    float _2902 = -_138;
    float _2904 = fma(_2902, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2826);
    float _2906 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _2908 = _2906 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    int _2910 = ~_1820;
    int _2912 = _2910 + 1;
    float _2914 = _2661 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2916 = _1632 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _2918 = isnan(_1632);
    bool _2920 = _2916 || _2918;
    bool _2922 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _2924 = _2920 || _2922;
    float _2926 = float(_2924);
    float _2928 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2930 = _2928 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    int _2932 = int(_2806) + int(_2880);
    float _2934 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _2936 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _2934;
    int _2938 = ~_1820;
    int _2940 = _2938 + 1;
    float _2942 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _2944 = _2942 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2946 = 1.0 / _2892;
    float _2948 = -_2926;
    float _2950 = _2948 + 1.0;
    if (_2864)
    {
        float _2952 = _2886 ? _1686 : _1634;
        _1696 = _2952;
    }
    float _2954 = _1696;
    float _2956 = _2944 * _2842;
    int _2958 = _2940 * _2932;
    int _2960 = _2958 + _2103;
    float _2962 = _2936 * _2900;
    float _2964 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2888);
    float _2966 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2968 = _1632 + _2966;
    float _2970 = 1.0 / _2930;
    bool _2972 = uint(_2960) >= uint(_1820);
    float _2974 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2976 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _2974;
    float _2978 = _2073 * _2884;
    float _2980 = _2099 * _2898;
    bool _2982 = !_2972;
    int _2984 = _2982 ? 0 : (-1);
    out.m_89.x = _2347;
    out.m_89.y = _2345;
    out.m_89.z = _2349;
    float _2986 = fma(_2099, _2882, _2978);
    float _2988 = _2976 * _2946;
    float _2990 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2822);
    int _2992 = ~_2932;
    int _2994 = _2992 + _2984;
    int _2996 = _2994 + 1;
    float _2998 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2834);
    float _3000 = _2099 * _2884;
    float _3002 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _3004 = _1632 + _3002;
    float _3006 = exp2(_2914);
    int _3008 = _1820 * _2996;
    int _3010 = _3008 + _2103;
    float _3012 = -_3000;
    float _3014 = fma(_2073, _2882, _3012);
    float _3016 = _2073 * _2898;
    float _3018 = -_2980;
    float _3020 = fma(_2073, _2896, _3018);
    float _3022 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _3024 = _1632 + _3022;
    float _3026 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _3028 = _1632 + _3026;
    bool _3030 = !_1971;
    int _3032 = _3030 ? _3010 : (-1);
    float _3034 = fma(_2099, _2896, _3016);
    float _3036 = fma(_2874, _3024, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _3038 = fma(_2868, _3028, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _3040 = fma(_2894, _3004, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _3042 = float(uint(_2061));
    float _3044 = _2908 * _2970;
    bool _3046 = _1632 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _3048 = isnan(_1632);
    bool _3050 = _3046 || _3048;
    bool _3052 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _3054 = _3050 || _3052;
    float _3056 = float(_3054);
    int _3058 = _3032 >> 31;
    float _3060 = as_type<float>(_1874) * _3042;
    bool _3062 = _1632 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _3064 = isnan(_1632);
    bool _3066 = _3062 || _3064;
    bool _3068 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _3070 = _3066 || _3068;
    float _3072 = float(_3070);
    float _3074 = -_3056;
    float _3076 = _3074 + 1.0;
    int _3078 = _3058 & 3;
    float _3080 = -_3006;
    float _3082 = _3080 + 1.0;
    bool _3084 = _1632 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _3086 = isnan(_1632);
    bool _3088 = _3084 || _3086;
    bool _3090 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _3092 = _3088 || _3090;
    float _3094 = float(_3092);
    float _3096 = _3072 * _3076;
    int _3098 = _3032 + _3078;
    float _3100 = -_3072;
    float _3102 = _3100 + 1.0;
    float _3104 = trunc(_3060);
    float _3106 = precise::max(_3104, 0.0);
    uint _3108 = uint(_3106);
    bool _3110 = _1632 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _3112 = isnan(_1632);
    bool _3114 = _3110 || _3112;
    bool _3116 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _3118 = _3114 || _3116;
    float _3120 = float(_3118);
    float _3122 = -_3094;
    float _3124 = _3122 + 1.0;
    int _3126 = _3098 >> 2;
    float _3128 = _3094 * _3102;
    bool _3130 = _1632 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _3132 = isnan(_1632);
    bool _3134 = _3130 || _3132;
    bool _3136 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _3138 = _3134 || _3136;
    float _3140 = float(_3138);
    float _3142 = -_3120;
    float _3144 = _3142 + 1.0;
    int _3146 = _3126 << 4;
    int _3148 = _3146 + 368;
    float _3150 = _3120 * _3124;
    bool _3152 = _1632 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _3154 = isnan(_1632);
    bool _3156 = _3152 || _3154;
    bool _3158 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _3160 = _3156 || _3158;
    float _3162 = float(_3160);
    float _3164 = _3140 * _3144;
    float _3166 = -_3140;
    float _3168 = _3166 + 1.0;
    bool _3170 = _1632 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _3172 = isnan(_1632);
    bool _3174 = _3170 || _3172;
    bool _3176 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _3178 = _3174 || _3176;
    float _3180 = float(_3178);
    uint _3182 = uint(int(uint(_3148) >> uint(2)));
    uint _3184 = uint(int(uint(int(_3182)) >> uint(2)));
    int _3186 = int(_3182) & 3;
    float _3188 = (*spvDescriptorSet0.vp_c9)._m0[int(_3184)][_3186];
    int _3190 = int(_3182) + 1;
    uint _3192 = uint(int(uint(_3190) >> uint(2)));
    int _3194 = _3190 & 3;
    float _3196 = (*spvDescriptorSet0.vp_c9)._m0[int(_3192)][_3194];
    float _3198 = -_3162;
    float _3200 = _3198 + 1.0;
    float _3202 = _3162 * _3168;
    int _3204 = _2912 * int(_3108);
    int _3206 = _3204 + _2061;
    float _3208 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _3210 = _1632 + _3208;
    float _3212 = _2926 * _3200;
    float _3214 = _3180 * _2950;
    int _3216 = _3032 & 3;
    bool _3218 = _3216 != 0;
    float _3220 = fma(_3044, _3210, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _3222 = float(uint(_3206));
    float _3224 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3226 = _1632 + _3224;
    float _3228 = _3036 * _3214;
    float _3230 = _3082 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _3232 = _3148 + 8;
    uint _3234 = uint(int(uint(_3232) >> uint(2)));
    uint _3236 = uint(int(uint(int(_3234)) >> uint(2)));
    int _3238 = int(_3234) & 3;
    float _3240 = (*spvDescriptorSet0.vp_c9)._m0[int(_3236)][_3238];
    int _3242 = int(_3234) + 1;
    uint _3244 = uint(int(uint(_3242) >> uint(2)));
    int _3246 = _3242 & 3;
    float _3248 = (*spvDescriptorSet0.vp_c9)._m0[int(_3244)][_3246];
    float _3250 = as_type<float>(_1874) * _3222;
    float _3252 = fma(_2962, _3226, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    int _3254 = _3032 & 3;
    bool _3256 = _3254 != 0;
    float _3258 = -_3180;
    float _3260 = _3258 + 1.0;
    int _3262 = _3218 ? 0 : 1;
    float _3264 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3266 = _1632 + _3264;
    bool _3268 = uint(_3254) > 1u;
    float _3270 = trunc(_3250);
    float _3272 = precise::max(_3270, 0.0);
    uint _3274 = uint(_3272);
    float _3276 = fma(_2956, _2968, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _3278 = fma(_3260, (*spvDescriptorSet0.vp_c9)._m0[167].x, _3228);
    int _3280 = ~_3262;
    int _3282 = _3280 + 1;
    int _3284 = _3282 + 1;
    float _3286 = fma(_2988, _3266, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    bool _3288 = uint(_3254) >= 2u;
    float _3290 = fma(_3038, _3212, _3278);
    int _3292 = ~_1820;
    int _3294 = _3292 + 1;
    int _3296 = _3288 ? 0 : 1;
    float _3298 = fma(_3040, _3202, _3290);
    int _3300 = _3284;
    float _3302 = _3014;
    if (!_3268)
    {
        int _3304 = ~_3262;
        int _3306 = _3304 + 1;
        _3300 = _3306;
    }
    int _3308 = _3300;
    bool _3310 = _3254 != 3;
    float _3312 = fma(_3220, _3164, _3298);
    int _3314 = abs(_3308);
    bool _3316 = !_3256;
    int _3318 = _3316 ? 0 : 1;
    float _3320 = fma(_3252, _3150, _3312);
    int _3322 = ~_3314;
    int _3324 = _3322 + 1;
    int _3326 = _3324 + 1;
    int _3328 = int(_3108) + int(_3274);
    float _3330 = fma(_3276, _3128, _3320);
    bool _3332 = _3254 != 3;
    int _3334 = abs(_3318);
    int _3336 = _3326 * as_type<int>(_3196);
    bool _3338 = !_2856;
    int _3340 = _3338 ? 0 : 1;
    int _3342 = _3294 * _3328;
    int _3344 = _3342 + _2061;
    int _3346 = ~_3296;
    int _3348 = _3346 + 1;
    int _3350 = _3348 + 1;
    float _3352 = fma(_3286, _3096, _3330);
    int _3354 = abs(_3340);
    int _3356 = ~_3334;
    int _3358 = _3356 + 1;
    int _3360 = _3358 + 1;
    float _3362 = fma(_3056, (*spvDescriptorSet0.vp_c9)._m0[174].x, _3352);
    int _3364 = _3350;
    if (_3310)
    {
        int _3366 = ~_3296;
        int _3368 = _3366 + 1;
        _3364 = _3368;
    }
    int _3370 = _3364;
    float _3372 = abs(_2359);
    float _3374 = log2(_3372);
    bool _3376 = !_3332;
    int _3378 = _3376 ? 0 : (-1);
    int _3380 = _3360 * as_type<int>(_3188);
    int _3382 = _3380 + _3336;
    bool _3384 = uint(_3344) >= uint(_1820);
    out.m_91.x = _3362;
    int _3386 = abs(_3370);
    int _3388 = abs(_3378);
    bool _3390 = !_3384;
    int _3392 = _3390 ? 0 : (-1);
    int _3394 = ~_3386;
    int _3396 = _3394 + 1;
    int _3398 = _3396 + 1;
    float _3400 = _3034 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3402 = ~_3328;
    int _3404 = _3402 + _3392;
    int _3406 = _3404 + 1;
    int _3408 = _3398 * as_type<int>(_3240);
    int _3410 = _3408 + _3382;
    int _3412 = ~_3388;
    int _3414 = _3412 + 1;
    int _3416 = _3414 + 1;
    float _3418 = _3374 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _3420 = ~_3354;
    int _3422 = _3420 + 1;
    int _3424 = _3422 + 1;
    int _3426 = _3382;
    if (_1662)
    {
        float _3428 = -_1652;
        float _3430 = _3428 + 1.0;
        _3426 = as_type<int>(_3430);
    }
    int _3432 = _3426;
    int _3434 = _1820 * _3406;
    int _3436 = _3434 + _2061;
    int _3438 = _3416 * as_type<int>(_3248);
    int _3440 = _3438 + _3410;
    float _3442 = exp2(_3418);
    if (_1662)
    {
        float _3444 = _2814 ? as_type<float>(_3432) : _1652;
        _1710 = _3444;
    }
    float _3446 = _1710;
    float _3448 = in.m_85.z;
    int _3450 = _3440 * _3424;
    float _3452 = _3034 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _3454 = !_1971;
    int _3456 = _3454 ? _3436 : (-1);
    float _3458 = fma((*spvDescriptorSet0.vp_c9)._m0[80].y, _2954, -0.5);
    bool _3460 = _2125 != 0.0;
    bool _3462 = isnan(_2125);
    bool _3464 = _3460 || _3462;
    bool _3466 = isnan(0.0);
    bool _3468 = _3464 || _3466;
    float _3470 = in.m_87.z;
    float _3472 = in.m_87.w;
    int _3474 = _3456 * _3354;
    int _3476 = _3474 + _3450;
    float _3478 = -_2998;
    float _3480 = fma(_2964, _3458, _3478);
    float _3482 = fma(_3446, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    bool _3484 = _2127 == 0.0;
    bool _3486 = !_3468;
    bool _3488 = _3484 && _3486;
    float _3490 = _3480 + 0.5;
    float _3492 = float(_3476);
    float _3494 = fma(_3442, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3496 = precise::clamp(_3494, 0.0, 1.0);
    bool _3498 = _2129 == 0.0;
    bool _3500 = _3498 && _3488;
    float _3502 = fma(_2990, _3482, _2904);
    float _3504 = _3034 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3506 = fma(_3496, -2.0, 3.0);
    float _3508 = _3496 * _3496;
    out.m_93.x = _3492;
    float _3510 = fma(_3020, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3452);
    float _3512 = _3502 + 0.5;
    float _3514 = _3508 * _3506;
    float _3516 = fma(_3020, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3400);
    bool _3518 = _2359 <= 8000.0;
    bool _3520 = isnan(_2359);
    bool _3522 = _3518 || _3520;
    bool _3524 = isnan(8000.0);
    bool _3526 = _3522 || _3524;
    float _3528 = float(_3526);
    out.m_95.x = _3512;
    out.m_95.y = _3490;
    out.m_95.z = _1778;
    out.m_95.w = _1780;
    float _3530 = fma(_3020, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3504);
    float _3532 = _3452;
    if (_3500)
    {
        _3532 = _3448;
    }
    float _3534 = _3532;
    float _3536 = fma(_3470, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3516);
    float _3538 = _2986 * _3020;
    float _3540 = _3014 * _3470;
    float _3542 = fma(_3470, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3530);
    float _3544 = fma(_3470, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3510);
    float _3546 = -_3538;
    float _3548 = fma(_3014, _3034, _3546);
    float _3550 = _3034 * _3448;
    float _3552 = -_3540;
    float _3554 = fma(_3020, _3448, _3552);
    float _3556 = _3534;
    if (!_3500)
    {
        float _3558 = fma(_2129, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3448);
        _3556 = _3558;
    }
    float _3560 = _3556;
    float _3562 = -_3514;
    float _3564 = _3562 + 1.0;
    float _3566 = -_3550;
    float _3568 = fma(_2986, _3470, _3566);
    float _3570 = _3554 * _3472;
    float _3572 = in.m_97.x;
    float _3574 = fma(_3564, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3514);
    float _3576 = _3568 * _3472;
    float _3578 = _3570 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    out.m_99.x = _3542;
    out.m_99.y = _3536;
    out.m_99.z = _3544;
    float _3580 = _3570 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3582 = _3528 * _3574;
    float _3584 = _3548 * _3472;
    float _3586 = fma(_3576, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3578);
    float _3588 = fma(_3576, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3580);
    float _3590 = _2681 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3592 = _3582 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3594 = fma(_3584, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3586);
    float _3596 = fma(_3584, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3588);
    float _3598 = _3574;
    if (_3500)
    {
        _3598 = _2986;
    }
    float _3600 = _3598;
    float _3602 = fma(_2685, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3590);
    float _3604 = _3570 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3606 = _3600;
    if (!_3500)
    {
        float _3608 = fma(_2125, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2986);
        _3606 = _3608;
    }
    float _3610 = _3606;
    if (!_3500)
    {
        float _3612 = fma(_2127, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3014);
        _3302 = _3612;
    }
    float _3614 = _3302;
    float _3616 = fma(_2665, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3602);
    float _3618 = fma(_3576, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3604);
    float _3620 = _2701 * 0.5;
    float _3622 = _3610 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3624 = _3610 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3626 = fma(_3584, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3618);
    float _3628 = fma(_2749, -0.5, _3620);
    float _3630 = _3610 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3632 = -_2751;
    float _3634 = _3632 + 1.0;
    out.m_101.x = _3594;
    out.m_101.y = _3596;
    out.m_101.z = _3626;
    float _3636 = fma(_3614, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3622);
    float _3638 = fma(_3614, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3624);
    float _3640 = _3634 * _3592;
    float _3642 = precise::clamp(_3640, 0.0, 1.0);
    float _3644 = fma(_3614, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3630);
    float _3646 = fma(_3560, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3636);
    float _3648 = fma(_3560, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3638);
    float _3650 = -_3642;
    float _3652 = fma(_3650, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3654 = fma(_2647, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3616);
    float _3656 = fma(_3560, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3644);
    bool _3658 = _2451 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3660 = isnan(_2451);
    bool _3662 = _3658 || _3660;
    bool _3664 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3666 = _3662 || _3664;
    float _3668 = _3652 * _3572;
    float _3670 = _3654 + _2701;
    out.gl_Position.x = _2747;
    out.gl_Position.y = _2749;
    out.gl_Position.z = _3654;
    out.gl_Position.w = _2701;
    float _3672 = _2747 + _2701;
    float _3674 = _3668 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_103.x = _3646;
    out.m_103.y = _3648;
    out.m_103.z = _3656;
    float _3676 = _3670 * 0.5;
    float _3678 = _3672 * 0.5;
    float _3680 = _3230 * _2775;
    float _3682 = -_3230;
    float _3684 = _3682 + 1.0;
    out.m_105.x = _3674;
    float _3686 = _3626;
    float _3688 = _3680;
    if (!_3666)
    {
        _3686 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3690 = _3686;
    float _3692 = _2786 * _3680;
    float _3694 = _2796 * _3680;
    out.m_107.x = _3678;
    out.m_107.y = _3628;
    out.m_107.z = _3676;
    out.m_107.w = _2701;
    float _3696 = _3692;
    float _3698 = _3690;
    float _3700 = _3690;
    if (!_3666)
    {
        _3688 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3702 = _3688;
    float _3704 = fma(_2792, _3692, _2780);
    float _3706 = fma(_2794, _3692, _2782);
    float _3708 = _2786 * _3684;
    float _3710 = fma(_2786, _3694, _2784);
    float _3712 = _3702;
    float _3714 = _3702;
    if (!_3666)
    {
        _3696 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3716 = _3696;
    out.m_109.x = _3704;
    out.m_109.y = _3706;
    out.m_109.z = _3710;
    out.m_109.w = _3708;
    float _3718 = _2415 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _3720 = !_3666;
    float _3722 = _3716;
    float _3724 = _3716;
    if (!_3720)
    {
        bool _3726 = _2451 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3728 = isnan(_2451);
        bool _3730 = _3726 || _3728;
        bool _3732 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3734 = _3730 || _3732;
        if (!_3734)
        {
            float _3736 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3738 = _2451 + _3736;
            float _3740 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3742 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3740;
            float _3744 = 1.0 / _3742;
            float _3746 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3748 = _3746 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3750 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3752 = _3750 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3754 = _3738 * _3744;
            float _3756 = precise::clamp(_3754, 0.0, 1.0);
            float _3758 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3760 = _3758 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3762 = fma(_3756, _3752, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3764 = fma(_3756, _3760, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3766 = fma(_3756, _3748, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _3724 = _3766;
            _3700 = _3764;
            _3714 = _3762;
            _3768 = true;
        }
        else
        {
            bool _3770 = _2451 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3772 = isnan(_2451);
            bool _3774 = _3770 || _3772;
            bool _3776 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3778 = _3774 || _3776;
            if (!_3778)
            {
                _3698 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3780 = _3698;
            _3700 = _3780;
            if (!_3778)
            {
                _3722 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3782 = _3722;
            _3724 = _3782;
            if (!_3778)
            {
                _3712 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3784 = _3712;
            bool _3786 = !_3778;
            _3714 = _3784;
            if (!_3786)
            {
                bool _3788 = _2451 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3790 = isnan(_2451);
                bool _3792 = _3788 || _3790;
                bool _3794 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3796 = _3792 || _3794;
                if (!_3796)
                {
                    float _3798 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3800 = _2451 + _3798;
                    float _3802 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3804 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3802;
                    float _3806 = 1.0 / _3804;
                    float _3808 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3810 = _3808 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3812 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3814 = _3812 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3816 = _3800 * _3806;
                    float _3818 = precise::clamp(_3816, 0.0, 1.0);
                    float _3820 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3822 = _3820 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3824 = fma(_3818, _3814, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3826 = fma(_3818, _3822, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3828 = fma(_3818, _3810, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _3724 = _3828;
                    _3700 = _3826;
                    _3714 = _3824;
                    _3768 = true;
                }
                else
                {
                    _3724 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3700 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3714 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _3768 = false;
    float _3830 = _3724;
    float _3832 = _3700;
    float _3834 = _3714;
    float _3836 = _3718 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_111.x = 0.0;
    float _3838 = _3830 * 0.586610972881317138671875;
    bool _3840 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_55.x = _3836;
    float _3842 = fma(_3832, 0.298911988735198974609375, _3838);
    bool _3844 = _2415 > 0.0;
    bool _3846 = isnan(_2415);
    bool _3848 = _3844 || _3846;
    bool _3850 = isnan(0.0);
    bool _3852 = _3848 || _3850;
    float _3854 = fma(_3834, 0.114477999508380889892578125, _3842);
    float _3856 = -_3854;
    float _3858 = _3856 + _3832;
    float _3860 = -_3854;
    float _3862 = _3860 + _3830;
    float _3864 = -_3854;
    float _3866 = _3864 + _3834;
    float _3868 = fma(_3858, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3854);
    float _3870 = fma(_3862, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3854);
    float _3872 = fma(_3866, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3854);
    bool _3874 = !_3840;
    if (!_3874)
    {
        float _3876 = -_2345;
        float _3878 = _3876 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3880 = -_2347;
        float _3882 = _3880 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3884 = -_2349;
        float _3886 = _3884 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3888 = _3878 * _3878;
        float _3890 = fma(_3882, _3882, _3888);
        float _3892 = fma(_3886, _3886, _3890);
        float _3894 = sqrt(_3892);
        float _3896 = rsqrt(_3892);
        float _3898 = -_3894;
        float _3900 = _3898 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3902 = _3900 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3904 = precise::clamp(_3902, 0.0, 1.0);
        float _3906 = _3882 * _3896;
        float _3908 = _3878 * _3896;
        float _3910 = abs(_3904);
        float _3912 = log2(_3910);
        float _3914 = _3886 * _3896;
        float _3916 = _3906 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3918 = _3648 * _3908;
        float _3920 = -_3908;
        float _3922 = -_3916;
        float _3924 = fma(_3920, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3922);
        float _3926 = fma(_3646, _3906, _3918);
        float _3928 = -_3914;
        float _3930 = fma(_3928, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3924);
        float _3932 = fma(_3656, _3914, _3926);
        float _3934 = precise::clamp(_3932, 0.0, 1.0);
        float _3936 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3938 = _3930 + _3936;
        float _3940 = _3912 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3942 = _3938 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3944 = precise::clamp(_3942, 0.0, 1.0);
        float _3946 = exp2(_3940);
        float _3948 = _3946 * _3944;
        float _3950 = _3934 * _3948;
        float _3952 = _3950 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3954 = _3950 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3956 = _3950 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_111.x = _3952;
        out.m_111.y = _3954;
        out.m_111.z = _3956;
    }
    out.m_113.x = _3868;
    out.m_113.y = _3870;
    out.m_113.z = _3872;
    if (_3852)
    {
        return out;
    }
    out.m_55.x = 0.0;
    float _3958 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3958;
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
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_113 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3768 = false;
    bool _1256 = false;
    bool _1160 = false;
    bool _1000 = false;
    bool _790 = false;
    bool _618 = false;
    bool _296 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _127 = in.m_48.w;
    float _129 = in.m_50.w;
    float _131 = trunc(_127);
    int _134 = int(_131);
    float _136 = -_129;
    float _138 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _138;
    bool _142 = _134 >= 1;
    float _144 = 0.0;
    float _146 = _129;
    if (!_142)
    {
        _144 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _144;
    if (!_142)
    {
        out.m_55.x = 0.0;
    }
    int _150 = 0;
    if (!_142)
    {
        float _152 = _148 * 5.0;
        _150 = as_type<int>(_152);
    }
    int _154 = _150;
    int _156 = _154;
    if (!_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4025 = as_type<float>(_154);
        out.gl_Position.z = _4025;
    }
    if (!_142)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 92, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 93, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 94, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 95, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _158 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _160 = isnan(_129);
    bool _162 = _158 || _160;
    bool _164 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _166 = _162 || _164;
    float _168 = float(_134);
    float _170 = in.m_57.x;
    bool _172 = _138 >= _168;
    bool _174 = !_166;
    bool _176 = _172 || _174;
    float _178 = 1.0 / _168;
    if (_176)
    {
        _146 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _180 = _146;
    if (_176)
    {
        out.m_55.x = 0.0;
    }
    if (_176)
    {
        float _182 = _180 * 5.0;
        _156 = as_type<int>(_182);
    }
    int _184 = _156;
    float _186 = _138 * _178;
    out.m_59.x = _170;
    float _188 = _186;
    if (_176)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4090 = as_type<float>(_184);
        out.gl_Position.z = _4090;
    }
    out.m_53.x = _186;
    if (_176)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 92, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 93, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 94, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 95, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _190 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _192 = _138 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _194 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _196 = _194 != 0;
    int _198 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _200 = _198 != 0;
    int _202 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _204 = _202 != 0;
    float _206 = _192 * _190;
    float _208 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[20].x, _206);
    float _210 = _208 * 6.283185482025146484375;
    float _212 = floor(_208);
    float _214 = _210 * 0.15915493667125701904296875;
    bool _216 = !_196;
    int _218 = _216 ? 0 : 1;
    int _220 = abs(_218);
    float _222 = _214 * 6.283185482025146484375;
    float _224 = cos(_222);
    bool _226 = !_204;
    int _228 = _226 ? 0 : 1;
    bool _230 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _232 = abs(_228);
    float _234 = -_212;
    float _236 = _208 + _234;
    bool _238 = !_200;
    int _240 = _238 ? 0 : 1;
    float _242 = float(_220);
    int _244 = abs(_240);
    float _246 = -_236;
    float _248 = fma(_246, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _250 = _236 < 0.5;
    float _252 = float(_250);
    float _254 = fma(_224, 0.5, 0.5);
    float _256 = abs(_248);
    float _258 = _242 * _256;
    float _260 = float(_232);
    float _262 = -_252;
    float _264 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _266 = -_254;
    float _268 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _270 = float(_244);
    float _272 = fma(_260, _268, _258);
    float _274 = abs(_264);
    float _276 = fma(_270, _274, _272);
    bool _278 = !_230;
    float _294;
    if (!_278)
    {
        float _280 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _282 = _170 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _284 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[12].x, _138);
        float _286 = _284 * _280;
        float _288 = floor(_286);
        float _290 = -_288;
        float _292 = _286 + _290;
        _294 = _292;
        _296 = true;
    }
    else
    {
        _294 = _186;
    }
    _296 = false;
    float _298 = _294;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _302 = _298 + _300;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _306 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _304;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _310 = _308 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _314 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _312;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _318 = _316 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _320 = 1.0 / _306;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _324 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _322;
    bool _326 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _328 = isnan(_298);
    bool _330 = _326 || _328;
    bool _332 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _334 = _330 || _332;
    float _336 = float(_334);
    bool _338 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _340 = isnan(_298);
    bool _342 = _338 || _340;
    bool _344 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _346 = _342 || _344;
    float _348 = float(_346);
    float _350 = 1.0 / _314;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _354 = _298 + _352;
    float _356 = 1.0 / _310;
    float _358 = _354 * _320;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _362 = _298 + _360;
    bool _364 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _366 = isnan(_298);
    bool _368 = _364 || _366;
    bool _370 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _372 = _368 || _370;
    float _374 = float(_372);
    bool _376 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _378 = 1.0 / _324;
    float _380 = _362 * _350;
    bool _382 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _384 = isnan(_298);
    bool _386 = _382 || _384;
    bool _388 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _390 = _386 || _388;
    float _392 = float(_390);
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _396 = _298 + _394;
    bool _398 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _400 = isnan(_298);
    bool _402 = _398 || _400;
    bool _404 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _406 = _402 || _404;
    float _408 = float(_406);
    float _410 = 1.0 / _318;
    float _412 = _302 * _356;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _416 = _298 + _414;
    float _418 = -_392;
    float _420 = _418 + 1.0;
    bool _422 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _424 = isnan(_298);
    bool _426 = _422 || _424;
    bool _428 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _430 = _426 || _428;
    float _432 = float(_430);
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _436 = _434 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _438 = _416 * _378;
    float _440 = -_374;
    float _442 = _440 + 1.0;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _444;
    float _448 = fma(_436, _412, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _450 = _336 * _442;
    float _452 = -_336;
    float _454 = _452 + 1.0;
    float _456 = fma(_446, _358, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _458 = _396 * _410;
    float _460 = _408 * _420;
    float _462 = -_408;
    float _464 = _462 + 1.0;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _466;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _470;
    float _474 = _432 * _454;
    float _476 = _348 * _464;
    float _478 = -_348;
    float _480 = _478 + 1.0;
    float _482 = fma(_468, _358, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _484 = fma(_472, _358, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _486 = _456 * _474;
    float _488 = _374 * _480;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _492 = _490 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _496 = _494 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _498 = -_432;
    float _500 = _498 + 1.0;
    float _502 = _482 * _474;
    float _504 = fma(_492, _412, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _506 = fma(_496, _412, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _508 = _484 * _474;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _510;
    float _514 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[143].x, _486);
    float _516 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[143].z, _502);
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _522 = fma(_512, _380, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _524 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[143].y, _508);
    float _526 = fma(_448, _450, _514);
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _528;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _534 = _532 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _536;
    float _540 = fma(_520, _458, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _542 = fma(_506, _450, _516);
    float _544 = fma(_522, _488, _526);
    float _546 = fma(_530, _380, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _548 = fma(_534, _458, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _550 = fma(_504, _450, _524);
    float _552 = fma(_538, _380, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _556 = _554 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _558 = fma(_546, _488, _550);
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _562 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _560;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _564;
    float _568 = fma(_556, _458, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _570 = fma(_552, _488, _542);
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _572;
    float _576 = fma(_548, _476, _544);
    float _578 = fma(_562, _438, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _580 = fma(_566, _438, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _582 = fma(_574, _438, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _584 = fma(_568, _476, _558);
    float _586 = fma(_540, _476, _570);
    float _588 = fma(_578, _460, _576);
    float _590 = fma(_580, _460, _584);
    float _592 = fma(_582, _460, _586);
    float _594 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[148].x, _588);
    float _596 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[148].y, _590);
    float _598 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[148].z, _592);
    bool _600 = !_376;
    float _616;
    if (!_600)
    {
        float _602 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _604 = _170 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _606 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[11].x, _138);
        float _608 = _606 * _602;
        float _610 = floor(_608);
        float _612 = -_610;
        float _614 = _608 + _612;
        _616 = _614;
        _618 = true;
    }
    else
    {
        _616 = _186;
    }
    _618 = false;
    float _620 = _616;
    float _622 = in.m_61.x;
    float _624 = in.m_61.y;
    float _626 = in.m_61.z;
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _630 = _620 + _628;
    bool _632 = _620 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _634 = isnan(_620);
    bool _636 = _632 || _634;
    bool _638 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _640 = _636 || _638;
    float _642 = float(_640);
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _644;
    bool _648 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _650 = 1.0 / _646;
    float _652 = _596 * _624;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _656 = _654 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _658 = _598 * _626;
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _662 = _620 + _660;
    bool _664 = _620 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _666 = isnan(_620);
    bool _668 = _664 || _666;
    bool _670 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _672 = _668 || _670;
    float _674 = float(_672);
    float _676 = _630 * _650;
    bool _678 = _620 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _680 = isnan(_620);
    bool _682 = _678 || _680;
    bool _684 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _686 = _682 || _684;
    float _688 = float(_686);
    float _690 = 1.0 / _656;
    float _692 = -_642;
    float _694 = _692 + 1.0;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _696;
    float _700 = -_688;
    float _702 = _700 + 1.0;
    float _704 = _688 * _694;
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _706;
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _712 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _710;
    float _714 = _674 * _702;
    float _716 = fma(_698, _676, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _718 = fma(_708, _676, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _720 = fma(_712, _676, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _722 = -_674;
    float _724 = _722 + 1.0;
    float _726 = _594 * _622;
    float _728 = _720 * _714;
    float _730 = _662 * _690;
    float _732 = _718 * _714;
    float _734 = _716 * _714;
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _738 = _736 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _742 = _740 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _746 = _744 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _748 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[107].x, _732);
    float _750 = fma(_738, _730, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _752 = fma(_742, _730, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _754 = fma(_746, _730, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _756 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[107].y, _728);
    float _758 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[107].z, _734);
    float _760 = fma(_750, _704, _748);
    float _762 = fma(_752, _704, _756);
    float _764 = fma(_754, _704, _758);
    float _766 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[109].x, _760);
    float _768 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[109].y, _762);
    float _770 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[109].z, _764);
    bool _772 = !_648;
    float _788;
    if (!_772)
    {
        float _774 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _776 = _170 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _778 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[11].y, _138);
        float _780 = _778 * _774;
        float _782 = floor(_780);
        float _784 = -_782;
        float _786 = _780 + _784;
        _788 = _786;
        _790 = true;
    }
    else
    {
        _788 = _186;
    }
    _790 = false;
    float _792 = _788;
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _796 = _792 + _794;
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _800 = _798 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _804 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _802;
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _808 = _806 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _810 = _792 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _812 = isnan(_792);
    bool _814 = _810 || _812;
    bool _816 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _818 = _814 || _816;
    float _820 = float(_818);
    float _822 = 1.0 / _800;
    float _824 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _826 = _824 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _828 = _792 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _830 = isnan(_792);
    bool _832 = _828 || _830;
    bool _834 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _836 = _832 || _834;
    float _838 = float(_836);
    bool _840 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _842 = 1.0 / _808;
    float _844 = _804 * _822;
    bool _846 = _792 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _848 = isnan(_792);
    bool _850 = _846 || _848;
    bool _852 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _854 = _850 || _852;
    float _856 = float(_854);
    float _858 = 1.0 / _826;
    float _860 = -_820;
    float _862 = _860 + 1.0;
    float _864 = fma(_844, _796, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _866 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _868 = _866 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _870 = _792 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _872 = isnan(_792);
    bool _874 = _870 || _872;
    bool _876 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _878 = _874 || _876;
    float _880 = float(_878);
    float _882 = -_856;
    float _884 = _882 + 1.0;
    float _886 = _856 * _862;
    float _888 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _890 = _888 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _892 = 1.0 / _868;
    float _894 = -_880;
    float _896 = _894 + 1.0;
    float _898 = _838 * _884;
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _902 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _900;
    float _904 = _890 * _842;
    float _906 = _820 * _896;
    float _908 = _864 * _898;
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _912 = _792 + _910;
    float _914 = -_838;
    float _916 = _914 + 1.0;
    bool _918 = _792 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _920 = isnan(_792);
    bool _922 = _918 || _920;
    bool _924 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _926 = _922 || _924;
    float _928 = float(_926);
    float _930 = _902 * _858;
    float _932 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _934 = _932 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _936 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _938 = _792 + _936;
    float _940 = fma(_904, _912, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _942 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[115].x, _908);
    float _944 = -_928;
    float _946 = _944 + 1.0;
    float _948 = _934 * _892;
    float _950 = fma(_930, _938, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _952 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _954 = _792 + _952;
    float _956 = fma(_940, _886, _942);
    float _958 = _880 * _946;
    float _960 = _768 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _962 = fma(_948, _954, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _964 = fma(_950, _906, _956);
    float _966 = _960 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _968 = fma(_962, _958, _964);
    float _970 = _766 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _972 = _770 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _974 = fma(_928, (*spvDescriptorSet0.vp_c9)._m0[119].x, _968);
    float _976 = _970 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _978 = _972 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _980 = _974 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_63.x = _976;
    out.m_63.y = _966;
    out.m_63.z = _978;
    out.m_63.w = _980;
    bool _982 = !_840;
    float _998;
    if (!_982)
    {
        float _984 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _986 = _170 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _988 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[11].z, _138);
        float _990 = _988 * _984;
        float _992 = floor(_990);
        float _994 = -_992;
        float _996 = _990 + _994;
        _998 = _996;
        _1000 = true;
    }
    else
    {
        _998 = _186;
    }
    _1000 = false;
    float _1002 = _998;
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1006 = _1002 + _1004;
    bool _1008 = _1002 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1010 = isnan(_1002);
    bool _1012 = _1008 || _1010;
    bool _1014 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1016 = _1012 || _1014;
    float _1018 = float(_1016);
    float _1020 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1022 = _1002 + _1020;
    bool _1024 = _1002 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1026 = isnan(_1002);
    bool _1028 = _1024 || _1026;
    bool _1030 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1032 = _1028 || _1030;
    float _1034 = float(_1032);
    float _1036 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1038 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1036;
    float _1040 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1042 = _1040 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1044 = _1002 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1046 = isnan(_1002);
    bool _1048 = _1044 || _1046;
    bool _1050 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1052 = _1048 || _1050;
    float _1054 = float(_1052);
    float _1056 = -_1018;
    float _1058 = _1056 + 1.0;
    float _1060 = 1.0 / _1042;
    float _1062 = _1054 * _1058;
    float _1064 = -_1054;
    float _1066 = _1064 + 1.0;
    float _1068 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1070 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1068;
    bool _1072 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1074 = 1.0 / _1038;
    float _1076 = _1034 * _1066;
    float _1078 = -_1034;
    float _1080 = _1078 + 1.0;
    float _1082 = _1022 * _1060;
    float _1084 = _1006 * _1074;
    float _1086 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1088 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1086;
    float _1090 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1092 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1090;
    float _1094 = fma(_1070, _1084, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1096 = fma(_1088, _1084, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1098 = fma(_1092, _1084, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1100 = _1094 * _1076;
    float _1102 = _1096 * _1076;
    float _1104 = _1098 * _1076;
    float _1106 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1108 = _1106 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1110 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1112 = _1110 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1114 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1116 = _1114 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1118 = fma(_1080, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1100);
    float _1120 = fma(_1080, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1102);
    float _1122 = fma(_1108, _1082, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1124 = fma(_1112, _1082, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1126 = fma(_1116, _1082, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1128 = fma(_1080, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1104);
    float _1130 = fma(_1122, _1062, _1118);
    float _1132 = fma(_1124, _1062, _1120);
    float _1134 = fma(_1126, _1062, _1128);
    float _1136 = fma(_1018, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1130);
    float _1138 = fma(_1018, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1132);
    float _1140 = fma(_1018, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1134);
    bool _1142 = !_1072;
    float _1158;
    if (!_1142)
    {
        float _1144 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1146 = _170 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1148 = fma(_1146, (*spvDescriptorSet0.vp_c9)._m0[11].w, _138);
        float _1150 = _1148 * _1144;
        float _1152 = floor(_1150);
        float _1154 = -_1152;
        float _1156 = _1150 + _1154;
        _1158 = _1156;
        _1160 = true;
    }
    else
    {
        _1158 = _186;
    }
    _1160 = false;
    float _1162 = _1158;
    bool _1164 = _1162 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1166 = isnan(_1162);
    bool _1168 = _1164 || _1166;
    bool _1170 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1172 = _1168 || _1170;
    float _1174 = float(_1172);
    float _1176 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1178 = _1176 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1180 = _1162 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1182 = isnan(_1162);
    bool _1184 = _1180 || _1182;
    bool _1186 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1188 = _1184 || _1186;
    float _1190 = float(_1188);
    float _1192 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1194 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1192;
    float _1196 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1198 = _1162 + _1196;
    float _1200 = -_1174;
    float _1202 = _1200 + 1.0;
    bool _1204 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1206 = 1.0 / _1178;
    float _1208 = _1190 * _1202;
    float _1210 = -_1190;
    float _1212 = _1210 + 1.0;
    float _1214 = _1194 * _1206;
    float _1216 = _1140 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1218 = fma(_1214, _1198, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1220 = _1138 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1222 = _1216 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1224 = _1218 * _1208;
    float _1226 = _1220 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1228 = fma(_1212, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1224);
    float _1230 = _1136 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1232 = fma(_1174, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1228);
    float _1234 = _1230 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1236 = _1232 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_65.x = _1234;
    out.m_65.y = _1226;
    out.m_65.z = _1222;
    out.m_65.w = _1236;
    bool _1238 = !_1204;
    float _1254;
    if (!_1238)
    {
        float _1240 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1242 = _170 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1244 = fma(_1242, (*spvDescriptorSet0.vp_c9)._m0[14].x, _138);
        float _1246 = _1244 * _1240;
        float _1248 = floor(_1246);
        float _1250 = -_1248;
        float _1252 = _1246 + _1250;
        _1254 = _1252;
        _1256 = true;
    }
    else
    {
        _1254 = _186;
    }
    _1256 = false;
    float _1258 = _1254;
    float _1260 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1262 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _1260;
    float _1264 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1266 = _1264 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1268 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1270 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _1268;
    float _1272 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1274 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _1272;
    float _1276 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1278 = _1276 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1280 = 1.0 / _1262;
    float _1282 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1284 = _1282 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1286 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1288 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _1286;
    bool _1290 = _1258 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1292 = isnan(_1258);
    bool _1294 = _1290 || _1292;
    bool _1296 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1298 = _1294 || _1296;
    float _1300 = float(_1298);
    float _1302 = 1.0 / _1266;
    float _1304 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1306 = _1258 + _1304;
    bool _1308 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _1310 = 1.0 / _1278;
    float _1312 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1314 = _1258 + _1312;
    float _1316 = _1306 * _1280;
    bool _1318 = _1258 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1320 = isnan(_1258);
    bool _1322 = _1318 || _1320;
    bool _1324 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1326 = _1322 || _1324;
    float _1328 = float(_1326);
    float _1330 = 1.0 / _1274;
    float _1332 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1334 = _1258 + _1332;
    float _1336 = _1314 * _1302;
    float _1338 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1340 = _1258 + _1338;
    float _1342 = 1.0 / _1270;
    float _1344 = 1.0 / _1288;
    float _1346 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1348 = _1258 + _1346;
    float _1350 = _1334 * _1330;
    float _1352 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1354 = _1258 + _1352;
    bool _1356 = _1258 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1358 = isnan(_1258);
    bool _1360 = _1356 || _1358;
    bool _1362 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1364 = _1360 || _1362;
    float _1366 = float(_1364);
    float _1368 = _1348 * _1310;
    bool _1370 = _1258 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1372 = isnan(_1258);
    bool _1374 = _1370 || _1372;
    bool _1376 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1378 = _1374 || _1376;
    float _1380 = float(_1378);
    float _1382 = _1340 * _1342;
    float _1384 = -_1328;
    float _1386 = _1384 + 1.0;
    float _1388 = -_1380;
    float _1390 = _1388 + 1.0;
    bool _1392 = _1258 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1394 = isnan(_1258);
    bool _1396 = _1392 || _1394;
    bool _1398 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1400 = _1396 || _1398;
    float _1402 = float(_1400);
    float _1404 = _1380 * _1386;
    float _1406 = 1.0 / _1284;
    float _1408 = _1366 * _1390;
    float _1410 = _1354 * _1344;
    bool _1412 = _1258 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1414 = isnan(_1258);
    bool _1416 = _1412 || _1414;
    bool _1418 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1420 = _1416 || _1418;
    float _1422 = float(_1420);
    float _1424 = -_1366;
    float _1426 = _1424 + 1.0;
    float _1428 = -_1422;
    float _1430 = _1428 + 1.0;
    float _1432 = _1422 * _1426;
    float _1434 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1436 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1434;
    float _1438 = -(*spvDescriptorSet0.vp_c9)._m0[159].z;
    float _1440 = (*spvDescriptorSet0.vp_c9)._m0[160].z + _1438;
    float _1442 = _1402 * _1430;
    float _1444 = -_1402;
    float _1446 = _1444 + 1.0;
    bool _1448 = _1258 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1450 = isnan(_1258);
    bool _1452 = _1448 || _1450;
    bool _1454 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1456 = _1452 || _1454;
    float _1458 = float(_1456);
    float _1460 = fma(_1436, _1316, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1462 = fma(_1440, _1316, (*spvDescriptorSet0.vp_c9)._m0[159].z);
    float _1464 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1466 = _1258 + _1464;
    bool _1468 = _1258 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1470 = isnan(_1258);
    bool _1472 = _1468 || _1470;
    bool _1474 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1476 = _1472 || _1474;
    float _1478 = float(_1476);
    float _1480 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1482 = _1480 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1484 = -_1458;
    float _1486 = _1484 + 1.0;
    float _1488 = _1300 * _1446;
    float _1490 = -_1300;
    float _1492 = _1490 + 1.0;
    float _1494 = _1466 * _1406;
    float _1496 = _1478 * _1486;
    float _1498 = -_1478;
    float _1500 = _1498 + 1.0;
    float _1502 = _1458 * _1492;
    float _1504 = -(*spvDescriptorSet0.vp_c9)._m0[160].z;
    float _1506 = _1504 + (*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _1508 = _1460 * _1496;
    float _1510 = _1462 * _1496;
    float _1512 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1514 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1512;
    float _1516 = fma(_1482, _1336, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1518 = fma(_1500, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1508);
    float _1520 = -(*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _1522 = (*spvDescriptorSet0.vp_c9)._m0[162].z + _1520;
    float _1524 = fma(_1506, _1336, (*spvDescriptorSet0.vp_c9)._m0[160].z);
    float _1526 = fma(_1500, (*spvDescriptorSet0.vp_c9)._m0[159].z, _1510);
    float _1528 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1530 = _1528 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1532 = fma(_1514, _1382, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1534 = fma(_1516, _1502, _1518);
    float _1536 = fma(_1522, _1382, (*spvDescriptorSet0.vp_c9)._m0[161].z);
    float _1538 = fma(_1524, _1502, _1526);
    float _1540 = -(*spvDescriptorSet0.vp_c9)._m0[162].z;
    float _1542 = _1540 + (*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _1544 = fma(_1532, _1488, _1534);
    float _1546 = -(*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _1548 = (*spvDescriptorSet0.vp_c9)._m0[164].z + _1546;
    float _1550 = fma(_1536, _1488, _1538);
    float _1552 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1554 = _1552 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1556 = -(*spvDescriptorSet0.vp_c9)._m0[164].z;
    float _1558 = _1556 + (*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _1560 = fma(_1530, _1368, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1562 = fma(_1542, _1368, (*spvDescriptorSet0.vp_c9)._m0[162].z);
    float _1564 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1566 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1564;
    float _1568 = fma(_1548, _1350, (*spvDescriptorSet0.vp_c9)._m0[163].z);
    float _1570 = fma(_1554, _1494, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1572 = fma(_1558, _1494, (*spvDescriptorSet0.vp_c9)._m0[164].z);
    float _1574 = fma(_1566, _1350, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1576 = fma(_1560, _1442, _1544);
    float _1578 = fma(_1562, _1442, _1550);
    float _1580 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1582 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1580;
    float _1584 = -(*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _1586 = (*spvDescriptorSet0.vp_c9)._m0[166].z + _1584;
    float _1588 = fma(_1574, _1432, _1576);
    float _1590 = fma(_1568, _1432, _1578);
    float _1592 = fma(_1582, _1410, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1594 = fma(_1586, _1410, (*spvDescriptorSet0.vp_c9)._m0[165].z);
    float _1596 = fma(_1570, _1408, _1588);
    float _1598 = fma(_1572, _1408, _1590);
    float _1600 = fma(_1592, _1404, _1596);
    float _1602 = fma(_1594, _1404, _1598);
    float _1604 = fma(_1328, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1600);
    float _1606 = fma(_1328, (*spvDescriptorSet0.vp_c9)._m0[166].z, _1602);
    out.m_67.x = _1604;
    out.m_67.z = _1606;
    bool _1608 = !_1308;
    float _1610 = _1404;
    int _1612 = as_type<int>(_1606);
    float _1614 = _1568;
    if (!_1608)
    {
        float _1616 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1618 = _170 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1620 = fma(_1618, (*spvDescriptorSet0.vp_c9)._m0[14].y, _138);
        float _1622 = _1620 * _1616;
        float _1624 = floor(_1622);
        float _1626 = -_1624;
        float _1628 = _1622 + _1626;
        _1610 = _1616;
        _188 = _1628;
    }
    float _1630 = _1610;
    float _1632 = _188;
    float _1634 = in.m_69.y;
    float _1636 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1638 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1640 = _1638 != 0;
    float _1642 = in.m_57.w;
    int _1644 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1646 = _1644 != 0;
    int _1648 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1650 = _1648 != 0;
    float _1652 = in.m_69.x;
    float _1654 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1656 = in.m_57.y;
    float _1658 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1660 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1662 = _1660 != 0;
    float _1664 = _1432;
    if (_1640)
    {
        float _1666 = in.m_57.z;
        _1664 = _1666;
    }
    float _1668 = _1664;
    float _1670 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1672 = _1636 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1674 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1676 = _1630;
    float _1678 = _1672;
    if (!_1646)
    {
        float _1680 = in.m_57.z;
        _1676 = _1680;
    }
    float _1682 = _1676;
    float _1684 = -_1634;
    float _1686 = _1684 + 1.0;
    bool _1688 = _1642 > 0.5;
    int _1690 = _1688 ? as_type<int>(_1686) : as_type<int>(_1634);
    bool _1692 = _1688;
    float _1694 = _1668;
    float _1696 = _1634;
    if (_1640)
    {
        float _1698 = -_1652;
        float _1700 = _1698 + 1.0;
        _1612 = as_type<int>(_1700);
    }
    int _1702 = _1612;
    if (!_1662)
    {
        _1614 = _1652;
    }
    float _1704 = _1614;
    float _1706 = _1650 ? as_type<float>(_1690) : _1634;
    float _1708 = _1706;
    float _1710 = _1704;
    if (_1640)
    {
        bool _1712 = _1668 > 0.5;
        _1692 = _1712;
    }
    bool _1714 = _1692;
    float _1716 = fma(_1706, _1672, -0.5);
    if (!_1640)
    {
        _1694 = _1652;
    }
    float _1718 = _1694;
    float _1720 = _1718;
    if (!_1646)
    {
        _1708 = _1656;
    }
    float _1722 = _1708;
    float _1724 = _1722;
    if (_1640)
    {
        float _1726 = _1714 ? as_type<float>(_1702) : _1652;
        _1720 = _1726;
    }
    float _1728 = _1720;
    if (_1646)
    {
        _1724 = _170;
    }
    float _1730 = _1724;
    float _1732 = _1682;
    if (!_1646)
    {
        _1678 = _1682;
    }
    float _1734 = _1678;
    float _1736 = fma(_1730, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1658);
    float _1738 = _1734;
    if (_1646)
    {
        _1738 = _1656;
    }
    float _1740 = _1738;
    float _1742 = _1730 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_1646)
    {
        _1732 = _1656;
    }
    float _1744 = _1732;
    float _1746 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1748 = _1654 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1750 = _1740 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1752 = -_1746;
    float _1754 = fma(_1742, 2.0, _1752);
    float _1756 = fma(_1744, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1674);
    float _1758 = fma(_1750, -2.0, _1670);
    float _1760 = fma(_1748, _1728, -0.5);
    float _1762 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1736);
    float _1764 = -_138;
    float _1766 = fma(_1764, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1754);
    float _1768 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1756);
    float _1770 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1758);
    float _1772 = fma(_1762, _1760, _1766);
    float _1774 = -_1770;
    float _1776 = fma(_1768, _1716, _1774);
    float _1778 = _1772 + 0.5;
    float _1780 = _1776 + 0.5;
    float2 _6706 = float2(_1778, _1780);
    float _1782 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_6706, float2(0.0), isnan(_6706)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_6706, float2(0.0), isnan(_6706)), level(0.0)).w;
    float _1784 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1786 = int(_1784);
    float _1788 = in.m_71.x;
    float _1790 = in.m_71.y;
    float _1792 = in.m_71.z;
    float _1794 = in.m_71.w;
    float _1796 = _276 * _726;
    float _1798 = _276 * _652;
    bool _1800 = !_1646;
    float _1802 = _1800 ? 7.345489978790283203125 : 1.0;
    float _1804 = _276 * _658;
    int _1806 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1808 = _1806 != 0;
    int _1810 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1812 = _1810 != 0;
    int _1814 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1816 = _1814 != 0;
    float _1818 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1820 = int(_1818);
    int _1822 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1824 = _1822 != 0;
    float _1826 = _1802 * _170;
    int _1828 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1830 = _1828 != 0;
    float _1832 = _1798 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1834 = _1796 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1836 = _1804 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _1838 = !_1830;
    int _1840 = _1838 ? 0 : 1;
    float _1842 = float(_1786);
    bool _1844 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1846 = isnan(0.5);
    bool _1848 = _1844 || _1846;
    bool _1850 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1852 = _1848 || _1850;
    float _1854 = 1.0 / _1842;
    float _1856 = float(uint(_1820));
    int _1858 = ~_1820;
    int _1860 = _1858 + 1;
    float _1862 = 1.0 / _1856;
    float _1864 = _138 * _1854;
    int _1866 = ~_1820;
    int _1868 = _1866 + 1;
    float _1870 = trunc(_1864);
    int _1872 = int(_1870);
    int _1874 = as_type<int>(_1862) + (-2);
    float _1876 = float(uint(_1872));
    float _1878 = float(_1872);
    float _1880 = as_type<float>(_1874) * _1876;
    float _1882 = in.m_73.x;
    float _1884 = in.m_73.y;
    float _1886 = in.m_73.z;
    float _1888 = in.m_73.w;
    float _1890 = trunc(_1880);
    float _1892 = precise::max(_1890, 0.0);
    uint _1895 = uint(_1892);
    float _1897 = in.m_75.x;
    float _1899 = in.m_75.y;
    float _1901 = in.m_75.z;
    float _1903 = in.m_75.w;
    int _1905 = _1868 * int(_1895);
    int _1907 = _1905 + _1872;
    float _1909 = float(uint(_1907));
    float _1911 = as_type<float>(_1874) * _1909;
    float _1913 = in.m_48.x;
    float _1915 = in.m_48.y;
    float _1917 = in.m_48.z;
    float _1919 = trunc(_1911);
    float _1921 = precise::max(_1919, 0.0);
    uint _1923 = uint(_1921);
    int _1925 = int(_1895) + int(_1923);
    float _1927 = float(_1820);
    float _1929 = floor(_1826);
    float _1931 = _1915 * _1790;
    int _1933 = _1860 * _1925;
    int _1935 = _1933 + _1872;
    bool _1937 = _1878 >= _1927;
    bool _1939 = isnan(_1878);
    bool _1941 = _1937 || _1939;
    bool _1943 = isnan(_1927);
    bool _1945 = _1941 || _1943;
    float _1947 = float(_1945);
    float _1949 = _1915 * _1884;
    float _1951 = _1915 * _1899;
    float _1953 = fma(_1913, _1788, _1931);
    bool _1955 = uint(_1935) >= uint(_1820);
    float _1957 = fma(_1913, _1882, _1949);
    float _1959 = trunc(_1947);
    int _1961 = int(_1959);
    float _1963 = fma(_1917, _1792, _1953);
    bool _1965 = !_1955;
    int _1967 = _1965 ? 0 : (-1);
    float _1969 = fma(_1917, _1886, _1957);
    bool _1971 = _1820 == 0;
    int _1973 = ~_1925;
    int _1975 = _1973 + _1967;
    int _1977 = _1975 + 1;
    float _1979 = -_1929;
    float _1981 = _1826 + _1979;
    float _1983 = fma(_1913, _1897, _1951);
    float _1985 = _138 * _1927;
    int _1987 = _1820 + (-1);
    int _1989 = _1820 * _1977;
    int _1991 = _1989 + _1872;
    float _1993 = _1981 * _1927;
    float _1995 = _1985 * _178;
    bool _1997 = !_1808;
    int _1999 = _1997 ? 0 : 1;
    float _2001 = fma(_1917, _1901, _1983);
    int _2003 = ~_1961;
    int _2005 = _2003 + 1;
    int _2007 = _2005 + 1;
    float _2009 = trunc(_1993);
    int _2011 = int(_2009);
    bool _2013 = !_1971;
    int _2015 = _2013 ? _1991 : (-1);
    float _2017 = _2001 + _1903;
    int _2019 = abs(_1999);
    int _2021 = abs(_1840);
    int _2023 = _2015 * _2007;
    bool _2025 = !_1812;
    int _2027 = _2025 ? 0 : 1;
    float _2029 = trunc(_1995);
    int _2031 = int(_2029);
    bool _2033 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2035 = isnan(0.5);
    bool _2037 = _2033 || _2035;
    bool _2039 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2041 = _2037 || _2039;
    int _2043 = _1961 * _1987;
    int _2045 = _2043 + _2023;
    int _2047 = abs(_2027);
    float _2049 = _170 * 6.283185482025146484375;
    bool _2051 = !_1816;
    int _2053 = _2051 ? 0 : 1;
    int _2055 = _2045 * _2047;
    int _2057 = abs(_2053);
    int _2059 = _2011 * _2021;
    int _2061 = _2059 + _1872;
    float _2063 = _2049 * 0.15915493667125701904296875;
    float _2065 = _138 + _2049;
    bool _2067 = !_1824;
    int _2069 = _2067 ? 0 : 1;
    float _2071 = _2063 * 6.283185482025146484375;
    float _2073 = cos(_2071);
    int _2075 = _2031 * _2019;
    int _2077 = _2075 + _2055;
    float _2079 = _2065 * 0.070000000298023223876953125;
    float _2081 = _1963 + _1794;
    int _2083 = abs(_2069);
    int _2085 = _2061 * _2057;
    int _2087 = _2085 + _2077;
    float _2089 = _1969 + _1888;
    float _2091 = in.m_77.x;
    float _2093 = in.m_77.y;
    float _2095 = in.m_77.z;
    float _2097 = _2063 * 6.283185482025146484375;
    float _2099 = sin(_2097);
    int _2101 = _2011 * _2083;
    int _2103 = _2101 + _2087;
    float _2105 = _2073 * _2093;
    float _2107 = fma(_2099, _2091, _2105);
    float _2109 = fma(_1782, 6.283185482025146484375, _2079);
    float _2111 = _2109 * 0.15915493667125701904296875;
    float _2113 = _2099 * _2093;
    float _2115 = _2111 * 6.283185482025146484375;
    float _2117 = sin(_2115);
    float _2119 = -_2113;
    float _2121 = fma(_2073, _2091, _2119);
    float _2123 = _2117 * 0.100000001490116119384765625;
    float _2125 = fma(_2107, _2123, _2107);
    float _2127 = fma(_2121, _2123, _2121);
    float _2129 = fma(_2123, _2095, _2095);
    float _2131 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2125);
    float _2133 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2129);
    float _2135 = _1832 * _2131;
    float _2137 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2127);
    float _2139 = _1836 * _2133;
    float _2141 = _2089 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2143 = _2135 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2145 = _1834 * _2137;
    float _2147 = _2135 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2149 = fma(_2081, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2141);
    float _2151 = _2089 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2153 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2143);
    float _2155 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2147);
    float _2157 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2149);
    float _2159 = fma(_2081, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2151);
    float _2161 = fma(_2139, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2153);
    float _2163 = fma(_2139, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2155);
    float _2165 = _2157 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2167 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2159);
    float _2169 = _2161 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2171 = _2163 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2173 = _2167 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2175 = _2017 + _2169;
    float _2177 = _2081 + _2171;
    float _2179 = _2165 + _2173;
    float _2181 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2183 = _2175 + _2181;
    float _2185 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2187 = _2177 + _2185;
    float _2189 = 1.0 / _2173;
    float _2191 = _2183 * _2183;
    float _2193 = fma(_2187, _2187, _2191);
    float _2195 = _2135 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2197 = sqrt(_2193);
    float _2199 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2195);
    float _2201 = fma(_2139, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2199);
    float _2203 = _2179 * _2189;
    float _2205 = _2203 * 0.5;
    float _2207 = _2201 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2209 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2211 = fma(_2205, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2209);
    float _2213 = _2089 + _2207;
    float _2215 = 1.0 / _2211;
    bool _2217 = _2197 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2219 = _2207;
    float _2221 = _2205;
    float _2223 = _2177;
    float _2225 = _2175;
    float _2227 = _2145;
    float _2229 = _2187;
    float _2231 = _1993;
    if (!_2217)
    {
        _2219 = _2177;
    }
    float _2233 = _2219;
    float _2235 = _2233;
    if (!_2217)
    {
        _2221 = _2175;
    }
    float _2237 = _2221;
    float _2239 = _2237;
    if (!_2217)
    {
        _2223 = _2213;
    }
    float _2241 = _2223;
    bool _2243 = !_2217;
    float _2245 = _2241;
    if (!_2243)
    {
        float _2247 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2249 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2251 = _2197 + _2249;
        float _2253 = _2213 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2255 = rsqrt(_2193);
        float _2257 = _2251 * _2247;
        float _2259 = _2257 * 0.15915493667125701904296875;
        float _2261 = _2259 * 6.283185482025146484375;
        float _2263 = cos(_2261);
        float _2265 = _2259 * 6.283185482025146484375;
        float _2267 = sin(_2265);
        float _2269 = _2263 + (-1.0);
        float _2271 = _2269 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2273 = fma(_2267, _2253, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2275 = fma(_2213, _2263, _2271);
        float _2277 = _2255 * _2273;
        float _2279 = fma(_2187, _2277, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2281 = fma(_2183, _2277, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2235 = _2279;
        _2245 = _2275;
        _2239 = _2281;
    }
    float _2283 = _2235;
    float _2285 = _2245;
    float _2287 = _2239;
    float _2289 = _2285;
    float _2291 = _2283;
    float _2293 = _2287;
    if (!_1852)
    {
        float _2295 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2297 = _2089 + _2295;
        float _2299 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2301 = _2081 + _2299;
        float _2303 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2305 = _2297 * _2297;
        float _2307 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2309 = _2017 + _2307;
        float _2311 = fma(_2301, _2301, _2305);
        float _2313 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2315 = fma(_2309, _2309, _2311);
        float _2317 = sqrt(_2315);
        float _2319 = _2303 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2321 = precise::min(_2317, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2323 = _2321 * _2313;
        float _2325 = -_2081;
        float _2327 = _2325 + _2283;
        float _2329 = _2319 * _2323;
        float _2331 = -_2089;
        float _2333 = _2331 + _2285;
        float _2335 = -_2017;
        float _2337 = _2335 + _2287;
        float _2339 = fma(_2327, _2329, _2081);
        float _2341 = fma(_2333, _2329, _2089);
        float _2343 = fma(_2337, _2329, _2017);
        _2289 = _2341;
        _2291 = _2339;
        _2293 = _2343;
        _2225 = _2313;
    }
    float _2345 = _2289;
    float _2347 = _2291;
    float _2349 = _2293;
    float _2351 = _2225;
    float _2353 = _2351;
    if (_2041)
    {
        _2227 = 1.0;
    }
    float _2355 = _2227;
    float _2357 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2359 = _2215 * _2357;
    float _2361 = _2355;
    if (!_2041)
    {
        float _2363 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2365 = _2363 * 0.15915493667125701904296875;
        float _2367 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2369 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2371 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2369;
        float _2373 = _2365 * 6.283185482025146484375;
        float _2375 = cos(_2373);
        float _2377 = _2367 * 0.15915493667125701904296875;
        float _2379 = _2365 * 6.283185482025146484375;
        float _2381 = sin(_2379);
        float _2383 = 1.0 / _2375;
        float _2385 = _2377 * 6.283185482025146484375;
        float _2387 = cos(_2385);
        float _2389 = _2381 * _2383;
        float _2391 = _2377 * 6.283185482025146484375;
        float _2393 = sin(_2391);
        float _2395 = _2387 * _2389;
        float _2397 = 1.0 / _2371;
        float _2399 = 1.0 / _2395;
        float _2401 = _2393 * _2399;
        float _2403 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2405 = fma(_2359, _2401, _2403);
        float _2407 = _2405 * _2397;
        float _2409 = precise::clamp(_2407, 0.0, 1.0);
        _2353 = _2397;
        _2229 = _2377;
        _2361 = _2409;
    }
    float _2411 = _2353;
    float _2413 = _2229;
    float _2415 = _2361;
    float _2417 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2419 = _2345 + _2417;
    float _2421 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2423 = _2347 + _2421;
    float _2425 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2427 = _2349 + _2425;
    float _2429 = in.m_79.w;
    float _2431 = _2419 * _2419;
    float _2433 = fma(_2423, _2423, _2431);
    float _2435 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2437 = _2435 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2439 = fma(_2427, _2427, _2433);
    float _2441 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2443 = _2441 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2445 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2447 = _2445 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2449 = rsqrt(_2439);
    float _2451 = sqrt(_2439);
    float _2453 = _2449 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2455 = 1.0 / _2437;
    float _2457 = _2423 * _2453;
    float _2459 = _2427 * _2453;
    float _2461 = _2457 * _2457;
    float _2463 = _2459 * _2459;
    float _2465 = 1.0 / _2443;
    float _2467 = _2461 + _2463;
    float _2469 = sqrt(_2467);
    float _2471 = 1.0 / _2447;
    bool _2473 = _2469 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2475 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2477 = _2469 + _2475;
    float _2479 = _2427;
    float _2481 = _2431;
    float _2483 = _2477;
    float _2485 = _2411;
    float _2487 = _2419;
    float _2489 = _2413;
    bool _2491 = _2473;
    if (_2473)
    {
        float _2493 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2479 = _2493;
    }
    float _2495 = _2479;
    if (_2473)
    {
        float _2497 = rsqrt(_2467);
        _2481 = _2497;
    }
    float _2499 = _2481;
    float _2501 = _2499;
    if (_2473)
    {
        float _2503 = _2477 * _2495;
        _2483 = _2503;
    }
    float _2505 = _2483;
    if (_2473)
    {
        float _2507 = _2505 * 0.15915493667125701904296875;
        _2485 = _2507;
    }
    float _2509 = _2485;
    float _2511 = fma(_2081, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2513 = _2495;
    if (_2473)
    {
        float _2515 = _2509 * 6.283185482025146484375;
        float _2517 = sin(_2515);
        _2513 = _2517;
    }
    float _2519 = _2513;
    float _2521 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2523 = precise::max(0.0, _2521);
    float _2525 = _2449;
    float _2527 = _2523;
    if (_2473)
    {
        float _2529 = _2509 * 6.283185482025146484375;
        float _2531 = cos(_2529);
        _2525 = _2531;
    }
    float _2533 = _2525;
    float _2535 = -_2453;
    float _2537 = -_2523;
    float _2539 = fma(_2419, _2535, _2537);
    if (_2473)
    {
        float _2541 = _2539 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2527 = _2541;
    }
    float _2543 = _2527;
    float _2545 = floor(_2511);
    float _2547 = _2543;
    float _2549 = _2519;
    if (_2473)
    {
        float _2551 = fma(_2519, _2543, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2547 = _2551;
    }
    float _2553 = _2547;
    float _2555 = _2553;
    if (!_2473)
    {
        _2549 = _2457;
    }
    float _2557 = _2549;
    float _2559 = _2557;
    float _2561 = _2533;
    if (_2473)
    {
        float _2563 = _2533 + (-1.0);
        _2487 = _2563;
    }
    float _2565 = _2487;
    float _2567 = _2565;
    if (_2473)
    {
        float _2569 = _2499 * _2553;
        _2231 = _2569;
    }
    float _2571 = _2231;
    if (!_2473)
    {
        _2555 = _2539;
    }
    float _2573 = _2555;
    float _2575 = _2573;
    if (_2473)
    {
        float _2577 = _2565 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2489 = _2577;
    }
    float _2579 = _2489;
    if (_2473)
    {
        float _2581 = _2457 * _2571;
        _2559 = _2581;
    }
    float _2583 = _2559;
    if (!_2473)
    {
        _2567 = _2459;
    }
    float _2585 = _2567;
    float _2587 = _2585;
    if (_2473)
    {
        float _2589 = _2459 * _2571;
        _2587 = _2589;
    }
    float _2591 = _2587;
    if (!_2473)
    {
        _2501 = _2461;
    }
    float _2593 = _2501;
    float _2595 = _2593;
    if (_2473)
    {
        float _2597 = fma(_2539, _2533, _2579);
        _2575 = _2597;
    }
    float _2599 = _2575;
    if (_2473)
    {
        float _2601 = _2583 * _2583;
        _2595 = _2601;
    }
    float _2603 = _2595;
    if (!_2473)
    {
        _2561 = _2463;
    }
    float _2605 = _2561;
    float _2607 = _2605;
    if (_2473)
    {
        float _2609 = _2591 * _2591;
        _2607 = _2609;
    }
    float _2611 = _2607;
    float _2613 = fma(_2599, _2599, _2603);
    float _2615 = -_2545;
    float _2617 = _2511 + _2615;
    float _2619 = _2613 + _2611;
    float _2621 = fma(_2017, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2623 = _2345 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2625 = rsqrt(_2619);
    float _2627 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2629 = fma(_2451, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2627);
    float _2631 = precise::clamp(_2629, 0.0, 1.0);
    float _2633 = fma(_2347, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2623);
    float _2635 = -_2631;
    float _2637 = _2635 + 1.0;
    float _2639 = _2345 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2641 = fma(_2349, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2633);
    float _2643 = floor(_2621);
    float _2645 = fma(_2347, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2639);
    float _2647 = _2641 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2649 = fma(_2349, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2645);
    float _2651 = _2625 * _2583;
    float _2653 = _2345 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2655 = _2625 * _2591;
    float _2657 = _2345 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2659 = abs(_2637);
    float _2661 = log2(_2659);
    float _2663 = fma(_2347, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2653);
    float _2665 = _2649 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2667 = fma(_2347, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2657);
    float _2669 = _2625 * _2599;
    float _2671 = fma(_2349, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2663);
    float _2673 = -_2643;
    float _2675 = _2621 + _2673;
    float _2677 = fma(_2349, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2667);
    float _2679 = _2669 + 1.0;
    float _2681 = _2671 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2683 = _2651 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2685 = _2677 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2687 = _2681 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2689 = _2661 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2691 = fma(_2685, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2687);
    float _2693 = fma(_2665, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2691);
    float _2695 = -_2683;
    float _2697 = fma(_2669, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2695);
    float _2699 = exp2(_2689);
    float _2701 = fma(_2647, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2693);
    float _2703 = -_2655;
    float _2705 = fma(_2703, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2697);
    float _2707 = fma(_2705, 0.5, 0.5);
    float _2709 = fma(_2705, -0.5, 0.5);
    float _2711 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2713 = _2665 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2715 = 1.0 / _2701;
    float _2717 = fma(_2707, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2719 = -_2713;
    float _2721 = fma(_2719, _2711, 1.0);
    float _2723 = _2681 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2725 = -_2669;
    float _2727 = fma(_2699, _2679, _2725);
    float _2729 = _2681 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2731 = fma(_2707, _2717, -0.212114393711090087890625);
    float _2733 = sqrt(_2709);
    float _2735 = fma(_2685, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2723);
    float _2737 = fma(_2685, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2729);
    float _2739 = fma(_2707, _2731, 1.570728778839111328125);
    float _2741 = fma(_2665, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2735);
    float _2743 = fma(_2665, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2737);
    float _2745 = log2(_2721);
    float _2747 = fma(_2647, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2741);
    float _2749 = fma(_2647, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2743);
    float2 _8179 = float2(_2617, _2675);
    float _2751 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8179, float2(0.0), isnan(_8179)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8179, float2(0.0), isnan(_8179)), level(0.0)).x;
    float _2753 = fma(_2727, 0.5, 0.5);
    float _2755 = _2747 * _2715;
    float _2757 = _2733 * 0.636619746685028076171875;
    float _2759 = -_2739;
    float _2761 = fma(_2757, _2759, 1.0);
    float _2763 = _2749 * _2715;
    float _2765 = fma(_2755, 0.5, 0.5);
    float _2767 = _2745 * 0.693147182464599609375;
    float _2769 = fma(_2763, -0.5, 0.5);
    float _2771 = float(uint(_2103));
    float _2773 = _2767 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float3 _8218 = float3(_2765, _2769, _2773);
    float _2775 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8218, float3(0.0), isnan(_8218)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8218, float3(0.0), isnan(_8218)), level(0.0)).x;
    float3 _8229 = float3(_2765, _2769, _2773);
    float4 _2778 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8229, float3(0.0), isnan(_8229)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8229, float3(0.0), isnan(_8229)), level(0.0)).xyzw;
    float _2780 = _2778.x;
    float _2782 = _2778.y;
    float _2784 = _2778.z;
    float _2786 = _2778.w;
    float2 _8245 = float2(_2761, _2753);
    float3 _2790 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8245, float2(0.0), isnan(_8245)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8245, float2(0.0), isnan(_8245)), level(0.0)).xyz;
    float _2792 = _2790.x;
    float _2794 = _2790.y;
    float _2796 = _2790.z;
    float _2798 = as_type<float>(_1874) * _2771;
    float _2800 = _170 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    out.m_81.w = _2429;
    float _2802 = trunc(_2798);
    float _2804 = precise::max(_2802, 0.0);
    uint _2806 = uint(_2804);
    float _2808 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2810 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    if (_1662)
    {
        bool _2812 = _170 > 0.5;
        _2491 = _2812;
    }
    bool _2814 = _2491;
    float _2816 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _2818 = ~_1820;
    int _2820 = _2818 + 1;
    float _2822 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2808);
    float _2824 = -_2810;
    float _2826 = fma(_2800, 2.0, _2824);
    float _2828 = _1656 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    out.m_83.x = _2081;
    out.m_83.y = _2089;
    out.m_83.z = _2017;
    float _2830 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2832 = _2830 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2834 = fma(_2828, -2.0, _2816);
    int _2836 = _2820 * int(_2806);
    int _2838 = _2836 + _2103;
    float _2840 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2842 = 1.0 / _2832;
    float _2844 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _2846 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _2844;
    float _2848 = float(uint(_2838));
    float _2850 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _2852 = _2850 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    int _2854 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2856 = _2854 != 0;
    float _2858 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2860 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _2858;
    int _2862 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2864 = _2862 != 0;
    float _2866 = as_type<float>(_1874) * _2848;
    float _2868 = _2852 * _2455;
    float _2870 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2872 = _2870 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2874 = _2846 * _2465;
    float _2876 = trunc(_2866);
    float _2878 = precise::max(_2876, 0.0);
    uint _2880 = uint(_2878);
    float _2882 = in.m_85.x;
    float _2884 = in.m_85.y;
    bool _2886 = _1656 > 0.5;
    float _2888 = fma(_1656, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2840);
    float _2890 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2892 = _2890 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _2894 = _2860 * _2471;
    float _2896 = in.m_87.x;
    float _2898 = in.m_87.y;
    float _2900 = 1.0 / _2872;
    float _2902 = -_138;
    float _2904 = fma(_2902, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2826);
    float _2906 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _2908 = _2906 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    int _2910 = ~_1820;
    int _2912 = _2910 + 1;
    float _2914 = _2661 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2916 = _1632 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _2918 = isnan(_1632);
    bool _2920 = _2916 || _2918;
    bool _2922 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _2924 = _2920 || _2922;
    float _2926 = float(_2924);
    float _2928 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2930 = _2928 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    int _2932 = int(_2806) + int(_2880);
    float _2934 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _2936 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _2934;
    int _2938 = ~_1820;
    int _2940 = _2938 + 1;
    float _2942 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _2944 = _2942 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2946 = 1.0 / _2892;
    float _2948 = -_2926;
    float _2950 = _2948 + 1.0;
    if (_2864)
    {
        float _2952 = _2886 ? _1686 : _1634;
        _1696 = _2952;
    }
    float _2954 = _1696;
    float _2956 = _2944 * _2842;
    int _2958 = _2940 * _2932;
    int _2960 = _2958 + _2103;
    float _2962 = _2936 * _2900;
    float _2964 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2888);
    float _2966 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2968 = _1632 + _2966;
    float _2970 = 1.0 / _2930;
    bool _2972 = uint(_2960) >= uint(_1820);
    float _2974 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2976 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _2974;
    float _2978 = _2073 * _2884;
    float _2980 = _2099 * _2898;
    bool _2982 = !_2972;
    int _2984 = _2982 ? 0 : (-1);
    out.m_89.x = _2347;
    out.m_89.y = _2345;
    out.m_89.z = _2349;
    float _2986 = fma(_2099, _2882, _2978);
    float _2988 = _2976 * _2946;
    float _2990 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2822);
    int _2992 = ~_2932;
    int _2994 = _2992 + _2984;
    int _2996 = _2994 + 1;
    float _2998 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2834);
    float _3000 = _2099 * _2884;
    float _3002 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _3004 = _1632 + _3002;
    float _3006 = exp2(_2914);
    int _3008 = _1820 * _2996;
    int _3010 = _3008 + _2103;
    float _3012 = -_3000;
    float _3014 = fma(_2073, _2882, _3012);
    float _3016 = _2073 * _2898;
    float _3018 = -_2980;
    float _3020 = fma(_2073, _2896, _3018);
    float _3022 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _3024 = _1632 + _3022;
    float _3026 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _3028 = _1632 + _3026;
    bool _3030 = !_1971;
    int _3032 = _3030 ? _3010 : (-1);
    float _3034 = fma(_2099, _2896, _3016);
    float _3036 = fma(_2874, _3024, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _3038 = fma(_2868, _3028, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _3040 = fma(_2894, _3004, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _3042 = float(uint(_2061));
    float _3044 = _2908 * _2970;
    bool _3046 = _1632 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _3048 = isnan(_1632);
    bool _3050 = _3046 || _3048;
    bool _3052 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _3054 = _3050 || _3052;
    float _3056 = float(_3054);
    int _3058 = _3032 >> 31;
    float _3060 = as_type<float>(_1874) * _3042;
    bool _3062 = _1632 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _3064 = isnan(_1632);
    bool _3066 = _3062 || _3064;
    bool _3068 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _3070 = _3066 || _3068;
    float _3072 = float(_3070);
    float _3074 = -_3056;
    float _3076 = _3074 + 1.0;
    int _3078 = _3058 & 3;
    float _3080 = -_3006;
    float _3082 = _3080 + 1.0;
    bool _3084 = _1632 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _3086 = isnan(_1632);
    bool _3088 = _3084 || _3086;
    bool _3090 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _3092 = _3088 || _3090;
    float _3094 = float(_3092);
    float _3096 = _3072 * _3076;
    int _3098 = _3032 + _3078;
    float _3100 = -_3072;
    float _3102 = _3100 + 1.0;
    float _3104 = trunc(_3060);
    float _3106 = precise::max(_3104, 0.0);
    uint _3108 = uint(_3106);
    bool _3110 = _1632 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _3112 = isnan(_1632);
    bool _3114 = _3110 || _3112;
    bool _3116 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _3118 = _3114 || _3116;
    float _3120 = float(_3118);
    float _3122 = -_3094;
    float _3124 = _3122 + 1.0;
    int _3126 = _3098 >> 2;
    float _3128 = _3094 * _3102;
    bool _3130 = _1632 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _3132 = isnan(_1632);
    bool _3134 = _3130 || _3132;
    bool _3136 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _3138 = _3134 || _3136;
    float _3140 = float(_3138);
    float _3142 = -_3120;
    float _3144 = _3142 + 1.0;
    int _3146 = _3126 << 4;
    int _3148 = _3146 + 368;
    float _3150 = _3120 * _3124;
    bool _3152 = _1632 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _3154 = isnan(_1632);
    bool _3156 = _3152 || _3154;
    bool _3158 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _3160 = _3156 || _3158;
    float _3162 = float(_3160);
    float _3164 = _3140 * _3144;
    float _3166 = -_3140;
    float _3168 = _3166 + 1.0;
    bool _3170 = _1632 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _3172 = isnan(_1632);
    bool _3174 = _3170 || _3172;
    bool _3176 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _3178 = _3174 || _3176;
    float _3180 = float(_3178);
    uint _3182 = uint(int(uint(_3148) >> uint(2)));
    uint _3184 = uint(int(uint(int(_3182)) >> uint(2)));
    int _3186 = int(_3182) & 3;
    float _3188 = (*spvDescriptorSet0.vp_c9)._m0[int(_3184)][_3186];
    int _3190 = int(_3182) + 1;
    uint _3192 = uint(int(uint(_3190) >> uint(2)));
    int _3194 = _3190 & 3;
    float _3196 = (*spvDescriptorSet0.vp_c9)._m0[int(_3192)][_3194];
    float _3198 = -_3162;
    float _3200 = _3198 + 1.0;
    float _3202 = _3162 * _3168;
    int _3204 = _2912 * int(_3108);
    int _3206 = _3204 + _2061;
    float _3208 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _3210 = _1632 + _3208;
    float _3212 = _2926 * _3200;
    float _3214 = _3180 * _2950;
    int _3216 = _3032 & 3;
    bool _3218 = _3216 != 0;
    float _3220 = fma(_3044, _3210, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _3222 = float(uint(_3206));
    float _3224 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3226 = _1632 + _3224;
    float _3228 = _3036 * _3214;
    float _3230 = _3082 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _3232 = _3148 + 8;
    uint _3234 = uint(int(uint(_3232) >> uint(2)));
    uint _3236 = uint(int(uint(int(_3234)) >> uint(2)));
    int _3238 = int(_3234) & 3;
    float _3240 = (*spvDescriptorSet0.vp_c9)._m0[int(_3236)][_3238];
    int _3242 = int(_3234) + 1;
    uint _3244 = uint(int(uint(_3242) >> uint(2)));
    int _3246 = _3242 & 3;
    float _3248 = (*spvDescriptorSet0.vp_c9)._m0[int(_3244)][_3246];
    float _3250 = as_type<float>(_1874) * _3222;
    float _3252 = fma(_2962, _3226, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    int _3254 = _3032 & 3;
    bool _3256 = _3254 != 0;
    float _3258 = -_3180;
    float _3260 = _3258 + 1.0;
    int _3262 = _3218 ? 0 : 1;
    float _3264 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3266 = _1632 + _3264;
    bool _3268 = uint(_3254) > 1u;
    float _3270 = trunc(_3250);
    float _3272 = precise::max(_3270, 0.0);
    uint _3274 = uint(_3272);
    float _3276 = fma(_2956, _2968, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _3278 = fma(_3260, (*spvDescriptorSet0.vp_c9)._m0[167].x, _3228);
    int _3280 = ~_3262;
    int _3282 = _3280 + 1;
    int _3284 = _3282 + 1;
    float _3286 = fma(_2988, _3266, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    bool _3288 = uint(_3254) >= 2u;
    float _3290 = fma(_3038, _3212, _3278);
    int _3292 = ~_1820;
    int _3294 = _3292 + 1;
    int _3296 = _3288 ? 0 : 1;
    float _3298 = fma(_3040, _3202, _3290);
    int _3300 = _3284;
    float _3302 = _3014;
    if (!_3268)
    {
        int _3304 = ~_3262;
        int _3306 = _3304 + 1;
        _3300 = _3306;
    }
    int _3308 = _3300;
    bool _3310 = _3254 != 3;
    float _3312 = fma(_3220, _3164, _3298);
    int _3314 = abs(_3308);
    bool _3316 = !_3256;
    int _3318 = _3316 ? 0 : 1;
    float _3320 = fma(_3252, _3150, _3312);
    int _3322 = ~_3314;
    int _3324 = _3322 + 1;
    int _3326 = _3324 + 1;
    int _3328 = int(_3108) + int(_3274);
    float _3330 = fma(_3276, _3128, _3320);
    bool _3332 = _3254 != 3;
    int _3334 = abs(_3318);
    int _3336 = _3326 * as_type<int>(_3196);
    bool _3338 = !_2856;
    int _3340 = _3338 ? 0 : 1;
    int _3342 = _3294 * _3328;
    int _3344 = _3342 + _2061;
    int _3346 = ~_3296;
    int _3348 = _3346 + 1;
    int _3350 = _3348 + 1;
    float _3352 = fma(_3286, _3096, _3330);
    int _3354 = abs(_3340);
    int _3356 = ~_3334;
    int _3358 = _3356 + 1;
    int _3360 = _3358 + 1;
    float _3362 = fma(_3056, (*spvDescriptorSet0.vp_c9)._m0[174].x, _3352);
    int _3364 = _3350;
    if (_3310)
    {
        int _3366 = ~_3296;
        int _3368 = _3366 + 1;
        _3364 = _3368;
    }
    int _3370 = _3364;
    float _3372 = abs(_2359);
    float _3374 = log2(_3372);
    bool _3376 = !_3332;
    int _3378 = _3376 ? 0 : (-1);
    int _3380 = _3360 * as_type<int>(_3188);
    int _3382 = _3380 + _3336;
    bool _3384 = uint(_3344) >= uint(_1820);
    out.m_91.x = _3362;
    int _3386 = abs(_3370);
    int _3388 = abs(_3378);
    bool _3390 = !_3384;
    int _3392 = _3390 ? 0 : (-1);
    int _3394 = ~_3386;
    int _3396 = _3394 + 1;
    int _3398 = _3396 + 1;
    float _3400 = _3034 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3402 = ~_3328;
    int _3404 = _3402 + _3392;
    int _3406 = _3404 + 1;
    int _3408 = _3398 * as_type<int>(_3240);
    int _3410 = _3408 + _3382;
    int _3412 = ~_3388;
    int _3414 = _3412 + 1;
    int _3416 = _3414 + 1;
    float _3418 = _3374 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _3420 = ~_3354;
    int _3422 = _3420 + 1;
    int _3424 = _3422 + 1;
    int _3426 = _3382;
    if (_1662)
    {
        float _3428 = -_1652;
        float _3430 = _3428 + 1.0;
        _3426 = as_type<int>(_3430);
    }
    int _3432 = _3426;
    int _3434 = _1820 * _3406;
    int _3436 = _3434 + _2061;
    int _3438 = _3416 * as_type<int>(_3248);
    int _3440 = _3438 + _3410;
    float _3442 = exp2(_3418);
    if (_1662)
    {
        float _3444 = _2814 ? as_type<float>(_3432) : _1652;
        _1710 = _3444;
    }
    float _3446 = _1710;
    float _3448 = in.m_85.z;
    int _3450 = _3440 * _3424;
    float _3452 = _3034 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _3454 = !_1971;
    int _3456 = _3454 ? _3436 : (-1);
    float _3458 = fma((*spvDescriptorSet0.vp_c9)._m0[80].y, _2954, -0.5);
    bool _3460 = _2125 != 0.0;
    bool _3462 = isnan(_2125);
    bool _3464 = _3460 || _3462;
    bool _3466 = isnan(0.0);
    bool _3468 = _3464 || _3466;
    float _3470 = in.m_87.z;
    float _3472 = in.m_87.w;
    int _3474 = _3456 * _3354;
    int _3476 = _3474 + _3450;
    float _3478 = -_2998;
    float _3480 = fma(_2964, _3458, _3478);
    float _3482 = fma(_3446, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    bool _3484 = _2127 == 0.0;
    bool _3486 = !_3468;
    bool _3488 = _3484 && _3486;
    float _3490 = _3480 + 0.5;
    float _3492 = float(_3476);
    float _3494 = fma(_3442, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3496 = precise::clamp(_3494, 0.0, 1.0);
    bool _3498 = _2129 == 0.0;
    bool _3500 = _3498 && _3488;
    float _3502 = fma(_2990, _3482, _2904);
    float _3504 = _3034 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3506 = fma(_3496, -2.0, 3.0);
    float _3508 = _3496 * _3496;
    out.m_93.x = _3492;
    float _3510 = fma(_3020, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3452);
    float _3512 = _3502 + 0.5;
    float _3514 = _3508 * _3506;
    float _3516 = fma(_3020, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3400);
    bool _3518 = _2359 <= 8000.0;
    bool _3520 = isnan(_2359);
    bool _3522 = _3518 || _3520;
    bool _3524 = isnan(8000.0);
    bool _3526 = _3522 || _3524;
    float _3528 = float(_3526);
    out.m_95.x = _3512;
    out.m_95.y = _3490;
    out.m_95.z = _1778;
    out.m_95.w = _1780;
    float _3530 = fma(_3020, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3504);
    float _3532 = _3452;
    if (_3500)
    {
        _3532 = _3448;
    }
    float _3534 = _3532;
    float _3536 = fma(_3470, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3516);
    float _3538 = _2986 * _3020;
    float _3540 = _3014 * _3470;
    float _3542 = fma(_3470, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3530);
    float _3544 = fma(_3470, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3510);
    float _3546 = -_3538;
    float _3548 = fma(_3014, _3034, _3546);
    float _3550 = _3034 * _3448;
    float _3552 = -_3540;
    float _3554 = fma(_3020, _3448, _3552);
    float _3556 = _3534;
    if (!_3500)
    {
        float _3558 = fma(_2129, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3448);
        _3556 = _3558;
    }
    float _3560 = _3556;
    float _3562 = -_3514;
    float _3564 = _3562 + 1.0;
    float _3566 = -_3550;
    float _3568 = fma(_2986, _3470, _3566);
    float _3570 = _3554 * _3472;
    float _3572 = in.m_97.x;
    float _3574 = fma(_3564, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3514);
    float _3576 = _3568 * _3472;
    float _3578 = _3570 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    out.m_99.x = _3542;
    out.m_99.y = _3536;
    out.m_99.z = _3544;
    float _3580 = _3570 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3582 = _3528 * _3574;
    float _3584 = _3548 * _3472;
    float _3586 = fma(_3576, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3578);
    float _3588 = fma(_3576, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3580);
    float _3590 = _2681 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3592 = _3582 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3594 = fma(_3584, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3586);
    float _3596 = fma(_3584, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3588);
    float _3598 = _3574;
    if (_3500)
    {
        _3598 = _2986;
    }
    float _3600 = _3598;
    float _3602 = fma(_2685, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3590);
    float _3604 = _3570 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3606 = _3600;
    if (!_3500)
    {
        float _3608 = fma(_2125, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2986);
        _3606 = _3608;
    }
    float _3610 = _3606;
    if (!_3500)
    {
        float _3612 = fma(_2127, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3014);
        _3302 = _3612;
    }
    float _3614 = _3302;
    float _3616 = fma(_2665, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3602);
    float _3618 = fma(_3576, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3604);
    float _3620 = _2701 * 0.5;
    float _3622 = _3610 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3624 = _3610 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3626 = fma(_3584, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3618);
    float _3628 = fma(_2749, -0.5, _3620);
    float _3630 = _3610 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3632 = -_2751;
    float _3634 = _3632 + 1.0;
    out.m_101.x = _3594;
    out.m_101.y = _3596;
    out.m_101.z = _3626;
    float _3636 = fma(_3614, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3622);
    float _3638 = fma(_3614, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3624);
    float _3640 = _3634 * _3592;
    float _3642 = precise::clamp(_3640, 0.0, 1.0);
    float _3644 = fma(_3614, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3630);
    float _3646 = fma(_3560, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3636);
    float _3648 = fma(_3560, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3638);
    float _3650 = -_3642;
    float _3652 = fma(_3650, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3654 = fma(_2647, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3616);
    float _3656 = fma(_3560, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3644);
    bool _3658 = _2451 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3660 = isnan(_2451);
    bool _3662 = _3658 || _3660;
    bool _3664 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3666 = _3662 || _3664;
    float _3668 = _3652 * _3572;
    float _3670 = _3654 + _2701;
    out.gl_Position.x = _2747;
    out.gl_Position.y = _2749;
    out.gl_Position.z = _3654;
    out.gl_Position.w = _2701;
    float _3672 = _2747 + _2701;
    float _3674 = _3668 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_103.x = _3646;
    out.m_103.y = _3648;
    out.m_103.z = _3656;
    float _3676 = _3670 * 0.5;
    float _3678 = _3672 * 0.5;
    float _3680 = _3230 * _2775;
    float _3682 = -_3230;
    float _3684 = _3682 + 1.0;
    out.m_105.x = _3674;
    float _3686 = _3626;
    float _3688 = _3680;
    if (!_3666)
    {
        _3686 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3690 = _3686;
    float _3692 = _2786 * _3680;
    float _3694 = _2796 * _3680;
    out.m_107.x = _3678;
    out.m_107.y = _3628;
    out.m_107.z = _3676;
    out.m_107.w = _2701;
    float _3696 = _3692;
    float _3698 = _3690;
    float _3700 = _3690;
    if (!_3666)
    {
        _3688 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3702 = _3688;
    float _3704 = fma(_2792, _3692, _2780);
    float _3706 = fma(_2794, _3692, _2782);
    float _3708 = _2786 * _3684;
    float _3710 = fma(_2786, _3694, _2784);
    float _3712 = _3702;
    float _3714 = _3702;
    if (!_3666)
    {
        _3696 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3716 = _3696;
    out.m_109.x = _3704;
    out.m_109.y = _3706;
    out.m_109.z = _3710;
    out.m_109.w = _3708;
    float _3718 = _2415 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _3720 = !_3666;
    float _3722 = _3716;
    float _3724 = _3716;
    if (!_3720)
    {
        bool _3726 = _2451 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3728 = isnan(_2451);
        bool _3730 = _3726 || _3728;
        bool _3732 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3734 = _3730 || _3732;
        if (!_3734)
        {
            float _3736 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3738 = _2451 + _3736;
            float _3740 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3742 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3740;
            float _3744 = 1.0 / _3742;
            float _3746 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3748 = _3746 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3750 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3752 = _3750 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3754 = _3738 * _3744;
            float _3756 = precise::clamp(_3754, 0.0, 1.0);
            float _3758 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3760 = _3758 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3762 = fma(_3756, _3752, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3764 = fma(_3756, _3760, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3766 = fma(_3756, _3748, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _3724 = _3766;
            _3700 = _3764;
            _3714 = _3762;
            _3768 = true;
        }
        else
        {
            bool _3770 = _2451 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3772 = isnan(_2451);
            bool _3774 = _3770 || _3772;
            bool _3776 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3778 = _3774 || _3776;
            if (!_3778)
            {
                _3698 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3780 = _3698;
            _3700 = _3780;
            if (!_3778)
            {
                _3722 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3782 = _3722;
            _3724 = _3782;
            if (!_3778)
            {
                _3712 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3784 = _3712;
            bool _3786 = !_3778;
            _3714 = _3784;
            if (!_3786)
            {
                bool _3788 = _2451 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3790 = isnan(_2451);
                bool _3792 = _3788 || _3790;
                bool _3794 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3796 = _3792 || _3794;
                if (!_3796)
                {
                    float _3798 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3800 = _2451 + _3798;
                    float _3802 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3804 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3802;
                    float _3806 = 1.0 / _3804;
                    float _3808 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3810 = _3808 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3812 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3814 = _3812 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3816 = _3800 * _3806;
                    float _3818 = precise::clamp(_3816, 0.0, 1.0);
                    float _3820 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3822 = _3820 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3824 = fma(_3818, _3814, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3826 = fma(_3818, _3822, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3828 = fma(_3818, _3810, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _3724 = _3828;
                    _3700 = _3826;
                    _3714 = _3824;
                    _3768 = true;
                }
                else
                {
                    _3724 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3700 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3714 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _3768 = false;
    float _3830 = _3724;
    float _3832 = _3700;
    float _3834 = _3714;
    float _3836 = _3718 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_111.x = 0.0;
    float _3838 = _3830 * 0.586610972881317138671875;
    bool _3840 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_55.x = _3836;
    float _3842 = fma(_3832, 0.298911988735198974609375, _3838);
    bool _3844 = _2415 > 0.0;
    bool _3846 = isnan(_2415);
    bool _3848 = _3844 || _3846;
    bool _3850 = isnan(0.0);
    bool _3852 = _3848 || _3850;
    float _3854 = fma(_3834, 0.114477999508380889892578125, _3842);
    float _3856 = -_3854;
    float _3858 = _3856 + _3832;
    float _3860 = -_3854;
    float _3862 = _3860 + _3830;
    float _3864 = -_3854;
    float _3866 = _3864 + _3834;
    float _3868 = fma(_3858, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3854);
    float _3870 = fma(_3862, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3854);
    float _3872 = fma(_3866, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3854);
    bool _3874 = !_3840;
    if (!_3874)
    {
        float _3876 = -_2345;
        float _3878 = _3876 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3880 = -_2347;
        float _3882 = _3880 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3884 = -_2349;
        float _3886 = _3884 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3888 = _3878 * _3878;
        float _3890 = fma(_3882, _3882, _3888);
        float _3892 = fma(_3886, _3886, _3890);
        float _3894 = sqrt(_3892);
        float _3896 = rsqrt(_3892);
        float _3898 = -_3894;
        float _3900 = _3898 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3902 = _3900 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3904 = precise::clamp(_3902, 0.0, 1.0);
        float _3906 = _3882 * _3896;
        float _3908 = _3878 * _3896;
        float _3910 = abs(_3904);
        float _3912 = log2(_3910);
        float _3914 = _3886 * _3896;
        float _3916 = _3906 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3918 = _3648 * _3908;
        float _3920 = -_3908;
        float _3922 = -_3916;
        float _3924 = fma(_3920, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3922);
        float _3926 = fma(_3646, _3906, _3918);
        float _3928 = -_3914;
        float _3930 = fma(_3928, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3924);
        float _3932 = fma(_3656, _3914, _3926);
        float _3934 = precise::clamp(_3932, 0.0, 1.0);
        float _3936 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3938 = _3930 + _3936;
        float _3940 = _3912 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3942 = _3938 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3944 = precise::clamp(_3942, 0.0, 1.0);
        float _3946 = exp2(_3940);
        float _3948 = _3946 * _3944;
        float _3950 = _3934 * _3948;
        float _3952 = _3950 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3954 = _3950 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3956 = _3950 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_111.x = _3952;
        out.m_111.y = _3954;
        out.m_111.z = _3956;
    }
    out.m_113.x = _3868;
    out.m_113.y = _3870;
    out.m_113.z = _3872;
    if (_3852)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 92, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 93, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 94, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 95, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_55.x = 0.0;
    float _3958 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3958;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 92, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 93, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 94, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 95, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

