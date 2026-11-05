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
    float4 m_63 [[user(locn2)]];
    float4 m_67 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_69 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_55 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
    float4 m_57 [[attribute(9)]];
    float4 m_59 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _956 = false;
    bool _816 = false;
    bool _564 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _1950 = as_type<float>(_104);
        out.gl_Position.z = _1950;
    }
    if (!_92)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _108 = in.m_47.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_118)
    {
        float _124 = float(_88);
        _98 = _124;
    }
    float _126 = _98;
    bool _128 = _122 >= _126;
    bool _130 = !_118;
    bool _132 = _128 || _130;
    float _134 = _126;
    if (_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _134;
    if (_132)
    {
        out.m_45.x = 0.0;
    }
    if (_132)
    {
        float _138 = _136 * 5.0;
        _106 = as_type<int>(_138);
    }
    int _140 = _106;
    if (_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2019 = as_type<float>(_140);
        out.gl_Position.z = _2019;
    }
    if (_132)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _142 = in.m_47.x;
    float _144 = in.m_47.y;
    float _146 = in.m_47.z;
    float _148 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _150 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _152 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    float _160 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _162 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _160);
    float _164 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _166 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _164);
    float _168 = _164;
    float _170 = (*spvDescriptorSet0.vp_c10)._m0[19].z;
    float _172 = _148;
    if (!_158)
    {
        float _174 = _148 * _148;
        float _176 = _174 * 0.5;
        _168 = _176;
    }
    float _178 = _168;
    float _180 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _162);
    float _182 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _166);
    float _184 = _178;
    if (!_158)
    {
        float _186 = _178 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _184 = _186;
    }
    float _188 = _184;
    bool _190 = !_158;
    float _192 = _188;
    if (!_190)
    {
        float _194 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _196 = log2(_194);
        float _198 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _200 = _198 + 1.0;
        float _202 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = _148 * _196;
        float _206 = exp2(_204);
        float _208 = _202 * 0.693147182464599609375;
        float _210 = 1.0 / _208;
        float _212 = 1.0 / _200;
        float _214 = _206 + (-1.0);
        float _216 = -_214;
        float _218 = fma(_216, _210, _148);
        float _220 = _218 * _212;
        float _222 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _192 = _222;
        _170 = _206;
    }
    float _224 = _192;
    float _226 = _170;
    bool _228 = !_158;
    float _230 = _226;
    if (!_228)
    {
        float _232 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _234 = log2(_232);
        float _236 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _238 = _236 + 1.0;
        float _240 = 1.0 / _238;
        float _242 = _148 * _234;
        float _244 = exp2(_242);
        float _246 = -_244;
        float _248 = _246 + 1.0;
        float _250 = _248 * _240;
        _172 = _250;
        _230 = _240;
    }
    float _252 = _172;
    float _254 = _230;
    float _256 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _258 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _260 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _262 = _254;
    float _264 = _256;
    float _266 = _260;
    if (!_158)
    {
        float _268 = _122 * _122;
        float _270 = _268 * 0.5;
        _262 = _270;
    }
    float _272 = _262;
    float _274 = fma(_252, _142, _256);
    float _276 = fma(_252, _144, _258);
    float _278 = fma(_252, _146, _260);
    if (!_158)
    {
        float _280 = _272 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _264 = _280;
    }
    float _282 = _264;
    bool _284 = !_158;
    float _286 = _282;
    if (!_284)
    {
        float _288 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _290 = log2(_288);
        float _292 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _294 = _292 + 1.0;
        float _296 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _298 = _122 * _290;
        float _300 = 1.0 / _294;
        float _302 = _296 * 0.693147182464599609375;
        float _304 = exp2(_298);
        float _306 = 1.0 / _302;
        float _308 = _304 + (-1.0);
        float _310 = -_308;
        float _312 = fma(_310, _306, _122);
        float _314 = _312 * _300;
        float _316 = _314 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _286 = _316;
        _266 = _304;
    }
    float _318 = _286;
    float _320 = _266;
    float _322 = _318 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _324 = _320;
    if (!_158)
    {
        _324 = _122;
    }
    float _326 = _324;
    bool _328 = !_158;
    float _330 = _326;
    if (!_328)
    {
        float _332 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _334 = log2(_332);
        float _336 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _338 = _336 + 1.0;
        float _340 = 1.0 / _338;
        float _342 = _122 * _334;
        float _344 = exp2(_342);
        float _346 = -_344;
        float _348 = _346 + 1.0;
        float _350 = _348 * _340;
        _330 = _350;
    }
    float _352 = _330;
    float _354 = _318 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _356 = fma(_352, _144, _322);
    float _358 = _318 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _360 = fma(_352, _142, _354);
    float _362 = -_356;
    float _364 = _276 + _362;
    float _366 = fma(_352, _146, _358);
    float _368 = -_360;
    float _370 = _274 + _368;
    float _372 = _364 * _364;
    float _374 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _376 = -_366;
    float _378 = _278 + _376;
    float _380 = sqrt(_180);
    float _382 = fma(_370, _370, _372);
    float _384 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _374);
    float _386 = _364 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _388 = _364 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _390 = fma(_378, _378, _382);
    float _392 = in.m_49.w;
    float _394 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[14].y, _386);
    float _396 = sqrt(_182);
    float _398 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[14].z, _388);
    float _400 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _384);
    float _402 = _364 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _404 = sqrt(_390);
    float _406 = in.m_42.x;
    float _408 = in.m_42.y;
    float _410 = in.m_42.z;
    float _412 = _364 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _414 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[14].x, _402);
    float _416 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[16].z, _398);
    float _418 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[14].w, _412);
    float _420 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[16].x, _414);
    float _422 = sqrt(_400);
    float _424 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[16].y, _394);
    float _426 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[16].w, _418);
    float _428 = _380 * _420;
    float _430 = _396 * _424;
    bool _432 = _404 >= 9.9999999747524270787835121154785e-07;
    bool _434 = isnan(_404);
    bool _436 = _432 || _434;
    bool _438 = isnan(9.9999999747524270787835121154785e-07);
    bool _440 = _436 || _438;
    float _442 = _430 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _444 = _430 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _446 = _430 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _448 = fma(_428, (*spvDescriptorSet0.vp_c8)._m0[24].x, _442);
    float _450 = fma(_428, (*spvDescriptorSet0.vp_c8)._m0[25].x, _444);
    float _452 = fma(_428, (*spvDescriptorSet0.vp_c8)._m0[26].x, _446);
    float _454 = _422 * _416;
    float _456 = fma(_274, _392, _406);
    float _458 = fma(_276, _392, _408);
    float _460 = fma(_278, _392, _410);
    float _462 = fma(_454, (*spvDescriptorSet0.vp_c8)._m0[25].z, _450);
    float _464 = fma(_454, (*spvDescriptorSet0.vp_c8)._m0[26].z, _452);
    float _466 = fma(_454, (*spvDescriptorSet0.vp_c8)._m0[24].z, _448);
    float _468 = fma(_426, (*spvDescriptorSet0.vp_c8)._m0[25].w, _462);
    float _470 = fma(_426, (*spvDescriptorSet0.vp_c8)._m0[26].w, _464);
    float _472 = fma(_426, (*spvDescriptorSet0.vp_c8)._m0[24].w, _466);
    float _474 = _426;
    float _476 = _468;
    float _478 = _472;
    float _480 = _422;
    if (_440)
    {
        _474 = _468;
    }
    float _482 = _474;
    float _484 = _482;
    if (_440)
    {
        _476 = _470;
    }
    float _486 = _476;
    float _488 = _486;
    if (!_440)
    {
        bool _490 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _492 = !_490;
        if (!_492)
        {
            float _494 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].y;
            float _496 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].x;
            float _498 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].z;
            float _500 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].y, _494);
            float _502 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].x, _496);
            float _504 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].z, _498);
            float _506 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].y, _500);
            float _508 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].x, _502);
            float _510 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].w;
            float _512 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].z, _504);
            float _514 = _396 * _506;
            float _516 = _380 * _508;
            float _518 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].w, _510);
            float _520 = _422 * _512;
            float _522 = _514 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
            float _524 = _514 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
            float _526 = _514 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
            float _528 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].w, _518);
            float _530 = fma(_516, (*spvDescriptorSet0.vp_c8)._m0[25].x, _522);
            float _532 = fma(_516, (*spvDescriptorSet0.vp_c8)._m0[24].x, _524);
            float _534 = fma(_516, (*spvDescriptorSet0.vp_c8)._m0[26].x, _526);
            float _536 = fma(_520, (*spvDescriptorSet0.vp_c8)._m0[25].z, _530);
            float _538 = fma(_520, (*spvDescriptorSet0.vp_c8)._m0[24].z, _532);
            float _540 = fma(_520, (*spvDescriptorSet0.vp_c8)._m0[26].z, _534);
            float _542 = fma(_528, (*spvDescriptorSet0.vp_c8)._m0[25].w, _536);
            float _544 = fma(_528, (*spvDescriptorSet0.vp_c8)._m0[24].w, _538);
            float _546 = fma(_528, (*spvDescriptorSet0.vp_c8)._m0[26].w, _540);
            float _548 = _542 * _542;
            float _550 = fma(_544, _544, _548);
            float _552 = fma(_546, _546, _550);
            float _554 = rsqrt(_552);
            float _556 = _554 * 9.9999999747524270787835121154785e-07;
            float _558 = _544 * _556;
            float _560 = _542 * _556;
            float _562 = _546 * _556;
            _484 = _560;
            _478 = _558;
            _488 = _562;
            _564 = true;
        }
        else
        {
            float _566 = _144 * _144;
            float _568 = fma(_142, _142, _566);
            float _570 = fma(_146, _146, _568);
            float _572 = sqrt(_570);
            bool _574 = _572 >= 9.9999999747524270787835121154785e-07;
            bool _576 = isnan(_572);
            bool _578 = _574 || _576;
            bool _580 = isnan(9.9999999747524270787835121154785e-07);
            bool _582 = _578 || _580;
            if (!_582)
            {
                float _584 = _408 * _408;
                float _586 = fma(_406, _406, _584);
                float _588 = fma(_410, _410, _586);
                float _590 = sqrt(_588);
                bool _592 = _590 >= 9.9999999747524270787835121154785e-07;
                bool _594 = isnan(_590);
                bool _596 = _592 || _594;
                bool _598 = isnan(9.9999999747524270787835121154785e-07);
                bool _600 = _596 || _598;
                if (!_600)
                {
                    float _602 = _396 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _604 = _380 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _606 = _422 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _608 = _602 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _610 = _602 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _612 = _602 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _614 = fma(_604, (*spvDescriptorSet0.vp_c8)._m0[25].x, _608);
                    float _616 = fma(_604, (*spvDescriptorSet0.vp_c8)._m0[24].x, _610);
                    float _618 = fma(_604, (*spvDescriptorSet0.vp_c8)._m0[26].x, _612);
                    float _620 = fma(_606, (*spvDescriptorSet0.vp_c8)._m0[25].z, _614);
                    float _622 = fma(_606, (*spvDescriptorSet0.vp_c8)._m0[24].z, _616);
                    float _624 = fma(_606, (*spvDescriptorSet0.vp_c8)._m0[26].z, _618);
                    float _626 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[25].w, _620);
                    float _628 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[24].w, _622);
                    float _630 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[26].w, _624);
                    float _632 = _626 * _626;
                    float _634 = fma(_628, _628, _632);
                    float _636 = fma(_630, _630, _634);
                    float _638 = rsqrt(_636);
                    float _640 = _638 * 9.9999999747524270787835121154785e-07;
                    float _642 = _628 * _640;
                    float _644 = _626 * _640;
                    float _646 = _630 * _640;
                    _484 = _644;
                    _478 = _642;
                    _488 = _646;
                    _564 = true;
                }
                else
                {
                    float _648 = _408 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _650 = _408 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _652 = _408 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _654 = _408 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                    float _656 = fma(_406, (*spvDescriptorSet0.vp_c10)._m0[14].y, _648);
                    float _658 = fma(_406, (*spvDescriptorSet0.vp_c10)._m0[14].x, _650);
                    float _660 = fma(_406, (*spvDescriptorSet0.vp_c10)._m0[14].z, _652);
                    float _662 = fma(_406, (*spvDescriptorSet0.vp_c10)._m0[14].w, _654);
                    float _664 = fma(_410, (*spvDescriptorSet0.vp_c10)._m0[16].y, _656);
                    float _666 = fma(_410, (*spvDescriptorSet0.vp_c10)._m0[16].x, _658);
                    float _668 = fma(_410, (*spvDescriptorSet0.vp_c10)._m0[16].z, _660);
                    float _670 = fma(_410, (*spvDescriptorSet0.vp_c10)._m0[16].w, _662);
                    float _672 = _396 * _664;
                    float _674 = _380 * _666;
                    float _676 = _422 * _668;
                    float _678 = _672 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _680 = _672 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _682 = _672 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _684 = fma(_674, (*spvDescriptorSet0.vp_c8)._m0[25].x, _678);
                    float _686 = fma(_674, (*spvDescriptorSet0.vp_c8)._m0[24].x, _680);
                    float _688 = fma(_674, (*spvDescriptorSet0.vp_c8)._m0[26].x, _682);
                    float _690 = fma(_676, (*spvDescriptorSet0.vp_c8)._m0[25].z, _684);
                    float _692 = fma(_676, (*spvDescriptorSet0.vp_c8)._m0[24].z, _686);
                    float _694 = fma(_676, (*spvDescriptorSet0.vp_c8)._m0[26].z, _688);
                    float _696 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[25].w, _690);
                    float _698 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[24].w, _692);
                    float _700 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[26].w, _694);
                    float _702 = _696 * _696;
                    float _704 = fma(_698, _698, _702);
                    float _706 = fma(_700, _700, _704);
                    float _708 = rsqrt(_706);
                    float _710 = _708 * 9.9999999747524270787835121154785e-07;
                    float _712 = _698 * _710;
                    float _714 = _696 * _710;
                    float _716 = _700 * _710;
                    _484 = _714;
                    _478 = _712;
                    _488 = _716;
                    _564 = true;
                }
            }
            else
            {
                float _718 = _144 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                float _720 = _144 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                float _722 = _144 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                float _724 = _144 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                float _726 = fma(_142, (*spvDescriptorSet0.vp_c10)._m0[14].y, _718);
                float _728 = fma(_142, (*spvDescriptorSet0.vp_c10)._m0[14].x, _720);
                float _730 = fma(_142, (*spvDescriptorSet0.vp_c10)._m0[14].z, _722);
                float _732 = fma(_142, (*spvDescriptorSet0.vp_c10)._m0[14].w, _724);
                float _734 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[16].y, _726);
                float _736 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[16].x, _728);
                float _738 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[16].z, _730);
                float _740 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[16].w, _732);
                float _742 = _396 * _734;
                float _744 = _380 * _736;
                float _746 = _422 * _738;
                float _748 = _742 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                float _750 = _742 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                float _752 = _742 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                float _754 = fma(_744, (*spvDescriptorSet0.vp_c8)._m0[25].x, _748);
                float _756 = fma(_744, (*spvDescriptorSet0.vp_c8)._m0[24].x, _750);
                float _758 = fma(_744, (*spvDescriptorSet0.vp_c8)._m0[26].x, _752);
                float _760 = fma(_746, (*spvDescriptorSet0.vp_c8)._m0[25].z, _754);
                float _762 = fma(_746, (*spvDescriptorSet0.vp_c8)._m0[24].z, _756);
                float _764 = fma(_746, (*spvDescriptorSet0.vp_c8)._m0[26].z, _758);
                float _766 = fma(_740, (*spvDescriptorSet0.vp_c8)._m0[25].w, _760);
                float _768 = fma(_740, (*spvDescriptorSet0.vp_c8)._m0[24].w, _762);
                float _770 = fma(_740, (*spvDescriptorSet0.vp_c8)._m0[26].w, _764);
                float _772 = _766 * _766;
                float _774 = fma(_768, _768, _772);
                float _776 = fma(_770, _770, _774);
                float _778 = rsqrt(_776);
                float _780 = _778 * 9.9999999747524270787835121154785e-07;
                float _782 = _768 * _780;
                float _784 = _766 * _780;
                float _786 = _770 * _780;
                _484 = _784;
                _478 = _782;
                _488 = _786;
            }
        }
    }
    _564 = false;
    float _788 = _484;
    float _790 = _478;
    float _792 = _488;
    bool _794 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _796 = !_794;
    float _814;
    if (!_796)
    {
        float _798 = in.m_51.x;
        float _800 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _802 = _798 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _804 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _806 = _804 * _800;
        float _808 = floor(_806);
        float _810 = -_808;
        float _812 = _806 + _810;
        _814 = _812;
        _816 = true;
    }
    else
    {
        float _818 = float(_88);
        float _820 = 1.0 / _818;
        float _822 = _122 * _820;
        _814 = _822;
    }
    _816 = false;
    float _824 = _814;
    float _826 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _828 = _824 + _826;
    float _830 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _832 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _830;
    float _834 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _836 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _838 = 1.0 / _832;
    float _840 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _842 = _824 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _844 = isnan(_824);
    bool _846 = _842 || _844;
    bool _848 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _850 = _846 || _848;
    float _852 = float(_850);
    float _854 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _856 = _834 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _858 = _836 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _860 = _840 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _862 = _824 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _864 = isnan(_824);
    bool _866 = _862 || _864;
    bool _868 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _870 = _866 || _868;
    float _872 = float(_870);
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _876 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _874;
    float _878 = -_852;
    float _880 = _878 + 1.0;
    float _882 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _884 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _882;
    float _886 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _888 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _886;
    out.m_53.x = _856;
    out.m_53.y = _858;
    out.m_53.z = _860;
    out.m_53.w = _854;
    bool _890 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _892 = _828 * _838;
    float _894 = in.m_49.x;
    float _896 = in.m_49.y;
    float _898 = in.m_49.z;
    float _900 = fma(_876, _892, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _902 = fma(_884, _892, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _904 = fma(_888, _892, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _906 = _872 * _880;
    float _908 = -_872;
    float _910 = _908 + 1.0;
    float _912 = _900 * _906;
    float _914 = _902 * _906;
    float _916 = _904 * _906;
    float _918 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[143].x, _912);
    float _920 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[143].y, _914);
    float _922 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[143].z, _916);
    float _924 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[144].x, _918);
    float _926 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[144].y, _920);
    float _928 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[144].z, _922);
    float _930 = _924 * _894;
    float _932 = _926 * _896;
    float _934 = _928 * _898;
    bool _936 = !_890;
    float _954;
    if (!_936)
    {
        float _938 = in.m_51.x;
        float _940 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _942 = _938 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _944 = fma(_942, (*spvDescriptorSet0.vp_c9)._m0[11].w, _122);
        float _946 = _944 * _940;
        float _948 = floor(_946);
        float _950 = -_948;
        float _952 = _946 + _950;
        _954 = _952;
        _956 = true;
    }
    else
    {
        float _958 = float(_88);
        float _960 = 1.0 / _958;
        float _962 = _122 * _960;
        _954 = _962;
    }
    _956 = false;
    float _964 = _954;
    float _966 = _788 * _788;
    float _968 = _458 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _970 = _458 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _972 = _458 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _974 = fma(_790, _790, _966);
    float _976 = fma(_456, (*spvDescriptorSet0.vp_c10)._m0[14].y, _968);
    float _978 = fma(_456, (*spvDescriptorSet0.vp_c10)._m0[14].x, _970);
    float _980 = fma(_456, (*spvDescriptorSet0.vp_c10)._m0[14].z, _972);
    float _982 = fma(_792, _792, _974);
    float _984 = fma(_460, (*spvDescriptorSet0.vp_c10)._m0[16].y, _976);
    float _986 = in.m_55.x;
    float _988 = in.m_55.y;
    float _990 = in.m_55.z;
    float _992 = fma(_460, (*spvDescriptorSet0.vp_c10)._m0[16].x, _978);
    float _994 = _458 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _996 = _984 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _998 = rsqrt(_982);
    float _1000 = fma(_460, (*spvDescriptorSet0.vp_c10)._m0[16].z, _980);
    float _1002 = fma(_456, (*spvDescriptorSet0.vp_c10)._m0[14].w, _994);
    float _1004 = _396 * _996;
    float _1006 = _1000 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _1008 = fma(_460, (*spvDescriptorSet0.vp_c10)._m0[16].w, _1002);
    float _1010 = _422 * _1006;
    float _1012 = _1008 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _1014 = _998 * _792;
    float _1016 = _998 * _790;
    float _1018 = _998 * _788;
    float _1020 = _932 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1022 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1024 = _1014 * _1022;
    float _1026 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1028 = _1016 * _1026;
    float _1030 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1032 = _1018 * _1030;
    float _1034 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1036 = -_1024;
    float _1038 = fma(_1016, _1034, _1036);
    float _1040 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1042 = -_1028;
    float _1044 = fma(_1018, _1040, _1042);
    float _1046 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1048 = -_1032;
    float _1050 = fma(_1014, _1046, _1048);
    float _1052 = _1038 * _1038;
    bool _1054 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1056 = isnan(0.5);
    bool _1058 = _1054 || _1056;
    bool _1060 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1062 = _1058 || _1060;
    float _1064 = fma(_1050, _1050, _1052);
    float _1066 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _986);
    float _1068 = _930 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1070 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _988);
    float _1072 = fma(_1044, _1044, _1064);
    float _1074 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _990);
    float _1076 = _934 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1078 = _1068 * _1066;
    float _1080 = _992 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _1082 = _1020 * _1070;
    float _1084 = rsqrt(_1072);
    float _1086 = _1076 * _1074;
    float _1088 = _1004 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1090 = _1004 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1092 = _380 * _1080;
    float _1094 = _1004 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1096 = _1082 * _1014;
    float _1098 = _1082 * _1016;
    float _1100 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1088);
    float _1102 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1094);
    float _1104 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1090);
    float _1106 = _1082 * _1018;
    float _1108 = fma(_1010, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1100);
    float _1110 = _1086;
    float _1112 = _1106;
    if (_1062)
    {
        _480 = 1.0;
    }
    float _1114 = _480;
    float _1116 = _1038 * _1084;
    float _1118 = _1044 * _1084;
    float _1120 = _1050 * _1084;
    float _1122 = fma(_1012, (*spvDescriptorSet0.vp_c8)._m0[24].w, _1108);
    float _1124 = _1016 * _1116;
    float _1126 = fma(_1078, _1118, _1096);
    float _1128 = fma(_1010, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1102);
    float _1130 = _1018 * _1118;
    float _1132 = -_1124;
    float _1134 = fma(_1018, _1120, _1132);
    float _1136 = fma(_1010, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1104);
    float _1138 = fma(_1012, (*spvDescriptorSet0.vp_c8)._m0[26].w, _1128);
    float _1140 = -_1130;
    float _1142 = fma(_1014, _1116, _1140);
    float _1144 = fma(_1086, _1134, _1126);
    float _1146 = fma(_1078, _1120, _1098);
    float _1148 = _1138 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _1150 = _1122 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _1152 = fma(_1012, (*spvDescriptorSet0.vp_c8)._m0[25].w, _1136);
    float _1154 = fma(_1086, _1142, _1146);
    float _1156 = _1148 + _1144;
    float _1158 = _1014 * _1120;
    float _1160 = _1152 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _1162 = _1150 + _1154;
    float _1164 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1166 = _1156 + _1164;
    float _1168 = fma(_1078, _1116, _1106);
    float _1170 = _1160 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1172 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1174 = _1162 + _1172;
    float _1176 = _1166 * _1166;
    float _1178 = -_1158;
    float _1180 = fma(_1016, _1118, _1178);
    float _1182 = fma(_1150, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1170);
    float _1184 = fma(_1174, _1174, _1176);
    float _1186 = fma(_1086, _1180, _1168);
    float _1188 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1182);
    float _1190 = _1160 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1192 = sqrt(_1184);
    float _1194 = _1160 + _1186;
    float _1196 = _1188 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1198 = fma(_1150, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1190);
    float _1200 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1198);
    float _1202 = 1.0 / _1196;
    float _1204 = _1200 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1206 = _1204 + _1196;
    bool _1208 = _1192 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1210 = _1206 * _1202;
    float _1212 = _1210 * 0.5;
    float _1214 = _1186;
    float _1216 = _1194;
    float _1218 = _1162;
    float _1220 = _1114;
    if (!_1208)
    {
        _1110 = _1162;
    }
    float _1222 = _1110;
    float _1224 = _1222;
    if (!_1208)
    {
        _1214 = _1156;
    }
    float _1226 = _1214;
    float _1228 = _1226;
    if (!_1208)
    {
        _1112 = _1194;
    }
    float _1230 = _1112;
    bool _1232 = !_1208;
    float _1234 = _1230;
    if (!_1232)
    {
        float _1236 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1238 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1240 = _1192 + _1238;
        float _1242 = rsqrt(_1184);
        float _1244 = _1240 * _1236;
        float _1246 = _1194 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1248 = _1244 * 0.15915493667125701904296875;
        float _1250 = _1248 * 6.283185482025146484375;
        float _1252 = cos(_1250);
        float _1254 = _1248 * 6.283185482025146484375;
        float _1256 = sin(_1254);
        float _1258 = _1252 + (-1.0);
        float _1260 = _1258 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1262 = fma(_1256, _1246, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1264 = fma(_1194, _1252, _1260);
        float _1266 = _1242 * _1262;
        float _1268 = fma(_1174, _1266, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1270 = fma(_1166, _1266, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1234 = _1264;
        _1224 = _1268;
        _1228 = _1270;
    }
    float _1272 = _1234;
    float _1274 = _1224;
    float _1276 = _1228;
    if (!_1062)
    {
        float _1278 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1280 = _1278 * 0.15915493667125701904296875;
        float _1282 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1284 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1286 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1284);
        float _1288 = _1280 * 6.283185482025146484375;
        float _1290 = cos(_1288);
        float _1292 = _1282 * 0.15915493667125701904296875;
        float _1294 = _1280 * 6.283185482025146484375;
        float _1296 = sin(_1294);
        float _1298 = 1.0 / _1290;
        float _1300 = _1292 * 6.283185482025146484375;
        float _1302 = cos(_1300);
        float _1304 = _1296 * _1298;
        float _1306 = _1292 * 6.283185482025146484375;
        float _1308 = sin(_1306);
        float _1310 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1312 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1310;
        float _1314 = _1302 * _1304;
        float _1316 = 1.0 / _1286;
        float _1318 = 1.0 / _1314;
        float _1320 = 1.0 / _1312;
        float _1322 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1324 = _1316 * _1322;
        float _1326 = _1308 * _1318;
        float _1328 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1330 = fma(_1326, _1324, _1328);
        float _1332 = _1330 * _1320;
        float _1334 = precise::clamp(_1332, 0.0, 1.0);
        _1216 = _1320;
        _1218 = _1316;
        _1220 = _1334;
    }
    float _1336 = _1216;
    float _1338 = _1218;
    float _1340 = _1220;
    float _1342 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1344 = _1272 + _1342;
    float _1346 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1348 = _1274 + _1346;
    float _1350 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1352 = _1276 + _1350;
    float _1354 = _1344 * _1344;
    float _1356 = fma(_1348, _1348, _1354);
    float _1358 = fma(_1352, _1352, _1356);
    float _1360 = rsqrt(_1358);
    float _1362 = sqrt(_1358);
    float _1364 = _1360 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1366 = _1348 * _1364;
    float _1368 = _1352 * _1364;
    float _1370 = _1366 * _1366;
    float _1372 = _1368 * _1368;
    float _1374 = _1370 + _1372;
    float _1376 = sqrt(_1374);
    bool _1378 = _1376 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1380 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1382 = _1376 + _1380;
    float _1384 = _1360;
    float _1386 = _1374;
    float _1388 = _1382;
    float _1390 = _1336;
    float _1392 = _1344;
    float _1394 = _1364;
    if (_1378)
    {
        float _1396 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1384 = _1396;
    }
    float _1398 = _1384;
    if (_1378)
    {
        float _1400 = rsqrt(_1374);
        _1386 = _1400;
    }
    float _1402 = _1386;
    float _1404 = _1402;
    if (_1378)
    {
        float _1406 = _1382 * _1398;
        _1388 = _1406;
    }
    float _1408 = _1388;
    if (_1378)
    {
        float _1410 = _1408 * 0.15915493667125701904296875;
        _1390 = _1410;
    }
    float _1412 = _1390;
    float _1414 = _1352;
    float _1416 = _1412;
    if (_1378)
    {
        float _1418 = _1412 * 6.283185482025146484375;
        float _1420 = sin(_1418);
        _1414 = _1420;
    }
    float _1422 = _1414;
    float _1424 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1426 = precise::max(0.0, _1424);
    float _1428 = _1338;
    float _1430 = _1426;
    float _1432 = _1424;
    if (_1378)
    {
        float _1434 = _1412 * 6.283185482025146484375;
        float _1436 = cos(_1434);
        _1428 = _1436;
    }
    float _1438 = _1428;
    float _1440 = -_1364;
    float _1442 = -_1426;
    float _1444 = fma(_1344, _1440, _1442);
    if (!_1378)
    {
        _1392 = _1368;
    }
    float _1446 = _1392;
    float _1448 = _1446;
    if (_1378)
    {
        float _1450 = _1444 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1430 = _1450;
    }
    float _1452 = _1430;
    float _1454 = _1422;
    float _1456 = _1452;
    if (_1378)
    {
        float _1458 = fma(_1422, _1452, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1454 = _1458;
    }
    float _1460 = _1454;
    float _1462 = _1460;
    if (!_1378)
    {
        _1456 = _1366;
    }
    float _1464 = _1456;
    float _1466 = _1464;
    if (_1378)
    {
        float _1468 = _1438 + (-1.0);
        _1432 = _1468;
    }
    float _1470 = _1432;
    float _1472 = _1470;
    if (_1378)
    {
        float _1474 = _1402 * _1460;
        _1394 = _1474;
    }
    float _1476 = _1394;
    if (!_1378)
    {
        _1462 = _1444;
    }
    float _1478 = _1462;
    float _1480 = _1478;
    if (_1378)
    {
        float _1482 = _1470 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1416 = _1482;
    }
    float _1484 = _1416;
    if (_1378)
    {
        float _1486 = _1366 * _1476;
        _1466 = _1486;
    }
    float _1488 = _1466;
    if (!_1378)
    {
        _1404 = _1370;
    }
    float _1490 = _1404;
    float _1492 = _1490;
    if (_1378)
    {
        float _1494 = _1368 * _1476;
        _1448 = _1494;
    }
    float _1496 = _1448;
    if (_1378)
    {
        float _1498 = fma(_1444, _1438, _1484);
        _1480 = _1498;
    }
    float _1500 = _1480;
    if (_1378)
    {
        float _1502 = _1488 * _1488;
        _1492 = _1502;
    }
    float _1504 = _1492;
    if (!_1378)
    {
        _1472 = _1372;
    }
    float _1506 = _1472;
    float _1508 = _1506;
    if (_1378)
    {
        float _1510 = _1496 * _1496;
        _1508 = _1510;
    }
    float _1512 = _1508;
    float _1514 = fma(_1500, _1500, _1504);
    float _1516 = _1272 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1518 = _1514 + _1512;
    float _1520 = _1272 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1522 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1524 = fma(_1362, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1522);
    float _1526 = precise::clamp(_1524, 0.0, 1.0);
    float _1528 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1530 = rsqrt(_1518);
    float _1532 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1520);
    float _1534 = _1272 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1536 = -_1526;
    float _1538 = _1536 + 1.0;
    float _1540 = _1272 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1542 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1532);
    float _1544 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1534);
    float _1546 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1516);
    float _1548 = abs(_1538);
    float _1550 = log2(_1548);
    float _1552 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1540);
    float _1554 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1544);
    float _1556 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1546);
    float _1558 = _1542 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1560 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1552);
    float _1562 = _1554 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1564 = _1556 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1566 = _1530 * _1488;
    float _1568 = _1530 * _1500;
    float _1570 = _1562 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1572 = _1530 * _1496;
    float _1574 = _1566 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1576 = _1558 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1578 = fma(_1564, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1570);
    float _1580 = _1560 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1582 = -_1574;
    float _1584 = fma(_1568, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1582);
    float _1586 = _1550 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1588 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1578);
    float _1590 = -_1576;
    float _1592 = fma(_1590, _1528, 1.0);
    float _1594 = -_1572;
    float _1596 = fma(_1594, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1584);
    float _1598 = _1562 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1600 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1588);
    float _1602 = exp2(_1586);
    float _1604 = fma(_1596, -0.5, 0.5);
    float _1606 = _1562 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1608 = fma(_1564, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1598);
    float _1610 = fma(_1596, 0.5, 0.5);
    float _1612 = fma(_1564, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1606);
    float _1614 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1608);
    float _1616 = log2(_1592);
    float _1618 = _1568 + 1.0;
    float _1620 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1612);
    float _1622 = fma(_1610, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1624 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1614);
    float _1626 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1620);
    float _1628 = fma(_1610, _1622, -0.212114393711090087890625);
    float _1630 = 1.0 / _1600;
    float _1632 = -_1568;
    float _1634 = fma(_1602, _1618, _1632);
    float _1636 = fma(_1610, _1628, 1.570728778839111328125);
    float _1638 = sqrt(_1604);
    float _1640 = _1616 * 0.693147182464599609375;
    float _1642 = _1640 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1644 = fma(_1634, 0.5, 0.5);
    float _1646 = _1624 * _1630;
    float _1648 = _1626 * _1630;
    float _1650 = fma(_1646, 0.5, 0.5);
    float _1652 = fma(_1648, -0.5, 0.5);
    float _1654 = _1638 * 0.636619746685028076171875;
    float _1656 = -_1636;
    float _1658 = fma(_1654, _1656, 1.0);
    float3 _4663 = float3(_1650, _1652, _1642);
    float _1660 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4663, float3(0.0), isnan(_4663)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4663, float3(0.0), isnan(_4663)), level(0.0)).x;
    float3 _4674 = float3(_1650, _1652, _1642);
    float4 _1663 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4674, float3(0.0), isnan(_4674)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4674, float3(0.0), isnan(_4674)), level(0.0)).xyzw;
    float _1665 = _1663.x;
    float _1667 = _1663.y;
    float _1669 = _1663.z;
    float _1671 = _1663.w;
    float2 _4691 = float2(_1658, _1644);
    float3 _1675 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4691, float2(0.0), isnan(_4691)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4691, float2(0.0), isnan(_4691)), level(0.0)).xyz;
    float _1677 = _1675.x;
    float _1679 = _1675.y;
    float _1681 = _1675.z;
    float _1683 = in.m_51.y;
    float _1685 = _1562 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1687 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1689 = _1687 != 0;
    float _1691 = in.m_57.x;
    int _1693 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1695 = _1693 != 0;
    float _1697 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1699 = _1697 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1701 = fma(_1564, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1685);
    float _1703 = in.m_57.y;
    float _1705 = 1.0 / _1699;
    float _1707 = in.m_59.x;
    float _1709 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1711 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1709;
    float _1713 = _1174;
    float _1715 = _1711;
    if (_1689)
    {
        float _1717 = in.m_51.x;
        _1713 = _1717;
    }
    float _1719 = _1713;
    float _1721 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1723 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1725 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1727 = _964 + _1725;
    float _1729 = in.m_59.y;
    float _1731 = _1721 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1733 = _1683 > 0.5;
    float _1735 = in.m_59.z;
    bool _1737 = _964 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1739 = isnan(_964);
    bool _1741 = _1737 || _1739;
    bool _1743 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1745 = _1741 || _1743;
    float _1747 = float(_1745);
    float _1749 = _1711 * _1705;
    float _1751 = 0.0;
    if (_1689)
    {
        _1751 = _1691;
    }
    float _1753 = _1751;
    float _1755 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1757 = _964 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1759 = isnan(_964);
    bool _1761 = _1757 || _1759;
    bool _1763 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1765 = _1761 || _1763;
    float _1767 = float(_1765);
    float _1769 = fma(_1749, _1727, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1771 = _1753;
    if (!_1689)
    {
        _1715 = _1691;
    }
    float _1773 = _1715;
    float _1775 = -_1703;
    float _1777 = _1775 + 1.0;
    float _1779 = in.m_59.w;
    float _1781 = _1703;
    float _1783 = _1773;
    if (_1695)
    {
        float _1785 = _1733 ? _1777 : _1703;
        _1781 = _1785;
    }
    float _1787 = _1781;
    out.m_61.x = _1707;
    bool _1789 = _1719 > 0.5;
    bool _1791 = _1789 && _1689;
    float _1793 = -_1747;
    float _1795 = _1793 + 1.0;
    bool _1797 = _1340 > 0.0;
    bool _1799 = isnan(_1340);
    bool _1801 = _1797 || _1799;
    bool _1803 = isnan(0.0);
    bool _1805 = _1801 || _1803;
    out.m_61.y = _1729;
    float _1807 = _1767 * _1795;
    float _1809 = -_1767;
    float _1811 = _1809 + 1.0;
    float _1813 = _1769 * _1807;
    float _1815 = _1787 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    out.m_61.z = _1735;
    if (_1791)
    {
        float _1817 = -_1753;
        float _1819 = _1817 + 1.0;
        _1771 = _1819;
    }
    float _1821 = _1771;
    float _1823 = fma(_1811, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1813);
    float _1825 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1701);
    float _1827 = _1815 * _1755;
    out.m_61.w = _1779;
    if (_1689)
    {
        _1783 = _1821;
    }
    float _1829 = _1783;
    float _1831 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1833 = _1829 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1835 = _1831 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1837 = _1833 * _1723;
    float _1839 = fma(_1747, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1823);
    float _1841 = _1550 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_63.x = _1837;
    out.m_63.y = _1827;
    float _1843 = exp2(_1841);
    float _1845 = _1839 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1847 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1849 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1825);
    float _1851 = _1847 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1853 = _1849 + _1600;
    out.gl_Position.x = _1624;
    out.gl_Position.y = _1626;
    out.gl_Position.z = _1849;
    out.gl_Position.w = _1600;
    float _1855 = _1600 * 0.5;
    float _1857 = _1340 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1859 = _1624 + _1600;
    float _1861 = _1853 * 0.5;
    float _1863 = fma(_1626, -0.5, _1855);
    float _1865 = _1857 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1867 = _1859 * 0.5;
    float _1869 = -_1843;
    float _1871 = _1869 + 1.0;
    out.m_65.x = _1851;
    out.m_65.y = _1731;
    out.m_65.z = _1835;
    out.m_65.w = _1845;
    float _1873 = _1871 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_67.x = _1867;
    out.m_67.y = _1863;
    out.m_67.z = _1861;
    out.m_67.w = _1600;
    float _1875 = -_1873;
    float _1877 = _1875 + 1.0;
    out.m_45.x = _1865;
    float _1879 = _1873 * _1660;
    float _1881 = _1671 * _1877;
    float _1883 = _1671 * _1879;
    float _1885 = _1681 * _1879;
    float _1887 = fma(_1677, _1883, _1665);
    float _1889 = fma(_1679, _1883, _1667);
    float _1891 = fma(_1671, _1885, _1669);
    out.m_69.x = _1887;
    out.m_69.y = _1889;
    out.m_69.z = _1891;
    out.m_69.w = _1881;
    if (_1805)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1893 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1893;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _956 = false;
    bool _816 = false;
    bool _564 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _1950 = as_type<float>(_104);
        out.gl_Position.z = _1950;
    }
    if (!_92)
    {
        return out;
    }
    float _108 = in.m_47.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_118)
    {
        float _124 = float(_88);
        _98 = _124;
    }
    float _126 = _98;
    bool _128 = _122 >= _126;
    bool _130 = !_118;
    bool _132 = _128 || _130;
    float _134 = _126;
    if (_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _134;
    if (_132)
    {
        out.m_45.x = 0.0;
    }
    if (_132)
    {
        float _138 = _136 * 5.0;
        _106 = as_type<int>(_138);
    }
    int _140 = _106;
    if (_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2019 = as_type<float>(_140);
        out.gl_Position.z = _2019;
    }
    if (_132)
    {
        return out;
    }
    float _142 = in.m_47.x;
    float _144 = in.m_47.y;
    float _146 = in.m_47.z;
    float _148 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _150 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _152 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    float _160 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _162 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _160);
    float _164 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _166 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _164);
    float _168 = _164;
    float _170 = (*spvDescriptorSet0.vp_c10)._m0[19].z;
    float _172 = _148;
    if (!_158)
    {
        float _174 = _148 * _148;
        float _176 = _174 * 0.5;
        _168 = _176;
    }
    float _178 = _168;
    float _180 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _162);
    float _182 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _166);
    float _184 = _178;
    if (!_158)
    {
        float _186 = _178 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _184 = _186;
    }
    float _188 = _184;
    bool _190 = !_158;
    float _192 = _188;
    if (!_190)
    {
        float _194 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _196 = log2(_194);
        float _198 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _200 = _198 + 1.0;
        float _202 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = _148 * _196;
        float _206 = exp2(_204);
        float _208 = _202 * 0.693147182464599609375;
        float _210 = 1.0 / _208;
        float _212 = 1.0 / _200;
        float _214 = _206 + (-1.0);
        float _216 = -_214;
        float _218 = fma(_216, _210, _148);
        float _220 = _218 * _212;
        float _222 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _192 = _222;
        _170 = _206;
    }
    float _224 = _192;
    float _226 = _170;
    bool _228 = !_158;
    float _230 = _226;
    if (!_228)
    {
        float _232 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _234 = log2(_232);
        float _236 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _238 = _236 + 1.0;
        float _240 = 1.0 / _238;
        float _242 = _148 * _234;
        float _244 = exp2(_242);
        float _246 = -_244;
        float _248 = _246 + 1.0;
        float _250 = _248 * _240;
        _172 = _250;
        _230 = _240;
    }
    float _252 = _172;
    float _254 = _230;
    float _256 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _258 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _260 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _262 = _254;
    float _264 = _256;
    float _266 = _260;
    if (!_158)
    {
        float _268 = _122 * _122;
        float _270 = _268 * 0.5;
        _262 = _270;
    }
    float _272 = _262;
    float _274 = fma(_252, _142, _256);
    float _276 = fma(_252, _144, _258);
    float _278 = fma(_252, _146, _260);
    if (!_158)
    {
        float _280 = _272 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _264 = _280;
    }
    float _282 = _264;
    bool _284 = !_158;
    float _286 = _282;
    if (!_284)
    {
        float _288 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _290 = log2(_288);
        float _292 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _294 = _292 + 1.0;
        float _296 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _298 = _122 * _290;
        float _300 = 1.0 / _294;
        float _302 = _296 * 0.693147182464599609375;
        float _304 = exp2(_298);
        float _306 = 1.0 / _302;
        float _308 = _304 + (-1.0);
        float _310 = -_308;
        float _312 = fma(_310, _306, _122);
        float _314 = _312 * _300;
        float _316 = _314 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _286 = _316;
        _266 = _304;
    }
    float _318 = _286;
    float _320 = _266;
    float _322 = _318 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _324 = _320;
    if (!_158)
    {
        _324 = _122;
    }
    float _326 = _324;
    bool _328 = !_158;
    float _330 = _326;
    if (!_328)
    {
        float _332 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _334 = log2(_332);
        float _336 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _338 = _336 + 1.0;
        float _340 = 1.0 / _338;
        float _342 = _122 * _334;
        float _344 = exp2(_342);
        float _346 = -_344;
        float _348 = _346 + 1.0;
        float _350 = _348 * _340;
        _330 = _350;
    }
    float _352 = _330;
    float _354 = _318 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _356 = fma(_352, _144, _322);
    float _358 = _318 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _360 = fma(_352, _142, _354);
    float _362 = -_356;
    float _364 = _276 + _362;
    float _366 = fma(_352, _146, _358);
    float _368 = -_360;
    float _370 = _274 + _368;
    float _372 = _364 * _364;
    float _374 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _376 = -_366;
    float _378 = _278 + _376;
    float _380 = sqrt(_180);
    float _382 = fma(_370, _370, _372);
    float _384 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _374);
    float _386 = _364 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _388 = _364 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _390 = fma(_378, _378, _382);
    float _392 = in.m_49.w;
    float _394 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[14].y, _386);
    float _396 = sqrt(_182);
    float _398 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[14].z, _388);
    float _400 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _384);
    float _402 = _364 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _404 = sqrt(_390);
    float _406 = in.m_42.x;
    float _408 = in.m_42.y;
    float _410 = in.m_42.z;
    float _412 = _364 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _414 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[14].x, _402);
    float _416 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[16].z, _398);
    float _418 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[14].w, _412);
    float _420 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[16].x, _414);
    float _422 = sqrt(_400);
    float _424 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[16].y, _394);
    float _426 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[16].w, _418);
    float _428 = _380 * _420;
    float _430 = _396 * _424;
    bool _432 = _404 >= 9.9999999747524270787835121154785e-07;
    bool _434 = isnan(_404);
    bool _436 = _432 || _434;
    bool _438 = isnan(9.9999999747524270787835121154785e-07);
    bool _440 = _436 || _438;
    float _442 = _430 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _444 = _430 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _446 = _430 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _448 = fma(_428, (*spvDescriptorSet0.vp_c8)._m0[24].x, _442);
    float _450 = fma(_428, (*spvDescriptorSet0.vp_c8)._m0[25].x, _444);
    float _452 = fma(_428, (*spvDescriptorSet0.vp_c8)._m0[26].x, _446);
    float _454 = _422 * _416;
    float _456 = fma(_274, _392, _406);
    float _458 = fma(_276, _392, _408);
    float _460 = fma(_278, _392, _410);
    float _462 = fma(_454, (*spvDescriptorSet0.vp_c8)._m0[25].z, _450);
    float _464 = fma(_454, (*spvDescriptorSet0.vp_c8)._m0[26].z, _452);
    float _466 = fma(_454, (*spvDescriptorSet0.vp_c8)._m0[24].z, _448);
    float _468 = fma(_426, (*spvDescriptorSet0.vp_c8)._m0[25].w, _462);
    float _470 = fma(_426, (*spvDescriptorSet0.vp_c8)._m0[26].w, _464);
    float _472 = fma(_426, (*spvDescriptorSet0.vp_c8)._m0[24].w, _466);
    float _474 = _426;
    float _476 = _468;
    float _478 = _472;
    float _480 = _422;
    if (_440)
    {
        _474 = _468;
    }
    float _482 = _474;
    float _484 = _482;
    if (_440)
    {
        _476 = _470;
    }
    float _486 = _476;
    float _488 = _486;
    if (!_440)
    {
        bool _490 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _492 = !_490;
        if (!_492)
        {
            float _494 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].y;
            float _496 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].x;
            float _498 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].z;
            float _500 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].y, _494);
            float _502 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].x, _496);
            float _504 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].z, _498);
            float _506 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].y, _500);
            float _508 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].x, _502);
            float _510 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].w;
            float _512 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].z, _504);
            float _514 = _396 * _506;
            float _516 = _380 * _508;
            float _518 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].w, _510);
            float _520 = _422 * _512;
            float _522 = _514 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
            float _524 = _514 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
            float _526 = _514 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
            float _528 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].w, _518);
            float _530 = fma(_516, (*spvDescriptorSet0.vp_c8)._m0[25].x, _522);
            float _532 = fma(_516, (*spvDescriptorSet0.vp_c8)._m0[24].x, _524);
            float _534 = fma(_516, (*spvDescriptorSet0.vp_c8)._m0[26].x, _526);
            float _536 = fma(_520, (*spvDescriptorSet0.vp_c8)._m0[25].z, _530);
            float _538 = fma(_520, (*spvDescriptorSet0.vp_c8)._m0[24].z, _532);
            float _540 = fma(_520, (*spvDescriptorSet0.vp_c8)._m0[26].z, _534);
            float _542 = fma(_528, (*spvDescriptorSet0.vp_c8)._m0[25].w, _536);
            float _544 = fma(_528, (*spvDescriptorSet0.vp_c8)._m0[24].w, _538);
            float _546 = fma(_528, (*spvDescriptorSet0.vp_c8)._m0[26].w, _540);
            float _548 = _542 * _542;
            float _550 = fma(_544, _544, _548);
            float _552 = fma(_546, _546, _550);
            float _554 = rsqrt(_552);
            float _556 = _554 * 9.9999999747524270787835121154785e-07;
            float _558 = _544 * _556;
            float _560 = _542 * _556;
            float _562 = _546 * _556;
            _484 = _560;
            _478 = _558;
            _488 = _562;
            _564 = true;
        }
        else
        {
            float _566 = _144 * _144;
            float _568 = fma(_142, _142, _566);
            float _570 = fma(_146, _146, _568);
            float _572 = sqrt(_570);
            bool _574 = _572 >= 9.9999999747524270787835121154785e-07;
            bool _576 = isnan(_572);
            bool _578 = _574 || _576;
            bool _580 = isnan(9.9999999747524270787835121154785e-07);
            bool _582 = _578 || _580;
            if (!_582)
            {
                float _584 = _408 * _408;
                float _586 = fma(_406, _406, _584);
                float _588 = fma(_410, _410, _586);
                float _590 = sqrt(_588);
                bool _592 = _590 >= 9.9999999747524270787835121154785e-07;
                bool _594 = isnan(_590);
                bool _596 = _592 || _594;
                bool _598 = isnan(9.9999999747524270787835121154785e-07);
                bool _600 = _596 || _598;
                if (!_600)
                {
                    float _602 = _396 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _604 = _380 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _606 = _422 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _608 = _602 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _610 = _602 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _612 = _602 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _614 = fma(_604, (*spvDescriptorSet0.vp_c8)._m0[25].x, _608);
                    float _616 = fma(_604, (*spvDescriptorSet0.vp_c8)._m0[24].x, _610);
                    float _618 = fma(_604, (*spvDescriptorSet0.vp_c8)._m0[26].x, _612);
                    float _620 = fma(_606, (*spvDescriptorSet0.vp_c8)._m0[25].z, _614);
                    float _622 = fma(_606, (*spvDescriptorSet0.vp_c8)._m0[24].z, _616);
                    float _624 = fma(_606, (*spvDescriptorSet0.vp_c8)._m0[26].z, _618);
                    float _626 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[25].w, _620);
                    float _628 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[24].w, _622);
                    float _630 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[26].w, _624);
                    float _632 = _626 * _626;
                    float _634 = fma(_628, _628, _632);
                    float _636 = fma(_630, _630, _634);
                    float _638 = rsqrt(_636);
                    float _640 = _638 * 9.9999999747524270787835121154785e-07;
                    float _642 = _628 * _640;
                    float _644 = _626 * _640;
                    float _646 = _630 * _640;
                    _484 = _644;
                    _478 = _642;
                    _488 = _646;
                    _564 = true;
                }
                else
                {
                    float _648 = _408 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _650 = _408 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _652 = _408 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _654 = _408 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                    float _656 = fma(_406, (*spvDescriptorSet0.vp_c10)._m0[14].y, _648);
                    float _658 = fma(_406, (*spvDescriptorSet0.vp_c10)._m0[14].x, _650);
                    float _660 = fma(_406, (*spvDescriptorSet0.vp_c10)._m0[14].z, _652);
                    float _662 = fma(_406, (*spvDescriptorSet0.vp_c10)._m0[14].w, _654);
                    float _664 = fma(_410, (*spvDescriptorSet0.vp_c10)._m0[16].y, _656);
                    float _666 = fma(_410, (*spvDescriptorSet0.vp_c10)._m0[16].x, _658);
                    float _668 = fma(_410, (*spvDescriptorSet0.vp_c10)._m0[16].z, _660);
                    float _670 = fma(_410, (*spvDescriptorSet0.vp_c10)._m0[16].w, _662);
                    float _672 = _396 * _664;
                    float _674 = _380 * _666;
                    float _676 = _422 * _668;
                    float _678 = _672 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _680 = _672 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _682 = _672 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _684 = fma(_674, (*spvDescriptorSet0.vp_c8)._m0[25].x, _678);
                    float _686 = fma(_674, (*spvDescriptorSet0.vp_c8)._m0[24].x, _680);
                    float _688 = fma(_674, (*spvDescriptorSet0.vp_c8)._m0[26].x, _682);
                    float _690 = fma(_676, (*spvDescriptorSet0.vp_c8)._m0[25].z, _684);
                    float _692 = fma(_676, (*spvDescriptorSet0.vp_c8)._m0[24].z, _686);
                    float _694 = fma(_676, (*spvDescriptorSet0.vp_c8)._m0[26].z, _688);
                    float _696 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[25].w, _690);
                    float _698 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[24].w, _692);
                    float _700 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[26].w, _694);
                    float _702 = _696 * _696;
                    float _704 = fma(_698, _698, _702);
                    float _706 = fma(_700, _700, _704);
                    float _708 = rsqrt(_706);
                    float _710 = _708 * 9.9999999747524270787835121154785e-07;
                    float _712 = _698 * _710;
                    float _714 = _696 * _710;
                    float _716 = _700 * _710;
                    _484 = _714;
                    _478 = _712;
                    _488 = _716;
                    _564 = true;
                }
            }
            else
            {
                float _718 = _144 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                float _720 = _144 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                float _722 = _144 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                float _724 = _144 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                float _726 = fma(_142, (*spvDescriptorSet0.vp_c10)._m0[14].y, _718);
                float _728 = fma(_142, (*spvDescriptorSet0.vp_c10)._m0[14].x, _720);
                float _730 = fma(_142, (*spvDescriptorSet0.vp_c10)._m0[14].z, _722);
                float _732 = fma(_142, (*spvDescriptorSet0.vp_c10)._m0[14].w, _724);
                float _734 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[16].y, _726);
                float _736 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[16].x, _728);
                float _738 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[16].z, _730);
                float _740 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[16].w, _732);
                float _742 = _396 * _734;
                float _744 = _380 * _736;
                float _746 = _422 * _738;
                float _748 = _742 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                float _750 = _742 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                float _752 = _742 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                float _754 = fma(_744, (*spvDescriptorSet0.vp_c8)._m0[25].x, _748);
                float _756 = fma(_744, (*spvDescriptorSet0.vp_c8)._m0[24].x, _750);
                float _758 = fma(_744, (*spvDescriptorSet0.vp_c8)._m0[26].x, _752);
                float _760 = fma(_746, (*spvDescriptorSet0.vp_c8)._m0[25].z, _754);
                float _762 = fma(_746, (*spvDescriptorSet0.vp_c8)._m0[24].z, _756);
                float _764 = fma(_746, (*spvDescriptorSet0.vp_c8)._m0[26].z, _758);
                float _766 = fma(_740, (*spvDescriptorSet0.vp_c8)._m0[25].w, _760);
                float _768 = fma(_740, (*spvDescriptorSet0.vp_c8)._m0[24].w, _762);
                float _770 = fma(_740, (*spvDescriptorSet0.vp_c8)._m0[26].w, _764);
                float _772 = _766 * _766;
                float _774 = fma(_768, _768, _772);
                float _776 = fma(_770, _770, _774);
                float _778 = rsqrt(_776);
                float _780 = _778 * 9.9999999747524270787835121154785e-07;
                float _782 = _768 * _780;
                float _784 = _766 * _780;
                float _786 = _770 * _780;
                _484 = _784;
                _478 = _782;
                _488 = _786;
            }
        }
    }
    _564 = false;
    float _788 = _484;
    float _790 = _478;
    float _792 = _488;
    bool _794 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _796 = !_794;
    float _814;
    if (!_796)
    {
        float _798 = in.m_51.x;
        float _800 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _802 = _798 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _804 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _806 = _804 * _800;
        float _808 = floor(_806);
        float _810 = -_808;
        float _812 = _806 + _810;
        _814 = _812;
        _816 = true;
    }
    else
    {
        float _818 = float(_88);
        float _820 = 1.0 / _818;
        float _822 = _122 * _820;
        _814 = _822;
    }
    _816 = false;
    float _824 = _814;
    float _826 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _828 = _824 + _826;
    float _830 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _832 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _830;
    float _834 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _836 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _838 = 1.0 / _832;
    float _840 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _842 = _824 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _844 = isnan(_824);
    bool _846 = _842 || _844;
    bool _848 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _850 = _846 || _848;
    float _852 = float(_850);
    float _854 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _856 = _834 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _858 = _836 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _860 = _840 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _862 = _824 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _864 = isnan(_824);
    bool _866 = _862 || _864;
    bool _868 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _870 = _866 || _868;
    float _872 = float(_870);
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _876 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _874;
    float _878 = -_852;
    float _880 = _878 + 1.0;
    float _882 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _884 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _882;
    float _886 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _888 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _886;
    out.m_53.x = _856;
    out.m_53.y = _858;
    out.m_53.z = _860;
    out.m_53.w = _854;
    bool _890 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _892 = _828 * _838;
    float _894 = in.m_49.x;
    float _896 = in.m_49.y;
    float _898 = in.m_49.z;
    float _900 = fma(_876, _892, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _902 = fma(_884, _892, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _904 = fma(_888, _892, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _906 = _872 * _880;
    float _908 = -_872;
    float _910 = _908 + 1.0;
    float _912 = _900 * _906;
    float _914 = _902 * _906;
    float _916 = _904 * _906;
    float _918 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[143].x, _912);
    float _920 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[143].y, _914);
    float _922 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[143].z, _916);
    float _924 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[144].x, _918);
    float _926 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[144].y, _920);
    float _928 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[144].z, _922);
    float _930 = _924 * _894;
    float _932 = _926 * _896;
    float _934 = _928 * _898;
    bool _936 = !_890;
    float _954;
    if (!_936)
    {
        float _938 = in.m_51.x;
        float _940 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _942 = _938 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _944 = fma(_942, (*spvDescriptorSet0.vp_c9)._m0[11].w, _122);
        float _946 = _944 * _940;
        float _948 = floor(_946);
        float _950 = -_948;
        float _952 = _946 + _950;
        _954 = _952;
        _956 = true;
    }
    else
    {
        float _958 = float(_88);
        float _960 = 1.0 / _958;
        float _962 = _122 * _960;
        _954 = _962;
    }
    _956 = false;
    float _964 = _954;
    float _966 = _788 * _788;
    float _968 = _458 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _970 = _458 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _972 = _458 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _974 = fma(_790, _790, _966);
    float _976 = fma(_456, (*spvDescriptorSet0.vp_c10)._m0[14].y, _968);
    float _978 = fma(_456, (*spvDescriptorSet0.vp_c10)._m0[14].x, _970);
    float _980 = fma(_456, (*spvDescriptorSet0.vp_c10)._m0[14].z, _972);
    float _982 = fma(_792, _792, _974);
    float _984 = fma(_460, (*spvDescriptorSet0.vp_c10)._m0[16].y, _976);
    float _986 = in.m_55.x;
    float _988 = in.m_55.y;
    float _990 = in.m_55.z;
    float _992 = fma(_460, (*spvDescriptorSet0.vp_c10)._m0[16].x, _978);
    float _994 = _458 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _996 = _984 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _998 = rsqrt(_982);
    float _1000 = fma(_460, (*spvDescriptorSet0.vp_c10)._m0[16].z, _980);
    float _1002 = fma(_456, (*spvDescriptorSet0.vp_c10)._m0[14].w, _994);
    float _1004 = _396 * _996;
    float _1006 = _1000 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _1008 = fma(_460, (*spvDescriptorSet0.vp_c10)._m0[16].w, _1002);
    float _1010 = _422 * _1006;
    float _1012 = _1008 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _1014 = _998 * _792;
    float _1016 = _998 * _790;
    float _1018 = _998 * _788;
    float _1020 = _932 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1022 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1024 = _1014 * _1022;
    float _1026 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1028 = _1016 * _1026;
    float _1030 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1032 = _1018 * _1030;
    float _1034 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1036 = -_1024;
    float _1038 = fma(_1016, _1034, _1036);
    float _1040 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1042 = -_1028;
    float _1044 = fma(_1018, _1040, _1042);
    float _1046 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1048 = -_1032;
    float _1050 = fma(_1014, _1046, _1048);
    float _1052 = _1038 * _1038;
    bool _1054 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1056 = isnan(0.5);
    bool _1058 = _1054 || _1056;
    bool _1060 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1062 = _1058 || _1060;
    float _1064 = fma(_1050, _1050, _1052);
    float _1066 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _986);
    float _1068 = _930 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1070 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _988);
    float _1072 = fma(_1044, _1044, _1064);
    float _1074 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _990);
    float _1076 = _934 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1078 = _1068 * _1066;
    float _1080 = _992 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _1082 = _1020 * _1070;
    float _1084 = rsqrt(_1072);
    float _1086 = _1076 * _1074;
    float _1088 = _1004 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1090 = _1004 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1092 = _380 * _1080;
    float _1094 = _1004 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1096 = _1082 * _1014;
    float _1098 = _1082 * _1016;
    float _1100 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1088);
    float _1102 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1094);
    float _1104 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1090);
    float _1106 = _1082 * _1018;
    float _1108 = fma(_1010, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1100);
    float _1110 = _1086;
    float _1112 = _1106;
    if (_1062)
    {
        _480 = 1.0;
    }
    float _1114 = _480;
    float _1116 = _1038 * _1084;
    float _1118 = _1044 * _1084;
    float _1120 = _1050 * _1084;
    float _1122 = fma(_1012, (*spvDescriptorSet0.vp_c8)._m0[24].w, _1108);
    float _1124 = _1016 * _1116;
    float _1126 = fma(_1078, _1118, _1096);
    float _1128 = fma(_1010, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1102);
    float _1130 = _1018 * _1118;
    float _1132 = -_1124;
    float _1134 = fma(_1018, _1120, _1132);
    float _1136 = fma(_1010, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1104);
    float _1138 = fma(_1012, (*spvDescriptorSet0.vp_c8)._m0[26].w, _1128);
    float _1140 = -_1130;
    float _1142 = fma(_1014, _1116, _1140);
    float _1144 = fma(_1086, _1134, _1126);
    float _1146 = fma(_1078, _1120, _1098);
    float _1148 = _1138 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _1150 = _1122 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _1152 = fma(_1012, (*spvDescriptorSet0.vp_c8)._m0[25].w, _1136);
    float _1154 = fma(_1086, _1142, _1146);
    float _1156 = _1148 + _1144;
    float _1158 = _1014 * _1120;
    float _1160 = _1152 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _1162 = _1150 + _1154;
    float _1164 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1166 = _1156 + _1164;
    float _1168 = fma(_1078, _1116, _1106);
    float _1170 = _1160 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1172 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1174 = _1162 + _1172;
    float _1176 = _1166 * _1166;
    float _1178 = -_1158;
    float _1180 = fma(_1016, _1118, _1178);
    float _1182 = fma(_1150, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1170);
    float _1184 = fma(_1174, _1174, _1176);
    float _1186 = fma(_1086, _1180, _1168);
    float _1188 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1182);
    float _1190 = _1160 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1192 = sqrt(_1184);
    float _1194 = _1160 + _1186;
    float _1196 = _1188 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1198 = fma(_1150, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1190);
    float _1200 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1198);
    float _1202 = 1.0 / _1196;
    float _1204 = _1200 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1206 = _1204 + _1196;
    bool _1208 = _1192 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1210 = _1206 * _1202;
    float _1212 = _1210 * 0.5;
    float _1214 = _1186;
    float _1216 = _1194;
    float _1218 = _1162;
    float _1220 = _1114;
    if (!_1208)
    {
        _1110 = _1162;
    }
    float _1222 = _1110;
    float _1224 = _1222;
    if (!_1208)
    {
        _1214 = _1156;
    }
    float _1226 = _1214;
    float _1228 = _1226;
    if (!_1208)
    {
        _1112 = _1194;
    }
    float _1230 = _1112;
    bool _1232 = !_1208;
    float _1234 = _1230;
    if (!_1232)
    {
        float _1236 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1238 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1240 = _1192 + _1238;
        float _1242 = rsqrt(_1184);
        float _1244 = _1240 * _1236;
        float _1246 = _1194 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1248 = _1244 * 0.15915493667125701904296875;
        float _1250 = _1248 * 6.283185482025146484375;
        float _1252 = cos(_1250);
        float _1254 = _1248 * 6.283185482025146484375;
        float _1256 = sin(_1254);
        float _1258 = _1252 + (-1.0);
        float _1260 = _1258 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1262 = fma(_1256, _1246, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1264 = fma(_1194, _1252, _1260);
        float _1266 = _1242 * _1262;
        float _1268 = fma(_1174, _1266, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1270 = fma(_1166, _1266, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1234 = _1264;
        _1224 = _1268;
        _1228 = _1270;
    }
    float _1272 = _1234;
    float _1274 = _1224;
    float _1276 = _1228;
    if (!_1062)
    {
        float _1278 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1280 = _1278 * 0.15915493667125701904296875;
        float _1282 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1284 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1286 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1284);
        float _1288 = _1280 * 6.283185482025146484375;
        float _1290 = cos(_1288);
        float _1292 = _1282 * 0.15915493667125701904296875;
        float _1294 = _1280 * 6.283185482025146484375;
        float _1296 = sin(_1294);
        float _1298 = 1.0 / _1290;
        float _1300 = _1292 * 6.283185482025146484375;
        float _1302 = cos(_1300);
        float _1304 = _1296 * _1298;
        float _1306 = _1292 * 6.283185482025146484375;
        float _1308 = sin(_1306);
        float _1310 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1312 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1310;
        float _1314 = _1302 * _1304;
        float _1316 = 1.0 / _1286;
        float _1318 = 1.0 / _1314;
        float _1320 = 1.0 / _1312;
        float _1322 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1324 = _1316 * _1322;
        float _1326 = _1308 * _1318;
        float _1328 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1330 = fma(_1326, _1324, _1328);
        float _1332 = _1330 * _1320;
        float _1334 = precise::clamp(_1332, 0.0, 1.0);
        _1216 = _1320;
        _1218 = _1316;
        _1220 = _1334;
    }
    float _1336 = _1216;
    float _1338 = _1218;
    float _1340 = _1220;
    float _1342 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1344 = _1272 + _1342;
    float _1346 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1348 = _1274 + _1346;
    float _1350 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1352 = _1276 + _1350;
    float _1354 = _1344 * _1344;
    float _1356 = fma(_1348, _1348, _1354);
    float _1358 = fma(_1352, _1352, _1356);
    float _1360 = rsqrt(_1358);
    float _1362 = sqrt(_1358);
    float _1364 = _1360 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1366 = _1348 * _1364;
    float _1368 = _1352 * _1364;
    float _1370 = _1366 * _1366;
    float _1372 = _1368 * _1368;
    float _1374 = _1370 + _1372;
    float _1376 = sqrt(_1374);
    bool _1378 = _1376 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1380 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1382 = _1376 + _1380;
    float _1384 = _1360;
    float _1386 = _1374;
    float _1388 = _1382;
    float _1390 = _1336;
    float _1392 = _1344;
    float _1394 = _1364;
    if (_1378)
    {
        float _1396 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1384 = _1396;
    }
    float _1398 = _1384;
    if (_1378)
    {
        float _1400 = rsqrt(_1374);
        _1386 = _1400;
    }
    float _1402 = _1386;
    float _1404 = _1402;
    if (_1378)
    {
        float _1406 = _1382 * _1398;
        _1388 = _1406;
    }
    float _1408 = _1388;
    if (_1378)
    {
        float _1410 = _1408 * 0.15915493667125701904296875;
        _1390 = _1410;
    }
    float _1412 = _1390;
    float _1414 = _1352;
    float _1416 = _1412;
    if (_1378)
    {
        float _1418 = _1412 * 6.283185482025146484375;
        float _1420 = sin(_1418);
        _1414 = _1420;
    }
    float _1422 = _1414;
    float _1424 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1426 = precise::max(0.0, _1424);
    float _1428 = _1338;
    float _1430 = _1426;
    float _1432 = _1424;
    if (_1378)
    {
        float _1434 = _1412 * 6.283185482025146484375;
        float _1436 = cos(_1434);
        _1428 = _1436;
    }
    float _1438 = _1428;
    float _1440 = -_1364;
    float _1442 = -_1426;
    float _1444 = fma(_1344, _1440, _1442);
    if (!_1378)
    {
        _1392 = _1368;
    }
    float _1446 = _1392;
    float _1448 = _1446;
    if (_1378)
    {
        float _1450 = _1444 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1430 = _1450;
    }
    float _1452 = _1430;
    float _1454 = _1422;
    float _1456 = _1452;
    if (_1378)
    {
        float _1458 = fma(_1422, _1452, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1454 = _1458;
    }
    float _1460 = _1454;
    float _1462 = _1460;
    if (!_1378)
    {
        _1456 = _1366;
    }
    float _1464 = _1456;
    float _1466 = _1464;
    if (_1378)
    {
        float _1468 = _1438 + (-1.0);
        _1432 = _1468;
    }
    float _1470 = _1432;
    float _1472 = _1470;
    if (_1378)
    {
        float _1474 = _1402 * _1460;
        _1394 = _1474;
    }
    float _1476 = _1394;
    if (!_1378)
    {
        _1462 = _1444;
    }
    float _1478 = _1462;
    float _1480 = _1478;
    if (_1378)
    {
        float _1482 = _1470 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1416 = _1482;
    }
    float _1484 = _1416;
    if (_1378)
    {
        float _1486 = _1366 * _1476;
        _1466 = _1486;
    }
    float _1488 = _1466;
    if (!_1378)
    {
        _1404 = _1370;
    }
    float _1490 = _1404;
    float _1492 = _1490;
    if (_1378)
    {
        float _1494 = _1368 * _1476;
        _1448 = _1494;
    }
    float _1496 = _1448;
    if (_1378)
    {
        float _1498 = fma(_1444, _1438, _1484);
        _1480 = _1498;
    }
    float _1500 = _1480;
    if (_1378)
    {
        float _1502 = _1488 * _1488;
        _1492 = _1502;
    }
    float _1504 = _1492;
    if (!_1378)
    {
        _1472 = _1372;
    }
    float _1506 = _1472;
    float _1508 = _1506;
    if (_1378)
    {
        float _1510 = _1496 * _1496;
        _1508 = _1510;
    }
    float _1512 = _1508;
    float _1514 = fma(_1500, _1500, _1504);
    float _1516 = _1272 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1518 = _1514 + _1512;
    float _1520 = _1272 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1522 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1524 = fma(_1362, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1522);
    float _1526 = precise::clamp(_1524, 0.0, 1.0);
    float _1528 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1530 = rsqrt(_1518);
    float _1532 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1520);
    float _1534 = _1272 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1536 = -_1526;
    float _1538 = _1536 + 1.0;
    float _1540 = _1272 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1542 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1532);
    float _1544 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1534);
    float _1546 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1516);
    float _1548 = abs(_1538);
    float _1550 = log2(_1548);
    float _1552 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1540);
    float _1554 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1544);
    float _1556 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1546);
    float _1558 = _1542 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1560 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1552);
    float _1562 = _1554 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1564 = _1556 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1566 = _1530 * _1488;
    float _1568 = _1530 * _1500;
    float _1570 = _1562 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1572 = _1530 * _1496;
    float _1574 = _1566 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1576 = _1558 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1578 = fma(_1564, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1570);
    float _1580 = _1560 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1582 = -_1574;
    float _1584 = fma(_1568, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1582);
    float _1586 = _1550 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1588 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1578);
    float _1590 = -_1576;
    float _1592 = fma(_1590, _1528, 1.0);
    float _1594 = -_1572;
    float _1596 = fma(_1594, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1584);
    float _1598 = _1562 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1600 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1588);
    float _1602 = exp2(_1586);
    float _1604 = fma(_1596, -0.5, 0.5);
    float _1606 = _1562 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1608 = fma(_1564, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1598);
    float _1610 = fma(_1596, 0.5, 0.5);
    float _1612 = fma(_1564, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1606);
    float _1614 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1608);
    float _1616 = log2(_1592);
    float _1618 = _1568 + 1.0;
    float _1620 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1612);
    float _1622 = fma(_1610, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1624 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1614);
    float _1626 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1620);
    float _1628 = fma(_1610, _1622, -0.212114393711090087890625);
    float _1630 = 1.0 / _1600;
    float _1632 = -_1568;
    float _1634 = fma(_1602, _1618, _1632);
    float _1636 = fma(_1610, _1628, 1.570728778839111328125);
    float _1638 = sqrt(_1604);
    float _1640 = _1616 * 0.693147182464599609375;
    float _1642 = _1640 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1644 = fma(_1634, 0.5, 0.5);
    float _1646 = _1624 * _1630;
    float _1648 = _1626 * _1630;
    float _1650 = fma(_1646, 0.5, 0.5);
    float _1652 = fma(_1648, -0.5, 0.5);
    float _1654 = _1638 * 0.636619746685028076171875;
    float _1656 = -_1636;
    float _1658 = fma(_1654, _1656, 1.0);
    float3 _4663 = float3(_1650, _1652, _1642);
    float _1660 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4663, float3(0.0), isnan(_4663)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4663, float3(0.0), isnan(_4663)), level(0.0)).x;
    float3 _4674 = float3(_1650, _1652, _1642);
    float4 _1663 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4674, float3(0.0), isnan(_4674)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4674, float3(0.0), isnan(_4674)), level(0.0)).xyzw;
    float _1665 = _1663.x;
    float _1667 = _1663.y;
    float _1669 = _1663.z;
    float _1671 = _1663.w;
    float2 _4691 = float2(_1658, _1644);
    float3 _1675 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4691, float2(0.0), isnan(_4691)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4691, float2(0.0), isnan(_4691)), level(0.0)).xyz;
    float _1677 = _1675.x;
    float _1679 = _1675.y;
    float _1681 = _1675.z;
    float _1683 = in.m_51.y;
    float _1685 = _1562 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1687 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1689 = _1687 != 0;
    float _1691 = in.m_57.x;
    int _1693 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1695 = _1693 != 0;
    float _1697 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1699 = _1697 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1701 = fma(_1564, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1685);
    float _1703 = in.m_57.y;
    float _1705 = 1.0 / _1699;
    float _1707 = in.m_59.x;
    float _1709 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1711 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1709;
    float _1713 = _1174;
    float _1715 = _1711;
    if (_1689)
    {
        float _1717 = in.m_51.x;
        _1713 = _1717;
    }
    float _1719 = _1713;
    float _1721 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1723 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1725 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1727 = _964 + _1725;
    float _1729 = in.m_59.y;
    float _1731 = _1721 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1733 = _1683 > 0.5;
    float _1735 = in.m_59.z;
    bool _1737 = _964 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1739 = isnan(_964);
    bool _1741 = _1737 || _1739;
    bool _1743 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1745 = _1741 || _1743;
    float _1747 = float(_1745);
    float _1749 = _1711 * _1705;
    float _1751 = 0.0;
    if (_1689)
    {
        _1751 = _1691;
    }
    float _1753 = _1751;
    float _1755 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1757 = _964 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1759 = isnan(_964);
    bool _1761 = _1757 || _1759;
    bool _1763 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1765 = _1761 || _1763;
    float _1767 = float(_1765);
    float _1769 = fma(_1749, _1727, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1771 = _1753;
    if (!_1689)
    {
        _1715 = _1691;
    }
    float _1773 = _1715;
    float _1775 = -_1703;
    float _1777 = _1775 + 1.0;
    float _1779 = in.m_59.w;
    float _1781 = _1703;
    float _1783 = _1773;
    if (_1695)
    {
        float _1785 = _1733 ? _1777 : _1703;
        _1781 = _1785;
    }
    float _1787 = _1781;
    out.m_61.x = _1707;
    bool _1789 = _1719 > 0.5;
    bool _1791 = _1789 && _1689;
    float _1793 = -_1747;
    float _1795 = _1793 + 1.0;
    bool _1797 = _1340 > 0.0;
    bool _1799 = isnan(_1340);
    bool _1801 = _1797 || _1799;
    bool _1803 = isnan(0.0);
    bool _1805 = _1801 || _1803;
    out.m_61.y = _1729;
    float _1807 = _1767 * _1795;
    float _1809 = -_1767;
    float _1811 = _1809 + 1.0;
    float _1813 = _1769 * _1807;
    float _1815 = _1787 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    out.m_61.z = _1735;
    if (_1791)
    {
        float _1817 = -_1753;
        float _1819 = _1817 + 1.0;
        _1771 = _1819;
    }
    float _1821 = _1771;
    float _1823 = fma(_1811, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1813);
    float _1825 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1701);
    float _1827 = _1815 * _1755;
    out.m_61.w = _1779;
    if (_1689)
    {
        _1783 = _1821;
    }
    float _1829 = _1783;
    float _1831 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1833 = _1829 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1835 = _1831 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1837 = _1833 * _1723;
    float _1839 = fma(_1747, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1823);
    float _1841 = _1550 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_63.x = _1837;
    out.m_63.y = _1827;
    float _1843 = exp2(_1841);
    float _1845 = _1839 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1847 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1849 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1825);
    float _1851 = _1847 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1853 = _1849 + _1600;
    out.gl_Position.x = _1624;
    out.gl_Position.y = _1626;
    out.gl_Position.z = _1849;
    out.gl_Position.w = _1600;
    float _1855 = _1600 * 0.5;
    float _1857 = _1340 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1859 = _1624 + _1600;
    float _1861 = _1853 * 0.5;
    float _1863 = fma(_1626, -0.5, _1855);
    float _1865 = _1857 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1867 = _1859 * 0.5;
    float _1869 = -_1843;
    float _1871 = _1869 + 1.0;
    out.m_65.x = _1851;
    out.m_65.y = _1731;
    out.m_65.z = _1835;
    out.m_65.w = _1845;
    float _1873 = _1871 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_67.x = _1867;
    out.m_67.y = _1863;
    out.m_67.z = _1861;
    out.m_67.w = _1600;
    float _1875 = -_1873;
    float _1877 = _1875 + 1.0;
    out.m_45.x = _1865;
    float _1879 = _1873 * _1660;
    float _1881 = _1671 * _1877;
    float _1883 = _1671 * _1879;
    float _1885 = _1681 * _1879;
    float _1887 = fma(_1677, _1883, _1665);
    float _1889 = fma(_1679, _1883, _1667);
    float _1891 = fma(_1671, _1885, _1669);
    out.m_69.x = _1887;
    out.m_69.y = _1889;
    out.m_69.z = _1891;
    out.m_69.w = _1881;
    if (_1805)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1893 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1893;
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
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _956 = false;
    bool _816 = false;
    bool _564 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _1950 = as_type<float>(_104);
        out.gl_Position.z = _1950;
    }
    if (!_92)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _108 = in.m_47.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_118)
    {
        float _124 = float(_88);
        _98 = _124;
    }
    float _126 = _98;
    bool _128 = _122 >= _126;
    bool _130 = !_118;
    bool _132 = _128 || _130;
    float _134 = _126;
    if (_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _134;
    if (_132)
    {
        out.m_45.x = 0.0;
    }
    if (_132)
    {
        float _138 = _136 * 5.0;
        _106 = as_type<int>(_138);
    }
    int _140 = _106;
    if (_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2019 = as_type<float>(_140);
        out.gl_Position.z = _2019;
    }
    if (_132)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _142 = in.m_47.x;
    float _144 = in.m_47.y;
    float _146 = in.m_47.z;
    float _148 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _150 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _152 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    float _160 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _162 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _160);
    float _164 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _166 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _164);
    float _168 = _164;
    float _170 = (*spvDescriptorSet0.vp_c10)._m0[19].z;
    float _172 = _148;
    if (!_158)
    {
        float _174 = _148 * _148;
        float _176 = _174 * 0.5;
        _168 = _176;
    }
    float _178 = _168;
    float _180 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _162);
    float _182 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _166);
    float _184 = _178;
    if (!_158)
    {
        float _186 = _178 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _184 = _186;
    }
    float _188 = _184;
    bool _190 = !_158;
    float _192 = _188;
    if (!_190)
    {
        float _194 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _196 = log2(_194);
        float _198 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _200 = _198 + 1.0;
        float _202 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = _148 * _196;
        float _206 = exp2(_204);
        float _208 = _202 * 0.693147182464599609375;
        float _210 = 1.0 / _208;
        float _212 = 1.0 / _200;
        float _214 = _206 + (-1.0);
        float _216 = -_214;
        float _218 = fma(_216, _210, _148);
        float _220 = _218 * _212;
        float _222 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _192 = _222;
        _170 = _206;
    }
    float _224 = _192;
    float _226 = _170;
    bool _228 = !_158;
    float _230 = _226;
    if (!_228)
    {
        float _232 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _234 = log2(_232);
        float _236 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _238 = _236 + 1.0;
        float _240 = 1.0 / _238;
        float _242 = _148 * _234;
        float _244 = exp2(_242);
        float _246 = -_244;
        float _248 = _246 + 1.0;
        float _250 = _248 * _240;
        _172 = _250;
        _230 = _240;
    }
    float _252 = _172;
    float _254 = _230;
    float _256 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _258 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _260 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _262 = _254;
    float _264 = _256;
    float _266 = _260;
    if (!_158)
    {
        float _268 = _122 * _122;
        float _270 = _268 * 0.5;
        _262 = _270;
    }
    float _272 = _262;
    float _274 = fma(_252, _142, _256);
    float _276 = fma(_252, _144, _258);
    float _278 = fma(_252, _146, _260);
    if (!_158)
    {
        float _280 = _272 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _264 = _280;
    }
    float _282 = _264;
    bool _284 = !_158;
    float _286 = _282;
    if (!_284)
    {
        float _288 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _290 = log2(_288);
        float _292 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _294 = _292 + 1.0;
        float _296 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _298 = _122 * _290;
        float _300 = 1.0 / _294;
        float _302 = _296 * 0.693147182464599609375;
        float _304 = exp2(_298);
        float _306 = 1.0 / _302;
        float _308 = _304 + (-1.0);
        float _310 = -_308;
        float _312 = fma(_310, _306, _122);
        float _314 = _312 * _300;
        float _316 = _314 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _286 = _316;
        _266 = _304;
    }
    float _318 = _286;
    float _320 = _266;
    float _322 = _318 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _324 = _320;
    if (!_158)
    {
        _324 = _122;
    }
    float _326 = _324;
    bool _328 = !_158;
    float _330 = _326;
    if (!_328)
    {
        float _332 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _334 = log2(_332);
        float _336 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _338 = _336 + 1.0;
        float _340 = 1.0 / _338;
        float _342 = _122 * _334;
        float _344 = exp2(_342);
        float _346 = -_344;
        float _348 = _346 + 1.0;
        float _350 = _348 * _340;
        _330 = _350;
    }
    float _352 = _330;
    float _354 = _318 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _356 = fma(_352, _144, _322);
    float _358 = _318 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _360 = fma(_352, _142, _354);
    float _362 = -_356;
    float _364 = _276 + _362;
    float _366 = fma(_352, _146, _358);
    float _368 = -_360;
    float _370 = _274 + _368;
    float _372 = _364 * _364;
    float _374 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _376 = -_366;
    float _378 = _278 + _376;
    float _380 = sqrt(_180);
    float _382 = fma(_370, _370, _372);
    float _384 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _374);
    float _386 = _364 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _388 = _364 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _390 = fma(_378, _378, _382);
    float _392 = in.m_49.w;
    float _394 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[14].y, _386);
    float _396 = sqrt(_182);
    float _398 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[14].z, _388);
    float _400 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _384);
    float _402 = _364 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _404 = sqrt(_390);
    float _406 = in.m_42.x;
    float _408 = in.m_42.y;
    float _410 = in.m_42.z;
    float _412 = _364 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _414 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[14].x, _402);
    float _416 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[16].z, _398);
    float _418 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[14].w, _412);
    float _420 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[16].x, _414);
    float _422 = sqrt(_400);
    float _424 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[16].y, _394);
    float _426 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[16].w, _418);
    float _428 = _380 * _420;
    float _430 = _396 * _424;
    bool _432 = _404 >= 9.9999999747524270787835121154785e-07;
    bool _434 = isnan(_404);
    bool _436 = _432 || _434;
    bool _438 = isnan(9.9999999747524270787835121154785e-07);
    bool _440 = _436 || _438;
    float _442 = _430 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _444 = _430 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _446 = _430 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _448 = fma(_428, (*spvDescriptorSet0.vp_c8)._m0[24].x, _442);
    float _450 = fma(_428, (*spvDescriptorSet0.vp_c8)._m0[25].x, _444);
    float _452 = fma(_428, (*spvDescriptorSet0.vp_c8)._m0[26].x, _446);
    float _454 = _422 * _416;
    float _456 = fma(_274, _392, _406);
    float _458 = fma(_276, _392, _408);
    float _460 = fma(_278, _392, _410);
    float _462 = fma(_454, (*spvDescriptorSet0.vp_c8)._m0[25].z, _450);
    float _464 = fma(_454, (*spvDescriptorSet0.vp_c8)._m0[26].z, _452);
    float _466 = fma(_454, (*spvDescriptorSet0.vp_c8)._m0[24].z, _448);
    float _468 = fma(_426, (*spvDescriptorSet0.vp_c8)._m0[25].w, _462);
    float _470 = fma(_426, (*spvDescriptorSet0.vp_c8)._m0[26].w, _464);
    float _472 = fma(_426, (*spvDescriptorSet0.vp_c8)._m0[24].w, _466);
    float _474 = _426;
    float _476 = _468;
    float _478 = _472;
    float _480 = _422;
    if (_440)
    {
        _474 = _468;
    }
    float _482 = _474;
    float _484 = _482;
    if (_440)
    {
        _476 = _470;
    }
    float _486 = _476;
    float _488 = _486;
    if (!_440)
    {
        bool _490 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _492 = !_490;
        if (!_492)
        {
            float _494 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].y;
            float _496 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].x;
            float _498 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].z;
            float _500 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].y, _494);
            float _502 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].x, _496);
            float _504 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].z, _498);
            float _506 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].y, _500);
            float _508 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].x, _502);
            float _510 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].w;
            float _512 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].z, _504);
            float _514 = _396 * _506;
            float _516 = _380 * _508;
            float _518 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].w, _510);
            float _520 = _422 * _512;
            float _522 = _514 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
            float _524 = _514 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
            float _526 = _514 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
            float _528 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].w, _518);
            float _530 = fma(_516, (*spvDescriptorSet0.vp_c8)._m0[25].x, _522);
            float _532 = fma(_516, (*spvDescriptorSet0.vp_c8)._m0[24].x, _524);
            float _534 = fma(_516, (*spvDescriptorSet0.vp_c8)._m0[26].x, _526);
            float _536 = fma(_520, (*spvDescriptorSet0.vp_c8)._m0[25].z, _530);
            float _538 = fma(_520, (*spvDescriptorSet0.vp_c8)._m0[24].z, _532);
            float _540 = fma(_520, (*spvDescriptorSet0.vp_c8)._m0[26].z, _534);
            float _542 = fma(_528, (*spvDescriptorSet0.vp_c8)._m0[25].w, _536);
            float _544 = fma(_528, (*spvDescriptorSet0.vp_c8)._m0[24].w, _538);
            float _546 = fma(_528, (*spvDescriptorSet0.vp_c8)._m0[26].w, _540);
            float _548 = _542 * _542;
            float _550 = fma(_544, _544, _548);
            float _552 = fma(_546, _546, _550);
            float _554 = rsqrt(_552);
            float _556 = _554 * 9.9999999747524270787835121154785e-07;
            float _558 = _544 * _556;
            float _560 = _542 * _556;
            float _562 = _546 * _556;
            _484 = _560;
            _478 = _558;
            _488 = _562;
            _564 = true;
        }
        else
        {
            float _566 = _144 * _144;
            float _568 = fma(_142, _142, _566);
            float _570 = fma(_146, _146, _568);
            float _572 = sqrt(_570);
            bool _574 = _572 >= 9.9999999747524270787835121154785e-07;
            bool _576 = isnan(_572);
            bool _578 = _574 || _576;
            bool _580 = isnan(9.9999999747524270787835121154785e-07);
            bool _582 = _578 || _580;
            if (!_582)
            {
                float _584 = _408 * _408;
                float _586 = fma(_406, _406, _584);
                float _588 = fma(_410, _410, _586);
                float _590 = sqrt(_588);
                bool _592 = _590 >= 9.9999999747524270787835121154785e-07;
                bool _594 = isnan(_590);
                bool _596 = _592 || _594;
                bool _598 = isnan(9.9999999747524270787835121154785e-07);
                bool _600 = _596 || _598;
                if (!_600)
                {
                    float _602 = _396 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _604 = _380 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _606 = _422 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _608 = _602 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _610 = _602 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _612 = _602 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _614 = fma(_604, (*spvDescriptorSet0.vp_c8)._m0[25].x, _608);
                    float _616 = fma(_604, (*spvDescriptorSet0.vp_c8)._m0[24].x, _610);
                    float _618 = fma(_604, (*spvDescriptorSet0.vp_c8)._m0[26].x, _612);
                    float _620 = fma(_606, (*spvDescriptorSet0.vp_c8)._m0[25].z, _614);
                    float _622 = fma(_606, (*spvDescriptorSet0.vp_c8)._m0[24].z, _616);
                    float _624 = fma(_606, (*spvDescriptorSet0.vp_c8)._m0[26].z, _618);
                    float _626 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[25].w, _620);
                    float _628 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[24].w, _622);
                    float _630 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[26].w, _624);
                    float _632 = _626 * _626;
                    float _634 = fma(_628, _628, _632);
                    float _636 = fma(_630, _630, _634);
                    float _638 = rsqrt(_636);
                    float _640 = _638 * 9.9999999747524270787835121154785e-07;
                    float _642 = _628 * _640;
                    float _644 = _626 * _640;
                    float _646 = _630 * _640;
                    _484 = _644;
                    _478 = _642;
                    _488 = _646;
                    _564 = true;
                }
                else
                {
                    float _648 = _408 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _650 = _408 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _652 = _408 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _654 = _408 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                    float _656 = fma(_406, (*spvDescriptorSet0.vp_c10)._m0[14].y, _648);
                    float _658 = fma(_406, (*spvDescriptorSet0.vp_c10)._m0[14].x, _650);
                    float _660 = fma(_406, (*spvDescriptorSet0.vp_c10)._m0[14].z, _652);
                    float _662 = fma(_406, (*spvDescriptorSet0.vp_c10)._m0[14].w, _654);
                    float _664 = fma(_410, (*spvDescriptorSet0.vp_c10)._m0[16].y, _656);
                    float _666 = fma(_410, (*spvDescriptorSet0.vp_c10)._m0[16].x, _658);
                    float _668 = fma(_410, (*spvDescriptorSet0.vp_c10)._m0[16].z, _660);
                    float _670 = fma(_410, (*spvDescriptorSet0.vp_c10)._m0[16].w, _662);
                    float _672 = _396 * _664;
                    float _674 = _380 * _666;
                    float _676 = _422 * _668;
                    float _678 = _672 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _680 = _672 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _682 = _672 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _684 = fma(_674, (*spvDescriptorSet0.vp_c8)._m0[25].x, _678);
                    float _686 = fma(_674, (*spvDescriptorSet0.vp_c8)._m0[24].x, _680);
                    float _688 = fma(_674, (*spvDescriptorSet0.vp_c8)._m0[26].x, _682);
                    float _690 = fma(_676, (*spvDescriptorSet0.vp_c8)._m0[25].z, _684);
                    float _692 = fma(_676, (*spvDescriptorSet0.vp_c8)._m0[24].z, _686);
                    float _694 = fma(_676, (*spvDescriptorSet0.vp_c8)._m0[26].z, _688);
                    float _696 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[25].w, _690);
                    float _698 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[24].w, _692);
                    float _700 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[26].w, _694);
                    float _702 = _696 * _696;
                    float _704 = fma(_698, _698, _702);
                    float _706 = fma(_700, _700, _704);
                    float _708 = rsqrt(_706);
                    float _710 = _708 * 9.9999999747524270787835121154785e-07;
                    float _712 = _698 * _710;
                    float _714 = _696 * _710;
                    float _716 = _700 * _710;
                    _484 = _714;
                    _478 = _712;
                    _488 = _716;
                    _564 = true;
                }
            }
            else
            {
                float _718 = _144 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                float _720 = _144 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                float _722 = _144 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                float _724 = _144 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                float _726 = fma(_142, (*spvDescriptorSet0.vp_c10)._m0[14].y, _718);
                float _728 = fma(_142, (*spvDescriptorSet0.vp_c10)._m0[14].x, _720);
                float _730 = fma(_142, (*spvDescriptorSet0.vp_c10)._m0[14].z, _722);
                float _732 = fma(_142, (*spvDescriptorSet0.vp_c10)._m0[14].w, _724);
                float _734 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[16].y, _726);
                float _736 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[16].x, _728);
                float _738 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[16].z, _730);
                float _740 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[16].w, _732);
                float _742 = _396 * _734;
                float _744 = _380 * _736;
                float _746 = _422 * _738;
                float _748 = _742 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                float _750 = _742 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                float _752 = _742 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                float _754 = fma(_744, (*spvDescriptorSet0.vp_c8)._m0[25].x, _748);
                float _756 = fma(_744, (*spvDescriptorSet0.vp_c8)._m0[24].x, _750);
                float _758 = fma(_744, (*spvDescriptorSet0.vp_c8)._m0[26].x, _752);
                float _760 = fma(_746, (*spvDescriptorSet0.vp_c8)._m0[25].z, _754);
                float _762 = fma(_746, (*spvDescriptorSet0.vp_c8)._m0[24].z, _756);
                float _764 = fma(_746, (*spvDescriptorSet0.vp_c8)._m0[26].z, _758);
                float _766 = fma(_740, (*spvDescriptorSet0.vp_c8)._m0[25].w, _760);
                float _768 = fma(_740, (*spvDescriptorSet0.vp_c8)._m0[24].w, _762);
                float _770 = fma(_740, (*spvDescriptorSet0.vp_c8)._m0[26].w, _764);
                float _772 = _766 * _766;
                float _774 = fma(_768, _768, _772);
                float _776 = fma(_770, _770, _774);
                float _778 = rsqrt(_776);
                float _780 = _778 * 9.9999999747524270787835121154785e-07;
                float _782 = _768 * _780;
                float _784 = _766 * _780;
                float _786 = _770 * _780;
                _484 = _784;
                _478 = _782;
                _488 = _786;
            }
        }
    }
    _564 = false;
    float _788 = _484;
    float _790 = _478;
    float _792 = _488;
    bool _794 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _796 = !_794;
    float _814;
    if (!_796)
    {
        float _798 = in.m_51.x;
        float _800 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _802 = _798 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _804 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _806 = _804 * _800;
        float _808 = floor(_806);
        float _810 = -_808;
        float _812 = _806 + _810;
        _814 = _812;
        _816 = true;
    }
    else
    {
        float _818 = float(_88);
        float _820 = 1.0 / _818;
        float _822 = _122 * _820;
        _814 = _822;
    }
    _816 = false;
    float _824 = _814;
    float _826 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _828 = _824 + _826;
    float _830 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _832 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _830;
    float _834 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _836 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _838 = 1.0 / _832;
    float _840 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _842 = _824 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _844 = isnan(_824);
    bool _846 = _842 || _844;
    bool _848 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _850 = _846 || _848;
    float _852 = float(_850);
    float _854 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _856 = _834 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _858 = _836 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _860 = _840 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _862 = _824 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _864 = isnan(_824);
    bool _866 = _862 || _864;
    bool _868 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _870 = _866 || _868;
    float _872 = float(_870);
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _876 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _874;
    float _878 = -_852;
    float _880 = _878 + 1.0;
    float _882 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _884 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _882;
    float _886 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _888 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _886;
    out.m_53.x = _856;
    out.m_53.y = _858;
    out.m_53.z = _860;
    out.m_53.w = _854;
    bool _890 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _892 = _828 * _838;
    float _894 = in.m_49.x;
    float _896 = in.m_49.y;
    float _898 = in.m_49.z;
    float _900 = fma(_876, _892, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _902 = fma(_884, _892, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _904 = fma(_888, _892, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _906 = _872 * _880;
    float _908 = -_872;
    float _910 = _908 + 1.0;
    float _912 = _900 * _906;
    float _914 = _902 * _906;
    float _916 = _904 * _906;
    float _918 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[143].x, _912);
    float _920 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[143].y, _914);
    float _922 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[143].z, _916);
    float _924 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[144].x, _918);
    float _926 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[144].y, _920);
    float _928 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[144].z, _922);
    float _930 = _924 * _894;
    float _932 = _926 * _896;
    float _934 = _928 * _898;
    bool _936 = !_890;
    float _954;
    if (!_936)
    {
        float _938 = in.m_51.x;
        float _940 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _942 = _938 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _944 = fma(_942, (*spvDescriptorSet0.vp_c9)._m0[11].w, _122);
        float _946 = _944 * _940;
        float _948 = floor(_946);
        float _950 = -_948;
        float _952 = _946 + _950;
        _954 = _952;
        _956 = true;
    }
    else
    {
        float _958 = float(_88);
        float _960 = 1.0 / _958;
        float _962 = _122 * _960;
        _954 = _962;
    }
    _956 = false;
    float _964 = _954;
    float _966 = _788 * _788;
    float _968 = _458 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _970 = _458 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _972 = _458 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _974 = fma(_790, _790, _966);
    float _976 = fma(_456, (*spvDescriptorSet0.vp_c10)._m0[14].y, _968);
    float _978 = fma(_456, (*spvDescriptorSet0.vp_c10)._m0[14].x, _970);
    float _980 = fma(_456, (*spvDescriptorSet0.vp_c10)._m0[14].z, _972);
    float _982 = fma(_792, _792, _974);
    float _984 = fma(_460, (*spvDescriptorSet0.vp_c10)._m0[16].y, _976);
    float _986 = in.m_55.x;
    float _988 = in.m_55.y;
    float _990 = in.m_55.z;
    float _992 = fma(_460, (*spvDescriptorSet0.vp_c10)._m0[16].x, _978);
    float _994 = _458 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _996 = _984 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _998 = rsqrt(_982);
    float _1000 = fma(_460, (*spvDescriptorSet0.vp_c10)._m0[16].z, _980);
    float _1002 = fma(_456, (*spvDescriptorSet0.vp_c10)._m0[14].w, _994);
    float _1004 = _396 * _996;
    float _1006 = _1000 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _1008 = fma(_460, (*spvDescriptorSet0.vp_c10)._m0[16].w, _1002);
    float _1010 = _422 * _1006;
    float _1012 = _1008 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _1014 = _998 * _792;
    float _1016 = _998 * _790;
    float _1018 = _998 * _788;
    float _1020 = _932 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1022 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1024 = _1014 * _1022;
    float _1026 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1028 = _1016 * _1026;
    float _1030 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1032 = _1018 * _1030;
    float _1034 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1036 = -_1024;
    float _1038 = fma(_1016, _1034, _1036);
    float _1040 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1042 = -_1028;
    float _1044 = fma(_1018, _1040, _1042);
    float _1046 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1048 = -_1032;
    float _1050 = fma(_1014, _1046, _1048);
    float _1052 = _1038 * _1038;
    bool _1054 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1056 = isnan(0.5);
    bool _1058 = _1054 || _1056;
    bool _1060 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1062 = _1058 || _1060;
    float _1064 = fma(_1050, _1050, _1052);
    float _1066 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _986);
    float _1068 = _930 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1070 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _988);
    float _1072 = fma(_1044, _1044, _1064);
    float _1074 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _990);
    float _1076 = _934 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1078 = _1068 * _1066;
    float _1080 = _992 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _1082 = _1020 * _1070;
    float _1084 = rsqrt(_1072);
    float _1086 = _1076 * _1074;
    float _1088 = _1004 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1090 = _1004 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1092 = _380 * _1080;
    float _1094 = _1004 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1096 = _1082 * _1014;
    float _1098 = _1082 * _1016;
    float _1100 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1088);
    float _1102 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1094);
    float _1104 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1090);
    float _1106 = _1082 * _1018;
    float _1108 = fma(_1010, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1100);
    float _1110 = _1086;
    float _1112 = _1106;
    if (_1062)
    {
        _480 = 1.0;
    }
    float _1114 = _480;
    float _1116 = _1038 * _1084;
    float _1118 = _1044 * _1084;
    float _1120 = _1050 * _1084;
    float _1122 = fma(_1012, (*spvDescriptorSet0.vp_c8)._m0[24].w, _1108);
    float _1124 = _1016 * _1116;
    float _1126 = fma(_1078, _1118, _1096);
    float _1128 = fma(_1010, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1102);
    float _1130 = _1018 * _1118;
    float _1132 = -_1124;
    float _1134 = fma(_1018, _1120, _1132);
    float _1136 = fma(_1010, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1104);
    float _1138 = fma(_1012, (*spvDescriptorSet0.vp_c8)._m0[26].w, _1128);
    float _1140 = -_1130;
    float _1142 = fma(_1014, _1116, _1140);
    float _1144 = fma(_1086, _1134, _1126);
    float _1146 = fma(_1078, _1120, _1098);
    float _1148 = _1138 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _1150 = _1122 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _1152 = fma(_1012, (*spvDescriptorSet0.vp_c8)._m0[25].w, _1136);
    float _1154 = fma(_1086, _1142, _1146);
    float _1156 = _1148 + _1144;
    float _1158 = _1014 * _1120;
    float _1160 = _1152 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _1162 = _1150 + _1154;
    float _1164 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1166 = _1156 + _1164;
    float _1168 = fma(_1078, _1116, _1106);
    float _1170 = _1160 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1172 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1174 = _1162 + _1172;
    float _1176 = _1166 * _1166;
    float _1178 = -_1158;
    float _1180 = fma(_1016, _1118, _1178);
    float _1182 = fma(_1150, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1170);
    float _1184 = fma(_1174, _1174, _1176);
    float _1186 = fma(_1086, _1180, _1168);
    float _1188 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1182);
    float _1190 = _1160 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1192 = sqrt(_1184);
    float _1194 = _1160 + _1186;
    float _1196 = _1188 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1198 = fma(_1150, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1190);
    float _1200 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1198);
    float _1202 = 1.0 / _1196;
    float _1204 = _1200 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1206 = _1204 + _1196;
    bool _1208 = _1192 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1210 = _1206 * _1202;
    float _1212 = _1210 * 0.5;
    float _1214 = _1186;
    float _1216 = _1194;
    float _1218 = _1162;
    float _1220 = _1114;
    if (!_1208)
    {
        _1110 = _1162;
    }
    float _1222 = _1110;
    float _1224 = _1222;
    if (!_1208)
    {
        _1214 = _1156;
    }
    float _1226 = _1214;
    float _1228 = _1226;
    if (!_1208)
    {
        _1112 = _1194;
    }
    float _1230 = _1112;
    bool _1232 = !_1208;
    float _1234 = _1230;
    if (!_1232)
    {
        float _1236 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1238 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1240 = _1192 + _1238;
        float _1242 = rsqrt(_1184);
        float _1244 = _1240 * _1236;
        float _1246 = _1194 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1248 = _1244 * 0.15915493667125701904296875;
        float _1250 = _1248 * 6.283185482025146484375;
        float _1252 = cos(_1250);
        float _1254 = _1248 * 6.283185482025146484375;
        float _1256 = sin(_1254);
        float _1258 = _1252 + (-1.0);
        float _1260 = _1258 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1262 = fma(_1256, _1246, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1264 = fma(_1194, _1252, _1260);
        float _1266 = _1242 * _1262;
        float _1268 = fma(_1174, _1266, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1270 = fma(_1166, _1266, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1234 = _1264;
        _1224 = _1268;
        _1228 = _1270;
    }
    float _1272 = _1234;
    float _1274 = _1224;
    float _1276 = _1228;
    if (!_1062)
    {
        float _1278 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1280 = _1278 * 0.15915493667125701904296875;
        float _1282 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1284 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1286 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1284);
        float _1288 = _1280 * 6.283185482025146484375;
        float _1290 = cos(_1288);
        float _1292 = _1282 * 0.15915493667125701904296875;
        float _1294 = _1280 * 6.283185482025146484375;
        float _1296 = sin(_1294);
        float _1298 = 1.0 / _1290;
        float _1300 = _1292 * 6.283185482025146484375;
        float _1302 = cos(_1300);
        float _1304 = _1296 * _1298;
        float _1306 = _1292 * 6.283185482025146484375;
        float _1308 = sin(_1306);
        float _1310 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1312 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1310;
        float _1314 = _1302 * _1304;
        float _1316 = 1.0 / _1286;
        float _1318 = 1.0 / _1314;
        float _1320 = 1.0 / _1312;
        float _1322 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1324 = _1316 * _1322;
        float _1326 = _1308 * _1318;
        float _1328 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1330 = fma(_1326, _1324, _1328);
        float _1332 = _1330 * _1320;
        float _1334 = precise::clamp(_1332, 0.0, 1.0);
        _1216 = _1320;
        _1218 = _1316;
        _1220 = _1334;
    }
    float _1336 = _1216;
    float _1338 = _1218;
    float _1340 = _1220;
    float _1342 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1344 = _1272 + _1342;
    float _1346 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1348 = _1274 + _1346;
    float _1350 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1352 = _1276 + _1350;
    float _1354 = _1344 * _1344;
    float _1356 = fma(_1348, _1348, _1354);
    float _1358 = fma(_1352, _1352, _1356);
    float _1360 = rsqrt(_1358);
    float _1362 = sqrt(_1358);
    float _1364 = _1360 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1366 = _1348 * _1364;
    float _1368 = _1352 * _1364;
    float _1370 = _1366 * _1366;
    float _1372 = _1368 * _1368;
    float _1374 = _1370 + _1372;
    float _1376 = sqrt(_1374);
    bool _1378 = _1376 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1380 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1382 = _1376 + _1380;
    float _1384 = _1360;
    float _1386 = _1374;
    float _1388 = _1382;
    float _1390 = _1336;
    float _1392 = _1344;
    float _1394 = _1364;
    if (_1378)
    {
        float _1396 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1384 = _1396;
    }
    float _1398 = _1384;
    if (_1378)
    {
        float _1400 = rsqrt(_1374);
        _1386 = _1400;
    }
    float _1402 = _1386;
    float _1404 = _1402;
    if (_1378)
    {
        float _1406 = _1382 * _1398;
        _1388 = _1406;
    }
    float _1408 = _1388;
    if (_1378)
    {
        float _1410 = _1408 * 0.15915493667125701904296875;
        _1390 = _1410;
    }
    float _1412 = _1390;
    float _1414 = _1352;
    float _1416 = _1412;
    if (_1378)
    {
        float _1418 = _1412 * 6.283185482025146484375;
        float _1420 = sin(_1418);
        _1414 = _1420;
    }
    float _1422 = _1414;
    float _1424 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1426 = precise::max(0.0, _1424);
    float _1428 = _1338;
    float _1430 = _1426;
    float _1432 = _1424;
    if (_1378)
    {
        float _1434 = _1412 * 6.283185482025146484375;
        float _1436 = cos(_1434);
        _1428 = _1436;
    }
    float _1438 = _1428;
    float _1440 = -_1364;
    float _1442 = -_1426;
    float _1444 = fma(_1344, _1440, _1442);
    if (!_1378)
    {
        _1392 = _1368;
    }
    float _1446 = _1392;
    float _1448 = _1446;
    if (_1378)
    {
        float _1450 = _1444 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1430 = _1450;
    }
    float _1452 = _1430;
    float _1454 = _1422;
    float _1456 = _1452;
    if (_1378)
    {
        float _1458 = fma(_1422, _1452, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1454 = _1458;
    }
    float _1460 = _1454;
    float _1462 = _1460;
    if (!_1378)
    {
        _1456 = _1366;
    }
    float _1464 = _1456;
    float _1466 = _1464;
    if (_1378)
    {
        float _1468 = _1438 + (-1.0);
        _1432 = _1468;
    }
    float _1470 = _1432;
    float _1472 = _1470;
    if (_1378)
    {
        float _1474 = _1402 * _1460;
        _1394 = _1474;
    }
    float _1476 = _1394;
    if (!_1378)
    {
        _1462 = _1444;
    }
    float _1478 = _1462;
    float _1480 = _1478;
    if (_1378)
    {
        float _1482 = _1470 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1416 = _1482;
    }
    float _1484 = _1416;
    if (_1378)
    {
        float _1486 = _1366 * _1476;
        _1466 = _1486;
    }
    float _1488 = _1466;
    if (!_1378)
    {
        _1404 = _1370;
    }
    float _1490 = _1404;
    float _1492 = _1490;
    if (_1378)
    {
        float _1494 = _1368 * _1476;
        _1448 = _1494;
    }
    float _1496 = _1448;
    if (_1378)
    {
        float _1498 = fma(_1444, _1438, _1484);
        _1480 = _1498;
    }
    float _1500 = _1480;
    if (_1378)
    {
        float _1502 = _1488 * _1488;
        _1492 = _1502;
    }
    float _1504 = _1492;
    if (!_1378)
    {
        _1472 = _1372;
    }
    float _1506 = _1472;
    float _1508 = _1506;
    if (_1378)
    {
        float _1510 = _1496 * _1496;
        _1508 = _1510;
    }
    float _1512 = _1508;
    float _1514 = fma(_1500, _1500, _1504);
    float _1516 = _1272 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1518 = _1514 + _1512;
    float _1520 = _1272 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1522 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1524 = fma(_1362, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1522);
    float _1526 = precise::clamp(_1524, 0.0, 1.0);
    float _1528 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1530 = rsqrt(_1518);
    float _1532 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1520);
    float _1534 = _1272 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1536 = -_1526;
    float _1538 = _1536 + 1.0;
    float _1540 = _1272 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1542 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1532);
    float _1544 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1534);
    float _1546 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1516);
    float _1548 = abs(_1538);
    float _1550 = log2(_1548);
    float _1552 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1540);
    float _1554 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1544);
    float _1556 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1546);
    float _1558 = _1542 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1560 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1552);
    float _1562 = _1554 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1564 = _1556 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1566 = _1530 * _1488;
    float _1568 = _1530 * _1500;
    float _1570 = _1562 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1572 = _1530 * _1496;
    float _1574 = _1566 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1576 = _1558 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1578 = fma(_1564, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1570);
    float _1580 = _1560 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1582 = -_1574;
    float _1584 = fma(_1568, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1582);
    float _1586 = _1550 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1588 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1578);
    float _1590 = -_1576;
    float _1592 = fma(_1590, _1528, 1.0);
    float _1594 = -_1572;
    float _1596 = fma(_1594, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1584);
    float _1598 = _1562 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1600 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1588);
    float _1602 = exp2(_1586);
    float _1604 = fma(_1596, -0.5, 0.5);
    float _1606 = _1562 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1608 = fma(_1564, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1598);
    float _1610 = fma(_1596, 0.5, 0.5);
    float _1612 = fma(_1564, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1606);
    float _1614 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1608);
    float _1616 = log2(_1592);
    float _1618 = _1568 + 1.0;
    float _1620 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1612);
    float _1622 = fma(_1610, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1624 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1614);
    float _1626 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1620);
    float _1628 = fma(_1610, _1622, -0.212114393711090087890625);
    float _1630 = 1.0 / _1600;
    float _1632 = -_1568;
    float _1634 = fma(_1602, _1618, _1632);
    float _1636 = fma(_1610, _1628, 1.570728778839111328125);
    float _1638 = sqrt(_1604);
    float _1640 = _1616 * 0.693147182464599609375;
    float _1642 = _1640 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1644 = fma(_1634, 0.5, 0.5);
    float _1646 = _1624 * _1630;
    float _1648 = _1626 * _1630;
    float _1650 = fma(_1646, 0.5, 0.5);
    float _1652 = fma(_1648, -0.5, 0.5);
    float _1654 = _1638 * 0.636619746685028076171875;
    float _1656 = -_1636;
    float _1658 = fma(_1654, _1656, 1.0);
    float3 _4663 = float3(_1650, _1652, _1642);
    float _1660 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4663, float3(0.0), isnan(_4663)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4663, float3(0.0), isnan(_4663)), level(0.0)).x;
    float3 _4674 = float3(_1650, _1652, _1642);
    float4 _1663 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4674, float3(0.0), isnan(_4674)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4674, float3(0.0), isnan(_4674)), level(0.0)).xyzw;
    float _1665 = _1663.x;
    float _1667 = _1663.y;
    float _1669 = _1663.z;
    float _1671 = _1663.w;
    float2 _4691 = float2(_1658, _1644);
    float3 _1675 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4691, float2(0.0), isnan(_4691)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4691, float2(0.0), isnan(_4691)), level(0.0)).xyz;
    float _1677 = _1675.x;
    float _1679 = _1675.y;
    float _1681 = _1675.z;
    float _1683 = in.m_51.y;
    float _1685 = _1562 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1687 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1689 = _1687 != 0;
    float _1691 = in.m_57.x;
    int _1693 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1695 = _1693 != 0;
    float _1697 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1699 = _1697 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1701 = fma(_1564, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1685);
    float _1703 = in.m_57.y;
    float _1705 = 1.0 / _1699;
    float _1707 = in.m_59.x;
    float _1709 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1711 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1709;
    float _1713 = _1174;
    float _1715 = _1711;
    if (_1689)
    {
        float _1717 = in.m_51.x;
        _1713 = _1717;
    }
    float _1719 = _1713;
    float _1721 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1723 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1725 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1727 = _964 + _1725;
    float _1729 = in.m_59.y;
    float _1731 = _1721 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1733 = _1683 > 0.5;
    float _1735 = in.m_59.z;
    bool _1737 = _964 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1739 = isnan(_964);
    bool _1741 = _1737 || _1739;
    bool _1743 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1745 = _1741 || _1743;
    float _1747 = float(_1745);
    float _1749 = _1711 * _1705;
    float _1751 = 0.0;
    if (_1689)
    {
        _1751 = _1691;
    }
    float _1753 = _1751;
    float _1755 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1757 = _964 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1759 = isnan(_964);
    bool _1761 = _1757 || _1759;
    bool _1763 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1765 = _1761 || _1763;
    float _1767 = float(_1765);
    float _1769 = fma(_1749, _1727, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1771 = _1753;
    if (!_1689)
    {
        _1715 = _1691;
    }
    float _1773 = _1715;
    float _1775 = -_1703;
    float _1777 = _1775 + 1.0;
    float _1779 = in.m_59.w;
    float _1781 = _1703;
    float _1783 = _1773;
    if (_1695)
    {
        float _1785 = _1733 ? _1777 : _1703;
        _1781 = _1785;
    }
    float _1787 = _1781;
    out.m_61.x = _1707;
    bool _1789 = _1719 > 0.5;
    bool _1791 = _1789 && _1689;
    float _1793 = -_1747;
    float _1795 = _1793 + 1.0;
    bool _1797 = _1340 > 0.0;
    bool _1799 = isnan(_1340);
    bool _1801 = _1797 || _1799;
    bool _1803 = isnan(0.0);
    bool _1805 = _1801 || _1803;
    out.m_61.y = _1729;
    float _1807 = _1767 * _1795;
    float _1809 = -_1767;
    float _1811 = _1809 + 1.0;
    float _1813 = _1769 * _1807;
    float _1815 = _1787 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    out.m_61.z = _1735;
    if (_1791)
    {
        float _1817 = -_1753;
        float _1819 = _1817 + 1.0;
        _1771 = _1819;
    }
    float _1821 = _1771;
    float _1823 = fma(_1811, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1813);
    float _1825 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1701);
    float _1827 = _1815 * _1755;
    out.m_61.w = _1779;
    if (_1689)
    {
        _1783 = _1821;
    }
    float _1829 = _1783;
    float _1831 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1833 = _1829 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1835 = _1831 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1837 = _1833 * _1723;
    float _1839 = fma(_1747, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1823);
    float _1841 = _1550 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_63.x = _1837;
    out.m_63.y = _1827;
    float _1843 = exp2(_1841);
    float _1845 = _1839 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1847 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1849 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1825);
    float _1851 = _1847 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1853 = _1849 + _1600;
    out.gl_Position.x = _1624;
    out.gl_Position.y = _1626;
    out.gl_Position.z = _1849;
    out.gl_Position.w = _1600;
    float _1855 = _1600 * 0.5;
    float _1857 = _1340 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1859 = _1624 + _1600;
    float _1861 = _1853 * 0.5;
    float _1863 = fma(_1626, -0.5, _1855);
    float _1865 = _1857 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1867 = _1859 * 0.5;
    float _1869 = -_1843;
    float _1871 = _1869 + 1.0;
    out.m_65.x = _1851;
    out.m_65.y = _1731;
    out.m_65.z = _1835;
    out.m_65.w = _1845;
    float _1873 = _1871 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_67.x = _1867;
    out.m_67.y = _1863;
    out.m_67.z = _1861;
    out.m_67.w = _1600;
    float _1875 = -_1873;
    float _1877 = _1875 + 1.0;
    out.m_45.x = _1865;
    float _1879 = _1873 * _1660;
    float _1881 = _1671 * _1877;
    float _1883 = _1671 * _1879;
    float _1885 = _1681 * _1879;
    float _1887 = fma(_1677, _1883, _1665);
    float _1889 = fma(_1679, _1883, _1667);
    float _1891 = fma(_1671, _1885, _1669);
    out.m_69.x = _1887;
    out.m_69.y = _1889;
    out.m_69.z = _1891;
    out.m_69.w = _1881;
    if (_1805)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1893 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1893;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

