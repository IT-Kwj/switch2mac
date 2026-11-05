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
    constant _16* vp_c7 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c16 [[id(5)]];
    constant _16* vp_c13 [[id(6)]];
    texture2d<float> vp_t_tcb_24 [[id(7)]];
    sampler vp_t_tcb_24Smplr [[id(8)]];
    texture3d<float> vp_t_tcb_32 [[id(9)]];
    sampler vp_t_tcb_32Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_30 [[id(11)]];
    sampler vp_t_tcb_30Smplr [[id(12)]];
    texture2d<float> vp_t_tcb_1C [[id(13)]];
    sampler vp_t_tcb_1CSmplr [[id(14)]];
    sampler vp_t_tcb_24Smplr_w [[id(15)]];
    sampler vp_t_tcb_32Smplr_w [[id(16)]];
    sampler vp_t_tcb_30Smplr_w [[id(17)]];
    sampler vp_t_tcb_1CSmplr_w [[id(18)]];
    constant dm_border_t* dm_border [[id(19)]];
};

struct main0_out
{
    float4 m_75 [[user(locn0)]];
    float4 m_65 [[user(locn1)]];
    float4 m_87 [[user(locn2)]];
    float4 m_99 [[user(locn3)]];
    float4 m_53 [[user(locn4)]];
    float4 m_73 [[user(locn5)]];
    float4 m_89 [[user(locn6)]];
    float4 m_55 [[user(locn7)]];
    float4 m_59 [[user(locn8)]];
    float4 m_77 [[user(locn9)]];
    float4 m_83 [[user(locn11)]];
    float4 m_79 [[user(locn12)]];
    float4 m_85 [[user(locn13)]];
    float4 m_81 [[user(locn14)]];
    float4 m_97 [[user(locn15)]];
    float4 m_93 [[user(locn16)]];
    float4 m_95 [[user(locn17)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_91 [[attribute(0)]];
    float4 m_48 [[attribute(2)]];
    float4 m_50 [[attribute(3)]];
    float4 m_69 [[attribute(4)]];
    float4 m_67 [[attribute(5)]];
    float4 m_61 [[attribute(6)]];
    float4 m_63 [[attribute(7)]];
    float4 m_71 [[attribute(8)]];
    float4 m_57 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3184 = false;
    bool _2361 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _113 = in.m_48.w;
    float _115 = in.m_50.w;
    float _117 = trunc(_113);
    int _120 = int(_117);
    float _122 = -_115;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _124;
    bool _128 = _120 >= 1;
    float _130 = 0.0;
    float _132 = _115;
    if (!_128)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _130;
    if (!_128)
    {
        out.m_55.x = 0.0;
    }
    int _136 = 0;
    if (!_128)
    {
        float _138 = _134 * 5.0;
        _136 = as_type<int>(_138);
    }
    int _140 = _136;
    int _142 = _140;
    if (!_128)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3499 = as_type<float>(_140);
        out.gl_Position.z = _3499;
    }
    if (!_128)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _144 = _115 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _146 = isnan(_115);
    bool _148 = _144 || _146;
    bool _150 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _152 = _148 || _150;
    float _154 = float(_120);
    bool _156 = _124 >= _154;
    bool _158 = !_152;
    bool _160 = _156 || _158;
    if (_160)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _132;
    if (_160)
    {
        out.m_55.x = 0.0;
    }
    if (_160)
    {
        float _164 = _162 * 5.0;
        _142 = as_type<int>(_164);
    }
    int _166 = _142;
    int _168 = _166;
    if (_160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3555 = as_type<float>(_166);
        out.gl_Position.z = _3555;
    }
    if (_160)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _170 = in.m_57.y;
    float _172 = 1.0 / _154;
    bool _174 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _176 = _124 * _172;
    out.m_59.y = _170;
    bool _178 = !_174;
    float _180 = _176;
    if (!_178)
    {
        float _182 = in.m_61.x;
        float _184 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _186 = _182 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _188 = fma(_186, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _190 = _188 * _184;
        float _192 = floor(_190);
        float _194 = -_192;
        float _196 = _190 + _194;
        _180 = _196;
    }
    float _198 = _180;
    float _200 = in.m_61.x;
    float _202 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _204 = int(_202);
    float _206 = in.m_61.w;
    int _208 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _210 = _208 != 0;
    int _212 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _214 = _212 != 0;
    float _216 = in.m_57.x;
    int _218 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _220 = _218 != 0;
    float _222 = in.m_61.z;
    float _224 = in.m_61.y;
    float _226 = float(_204);
    float _228 = in.m_63.x;
    float _230 = in.m_63.y;
    float _232 = in.m_63.z;
    float _234 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _236 = 1.0 / _226;
    float _238 = _200 * 2.0;
    bool _240 = false;
    if (_210)
    {
        bool _242 = _200 > 0.5;
        _240 = _242;
    }
    bool _244 = _240;
    float _246 = (*spvDescriptorSet0.vp_c8)._m0[28].z * (*spvDescriptorSet0.vp_c8)._m0[1].x;
    bool _248 = _206 > 0.5;
    float _250 = floor(_238);
    int _252 = as_type<int>(_206);
    float _254 = _216;
    if (_210)
    {
        float _256 = -_216;
        float _258 = _256 + 1.0;
        _252 = as_type<int>(_258);
    }
    int _260 = _252;
    int _262 = _260;
    if (_214)
    {
        float _264 = -_216;
        float _266 = _264 + 1.0;
        _168 = as_type<int>(_266);
    }
    int _268 = _168;
    float _270 = 0.0;
    if (!_210)
    {
        _270 = _216;
    }
    float _272 = _270;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[193].y;
    float _276 = fma(_274, 0.100000001490116119384765625, 0.100000001490116119384765625);
    bool _278 = _222 > 0.5;
    float _280 = _272;
    if (_210)
    {
        float _282 = _244 ? as_type<float>(_260) : _216;
        _280 = _282;
    }
    float _284 = _280;
    if (_220)
    {
        float _286 = -_216;
        float _288 = _286 + 1.0;
        _262 = as_type<int>(_288);
    }
    int _290 = _262;
    int _292 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _294 = _292 != 0;
    float _296 = _124 * _236;
    float _298 = 0.0;
    if (!_214)
    {
        _298 = _216;
    }
    float _300 = _298;
    float _302 = _224 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _304 = _300;
    if (_214)
    {
        float _306 = _278 ? as_type<float>(_268) : _216;
        _304 = _306;
    }
    float _308 = _304;
    float _310 = -_170;
    float _312 = _310 + 1.0;
    bool _314 = _224 > 0.5;
    float _316 = trunc(_296);
    int _318 = int(_316);
    bool _320 = !_294;
    int _322 = _320 ? 0 : 1;
    float _324 = _230 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    bool _326 = _250 >= 0.0;
    bool _328 = isnan(_250);
    bool _330 = _326 || _328;
    bool _332 = isnan(0.0);
    bool _334 = _330 || _332;
    float _336 = _200 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    if (_220)
    {
        float _338 = _314 ? as_type<float>(_290) : _216;
        _254 = _338;
    }
    float _340 = _254;
    float _342 = _232 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    int _344 = _314 ? as_type<int>(_312) : as_type<int>(_170);
    float _346 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _348 = int(_346);
    int _350 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _352 = _350 != 0;
    int _354 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _356 = _354 != 0;
    float _358 = -_234;
    float _360 = fma(_336, 2.0, _358);
    int _362 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _364 = _362 != 0;
    float _366 = _324 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _368 = _248 ? as_type<int>(_312) : as_type<int>(_170);
    float _370 = _342 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _372 = _278 ? as_type<int>(_312) : as_type<int>(_170);
    bool _374 = !_352;
    int _376 = _374 ? 0 : 1;
    int _378 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _380 = _378 != 0;
    int _382 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _384 = _382 != 0;
    int _386 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _388 = _386 != 0;
    bool _390 = !_356;
    int _392 = _390 ? 0 : 1;
    float _394 = _388 ? as_type<float>(_344) : _170;
    bool _396 = _250 > 0.0;
    int _398 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _400 = _398 != 0;
    float _402 = _334 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _404 = _364 ? as_type<float>(_372) : _170;
    int _406 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _408 = _406 != 0;
    int _410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _412 = _410 != 0;
    int _414 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _416 = _414 != 0;
    float _418 = in.m_48.x;
    float _420 = in.m_48.y;
    float _422 = in.m_48.z;
    int _424 = ~as_type<int>(_402);
    int _426 = _424 + 1;
    int _428 = _426 + 1;
    int _430 = _428;
    float _432 = _402;
    if (!_396)
    {
        int _434 = ~as_type<int>(_402);
        int _436 = _434 + 1;
        _430 = _436;
    }
    int _438 = _430;
    float _440 = _400 ? as_type<float>(_368) : _170;
    int _442 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _444 = _442 != 0;
    float _446 = float(uint(_348));
    bool _448 = !_444;
    float _450 = _448 ? 1.2345600128173828125 : 1.0;
    float _452 = 1.0 / _446;
    bool _454 = !_444;
    float _456 = _454 ? _224 : _200;
    int _458 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1048576;
    bool _460 = _458 != 0;
    int _462 = ~_348;
    int _464 = _462 + 1;
    float _466 = _446;
    if (!_444)
    {
        _432 = _222;
    }
    float _468 = _432;
    float _470 = 0.0;
    float _472 = _468;
    if (!_444)
    {
        _470 = _224;
    }
    float _474 = _470;
    float _476 = 0.0;
    float _478 = _474;
    if (!_444)
    {
        _476 = _222;
    }
    float _480 = _476;
    float _482 = _420 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _484 = 0.0;
    float _486 = _480;
    if (_444)
    {
        _484 = _200;
    }
    float _488 = _484;
    float _490 = _420 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _492 = _488;
    if (_444)
    {
        _466 = _224;
    }
    float _494 = _466;
    float _496 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[4].x, _482);
    float _498 = _494;
    if (_444)
    {
        _472 = _224;
    }
    float _500 = _472;
    float _502 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[6].x, _490);
    if (_444)
    {
        _486 = _224;
    }
    float _504 = _486;
    float _506 = fma(_422, (*spvDescriptorSet0.vp_c10)._m0[4].z, _496);
    float _508 = _504;
    if (!_444)
    {
        _492 = _222;
    }
    float _510 = _492;
    if (_444)
    {
        _478 = _200;
    }
    float _512 = _478;
    float _514 = _506 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    if (!_444)
    {
        _498 = _200;
    }
    float _516 = _498;
    int _518 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _520 = _518 != 0;
    float _522 = _420 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _524 = as_type<int>(_452) + (-2);
    float _526 = _228 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _528 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[5].x, _522);
    float _530 = float(uint(_318));
    float _532 = _526 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _536 = _534 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _538 = as_type<float>(_524) * _530;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _542 = -_246;
    float _544 = fma((*spvDescriptorSet0.vp_c8)._m0[1].z, (*spvDescriptorSet0.vp_c8)._m0[28].x, _542);
    float _546 = (*spvDescriptorSet0.vp_c8)._m0[1].z * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _548 = trunc(_538);
    float _550 = precise::max(_548, 0.0);
    uint _553 = uint(_550);
    float _555 = fma(_302, -2.0, _540);
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _559 = _557 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _563 = _561 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _565 = fma(_422, (*spvDescriptorSet0.vp_c10)._m0[5].z, _528);
    float _567 = 1.0 / _536;
    float _569 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _573 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _571;
    out.m_65.w = _569;
    int _575 = _464 * int(_553);
    int _577 = _575 + _318;
    float _579 = 1.0 / _559;
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _583 = _581 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _585 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _587 = float(uint(_577));
    float _589 = -_546;
    float _591 = fma((*spvDescriptorSet0.vp_c8)._m0[1].y, (*spvDescriptorSet0.vp_c8)._m0[28].z, _589);
    float _593 = _573 * _567;
    float _595 = 1.0 / _563;
    float _597 = as_type<float>(_524) * _587;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _601 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _599;
    float _603 = _456 * _450;
    float _605 = _200 + _222;
    float _607 = _222 * 2.0;
    float _609 = float(_348);
    float _611 = (*spvDescriptorSet0.vp_c8)._m0[1].y * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _613 = trunc(_597);
    float _615 = precise::max(_613, 0.0);
    uint _617 = uint(_615);
    float _619 = _605 + (-1.0);
    float _621 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _585);
    int _623 = ~_348;
    int _625 = _623 + 1;
    float _627 = _224 * 2.0;
    float _629 = fma(_619, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _631 = _200 + _224;
    float _633 = floor(_607);
    float _635 = _124 * _609;
    float _637 = _601 * _579;
    float _639 = _583 * _595;
    float _641 = _631 + (-1.0);
    float _643 = _635 * _172;
    float _645 = _224 + _222;
    int _647 = int(_553) + int(_617);
    float _649 = floor(_627);
    float _651 = in.m_67.x;
    float _653 = in.m_67.y;
    float _655 = in.m_67.z;
    float _657 = -_611;
    float _659 = fma((*spvDescriptorSet0.vp_c8)._m0[1].x, (*spvDescriptorSet0.vp_c8)._m0[28].y, _657);
    int _661 = _625 * _647;
    int _663 = _661 + _318;
    bool _665 = !_412;
    int _667 = _665 ? 0 : 1;
    float _669 = _645 + (-1.0);
    float _671 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _621);
    float _673 = fma(_641, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _675 = uint(_663) >= uint(_348);
    float _677 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _679 = log2(_677);
    bool _681 = !_408;
    int _683 = _681 ? 0 : 1;
    float _685 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _687 = !_675;
    int _689 = _687 ? 0 : (-1);
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _693 = _633 > 0.0;
    float _695 = _222 + (-0.5);
    bool _697 = _633 >= 0.0;
    bool _699 = isnan(_633);
    bool _701 = _697 || _699;
    bool _703 = isnan(0.0);
    bool _705 = _701 || _703;
    float _707 = fma(_422, (*spvDescriptorSet0.vp_c10)._m0[6].z, _502);
    float _709 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _711 = !_416;
    int _713 = _711 ? 0 : 1;
    float _715 = _707 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _717 = _705 ? 0 : 1;
    float _719 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _651);
    bool _721 = _649 > 0.0;
    float _723 = _124 * _679;
    bool _725 = _649 >= 0.0;
    bool _727 = isnan(_649);
    bool _729 = _725 || _727;
    bool _731 = isnan(0.0);
    bool _733 = _729 || _731;
    float _735 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _653);
    float _737 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _655);
    float _739 = _719 * _532;
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _743 = _198 + _741;
    float _745 = exp2(_723);
    float _747 = _735 * _366;
    float _749 = _737 * _370;
    float _751 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _753 = _198 + _751;
    float _755 = _709 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _757 = fma(_637, _743, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _761 = _198 + _759;
    float _763 = fma(_639, _753, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _765 = fma(_755, _394, -0.5);
    int _767 = ~_717;
    int _769 = _767 + 1;
    int _771 = _769 + 1;
    float _773 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _775 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _777 = isnan(_198);
    bool _779 = _775 || _777;
    bool _781 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _783 = _779 || _781;
    float _785 = float(_783);
    float _787 = fma(_593, _761, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    int _789 = _771;
    float _791 = as_type<float>(_524);
    if (!_693)
    {
        int _793 = ~_717;
        int _795 = _793 + 1;
        _789 = _795;
    }
    int _797 = _789;
    float _799 = _200 * 6.283185482025146484375;
    bool _801 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _803 = isnan(_198);
    bool _805 = _801 || _803;
    bool _807 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _809 = _805 || _807;
    float _811 = float(_809);
    float _813 = -_745;
    float _815 = _813 + 1.0;
    bool _817 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _819 = isnan(_198);
    bool _821 = _817 || _819;
    bool _823 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _825 = _821 || _823;
    float _827 = float(_825);
    float _829 = -_785;
    float _831 = _829 + 1.0;
    bool _833 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _835 = isnan(_198);
    bool _837 = _833 || _835;
    bool _839 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _841 = _837 || _839;
    float _843 = float(_841);
    float _845 = floor(_603);
    bool _847 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _849 = isnan(0.0);
    bool _851 = _847 || _849;
    bool _853 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _855 = _851 || _853;
    float _857 = fma(_124, 0.02999999932944774627685546875, _799);
    float _859 = _843 * _831;
    float _861 = _855 ? _815 : 0.0;
    float _863 = -_843;
    float _865 = _863 + 1.0;
    bool _867 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _869 = isnan(1.0);
    bool _871 = _867 || _869;
    bool _873 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _875 = _871 || _873;
    float _877 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _879 = 1.0 + _877;
    float _881 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[78].w, _691);
    float _883 = _773 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _885 = 1.0 / _879;
    float _887 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _881);
    float _889 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _555);
    float _891 = _827 * _865;
    float _893 = -_827;
    float _895 = _893 + 1.0;
    float _897 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _899 = -_889;
    float _901 = fma(_887, _765, _899);
    float _903 = _510 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _905 = _811 * _895;
    float _907 = _857 * 0.15915493667125701904296875;
    float _909 = -_845;
    float _911 = _603 + _909;
    float _913 = -_897;
    float _915 = fma(_903, 2.0, _913);
    float _917 = _757 * _905;
    float _919 = _907 * 6.283185482025146484375;
    float _921 = sin(_919);
    float _923 = in.m_69.x;
    float _925 = in.m_69.y;
    float _927 = in.m_69.z;
    float _929 = _861 * _885;
    float _931 = _733 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _933 = fma(_883, _404, -0.5);
    bool _935 = _653 != 0.0;
    bool _937 = isnan(_653);
    bool _939 = _935 || _937;
    bool _941 = isnan(0.0);
    bool _943 = _939 || _941;
    float _945 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _947 = -_170;
    float _949 = _947 + (*spvDescriptorSet0.vp_c9)._m0[193].x;
    bool _951 = _651 == 0.0;
    bool _953 = !_943;
    bool _955 = _951 && _953;
    float _957 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[83].z, _945);
    float _959 = _512 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _961 = -_811;
    float _963 = _961 + 1.0;
    bool _965 = _655 == 0.0;
    bool _967 = _965 && _955;
    float _969 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _971 = _921 * _949;
    float _973 = fma(_963, (*spvDescriptorSet0.vp_c9)._m0[115].x, _917);
    float _975 = float(_318);
    float _977 = -_969;
    float _979 = fma(_959, 2.0, _977);
    float _981 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _983 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _985 = _609 * _911;
    bool _987 = _975 >= _609;
    bool _989 = isnan(_975);
    bool _991 = _987 || _989;
    bool _993 = isnan(_609);
    bool _995 = _991 || _993;
    float _997 = float(_995);
    float _999 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[83].w, _981);
    int _1001 = ~as_type<int>(_931);
    int _1003 = _1001 + 1;
    int _1005 = _1003 + 1;
    float _1007 = _544 * _544;
    float _1009 = _911;
    int _1011 = _1005;
    float _1013 = _931;
    float _1015 = _865;
    float _1017 = _923;
    float _1019 = _925;
    bool _1021 = _967;
    if (_967)
    {
        _1009 = _923;
    }
    float _1023 = _1009;
    float _1025 = _276 * _971;
    float _1027 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1029 = _1023;
    if (!_721)
    {
        int _1031 = ~as_type<int>(_931);
        int _1033 = _1031 + 1;
        _1011 = _1033;
    }
    int _1035 = _1011;
    float _1037 = fma(_763, _891, _973);
    if (_967)
    {
        _1013 = _925;
    }
    float _1039 = _1013;
    float _1041 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[85].x, -0.5);
    float _1043 = _1039;
    if (_967)
    {
        _508 = _1023;
    }
    float _1045 = _508;
    float _1047 = -_124;
    float _1049 = fma(_1047, (*spvDescriptorSet0.vp_c9)._m0[81].x, _979);
    float _1051 = _1045;
    if (_967)
    {
        _1015 = _927;
    }
    float _1053 = _1015;
    float _1055 = _983 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1057 = _1053;
    if (!_967)
    {
        _1029 = _923;
    }
    float _1059 = _1029;
    float _1061 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1063 = _514 + _1061;
    float _1065 = _1063;
    if (_967)
    {
        _1017 = _1039;
    }
    float _1067 = _1017;
    float _1069 = fma(_1055, _284, -0.5);
    float _1071 = _1067;
    if (!_967)
    {
        _1043 = _925;
    }
    float _1073 = _1043;
    if (!_967)
    {
        float _1075 = fma(_651, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1059);
        _1051 = _1075;
    }
    float _1077 = _1051;
    if (_967)
    {
        _1019 = _1053;
    }
    float _1079 = _1019;
    float _1081 = _1027 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1083 = _1079;
    if (!_967)
    {
        _1057 = _927;
    }
    float _1085 = _1057;
    float _1087 = fma(_591, _591, _1007);
    float _1089 = fma(_1081, _340, -0.5);
    float _1091 = _500 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1093 = fma(_659, _659, _1087);
    float _1095 = -_715;
    float _1097 = _1095 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1099 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (!_967)
    {
        float _1101 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1085);
        _1083 = _1101;
    }
    float _1103 = _1083;
    if (!_967)
    {
        float _1105 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1073);
        _1071 = _1105;
    }
    float _1107 = _1071;
    float _1109 = abs(_1063);
    float _1111 = abs(_1097);
    float _1113 = precise::max(_1109, _1111);
    float _1115 = fma(_200, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1099);
    float _1117 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1119 = rsqrt(_1093);
    bool _1121 = _1113 >= 16.0;
    float _1123 = -_124;
    float _1125 = fma(_1123, (*spvDescriptorSet0.vp_c9)._m0[76].x, _360);
    float _1127 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].z, _957);
    float _1129 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1115);
    float _1131 = fma(_200, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1117);
    int _1133 = abs(_683);
    float _1135 = fma(_1127, _1041, _1049);
    float _1137 = fma(_1129, _1069, _1125);
    float _1139 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1131);
    float _1141 = in.m_71.x;
    float _1143 = in.m_71.y;
    float _1145 = in.m_71.z;
    float _1147 = in.m_71.w;
    float _1149 = float(_797);
    float _1151 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[85].y, -0.5);
    float _1153 = trunc(_997);
    int _1155 = int(_1153);
    float _1157 = _544 * _1119;
    float _1159 = -_124;
    float _1161 = fma(_1159, (*spvDescriptorSet0.vp_c9)._m0[86].x, _915);
    int _1163 = abs(_667);
    float _1165 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _1167 = abs(_713);
    float _1169 = fma(_1139, _1089, _1161);
    float _1171 = _516 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1173 = float(_1163);
    float _1175 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1177 = float(_1133);
    float _1179 = fma(_1091, -2.0, _1165);
    float _1181 = float(_438);
    float _1183 = fma(_1171, -2.0, _1175);
    float _1185 = _1177 * _1149;
    float _1187 = float(_1035);
    float _1189 = trunc(_985);
    int _1191 = int(_1189);
    float _1193 = _1145 * _1059;
    float _1195 = float(_1167);
    float _1197 = _1173 * _1181;
    float _1199 = _1141 * _1073;
    float _1201 = -_1193;
    float _1203 = fma(_1141, _1085, _1201);
    float _1205 = _1143 * _1085;
    float _1207 = _1195 * _1187;
    float _1209 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].w, _999);
    float _1211 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1179);
    float _1213 = -_1205;
    float _1215 = fma(_1145, _1073, _1213);
    int _1217 = abs(_322);
    float _1219 = rsqrt(_671);
    float _1221 = -_1211;
    float _1223 = fma(_1209, _1151, _1221);
    float _1225 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1227 = fma(_787, _859, _1037);
    int _1229 = ~_647;
    int _1231 = _1229 + _689;
    int _1233 = _1231 + 1;
    float _1235 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1225);
    bool _1237 = !_875;
    float _1239 = _1237 ? _124 : _929;
    int _1241 = _1191 * _1217;
    int _1243 = _1241 + _318;
    bool _1245 = _348 == 0;
    int _1247 = _348 * _1233;
    int _1249 = _1247 + _318;
    float _1251 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1235);
    float _1253 = -_1199;
    float _1255 = fma(_1143, _1059, _1253);
    int _1257 = ~_1155;
    int _1259 = _1257 + 1;
    int _1261 = _1259 + 1;
    float _1263 = fma(_785, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1227);
    bool _1265 = !_1245;
    int _1267 = _1265 ? _1249 : (-1);
    float _1269 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1183);
    float _1271 = _1219 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1273 = _1203 * _1147;
    float _1275 = _1215 * _1147;
    float _1277 = _1255 * _1147;
    float _1279 = _1185 * (-2.0);
    float _1281 = trunc(_643);
    int _1283 = int(_1281);
    int _1285 = _1267 * _1261;
    int _1287 = _348 + (-1);
    float _1289 = _1271 * (-0.699999988079071044921875);
    float _1291 = fma(_673, _1279, _673);
    int _1293 = abs(_392);
    float _1295 = _200 + (-0.5);
    int _1297 = _1155 * _1287;
    int _1299 = _1297 + _1285;
    float _1301 = _1289 * 0.15915493667125701904296875;
    bool _1303 = !_380;
    int _1305 = _1303 ? 0 : 1;
    float _1307 = _591 * _1119;
    int _1309 = abs(_376);
    int _1311 = _1299 * _1293;
    bool _1313 = !_384;
    int _1315 = _1313 ? 0 : 1;
    float _1317 = _1207 * (-2.0);
    int _1319 = abs(_1305);
    float _1321 = _1295 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _1323 = _659 * _1119;
    int _1325 = abs(_1315);
    float _1327 = fma(_629, _1317, _629);
    int _1329 = _1283 * _1309;
    int _1331 = _1329 + _1311;
    float _1333 = _1157 * _1157;
    float _1335 = float(uint(_1243));
    int _1337 = _1243 * _1319;
    int _1339 = _1337 + _1331;
    float _1341 = fma(_1239, _1291, _1321);
    float _1343 = fma(_1307, _1307, _1333);
    float _1345 = _1197 * (-2.0);
    int _1347 = _1191 * _1325;
    int _1349 = _1347 + _1339;
    float _1351 = as_type<float>(_524) * _1335;
    float _1353 = _1135 + 0.5;
    float _1355 = _1097 * 0.0625;
    float _1357 = _1107;
    float _1359 = _1273;
    float _1361 = _1277;
    if (_1121)
    {
        float _1363 = _1063 * 0.0625;
        _1065 = _1363;
    }
    float _1365 = _1065;
    float _1367 = float(uint(_1349));
    float _1369 = fma(_1323, _1323, _1343);
    float _1371 = _901 + 0.5;
    float _1373 = _1137 + 0.5;
    float _1375 = _1223 + 0.5;
    float _1377 = as_type<float>(_524) * _1367;
    float _1379 = fma(_685, _1345, _685);
    int _1381 = ~_348;
    int _1383 = _1381 + 1;
    float _1385 = trunc(_1351);
    float _1387 = precise::max(_1385, 0.0);
    uint _1389 = uint(_1387);
    float _1391 = _1121 ? _1355 : _1097;
    out.m_73.x = _1373;
    out.m_73.y = _1371;
    out.m_73.z = _1353;
    out.m_73.w = _1375;
    float _1393 = abs(_1365);
    bool _1395 = _1393 != 0.0;
    bool _1397 = isnan(_1393);
    bool _1399 = _1395 || _1397;
    bool _1401 = isnan(0.0);
    bool _1403 = _1399 || _1401;
    float _1405 = _224 + (-0.5);
    float _1407 = _695 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    float _1409 = _1341 * 0.15915493667125701904296875;
    float _1411 = abs(_1391);
    bool _1413 = _1411 == 0.0;
    bool _1415 = !_1403;
    bool _1417 = _1413 && _1415;
    float _1419 = trunc(_1377);
    float _1421 = precise::max(_1419, 0.0);
    uint _1423 = uint(_1421);
    float _1425 = fma(_1239, _1327, _1407);
    float _1427 = -_1269;
    float _1429 = fma(_1251, _933, _1427);
    float _1431 = _1425 * 0.15915493667125701904296875;
    float _1433 = _1405 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    int _1435 = ~_348;
    int _1437 = _1435 + 1;
    float _1439 = _1409 * 6.283185482025146484375;
    float _1441 = sin(_1439);
    int _1443 = as_type<int>(_1409);
    if (_1417)
    {
        bool _1445 = as_type<int>(_1391) >= 0;
        _1021 = _1445;
    }
    bool _1447 = _1021;
    float _1449 = fma(_1239, _1379, _1433);
    int _1451 = _1383 * int(_1423);
    int _1453 = _1451 + _1349;
    float _1455 = _1409 * 6.283185482025146484375;
    float _1457 = cos(_1455);
    int _1459 = _1437 * int(_1389);
    int _1461 = _1459 + _1243;
    float _1463 = float(uint(_1453));
    float _1465 = as_type<float>(_524) * _1463;
    float _1467 = _1301 * 6.283185482025146484375;
    float _1469 = sin(_1467);
    if (_1417)
    {
        int _1471 = _1447 ? 0 : 1078530011;
        _1443 = _1471;
    }
    int _1473 = _1443;
    float _1475 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1477 = abs(_1391);
    bool _1479 = _1477 == 0.0;
    float _1481 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1483 = _1475 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1485 = _1301 * 6.283185482025146484375;
    float _1487 = cos(_1485);
    float _1489 = _1481 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1491 = _1431 * 6.283185482025146484375;
    float _1493 = cos(_1491);
    float _1495 = trunc(_1465);
    float _1497 = precise::max(_1495, 0.0);
    uint _1499 = uint(_1497);
    float _1501 = rsqrt(_1369);
    float _1503 = float(uint(_1461));
    float _1505 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1507 = _1263 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1509 = as_type<float>(_524) * _1503;
    float _1511 = _1505 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1513 = _1479 ? (-1) : 0;
    int _1515 = _1473;
    if (_1417)
    {
        int _1517 = int(0x80000000) & as_type<int>(_1365);
        int _1519 = _1473 | _1517;
        _791 = as_type<float>(_1519);
    }
    float _1521 = _791;
    bool _1523 = !_1403;
    bool _1525 = _1523 && _1479;
    float _1527 = _1521;
    float _1529 = _1521;
    if (!_1525)
    {
        float _1531 = abs(_1365);
        bool _1533 = _1531 != as_type<float>(0x7f800000u /* inf */);
        bool _1535 = isnan(_1531);
        bool _1537 = _1533 || _1535;
        bool _1539 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1541 = _1537 || _1539;
        float _1543 = abs(_1391);
        bool _1545 = _1543 == as_type<float>(0x7f800000u /* inf */);
        float _1547 = abs(_1391);
        bool _1549 = _1547 == as_type<float>(0x7f800000u /* inf */);
        bool _1551 = !_1541;
        bool _1553 = _1549 && _1551;
        if (_1553)
        {
            bool _1555 = as_type<int>(_1391) >= 0;
            _1513 = _1555 ? (-1) : 0;
        }
        int _1557 = _1513;
        if (_1553)
        {
            _1515 = 1075235812;
        }
        int _1559 = _1515;
        int _1561 = _1559;
        if (_1553)
        {
            int _1563 = ~_1557;
            int _1565 = (_1563 != 0) ? _1559 : 1061752795;
            _1561 = _1565;
        }
        int _1567 = _1561;
        if (_1553)
        {
            int _1569 = int(0x80000000) & as_type<int>(_1365);
            int _1571 = _1567 | _1569;
            _1527 = as_type<float>(_1571);
        }
        float _1573 = _1527;
        bool _1575 = !_1541;
        bool _1577 = _1575 && _1545;
        _1529 = _1573;
        if (!_1577)
        {
            float _1579 = abs(_1365);
            float _1581 = abs(_1391);
            float _1583 = precise::max(_1579, _1581);
            float _1585 = abs(_1365);
            float _1587 = abs(_1391);
            float _1589 = precise::min(_1585, _1587);
            float _1591 = 1.0 / _1583;
            float _1593 = abs(_1365);
            float _1595 = abs(_1391);
            bool _1597 = _1593 > _1595;
            bool _1599 = as_type<int>(_1391) >= 0;
            float _1601 = _1589 * _1591;
            float _1603 = abs(_1365);
            float _1605 = abs(_1391);
            float _1607 = _1603 + _1605;
            int _1609 = as_type<int>(_1365) & int(0x80000000);
            float _1611 = _1601 * _1601;
            bool _1613 = _1607 > as_type<float>(0x7f800000u /* inf */);
            bool _1615 = isnan(_1607);
            bool _1617 = _1613 || _1615;
            bool _1619 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1621 = _1617 || _1619;
            float _1623 = _1611 + 11.33538818359375;
            float _1625 = fma(_1611, _1623, 28.84246826171875);
            float _1627 = fma(_1611, _1625, 19.6966705322265625);
            float _1629 = fma(_1611, -0.82336294651031494140625, -5.674867153167724609375);
            float _1631 = fma(_1611, _1629, -6.565555095672607421875);
            float _1633 = 1.0 / _1627;
            float _1635 = _1611 * _1631;
            float _1637 = _1601 * _1635;
            float _1639 = fma(_1637, _1633, _1601);
            float _1641 = _1639;
            _1529 = _1607;
            if (_1597)
            {
                float _1643 = -_1639;
                float _1645 = _1643 + 1.57079637050628662109375;
                _1641 = _1645;
            }
            float _1647 = _1641;
            int _1649 = as_type<int>(_1647);
            if (!_1599)
            {
                float _1651 = -_1647;
                float _1653 = _1651 + 3.1415927410125732421875;
                _1649 = as_type<int>(_1653);
            }
            int _1655 = _1649;
            if (!_1621)
            {
                int _1657 = _1609 | _1655;
                _1529 = as_type<float>(_1657);
            }
        }
    }
    float _1659 = _1529;
    float _1661 = -_1659;
    float _1663 = _1449 + _1661;
    int _1665 = ~_348;
    int _1667 = _1665 + 1;
    float _1669 = _1323 * _1501;
    int _1671 = int(_1423) + int(_1499);
    float _1673 = _1663 * 0.15915493667125701904296875;
    float _1675 = _1307 * _1501;
    float _1677 = -_1487;
    float _1679 = _1677 + 1.0;
    float _1681 = _1157 * _1501;
    float _1683 = _1673 * 6.283185482025146484375;
    float _1685 = sin(_1683);
    int _1687 = _1667 * _1671;
    int _1689 = _1687 + _1349;
    out.m_75.x = _1483;
    out.m_75.y = _1511;
    out.m_75.z = _1489;
    out.m_75.w = _1507;
    float _1691 = _1675 * _1679;
    float _1693 = _1675 * _1469;
    float _1695 = _565 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1697 = uint(_1689) >= uint(_348);
    float _1699 = fma(_1675, _1691, _1487);
    float _1701 = _1673 * 6.283185482025146484375;
    float _1703 = cos(_1701);
    float _1705 = _1681 * _1469;
    float _1707 = _1431 * 6.283185482025146484375;
    float _1709 = sin(_1707);
    float _1711 = _1669 * _1469;
    float _1713 = -_1705;
    float _1715 = fma(_1669, _1691, _1713);
    float _1717 = fma(_1669, _1691, _1705);
    float _1719 = fma(_1681, _1691, _1711);
    float _1721 = -_1711;
    float _1723 = fma(_1681, _1691, _1721);
    float _1725 = _1681 * _1679;
    bool _1727 = !_1697;
    int _1729 = _1727 ? 0 : (-1);
    float _1731 = _1669 * _1669;
    float _1733 = trunc(_1509);
    float _1735 = precise::max(_1733, 0.0);
    uint _1737 = uint(_1735);
    float _1739 = fma(_1669, _1725, _1693);
    float _1741 = -_1693;
    float _1743 = fma(_1669, _1725, _1741);
    float _1745 = fma(_1681, _1725, _1487);
    float _1747 = fma(_1679, _1731, _1487);
    float _1749 = _1441 * _1703;
    float _1751 = _1457 * _1703;
    float _1753 = _1441 * _1685;
    float _1755 = _1441 * _1493;
    int _1757 = ~_1671;
    int _1759 = _1757 + _1729;
    int _1761 = _1759 + 1;
    float _1763 = _1457 * _1685;
    float _1765 = _1457 * _1493;
    float _1767 = _1685 * _1493;
    float _1769 = fma(_1709, _1751, _1753);
    int _1771 = _348 * _1761;
    int _1773 = _1771 + _1349;
    float _1775 = -_1763;
    float _1777 = fma(_1709, _1749, _1775);
    float _1779 = -_1749;
    float _1781 = fma(_1709, _1763, _1779);
    float _1783 = _1765 * _747;
    float _1785 = fma(_1709, _1753, _1751);
    bool _1787 = !_1245;
    int _1789 = _1787 ? _1773 : (-1);
    float _1791 = _1703 * _1493;
    float _1793 = -_747;
    float _1795 = _1709 * _1793;
    float _1797 = fma(_1769, _739, _1783);
    float _1799 = _1755 * _747;
    int _1801 = _1789 >> 31;
    float _1803 = fma(_1791, _739, _1795);
    float _1805 = fma(_1781, _749, _1797);
    float _1807 = fma(_1777, _739, _1799);
    int _1809 = _1801 & 3;
    float _1811 = fma(_1767, _749, _1803);
    float _1813 = _1695 + _1805;
    float _1815 = fma(_1785, _749, _1807);
    int _1817 = _1789 + _1809;
    float _1819 = _514 + _1811;
    float _1821 = fma(_1157, _1025, _1813);
    float _1823 = _715 + _1815;
    int _1825 = _1817 >> 2;
    float _1827 = fma(_1307, _1025, _1819);
    float _1829 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1831 = _1821 + _1829;
    float _1833 = fma(_1323, _1025, _1823);
    int _1835 = _1825 << 4;
    int _1837 = _1835 + 512;
    float _1839 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1841 = _1827 + _1839;
    float _1843 = _1745 * _1831;
    float _1845 = _1723 * _1831;
    float _1847 = _1739 * _1831;
    float _1849 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1851 = _1833 + _1849;
    float _1853 = fma(_1719, _1841, _1843);
    float _1855 = fma(_1699, _1841, _1845);
    float _1857 = fma(_1715, _1841, _1847);
    uint _1859 = uint(int(uint(_1837) >> uint(2)));
    uint _1861 = uint(int(uint(int(_1859)) >> uint(2)));
    int _1863 = int(_1859) & 3;
    float _1865 = (*spvDescriptorSet0.vp_c9)._m0[int(_1861)][_1863];
    int _1867 = int(_1859) + 1;
    uint _1869 = uint(int(uint(_1867) >> uint(2)));
    int _1871 = _1867 & 3;
    float _1873 = (*spvDescriptorSet0.vp_c9)._m0[int(_1869)][_1871];
    float _1875 = fma(_1743, _1851, _1853);
    float _1877 = fma(_1717, _1851, _1855);
    float _1879 = fma(_1747, _1851, _1857);
    int _1881 = int(_1389) + int(_1737);
    float _1883 = _1875 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1885 = _1875 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    int _1887 = ~_348;
    int _1889 = _1887 + 1;
    int _1891 = _1837 + 8;
    uint _1893 = uint(int(uint(_1891) >> uint(2)));
    uint _1895 = uint(int(uint(int(_1893)) >> uint(2)));
    int _1897 = int(_1893) & 3;
    float _1899 = (*spvDescriptorSet0.vp_c9)._m0[int(_1895)][_1897];
    int _1901 = int(_1893) + 1;
    uint _1903 = uint(int(uint(_1901) >> uint(2)));
    int _1905 = _1901 & 3;
    float _1907 = (*spvDescriptorSet0.vp_c9)._m0[int(_1903)][_1905];
    float _1909 = fma(_1877, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1883);
    float _1911 = fma(_1877, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1885);
    float _1913 = -_1107;
    float _1915 = _1709 * _1913;
    float _1917 = -_1273;
    float _1919 = _1709 * _1917;
    float _1921 = fma(_1879, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1909);
    float _1923 = _1765 * _1107;
    float _1925 = _1755 * _1107;
    float _1927 = _1875 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1929 = fma(_1879, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1911);
    float _1931 = _1921 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _1933 = _1765 * _1273;
    float _1935 = fma(_1877, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1927);
    float _1937 = _1755 * _1273;
    float _1939 = -_1143;
    float _1941 = _1709 * _1939;
    float _1943 = _1765 * _1143;
    float _1945 = fma(_1879, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1935);
    int _1947 = _1889 * _1881;
    int _1949 = _1947 + _1243;
    float _1951 = _1755 * _1143;
    float _1953 = _1929 * (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _1955 = _1931 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1957 = _1931 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1959 = _1945 * (*spvDescriptorSet0.vp_c7)._m0[0].z;
    bool _1961 = uint(_1949) >= uint(_348);
    float _1963 = fma(_1953, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1955);
    float _1965 = fma(_1953, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1957);
    float _1967 = _1963;
    if (!_460)
    {
        _1357 = 0.0;
    }
    float _1969 = _1357;
    float _1971 = fma(_1959, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1963);
    float _1973 = _1969;
    if (!_460)
    {
        _1359 = 0.0;
    }
    float _1975 = _1359;
    float _1977 = fma(_1959, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1965);
    bool _1979 = !_1961;
    int _1981 = _1979 ? 0 : (-1);
    float _1983 = _1975;
    if (!_460)
    {
        _1967 = 0.0;
    }
    float _1985 = _1967;
    bool _1987 = !_460;
    float _1989 = _1985;
    if (!_1987)
    {
        float _1991 = -_1695;
        float _1993 = _1991 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1995 = -_514;
        float _1997 = _1995 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1999 = _1993 * _1993;
        float _2001 = fma(_1997, _1997, _1999);
        float _2003 = fma(_1097, _1097, _2001);
        float _2005 = rsqrt(_2003);
        float _2007 = _2005 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
        float _2009 = _1997 * _2007;
        float _2011 = _1993 * _2007;
        float _2013 = _1097 * _2007;
        _1989 = _2013;
        _1973 = _2009;
        _1983 = _2011;
    }
    float _2015 = _1989;
    float _2017 = _1973;
    float _2019 = _1983;
    int _2021 = ~_1881;
    int _2023 = _2021 + _1981;
    int _2025 = _2023 + 1;
    float _2027 = _1977 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _2029 = _1971 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    int _2031 = _1789 & 3;
    float _2033 = fma(_1791, _1077, _1915);
    float _2035 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2037 = _2027 + _2035;
    float _2039 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2041 = _2029 + _2039;
    bool _2043 = uint(_2031) > 1u;
    float _2045 = fma(_1791, _1141, _1941);
    int _2047 = _1789 & 3;
    bool _2049 = _2047 != 0;
    float _2051 = _2037 * _2037;
    float _2053 = _2041 * _2041;
    float _2055 = fma(_1791, _1275, _1919);
    int _2057 = _2049 ? 0 : 1;
    int _2059 = _348 * _2025;
    int _2061 = _2059 + _1243;
    float _2063 = _2051 + _2053;
    bool _2065 = _2031 != 3;
    float _2067 = _1931 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    int _2069 = ~_2057;
    int _2071 = _2069 + 1;
    int _2073 = _2071 + 1;
    float _2075 = sqrt(_2063);
    int _2077 = _2073;
    float _2079 = _2051;
    float _2081 = _2053;
    float _2083 = _2027;
    float _2085 = _2029;
    float _2087 = _2017;
    float _2089 = _2015;
    if (!_2043)
    {
        int _2091 = ~_2057;
        int _2093 = _2091 + 1;
        _2077 = _2093;
    }
    int _2095 = _2077;
    float _2097 = fma(_1769, _1077, _1923);
    bool _2099 = uint(_2031) >= 2u;
    float _2101 = fma(_1953, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2067);
    int _2103 = abs(_2095);
    float _2105 = fma(_1777, _1077, _1925);
    int _2107 = _2099 ? 0 : 1;
    float _2109 = fma(_1959, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2101);
    bool _2111 = !_2049;
    int _2113 = _2111 ? 0 : 1;
    float _2115 = _2109 + (*spvDescriptorSet0.vp_c10)._m0[9].w;
    int _2117 = ~_2107;
    int _2119 = _2117 + 1;
    int _2121 = _2119 + 1;
    int _2123 = abs(_2113);
    int _2125 = _2121;
    float _2127 = _2097;
    if (_2065)
    {
        int _2129 = ~_2107;
        int _2131 = _2129 + 1;
        _2125 = _2131;
    }
    int _2133 = _2125;
    int _2135 = ~_2103;
    int _2137 = _2135 + 1;
    int _2139 = _2137 + 1;
    bool _2141 = _2075 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _2143 = abs(_2133);
    int _2145 = _2139 * as_type<int>(_1873);
    int _2147 = ~_2123;
    int _2149 = _2147 + 1;
    int _2151 = _2149 + 1;
    bool _2153 = _2031 != 3;
    int _2155 = ~_2143;
    int _2157 = _2155 + 1;
    int _2159 = _2157 + 1;
    int _2161 = _2151 * as_type<int>(_1865);
    int _2163 = _2161 + _2145;
    bool _2165 = !_520;
    int _2167 = _2165 ? 0 : 1;
    bool _2169 = !_2153;
    int _2171 = _2169 ? 0 : (-1);
    int _2173 = _2159 * as_type<int>(_1899);
    int _2175 = _2173 + _2163;
    int _2177 = abs(_2167);
    int _2179 = abs(_2171);
    int _2181 = ~_2179;
    int _2183 = _2181 + 1;
    int _2185 = _2183 + 1;
    float _2187 = as_type<float>(_2177);
    if (!_2141)
    {
        _2187 = _2115;
    }
    float _2189 = _2187;
    bool _2191 = !_2141;
    float _2193 = _2189;
    if (!_2191)
    {
        float _2195 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2197 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2199 = _2075 + _2197;
        float _2201 = rsqrt(_2063);
        float _2203 = _2199 * _2195;
        float _2205 = _2115 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2207 = _2203 * 0.15915493667125701904296875;
        float _2209 = _2207 * 6.283185482025146484375;
        float _2211 = sin(_2209);
        float _2213 = _2207 * 6.283185482025146484375;
        float _2215 = cos(_2213);
        float _2217 = fma(_2211, _2205, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2219 = _2201 * _2217;
        float _2221 = fma(_2037, _2219, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2223 = _2215 + (-1.0);
        float _2225 = fma(_2041, _2219, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2227 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2229 = _2221 + _2227;
        float _2231 = _2223 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2233 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2235 = _2225 + _2233;
        float _2237 = _2229 * _2229;
        float _2239 = fma(_2115, _2215, _2231);
        float _2241 = _2235 * _2235;
        _2193 = _2239;
        _2079 = _2237;
        _2081 = _2241;
        _2083 = _2221;
        _2085 = _2225;
    }
    float _2243 = _2193;
    float _2245 = _2079;
    float _2247 = _2081;
    float _2249 = _2083;
    float _2251 = _2085;
    float _2253 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2255 = _2243 + _2253;
    int _2257 = _2185 * as_type<int>(_1907);
    int _2259 = _2257 + _2175;
    int _2261 = ~_2177;
    int _2263 = _2261 + 1;
    int _2265 = _2263 + 1;
    float _2267 = fma(_1769, _1275, _1933);
    float _2269 = fma(_2255, _2255, _2245);
    float _2271 = fma(_1777, _1275, _1937);
    bool _2273 = !_1245;
    int _2275 = _2273 ? _2061 : (-1);
    int _2277 = _2259 * _2265;
    float _2279 = _2269 + _2247;
    float _2281 = fma(_1769, _1141, _1943);
    float _2283 = fma(_1777, _1141, _1951);
    int _2285 = _2275 * _2177;
    int _2287 = _2285 + _2277;
    float _2289 = fma(_1767, _1103, _2033);
    float _2291 = fma(_1767, _1277, _2055);
    float _2293 = sqrt(_2279);
    float _2295 = fma(_1767, _1145, _2045);
    float _2297 = fma(_1781, _1145, _2281);
    float _2299 = fma(_1781, _1277, _2267);
    float _2301 = fma(_1785, _1277, _2271);
    float _2303 = _1169 + 0.5;
    float _2305 = _1429 + 0.5;
    float _2307 = fma(_1781, _1103, _2097);
    float _2309 = fma(_1785, _1145, _2283);
    float _2311 = float(_2287);
    float _2313 = fma(_1785, _1103, _2105);
    out.m_77.x = _2303;
    out.m_77.y = _2305;
    out.m_79.x = _2291;
    out.m_79.y = _2299;
    out.m_79.z = _2301;
    bool _2315 = _2293 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2317 = isnan(_2293);
    bool _2319 = _2315 || _2317;
    bool _2321 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2323 = _2319 || _2321;
    out.m_81.x = _2295;
    out.m_81.y = _2297;
    out.m_81.z = _2309;
    out.m_83.y = _2311;
    out.m_85.x = _2289;
    out.m_85.y = _2307;
    out.m_85.z = _2313;
    float _2325 = _2271;
    if (!_2323)
    {
        _2325 = 1.0;
    }
    float _2327 = _2325;
    bool _2329 = !_2323;
    float _2331 = _2327;
    if (!_2329)
    {
        bool _2333 = _2293 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2335 = isnan(_2293);
        bool _2337 = _2333 || _2335;
        bool _2339 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2341 = _2337 || _2339;
        if (!_2341)
        {
            float _2343 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2345 = _2293 + _2343;
            float _2347 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2349 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2347;
            float _2351 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2353 = _2351 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2355 = 1.0 / _2349;
            float _2357 = _2345 * _2355;
            float _2359 = fma(_2357, _2353, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2331 = _2359;
            _2361 = true;
        }
        else
        {
            bool _2363 = _2293 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2365 = isnan(_2293);
            bool _2367 = _2363 || _2365;
            bool _2369 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2371 = _2367 || _2369;
            if (!_2371)
            {
                float _2373 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2375 = _2293 + _2373;
                float _2377 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2379 = _2377 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2381 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2383 = _2381 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2385 = 1.0 / _2379;
                float _2387 = _2375 * _2385;
                float _2389 = fma(_2387, _2383, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2331 = _2389;
                _2361 = true;
            }
            else
            {
                _2331 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2361 = false;
    float _2391 = _2331;
    float _2393 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2395 = _2243 + _2393;
    float _2397 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2399 = _2249 + _2397;
    float _2401 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2403 = _2251 + _2401;
    float _2405 = _715 + _2015;
    float _2407 = fma(_2395, _2391, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2409 = fma(_2399, _2391, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2411 = fma(_2403, _2391, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2413 = _514 + _2017;
    float _2415 = _2407 + _2019;
    float _2417 = _2409 + _2017;
    float _2419 = _2411 + _2015;
    float _2421 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2423 = _2415 + _2421;
    float _2425 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2427 = _2417 + _2425;
    float _2429 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2431 = _2419 + _2429;
    float _2433 = _2415 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2435 = _2423 * _2423;
    float _2437 = fma(_2417, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2433);
    float _2439 = fma(_2427, _2427, _2435);
    float _2441 = fma(_2419, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2437);
    float _2443 = fma(_2431, _2431, _2439);
    float _2445 = rsqrt(_2443);
    float _2447 = sqrt(_2443);
    float _2449 = _2445 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2451 = _2427 * _2449;
    float _2453 = _2431 * _2449;
    float _2455 = _2451 * _2451;
    float _2457 = _2453 * _2453;
    float _2459 = _2455 + _2457;
    float _2461 = sqrt(_2459);
    bool _2463 = _2461 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2465 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2467 = _2461 + _2465;
    float _2469 = _2295;
    float _2471 = _2467;
    float _2473 = _2423;
    if (_2463)
    {
        float _2475 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2469 = _2475;
    }
    float _2477 = _2469;
    if (!_2463)
    {
        _2087 = _2453;
    }
    float _2479 = _2087;
    float _2481 = _2479;
    if (_2463)
    {
        float _2483 = rsqrt(_2459);
        _1361 = _2483;
    }
    float _2485 = _1361;
    float _2487 = _2485;
    if (_2463)
    {
        float _2489 = _2467 * _2477;
        _2471 = _2489;
    }
    float _2491 = _2471;
    if (_2463)
    {
        float _2493 = _2491 * 0.15915493667125701904296875;
        _2127 = _2493;
    }
    float _2495 = _2127;
    float _2497 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2499 = _2309;
    float _2501 = _2497;
    float _2503 = _2495;
    if (_2463)
    {
        float _2505 = _2495 * 6.283185482025146484375;
        float _2507 = sin(_2505);
        _2499 = _2507;
    }
    float _2509 = _2499;
    float _2511 = precise::max(0.0, _2497);
    float _2513 = _2297;
    if (_2463)
    {
        float _2515 = _2495 * 6.283185482025146484375;
        float _2517 = cos(_2515);
        _2513 = _2517;
    }
    float _2519 = _2513;
    float _2521 = -_2449;
    float _2523 = -_2511;
    float _2525 = fma(_2423, _2521, _2523);
    if (_2463)
    {
        float _2527 = _2525 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2501 = _2527;
    }
    float _2529 = _2501;
    float _2531 = fma(_2413, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2533 = _2509;
    float _2535 = _2529;
    if (_2463)
    {
        float _2537 = fma(_2509, _2529, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2533 = _2537;
    }
    float _2539 = _2533;
    float _2541 = _2539;
    if (!_2463)
    {
        _2503 = _2525;
    }
    float _2543 = _2503;
    float _2545 = floor(_2531);
    float _2547 = _2543;
    if (_2463)
    {
        float _2549 = _2485 * _2539;
        _2089 = _2549;
    }
    float _2551 = _2089;
    if (!_2463)
    {
        _2487 = _2451;
    }
    float _2553 = _2487;
    float _2555 = _2553;
    if (_2463)
    {
        float _2557 = _2519 + (-1.0);
        _2535 = _2557;
    }
    float _2559 = _2535;
    float _2561 = _2559;
    if (_2463)
    {
        float _2563 = _2451 * _2551;
        _2555 = _2563;
    }
    float _2565 = _2555;
    if (_2463)
    {
        float _2567 = _2453 * _2551;
        _2481 = _2567;
    }
    float _2569 = _2481;
    float _2571 = _2415 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_2463)
    {
        float _2573 = _2559 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2541 = _2573;
    }
    float _2575 = _2541;
    float _2577 = _2575;
    if (!_2463)
    {
        _2561 = _2455;
    }
    float _2579 = _2561;
    float _2581 = _2579;
    if (_2463)
    {
        float _2583 = _2565 * _2565;
        _2581 = _2583;
    }
    float _2585 = _2581;
    float _2587 = _2415 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_2463)
    {
        float _2589 = fma(_2525, _2519, _2575);
        _2547 = _2589;
    }
    float _2591 = _2547;
    if (!_2463)
    {
        _2577 = _2457;
    }
    float _2593 = _2577;
    float _2595 = _2593;
    if (_2463)
    {
        float _2597 = _2569 * _2569;
        _2595 = _2597;
    }
    float _2599 = _2595;
    float _2601 = fma(_2417, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2571);
    float _2603 = fma(_2591, _2591, _2585);
    float _2605 = fma(_2417, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2587);
    float _2607 = fma(_2419, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2601);
    float _2609 = _2603 + _2599;
    float _2611 = _2415 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2613 = fma(_2419, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2605);
    float _2615 = rsqrt(_2609);
    float _2617 = fma(_2417, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2611);
    float _2619 = _2607 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2621 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2623 = fma(_2447, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2621);
    float _2625 = precise::clamp(_2623, 0.0, 1.0);
    float _2627 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2629 = fma(_2419, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2617);
    float _2631 = _2613 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2633 = -_2625;
    float _2635 = _2633 + 1.0;
    float _2637 = _2619 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2639 = _2629 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2641 = _2631 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2643 = _2441 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2645 = fma(_2639, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2637);
    float _2647 = abs(_2635);
    float _2649 = log2(_2647);
    float _2651 = -_2641;
    float _2653 = fma(_2651, _2627, 1.0);
    float _2655 = _2615 * _2591;
    float _2657 = fma(_2631, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2645);
    float _2659 = _2615 * _2565;
    float _2661 = fma(_2405, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2663 = _2615 * _2569;
    float _2665 = fma(_2643, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2657);
    float _2667 = _2659 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2669 = floor(_2661);
    float _2671 = -_2545;
    float _2673 = _2531 + _2671;
    float _2675 = _2619 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2677 = -_2667;
    float _2679 = fma(_2655, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2677);
    float _2681 = fma(_2639, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2675);
    float _2683 = -_2663;
    float _2685 = fma(_2683, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2679);
    float _2687 = _2649 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2689 = log2(_2653);
    float _2691 = _2619 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2693 = fma(_2685, -0.5, 0.5);
    float _2695 = fma(_2685, 0.5, 0.5);
    float _2697 = fma(_2631, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2681);
    float _2699 = fma(_2639, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2691);
    float _2701 = -_2669;
    float _2703 = _2661 + _2701;
    float _2705 = exp2(_2687);
    float _2707 = _2655 + 1.0;
    float _2709 = fma(_2695, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2711 = fma(_2631, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2699);
    float _2713 = fma(_2643, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2697);
    float _2715 = fma(_2695, _2709, -0.212114393711090087890625);
    float _2717 = 1.0 / _2665;
    float _2719 = _2689 * 0.693147182464599609375;
    float _2721 = fma(_2695, _2715, 1.570728778839111328125);
    float _2723 = _2719 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2725 = sqrt(_2693);
    float _2727 = -_2655;
    float _2729 = fma(_2705, _2707, _2727);
    float _2731 = fma(_2643, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2711);
    float _2733 = fma(_2729, 0.5, 0.5);
    float _2735 = _2713 * _2717;
    float _2737 = _2731 * _2717;
    float _2739 = fma(_2735, 0.5, 0.5);
    float _2741 = fma(_2737, -0.5, 0.5);
    float _2743 = _2725 * 0.636619746685028076171875;
    float2 _7602 = float2(_2673, _2703);
    float _2745 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7602, float2(0.0), isnan(_7602)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7602, float2(0.0), isnan(_7602)), level(0.0)).x;
    float3 _7613 = float3(_2739, _2741, _2723);
    float _2747 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7613, float3(0.0), isnan(_7613)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7613, float3(0.0), isnan(_7613)), level(0.0)).x;
    float3 _7624 = float3(_2739, _2741, _2723);
    float4 _2750 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7624, float3(0.0), isnan(_7624)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7624, float3(0.0), isnan(_7624)), level(0.0)).xyzw;
    float _2752 = _2750.x;
    float _2754 = _2750.y;
    float _2756 = _2750.z;
    float _2758 = _2750.w;
    float _2760 = -_2721;
    float _2762 = fma(_2743, _2760, 1.0);
    float2 _7645 = float2(_2762, _2733);
    float3 _2766 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7645, float2(0.0), isnan(_7645)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7645, float2(0.0), isnan(_7645)), level(0.0)).xyz;
    float _2768 = _2766.x;
    float _2770 = _2766.y;
    float _2772 = _2766.z;
    float _2774 = _1695 + _2019;
    float _2776 = _2619 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2778 = _2649 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_87.x = _2427;
    out.m_87.y = _2423;
    out.m_87.z = _2431;
    float _2780 = _2774 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2782 = _2774 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2784 = fma(_2639, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2776);
    float _2786 = _2713 + _2665;
    float _2788 = fma(_2413, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2780);
    float _2790 = fma(_2413, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2782);
    float _2792 = fma(_2631, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2784);
    float _2794 = fma(_2405, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2788);
    float _2796 = fma(_2405, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2790);
    float _2798 = fma(_2643, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2792);
    float _2800 = _2794 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2802 = _2796 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2804 = _2786 * 0.5;
    float _2806 = 1.0 / _2800;
    float _2808 = _2802 + _2800;
    out.gl_Position.x = _2713;
    out.gl_Position.y = _2731;
    out.gl_Position.z = _2798;
    out.gl_Position.w = _2665;
    float _2810 = _2798 + _2665;
    float _2812 = _2810 * 0.5;
    float _2814 = _2808 * _2806;
    float _2816 = _2814 * 0.5;
    float _2818 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2820 = fma(_2816, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2818);
    float _2822 = _2665 * 0.5;
    float _2824 = 1.0 / _2820;
    float _2826 = fma(_2731, -0.5, _2822);
    out.m_89.x = _2804;
    out.m_89.y = _2826;
    out.m_89.z = _2812;
    out.m_89.w = _2665;
    float _2828 = exp2(_2778);
    bool _2830 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2832 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2834 = _2830 || _2832;
    bool _2836 = isnan(0.5);
    bool _2838 = _2834 || _2836;
    float _2840 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2842 = _2824 * _2840;
    float _2844 = abs(_2842);
    float _2846 = log2(_2844);
    bool _2848 = _2842 <= 8000.0;
    bool _2850 = isnan(_2842);
    bool _2852 = _2848 || _2850;
    bool _2854 = isnan(8000.0);
    bool _2856 = _2852 || _2854;
    float _2858 = float(_2856);
    float _2860 = _2858;
    float _2862 = _2665;
    float _2864 = _2713;
    float _2866 = _2842;
    if (_2838)
    {
        _2473 = 1.0;
    }
    float _2868 = _2473;
    float _2870 = _2846 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2872 = exp2(_2870);
    float _2874 = fma(_2872, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2876 = precise::clamp(_2874, 0.0, 1.0);
    float _2878 = in.m_91.x;
    float _2880 = fma(_2876, -2.0, 3.0);
    float _2882 = _2876 * _2876;
    float _2884 = _2882 * _2880;
    float _2886 = -_2884;
    float _2888 = _2886 + 1.0;
    float _2890 = fma(_2888, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2884);
    float _2892 = _2858 * _2890;
    float _2894 = _2868;
    if (_2838)
    {
        _2860 = 1.0;
    }
    float _2896 = _2860;
    float _2898 = _2896;
    if (!_2838)
    {
        float _2900 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2902 = _2900 * 0.15915493667125701904296875;
        float _2904 = _2902 * 6.283185482025146484375;
        float _2906 = cos(_2904);
        float _2908 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2910 = _2908 * 0.15915493667125701904296875;
        float _2912 = _2902 * 6.283185482025146484375;
        float _2914 = sin(_2912);
        float _2916 = 1.0 / _2906;
        float _2918 = _2910 * 6.283185482025146484375;
        float _2920 = cos(_2918);
        float _2922 = _2914 * _2916;
        float _2924 = _2910 * 6.283185482025146484375;
        float _2926 = sin(_2924);
        float _2928 = _2920 * _2922;
        float _2930 = 1.0 / _2928;
        float _2932 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2934 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2932;
        float _2936 = 1.0 / _2934;
        float _2938 = _2926 * _2930;
        float _2940 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2942 = fma(_2842, _2938, _2940);
        float _2944 = _2942 * _2936;
        float _2946 = precise::clamp(_2944, 0.0, 1.0);
        _2862 = _2910;
        _2894 = _2946;
        _2864 = _2916;
    }
    float _2948 = _2862;
    float _2950 = _2894;
    float _2952 = _2864;
    float _2954 = _2948;
    float _2956 = _2952;
    if (!_2838)
    {
        float _2958 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2960 = _2958 * 0.15915493667125701904296875;
        float _2962 = _2960 * 6.283185482025146484375;
        float _2964 = cos(_2962);
        float _2966 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2968 = _2966 * 0.15915493667125701904296875;
        float _2970 = _2960 * 6.283185482025146484375;
        float _2972 = sin(_2970);
        float _2974 = 1.0 / _2964;
        float _2976 = _2968 * 6.283185482025146484375;
        float _2978 = cos(_2976);
        float _2980 = _2972 * _2974;
        float _2982 = _2968 * 6.283185482025146484375;
        float _2984 = sin(_2982);
        float _2986 = _2978 * _2980;
        float _2988 = 1.0 / _2986;
        float _2990 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2992 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2990;
        float _2994 = 1.0 / _2992;
        float _2996 = _2984 * _2988;
        float _2998 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3000 = fma(_2842, _2996, _2998);
        float _3002 = _3000 * _2994;
        float _3004 = precise::clamp(_3002, 0.0, 1.0);
        float _3006 = -_3004;
        float _3008 = _3006 + 1.0;
        _2898 = _3008;
        _2954 = _2974;
        _2866 = _3004;
        _2956 = _2968;
    }
    float _3010 = _2898;
    float _3012 = _2954;
    float _3014 = _2866;
    float _3016 = _2956;
    float _3018 = -_2828;
    float _3020 = _3018 + 1.0;
    float _3022 = _2892 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3024 = -_2745;
    float _3026 = _3024 + 1.0;
    float _3028 = _3020 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _3030 = _2447 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3032 = isnan(_2447);
    bool _3034 = _3030 || _3032;
    bool _3036 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3038 = _3034 || _3036;
    float _3040 = _3026 * _3022;
    float _3042 = precise::clamp(_3040, 0.0, 1.0);
    float _3044 = _2950 * _3010;
    float _3046 = _3028 * _2747;
    float _3048 = -_3028;
    float _3050 = _3048 + 1.0;
    float _3052 = -_3042;
    float _3054 = fma(_3052, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3056 = _2758 * _3046;
    float _3058 = _2772 * _3046;
    float _3060 = _3054 * _2878;
    float _3062 = _2758 * _3050;
    float _3064 = fma(_2768, _3056, _2752);
    float _3066 = fma(_2770, _3056, _2754);
    float _3068 = _3060 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3070 = fma(_2758, _3058, _2756);
    float _3072 = _3016;
    float _3074 = _3012;
    float _3076 = _3028;
    float _3078 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _3080 = _3014;
    float _3082 = _3050;
    if (!_3038)
    {
        _3072 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3084 = _3072;
    float _3086 = _3044 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3088 = _3084;
    float _3090 = _3084;
    if (!_3038)
    {
        _3074 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3092 = _3074;
    out.m_93.x = _3068;
    float _3094 = _3092;
    float _3096 = _3092;
    if (!_3038)
    {
        _3076 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3098 = _3076;
    float _3100 = _3098;
    float _3102 = _3098;
    if (!_3038)
    {
        _3078 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3104 = _3078;
    out.m_95.x = _3064;
    out.m_95.y = _3066;
    out.m_95.z = _3070;
    out.m_95.w = _3062;
    float _3106 = _3104;
    float _3108 = _3104;
    if (!_3038)
    {
        _3080 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3110 = _3080;
    float _3112 = _3110;
    float _3114 = _3110;
    if (!_3038)
    {
        _3082 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3116 = _3082;
    bool _3118 = !_3038;
    float _3120 = _3116;
    float _3122 = _3116;
    if (!_3118)
    {
        bool _3124 = _2447 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3126 = isnan(_2447);
        bool _3128 = _3124 || _3126;
        bool _3130 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3132 = _3128 || _3130;
        if (!_3132)
        {
            float _3134 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3136 = _2447 + _3134;
            float _3138 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3140 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3138;
            float _3142 = 1.0 / _3140;
            float _3144 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3146 = _3144 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3148 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3150 = _3148 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3152 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3154 = _3152 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3156 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3158 = _3156 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3160 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3162 = _3160 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3164 = _3136 * _3142;
            float _3166 = precise::clamp(_3164, 0.0, 1.0);
            float _3168 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3170 = _3168 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3172 = fma(_3166, _3146, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3174 = fma(_3166, _3170, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3176 = fma(_3166, _3150, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3178 = fma(_3166, _3154, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3180 = fma(_3166, _3158, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3182 = fma(_3166, _3162, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3096 = _3172;
            _3114 = _3180;
            _3090 = _3174;
            _3108 = _3178;
            _3102 = _3176;
            _3122 = _3182;
            _3184 = true;
        }
        else
        {
            bool _3186 = _2447 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3188 = isnan(_2447);
            bool _3190 = _3186 || _3188;
            bool _3192 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3194 = _3190 || _3192;
            if (!_3194)
            {
                _3088 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3196 = _3088;
            _3090 = _3196;
            if (!_3194)
            {
                _3094 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3198 = _3094;
            _3096 = _3198;
            if (!_3194)
            {
                _3100 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3200 = _3100;
            _3102 = _3200;
            if (!_3194)
            {
                _3106 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3202 = _3106;
            _3108 = _3202;
            if (!_3194)
            {
                _3112 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3204 = _3112;
            _3114 = _3204;
            if (!_3194)
            {
                _3120 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3206 = _3120;
            bool _3208 = !_3194;
            _3122 = _3206;
            if (!_3208)
            {
                bool _3210 = _2447 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3212 = isnan(_2447);
                bool _3214 = _3210 || _3212;
                bool _3216 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3218 = _3214 || _3216;
                if (!_3218)
                {
                    float _3220 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3222 = _2447 + _3220;
                    float _3224 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3226 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3224;
                    float _3228 = 1.0 / _3226;
                    float _3230 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3232 = _3230 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3234 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3236 = _3234 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3238 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3240 = _3238 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3242 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3244 = _3242 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3246 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3248 = _3246 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3250 = _3222 * _3228;
                    float _3252 = precise::clamp(_3250, 0.0, 1.0);
                    float _3254 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3256 = _3254 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3258 = fma(_3252, _3232, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3260 = fma(_3252, _3256, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3262 = fma(_3252, _3236, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3264 = fma(_3252, _3240, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3266 = fma(_3252, _3244, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3268 = fma(_3252, _3248, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3096 = _3258;
                    _3114 = _3266;
                    _3090 = _3260;
                    _3108 = _3264;
                    _3102 = _3262;
                    _3122 = _3268;
                    _3184 = true;
                }
                else
                {
                    _3096 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3114 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3090 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3108 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3102 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3122 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3184 = false;
    float _3270 = _3096;
    float _3272 = _3114;
    float _3274 = _3090;
    float _3276 = _3108;
    float _3278 = _3102;
    float _3280 = _3122;
    float _3282 = fma(_2307, -0.5, 0.5);
    float _3284 = precise::clamp(_3282, 0.0, 1.0);
    float _3286 = -_3270;
    float _3288 = _3286 + _3272;
    float _3290 = _3086 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3292 = -_3274;
    float _3294 = _3292 + _3276;
    out.m_97.x = 0.0;
    float _3296 = fma(_3284, _3288, _3270);
    float _3298 = fma(_3284, _3294, _3274);
    out.m_55.x = _3290;
    float _3300 = -_3278;
    float _3302 = _3300 + _3280;
    float _3304 = _3296 * 0.586610972881317138671875;
    bool _3306 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3308 = fma(_3284, _3302, _3278);
    float _3310 = fma(_3298, 0.298911988735198974609375, _3304);
    bool _3312 = _2950 > 0.0;
    bool _3314 = isnan(_2950);
    bool _3316 = _3312 || _3314;
    bool _3318 = isnan(0.0);
    bool _3320 = _3316 || _3318;
    float _3322 = fma(_3308, 0.114477999508380889892578125, _3310);
    bool _3324 = _3010 <= 0.0;
    bool _3326 = !_3320;
    bool _3328 = _3324 || _3326;
    float _3330 = -_3322;
    float _3332 = _3298 + _3330;
    float _3334 = -_3322;
    float _3336 = _3296 + _3334;
    float _3338 = -_3322;
    float _3340 = _3308 + _3338;
    float _3342 = fma(_3332, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3322);
    float _3344 = fma(_3336, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3322);
    float _3346 = fma(_3340, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3322);
    bool _3348 = !_3306;
    if (!_3348)
    {
        float _3350 = -_2415;
        float _3352 = _3350 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3354 = -_2417;
        float _3356 = _3354 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3358 = -_2419;
        float _3360 = _3358 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3362 = _3352 * _3352;
        float _3364 = fma(_3356, _3356, _3362);
        float _3366 = fma(_3360, _3360, _3364);
        float _3368 = sqrt(_3366);
        float _3370 = rsqrt(_3366);
        float _3372 = -_3368;
        float _3374 = _3372 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3376 = _3374 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3378 = precise::clamp(_3376, 0.0, 1.0);
        float _3380 = _3356 * _3370;
        float _3382 = _3352 * _3370;
        float _3384 = abs(_3378);
        float _3386 = log2(_3384);
        float _3388 = _3360 * _3370;
        float _3390 = _3380 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3392 = _2307 * _3382;
        float _3394 = -_3382;
        float _3396 = -_3390;
        float _3398 = fma(_3394, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3396);
        float _3400 = fma(_2289, _3380, _3392);
        float _3402 = -_3388;
        float _3404 = fma(_3402, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3398);
        float _3406 = fma(_2313, _3388, _3400);
        float _3408 = precise::clamp(_3406, 0.0, 1.0);
        float _3410 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3412 = _3404 + _3410;
        float _3414 = _3386 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3416 = _3412 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3418 = precise::clamp(_3416, 0.0, 1.0);
        float _3420 = exp2(_3414);
        float _3422 = _3420 * _3418;
        float _3424 = _3408 * _3422;
        float _3426 = _3424 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3428 = _3424 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3430 = _3424 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_97.x = _3426;
        out.m_97.y = _3428;
        out.m_97.z = _3430;
    }
    out.m_99.x = _3342;
    out.m_99.y = _3344;
    out.m_99.z = _3346;
    if (!_3328)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_55.x = 0.0;
    float _3432 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3432;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3184 = false;
    bool _2361 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _113 = in.m_48.w;
    float _115 = in.m_50.w;
    float _117 = trunc(_113);
    int _120 = int(_117);
    float _122 = -_115;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _124;
    bool _128 = _120 >= 1;
    float _130 = 0.0;
    float _132 = _115;
    if (!_128)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _130;
    if (!_128)
    {
        out.m_55.x = 0.0;
    }
    int _136 = 0;
    if (!_128)
    {
        float _138 = _134 * 5.0;
        _136 = as_type<int>(_138);
    }
    int _140 = _136;
    int _142 = _140;
    if (!_128)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3499 = as_type<float>(_140);
        out.gl_Position.z = _3499;
    }
    if (!_128)
    {
        return out;
    }
    bool _144 = _115 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _146 = isnan(_115);
    bool _148 = _144 || _146;
    bool _150 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _152 = _148 || _150;
    float _154 = float(_120);
    bool _156 = _124 >= _154;
    bool _158 = !_152;
    bool _160 = _156 || _158;
    if (_160)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _132;
    if (_160)
    {
        out.m_55.x = 0.0;
    }
    if (_160)
    {
        float _164 = _162 * 5.0;
        _142 = as_type<int>(_164);
    }
    int _166 = _142;
    int _168 = _166;
    if (_160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3555 = as_type<float>(_166);
        out.gl_Position.z = _3555;
    }
    if (_160)
    {
        return out;
    }
    float _170 = in.m_57.y;
    float _172 = 1.0 / _154;
    bool _174 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _176 = _124 * _172;
    out.m_59.y = _170;
    bool _178 = !_174;
    float _180 = _176;
    if (!_178)
    {
        float _182 = in.m_61.x;
        float _184 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _186 = _182 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _188 = fma(_186, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _190 = _188 * _184;
        float _192 = floor(_190);
        float _194 = -_192;
        float _196 = _190 + _194;
        _180 = _196;
    }
    float _198 = _180;
    float _200 = in.m_61.x;
    float _202 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _204 = int(_202);
    float _206 = in.m_61.w;
    int _208 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _210 = _208 != 0;
    int _212 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _214 = _212 != 0;
    float _216 = in.m_57.x;
    int _218 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _220 = _218 != 0;
    float _222 = in.m_61.z;
    float _224 = in.m_61.y;
    float _226 = float(_204);
    float _228 = in.m_63.x;
    float _230 = in.m_63.y;
    float _232 = in.m_63.z;
    float _234 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _236 = 1.0 / _226;
    float _238 = _200 * 2.0;
    bool _240 = false;
    if (_210)
    {
        bool _242 = _200 > 0.5;
        _240 = _242;
    }
    bool _244 = _240;
    float _246 = (*spvDescriptorSet0.vp_c8)._m0[28].z * (*spvDescriptorSet0.vp_c8)._m0[1].x;
    bool _248 = _206 > 0.5;
    float _250 = floor(_238);
    int _252 = as_type<int>(_206);
    float _254 = _216;
    if (_210)
    {
        float _256 = -_216;
        float _258 = _256 + 1.0;
        _252 = as_type<int>(_258);
    }
    int _260 = _252;
    int _262 = _260;
    if (_214)
    {
        float _264 = -_216;
        float _266 = _264 + 1.0;
        _168 = as_type<int>(_266);
    }
    int _268 = _168;
    float _270 = 0.0;
    if (!_210)
    {
        _270 = _216;
    }
    float _272 = _270;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[193].y;
    float _276 = fma(_274, 0.100000001490116119384765625, 0.100000001490116119384765625);
    bool _278 = _222 > 0.5;
    float _280 = _272;
    if (_210)
    {
        float _282 = _244 ? as_type<float>(_260) : _216;
        _280 = _282;
    }
    float _284 = _280;
    if (_220)
    {
        float _286 = -_216;
        float _288 = _286 + 1.0;
        _262 = as_type<int>(_288);
    }
    int _290 = _262;
    int _292 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _294 = _292 != 0;
    float _296 = _124 * _236;
    float _298 = 0.0;
    if (!_214)
    {
        _298 = _216;
    }
    float _300 = _298;
    float _302 = _224 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _304 = _300;
    if (_214)
    {
        float _306 = _278 ? as_type<float>(_268) : _216;
        _304 = _306;
    }
    float _308 = _304;
    float _310 = -_170;
    float _312 = _310 + 1.0;
    bool _314 = _224 > 0.5;
    float _316 = trunc(_296);
    int _318 = int(_316);
    bool _320 = !_294;
    int _322 = _320 ? 0 : 1;
    float _324 = _230 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    bool _326 = _250 >= 0.0;
    bool _328 = isnan(_250);
    bool _330 = _326 || _328;
    bool _332 = isnan(0.0);
    bool _334 = _330 || _332;
    float _336 = _200 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    if (_220)
    {
        float _338 = _314 ? as_type<float>(_290) : _216;
        _254 = _338;
    }
    float _340 = _254;
    float _342 = _232 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    int _344 = _314 ? as_type<int>(_312) : as_type<int>(_170);
    float _346 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _348 = int(_346);
    int _350 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _352 = _350 != 0;
    int _354 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _356 = _354 != 0;
    float _358 = -_234;
    float _360 = fma(_336, 2.0, _358);
    int _362 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _364 = _362 != 0;
    float _366 = _324 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _368 = _248 ? as_type<int>(_312) : as_type<int>(_170);
    float _370 = _342 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _372 = _278 ? as_type<int>(_312) : as_type<int>(_170);
    bool _374 = !_352;
    int _376 = _374 ? 0 : 1;
    int _378 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _380 = _378 != 0;
    int _382 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _384 = _382 != 0;
    int _386 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _388 = _386 != 0;
    bool _390 = !_356;
    int _392 = _390 ? 0 : 1;
    float _394 = _388 ? as_type<float>(_344) : _170;
    bool _396 = _250 > 0.0;
    int _398 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _400 = _398 != 0;
    float _402 = _334 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _404 = _364 ? as_type<float>(_372) : _170;
    int _406 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _408 = _406 != 0;
    int _410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _412 = _410 != 0;
    int _414 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _416 = _414 != 0;
    float _418 = in.m_48.x;
    float _420 = in.m_48.y;
    float _422 = in.m_48.z;
    int _424 = ~as_type<int>(_402);
    int _426 = _424 + 1;
    int _428 = _426 + 1;
    int _430 = _428;
    float _432 = _402;
    if (!_396)
    {
        int _434 = ~as_type<int>(_402);
        int _436 = _434 + 1;
        _430 = _436;
    }
    int _438 = _430;
    float _440 = _400 ? as_type<float>(_368) : _170;
    int _442 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _444 = _442 != 0;
    float _446 = float(uint(_348));
    bool _448 = !_444;
    float _450 = _448 ? 1.2345600128173828125 : 1.0;
    float _452 = 1.0 / _446;
    bool _454 = !_444;
    float _456 = _454 ? _224 : _200;
    int _458 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1048576;
    bool _460 = _458 != 0;
    int _462 = ~_348;
    int _464 = _462 + 1;
    float _466 = _446;
    if (!_444)
    {
        _432 = _222;
    }
    float _468 = _432;
    float _470 = 0.0;
    float _472 = _468;
    if (!_444)
    {
        _470 = _224;
    }
    float _474 = _470;
    float _476 = 0.0;
    float _478 = _474;
    if (!_444)
    {
        _476 = _222;
    }
    float _480 = _476;
    float _482 = _420 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _484 = 0.0;
    float _486 = _480;
    if (_444)
    {
        _484 = _200;
    }
    float _488 = _484;
    float _490 = _420 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _492 = _488;
    if (_444)
    {
        _466 = _224;
    }
    float _494 = _466;
    float _496 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[4].x, _482);
    float _498 = _494;
    if (_444)
    {
        _472 = _224;
    }
    float _500 = _472;
    float _502 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[6].x, _490);
    if (_444)
    {
        _486 = _224;
    }
    float _504 = _486;
    float _506 = fma(_422, (*spvDescriptorSet0.vp_c10)._m0[4].z, _496);
    float _508 = _504;
    if (!_444)
    {
        _492 = _222;
    }
    float _510 = _492;
    if (_444)
    {
        _478 = _200;
    }
    float _512 = _478;
    float _514 = _506 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    if (!_444)
    {
        _498 = _200;
    }
    float _516 = _498;
    int _518 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _520 = _518 != 0;
    float _522 = _420 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _524 = as_type<int>(_452) + (-2);
    float _526 = _228 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _528 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[5].x, _522);
    float _530 = float(uint(_318));
    float _532 = _526 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _536 = _534 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _538 = as_type<float>(_524) * _530;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _542 = -_246;
    float _544 = fma((*spvDescriptorSet0.vp_c8)._m0[1].z, (*spvDescriptorSet0.vp_c8)._m0[28].x, _542);
    float _546 = (*spvDescriptorSet0.vp_c8)._m0[1].z * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _548 = trunc(_538);
    float _550 = precise::max(_548, 0.0);
    uint _553 = uint(_550);
    float _555 = fma(_302, -2.0, _540);
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _559 = _557 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _563 = _561 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _565 = fma(_422, (*spvDescriptorSet0.vp_c10)._m0[5].z, _528);
    float _567 = 1.0 / _536;
    float _569 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _573 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _571;
    out.m_65.w = _569;
    int _575 = _464 * int(_553);
    int _577 = _575 + _318;
    float _579 = 1.0 / _559;
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _583 = _581 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _585 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _587 = float(uint(_577));
    float _589 = -_546;
    float _591 = fma((*spvDescriptorSet0.vp_c8)._m0[1].y, (*spvDescriptorSet0.vp_c8)._m0[28].z, _589);
    float _593 = _573 * _567;
    float _595 = 1.0 / _563;
    float _597 = as_type<float>(_524) * _587;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _601 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _599;
    float _603 = _456 * _450;
    float _605 = _200 + _222;
    float _607 = _222 * 2.0;
    float _609 = float(_348);
    float _611 = (*spvDescriptorSet0.vp_c8)._m0[1].y * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _613 = trunc(_597);
    float _615 = precise::max(_613, 0.0);
    uint _617 = uint(_615);
    float _619 = _605 + (-1.0);
    float _621 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _585);
    int _623 = ~_348;
    int _625 = _623 + 1;
    float _627 = _224 * 2.0;
    float _629 = fma(_619, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _631 = _200 + _224;
    float _633 = floor(_607);
    float _635 = _124 * _609;
    float _637 = _601 * _579;
    float _639 = _583 * _595;
    float _641 = _631 + (-1.0);
    float _643 = _635 * _172;
    float _645 = _224 + _222;
    int _647 = int(_553) + int(_617);
    float _649 = floor(_627);
    float _651 = in.m_67.x;
    float _653 = in.m_67.y;
    float _655 = in.m_67.z;
    float _657 = -_611;
    float _659 = fma((*spvDescriptorSet0.vp_c8)._m0[1].x, (*spvDescriptorSet0.vp_c8)._m0[28].y, _657);
    int _661 = _625 * _647;
    int _663 = _661 + _318;
    bool _665 = !_412;
    int _667 = _665 ? 0 : 1;
    float _669 = _645 + (-1.0);
    float _671 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _621);
    float _673 = fma(_641, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _675 = uint(_663) >= uint(_348);
    float _677 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _679 = log2(_677);
    bool _681 = !_408;
    int _683 = _681 ? 0 : 1;
    float _685 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _687 = !_675;
    int _689 = _687 ? 0 : (-1);
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _693 = _633 > 0.0;
    float _695 = _222 + (-0.5);
    bool _697 = _633 >= 0.0;
    bool _699 = isnan(_633);
    bool _701 = _697 || _699;
    bool _703 = isnan(0.0);
    bool _705 = _701 || _703;
    float _707 = fma(_422, (*spvDescriptorSet0.vp_c10)._m0[6].z, _502);
    float _709 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _711 = !_416;
    int _713 = _711 ? 0 : 1;
    float _715 = _707 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _717 = _705 ? 0 : 1;
    float _719 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _651);
    bool _721 = _649 > 0.0;
    float _723 = _124 * _679;
    bool _725 = _649 >= 0.0;
    bool _727 = isnan(_649);
    bool _729 = _725 || _727;
    bool _731 = isnan(0.0);
    bool _733 = _729 || _731;
    float _735 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _653);
    float _737 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _655);
    float _739 = _719 * _532;
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _743 = _198 + _741;
    float _745 = exp2(_723);
    float _747 = _735 * _366;
    float _749 = _737 * _370;
    float _751 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _753 = _198 + _751;
    float _755 = _709 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _757 = fma(_637, _743, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _761 = _198 + _759;
    float _763 = fma(_639, _753, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _765 = fma(_755, _394, -0.5);
    int _767 = ~_717;
    int _769 = _767 + 1;
    int _771 = _769 + 1;
    float _773 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _775 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _777 = isnan(_198);
    bool _779 = _775 || _777;
    bool _781 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _783 = _779 || _781;
    float _785 = float(_783);
    float _787 = fma(_593, _761, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    int _789 = _771;
    float _791 = as_type<float>(_524);
    if (!_693)
    {
        int _793 = ~_717;
        int _795 = _793 + 1;
        _789 = _795;
    }
    int _797 = _789;
    float _799 = _200 * 6.283185482025146484375;
    bool _801 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _803 = isnan(_198);
    bool _805 = _801 || _803;
    bool _807 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _809 = _805 || _807;
    float _811 = float(_809);
    float _813 = -_745;
    float _815 = _813 + 1.0;
    bool _817 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _819 = isnan(_198);
    bool _821 = _817 || _819;
    bool _823 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _825 = _821 || _823;
    float _827 = float(_825);
    float _829 = -_785;
    float _831 = _829 + 1.0;
    bool _833 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _835 = isnan(_198);
    bool _837 = _833 || _835;
    bool _839 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _841 = _837 || _839;
    float _843 = float(_841);
    float _845 = floor(_603);
    bool _847 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _849 = isnan(0.0);
    bool _851 = _847 || _849;
    bool _853 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _855 = _851 || _853;
    float _857 = fma(_124, 0.02999999932944774627685546875, _799);
    float _859 = _843 * _831;
    float _861 = _855 ? _815 : 0.0;
    float _863 = -_843;
    float _865 = _863 + 1.0;
    bool _867 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _869 = isnan(1.0);
    bool _871 = _867 || _869;
    bool _873 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _875 = _871 || _873;
    float _877 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _879 = 1.0 + _877;
    float _881 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[78].w, _691);
    float _883 = _773 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _885 = 1.0 / _879;
    float _887 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _881);
    float _889 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _555);
    float _891 = _827 * _865;
    float _893 = -_827;
    float _895 = _893 + 1.0;
    float _897 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _899 = -_889;
    float _901 = fma(_887, _765, _899);
    float _903 = _510 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _905 = _811 * _895;
    float _907 = _857 * 0.15915493667125701904296875;
    float _909 = -_845;
    float _911 = _603 + _909;
    float _913 = -_897;
    float _915 = fma(_903, 2.0, _913);
    float _917 = _757 * _905;
    float _919 = _907 * 6.283185482025146484375;
    float _921 = sin(_919);
    float _923 = in.m_69.x;
    float _925 = in.m_69.y;
    float _927 = in.m_69.z;
    float _929 = _861 * _885;
    float _931 = _733 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _933 = fma(_883, _404, -0.5);
    bool _935 = _653 != 0.0;
    bool _937 = isnan(_653);
    bool _939 = _935 || _937;
    bool _941 = isnan(0.0);
    bool _943 = _939 || _941;
    float _945 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _947 = -_170;
    float _949 = _947 + (*spvDescriptorSet0.vp_c9)._m0[193].x;
    bool _951 = _651 == 0.0;
    bool _953 = !_943;
    bool _955 = _951 && _953;
    float _957 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[83].z, _945);
    float _959 = _512 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _961 = -_811;
    float _963 = _961 + 1.0;
    bool _965 = _655 == 0.0;
    bool _967 = _965 && _955;
    float _969 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _971 = _921 * _949;
    float _973 = fma(_963, (*spvDescriptorSet0.vp_c9)._m0[115].x, _917);
    float _975 = float(_318);
    float _977 = -_969;
    float _979 = fma(_959, 2.0, _977);
    float _981 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _983 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _985 = _609 * _911;
    bool _987 = _975 >= _609;
    bool _989 = isnan(_975);
    bool _991 = _987 || _989;
    bool _993 = isnan(_609);
    bool _995 = _991 || _993;
    float _997 = float(_995);
    float _999 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[83].w, _981);
    int _1001 = ~as_type<int>(_931);
    int _1003 = _1001 + 1;
    int _1005 = _1003 + 1;
    float _1007 = _544 * _544;
    float _1009 = _911;
    int _1011 = _1005;
    float _1013 = _931;
    float _1015 = _865;
    float _1017 = _923;
    float _1019 = _925;
    bool _1021 = _967;
    if (_967)
    {
        _1009 = _923;
    }
    float _1023 = _1009;
    float _1025 = _276 * _971;
    float _1027 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1029 = _1023;
    if (!_721)
    {
        int _1031 = ~as_type<int>(_931);
        int _1033 = _1031 + 1;
        _1011 = _1033;
    }
    int _1035 = _1011;
    float _1037 = fma(_763, _891, _973);
    if (_967)
    {
        _1013 = _925;
    }
    float _1039 = _1013;
    float _1041 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[85].x, -0.5);
    float _1043 = _1039;
    if (_967)
    {
        _508 = _1023;
    }
    float _1045 = _508;
    float _1047 = -_124;
    float _1049 = fma(_1047, (*spvDescriptorSet0.vp_c9)._m0[81].x, _979);
    float _1051 = _1045;
    if (_967)
    {
        _1015 = _927;
    }
    float _1053 = _1015;
    float _1055 = _983 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1057 = _1053;
    if (!_967)
    {
        _1029 = _923;
    }
    float _1059 = _1029;
    float _1061 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1063 = _514 + _1061;
    float _1065 = _1063;
    if (_967)
    {
        _1017 = _1039;
    }
    float _1067 = _1017;
    float _1069 = fma(_1055, _284, -0.5);
    float _1071 = _1067;
    if (!_967)
    {
        _1043 = _925;
    }
    float _1073 = _1043;
    if (!_967)
    {
        float _1075 = fma(_651, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1059);
        _1051 = _1075;
    }
    float _1077 = _1051;
    if (_967)
    {
        _1019 = _1053;
    }
    float _1079 = _1019;
    float _1081 = _1027 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1083 = _1079;
    if (!_967)
    {
        _1057 = _927;
    }
    float _1085 = _1057;
    float _1087 = fma(_591, _591, _1007);
    float _1089 = fma(_1081, _340, -0.5);
    float _1091 = _500 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1093 = fma(_659, _659, _1087);
    float _1095 = -_715;
    float _1097 = _1095 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1099 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (!_967)
    {
        float _1101 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1085);
        _1083 = _1101;
    }
    float _1103 = _1083;
    if (!_967)
    {
        float _1105 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1073);
        _1071 = _1105;
    }
    float _1107 = _1071;
    float _1109 = abs(_1063);
    float _1111 = abs(_1097);
    float _1113 = precise::max(_1109, _1111);
    float _1115 = fma(_200, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1099);
    float _1117 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1119 = rsqrt(_1093);
    bool _1121 = _1113 >= 16.0;
    float _1123 = -_124;
    float _1125 = fma(_1123, (*spvDescriptorSet0.vp_c9)._m0[76].x, _360);
    float _1127 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].z, _957);
    float _1129 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1115);
    float _1131 = fma(_200, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1117);
    int _1133 = abs(_683);
    float _1135 = fma(_1127, _1041, _1049);
    float _1137 = fma(_1129, _1069, _1125);
    float _1139 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1131);
    float _1141 = in.m_71.x;
    float _1143 = in.m_71.y;
    float _1145 = in.m_71.z;
    float _1147 = in.m_71.w;
    float _1149 = float(_797);
    float _1151 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[85].y, -0.5);
    float _1153 = trunc(_997);
    int _1155 = int(_1153);
    float _1157 = _544 * _1119;
    float _1159 = -_124;
    float _1161 = fma(_1159, (*spvDescriptorSet0.vp_c9)._m0[86].x, _915);
    int _1163 = abs(_667);
    float _1165 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _1167 = abs(_713);
    float _1169 = fma(_1139, _1089, _1161);
    float _1171 = _516 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1173 = float(_1163);
    float _1175 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1177 = float(_1133);
    float _1179 = fma(_1091, -2.0, _1165);
    float _1181 = float(_438);
    float _1183 = fma(_1171, -2.0, _1175);
    float _1185 = _1177 * _1149;
    float _1187 = float(_1035);
    float _1189 = trunc(_985);
    int _1191 = int(_1189);
    float _1193 = _1145 * _1059;
    float _1195 = float(_1167);
    float _1197 = _1173 * _1181;
    float _1199 = _1141 * _1073;
    float _1201 = -_1193;
    float _1203 = fma(_1141, _1085, _1201);
    float _1205 = _1143 * _1085;
    float _1207 = _1195 * _1187;
    float _1209 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].w, _999);
    float _1211 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1179);
    float _1213 = -_1205;
    float _1215 = fma(_1145, _1073, _1213);
    int _1217 = abs(_322);
    float _1219 = rsqrt(_671);
    float _1221 = -_1211;
    float _1223 = fma(_1209, _1151, _1221);
    float _1225 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1227 = fma(_787, _859, _1037);
    int _1229 = ~_647;
    int _1231 = _1229 + _689;
    int _1233 = _1231 + 1;
    float _1235 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1225);
    bool _1237 = !_875;
    float _1239 = _1237 ? _124 : _929;
    int _1241 = _1191 * _1217;
    int _1243 = _1241 + _318;
    bool _1245 = _348 == 0;
    int _1247 = _348 * _1233;
    int _1249 = _1247 + _318;
    float _1251 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1235);
    float _1253 = -_1199;
    float _1255 = fma(_1143, _1059, _1253);
    int _1257 = ~_1155;
    int _1259 = _1257 + 1;
    int _1261 = _1259 + 1;
    float _1263 = fma(_785, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1227);
    bool _1265 = !_1245;
    int _1267 = _1265 ? _1249 : (-1);
    float _1269 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1183);
    float _1271 = _1219 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1273 = _1203 * _1147;
    float _1275 = _1215 * _1147;
    float _1277 = _1255 * _1147;
    float _1279 = _1185 * (-2.0);
    float _1281 = trunc(_643);
    int _1283 = int(_1281);
    int _1285 = _1267 * _1261;
    int _1287 = _348 + (-1);
    float _1289 = _1271 * (-0.699999988079071044921875);
    float _1291 = fma(_673, _1279, _673);
    int _1293 = abs(_392);
    float _1295 = _200 + (-0.5);
    int _1297 = _1155 * _1287;
    int _1299 = _1297 + _1285;
    float _1301 = _1289 * 0.15915493667125701904296875;
    bool _1303 = !_380;
    int _1305 = _1303 ? 0 : 1;
    float _1307 = _591 * _1119;
    int _1309 = abs(_376);
    int _1311 = _1299 * _1293;
    bool _1313 = !_384;
    int _1315 = _1313 ? 0 : 1;
    float _1317 = _1207 * (-2.0);
    int _1319 = abs(_1305);
    float _1321 = _1295 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _1323 = _659 * _1119;
    int _1325 = abs(_1315);
    float _1327 = fma(_629, _1317, _629);
    int _1329 = _1283 * _1309;
    int _1331 = _1329 + _1311;
    float _1333 = _1157 * _1157;
    float _1335 = float(uint(_1243));
    int _1337 = _1243 * _1319;
    int _1339 = _1337 + _1331;
    float _1341 = fma(_1239, _1291, _1321);
    float _1343 = fma(_1307, _1307, _1333);
    float _1345 = _1197 * (-2.0);
    int _1347 = _1191 * _1325;
    int _1349 = _1347 + _1339;
    float _1351 = as_type<float>(_524) * _1335;
    float _1353 = _1135 + 0.5;
    float _1355 = _1097 * 0.0625;
    float _1357 = _1107;
    float _1359 = _1273;
    float _1361 = _1277;
    if (_1121)
    {
        float _1363 = _1063 * 0.0625;
        _1065 = _1363;
    }
    float _1365 = _1065;
    float _1367 = float(uint(_1349));
    float _1369 = fma(_1323, _1323, _1343);
    float _1371 = _901 + 0.5;
    float _1373 = _1137 + 0.5;
    float _1375 = _1223 + 0.5;
    float _1377 = as_type<float>(_524) * _1367;
    float _1379 = fma(_685, _1345, _685);
    int _1381 = ~_348;
    int _1383 = _1381 + 1;
    float _1385 = trunc(_1351);
    float _1387 = precise::max(_1385, 0.0);
    uint _1389 = uint(_1387);
    float _1391 = _1121 ? _1355 : _1097;
    out.m_73.x = _1373;
    out.m_73.y = _1371;
    out.m_73.z = _1353;
    out.m_73.w = _1375;
    float _1393 = abs(_1365);
    bool _1395 = _1393 != 0.0;
    bool _1397 = isnan(_1393);
    bool _1399 = _1395 || _1397;
    bool _1401 = isnan(0.0);
    bool _1403 = _1399 || _1401;
    float _1405 = _224 + (-0.5);
    float _1407 = _695 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    float _1409 = _1341 * 0.15915493667125701904296875;
    float _1411 = abs(_1391);
    bool _1413 = _1411 == 0.0;
    bool _1415 = !_1403;
    bool _1417 = _1413 && _1415;
    float _1419 = trunc(_1377);
    float _1421 = precise::max(_1419, 0.0);
    uint _1423 = uint(_1421);
    float _1425 = fma(_1239, _1327, _1407);
    float _1427 = -_1269;
    float _1429 = fma(_1251, _933, _1427);
    float _1431 = _1425 * 0.15915493667125701904296875;
    float _1433 = _1405 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    int _1435 = ~_348;
    int _1437 = _1435 + 1;
    float _1439 = _1409 * 6.283185482025146484375;
    float _1441 = sin(_1439);
    int _1443 = as_type<int>(_1409);
    if (_1417)
    {
        bool _1445 = as_type<int>(_1391) >= 0;
        _1021 = _1445;
    }
    bool _1447 = _1021;
    float _1449 = fma(_1239, _1379, _1433);
    int _1451 = _1383 * int(_1423);
    int _1453 = _1451 + _1349;
    float _1455 = _1409 * 6.283185482025146484375;
    float _1457 = cos(_1455);
    int _1459 = _1437 * int(_1389);
    int _1461 = _1459 + _1243;
    float _1463 = float(uint(_1453));
    float _1465 = as_type<float>(_524) * _1463;
    float _1467 = _1301 * 6.283185482025146484375;
    float _1469 = sin(_1467);
    if (_1417)
    {
        int _1471 = _1447 ? 0 : 1078530011;
        _1443 = _1471;
    }
    int _1473 = _1443;
    float _1475 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1477 = abs(_1391);
    bool _1479 = _1477 == 0.0;
    float _1481 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1483 = _1475 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1485 = _1301 * 6.283185482025146484375;
    float _1487 = cos(_1485);
    float _1489 = _1481 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1491 = _1431 * 6.283185482025146484375;
    float _1493 = cos(_1491);
    float _1495 = trunc(_1465);
    float _1497 = precise::max(_1495, 0.0);
    uint _1499 = uint(_1497);
    float _1501 = rsqrt(_1369);
    float _1503 = float(uint(_1461));
    float _1505 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1507 = _1263 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1509 = as_type<float>(_524) * _1503;
    float _1511 = _1505 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1513 = _1479 ? (-1) : 0;
    int _1515 = _1473;
    if (_1417)
    {
        int _1517 = int(0x80000000) & as_type<int>(_1365);
        int _1519 = _1473 | _1517;
        _791 = as_type<float>(_1519);
    }
    float _1521 = _791;
    bool _1523 = !_1403;
    bool _1525 = _1523 && _1479;
    float _1527 = _1521;
    float _1529 = _1521;
    if (!_1525)
    {
        float _1531 = abs(_1365);
        bool _1533 = _1531 != as_type<float>(0x7f800000u /* inf */);
        bool _1535 = isnan(_1531);
        bool _1537 = _1533 || _1535;
        bool _1539 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1541 = _1537 || _1539;
        float _1543 = abs(_1391);
        bool _1545 = _1543 == as_type<float>(0x7f800000u /* inf */);
        float _1547 = abs(_1391);
        bool _1549 = _1547 == as_type<float>(0x7f800000u /* inf */);
        bool _1551 = !_1541;
        bool _1553 = _1549 && _1551;
        if (_1553)
        {
            bool _1555 = as_type<int>(_1391) >= 0;
            _1513 = _1555 ? (-1) : 0;
        }
        int _1557 = _1513;
        if (_1553)
        {
            _1515 = 1075235812;
        }
        int _1559 = _1515;
        int _1561 = _1559;
        if (_1553)
        {
            int _1563 = ~_1557;
            int _1565 = (_1563 != 0) ? _1559 : 1061752795;
            _1561 = _1565;
        }
        int _1567 = _1561;
        if (_1553)
        {
            int _1569 = int(0x80000000) & as_type<int>(_1365);
            int _1571 = _1567 | _1569;
            _1527 = as_type<float>(_1571);
        }
        float _1573 = _1527;
        bool _1575 = !_1541;
        bool _1577 = _1575 && _1545;
        _1529 = _1573;
        if (!_1577)
        {
            float _1579 = abs(_1365);
            float _1581 = abs(_1391);
            float _1583 = precise::max(_1579, _1581);
            float _1585 = abs(_1365);
            float _1587 = abs(_1391);
            float _1589 = precise::min(_1585, _1587);
            float _1591 = 1.0 / _1583;
            float _1593 = abs(_1365);
            float _1595 = abs(_1391);
            bool _1597 = _1593 > _1595;
            bool _1599 = as_type<int>(_1391) >= 0;
            float _1601 = _1589 * _1591;
            float _1603 = abs(_1365);
            float _1605 = abs(_1391);
            float _1607 = _1603 + _1605;
            int _1609 = as_type<int>(_1365) & int(0x80000000);
            float _1611 = _1601 * _1601;
            bool _1613 = _1607 > as_type<float>(0x7f800000u /* inf */);
            bool _1615 = isnan(_1607);
            bool _1617 = _1613 || _1615;
            bool _1619 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1621 = _1617 || _1619;
            float _1623 = _1611 + 11.33538818359375;
            float _1625 = fma(_1611, _1623, 28.84246826171875);
            float _1627 = fma(_1611, _1625, 19.6966705322265625);
            float _1629 = fma(_1611, -0.82336294651031494140625, -5.674867153167724609375);
            float _1631 = fma(_1611, _1629, -6.565555095672607421875);
            float _1633 = 1.0 / _1627;
            float _1635 = _1611 * _1631;
            float _1637 = _1601 * _1635;
            float _1639 = fma(_1637, _1633, _1601);
            float _1641 = _1639;
            _1529 = _1607;
            if (_1597)
            {
                float _1643 = -_1639;
                float _1645 = _1643 + 1.57079637050628662109375;
                _1641 = _1645;
            }
            float _1647 = _1641;
            int _1649 = as_type<int>(_1647);
            if (!_1599)
            {
                float _1651 = -_1647;
                float _1653 = _1651 + 3.1415927410125732421875;
                _1649 = as_type<int>(_1653);
            }
            int _1655 = _1649;
            if (!_1621)
            {
                int _1657 = _1609 | _1655;
                _1529 = as_type<float>(_1657);
            }
        }
    }
    float _1659 = _1529;
    float _1661 = -_1659;
    float _1663 = _1449 + _1661;
    int _1665 = ~_348;
    int _1667 = _1665 + 1;
    float _1669 = _1323 * _1501;
    int _1671 = int(_1423) + int(_1499);
    float _1673 = _1663 * 0.15915493667125701904296875;
    float _1675 = _1307 * _1501;
    float _1677 = -_1487;
    float _1679 = _1677 + 1.0;
    float _1681 = _1157 * _1501;
    float _1683 = _1673 * 6.283185482025146484375;
    float _1685 = sin(_1683);
    int _1687 = _1667 * _1671;
    int _1689 = _1687 + _1349;
    out.m_75.x = _1483;
    out.m_75.y = _1511;
    out.m_75.z = _1489;
    out.m_75.w = _1507;
    float _1691 = _1675 * _1679;
    float _1693 = _1675 * _1469;
    float _1695 = _565 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1697 = uint(_1689) >= uint(_348);
    float _1699 = fma(_1675, _1691, _1487);
    float _1701 = _1673 * 6.283185482025146484375;
    float _1703 = cos(_1701);
    float _1705 = _1681 * _1469;
    float _1707 = _1431 * 6.283185482025146484375;
    float _1709 = sin(_1707);
    float _1711 = _1669 * _1469;
    float _1713 = -_1705;
    float _1715 = fma(_1669, _1691, _1713);
    float _1717 = fma(_1669, _1691, _1705);
    float _1719 = fma(_1681, _1691, _1711);
    float _1721 = -_1711;
    float _1723 = fma(_1681, _1691, _1721);
    float _1725 = _1681 * _1679;
    bool _1727 = !_1697;
    int _1729 = _1727 ? 0 : (-1);
    float _1731 = _1669 * _1669;
    float _1733 = trunc(_1509);
    float _1735 = precise::max(_1733, 0.0);
    uint _1737 = uint(_1735);
    float _1739 = fma(_1669, _1725, _1693);
    float _1741 = -_1693;
    float _1743 = fma(_1669, _1725, _1741);
    float _1745 = fma(_1681, _1725, _1487);
    float _1747 = fma(_1679, _1731, _1487);
    float _1749 = _1441 * _1703;
    float _1751 = _1457 * _1703;
    float _1753 = _1441 * _1685;
    float _1755 = _1441 * _1493;
    int _1757 = ~_1671;
    int _1759 = _1757 + _1729;
    int _1761 = _1759 + 1;
    float _1763 = _1457 * _1685;
    float _1765 = _1457 * _1493;
    float _1767 = _1685 * _1493;
    float _1769 = fma(_1709, _1751, _1753);
    int _1771 = _348 * _1761;
    int _1773 = _1771 + _1349;
    float _1775 = -_1763;
    float _1777 = fma(_1709, _1749, _1775);
    float _1779 = -_1749;
    float _1781 = fma(_1709, _1763, _1779);
    float _1783 = _1765 * _747;
    float _1785 = fma(_1709, _1753, _1751);
    bool _1787 = !_1245;
    int _1789 = _1787 ? _1773 : (-1);
    float _1791 = _1703 * _1493;
    float _1793 = -_747;
    float _1795 = _1709 * _1793;
    float _1797 = fma(_1769, _739, _1783);
    float _1799 = _1755 * _747;
    int _1801 = _1789 >> 31;
    float _1803 = fma(_1791, _739, _1795);
    float _1805 = fma(_1781, _749, _1797);
    float _1807 = fma(_1777, _739, _1799);
    int _1809 = _1801 & 3;
    float _1811 = fma(_1767, _749, _1803);
    float _1813 = _1695 + _1805;
    float _1815 = fma(_1785, _749, _1807);
    int _1817 = _1789 + _1809;
    float _1819 = _514 + _1811;
    float _1821 = fma(_1157, _1025, _1813);
    float _1823 = _715 + _1815;
    int _1825 = _1817 >> 2;
    float _1827 = fma(_1307, _1025, _1819);
    float _1829 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1831 = _1821 + _1829;
    float _1833 = fma(_1323, _1025, _1823);
    int _1835 = _1825 << 4;
    int _1837 = _1835 + 512;
    float _1839 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1841 = _1827 + _1839;
    float _1843 = _1745 * _1831;
    float _1845 = _1723 * _1831;
    float _1847 = _1739 * _1831;
    float _1849 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1851 = _1833 + _1849;
    float _1853 = fma(_1719, _1841, _1843);
    float _1855 = fma(_1699, _1841, _1845);
    float _1857 = fma(_1715, _1841, _1847);
    uint _1859 = uint(int(uint(_1837) >> uint(2)));
    uint _1861 = uint(int(uint(int(_1859)) >> uint(2)));
    int _1863 = int(_1859) & 3;
    float _1865 = (*spvDescriptorSet0.vp_c9)._m0[int(_1861)][_1863];
    int _1867 = int(_1859) + 1;
    uint _1869 = uint(int(uint(_1867) >> uint(2)));
    int _1871 = _1867 & 3;
    float _1873 = (*spvDescriptorSet0.vp_c9)._m0[int(_1869)][_1871];
    float _1875 = fma(_1743, _1851, _1853);
    float _1877 = fma(_1717, _1851, _1855);
    float _1879 = fma(_1747, _1851, _1857);
    int _1881 = int(_1389) + int(_1737);
    float _1883 = _1875 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1885 = _1875 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    int _1887 = ~_348;
    int _1889 = _1887 + 1;
    int _1891 = _1837 + 8;
    uint _1893 = uint(int(uint(_1891) >> uint(2)));
    uint _1895 = uint(int(uint(int(_1893)) >> uint(2)));
    int _1897 = int(_1893) & 3;
    float _1899 = (*spvDescriptorSet0.vp_c9)._m0[int(_1895)][_1897];
    int _1901 = int(_1893) + 1;
    uint _1903 = uint(int(uint(_1901) >> uint(2)));
    int _1905 = _1901 & 3;
    float _1907 = (*spvDescriptorSet0.vp_c9)._m0[int(_1903)][_1905];
    float _1909 = fma(_1877, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1883);
    float _1911 = fma(_1877, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1885);
    float _1913 = -_1107;
    float _1915 = _1709 * _1913;
    float _1917 = -_1273;
    float _1919 = _1709 * _1917;
    float _1921 = fma(_1879, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1909);
    float _1923 = _1765 * _1107;
    float _1925 = _1755 * _1107;
    float _1927 = _1875 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1929 = fma(_1879, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1911);
    float _1931 = _1921 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _1933 = _1765 * _1273;
    float _1935 = fma(_1877, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1927);
    float _1937 = _1755 * _1273;
    float _1939 = -_1143;
    float _1941 = _1709 * _1939;
    float _1943 = _1765 * _1143;
    float _1945 = fma(_1879, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1935);
    int _1947 = _1889 * _1881;
    int _1949 = _1947 + _1243;
    float _1951 = _1755 * _1143;
    float _1953 = _1929 * (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _1955 = _1931 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1957 = _1931 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1959 = _1945 * (*spvDescriptorSet0.vp_c7)._m0[0].z;
    bool _1961 = uint(_1949) >= uint(_348);
    float _1963 = fma(_1953, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1955);
    float _1965 = fma(_1953, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1957);
    float _1967 = _1963;
    if (!_460)
    {
        _1357 = 0.0;
    }
    float _1969 = _1357;
    float _1971 = fma(_1959, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1963);
    float _1973 = _1969;
    if (!_460)
    {
        _1359 = 0.0;
    }
    float _1975 = _1359;
    float _1977 = fma(_1959, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1965);
    bool _1979 = !_1961;
    int _1981 = _1979 ? 0 : (-1);
    float _1983 = _1975;
    if (!_460)
    {
        _1967 = 0.0;
    }
    float _1985 = _1967;
    bool _1987 = !_460;
    float _1989 = _1985;
    if (!_1987)
    {
        float _1991 = -_1695;
        float _1993 = _1991 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1995 = -_514;
        float _1997 = _1995 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1999 = _1993 * _1993;
        float _2001 = fma(_1997, _1997, _1999);
        float _2003 = fma(_1097, _1097, _2001);
        float _2005 = rsqrt(_2003);
        float _2007 = _2005 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
        float _2009 = _1997 * _2007;
        float _2011 = _1993 * _2007;
        float _2013 = _1097 * _2007;
        _1989 = _2013;
        _1973 = _2009;
        _1983 = _2011;
    }
    float _2015 = _1989;
    float _2017 = _1973;
    float _2019 = _1983;
    int _2021 = ~_1881;
    int _2023 = _2021 + _1981;
    int _2025 = _2023 + 1;
    float _2027 = _1977 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _2029 = _1971 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    int _2031 = _1789 & 3;
    float _2033 = fma(_1791, _1077, _1915);
    float _2035 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2037 = _2027 + _2035;
    float _2039 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2041 = _2029 + _2039;
    bool _2043 = uint(_2031) > 1u;
    float _2045 = fma(_1791, _1141, _1941);
    int _2047 = _1789 & 3;
    bool _2049 = _2047 != 0;
    float _2051 = _2037 * _2037;
    float _2053 = _2041 * _2041;
    float _2055 = fma(_1791, _1275, _1919);
    int _2057 = _2049 ? 0 : 1;
    int _2059 = _348 * _2025;
    int _2061 = _2059 + _1243;
    float _2063 = _2051 + _2053;
    bool _2065 = _2031 != 3;
    float _2067 = _1931 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    int _2069 = ~_2057;
    int _2071 = _2069 + 1;
    int _2073 = _2071 + 1;
    float _2075 = sqrt(_2063);
    int _2077 = _2073;
    float _2079 = _2051;
    float _2081 = _2053;
    float _2083 = _2027;
    float _2085 = _2029;
    float _2087 = _2017;
    float _2089 = _2015;
    if (!_2043)
    {
        int _2091 = ~_2057;
        int _2093 = _2091 + 1;
        _2077 = _2093;
    }
    int _2095 = _2077;
    float _2097 = fma(_1769, _1077, _1923);
    bool _2099 = uint(_2031) >= 2u;
    float _2101 = fma(_1953, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2067);
    int _2103 = abs(_2095);
    float _2105 = fma(_1777, _1077, _1925);
    int _2107 = _2099 ? 0 : 1;
    float _2109 = fma(_1959, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2101);
    bool _2111 = !_2049;
    int _2113 = _2111 ? 0 : 1;
    float _2115 = _2109 + (*spvDescriptorSet0.vp_c10)._m0[9].w;
    int _2117 = ~_2107;
    int _2119 = _2117 + 1;
    int _2121 = _2119 + 1;
    int _2123 = abs(_2113);
    int _2125 = _2121;
    float _2127 = _2097;
    if (_2065)
    {
        int _2129 = ~_2107;
        int _2131 = _2129 + 1;
        _2125 = _2131;
    }
    int _2133 = _2125;
    int _2135 = ~_2103;
    int _2137 = _2135 + 1;
    int _2139 = _2137 + 1;
    bool _2141 = _2075 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _2143 = abs(_2133);
    int _2145 = _2139 * as_type<int>(_1873);
    int _2147 = ~_2123;
    int _2149 = _2147 + 1;
    int _2151 = _2149 + 1;
    bool _2153 = _2031 != 3;
    int _2155 = ~_2143;
    int _2157 = _2155 + 1;
    int _2159 = _2157 + 1;
    int _2161 = _2151 * as_type<int>(_1865);
    int _2163 = _2161 + _2145;
    bool _2165 = !_520;
    int _2167 = _2165 ? 0 : 1;
    bool _2169 = !_2153;
    int _2171 = _2169 ? 0 : (-1);
    int _2173 = _2159 * as_type<int>(_1899);
    int _2175 = _2173 + _2163;
    int _2177 = abs(_2167);
    int _2179 = abs(_2171);
    int _2181 = ~_2179;
    int _2183 = _2181 + 1;
    int _2185 = _2183 + 1;
    float _2187 = as_type<float>(_2177);
    if (!_2141)
    {
        _2187 = _2115;
    }
    float _2189 = _2187;
    bool _2191 = !_2141;
    float _2193 = _2189;
    if (!_2191)
    {
        float _2195 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2197 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2199 = _2075 + _2197;
        float _2201 = rsqrt(_2063);
        float _2203 = _2199 * _2195;
        float _2205 = _2115 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2207 = _2203 * 0.15915493667125701904296875;
        float _2209 = _2207 * 6.283185482025146484375;
        float _2211 = sin(_2209);
        float _2213 = _2207 * 6.283185482025146484375;
        float _2215 = cos(_2213);
        float _2217 = fma(_2211, _2205, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2219 = _2201 * _2217;
        float _2221 = fma(_2037, _2219, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2223 = _2215 + (-1.0);
        float _2225 = fma(_2041, _2219, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2227 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2229 = _2221 + _2227;
        float _2231 = _2223 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2233 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2235 = _2225 + _2233;
        float _2237 = _2229 * _2229;
        float _2239 = fma(_2115, _2215, _2231);
        float _2241 = _2235 * _2235;
        _2193 = _2239;
        _2079 = _2237;
        _2081 = _2241;
        _2083 = _2221;
        _2085 = _2225;
    }
    float _2243 = _2193;
    float _2245 = _2079;
    float _2247 = _2081;
    float _2249 = _2083;
    float _2251 = _2085;
    float _2253 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2255 = _2243 + _2253;
    int _2257 = _2185 * as_type<int>(_1907);
    int _2259 = _2257 + _2175;
    int _2261 = ~_2177;
    int _2263 = _2261 + 1;
    int _2265 = _2263 + 1;
    float _2267 = fma(_1769, _1275, _1933);
    float _2269 = fma(_2255, _2255, _2245);
    float _2271 = fma(_1777, _1275, _1937);
    bool _2273 = !_1245;
    int _2275 = _2273 ? _2061 : (-1);
    int _2277 = _2259 * _2265;
    float _2279 = _2269 + _2247;
    float _2281 = fma(_1769, _1141, _1943);
    float _2283 = fma(_1777, _1141, _1951);
    int _2285 = _2275 * _2177;
    int _2287 = _2285 + _2277;
    float _2289 = fma(_1767, _1103, _2033);
    float _2291 = fma(_1767, _1277, _2055);
    float _2293 = sqrt(_2279);
    float _2295 = fma(_1767, _1145, _2045);
    float _2297 = fma(_1781, _1145, _2281);
    float _2299 = fma(_1781, _1277, _2267);
    float _2301 = fma(_1785, _1277, _2271);
    float _2303 = _1169 + 0.5;
    float _2305 = _1429 + 0.5;
    float _2307 = fma(_1781, _1103, _2097);
    float _2309 = fma(_1785, _1145, _2283);
    float _2311 = float(_2287);
    float _2313 = fma(_1785, _1103, _2105);
    out.m_77.x = _2303;
    out.m_77.y = _2305;
    out.m_79.x = _2291;
    out.m_79.y = _2299;
    out.m_79.z = _2301;
    bool _2315 = _2293 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2317 = isnan(_2293);
    bool _2319 = _2315 || _2317;
    bool _2321 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2323 = _2319 || _2321;
    out.m_81.x = _2295;
    out.m_81.y = _2297;
    out.m_81.z = _2309;
    out.m_83.y = _2311;
    out.m_85.x = _2289;
    out.m_85.y = _2307;
    out.m_85.z = _2313;
    float _2325 = _2271;
    if (!_2323)
    {
        _2325 = 1.0;
    }
    float _2327 = _2325;
    bool _2329 = !_2323;
    float _2331 = _2327;
    if (!_2329)
    {
        bool _2333 = _2293 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2335 = isnan(_2293);
        bool _2337 = _2333 || _2335;
        bool _2339 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2341 = _2337 || _2339;
        if (!_2341)
        {
            float _2343 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2345 = _2293 + _2343;
            float _2347 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2349 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2347;
            float _2351 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2353 = _2351 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2355 = 1.0 / _2349;
            float _2357 = _2345 * _2355;
            float _2359 = fma(_2357, _2353, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2331 = _2359;
            _2361 = true;
        }
        else
        {
            bool _2363 = _2293 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2365 = isnan(_2293);
            bool _2367 = _2363 || _2365;
            bool _2369 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2371 = _2367 || _2369;
            if (!_2371)
            {
                float _2373 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2375 = _2293 + _2373;
                float _2377 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2379 = _2377 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2381 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2383 = _2381 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2385 = 1.0 / _2379;
                float _2387 = _2375 * _2385;
                float _2389 = fma(_2387, _2383, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2331 = _2389;
                _2361 = true;
            }
            else
            {
                _2331 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2361 = false;
    float _2391 = _2331;
    float _2393 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2395 = _2243 + _2393;
    float _2397 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2399 = _2249 + _2397;
    float _2401 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2403 = _2251 + _2401;
    float _2405 = _715 + _2015;
    float _2407 = fma(_2395, _2391, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2409 = fma(_2399, _2391, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2411 = fma(_2403, _2391, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2413 = _514 + _2017;
    float _2415 = _2407 + _2019;
    float _2417 = _2409 + _2017;
    float _2419 = _2411 + _2015;
    float _2421 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2423 = _2415 + _2421;
    float _2425 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2427 = _2417 + _2425;
    float _2429 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2431 = _2419 + _2429;
    float _2433 = _2415 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2435 = _2423 * _2423;
    float _2437 = fma(_2417, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2433);
    float _2439 = fma(_2427, _2427, _2435);
    float _2441 = fma(_2419, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2437);
    float _2443 = fma(_2431, _2431, _2439);
    float _2445 = rsqrt(_2443);
    float _2447 = sqrt(_2443);
    float _2449 = _2445 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2451 = _2427 * _2449;
    float _2453 = _2431 * _2449;
    float _2455 = _2451 * _2451;
    float _2457 = _2453 * _2453;
    float _2459 = _2455 + _2457;
    float _2461 = sqrt(_2459);
    bool _2463 = _2461 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2465 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2467 = _2461 + _2465;
    float _2469 = _2295;
    float _2471 = _2467;
    float _2473 = _2423;
    if (_2463)
    {
        float _2475 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2469 = _2475;
    }
    float _2477 = _2469;
    if (!_2463)
    {
        _2087 = _2453;
    }
    float _2479 = _2087;
    float _2481 = _2479;
    if (_2463)
    {
        float _2483 = rsqrt(_2459);
        _1361 = _2483;
    }
    float _2485 = _1361;
    float _2487 = _2485;
    if (_2463)
    {
        float _2489 = _2467 * _2477;
        _2471 = _2489;
    }
    float _2491 = _2471;
    if (_2463)
    {
        float _2493 = _2491 * 0.15915493667125701904296875;
        _2127 = _2493;
    }
    float _2495 = _2127;
    float _2497 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2499 = _2309;
    float _2501 = _2497;
    float _2503 = _2495;
    if (_2463)
    {
        float _2505 = _2495 * 6.283185482025146484375;
        float _2507 = sin(_2505);
        _2499 = _2507;
    }
    float _2509 = _2499;
    float _2511 = precise::max(0.0, _2497);
    float _2513 = _2297;
    if (_2463)
    {
        float _2515 = _2495 * 6.283185482025146484375;
        float _2517 = cos(_2515);
        _2513 = _2517;
    }
    float _2519 = _2513;
    float _2521 = -_2449;
    float _2523 = -_2511;
    float _2525 = fma(_2423, _2521, _2523);
    if (_2463)
    {
        float _2527 = _2525 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2501 = _2527;
    }
    float _2529 = _2501;
    float _2531 = fma(_2413, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2533 = _2509;
    float _2535 = _2529;
    if (_2463)
    {
        float _2537 = fma(_2509, _2529, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2533 = _2537;
    }
    float _2539 = _2533;
    float _2541 = _2539;
    if (!_2463)
    {
        _2503 = _2525;
    }
    float _2543 = _2503;
    float _2545 = floor(_2531);
    float _2547 = _2543;
    if (_2463)
    {
        float _2549 = _2485 * _2539;
        _2089 = _2549;
    }
    float _2551 = _2089;
    if (!_2463)
    {
        _2487 = _2451;
    }
    float _2553 = _2487;
    float _2555 = _2553;
    if (_2463)
    {
        float _2557 = _2519 + (-1.0);
        _2535 = _2557;
    }
    float _2559 = _2535;
    float _2561 = _2559;
    if (_2463)
    {
        float _2563 = _2451 * _2551;
        _2555 = _2563;
    }
    float _2565 = _2555;
    if (_2463)
    {
        float _2567 = _2453 * _2551;
        _2481 = _2567;
    }
    float _2569 = _2481;
    float _2571 = _2415 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_2463)
    {
        float _2573 = _2559 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2541 = _2573;
    }
    float _2575 = _2541;
    float _2577 = _2575;
    if (!_2463)
    {
        _2561 = _2455;
    }
    float _2579 = _2561;
    float _2581 = _2579;
    if (_2463)
    {
        float _2583 = _2565 * _2565;
        _2581 = _2583;
    }
    float _2585 = _2581;
    float _2587 = _2415 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_2463)
    {
        float _2589 = fma(_2525, _2519, _2575);
        _2547 = _2589;
    }
    float _2591 = _2547;
    if (!_2463)
    {
        _2577 = _2457;
    }
    float _2593 = _2577;
    float _2595 = _2593;
    if (_2463)
    {
        float _2597 = _2569 * _2569;
        _2595 = _2597;
    }
    float _2599 = _2595;
    float _2601 = fma(_2417, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2571);
    float _2603 = fma(_2591, _2591, _2585);
    float _2605 = fma(_2417, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2587);
    float _2607 = fma(_2419, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2601);
    float _2609 = _2603 + _2599;
    float _2611 = _2415 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2613 = fma(_2419, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2605);
    float _2615 = rsqrt(_2609);
    float _2617 = fma(_2417, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2611);
    float _2619 = _2607 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2621 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2623 = fma(_2447, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2621);
    float _2625 = precise::clamp(_2623, 0.0, 1.0);
    float _2627 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2629 = fma(_2419, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2617);
    float _2631 = _2613 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2633 = -_2625;
    float _2635 = _2633 + 1.0;
    float _2637 = _2619 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2639 = _2629 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2641 = _2631 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2643 = _2441 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2645 = fma(_2639, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2637);
    float _2647 = abs(_2635);
    float _2649 = log2(_2647);
    float _2651 = -_2641;
    float _2653 = fma(_2651, _2627, 1.0);
    float _2655 = _2615 * _2591;
    float _2657 = fma(_2631, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2645);
    float _2659 = _2615 * _2565;
    float _2661 = fma(_2405, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2663 = _2615 * _2569;
    float _2665 = fma(_2643, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2657);
    float _2667 = _2659 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2669 = floor(_2661);
    float _2671 = -_2545;
    float _2673 = _2531 + _2671;
    float _2675 = _2619 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2677 = -_2667;
    float _2679 = fma(_2655, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2677);
    float _2681 = fma(_2639, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2675);
    float _2683 = -_2663;
    float _2685 = fma(_2683, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2679);
    float _2687 = _2649 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2689 = log2(_2653);
    float _2691 = _2619 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2693 = fma(_2685, -0.5, 0.5);
    float _2695 = fma(_2685, 0.5, 0.5);
    float _2697 = fma(_2631, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2681);
    float _2699 = fma(_2639, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2691);
    float _2701 = -_2669;
    float _2703 = _2661 + _2701;
    float _2705 = exp2(_2687);
    float _2707 = _2655 + 1.0;
    float _2709 = fma(_2695, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2711 = fma(_2631, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2699);
    float _2713 = fma(_2643, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2697);
    float _2715 = fma(_2695, _2709, -0.212114393711090087890625);
    float _2717 = 1.0 / _2665;
    float _2719 = _2689 * 0.693147182464599609375;
    float _2721 = fma(_2695, _2715, 1.570728778839111328125);
    float _2723 = _2719 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2725 = sqrt(_2693);
    float _2727 = -_2655;
    float _2729 = fma(_2705, _2707, _2727);
    float _2731 = fma(_2643, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2711);
    float _2733 = fma(_2729, 0.5, 0.5);
    float _2735 = _2713 * _2717;
    float _2737 = _2731 * _2717;
    float _2739 = fma(_2735, 0.5, 0.5);
    float _2741 = fma(_2737, -0.5, 0.5);
    float _2743 = _2725 * 0.636619746685028076171875;
    float2 _7602 = float2(_2673, _2703);
    float _2745 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7602, float2(0.0), isnan(_7602)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7602, float2(0.0), isnan(_7602)), level(0.0)).x;
    float3 _7613 = float3(_2739, _2741, _2723);
    float _2747 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7613, float3(0.0), isnan(_7613)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7613, float3(0.0), isnan(_7613)), level(0.0)).x;
    float3 _7624 = float3(_2739, _2741, _2723);
    float4 _2750 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7624, float3(0.0), isnan(_7624)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7624, float3(0.0), isnan(_7624)), level(0.0)).xyzw;
    float _2752 = _2750.x;
    float _2754 = _2750.y;
    float _2756 = _2750.z;
    float _2758 = _2750.w;
    float _2760 = -_2721;
    float _2762 = fma(_2743, _2760, 1.0);
    float2 _7645 = float2(_2762, _2733);
    float3 _2766 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7645, float2(0.0), isnan(_7645)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7645, float2(0.0), isnan(_7645)), level(0.0)).xyz;
    float _2768 = _2766.x;
    float _2770 = _2766.y;
    float _2772 = _2766.z;
    float _2774 = _1695 + _2019;
    float _2776 = _2619 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2778 = _2649 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_87.x = _2427;
    out.m_87.y = _2423;
    out.m_87.z = _2431;
    float _2780 = _2774 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2782 = _2774 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2784 = fma(_2639, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2776);
    float _2786 = _2713 + _2665;
    float _2788 = fma(_2413, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2780);
    float _2790 = fma(_2413, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2782);
    float _2792 = fma(_2631, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2784);
    float _2794 = fma(_2405, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2788);
    float _2796 = fma(_2405, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2790);
    float _2798 = fma(_2643, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2792);
    float _2800 = _2794 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2802 = _2796 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2804 = _2786 * 0.5;
    float _2806 = 1.0 / _2800;
    float _2808 = _2802 + _2800;
    out.gl_Position.x = _2713;
    out.gl_Position.y = _2731;
    out.gl_Position.z = _2798;
    out.gl_Position.w = _2665;
    float _2810 = _2798 + _2665;
    float _2812 = _2810 * 0.5;
    float _2814 = _2808 * _2806;
    float _2816 = _2814 * 0.5;
    float _2818 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2820 = fma(_2816, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2818);
    float _2822 = _2665 * 0.5;
    float _2824 = 1.0 / _2820;
    float _2826 = fma(_2731, -0.5, _2822);
    out.m_89.x = _2804;
    out.m_89.y = _2826;
    out.m_89.z = _2812;
    out.m_89.w = _2665;
    float _2828 = exp2(_2778);
    bool _2830 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2832 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2834 = _2830 || _2832;
    bool _2836 = isnan(0.5);
    bool _2838 = _2834 || _2836;
    float _2840 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2842 = _2824 * _2840;
    float _2844 = abs(_2842);
    float _2846 = log2(_2844);
    bool _2848 = _2842 <= 8000.0;
    bool _2850 = isnan(_2842);
    bool _2852 = _2848 || _2850;
    bool _2854 = isnan(8000.0);
    bool _2856 = _2852 || _2854;
    float _2858 = float(_2856);
    float _2860 = _2858;
    float _2862 = _2665;
    float _2864 = _2713;
    float _2866 = _2842;
    if (_2838)
    {
        _2473 = 1.0;
    }
    float _2868 = _2473;
    float _2870 = _2846 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2872 = exp2(_2870);
    float _2874 = fma(_2872, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2876 = precise::clamp(_2874, 0.0, 1.0);
    float _2878 = in.m_91.x;
    float _2880 = fma(_2876, -2.0, 3.0);
    float _2882 = _2876 * _2876;
    float _2884 = _2882 * _2880;
    float _2886 = -_2884;
    float _2888 = _2886 + 1.0;
    float _2890 = fma(_2888, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2884);
    float _2892 = _2858 * _2890;
    float _2894 = _2868;
    if (_2838)
    {
        _2860 = 1.0;
    }
    float _2896 = _2860;
    float _2898 = _2896;
    if (!_2838)
    {
        float _2900 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2902 = _2900 * 0.15915493667125701904296875;
        float _2904 = _2902 * 6.283185482025146484375;
        float _2906 = cos(_2904);
        float _2908 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2910 = _2908 * 0.15915493667125701904296875;
        float _2912 = _2902 * 6.283185482025146484375;
        float _2914 = sin(_2912);
        float _2916 = 1.0 / _2906;
        float _2918 = _2910 * 6.283185482025146484375;
        float _2920 = cos(_2918);
        float _2922 = _2914 * _2916;
        float _2924 = _2910 * 6.283185482025146484375;
        float _2926 = sin(_2924);
        float _2928 = _2920 * _2922;
        float _2930 = 1.0 / _2928;
        float _2932 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2934 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2932;
        float _2936 = 1.0 / _2934;
        float _2938 = _2926 * _2930;
        float _2940 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2942 = fma(_2842, _2938, _2940);
        float _2944 = _2942 * _2936;
        float _2946 = precise::clamp(_2944, 0.0, 1.0);
        _2862 = _2910;
        _2894 = _2946;
        _2864 = _2916;
    }
    float _2948 = _2862;
    float _2950 = _2894;
    float _2952 = _2864;
    float _2954 = _2948;
    float _2956 = _2952;
    if (!_2838)
    {
        float _2958 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2960 = _2958 * 0.15915493667125701904296875;
        float _2962 = _2960 * 6.283185482025146484375;
        float _2964 = cos(_2962);
        float _2966 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2968 = _2966 * 0.15915493667125701904296875;
        float _2970 = _2960 * 6.283185482025146484375;
        float _2972 = sin(_2970);
        float _2974 = 1.0 / _2964;
        float _2976 = _2968 * 6.283185482025146484375;
        float _2978 = cos(_2976);
        float _2980 = _2972 * _2974;
        float _2982 = _2968 * 6.283185482025146484375;
        float _2984 = sin(_2982);
        float _2986 = _2978 * _2980;
        float _2988 = 1.0 / _2986;
        float _2990 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2992 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2990;
        float _2994 = 1.0 / _2992;
        float _2996 = _2984 * _2988;
        float _2998 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3000 = fma(_2842, _2996, _2998);
        float _3002 = _3000 * _2994;
        float _3004 = precise::clamp(_3002, 0.0, 1.0);
        float _3006 = -_3004;
        float _3008 = _3006 + 1.0;
        _2898 = _3008;
        _2954 = _2974;
        _2866 = _3004;
        _2956 = _2968;
    }
    float _3010 = _2898;
    float _3012 = _2954;
    float _3014 = _2866;
    float _3016 = _2956;
    float _3018 = -_2828;
    float _3020 = _3018 + 1.0;
    float _3022 = _2892 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3024 = -_2745;
    float _3026 = _3024 + 1.0;
    float _3028 = _3020 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _3030 = _2447 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3032 = isnan(_2447);
    bool _3034 = _3030 || _3032;
    bool _3036 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3038 = _3034 || _3036;
    float _3040 = _3026 * _3022;
    float _3042 = precise::clamp(_3040, 0.0, 1.0);
    float _3044 = _2950 * _3010;
    float _3046 = _3028 * _2747;
    float _3048 = -_3028;
    float _3050 = _3048 + 1.0;
    float _3052 = -_3042;
    float _3054 = fma(_3052, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3056 = _2758 * _3046;
    float _3058 = _2772 * _3046;
    float _3060 = _3054 * _2878;
    float _3062 = _2758 * _3050;
    float _3064 = fma(_2768, _3056, _2752);
    float _3066 = fma(_2770, _3056, _2754);
    float _3068 = _3060 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3070 = fma(_2758, _3058, _2756);
    float _3072 = _3016;
    float _3074 = _3012;
    float _3076 = _3028;
    float _3078 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _3080 = _3014;
    float _3082 = _3050;
    if (!_3038)
    {
        _3072 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3084 = _3072;
    float _3086 = _3044 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3088 = _3084;
    float _3090 = _3084;
    if (!_3038)
    {
        _3074 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3092 = _3074;
    out.m_93.x = _3068;
    float _3094 = _3092;
    float _3096 = _3092;
    if (!_3038)
    {
        _3076 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3098 = _3076;
    float _3100 = _3098;
    float _3102 = _3098;
    if (!_3038)
    {
        _3078 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3104 = _3078;
    out.m_95.x = _3064;
    out.m_95.y = _3066;
    out.m_95.z = _3070;
    out.m_95.w = _3062;
    float _3106 = _3104;
    float _3108 = _3104;
    if (!_3038)
    {
        _3080 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3110 = _3080;
    float _3112 = _3110;
    float _3114 = _3110;
    if (!_3038)
    {
        _3082 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3116 = _3082;
    bool _3118 = !_3038;
    float _3120 = _3116;
    float _3122 = _3116;
    if (!_3118)
    {
        bool _3124 = _2447 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3126 = isnan(_2447);
        bool _3128 = _3124 || _3126;
        bool _3130 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3132 = _3128 || _3130;
        if (!_3132)
        {
            float _3134 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3136 = _2447 + _3134;
            float _3138 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3140 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3138;
            float _3142 = 1.0 / _3140;
            float _3144 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3146 = _3144 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3148 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3150 = _3148 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3152 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3154 = _3152 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3156 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3158 = _3156 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3160 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3162 = _3160 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3164 = _3136 * _3142;
            float _3166 = precise::clamp(_3164, 0.0, 1.0);
            float _3168 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3170 = _3168 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3172 = fma(_3166, _3146, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3174 = fma(_3166, _3170, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3176 = fma(_3166, _3150, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3178 = fma(_3166, _3154, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3180 = fma(_3166, _3158, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3182 = fma(_3166, _3162, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3096 = _3172;
            _3114 = _3180;
            _3090 = _3174;
            _3108 = _3178;
            _3102 = _3176;
            _3122 = _3182;
            _3184 = true;
        }
        else
        {
            bool _3186 = _2447 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3188 = isnan(_2447);
            bool _3190 = _3186 || _3188;
            bool _3192 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3194 = _3190 || _3192;
            if (!_3194)
            {
                _3088 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3196 = _3088;
            _3090 = _3196;
            if (!_3194)
            {
                _3094 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3198 = _3094;
            _3096 = _3198;
            if (!_3194)
            {
                _3100 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3200 = _3100;
            _3102 = _3200;
            if (!_3194)
            {
                _3106 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3202 = _3106;
            _3108 = _3202;
            if (!_3194)
            {
                _3112 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3204 = _3112;
            _3114 = _3204;
            if (!_3194)
            {
                _3120 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3206 = _3120;
            bool _3208 = !_3194;
            _3122 = _3206;
            if (!_3208)
            {
                bool _3210 = _2447 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3212 = isnan(_2447);
                bool _3214 = _3210 || _3212;
                bool _3216 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3218 = _3214 || _3216;
                if (!_3218)
                {
                    float _3220 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3222 = _2447 + _3220;
                    float _3224 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3226 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3224;
                    float _3228 = 1.0 / _3226;
                    float _3230 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3232 = _3230 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3234 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3236 = _3234 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3238 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3240 = _3238 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3242 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3244 = _3242 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3246 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3248 = _3246 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3250 = _3222 * _3228;
                    float _3252 = precise::clamp(_3250, 0.0, 1.0);
                    float _3254 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3256 = _3254 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3258 = fma(_3252, _3232, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3260 = fma(_3252, _3256, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3262 = fma(_3252, _3236, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3264 = fma(_3252, _3240, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3266 = fma(_3252, _3244, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3268 = fma(_3252, _3248, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3096 = _3258;
                    _3114 = _3266;
                    _3090 = _3260;
                    _3108 = _3264;
                    _3102 = _3262;
                    _3122 = _3268;
                    _3184 = true;
                }
                else
                {
                    _3096 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3114 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3090 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3108 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3102 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3122 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3184 = false;
    float _3270 = _3096;
    float _3272 = _3114;
    float _3274 = _3090;
    float _3276 = _3108;
    float _3278 = _3102;
    float _3280 = _3122;
    float _3282 = fma(_2307, -0.5, 0.5);
    float _3284 = precise::clamp(_3282, 0.0, 1.0);
    float _3286 = -_3270;
    float _3288 = _3286 + _3272;
    float _3290 = _3086 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3292 = -_3274;
    float _3294 = _3292 + _3276;
    out.m_97.x = 0.0;
    float _3296 = fma(_3284, _3288, _3270);
    float _3298 = fma(_3284, _3294, _3274);
    out.m_55.x = _3290;
    float _3300 = -_3278;
    float _3302 = _3300 + _3280;
    float _3304 = _3296 * 0.586610972881317138671875;
    bool _3306 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3308 = fma(_3284, _3302, _3278);
    float _3310 = fma(_3298, 0.298911988735198974609375, _3304);
    bool _3312 = _2950 > 0.0;
    bool _3314 = isnan(_2950);
    bool _3316 = _3312 || _3314;
    bool _3318 = isnan(0.0);
    bool _3320 = _3316 || _3318;
    float _3322 = fma(_3308, 0.114477999508380889892578125, _3310);
    bool _3324 = _3010 <= 0.0;
    bool _3326 = !_3320;
    bool _3328 = _3324 || _3326;
    float _3330 = -_3322;
    float _3332 = _3298 + _3330;
    float _3334 = -_3322;
    float _3336 = _3296 + _3334;
    float _3338 = -_3322;
    float _3340 = _3308 + _3338;
    float _3342 = fma(_3332, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3322);
    float _3344 = fma(_3336, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3322);
    float _3346 = fma(_3340, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3322);
    bool _3348 = !_3306;
    if (!_3348)
    {
        float _3350 = -_2415;
        float _3352 = _3350 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3354 = -_2417;
        float _3356 = _3354 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3358 = -_2419;
        float _3360 = _3358 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3362 = _3352 * _3352;
        float _3364 = fma(_3356, _3356, _3362);
        float _3366 = fma(_3360, _3360, _3364);
        float _3368 = sqrt(_3366);
        float _3370 = rsqrt(_3366);
        float _3372 = -_3368;
        float _3374 = _3372 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3376 = _3374 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3378 = precise::clamp(_3376, 0.0, 1.0);
        float _3380 = _3356 * _3370;
        float _3382 = _3352 * _3370;
        float _3384 = abs(_3378);
        float _3386 = log2(_3384);
        float _3388 = _3360 * _3370;
        float _3390 = _3380 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3392 = _2307 * _3382;
        float _3394 = -_3382;
        float _3396 = -_3390;
        float _3398 = fma(_3394, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3396);
        float _3400 = fma(_2289, _3380, _3392);
        float _3402 = -_3388;
        float _3404 = fma(_3402, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3398);
        float _3406 = fma(_2313, _3388, _3400);
        float _3408 = precise::clamp(_3406, 0.0, 1.0);
        float _3410 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3412 = _3404 + _3410;
        float _3414 = _3386 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3416 = _3412 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3418 = precise::clamp(_3416, 0.0, 1.0);
        float _3420 = exp2(_3414);
        float _3422 = _3420 * _3418;
        float _3424 = _3408 * _3422;
        float _3426 = _3424 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3428 = _3424 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3430 = _3424 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_97.x = _3426;
        out.m_97.y = _3428;
        out.m_97.z = _3430;
    }
    out.m_99.x = _3342;
    out.m_99.y = _3344;
    out.m_99.z = _3346;
    if (!_3328)
    {
        return out;
    }
    out.m_55.x = 0.0;
    float _3432 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3432;
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
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3184 = false;
    bool _2361 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _113 = in.m_48.w;
    float _115 = in.m_50.w;
    float _117 = trunc(_113);
    int _120 = int(_117);
    float _122 = -_115;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _124;
    bool _128 = _120 >= 1;
    float _130 = 0.0;
    float _132 = _115;
    if (!_128)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _130;
    if (!_128)
    {
        out.m_55.x = 0.0;
    }
    int _136 = 0;
    if (!_128)
    {
        float _138 = _134 * 5.0;
        _136 = as_type<int>(_138);
    }
    int _140 = _136;
    int _142 = _140;
    if (!_128)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3499 = as_type<float>(_140);
        out.gl_Position.z = _3499;
    }
    if (!_128)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _144 = _115 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _146 = isnan(_115);
    bool _148 = _144 || _146;
    bool _150 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _152 = _148 || _150;
    float _154 = float(_120);
    bool _156 = _124 >= _154;
    bool _158 = !_152;
    bool _160 = _156 || _158;
    if (_160)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _132;
    if (_160)
    {
        out.m_55.x = 0.0;
    }
    if (_160)
    {
        float _164 = _162 * 5.0;
        _142 = as_type<int>(_164);
    }
    int _166 = _142;
    int _168 = _166;
    if (_160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3555 = as_type<float>(_166);
        out.gl_Position.z = _3555;
    }
    if (_160)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _170 = in.m_57.y;
    float _172 = 1.0 / _154;
    bool _174 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _176 = _124 * _172;
    out.m_59.y = _170;
    bool _178 = !_174;
    float _180 = _176;
    if (!_178)
    {
        float _182 = in.m_61.x;
        float _184 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _186 = _182 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _188 = fma(_186, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _190 = _188 * _184;
        float _192 = floor(_190);
        float _194 = -_192;
        float _196 = _190 + _194;
        _180 = _196;
    }
    float _198 = _180;
    float _200 = in.m_61.x;
    float _202 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _204 = int(_202);
    float _206 = in.m_61.w;
    int _208 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _210 = _208 != 0;
    int _212 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _214 = _212 != 0;
    float _216 = in.m_57.x;
    int _218 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _220 = _218 != 0;
    float _222 = in.m_61.z;
    float _224 = in.m_61.y;
    float _226 = float(_204);
    float _228 = in.m_63.x;
    float _230 = in.m_63.y;
    float _232 = in.m_63.z;
    float _234 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _236 = 1.0 / _226;
    float _238 = _200 * 2.0;
    bool _240 = false;
    if (_210)
    {
        bool _242 = _200 > 0.5;
        _240 = _242;
    }
    bool _244 = _240;
    float _246 = (*spvDescriptorSet0.vp_c8)._m0[28].z * (*spvDescriptorSet0.vp_c8)._m0[1].x;
    bool _248 = _206 > 0.5;
    float _250 = floor(_238);
    int _252 = as_type<int>(_206);
    float _254 = _216;
    if (_210)
    {
        float _256 = -_216;
        float _258 = _256 + 1.0;
        _252 = as_type<int>(_258);
    }
    int _260 = _252;
    int _262 = _260;
    if (_214)
    {
        float _264 = -_216;
        float _266 = _264 + 1.0;
        _168 = as_type<int>(_266);
    }
    int _268 = _168;
    float _270 = 0.0;
    if (!_210)
    {
        _270 = _216;
    }
    float _272 = _270;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[193].y;
    float _276 = fma(_274, 0.100000001490116119384765625, 0.100000001490116119384765625);
    bool _278 = _222 > 0.5;
    float _280 = _272;
    if (_210)
    {
        float _282 = _244 ? as_type<float>(_260) : _216;
        _280 = _282;
    }
    float _284 = _280;
    if (_220)
    {
        float _286 = -_216;
        float _288 = _286 + 1.0;
        _262 = as_type<int>(_288);
    }
    int _290 = _262;
    int _292 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _294 = _292 != 0;
    float _296 = _124 * _236;
    float _298 = 0.0;
    if (!_214)
    {
        _298 = _216;
    }
    float _300 = _298;
    float _302 = _224 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _304 = _300;
    if (_214)
    {
        float _306 = _278 ? as_type<float>(_268) : _216;
        _304 = _306;
    }
    float _308 = _304;
    float _310 = -_170;
    float _312 = _310 + 1.0;
    bool _314 = _224 > 0.5;
    float _316 = trunc(_296);
    int _318 = int(_316);
    bool _320 = !_294;
    int _322 = _320 ? 0 : 1;
    float _324 = _230 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    bool _326 = _250 >= 0.0;
    bool _328 = isnan(_250);
    bool _330 = _326 || _328;
    bool _332 = isnan(0.0);
    bool _334 = _330 || _332;
    float _336 = _200 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    if (_220)
    {
        float _338 = _314 ? as_type<float>(_290) : _216;
        _254 = _338;
    }
    float _340 = _254;
    float _342 = _232 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    int _344 = _314 ? as_type<int>(_312) : as_type<int>(_170);
    float _346 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _348 = int(_346);
    int _350 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _352 = _350 != 0;
    int _354 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _356 = _354 != 0;
    float _358 = -_234;
    float _360 = fma(_336, 2.0, _358);
    int _362 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _364 = _362 != 0;
    float _366 = _324 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _368 = _248 ? as_type<int>(_312) : as_type<int>(_170);
    float _370 = _342 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _372 = _278 ? as_type<int>(_312) : as_type<int>(_170);
    bool _374 = !_352;
    int _376 = _374 ? 0 : 1;
    int _378 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _380 = _378 != 0;
    int _382 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _384 = _382 != 0;
    int _386 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _388 = _386 != 0;
    bool _390 = !_356;
    int _392 = _390 ? 0 : 1;
    float _394 = _388 ? as_type<float>(_344) : _170;
    bool _396 = _250 > 0.0;
    int _398 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _400 = _398 != 0;
    float _402 = _334 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _404 = _364 ? as_type<float>(_372) : _170;
    int _406 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _408 = _406 != 0;
    int _410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _412 = _410 != 0;
    int _414 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _416 = _414 != 0;
    float _418 = in.m_48.x;
    float _420 = in.m_48.y;
    float _422 = in.m_48.z;
    int _424 = ~as_type<int>(_402);
    int _426 = _424 + 1;
    int _428 = _426 + 1;
    int _430 = _428;
    float _432 = _402;
    if (!_396)
    {
        int _434 = ~as_type<int>(_402);
        int _436 = _434 + 1;
        _430 = _436;
    }
    int _438 = _430;
    float _440 = _400 ? as_type<float>(_368) : _170;
    int _442 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _444 = _442 != 0;
    float _446 = float(uint(_348));
    bool _448 = !_444;
    float _450 = _448 ? 1.2345600128173828125 : 1.0;
    float _452 = 1.0 / _446;
    bool _454 = !_444;
    float _456 = _454 ? _224 : _200;
    int _458 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1048576;
    bool _460 = _458 != 0;
    int _462 = ~_348;
    int _464 = _462 + 1;
    float _466 = _446;
    if (!_444)
    {
        _432 = _222;
    }
    float _468 = _432;
    float _470 = 0.0;
    float _472 = _468;
    if (!_444)
    {
        _470 = _224;
    }
    float _474 = _470;
    float _476 = 0.0;
    float _478 = _474;
    if (!_444)
    {
        _476 = _222;
    }
    float _480 = _476;
    float _482 = _420 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _484 = 0.0;
    float _486 = _480;
    if (_444)
    {
        _484 = _200;
    }
    float _488 = _484;
    float _490 = _420 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _492 = _488;
    if (_444)
    {
        _466 = _224;
    }
    float _494 = _466;
    float _496 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[4].x, _482);
    float _498 = _494;
    if (_444)
    {
        _472 = _224;
    }
    float _500 = _472;
    float _502 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[6].x, _490);
    if (_444)
    {
        _486 = _224;
    }
    float _504 = _486;
    float _506 = fma(_422, (*spvDescriptorSet0.vp_c10)._m0[4].z, _496);
    float _508 = _504;
    if (!_444)
    {
        _492 = _222;
    }
    float _510 = _492;
    if (_444)
    {
        _478 = _200;
    }
    float _512 = _478;
    float _514 = _506 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    if (!_444)
    {
        _498 = _200;
    }
    float _516 = _498;
    int _518 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _520 = _518 != 0;
    float _522 = _420 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _524 = as_type<int>(_452) + (-2);
    float _526 = _228 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _528 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[5].x, _522);
    float _530 = float(uint(_318));
    float _532 = _526 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _536 = _534 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _538 = as_type<float>(_524) * _530;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _542 = -_246;
    float _544 = fma((*spvDescriptorSet0.vp_c8)._m0[1].z, (*spvDescriptorSet0.vp_c8)._m0[28].x, _542);
    float _546 = (*spvDescriptorSet0.vp_c8)._m0[1].z * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _548 = trunc(_538);
    float _550 = precise::max(_548, 0.0);
    uint _553 = uint(_550);
    float _555 = fma(_302, -2.0, _540);
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _559 = _557 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _563 = _561 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _565 = fma(_422, (*spvDescriptorSet0.vp_c10)._m0[5].z, _528);
    float _567 = 1.0 / _536;
    float _569 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _573 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _571;
    out.m_65.w = _569;
    int _575 = _464 * int(_553);
    int _577 = _575 + _318;
    float _579 = 1.0 / _559;
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _583 = _581 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _585 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _587 = float(uint(_577));
    float _589 = -_546;
    float _591 = fma((*spvDescriptorSet0.vp_c8)._m0[1].y, (*spvDescriptorSet0.vp_c8)._m0[28].z, _589);
    float _593 = _573 * _567;
    float _595 = 1.0 / _563;
    float _597 = as_type<float>(_524) * _587;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _601 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _599;
    float _603 = _456 * _450;
    float _605 = _200 + _222;
    float _607 = _222 * 2.0;
    float _609 = float(_348);
    float _611 = (*spvDescriptorSet0.vp_c8)._m0[1].y * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _613 = trunc(_597);
    float _615 = precise::max(_613, 0.0);
    uint _617 = uint(_615);
    float _619 = _605 + (-1.0);
    float _621 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _585);
    int _623 = ~_348;
    int _625 = _623 + 1;
    float _627 = _224 * 2.0;
    float _629 = fma(_619, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _631 = _200 + _224;
    float _633 = floor(_607);
    float _635 = _124 * _609;
    float _637 = _601 * _579;
    float _639 = _583 * _595;
    float _641 = _631 + (-1.0);
    float _643 = _635 * _172;
    float _645 = _224 + _222;
    int _647 = int(_553) + int(_617);
    float _649 = floor(_627);
    float _651 = in.m_67.x;
    float _653 = in.m_67.y;
    float _655 = in.m_67.z;
    float _657 = -_611;
    float _659 = fma((*spvDescriptorSet0.vp_c8)._m0[1].x, (*spvDescriptorSet0.vp_c8)._m0[28].y, _657);
    int _661 = _625 * _647;
    int _663 = _661 + _318;
    bool _665 = !_412;
    int _667 = _665 ? 0 : 1;
    float _669 = _645 + (-1.0);
    float _671 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _621);
    float _673 = fma(_641, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _675 = uint(_663) >= uint(_348);
    float _677 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _679 = log2(_677);
    bool _681 = !_408;
    int _683 = _681 ? 0 : 1;
    float _685 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _687 = !_675;
    int _689 = _687 ? 0 : (-1);
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _693 = _633 > 0.0;
    float _695 = _222 + (-0.5);
    bool _697 = _633 >= 0.0;
    bool _699 = isnan(_633);
    bool _701 = _697 || _699;
    bool _703 = isnan(0.0);
    bool _705 = _701 || _703;
    float _707 = fma(_422, (*spvDescriptorSet0.vp_c10)._m0[6].z, _502);
    float _709 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _711 = !_416;
    int _713 = _711 ? 0 : 1;
    float _715 = _707 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _717 = _705 ? 0 : 1;
    float _719 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _651);
    bool _721 = _649 > 0.0;
    float _723 = _124 * _679;
    bool _725 = _649 >= 0.0;
    bool _727 = isnan(_649);
    bool _729 = _725 || _727;
    bool _731 = isnan(0.0);
    bool _733 = _729 || _731;
    float _735 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _653);
    float _737 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _655);
    float _739 = _719 * _532;
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _743 = _198 + _741;
    float _745 = exp2(_723);
    float _747 = _735 * _366;
    float _749 = _737 * _370;
    float _751 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _753 = _198 + _751;
    float _755 = _709 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _757 = fma(_637, _743, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _761 = _198 + _759;
    float _763 = fma(_639, _753, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _765 = fma(_755, _394, -0.5);
    int _767 = ~_717;
    int _769 = _767 + 1;
    int _771 = _769 + 1;
    float _773 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _775 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _777 = isnan(_198);
    bool _779 = _775 || _777;
    bool _781 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _783 = _779 || _781;
    float _785 = float(_783);
    float _787 = fma(_593, _761, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    int _789 = _771;
    float _791 = as_type<float>(_524);
    if (!_693)
    {
        int _793 = ~_717;
        int _795 = _793 + 1;
        _789 = _795;
    }
    int _797 = _789;
    float _799 = _200 * 6.283185482025146484375;
    bool _801 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _803 = isnan(_198);
    bool _805 = _801 || _803;
    bool _807 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _809 = _805 || _807;
    float _811 = float(_809);
    float _813 = -_745;
    float _815 = _813 + 1.0;
    bool _817 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _819 = isnan(_198);
    bool _821 = _817 || _819;
    bool _823 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _825 = _821 || _823;
    float _827 = float(_825);
    float _829 = -_785;
    float _831 = _829 + 1.0;
    bool _833 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _835 = isnan(_198);
    bool _837 = _833 || _835;
    bool _839 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _841 = _837 || _839;
    float _843 = float(_841);
    float _845 = floor(_603);
    bool _847 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _849 = isnan(0.0);
    bool _851 = _847 || _849;
    bool _853 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _855 = _851 || _853;
    float _857 = fma(_124, 0.02999999932944774627685546875, _799);
    float _859 = _843 * _831;
    float _861 = _855 ? _815 : 0.0;
    float _863 = -_843;
    float _865 = _863 + 1.0;
    bool _867 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _869 = isnan(1.0);
    bool _871 = _867 || _869;
    bool _873 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _875 = _871 || _873;
    float _877 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _879 = 1.0 + _877;
    float _881 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[78].w, _691);
    float _883 = _773 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _885 = 1.0 / _879;
    float _887 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _881);
    float _889 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _555);
    float _891 = _827 * _865;
    float _893 = -_827;
    float _895 = _893 + 1.0;
    float _897 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _899 = -_889;
    float _901 = fma(_887, _765, _899);
    float _903 = _510 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _905 = _811 * _895;
    float _907 = _857 * 0.15915493667125701904296875;
    float _909 = -_845;
    float _911 = _603 + _909;
    float _913 = -_897;
    float _915 = fma(_903, 2.0, _913);
    float _917 = _757 * _905;
    float _919 = _907 * 6.283185482025146484375;
    float _921 = sin(_919);
    float _923 = in.m_69.x;
    float _925 = in.m_69.y;
    float _927 = in.m_69.z;
    float _929 = _861 * _885;
    float _931 = _733 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _933 = fma(_883, _404, -0.5);
    bool _935 = _653 != 0.0;
    bool _937 = isnan(_653);
    bool _939 = _935 || _937;
    bool _941 = isnan(0.0);
    bool _943 = _939 || _941;
    float _945 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _947 = -_170;
    float _949 = _947 + (*spvDescriptorSet0.vp_c9)._m0[193].x;
    bool _951 = _651 == 0.0;
    bool _953 = !_943;
    bool _955 = _951 && _953;
    float _957 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[83].z, _945);
    float _959 = _512 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _961 = -_811;
    float _963 = _961 + 1.0;
    bool _965 = _655 == 0.0;
    bool _967 = _965 && _955;
    float _969 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _971 = _921 * _949;
    float _973 = fma(_963, (*spvDescriptorSet0.vp_c9)._m0[115].x, _917);
    float _975 = float(_318);
    float _977 = -_969;
    float _979 = fma(_959, 2.0, _977);
    float _981 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _983 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _985 = _609 * _911;
    bool _987 = _975 >= _609;
    bool _989 = isnan(_975);
    bool _991 = _987 || _989;
    bool _993 = isnan(_609);
    bool _995 = _991 || _993;
    float _997 = float(_995);
    float _999 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[83].w, _981);
    int _1001 = ~as_type<int>(_931);
    int _1003 = _1001 + 1;
    int _1005 = _1003 + 1;
    float _1007 = _544 * _544;
    float _1009 = _911;
    int _1011 = _1005;
    float _1013 = _931;
    float _1015 = _865;
    float _1017 = _923;
    float _1019 = _925;
    bool _1021 = _967;
    if (_967)
    {
        _1009 = _923;
    }
    float _1023 = _1009;
    float _1025 = _276 * _971;
    float _1027 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1029 = _1023;
    if (!_721)
    {
        int _1031 = ~as_type<int>(_931);
        int _1033 = _1031 + 1;
        _1011 = _1033;
    }
    int _1035 = _1011;
    float _1037 = fma(_763, _891, _973);
    if (_967)
    {
        _1013 = _925;
    }
    float _1039 = _1013;
    float _1041 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[85].x, -0.5);
    float _1043 = _1039;
    if (_967)
    {
        _508 = _1023;
    }
    float _1045 = _508;
    float _1047 = -_124;
    float _1049 = fma(_1047, (*spvDescriptorSet0.vp_c9)._m0[81].x, _979);
    float _1051 = _1045;
    if (_967)
    {
        _1015 = _927;
    }
    float _1053 = _1015;
    float _1055 = _983 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1057 = _1053;
    if (!_967)
    {
        _1029 = _923;
    }
    float _1059 = _1029;
    float _1061 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1063 = _514 + _1061;
    float _1065 = _1063;
    if (_967)
    {
        _1017 = _1039;
    }
    float _1067 = _1017;
    float _1069 = fma(_1055, _284, -0.5);
    float _1071 = _1067;
    if (!_967)
    {
        _1043 = _925;
    }
    float _1073 = _1043;
    if (!_967)
    {
        float _1075 = fma(_651, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1059);
        _1051 = _1075;
    }
    float _1077 = _1051;
    if (_967)
    {
        _1019 = _1053;
    }
    float _1079 = _1019;
    float _1081 = _1027 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1083 = _1079;
    if (!_967)
    {
        _1057 = _927;
    }
    float _1085 = _1057;
    float _1087 = fma(_591, _591, _1007);
    float _1089 = fma(_1081, _340, -0.5);
    float _1091 = _500 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1093 = fma(_659, _659, _1087);
    float _1095 = -_715;
    float _1097 = _1095 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1099 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (!_967)
    {
        float _1101 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1085);
        _1083 = _1101;
    }
    float _1103 = _1083;
    if (!_967)
    {
        float _1105 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1073);
        _1071 = _1105;
    }
    float _1107 = _1071;
    float _1109 = abs(_1063);
    float _1111 = abs(_1097);
    float _1113 = precise::max(_1109, _1111);
    float _1115 = fma(_200, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1099);
    float _1117 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1119 = rsqrt(_1093);
    bool _1121 = _1113 >= 16.0;
    float _1123 = -_124;
    float _1125 = fma(_1123, (*spvDescriptorSet0.vp_c9)._m0[76].x, _360);
    float _1127 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].z, _957);
    float _1129 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1115);
    float _1131 = fma(_200, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1117);
    int _1133 = abs(_683);
    float _1135 = fma(_1127, _1041, _1049);
    float _1137 = fma(_1129, _1069, _1125);
    float _1139 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1131);
    float _1141 = in.m_71.x;
    float _1143 = in.m_71.y;
    float _1145 = in.m_71.z;
    float _1147 = in.m_71.w;
    float _1149 = float(_797);
    float _1151 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[85].y, -0.5);
    float _1153 = trunc(_997);
    int _1155 = int(_1153);
    float _1157 = _544 * _1119;
    float _1159 = -_124;
    float _1161 = fma(_1159, (*spvDescriptorSet0.vp_c9)._m0[86].x, _915);
    int _1163 = abs(_667);
    float _1165 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _1167 = abs(_713);
    float _1169 = fma(_1139, _1089, _1161);
    float _1171 = _516 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1173 = float(_1163);
    float _1175 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1177 = float(_1133);
    float _1179 = fma(_1091, -2.0, _1165);
    float _1181 = float(_438);
    float _1183 = fma(_1171, -2.0, _1175);
    float _1185 = _1177 * _1149;
    float _1187 = float(_1035);
    float _1189 = trunc(_985);
    int _1191 = int(_1189);
    float _1193 = _1145 * _1059;
    float _1195 = float(_1167);
    float _1197 = _1173 * _1181;
    float _1199 = _1141 * _1073;
    float _1201 = -_1193;
    float _1203 = fma(_1141, _1085, _1201);
    float _1205 = _1143 * _1085;
    float _1207 = _1195 * _1187;
    float _1209 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].w, _999);
    float _1211 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1179);
    float _1213 = -_1205;
    float _1215 = fma(_1145, _1073, _1213);
    int _1217 = abs(_322);
    float _1219 = rsqrt(_671);
    float _1221 = -_1211;
    float _1223 = fma(_1209, _1151, _1221);
    float _1225 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1227 = fma(_787, _859, _1037);
    int _1229 = ~_647;
    int _1231 = _1229 + _689;
    int _1233 = _1231 + 1;
    float _1235 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1225);
    bool _1237 = !_875;
    float _1239 = _1237 ? _124 : _929;
    int _1241 = _1191 * _1217;
    int _1243 = _1241 + _318;
    bool _1245 = _348 == 0;
    int _1247 = _348 * _1233;
    int _1249 = _1247 + _318;
    float _1251 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1235);
    float _1253 = -_1199;
    float _1255 = fma(_1143, _1059, _1253);
    int _1257 = ~_1155;
    int _1259 = _1257 + 1;
    int _1261 = _1259 + 1;
    float _1263 = fma(_785, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1227);
    bool _1265 = !_1245;
    int _1267 = _1265 ? _1249 : (-1);
    float _1269 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1183);
    float _1271 = _1219 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1273 = _1203 * _1147;
    float _1275 = _1215 * _1147;
    float _1277 = _1255 * _1147;
    float _1279 = _1185 * (-2.0);
    float _1281 = trunc(_643);
    int _1283 = int(_1281);
    int _1285 = _1267 * _1261;
    int _1287 = _348 + (-1);
    float _1289 = _1271 * (-0.699999988079071044921875);
    float _1291 = fma(_673, _1279, _673);
    int _1293 = abs(_392);
    float _1295 = _200 + (-0.5);
    int _1297 = _1155 * _1287;
    int _1299 = _1297 + _1285;
    float _1301 = _1289 * 0.15915493667125701904296875;
    bool _1303 = !_380;
    int _1305 = _1303 ? 0 : 1;
    float _1307 = _591 * _1119;
    int _1309 = abs(_376);
    int _1311 = _1299 * _1293;
    bool _1313 = !_384;
    int _1315 = _1313 ? 0 : 1;
    float _1317 = _1207 * (-2.0);
    int _1319 = abs(_1305);
    float _1321 = _1295 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _1323 = _659 * _1119;
    int _1325 = abs(_1315);
    float _1327 = fma(_629, _1317, _629);
    int _1329 = _1283 * _1309;
    int _1331 = _1329 + _1311;
    float _1333 = _1157 * _1157;
    float _1335 = float(uint(_1243));
    int _1337 = _1243 * _1319;
    int _1339 = _1337 + _1331;
    float _1341 = fma(_1239, _1291, _1321);
    float _1343 = fma(_1307, _1307, _1333);
    float _1345 = _1197 * (-2.0);
    int _1347 = _1191 * _1325;
    int _1349 = _1347 + _1339;
    float _1351 = as_type<float>(_524) * _1335;
    float _1353 = _1135 + 0.5;
    float _1355 = _1097 * 0.0625;
    float _1357 = _1107;
    float _1359 = _1273;
    float _1361 = _1277;
    if (_1121)
    {
        float _1363 = _1063 * 0.0625;
        _1065 = _1363;
    }
    float _1365 = _1065;
    float _1367 = float(uint(_1349));
    float _1369 = fma(_1323, _1323, _1343);
    float _1371 = _901 + 0.5;
    float _1373 = _1137 + 0.5;
    float _1375 = _1223 + 0.5;
    float _1377 = as_type<float>(_524) * _1367;
    float _1379 = fma(_685, _1345, _685);
    int _1381 = ~_348;
    int _1383 = _1381 + 1;
    float _1385 = trunc(_1351);
    float _1387 = precise::max(_1385, 0.0);
    uint _1389 = uint(_1387);
    float _1391 = _1121 ? _1355 : _1097;
    out.m_73.x = _1373;
    out.m_73.y = _1371;
    out.m_73.z = _1353;
    out.m_73.w = _1375;
    float _1393 = abs(_1365);
    bool _1395 = _1393 != 0.0;
    bool _1397 = isnan(_1393);
    bool _1399 = _1395 || _1397;
    bool _1401 = isnan(0.0);
    bool _1403 = _1399 || _1401;
    float _1405 = _224 + (-0.5);
    float _1407 = _695 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    float _1409 = _1341 * 0.15915493667125701904296875;
    float _1411 = abs(_1391);
    bool _1413 = _1411 == 0.0;
    bool _1415 = !_1403;
    bool _1417 = _1413 && _1415;
    float _1419 = trunc(_1377);
    float _1421 = precise::max(_1419, 0.0);
    uint _1423 = uint(_1421);
    float _1425 = fma(_1239, _1327, _1407);
    float _1427 = -_1269;
    float _1429 = fma(_1251, _933, _1427);
    float _1431 = _1425 * 0.15915493667125701904296875;
    float _1433 = _1405 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    int _1435 = ~_348;
    int _1437 = _1435 + 1;
    float _1439 = _1409 * 6.283185482025146484375;
    float _1441 = sin(_1439);
    int _1443 = as_type<int>(_1409);
    if (_1417)
    {
        bool _1445 = as_type<int>(_1391) >= 0;
        _1021 = _1445;
    }
    bool _1447 = _1021;
    float _1449 = fma(_1239, _1379, _1433);
    int _1451 = _1383 * int(_1423);
    int _1453 = _1451 + _1349;
    float _1455 = _1409 * 6.283185482025146484375;
    float _1457 = cos(_1455);
    int _1459 = _1437 * int(_1389);
    int _1461 = _1459 + _1243;
    float _1463 = float(uint(_1453));
    float _1465 = as_type<float>(_524) * _1463;
    float _1467 = _1301 * 6.283185482025146484375;
    float _1469 = sin(_1467);
    if (_1417)
    {
        int _1471 = _1447 ? 0 : 1078530011;
        _1443 = _1471;
    }
    int _1473 = _1443;
    float _1475 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1477 = abs(_1391);
    bool _1479 = _1477 == 0.0;
    float _1481 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1483 = _1475 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1485 = _1301 * 6.283185482025146484375;
    float _1487 = cos(_1485);
    float _1489 = _1481 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1491 = _1431 * 6.283185482025146484375;
    float _1493 = cos(_1491);
    float _1495 = trunc(_1465);
    float _1497 = precise::max(_1495, 0.0);
    uint _1499 = uint(_1497);
    float _1501 = rsqrt(_1369);
    float _1503 = float(uint(_1461));
    float _1505 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1507 = _1263 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1509 = as_type<float>(_524) * _1503;
    float _1511 = _1505 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1513 = _1479 ? (-1) : 0;
    int _1515 = _1473;
    if (_1417)
    {
        int _1517 = int(0x80000000) & as_type<int>(_1365);
        int _1519 = _1473 | _1517;
        _791 = as_type<float>(_1519);
    }
    float _1521 = _791;
    bool _1523 = !_1403;
    bool _1525 = _1523 && _1479;
    float _1527 = _1521;
    float _1529 = _1521;
    if (!_1525)
    {
        float _1531 = abs(_1365);
        bool _1533 = _1531 != as_type<float>(0x7f800000u /* inf */);
        bool _1535 = isnan(_1531);
        bool _1537 = _1533 || _1535;
        bool _1539 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1541 = _1537 || _1539;
        float _1543 = abs(_1391);
        bool _1545 = _1543 == as_type<float>(0x7f800000u /* inf */);
        float _1547 = abs(_1391);
        bool _1549 = _1547 == as_type<float>(0x7f800000u /* inf */);
        bool _1551 = !_1541;
        bool _1553 = _1549 && _1551;
        if (_1553)
        {
            bool _1555 = as_type<int>(_1391) >= 0;
            _1513 = _1555 ? (-1) : 0;
        }
        int _1557 = _1513;
        if (_1553)
        {
            _1515 = 1075235812;
        }
        int _1559 = _1515;
        int _1561 = _1559;
        if (_1553)
        {
            int _1563 = ~_1557;
            int _1565 = (_1563 != 0) ? _1559 : 1061752795;
            _1561 = _1565;
        }
        int _1567 = _1561;
        if (_1553)
        {
            int _1569 = int(0x80000000) & as_type<int>(_1365);
            int _1571 = _1567 | _1569;
            _1527 = as_type<float>(_1571);
        }
        float _1573 = _1527;
        bool _1575 = !_1541;
        bool _1577 = _1575 && _1545;
        _1529 = _1573;
        if (!_1577)
        {
            float _1579 = abs(_1365);
            float _1581 = abs(_1391);
            float _1583 = precise::max(_1579, _1581);
            float _1585 = abs(_1365);
            float _1587 = abs(_1391);
            float _1589 = precise::min(_1585, _1587);
            float _1591 = 1.0 / _1583;
            float _1593 = abs(_1365);
            float _1595 = abs(_1391);
            bool _1597 = _1593 > _1595;
            bool _1599 = as_type<int>(_1391) >= 0;
            float _1601 = _1589 * _1591;
            float _1603 = abs(_1365);
            float _1605 = abs(_1391);
            float _1607 = _1603 + _1605;
            int _1609 = as_type<int>(_1365) & int(0x80000000);
            float _1611 = _1601 * _1601;
            bool _1613 = _1607 > as_type<float>(0x7f800000u /* inf */);
            bool _1615 = isnan(_1607);
            bool _1617 = _1613 || _1615;
            bool _1619 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1621 = _1617 || _1619;
            float _1623 = _1611 + 11.33538818359375;
            float _1625 = fma(_1611, _1623, 28.84246826171875);
            float _1627 = fma(_1611, _1625, 19.6966705322265625);
            float _1629 = fma(_1611, -0.82336294651031494140625, -5.674867153167724609375);
            float _1631 = fma(_1611, _1629, -6.565555095672607421875);
            float _1633 = 1.0 / _1627;
            float _1635 = _1611 * _1631;
            float _1637 = _1601 * _1635;
            float _1639 = fma(_1637, _1633, _1601);
            float _1641 = _1639;
            _1529 = _1607;
            if (_1597)
            {
                float _1643 = -_1639;
                float _1645 = _1643 + 1.57079637050628662109375;
                _1641 = _1645;
            }
            float _1647 = _1641;
            int _1649 = as_type<int>(_1647);
            if (!_1599)
            {
                float _1651 = -_1647;
                float _1653 = _1651 + 3.1415927410125732421875;
                _1649 = as_type<int>(_1653);
            }
            int _1655 = _1649;
            if (!_1621)
            {
                int _1657 = _1609 | _1655;
                _1529 = as_type<float>(_1657);
            }
        }
    }
    float _1659 = _1529;
    float _1661 = -_1659;
    float _1663 = _1449 + _1661;
    int _1665 = ~_348;
    int _1667 = _1665 + 1;
    float _1669 = _1323 * _1501;
    int _1671 = int(_1423) + int(_1499);
    float _1673 = _1663 * 0.15915493667125701904296875;
    float _1675 = _1307 * _1501;
    float _1677 = -_1487;
    float _1679 = _1677 + 1.0;
    float _1681 = _1157 * _1501;
    float _1683 = _1673 * 6.283185482025146484375;
    float _1685 = sin(_1683);
    int _1687 = _1667 * _1671;
    int _1689 = _1687 + _1349;
    out.m_75.x = _1483;
    out.m_75.y = _1511;
    out.m_75.z = _1489;
    out.m_75.w = _1507;
    float _1691 = _1675 * _1679;
    float _1693 = _1675 * _1469;
    float _1695 = _565 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1697 = uint(_1689) >= uint(_348);
    float _1699 = fma(_1675, _1691, _1487);
    float _1701 = _1673 * 6.283185482025146484375;
    float _1703 = cos(_1701);
    float _1705 = _1681 * _1469;
    float _1707 = _1431 * 6.283185482025146484375;
    float _1709 = sin(_1707);
    float _1711 = _1669 * _1469;
    float _1713 = -_1705;
    float _1715 = fma(_1669, _1691, _1713);
    float _1717 = fma(_1669, _1691, _1705);
    float _1719 = fma(_1681, _1691, _1711);
    float _1721 = -_1711;
    float _1723 = fma(_1681, _1691, _1721);
    float _1725 = _1681 * _1679;
    bool _1727 = !_1697;
    int _1729 = _1727 ? 0 : (-1);
    float _1731 = _1669 * _1669;
    float _1733 = trunc(_1509);
    float _1735 = precise::max(_1733, 0.0);
    uint _1737 = uint(_1735);
    float _1739 = fma(_1669, _1725, _1693);
    float _1741 = -_1693;
    float _1743 = fma(_1669, _1725, _1741);
    float _1745 = fma(_1681, _1725, _1487);
    float _1747 = fma(_1679, _1731, _1487);
    float _1749 = _1441 * _1703;
    float _1751 = _1457 * _1703;
    float _1753 = _1441 * _1685;
    float _1755 = _1441 * _1493;
    int _1757 = ~_1671;
    int _1759 = _1757 + _1729;
    int _1761 = _1759 + 1;
    float _1763 = _1457 * _1685;
    float _1765 = _1457 * _1493;
    float _1767 = _1685 * _1493;
    float _1769 = fma(_1709, _1751, _1753);
    int _1771 = _348 * _1761;
    int _1773 = _1771 + _1349;
    float _1775 = -_1763;
    float _1777 = fma(_1709, _1749, _1775);
    float _1779 = -_1749;
    float _1781 = fma(_1709, _1763, _1779);
    float _1783 = _1765 * _747;
    float _1785 = fma(_1709, _1753, _1751);
    bool _1787 = !_1245;
    int _1789 = _1787 ? _1773 : (-1);
    float _1791 = _1703 * _1493;
    float _1793 = -_747;
    float _1795 = _1709 * _1793;
    float _1797 = fma(_1769, _739, _1783);
    float _1799 = _1755 * _747;
    int _1801 = _1789 >> 31;
    float _1803 = fma(_1791, _739, _1795);
    float _1805 = fma(_1781, _749, _1797);
    float _1807 = fma(_1777, _739, _1799);
    int _1809 = _1801 & 3;
    float _1811 = fma(_1767, _749, _1803);
    float _1813 = _1695 + _1805;
    float _1815 = fma(_1785, _749, _1807);
    int _1817 = _1789 + _1809;
    float _1819 = _514 + _1811;
    float _1821 = fma(_1157, _1025, _1813);
    float _1823 = _715 + _1815;
    int _1825 = _1817 >> 2;
    float _1827 = fma(_1307, _1025, _1819);
    float _1829 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1831 = _1821 + _1829;
    float _1833 = fma(_1323, _1025, _1823);
    int _1835 = _1825 << 4;
    int _1837 = _1835 + 512;
    float _1839 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1841 = _1827 + _1839;
    float _1843 = _1745 * _1831;
    float _1845 = _1723 * _1831;
    float _1847 = _1739 * _1831;
    float _1849 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1851 = _1833 + _1849;
    float _1853 = fma(_1719, _1841, _1843);
    float _1855 = fma(_1699, _1841, _1845);
    float _1857 = fma(_1715, _1841, _1847);
    uint _1859 = uint(int(uint(_1837) >> uint(2)));
    uint _1861 = uint(int(uint(int(_1859)) >> uint(2)));
    int _1863 = int(_1859) & 3;
    float _1865 = (*spvDescriptorSet0.vp_c9)._m0[int(_1861)][_1863];
    int _1867 = int(_1859) + 1;
    uint _1869 = uint(int(uint(_1867) >> uint(2)));
    int _1871 = _1867 & 3;
    float _1873 = (*spvDescriptorSet0.vp_c9)._m0[int(_1869)][_1871];
    float _1875 = fma(_1743, _1851, _1853);
    float _1877 = fma(_1717, _1851, _1855);
    float _1879 = fma(_1747, _1851, _1857);
    int _1881 = int(_1389) + int(_1737);
    float _1883 = _1875 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1885 = _1875 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    int _1887 = ~_348;
    int _1889 = _1887 + 1;
    int _1891 = _1837 + 8;
    uint _1893 = uint(int(uint(_1891) >> uint(2)));
    uint _1895 = uint(int(uint(int(_1893)) >> uint(2)));
    int _1897 = int(_1893) & 3;
    float _1899 = (*spvDescriptorSet0.vp_c9)._m0[int(_1895)][_1897];
    int _1901 = int(_1893) + 1;
    uint _1903 = uint(int(uint(_1901) >> uint(2)));
    int _1905 = _1901 & 3;
    float _1907 = (*spvDescriptorSet0.vp_c9)._m0[int(_1903)][_1905];
    float _1909 = fma(_1877, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1883);
    float _1911 = fma(_1877, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1885);
    float _1913 = -_1107;
    float _1915 = _1709 * _1913;
    float _1917 = -_1273;
    float _1919 = _1709 * _1917;
    float _1921 = fma(_1879, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1909);
    float _1923 = _1765 * _1107;
    float _1925 = _1755 * _1107;
    float _1927 = _1875 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1929 = fma(_1879, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1911);
    float _1931 = _1921 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _1933 = _1765 * _1273;
    float _1935 = fma(_1877, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1927);
    float _1937 = _1755 * _1273;
    float _1939 = -_1143;
    float _1941 = _1709 * _1939;
    float _1943 = _1765 * _1143;
    float _1945 = fma(_1879, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1935);
    int _1947 = _1889 * _1881;
    int _1949 = _1947 + _1243;
    float _1951 = _1755 * _1143;
    float _1953 = _1929 * (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _1955 = _1931 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1957 = _1931 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1959 = _1945 * (*spvDescriptorSet0.vp_c7)._m0[0].z;
    bool _1961 = uint(_1949) >= uint(_348);
    float _1963 = fma(_1953, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1955);
    float _1965 = fma(_1953, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1957);
    float _1967 = _1963;
    if (!_460)
    {
        _1357 = 0.0;
    }
    float _1969 = _1357;
    float _1971 = fma(_1959, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1963);
    float _1973 = _1969;
    if (!_460)
    {
        _1359 = 0.0;
    }
    float _1975 = _1359;
    float _1977 = fma(_1959, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1965);
    bool _1979 = !_1961;
    int _1981 = _1979 ? 0 : (-1);
    float _1983 = _1975;
    if (!_460)
    {
        _1967 = 0.0;
    }
    float _1985 = _1967;
    bool _1987 = !_460;
    float _1989 = _1985;
    if (!_1987)
    {
        float _1991 = -_1695;
        float _1993 = _1991 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1995 = -_514;
        float _1997 = _1995 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1999 = _1993 * _1993;
        float _2001 = fma(_1997, _1997, _1999);
        float _2003 = fma(_1097, _1097, _2001);
        float _2005 = rsqrt(_2003);
        float _2007 = _2005 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
        float _2009 = _1997 * _2007;
        float _2011 = _1993 * _2007;
        float _2013 = _1097 * _2007;
        _1989 = _2013;
        _1973 = _2009;
        _1983 = _2011;
    }
    float _2015 = _1989;
    float _2017 = _1973;
    float _2019 = _1983;
    int _2021 = ~_1881;
    int _2023 = _2021 + _1981;
    int _2025 = _2023 + 1;
    float _2027 = _1977 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _2029 = _1971 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    int _2031 = _1789 & 3;
    float _2033 = fma(_1791, _1077, _1915);
    float _2035 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2037 = _2027 + _2035;
    float _2039 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2041 = _2029 + _2039;
    bool _2043 = uint(_2031) > 1u;
    float _2045 = fma(_1791, _1141, _1941);
    int _2047 = _1789 & 3;
    bool _2049 = _2047 != 0;
    float _2051 = _2037 * _2037;
    float _2053 = _2041 * _2041;
    float _2055 = fma(_1791, _1275, _1919);
    int _2057 = _2049 ? 0 : 1;
    int _2059 = _348 * _2025;
    int _2061 = _2059 + _1243;
    float _2063 = _2051 + _2053;
    bool _2065 = _2031 != 3;
    float _2067 = _1931 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    int _2069 = ~_2057;
    int _2071 = _2069 + 1;
    int _2073 = _2071 + 1;
    float _2075 = sqrt(_2063);
    int _2077 = _2073;
    float _2079 = _2051;
    float _2081 = _2053;
    float _2083 = _2027;
    float _2085 = _2029;
    float _2087 = _2017;
    float _2089 = _2015;
    if (!_2043)
    {
        int _2091 = ~_2057;
        int _2093 = _2091 + 1;
        _2077 = _2093;
    }
    int _2095 = _2077;
    float _2097 = fma(_1769, _1077, _1923);
    bool _2099 = uint(_2031) >= 2u;
    float _2101 = fma(_1953, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2067);
    int _2103 = abs(_2095);
    float _2105 = fma(_1777, _1077, _1925);
    int _2107 = _2099 ? 0 : 1;
    float _2109 = fma(_1959, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2101);
    bool _2111 = !_2049;
    int _2113 = _2111 ? 0 : 1;
    float _2115 = _2109 + (*spvDescriptorSet0.vp_c10)._m0[9].w;
    int _2117 = ~_2107;
    int _2119 = _2117 + 1;
    int _2121 = _2119 + 1;
    int _2123 = abs(_2113);
    int _2125 = _2121;
    float _2127 = _2097;
    if (_2065)
    {
        int _2129 = ~_2107;
        int _2131 = _2129 + 1;
        _2125 = _2131;
    }
    int _2133 = _2125;
    int _2135 = ~_2103;
    int _2137 = _2135 + 1;
    int _2139 = _2137 + 1;
    bool _2141 = _2075 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _2143 = abs(_2133);
    int _2145 = _2139 * as_type<int>(_1873);
    int _2147 = ~_2123;
    int _2149 = _2147 + 1;
    int _2151 = _2149 + 1;
    bool _2153 = _2031 != 3;
    int _2155 = ~_2143;
    int _2157 = _2155 + 1;
    int _2159 = _2157 + 1;
    int _2161 = _2151 * as_type<int>(_1865);
    int _2163 = _2161 + _2145;
    bool _2165 = !_520;
    int _2167 = _2165 ? 0 : 1;
    bool _2169 = !_2153;
    int _2171 = _2169 ? 0 : (-1);
    int _2173 = _2159 * as_type<int>(_1899);
    int _2175 = _2173 + _2163;
    int _2177 = abs(_2167);
    int _2179 = abs(_2171);
    int _2181 = ~_2179;
    int _2183 = _2181 + 1;
    int _2185 = _2183 + 1;
    float _2187 = as_type<float>(_2177);
    if (!_2141)
    {
        _2187 = _2115;
    }
    float _2189 = _2187;
    bool _2191 = !_2141;
    float _2193 = _2189;
    if (!_2191)
    {
        float _2195 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2197 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2199 = _2075 + _2197;
        float _2201 = rsqrt(_2063);
        float _2203 = _2199 * _2195;
        float _2205 = _2115 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2207 = _2203 * 0.15915493667125701904296875;
        float _2209 = _2207 * 6.283185482025146484375;
        float _2211 = sin(_2209);
        float _2213 = _2207 * 6.283185482025146484375;
        float _2215 = cos(_2213);
        float _2217 = fma(_2211, _2205, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2219 = _2201 * _2217;
        float _2221 = fma(_2037, _2219, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2223 = _2215 + (-1.0);
        float _2225 = fma(_2041, _2219, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2227 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2229 = _2221 + _2227;
        float _2231 = _2223 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2233 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2235 = _2225 + _2233;
        float _2237 = _2229 * _2229;
        float _2239 = fma(_2115, _2215, _2231);
        float _2241 = _2235 * _2235;
        _2193 = _2239;
        _2079 = _2237;
        _2081 = _2241;
        _2083 = _2221;
        _2085 = _2225;
    }
    float _2243 = _2193;
    float _2245 = _2079;
    float _2247 = _2081;
    float _2249 = _2083;
    float _2251 = _2085;
    float _2253 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2255 = _2243 + _2253;
    int _2257 = _2185 * as_type<int>(_1907);
    int _2259 = _2257 + _2175;
    int _2261 = ~_2177;
    int _2263 = _2261 + 1;
    int _2265 = _2263 + 1;
    float _2267 = fma(_1769, _1275, _1933);
    float _2269 = fma(_2255, _2255, _2245);
    float _2271 = fma(_1777, _1275, _1937);
    bool _2273 = !_1245;
    int _2275 = _2273 ? _2061 : (-1);
    int _2277 = _2259 * _2265;
    float _2279 = _2269 + _2247;
    float _2281 = fma(_1769, _1141, _1943);
    float _2283 = fma(_1777, _1141, _1951);
    int _2285 = _2275 * _2177;
    int _2287 = _2285 + _2277;
    float _2289 = fma(_1767, _1103, _2033);
    float _2291 = fma(_1767, _1277, _2055);
    float _2293 = sqrt(_2279);
    float _2295 = fma(_1767, _1145, _2045);
    float _2297 = fma(_1781, _1145, _2281);
    float _2299 = fma(_1781, _1277, _2267);
    float _2301 = fma(_1785, _1277, _2271);
    float _2303 = _1169 + 0.5;
    float _2305 = _1429 + 0.5;
    float _2307 = fma(_1781, _1103, _2097);
    float _2309 = fma(_1785, _1145, _2283);
    float _2311 = float(_2287);
    float _2313 = fma(_1785, _1103, _2105);
    out.m_77.x = _2303;
    out.m_77.y = _2305;
    out.m_79.x = _2291;
    out.m_79.y = _2299;
    out.m_79.z = _2301;
    bool _2315 = _2293 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2317 = isnan(_2293);
    bool _2319 = _2315 || _2317;
    bool _2321 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2323 = _2319 || _2321;
    out.m_81.x = _2295;
    out.m_81.y = _2297;
    out.m_81.z = _2309;
    out.m_83.y = _2311;
    out.m_85.x = _2289;
    out.m_85.y = _2307;
    out.m_85.z = _2313;
    float _2325 = _2271;
    if (!_2323)
    {
        _2325 = 1.0;
    }
    float _2327 = _2325;
    bool _2329 = !_2323;
    float _2331 = _2327;
    if (!_2329)
    {
        bool _2333 = _2293 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2335 = isnan(_2293);
        bool _2337 = _2333 || _2335;
        bool _2339 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2341 = _2337 || _2339;
        if (!_2341)
        {
            float _2343 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2345 = _2293 + _2343;
            float _2347 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2349 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2347;
            float _2351 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2353 = _2351 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2355 = 1.0 / _2349;
            float _2357 = _2345 * _2355;
            float _2359 = fma(_2357, _2353, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2331 = _2359;
            _2361 = true;
        }
        else
        {
            bool _2363 = _2293 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2365 = isnan(_2293);
            bool _2367 = _2363 || _2365;
            bool _2369 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2371 = _2367 || _2369;
            if (!_2371)
            {
                float _2373 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2375 = _2293 + _2373;
                float _2377 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2379 = _2377 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2381 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2383 = _2381 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2385 = 1.0 / _2379;
                float _2387 = _2375 * _2385;
                float _2389 = fma(_2387, _2383, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2331 = _2389;
                _2361 = true;
            }
            else
            {
                _2331 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2361 = false;
    float _2391 = _2331;
    float _2393 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2395 = _2243 + _2393;
    float _2397 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2399 = _2249 + _2397;
    float _2401 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2403 = _2251 + _2401;
    float _2405 = _715 + _2015;
    float _2407 = fma(_2395, _2391, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2409 = fma(_2399, _2391, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2411 = fma(_2403, _2391, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2413 = _514 + _2017;
    float _2415 = _2407 + _2019;
    float _2417 = _2409 + _2017;
    float _2419 = _2411 + _2015;
    float _2421 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2423 = _2415 + _2421;
    float _2425 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2427 = _2417 + _2425;
    float _2429 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2431 = _2419 + _2429;
    float _2433 = _2415 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2435 = _2423 * _2423;
    float _2437 = fma(_2417, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2433);
    float _2439 = fma(_2427, _2427, _2435);
    float _2441 = fma(_2419, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2437);
    float _2443 = fma(_2431, _2431, _2439);
    float _2445 = rsqrt(_2443);
    float _2447 = sqrt(_2443);
    float _2449 = _2445 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2451 = _2427 * _2449;
    float _2453 = _2431 * _2449;
    float _2455 = _2451 * _2451;
    float _2457 = _2453 * _2453;
    float _2459 = _2455 + _2457;
    float _2461 = sqrt(_2459);
    bool _2463 = _2461 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2465 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2467 = _2461 + _2465;
    float _2469 = _2295;
    float _2471 = _2467;
    float _2473 = _2423;
    if (_2463)
    {
        float _2475 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2469 = _2475;
    }
    float _2477 = _2469;
    if (!_2463)
    {
        _2087 = _2453;
    }
    float _2479 = _2087;
    float _2481 = _2479;
    if (_2463)
    {
        float _2483 = rsqrt(_2459);
        _1361 = _2483;
    }
    float _2485 = _1361;
    float _2487 = _2485;
    if (_2463)
    {
        float _2489 = _2467 * _2477;
        _2471 = _2489;
    }
    float _2491 = _2471;
    if (_2463)
    {
        float _2493 = _2491 * 0.15915493667125701904296875;
        _2127 = _2493;
    }
    float _2495 = _2127;
    float _2497 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2499 = _2309;
    float _2501 = _2497;
    float _2503 = _2495;
    if (_2463)
    {
        float _2505 = _2495 * 6.283185482025146484375;
        float _2507 = sin(_2505);
        _2499 = _2507;
    }
    float _2509 = _2499;
    float _2511 = precise::max(0.0, _2497);
    float _2513 = _2297;
    if (_2463)
    {
        float _2515 = _2495 * 6.283185482025146484375;
        float _2517 = cos(_2515);
        _2513 = _2517;
    }
    float _2519 = _2513;
    float _2521 = -_2449;
    float _2523 = -_2511;
    float _2525 = fma(_2423, _2521, _2523);
    if (_2463)
    {
        float _2527 = _2525 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2501 = _2527;
    }
    float _2529 = _2501;
    float _2531 = fma(_2413, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2533 = _2509;
    float _2535 = _2529;
    if (_2463)
    {
        float _2537 = fma(_2509, _2529, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2533 = _2537;
    }
    float _2539 = _2533;
    float _2541 = _2539;
    if (!_2463)
    {
        _2503 = _2525;
    }
    float _2543 = _2503;
    float _2545 = floor(_2531);
    float _2547 = _2543;
    if (_2463)
    {
        float _2549 = _2485 * _2539;
        _2089 = _2549;
    }
    float _2551 = _2089;
    if (!_2463)
    {
        _2487 = _2451;
    }
    float _2553 = _2487;
    float _2555 = _2553;
    if (_2463)
    {
        float _2557 = _2519 + (-1.0);
        _2535 = _2557;
    }
    float _2559 = _2535;
    float _2561 = _2559;
    if (_2463)
    {
        float _2563 = _2451 * _2551;
        _2555 = _2563;
    }
    float _2565 = _2555;
    if (_2463)
    {
        float _2567 = _2453 * _2551;
        _2481 = _2567;
    }
    float _2569 = _2481;
    float _2571 = _2415 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_2463)
    {
        float _2573 = _2559 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2541 = _2573;
    }
    float _2575 = _2541;
    float _2577 = _2575;
    if (!_2463)
    {
        _2561 = _2455;
    }
    float _2579 = _2561;
    float _2581 = _2579;
    if (_2463)
    {
        float _2583 = _2565 * _2565;
        _2581 = _2583;
    }
    float _2585 = _2581;
    float _2587 = _2415 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_2463)
    {
        float _2589 = fma(_2525, _2519, _2575);
        _2547 = _2589;
    }
    float _2591 = _2547;
    if (!_2463)
    {
        _2577 = _2457;
    }
    float _2593 = _2577;
    float _2595 = _2593;
    if (_2463)
    {
        float _2597 = _2569 * _2569;
        _2595 = _2597;
    }
    float _2599 = _2595;
    float _2601 = fma(_2417, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2571);
    float _2603 = fma(_2591, _2591, _2585);
    float _2605 = fma(_2417, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2587);
    float _2607 = fma(_2419, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2601);
    float _2609 = _2603 + _2599;
    float _2611 = _2415 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2613 = fma(_2419, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2605);
    float _2615 = rsqrt(_2609);
    float _2617 = fma(_2417, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2611);
    float _2619 = _2607 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2621 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2623 = fma(_2447, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2621);
    float _2625 = precise::clamp(_2623, 0.0, 1.0);
    float _2627 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2629 = fma(_2419, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2617);
    float _2631 = _2613 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2633 = -_2625;
    float _2635 = _2633 + 1.0;
    float _2637 = _2619 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2639 = _2629 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2641 = _2631 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2643 = _2441 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2645 = fma(_2639, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2637);
    float _2647 = abs(_2635);
    float _2649 = log2(_2647);
    float _2651 = -_2641;
    float _2653 = fma(_2651, _2627, 1.0);
    float _2655 = _2615 * _2591;
    float _2657 = fma(_2631, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2645);
    float _2659 = _2615 * _2565;
    float _2661 = fma(_2405, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2663 = _2615 * _2569;
    float _2665 = fma(_2643, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2657);
    float _2667 = _2659 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2669 = floor(_2661);
    float _2671 = -_2545;
    float _2673 = _2531 + _2671;
    float _2675 = _2619 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2677 = -_2667;
    float _2679 = fma(_2655, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2677);
    float _2681 = fma(_2639, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2675);
    float _2683 = -_2663;
    float _2685 = fma(_2683, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2679);
    float _2687 = _2649 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2689 = log2(_2653);
    float _2691 = _2619 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2693 = fma(_2685, -0.5, 0.5);
    float _2695 = fma(_2685, 0.5, 0.5);
    float _2697 = fma(_2631, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2681);
    float _2699 = fma(_2639, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2691);
    float _2701 = -_2669;
    float _2703 = _2661 + _2701;
    float _2705 = exp2(_2687);
    float _2707 = _2655 + 1.0;
    float _2709 = fma(_2695, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2711 = fma(_2631, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2699);
    float _2713 = fma(_2643, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2697);
    float _2715 = fma(_2695, _2709, -0.212114393711090087890625);
    float _2717 = 1.0 / _2665;
    float _2719 = _2689 * 0.693147182464599609375;
    float _2721 = fma(_2695, _2715, 1.570728778839111328125);
    float _2723 = _2719 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2725 = sqrt(_2693);
    float _2727 = -_2655;
    float _2729 = fma(_2705, _2707, _2727);
    float _2731 = fma(_2643, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2711);
    float _2733 = fma(_2729, 0.5, 0.5);
    float _2735 = _2713 * _2717;
    float _2737 = _2731 * _2717;
    float _2739 = fma(_2735, 0.5, 0.5);
    float _2741 = fma(_2737, -0.5, 0.5);
    float _2743 = _2725 * 0.636619746685028076171875;
    float2 _7602 = float2(_2673, _2703);
    float _2745 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7602, float2(0.0), isnan(_7602)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7602, float2(0.0), isnan(_7602)), level(0.0)).x;
    float3 _7613 = float3(_2739, _2741, _2723);
    float _2747 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7613, float3(0.0), isnan(_7613)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7613, float3(0.0), isnan(_7613)), level(0.0)).x;
    float3 _7624 = float3(_2739, _2741, _2723);
    float4 _2750 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7624, float3(0.0), isnan(_7624)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7624, float3(0.0), isnan(_7624)), level(0.0)).xyzw;
    float _2752 = _2750.x;
    float _2754 = _2750.y;
    float _2756 = _2750.z;
    float _2758 = _2750.w;
    float _2760 = -_2721;
    float _2762 = fma(_2743, _2760, 1.0);
    float2 _7645 = float2(_2762, _2733);
    float3 _2766 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7645, float2(0.0), isnan(_7645)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7645, float2(0.0), isnan(_7645)), level(0.0)).xyz;
    float _2768 = _2766.x;
    float _2770 = _2766.y;
    float _2772 = _2766.z;
    float _2774 = _1695 + _2019;
    float _2776 = _2619 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2778 = _2649 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_87.x = _2427;
    out.m_87.y = _2423;
    out.m_87.z = _2431;
    float _2780 = _2774 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2782 = _2774 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2784 = fma(_2639, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2776);
    float _2786 = _2713 + _2665;
    float _2788 = fma(_2413, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2780);
    float _2790 = fma(_2413, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2782);
    float _2792 = fma(_2631, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2784);
    float _2794 = fma(_2405, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2788);
    float _2796 = fma(_2405, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2790);
    float _2798 = fma(_2643, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2792);
    float _2800 = _2794 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2802 = _2796 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2804 = _2786 * 0.5;
    float _2806 = 1.0 / _2800;
    float _2808 = _2802 + _2800;
    out.gl_Position.x = _2713;
    out.gl_Position.y = _2731;
    out.gl_Position.z = _2798;
    out.gl_Position.w = _2665;
    float _2810 = _2798 + _2665;
    float _2812 = _2810 * 0.5;
    float _2814 = _2808 * _2806;
    float _2816 = _2814 * 0.5;
    float _2818 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2820 = fma(_2816, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2818);
    float _2822 = _2665 * 0.5;
    float _2824 = 1.0 / _2820;
    float _2826 = fma(_2731, -0.5, _2822);
    out.m_89.x = _2804;
    out.m_89.y = _2826;
    out.m_89.z = _2812;
    out.m_89.w = _2665;
    float _2828 = exp2(_2778);
    bool _2830 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2832 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2834 = _2830 || _2832;
    bool _2836 = isnan(0.5);
    bool _2838 = _2834 || _2836;
    float _2840 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2842 = _2824 * _2840;
    float _2844 = abs(_2842);
    float _2846 = log2(_2844);
    bool _2848 = _2842 <= 8000.0;
    bool _2850 = isnan(_2842);
    bool _2852 = _2848 || _2850;
    bool _2854 = isnan(8000.0);
    bool _2856 = _2852 || _2854;
    float _2858 = float(_2856);
    float _2860 = _2858;
    float _2862 = _2665;
    float _2864 = _2713;
    float _2866 = _2842;
    if (_2838)
    {
        _2473 = 1.0;
    }
    float _2868 = _2473;
    float _2870 = _2846 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2872 = exp2(_2870);
    float _2874 = fma(_2872, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2876 = precise::clamp(_2874, 0.0, 1.0);
    float _2878 = in.m_91.x;
    float _2880 = fma(_2876, -2.0, 3.0);
    float _2882 = _2876 * _2876;
    float _2884 = _2882 * _2880;
    float _2886 = -_2884;
    float _2888 = _2886 + 1.0;
    float _2890 = fma(_2888, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2884);
    float _2892 = _2858 * _2890;
    float _2894 = _2868;
    if (_2838)
    {
        _2860 = 1.0;
    }
    float _2896 = _2860;
    float _2898 = _2896;
    if (!_2838)
    {
        float _2900 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2902 = _2900 * 0.15915493667125701904296875;
        float _2904 = _2902 * 6.283185482025146484375;
        float _2906 = cos(_2904);
        float _2908 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2910 = _2908 * 0.15915493667125701904296875;
        float _2912 = _2902 * 6.283185482025146484375;
        float _2914 = sin(_2912);
        float _2916 = 1.0 / _2906;
        float _2918 = _2910 * 6.283185482025146484375;
        float _2920 = cos(_2918);
        float _2922 = _2914 * _2916;
        float _2924 = _2910 * 6.283185482025146484375;
        float _2926 = sin(_2924);
        float _2928 = _2920 * _2922;
        float _2930 = 1.0 / _2928;
        float _2932 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2934 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2932;
        float _2936 = 1.0 / _2934;
        float _2938 = _2926 * _2930;
        float _2940 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2942 = fma(_2842, _2938, _2940);
        float _2944 = _2942 * _2936;
        float _2946 = precise::clamp(_2944, 0.0, 1.0);
        _2862 = _2910;
        _2894 = _2946;
        _2864 = _2916;
    }
    float _2948 = _2862;
    float _2950 = _2894;
    float _2952 = _2864;
    float _2954 = _2948;
    float _2956 = _2952;
    if (!_2838)
    {
        float _2958 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2960 = _2958 * 0.15915493667125701904296875;
        float _2962 = _2960 * 6.283185482025146484375;
        float _2964 = cos(_2962);
        float _2966 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2968 = _2966 * 0.15915493667125701904296875;
        float _2970 = _2960 * 6.283185482025146484375;
        float _2972 = sin(_2970);
        float _2974 = 1.0 / _2964;
        float _2976 = _2968 * 6.283185482025146484375;
        float _2978 = cos(_2976);
        float _2980 = _2972 * _2974;
        float _2982 = _2968 * 6.283185482025146484375;
        float _2984 = sin(_2982);
        float _2986 = _2978 * _2980;
        float _2988 = 1.0 / _2986;
        float _2990 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2992 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2990;
        float _2994 = 1.0 / _2992;
        float _2996 = _2984 * _2988;
        float _2998 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3000 = fma(_2842, _2996, _2998);
        float _3002 = _3000 * _2994;
        float _3004 = precise::clamp(_3002, 0.0, 1.0);
        float _3006 = -_3004;
        float _3008 = _3006 + 1.0;
        _2898 = _3008;
        _2954 = _2974;
        _2866 = _3004;
        _2956 = _2968;
    }
    float _3010 = _2898;
    float _3012 = _2954;
    float _3014 = _2866;
    float _3016 = _2956;
    float _3018 = -_2828;
    float _3020 = _3018 + 1.0;
    float _3022 = _2892 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3024 = -_2745;
    float _3026 = _3024 + 1.0;
    float _3028 = _3020 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _3030 = _2447 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3032 = isnan(_2447);
    bool _3034 = _3030 || _3032;
    bool _3036 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3038 = _3034 || _3036;
    float _3040 = _3026 * _3022;
    float _3042 = precise::clamp(_3040, 0.0, 1.0);
    float _3044 = _2950 * _3010;
    float _3046 = _3028 * _2747;
    float _3048 = -_3028;
    float _3050 = _3048 + 1.0;
    float _3052 = -_3042;
    float _3054 = fma(_3052, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3056 = _2758 * _3046;
    float _3058 = _2772 * _3046;
    float _3060 = _3054 * _2878;
    float _3062 = _2758 * _3050;
    float _3064 = fma(_2768, _3056, _2752);
    float _3066 = fma(_2770, _3056, _2754);
    float _3068 = _3060 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3070 = fma(_2758, _3058, _2756);
    float _3072 = _3016;
    float _3074 = _3012;
    float _3076 = _3028;
    float _3078 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _3080 = _3014;
    float _3082 = _3050;
    if (!_3038)
    {
        _3072 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3084 = _3072;
    float _3086 = _3044 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3088 = _3084;
    float _3090 = _3084;
    if (!_3038)
    {
        _3074 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3092 = _3074;
    out.m_93.x = _3068;
    float _3094 = _3092;
    float _3096 = _3092;
    if (!_3038)
    {
        _3076 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3098 = _3076;
    float _3100 = _3098;
    float _3102 = _3098;
    if (!_3038)
    {
        _3078 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3104 = _3078;
    out.m_95.x = _3064;
    out.m_95.y = _3066;
    out.m_95.z = _3070;
    out.m_95.w = _3062;
    float _3106 = _3104;
    float _3108 = _3104;
    if (!_3038)
    {
        _3080 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3110 = _3080;
    float _3112 = _3110;
    float _3114 = _3110;
    if (!_3038)
    {
        _3082 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3116 = _3082;
    bool _3118 = !_3038;
    float _3120 = _3116;
    float _3122 = _3116;
    if (!_3118)
    {
        bool _3124 = _2447 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3126 = isnan(_2447);
        bool _3128 = _3124 || _3126;
        bool _3130 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3132 = _3128 || _3130;
        if (!_3132)
        {
            float _3134 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3136 = _2447 + _3134;
            float _3138 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3140 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3138;
            float _3142 = 1.0 / _3140;
            float _3144 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3146 = _3144 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3148 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3150 = _3148 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3152 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3154 = _3152 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3156 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3158 = _3156 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3160 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3162 = _3160 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3164 = _3136 * _3142;
            float _3166 = precise::clamp(_3164, 0.0, 1.0);
            float _3168 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3170 = _3168 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3172 = fma(_3166, _3146, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3174 = fma(_3166, _3170, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3176 = fma(_3166, _3150, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3178 = fma(_3166, _3154, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3180 = fma(_3166, _3158, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3182 = fma(_3166, _3162, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3096 = _3172;
            _3114 = _3180;
            _3090 = _3174;
            _3108 = _3178;
            _3102 = _3176;
            _3122 = _3182;
            _3184 = true;
        }
        else
        {
            bool _3186 = _2447 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3188 = isnan(_2447);
            bool _3190 = _3186 || _3188;
            bool _3192 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3194 = _3190 || _3192;
            if (!_3194)
            {
                _3088 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3196 = _3088;
            _3090 = _3196;
            if (!_3194)
            {
                _3094 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3198 = _3094;
            _3096 = _3198;
            if (!_3194)
            {
                _3100 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3200 = _3100;
            _3102 = _3200;
            if (!_3194)
            {
                _3106 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3202 = _3106;
            _3108 = _3202;
            if (!_3194)
            {
                _3112 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3204 = _3112;
            _3114 = _3204;
            if (!_3194)
            {
                _3120 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3206 = _3120;
            bool _3208 = !_3194;
            _3122 = _3206;
            if (!_3208)
            {
                bool _3210 = _2447 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3212 = isnan(_2447);
                bool _3214 = _3210 || _3212;
                bool _3216 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3218 = _3214 || _3216;
                if (!_3218)
                {
                    float _3220 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3222 = _2447 + _3220;
                    float _3224 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3226 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3224;
                    float _3228 = 1.0 / _3226;
                    float _3230 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3232 = _3230 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3234 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3236 = _3234 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3238 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3240 = _3238 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3242 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3244 = _3242 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3246 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3248 = _3246 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3250 = _3222 * _3228;
                    float _3252 = precise::clamp(_3250, 0.0, 1.0);
                    float _3254 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3256 = _3254 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3258 = fma(_3252, _3232, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3260 = fma(_3252, _3256, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3262 = fma(_3252, _3236, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3264 = fma(_3252, _3240, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3266 = fma(_3252, _3244, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3268 = fma(_3252, _3248, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3096 = _3258;
                    _3114 = _3266;
                    _3090 = _3260;
                    _3108 = _3264;
                    _3102 = _3262;
                    _3122 = _3268;
                    _3184 = true;
                }
                else
                {
                    _3096 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3114 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3090 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3108 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3102 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3122 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3184 = false;
    float _3270 = _3096;
    float _3272 = _3114;
    float _3274 = _3090;
    float _3276 = _3108;
    float _3278 = _3102;
    float _3280 = _3122;
    float _3282 = fma(_2307, -0.5, 0.5);
    float _3284 = precise::clamp(_3282, 0.0, 1.0);
    float _3286 = -_3270;
    float _3288 = _3286 + _3272;
    float _3290 = _3086 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3292 = -_3274;
    float _3294 = _3292 + _3276;
    out.m_97.x = 0.0;
    float _3296 = fma(_3284, _3288, _3270);
    float _3298 = fma(_3284, _3294, _3274);
    out.m_55.x = _3290;
    float _3300 = -_3278;
    float _3302 = _3300 + _3280;
    float _3304 = _3296 * 0.586610972881317138671875;
    bool _3306 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3308 = fma(_3284, _3302, _3278);
    float _3310 = fma(_3298, 0.298911988735198974609375, _3304);
    bool _3312 = _2950 > 0.0;
    bool _3314 = isnan(_2950);
    bool _3316 = _3312 || _3314;
    bool _3318 = isnan(0.0);
    bool _3320 = _3316 || _3318;
    float _3322 = fma(_3308, 0.114477999508380889892578125, _3310);
    bool _3324 = _3010 <= 0.0;
    bool _3326 = !_3320;
    bool _3328 = _3324 || _3326;
    float _3330 = -_3322;
    float _3332 = _3298 + _3330;
    float _3334 = -_3322;
    float _3336 = _3296 + _3334;
    float _3338 = -_3322;
    float _3340 = _3308 + _3338;
    float _3342 = fma(_3332, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3322);
    float _3344 = fma(_3336, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3322);
    float _3346 = fma(_3340, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3322);
    bool _3348 = !_3306;
    if (!_3348)
    {
        float _3350 = -_2415;
        float _3352 = _3350 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3354 = -_2417;
        float _3356 = _3354 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3358 = -_2419;
        float _3360 = _3358 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3362 = _3352 * _3352;
        float _3364 = fma(_3356, _3356, _3362);
        float _3366 = fma(_3360, _3360, _3364);
        float _3368 = sqrt(_3366);
        float _3370 = rsqrt(_3366);
        float _3372 = -_3368;
        float _3374 = _3372 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3376 = _3374 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3378 = precise::clamp(_3376, 0.0, 1.0);
        float _3380 = _3356 * _3370;
        float _3382 = _3352 * _3370;
        float _3384 = abs(_3378);
        float _3386 = log2(_3384);
        float _3388 = _3360 * _3370;
        float _3390 = _3380 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3392 = _2307 * _3382;
        float _3394 = -_3382;
        float _3396 = -_3390;
        float _3398 = fma(_3394, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3396);
        float _3400 = fma(_2289, _3380, _3392);
        float _3402 = -_3388;
        float _3404 = fma(_3402, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3398);
        float _3406 = fma(_2313, _3388, _3400);
        float _3408 = precise::clamp(_3406, 0.0, 1.0);
        float _3410 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3412 = _3404 + _3410;
        float _3414 = _3386 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3416 = _3412 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3418 = precise::clamp(_3416, 0.0, 1.0);
        float _3420 = exp2(_3414);
        float _3422 = _3420 * _3418;
        float _3424 = _3408 * _3422;
        float _3426 = _3424 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3428 = _3424 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3430 = _3424 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_97.x = _3426;
        out.m_97.y = _3428;
        out.m_97.z = _3430;
    }
    out.m_99.x = _3342;
    out.m_99.y = _3344;
    out.m_99.z = _3346;
    if (!_3328)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_55.x = 0.0;
    float _3432 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3432;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

