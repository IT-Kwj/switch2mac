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
    texture2d<float> vp_t_tcb_24 [[id(6)]];
    sampler vp_t_tcb_24Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_32 [[id(8)]];
    sampler vp_t_tcb_32Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_30 [[id(10)]];
    sampler vp_t_tcb_30Smplr [[id(11)]];
    texture2d<float> vp_t_tcb_1C [[id(12)]];
    sampler vp_t_tcb_1CSmplr [[id(13)]];
    sampler vp_t_tcb_24Smplr_w [[id(14)]];
    sampler vp_t_tcb_32Smplr_w [[id(15)]];
    sampler vp_t_tcb_30Smplr_w [[id(16)]];
    sampler vp_t_tcb_1CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_68 [[user(locn0)]];
    float4 m_62 [[user(locn1)]];
    float4 m_53 [[user(locn2)]];
    float4 m_84 [[user(locn3)]];
    float4 m_51 [[user(locn4)]];
    float4 m_64 [[user(locn5)]];
    float4 m_74 [[user(locn6)]];
    float4 m_70 [[user(locn7)]];
    float4 m_76 [[user(locn8)]];
    float4 m_82 [[user(locn9)]];
    float4 m_78 [[user(locn10)]];
    float4 m_80 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_72 [[attribute(0)]];
    float4 m_66 [[attribute(1)]];
    float4 m_46 [[attribute(2)]];
    float4 m_48 [[attribute(3)]];
    float4 m_58 [[attribute(4)]];
    float4 m_60 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2577 = false;
    bool _201 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _98 = in.m_46.w;
    float _100 = in.m_48.w;
    float _102 = trunc(_98);
    int _105 = int(_102);
    float _107 = -_100;
    float _109 = _107 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _109;
    bool _113 = _105 >= 1;
    float _115 = 0.0;
    float _117 = as_type<float>(_105);
    float _119 = _109;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _115;
    if (!_113)
    {
        out.m_53.x = 0.0;
    }
    int _123 = 0;
    if (!_113)
    {
        float _125 = _121 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2894 = as_type<float>(_127);
        out.gl_Position.z = _2894;
    }
    if (!_113)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _131 = _100 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_100);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = float(_105);
    bool _143 = _109 >= _141;
    bool _145 = !_139;
    bool _147 = _143 || _145;
    if (_147)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _149 = _117;
    if (_147)
    {
        out.m_53.x = 0.0;
    }
    if (_147)
    {
        float _151 = _149 * 5.0;
        _129 = as_type<int>(_151);
    }
    int _153 = _129;
    if (_147)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2949 = as_type<float>(_153);
        out.gl_Position.z = _2949;
    }
    if (_147)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _155 = as_type<float>(int(gl_VertexIndex));
    float _157 = 1.0 / _141;
    bool _159 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _161 = _109 * _157;
    int _163 = as_type<int>(_155) & 1;
    bool _165 = _163 != 0;
    int _167 = as_type<int>(_155) & 2;
    bool _169 = _167 != 0;
    bool _171 = !_165;
    float _173 = _171 ? (-0.5) : 0.5;
    bool _175 = !_169;
    float _177 = _175 ? (-0.5) : 0.5;
    bool _179 = !_159;
    float _181 = _161;
    float _199;
    if (!_179)
    {
        float _183 = in.m_58.x;
        float _185 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _187 = _183 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _189 = fma(_187, (*spvDescriptorSet0.vp_c9)._m0[12].x, _109);
        float _191 = _189 * _185;
        float _193 = floor(_191);
        float _195 = -_193;
        float _197 = _191 + _195;
        _199 = _197;
        _201 = true;
    }
    else
    {
        _199 = _161;
    }
    _201 = false;
    float _203 = _199;
    float _205 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _207 = _203 + _205;
    bool _209 = _203 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _211 = isnan(_203);
    bool _213 = _209 || _211;
    bool _215 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _217 = _213 || _215;
    float _219 = float(_217);
    float _221 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _223 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _221;
    float _225 = -_219;
    float _227 = _225 + 1.0;
    bool _229 = _203 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _231 = isnan(_203);
    bool _233 = _229 || _231;
    bool _235 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _237 = _233 || _235;
    float _239 = float(_237);
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _243 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _241;
    bool _245 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _247 = 1.0 / _223;
    float _249 = _239 * _227;
    float _251 = -_239;
    float _253 = _251 + 1.0;
    float _255 = _207 * _247;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _257;
    float _261 = fma(_243, _255, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _263 = fma(_259, _255, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _265 = _261 * _249;
    float _267 = _263 * _249;
    float _269 = fma(_253, (*spvDescriptorSet0.vp_c9)._m0[143].x, _265);
    float _271 = fma(_253, (*spvDescriptorSet0.vp_c9)._m0[143].y, _267);
    float _273 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[144].x, _269);
    float _275 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[144].y, _271);
    bool _277 = !_245;
    if (!_277)
    {
        float _279 = in.m_58.x;
        float _281 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _283 = _279 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _285 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[11].y, _109);
        float _287 = _285 * _281;
        float _289 = floor(_287);
        float _291 = -_289;
        float _293 = _287 + _291;
        _181 = _293;
    }
    float _295 = _181;
    float _297 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _299 = int(_297);
    float _301 = in.m_58.x;
    float _303 = in.m_58.y;
    float _305 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _307 = int(_305);
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _313 = float(_299);
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _315;
    float _319 = 1.0 / _313;
    float _321 = float(uint(_307));
    int _323 = ~_307;
    int _325 = _323 + 1;
    float _327 = 1.0 / _321;
    int _329 = ~_307;
    int _331 = _329 + 1;
    float _333 = _319 * _109;
    float _335 = trunc(_333);
    int _337 = int(_335);
    int _339 = as_type<int>(_327) + (-2);
    int _341 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _343 = _341 != 0;
    float _345 = float(uint(_337));
    float _347 = float(_337);
    float _349 = as_type<float>(_339) * _345;
    float _351 = trunc(_349);
    float _353 = precise::max(_351, 0.0);
    uint _356 = uint(_353);
    int _358 = _331 * int(_356);
    int _360 = _358 + _337;
    float _362 = float(uint(_360));
    float _364 = as_type<float>(_339) * _362;
    bool _366 = !_343;
    float _368 = _366 ? 7.345489978790283203125 : 1.0;
    float _370 = trunc(_364);
    float _372 = precise::max(_370, 0.0);
    uint _374 = uint(_372);
    float _376 = _368 * _301;
    float _378 = floor(_376);
    int _380 = int(_356) + int(_374);
    float _382 = float(_307);
    int _384 = _325 * _380;
    int _386 = _384 + _337;
    bool _388 = _347 >= _382;
    bool _390 = isnan(_347);
    bool _392 = _388 || _390;
    bool _394 = isnan(_382);
    bool _396 = _392 || _394;
    float _398 = float(_396);
    float _400 = _382 * _109;
    float _402 = -_378;
    float _404 = _376 + _402;
    bool _406 = uint(_386) >= uint(_307);
    float _408 = _400 * _157;
    float _410 = trunc(_398);
    int _412 = int(_410);
    float _414 = _404 * _382;
    bool _416 = !_406;
    int _418 = _416 ? 0 : (-1);
    int _420 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _422 = _420 != 0;
    int _424 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _426 = _424 != 0;
    int _428 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _430 = _428 != 0;
    int _432 = ~_380;
    int _434 = _432 + _418;
    int _436 = _434 + 1;
    bool _438 = _307 == 0;
    float _440 = trunc(_414);
    int _442 = int(_440);
    bool _444 = !_426;
    int _446 = _444 ? 0 : 1;
    int _448 = _307 * _436;
    int _450 = _448 + _337;
    int _452 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _454 = _452 != 0;
    float _456 = in.m_60.x;
    float _458 = in.m_60.y;
    int _460 = _307 + (-1);
    int _462 = ~_412;
    int _464 = _462 + 1;
    int _466 = _464 + 1;
    float _468 = trunc(_408);
    int _470 = int(_468);
    bool _472 = !_438;
    int _474 = _472 ? _450 : (-1);
    bool _476 = !_422;
    int _478 = _476 ? 0 : 1;
    int _480 = abs(_446);
    int _482 = _474 * _466;
    bool _484 = !_454;
    int _486 = _484 ? 0 : 1;
    int _488 = abs(_478);
    int _490 = _412 * _460;
    int _492 = _490 + _482;
    float _494 = _303 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _496 = abs(_486);
    bool _498 = !_430;
    int _500 = _498 ? 0 : 1;
    int _502 = _492 * _480;
    int _504 = _442 * _496;
    int _506 = _504 + _337;
    int _508 = abs(_500);
    float _510 = fma(_494, -2.0, _311);
    int _512 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _514 = _512 != 0;
    int _516 = _470 * _488;
    int _518 = _516 + _502;
    int _520 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _522 = _520 != 0;
    float _524 = _273 * _456;
    int _526 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _528 = _526 != 0;
    float _530 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _532 = log2(_530);
    int _534 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _536 = _534 != 0;
    int _538 = _506 * _508;
    int _540 = _538 + _518;
    bool _542 = !_514;
    int _544 = _542 ? 0 : 1;
    float _546 = in.m_46.x;
    float _548 = in.m_46.y;
    float _550 = in.m_46.z;
    float _552 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[76].y, _510);
    int _554 = abs(_544);
    float _556 = _301 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _560 = _558 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _562 = _442 * _554;
    int _564 = _562 + _540;
    float _566 = -_309;
    float _568 = fma(_556, 2.0, _566);
    float _570 = 1.0 / _560;
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _574 = _572 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _576 = float(uint(_564));
    float _578 = _532 * _109;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _582 = 1.0 / _574;
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _586 = _584 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _590 = as_type<float>(_339) * _576;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _594 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _596 = _548 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _598 = _548 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _600 = 1.0 / _586;
    float _602 = _588 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _604 = _594 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _606 = ~_307;
    int _608 = _606 + 1;
    float _610 = _548 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _612 = fma(_546, (*spvDescriptorSet0.vp_c10)._m0[4].x, _596);
    float _614 = fma(_546, (*spvDescriptorSet0.vp_c10)._m0[5].x, _598);
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _618 = _616 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _620 = trunc(_590);
    float _622 = precise::max(_620, 0.0);
    uint _624 = uint(_622);
    float _626 = _592 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _628 = _301 * 2.0;
    float _630 = fma(_546, (*spvDescriptorSet0.vp_c10)._m0[6].x, _610);
    float _632 = _618 * _582;
    out.m_62.x = _602;
    out.m_62.y = _626;
    out.m_62.z = _604;
    out.m_62.w = _580;
    float _634 = _317 * _570;
    float _636 = floor(_628);
    bool _638 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _640 = isnan(1.0);
    bool _642 = _638 || _640;
    bool _644 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _646 = _642 || _644;
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _650 = 1.0 + _648;
    bool _652 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _654 = isnan(0.0);
    bool _656 = _652 || _654;
    bool _658 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _660 = _656 || _658;
    bool _662 = _301 > 0.5;
    float _664 = exp2(_578);
    float _666 = in.m_58.z;
    int _668 = _608 * int(_624);
    int _670 = _668 + _564;
    float _672 = float(uint(_506));
    float _674 = float(uint(_670));
    float _676 = 1.0 / _650;
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _678;
    float _682 = as_type<float>(_339) * _674;
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _686 = _680 * _600;
    float _688 = trunc(_682);
    float _690 = precise::max(_688, 0.0);
    uint _692 = uint(_690);
    float _694 = -_664;
    float _696 = _694 + 1.0;
    float _698 = -_173;
    int _700 = _662 ? as_type<int>(_698) : as_type<int>(_173);
    float _702 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _704 = _636 > 0.0;
    float _706 = _303 * 2.0;
    float _708 = _660 ? _696 : 0.0;
    float _710 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[78].z, _684);
    bool _712 = _636 >= 0.0;
    bool _714 = isnan(_636);
    bool _716 = _712 || _714;
    bool _718 = isnan(0.0);
    bool _720 = _716 || _718;
    float _722 = -_109;
    float _724 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[76].x, _568);
    float _726 = _666 * 2.0;
    float _728 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[78].w, _702);
    float _730 = floor(_706);
    float _732 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[77].z, _710);
    float _734 = _303 + _666;
    float _736 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[77].w, _728);
    if (_646)
    {
        float _738 = _708 * _676;
        _119 = _738;
    }
    float _740 = _119;
    int _742 = int(_624) + int(_692);
    float _744 = _303 + _301;
    float _746 = floor(_726);
    int _748 = ~_307;
    int _750 = _748 + 1;
    float _752 = _734 + (-1.0);
    float _754 = _744 + (-1.0);
    int _756 = _720 ? 0 : 1;
    float _758 = fma(_752, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _760 = _750 * _742;
    int _762 = _760 + _564;
    bool _764 = _303 > 0.5;
    float _766 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _768 = ~_756;
    int _770 = _768 + 1;
    int _772 = _770 + 1;
    int _774 = _772;
    float _776 = _766;
    if (!_704)
    {
        int _778 = ~_756;
        int _780 = _778 + 1;
        _774 = _780;
    }
    int _782 = _774;
    float _784 = -_177;
    int _786 = _764 ? as_type<int>(_784) : as_type<int>(_177);
    bool _788 = _730 >= 0.0;
    bool _790 = isnan(_730);
    bool _792 = _788 || _790;
    bool _794 = isnan(0.0);
    bool _796 = _792 || _794;
    bool _798 = !_528;
    float _800 = _798 ? _173 : as_type<float>(_700);
    float _802 = fma(_550, (*spvDescriptorSet0.vp_c10)._m0[5].z, _614);
    bool _804 = uint(_762) >= uint(_307);
    bool _806 = _730 > 0.0;
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _810 = _295 + _808;
    bool _812 = _746 >= 0.0;
    bool _814 = isnan(_746);
    bool _816 = _812 || _814;
    bool _818 = isnan(0.0);
    bool _820 = _816 || _818;
    bool _822 = !_536;
    float _824 = _822 ? _177 : as_type<float>(_786);
    int _826 = _796 ? 0 : 1;
    bool _828 = !_804;
    int _830 = _828 ? 0 : (-1);
    int _832 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _834 = _832 != 0;
    int _836 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _838 = _836 != 0;
    int _840 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _842 = _840 != 0;
    float _844 = fma(_550, (*spvDescriptorSet0.vp_c10)._m0[4].z, _612);
    float _846 = fma(_550, (*spvDescriptorSet0.vp_c10)._m0[6].z, _630);
    int _848 = ~_742;
    int _850 = _848 + _830;
    int _852 = _850 + 1;
    float _854 = as_type<float>(_339) * _672;
    bool _856 = _295 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _858 = isnan(_295);
    bool _860 = _856 || _858;
    bool _862 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _864 = _860 || _862;
    float _866 = float(_864);
    float _868 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _870 = _295 + _868;
    int _872 = _820 ? 0 : 1;
    int _874 = _307 * _852;
    int _876 = _874 + _564;
    bool _878 = _746 > 0.0;
    float _880 = trunc(_854);
    float _882 = precise::max(_880, 0.0);
    uint _884 = uint(_882);
    bool _886 = _295 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _888 = isnan(_295);
    bool _890 = _886 || _888;
    bool _892 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _894 = _890 || _892;
    float _896 = float(_894);
    float _898 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _900 = _295 + _898;
    bool _902 = _295 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _904 = isnan(_295);
    bool _906 = _902 || _904;
    bool _908 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _910 = _906 || _908;
    float _912 = float(_910);
    float _914 = -_866;
    float _916 = _914 + 1.0;
    bool _918 = _295 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _920 = isnan(_295);
    bool _922 = _918 || _920;
    bool _924 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _926 = _922 || _924;
    float _928 = float(_926);
    float _930 = fma(_634, _870, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _932 = !_438;
    int _934 = _932 ? _876 : (-1);
    float _936 = _912 * _916;
    float _938 = -_912;
    float _940 = _938 + 1.0;
    int _942 = ~_307;
    int _944 = _942 + 1;
    float _946 = -_928;
    float _948 = _946 + 1.0;
    int _950 = _934 >> 31;
    float _952 = _928 * _940;
    float _954 = fma(_632, _900, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _956 = fma(_686, _810, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    int _958 = _950 & 3;
    int _960 = _944 * int(_884);
    int _962 = _960 + _506;
    float _964 = _800 + 0.5;
    float _966 = _896 * _948;
    int _968 = _934 + _958;
    float _970 = _824 + (-0.5);
    float _972 = float(uint(_962));
    float _974 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[80].x, _724);
    int _976 = _968 >> 2;
    float _978 = _930 * _966;
    float _980 = -_896;
    float _982 = _980 + 1.0;
    float _984 = as_type<float>(_339) * _972;
    int _986 = _976 << 4;
    int _988 = _986 + 368;
    float _990 = -_732;
    float _992 = _990 + 1.0;
    float _994 = -_970;
    float _996 = -_552;
    float _998 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[80].y, _996);
    float _1000 = -_736;
    float _1002 = _1000 + 1.0;
    uint _1004 = uint(int(uint(_988) >> uint(2)));
    uint _1006 = uint(int(uint(int(_1004)) >> uint(2)));
    int _1008 = int(_1004) & 3;
    float _1010 = (*spvDescriptorSet0.vp_c9)._m0[int(_1006)][_1008];
    int _1012 = int(_1004) + 1;
    uint _1014 = uint(int(uint(_1012) >> uint(2)));
    int _1016 = _1012 & 3;
    float _1018 = (*spvDescriptorSet0.vp_c9)._m0[int(_1014)][_1016];
    float _1020 = trunc(_984);
    float _1022 = precise::max(_1020, 0.0);
    uint _1024 = uint(_1022);
    float _1026 = fma(_982, (*spvDescriptorSet0.vp_c9)._m0[115].x, _978);
    int _1028 = ~_826;
    int _1030 = _1028 + 1;
    int _1032 = _1030 + 1;
    float _1034 = -_992;
    float _1036 = fma(_800, _1034, _974);
    float _1038 = fma(_824, _1002, _998);
    int _1040 = _1032;
    if (!_806)
    {
        int _1042 = ~_826;
        int _1044 = _1042 + 1;
        _1040 = _1044;
    }
    int _1046 = _1040;
    float _1048 = fma(_954, _952, _1026);
    int _1050 = _934 & 3;
    bool _1052 = _1050 != 0;
    int _1054 = ~_872;
    int _1056 = _1054 + 1;
    int _1058 = _1056 + 1;
    out.m_64.x = _1036;
    out.m_64.y = _1038;
    int _1060 = _1058;
    if (!_878)
    {
        int _1062 = ~_872;
        int _1064 = _1062 + 1;
        _1060 = _1064;
    }
    int _1066 = _1060;
    float _1068 = fma(_956, _936, _1048);
    bool _1070 = uint(_1050) > 1u;
    bool _1072 = !_834;
    int _1074 = _1072 ? 0 : 1;
    float _1076 = fma(_866, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1068);
    int _1078 = _934 & 3;
    bool _1080 = _1078 != 0;
    int _1082 = ~_307;
    int _1084 = _1082 + 1;
    int _1086 = _988 + 8;
    uint _1088 = uint(int(uint(_1086) >> uint(2)));
    uint _1090 = uint(int(uint(int(_1088)) >> uint(2)));
    int _1092 = int(_1088) & 3;
    float _1094 = (*spvDescriptorSet0.vp_c9)._m0[int(_1090)][_1092];
    int _1096 = int(_1088) + 1;
    uint _1098 = uint(int(uint(_1096) >> uint(2)));
    int _1100 = _1096 & 3;
    float _1102 = (*spvDescriptorSet0.vp_c9)._m0[int(_1098)][_1100];
    bool _1104 = !_838;
    int _1106 = _1104 ? 0 : 1;
    int _1108 = int(_884) + int(_1024);
    int _1110 = _1080 ? 0 : 1;
    int _1112 = abs(_1074);
    int _1114 = abs(_1106);
    int _1116 = ~_1110;
    int _1118 = _1116 + 1;
    int _1120 = _1118 + 1;
    int _1122 = _1084 * _1108;
    int _1124 = _1122 + _506;
    int _1126 = _1120;
    if (!_1070)
    {
        int _1128 = ~_1110;
        int _1130 = _1128 + 1;
        _1126 = _1130;
    }
    int _1132 = _1126;
    float _1134 = float(_782);
    float _1136 = float(_1114);
    bool _1138 = uint(_1050) >= 2u;
    int _1140 = abs(_1132);
    float _1142 = _1136 * _1134;
    bool _1144 = _1050 != 3;
    int _1146 = _1138 ? 0 : 1;
    bool _1148 = uint(_1124) >= uint(_307);
    float _1150 = float(_1112);
    float _1152 = float(_1066);
    bool _1154 = !_1148;
    int _1156 = _1154 ? 0 : (-1);
    int _1158 = ~_1140;
    int _1160 = _1158 + 1;
    int _1162 = _1160 + 1;
    float _1164 = _1150 * _1152;
    bool _1166 = _1050 != 3;
    float _1168 = _802 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1170 = ~_1108;
    int _1172 = _1170 + _1156;
    int _1174 = _1172 + 1;
    float _1176 = _844 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1178 = ~_1146;
    int _1180 = _1178 + 1;
    int _1182 = _1180 + 1;
    int _1184 = _1162 * as_type<int>(_1018);
    float _1186 = _846 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1188 = _1182;
    if (_1144)
    {
        int _1190 = ~_1146;
        int _1192 = _1190 + 1;
        _1188 = _1192;
    }
    int _1194 = _1188;
    float _1196 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1198 = _1168 + _1196;
    bool _1200 = !_1052;
    int _1202 = _1200 ? 0 : 1;
    float _1204 = in.m_66.x;
    float _1206 = in.m_66.y;
    float _1208 = in.m_66.z;
    float _1210 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1212 = _1176 + _1210;
    float _1214 = _1198 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1216 = abs(_1202);
    int _1218 = _307 * _1174;
    int _1220 = _1218 + _506;
    bool _1222 = !_1166;
    int _1224 = _1222 ? 0 : (-1);
    float _1226 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1214);
    int _1228 = abs(_1194);
    float _1230 = _1164 * (-2.0);
    int _1232 = abs(_1224);
    float _1234 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1236 = _1186 + _1234;
    int _1238 = ~_1216;
    int _1240 = _1238 + 1;
    int _1242 = _1240 + 1;
    float _1244 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1226);
    int _1246 = _1242 * as_type<int>(_1010);
    int _1248 = _1246 + _1184;
    int _1250 = ~_1228;
    int _1252 = _1250 + 1;
    int _1254 = _1252 + 1;
    int _1256 = ~_1232;
    int _1258 = _1256 + 1;
    int _1260 = _1258 + 1;
    bool _1262 = !_522;
    int _1264 = _1262 ? 0 : 1;
    int _1266 = _1254 * as_type<int>(_1094);
    int _1268 = _1266 + _1248;
    bool _1270 = _1244 >= 0.0;
    float _1272 = fma(_1230, _1204, _1204);
    bool _1274 = !_438;
    int _1276 = _1274 ? _1220 : (-1);
    int _1278 = _1260 * as_type<int>(_1102);
    int _1280 = _1278 + _1268;
    float _1282 = _1198 * _1198;
    int _1284 = abs(_1264);
    float _1286 = _1142 * (-2.0);
    float _1288 = fma(_766, _1230, _766);
    float _1290 = fma(_1212, _1212, _1282);
    int _1292 = ~_1284;
    int _1294 = _1292 + 1;
    int _1296 = _1294 + 1;
    float _1298 = fma(_758, _1286, _758);
    float _1300 = fma(_1286, _1206, _1206);
    float _1302 = fma(_1236, _1236, _1290);
    int _1304 = _1280 * _1296;
    float _1306 = _1076 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1308 = rsqrt(_1302);
    int _1310 = _1276 * _1284;
    int _1312 = _1310 + _1304;
    float _1314 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    if (_1270)
    {
        _776 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1316 = _776;
    float _1318 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1320 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1322 = _524 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1324 = _301 + (-0.5);
    float _1326 = _1318 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1328 = _1314 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1330 = _1320 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1332 = as_type<int>(_1316);
    if (_1270)
    {
        float _1334 = _1316 * 5.0;
        _1332 = as_type<int>(_1334);
    }
    int _1336 = _1332;
    float _1338 = float(_1312);
    float _1340 = _1322 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1342 = fma(_1324, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1272);
    bool _1344 = !_842;
    int _1346 = _1344 ? 0 : 1;
    out.m_68.x = _1326;
    out.m_68.y = _1328;
    out.m_68.z = _1330;
    out.m_68.w = _1306;
    float _1348 = _1340 * _1308;
    float _1350 = fma(_1288, _740, _1342);
    float _1352 = _303 + (-0.5);
    if (_1270)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4734 = as_type<float>(_1336);
        out.gl_Position.z = _4734;
    }
    float _1354 = _1198 * _1348;
    out.m_70.x = _1338;
    if (_1270)
    {
        out.m_53.x = 0.0;
    }
    int _1356 = abs(_1346);
    float _1358 = _1212 * _1348;
    if (_1270)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1360 = -_1354;
    float _1362 = _1168 + _1360;
    float _1364 = _1236 * _1348;
    float _1366 = -_1358;
    float _1368 = _1176 + _1366;
    float _1370 = -_1354;
    float _1372 = _1198 + _1370;
    float _1374 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1376 = _1362 + _1374;
    float _1378 = -_1364;
    float _1380 = _1186 + _1378;
    float _1382 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1384 = _1368 + _1382;
    float _1386 = float(_1046);
    float _1388 = _1376 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1390 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1392 = _1380 + _1390;
    float _1394 = float(_1356);
    float _1396 = fma(_1352, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1300);
    float _1398 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1388);
    float _1400 = -_1358;
    float _1402 = _1212 + _1400;
    float _1404 = _1372 * _1372;
    float _1406 = fma(_1298, _740, _1396);
    float _1408 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1398);
    float _1410 = _666 + _301;
    float _1412 = fma(_1402, _1402, _1404);
    float _1414 = -_1364;
    float _1416 = _1236 + _1414;
    float _1418 = _1394 * _1386;
    bool _1420 = _1408 >= 0.0;
    float _1422 = _1406 * 0.15915493667125701904296875;
    float _1424 = _1410 + (-1.0);
    float _1426 = fma(_1416, _1416, _1412);
    float _1428 = _1418 * (-2.0);
    float _1430 = _1350 * 0.15915493667125701904296875;
    float _1432 = fma(_1424, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1434 = _1422 * 6.283185482025146484375;
    float _1436 = sin(_1434);
    float _1438 = fma(_1428, _1208, _1208);
    float _1440 = _666 + (-0.5);
    float _1442 = fma(_1432, _1428, _1432);
    float _1444 = _1416;
    int _1446 = as_type<int>(_1438);
    float _1448 = _1364;
    float _1450 = _1384;
    if (_1420)
    {
        _1444 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1452 = _1444;
    float _1454 = fma(_1440, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1438);
    float _1456 = _1430 * 6.283185482025146484375;
    float _1458 = sin(_1456);
    if (_1420)
    {
        out.m_53.x = 0.0;
    }
    if (_1420)
    {
        float _1460 = _1452 * 5.0;
        _1446 = as_type<int>(_1460);
    }
    int _1462 = _1446;
    float _1464 = fma(_1442, _740, _1454);
    if (_1420)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4922 = as_type<float>(_1462);
        out.gl_Position.z = _4922;
    }
    float _1466 = _1430 * 6.283185482025146484375;
    float _1468 = cos(_1466);
    float _1470 = _1464 * 0.15915493667125701904296875;
    float _1472 = sqrt(_1426);
    float _1474 = _1422 * 6.283185482025146484375;
    float _1476 = cos(_1474);
    if (_1420)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1478 = _1470 * 6.283185482025146484375;
    float _1480 = cos(_1478);
    float _1482 = _275 * _458;
    float _1484 = _1308 * _1472;
    float _1486 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _177);
    float _1488 = _1468 * _1476;
    float _1490 = _1482 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1492 = _1322 * _1484;
    float _1494 = _1468 * _1436;
    float _1496 = _1470 * 6.283185482025146484375;
    float _1498 = sin(_1496);
    float _1500 = _1490 * _1484;
    float _1502 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _173);
    bool _1504 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1506 = isnan(0.5);
    bool _1508 = _1504 || _1506;
    bool _1510 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1512 = _1508 || _1510;
    float _1514 = _1486 * _1500;
    float _1516 = _1458 * _1436;
    float _1518 = _1458 * _1476;
    float _1520 = _1468 * _1480;
    float _1522 = _1502 * _1492;
    float _1524 = _1476 * _1480;
    float _1526 = _1458 * _1480;
    float _1528 = _1520 * _1514;
    float _1530 = _1484 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1532 = _1530 * 0.5;
    float _1534 = _1436 * _1480;
    bool _1536 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1538 = isnan(0.5);
    bool _1540 = _1536 || _1538;
    bool _1542 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1544 = _1540 || _1542;
    float _1546 = fma(_1498, _1488, _1516);
    float _1548 = -_1518;
    float _1550 = fma(_1498, _1494, _1548);
    float _1552 = -_1514;
    float _1554 = _1498 * _1552;
    float _1556 = -_1494;
    float _1558 = fma(_1498, _1518, _1556);
    float _1560 = fma(_1546, _1522, _1528);
    float _1562 = _1526 * _1514;
    float _1564 = fma(_1524, _1522, _1554);
    float _1566 = fma(_1498, _1516, _1488);
    float _1568 = fma(_1550, _1532, _1560);
    float _1570 = fma(_1558, _1522, _1562);
    float _1572 = fma(_1534, _1532, _1564);
    float _1574 = _1568 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1576 = fma(_1566, _1532, _1570);
    float _1578 = _1568 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1580 = fma(_1572, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1574);
    float _1582 = _1362 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1584 = fma(_1572, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1578);
    float _1586 = fma(_1576, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1580);
    float _1588 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1582);
    float _1590 = fma(_1576, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1584);
    float _1592 = _1362 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1594 = _1586 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1596 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1588);
    float _1598 = _1590 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1600 = _1186 + _1594;
    float _1602 = _1596 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1604 = _1176 + _1598;
    float _1606 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1592);
    float _1608 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1610 = _1600 + _1608;
    float _1612 = 1.0 / _1602;
    float _1614 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1616 = _1604 + _1614;
    float _1618 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1606);
    float _1620 = _1610 * _1610;
    float _1622 = _1568 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1624 = _1618 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1626 = fma(_1616, _1616, _1620);
    float _1628 = fma(_1572, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1622);
    float _1630 = _1624 + _1602;
    float _1632 = sqrt(_1626);
    float _1634 = fma(_1576, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1628);
    float _1636 = _1630 * _1612;
    float _1638 = _1636 * 0.5;
    float _1640 = _1634 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1642 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1644 = fma(_1638, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1642);
    float _1646 = _1168 + _1640;
    float _1648 = 1.0 / _1644;
    bool _1650 = _1632 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1652 = _1622;
    float _1654 = _1638;
    float _1656 = _1640;
    if (!_1650)
    {
        _1652 = _1604;
    }
    float _1658 = _1652;
    float _1660 = _1658;
    if (!_1650)
    {
        _1654 = _1600;
    }
    float _1662 = _1654;
    float _1664 = _1662;
    if (!_1650)
    {
        _1656 = _1646;
    }
    float _1666 = _1656;
    bool _1668 = !_1650;
    float _1670 = _1666;
    if (!_1668)
    {
        float _1672 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1674 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1676 = _1632 + _1674;
        float _1678 = _1646 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1680 = rsqrt(_1626);
        float _1682 = _1676 * _1672;
        float _1684 = _1682 * 0.15915493667125701904296875;
        float _1686 = _1684 * 6.283185482025146484375;
        float _1688 = cos(_1686);
        float _1690 = _1684 * 6.283185482025146484375;
        float _1692 = sin(_1690);
        float _1694 = _1688 + (-1.0);
        float _1696 = _1694 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1698 = fma(_1692, _1678, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1700 = fma(_1646, _1688, _1696);
        float _1702 = _1680 * _1698;
        float _1704 = fma(_1616, _1702, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1706 = fma(_1610, _1702, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1670 = _1700;
        _1664 = _1706;
        _1660 = _1704;
    }
    float _1708 = _1670;
    float _1710 = _1664;
    float _1712 = _1660;
    float _1714 = -_1354;
    float _1716 = _1714 + _1708;
    float _1718 = -_1364;
    float _1720 = _1718 + _1710;
    float _1722 = -_1358;
    float _1724 = _1722 + _1712;
    float _1726 = _1716;
    float _1728 = _1724;
    float _1730 = _1720;
    float _1732 = _1710;
    if (_1544)
    {
        _1448 = 1.0;
    }
    float _1734 = _1448;
    float _1736 = _1734;
    if (!_1512)
    {
        float _1738 = _1376 * _1376;
        float _1740 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1742 = -_1186;
        float _1744 = _1742 + _1710;
        float _1746 = -_1168;
        float _1748 = _1746 + _1708;
        float _1750 = fma(_1384, _1384, _1738);
        float _1752 = -_1176;
        float _1754 = _1752 + _1712;
        float _1756 = fma(_1392, _1392, _1750);
        float _1758 = 1.0 / _1484;
        float _1760 = sqrt(_1756);
        float _1762 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1764 = precise::min(_1760, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1766 = _1764 * _1740;
        float _1768 = _1762 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1770 = _1766 * _1758;
        float _1772 = _1768 * _1770;
        float _1774 = _1744 * _1770;
        float _1776 = fma(_1748, _1772, _1362);
        float _1778 = fma(_1754, _1772, _1368);
        float _1780 = fma(_1768, _1774, _1380);
        _1450 = _1760;
        _1726 = _1776;
        _1728 = _1778;
        _1730 = _1780;
    }
    float _1782 = _1450;
    float _1784 = _1726;
    float _1786 = _1728;
    float _1788 = _1730;
    float _1790 = _1782;
    if (_1544)
    {
        _1732 = 1.0;
    }
    float _1792 = _1732;
    float _1794 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1796 = _1648 * _1794;
    float _1798 = _1792;
    if (!_1544)
    {
        float _1800 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1802 = _1800 * 0.15915493667125701904296875;
        float _1804 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1806 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1808 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1806;
        float _1810 = _1802 * 6.283185482025146484375;
        float _1812 = cos(_1810);
        float _1814 = _1804 * 0.15915493667125701904296875;
        float _1816 = _1802 * 6.283185482025146484375;
        float _1818 = sin(_1816);
        float _1820 = 1.0 / _1812;
        float _1822 = _1814 * 6.283185482025146484375;
        float _1824 = cos(_1822);
        float _1826 = _1818 * _1820;
        float _1828 = _1814 * 6.283185482025146484375;
        float _1830 = sin(_1828);
        float _1832 = _1824 * _1826;
        float _1834 = 1.0 / _1808;
        float _1836 = 1.0 / _1832;
        float _1838 = _1830 * _1836;
        float _1840 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1842 = fma(_1796, _1838, _1840);
        float _1844 = _1842 * _1834;
        float _1846 = precise::clamp(_1844, 0.0, 1.0);
        _1790 = _1826;
        _1736 = _1846;
    }
    float _1848 = _1790;
    float _1850 = _1736;
    float _1852 = _1848;
    if (!_1544)
    {
        float _1854 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1856 = _1854 * 0.15915493667125701904296875;
        float _1858 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1860 = _1856 * 6.283185482025146484375;
        float _1862 = cos(_1860);
        float _1864 = _1858 * 0.15915493667125701904296875;
        float _1866 = _1856 * 6.283185482025146484375;
        float _1868 = sin(_1866);
        float _1870 = 1.0 / _1862;
        float _1872 = _1864 * 6.283185482025146484375;
        float _1874 = cos(_1872);
        float _1876 = _1868 * _1870;
        float _1878 = _1864 * 6.283185482025146484375;
        float _1880 = sin(_1878);
        float _1882 = _1874 * _1876;
        float _1884 = 1.0 / _1882;
        float _1886 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1888 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1886;
        float _1890 = 1.0 / _1888;
        float _1892 = _1880 * _1884;
        float _1894 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1896 = fma(_1796, _1892, _1894);
        float _1898 = _1896 * _1890;
        float _1900 = precise::clamp(_1898, 0.0, 1.0);
        float _1902 = -_1900;
        float _1904 = _1902 + 1.0;
        _1852 = _1870;
        _1798 = _1904;
    }
    float _1906 = _1852;
    float _1908 = _1798;
    float _1910 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1912 = _1784 + _1910;
    float _1914 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1916 = _1786 + _1914;
    float _1918 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1920 = _1788 + _1918;
    float _1922 = _1784 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1924 = _1912 * _1912;
    float _1926 = fma(_1916, _1916, _1924);
    float _1928 = fma(_1920, _1920, _1926);
    float _1930 = rsqrt(_1928);
    float _1932 = sqrt(_1928);
    float _1934 = _1930 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1936 = _1916 * _1934;
    float _1938 = _1920 * _1934;
    float _1940 = _1936 * _1936;
    float _1942 = _1938 * _1938;
    float _1944 = _1940 + _1942;
    float _1946 = sqrt(_1944);
    bool _1948 = _1946 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1950 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1952 = _1946 + _1950;
    float _1954 = _1920;
    float _1956 = _1930;
    float _1958 = _1952;
    float _1960 = _1906;
    if (_1948)
    {
        float _1962 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1954 = _1962;
    }
    float _1964 = _1954;
    if (_1948)
    {
        float _1966 = rsqrt(_1944);
        _1956 = _1966;
    }
    float _1968 = _1956;
    float _1970 = _1968;
    if (_1948)
    {
        float _1972 = _1952 * _1964;
        _1958 = _1972;
    }
    float _1974 = _1958;
    if (_1948)
    {
        float _1976 = _1974 * 0.15915493667125701904296875;
        _1960 = _1976;
    }
    float _1978 = _1960;
    float _1980 = _1964;
    float _1982 = _1978;
    if (_1948)
    {
        float _1984 = _1978 * 6.283185482025146484375;
        float _1986 = sin(_1984);
        _1980 = _1986;
    }
    float _1988 = _1980;
    float _1990 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1992 = precise::max(0.0, _1990);
    float _1994 = _1924;
    float _1996 = _1992;
    if (_1948)
    {
        float _1998 = _1978 * 6.283185482025146484375;
        float _2000 = cos(_1998);
        _1994 = _2000;
    }
    float _2002 = _1994;
    float _2004 = -_1934;
    float _2006 = -_1992;
    float _2008 = fma(_1912, _2004, _2006);
    float _2010 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    float _2012 = _2008;
    if (_1948)
    {
        float _2014 = _2008 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1996 = _2014;
    }
    float _2016 = _1996;
    float _2018 = _2016;
    if (!_1948)
    {
        _1982 = _1940;
    }
    float _2020 = _1982;
    float _2022 = fma(_1368, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2024 = _1988;
    float _2026 = _2020;
    if (_1948)
    {
        float _2028 = fma(_1988, _2016, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2024 = _2028;
    }
    float _2030 = _2024;
    float _2032 = _2030;
    float _2034 = _2002;
    if (_1948)
    {
        float _2036 = _2002 + (-1.0);
        _2018 = _2036;
    }
    float _2038 = _2018;
    float _2040 = _2038;
    if (_1948)
    {
        float _2042 = _1968 * _2030;
        _2010 = _2042;
    }
    float _2044 = _2010;
    if (!_1948)
    {
        _1970 = _1936;
    }
    float _2046 = _1970;
    float _2048 = fma(_1380, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2050 = _2046;
    if (_1948)
    {
        float _2052 = _2038 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2040 = _2052;
    }
    float _2054 = _2040;
    if (_1948)
    {
        float _2056 = _1936 * _2044;
        _2050 = _2056;
    }
    float _2058 = _2050;
    if (!_1948)
    {
        _2032 = _1938;
    }
    float _2060 = _2032;
    float _2062 = _2060;
    if (_1948)
    {
        float _2064 = _1938 * _2044;
        _2062 = _2064;
    }
    float _2066 = _2062;
    if (_1948)
    {
        float _2068 = fma(_2008, _2002, _2054);
        _2012 = _2068;
    }
    float _2070 = _2012;
    if (_1948)
    {
        float _2072 = _2058 * _2058;
        _2026 = _2072;
    }
    float _2074 = _2026;
    if (!_1948)
    {
        _2034 = _1942;
    }
    float _2076 = _2034;
    float _2078 = _2076;
    if (_1948)
    {
        float _2080 = _2066 * _2066;
        _2078 = _2080;
    }
    float _2082 = _2078;
    float _2084 = fma(_2070, _2070, _2074);
    float _2086 = _1784 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2088 = floor(_2022);
    float _2090 = _2084 + _2082;
    float _2092 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2086);
    float _2094 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2096 = fma(_1932, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2094);
    float _2098 = precise::clamp(_2096, 0.0, 1.0);
    float _2100 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1922);
    float _2102 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2092);
    float _2104 = -_2098;
    float _2106 = _2104 + 1.0;
    float _2108 = rsqrt(_2090);
    float _2110 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2112 = _2102 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2114 = _1784 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2116 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2100);
    float _2118 = _2112 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2120 = abs(_2106);
    float _2122 = log2(_2120);
    float _2124 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2114);
    float _2126 = -_2118;
    float _2128 = fma(_2126, _2110, 1.0);
    float _2130 = _1784 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2132 = _2116 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2134 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2124);
    float _2136 = -_2088;
    float _2138 = _2022 + _2136;
    float _2140 = _2108 * _2058;
    float _2142 = _2108 * _2066;
    float _2144 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2130);
    float _2146 = _2108 * _2070;
    float _2148 = _2140 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2150 = _2134 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2152 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2144);
    float _2154 = floor(_2048);
    float _2156 = -_2148;
    float _2158 = fma(_2146, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2156);
    float _2160 = _2150 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2162 = _2152 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2164 = _2122 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2166 = -_2142;
    float _2168 = fma(_2166, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2158);
    float _2170 = _2150 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2172 = fma(_2162, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2160);
    float _2174 = exp2(_2164);
    float _2176 = fma(_2168, -0.5, 0.5);
    float _2178 = _2150 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2180 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2172);
    float _2182 = fma(_2162, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2170);
    float _2184 = _2146 + 1.0;
    float _2186 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2180);
    float _2188 = sqrt(_2176);
    float _2190 = -_2154;
    float _2192 = _2048 + _2190;
    float _2194 = fma(_2162, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2178);
    float _2196 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2182);
    float _2198 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2194);
    float _2200 = 1.0 / _2186;
    float _2202 = log2(_2128);
    float _2204 = _2188 * 0.636619746685028076171875;
    float _2206 = fma(_2168, 0.5, 0.5);
    float _2208 = -_2146;
    float _2210 = fma(_2174, _2184, _2208);
    float _2212 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2196);
    float _2214 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2198);
    float _2216 = fma(_2206, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float2 _6105 = float2(_2138, _2192);
    float _2218 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6105, float2(0.0), isnan(_6105)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6105, float2(0.0), isnan(_6105)), level(0.0)).x;
    float _2220 = _2212 * _2200;
    float _2222 = _2202 * 0.693147182464599609375;
    float _2224 = fma(_2206, _2216, -0.212114393711090087890625);
    float _2226 = _2214 * _2200;
    float _2228 = fma(_2210, 0.5, 0.5);
    float _2230 = _2222 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2232 = fma(_2206, _2224, 1.570728778839111328125);
    float _2234 = fma(_2226, -0.5, 0.5);
    float _2236 = -_2232;
    float _2238 = fma(_2204, _2236, 1.0);
    float _2240 = fma(_2220, 0.5, 0.5);
    float3 _6148 = float3(_2240, _2234, _2230);
    float _2242 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6148, float3(0.0), isnan(_6148)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6148, float3(0.0), isnan(_6148)), level(0.0)).x;
    float3 _6159 = float3(_2240, _2234, _2230);
    float4 _2245 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6159, float3(0.0), isnan(_6159)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6159, float3(0.0), isnan(_6159)), level(0.0)).xyzw;
    float _2247 = _2245.x;
    float _2249 = _2245.y;
    float _2251 = _2245.z;
    float _2253 = _2245.w;
    float2 _6175 = float2(_2238, _2228);
    float3 _2257 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6175, float2(0.0), isnan(_6175)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6175, float2(0.0), isnan(_6175)), level(0.0)).xyz;
    float _2259 = _2257.x;
    float _2261 = _2257.y;
    float _2263 = _2257.z;
    float _2265 = abs(_1796);
    float _2267 = log2(_2265);
    float _2269 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2271 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2273 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2275 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2269);
    float _2277 = _1520 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2279 = _2150 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2281 = _177 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2283 = _173 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2285 = _1932 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2287 = isnan(_1932);
    bool _2289 = _2285 || _2287;
    bool _2291 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2293 = _2289 || _2291;
    float _2295 = _2267 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2297 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2271);
    float _2299 = _1520 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2301 = _1520 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2303 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2273);
    float _2305 = -_1498;
    float _2307 = fma(_2305, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2277);
    float _2309 = exp2(_2295);
    float _2311 = _1550 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2313 = _1550 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2315 = _1550 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2317 = -_1498;
    float _2319 = fma(_2317, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2299);
    float _2321 = -_1498;
    float _2323 = fma(_2321, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2301);
    float _2325 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2311);
    float _2327 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2313);
    float _2329 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2315);
    float _2331 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2307);
    float _2333 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2319);
    float _2335 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2323);
    float _2337 = fma(_2162, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2279);
    float _2339 = _2122 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2341 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2275);
    float _2343 = fma(_2309, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2345 = precise::clamp(_2343, 0.0, 1.0);
    float _2347 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2337);
    float _2349 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2297);
    float _2351 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2303);
    float _2353 = fma(_2345, -2.0, 3.0);
    float _2355 = _2345 * _2345;
    float _2357 = exp2(_2339);
    float _2359 = in.m_72.x;
    float _2361 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2325);
    float _2363 = _2355 * _2353;
    float _2365 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2327);
    float _2367 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2329);
    float _2369 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2347);
    float _2371 = -_2363;
    float _2373 = _2371 + 1.0;
    bool _2375 = _1796 <= 8000.0;
    bool _2377 = isnan(_1796);
    bool _2379 = _2375 || _2377;
    bool _2381 = isnan(8000.0);
    bool _2383 = _2379 || _2381;
    float _2385 = float(_2383);
    float _2387 = _2281 * _2331;
    float _2389 = _2281 * _2333;
    float _2391 = fma(_2373, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2363);
    float _2393 = _2281 * _2335;
    float _2395 = fma(_2283, _2341, _2387);
    float _2397 = _2369 + _2186;
    float _2399 = _2385 * _2391;
    float _2401 = -_2357;
    float _2403 = _2401 + 1.0;
    float _2405 = _2212 + _2186;
    float _2407 = _2186 * 0.5;
    float _2409 = _2399 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2411 = fma(_2283, _2351, _2393);
    float _2413 = _2403 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2415 = _2397 * 0.5;
    float _2417 = _2405 * 0.5;
    float _2419 = fma(_2214, -0.5, _2407);
    out.gl_Position.x = _2212;
    out.gl_Position.y = _2214;
    out.gl_Position.z = _2369;
    out.gl_Position.w = _2186;
    float _2421 = fma(_2283, _2349, _2389);
    float _2423 = _2361 + _2395;
    float _2425 = _2367 + _2411;
    out.m_74.x = _2417;
    out.m_74.y = _2419;
    out.m_74.z = _2415;
    out.m_74.w = _2186;
    float _2427 = _2365 + _2421;
    float _2429 = _2283;
    if (!_2293)
    {
        _2429 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2431 = _2429;
    out.m_76.x = _2423;
    out.m_76.y = _2427;
    out.m_76.z = _2425;
    float _2433 = -_2413;
    float _2435 = _2433 + 1.0;
    float _2437 = -_2218;
    float _2439 = _2437 + 1.0;
    float _2441 = _2439 * _2409;
    float _2443 = precise::clamp(_2441, 0.0, 1.0);
    float _2445 = -_2443;
    float _2447 = fma(_2445, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2449 = _2447 * _2359;
    float _2451 = _2413 * _2242;
    float _2453 = _2449 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2455 = _2253 * _2435;
    float _2457 = _1850 * _1908;
    float _2459 = _2253 * _2451;
    float _2461 = _2263 * _2451;
    out.m_78.x = _2453;
    float _2463 = fma(_2259, _2459, _2247);
    float _2465 = fma(_2261, _2459, _2249);
    float _2467 = fma(_2253, _2461, _2251);
    float _2469 = _2457 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2471 = _2249;
    float _2473 = _2259;
    float _2475 = _2251;
    float _2477 = _2247;
    float _2479 = _2457;
    float _2481 = _2431;
    float _2483 = _2431;
    if (!_2293)
    {
        _2471 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2485 = _2471;
    float _2487 = _2485;
    float _2489 = _2485;
    if (!_2293)
    {
        _2473 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2491 = _2473;
    out.m_80.x = _2463;
    out.m_80.y = _2465;
    out.m_80.z = _2467;
    out.m_80.w = _2455;
    float _2493 = _2491;
    float _2495 = _2491;
    if (!_2293)
    {
        _2475 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2497 = _2475;
    float _2499 = _2497;
    float _2501 = _2497;
    if (!_2293)
    {
        _2477 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2503 = _2477;
    float _2505 = _2503;
    float _2507 = _2503;
    if (!_2293)
    {
        _2479 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2509 = _2479;
    bool _2511 = !_2293;
    float _2513 = _2509;
    float _2515 = _2509;
    if (!_2511)
    {
        bool _2517 = _1932 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2519 = isnan(_1932);
        bool _2521 = _2517 || _2519;
        bool _2523 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2525 = _2521 || _2523;
        if (!_2525)
        {
            float _2527 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2529 = _1932 + _2527;
            float _2531 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2533 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2531;
            float _2535 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2537 = _2535 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2539 = 1.0 / _2533;
            float _2541 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2543 = _2541 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2545 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2547 = _2545 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2549 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2551 = _2549 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2553 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2555 = _2553 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2557 = _2529 * _2539;
            float _2559 = precise::clamp(_2557, 0.0, 1.0);
            float _2561 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2563 = _2561 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2565 = fma(_2559, _2537, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2567 = fma(_2559, _2543, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2569 = fma(_2559, _2563, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2571 = fma(_2559, _2547, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2573 = fma(_2559, _2551, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2575 = fma(_2559, _2555, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2495 = _2569;
            _2483 = _2573;
            _2489 = _2567;
            _2507 = _2565;
            _2501 = _2571;
            _2515 = _2575;
            _2577 = true;
        }
        else
        {
            bool _2579 = _1932 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2581 = isnan(_1932);
            bool _2583 = _2579 || _2581;
            bool _2585 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2587 = _2583 || _2585;
            if (!_2587)
            {
                _2487 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2589 = _2487;
            _2489 = _2589;
            if (!_2587)
            {
                _2493 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2591 = _2493;
            _2495 = _2591;
            if (!_2587)
            {
                _2499 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2593 = _2499;
            _2501 = _2593;
            if (!_2587)
            {
                _2505 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2595 = _2505;
            _2507 = _2595;
            if (!_2587)
            {
                _2481 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2597 = _2481;
            _2483 = _2597;
            if (!_2587)
            {
                _2513 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2599 = _2513;
            bool _2601 = !_2587;
            _2515 = _2599;
            if (!_2601)
            {
                bool _2603 = _1932 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2605 = isnan(_1932);
                bool _2607 = _2603 || _2605;
                bool _2609 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2611 = _2607 || _2609;
                if (!_2611)
                {
                    float _2613 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2615 = _1932 + _2613;
                    float _2617 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2619 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2617;
                    float _2621 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2623 = _2621 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2625 = 1.0 / _2619;
                    float _2627 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2629 = _2627 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2631 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2633 = _2631 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2635 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2637 = _2635 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2639 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2641 = _2639 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2643 = _2615 * _2625;
                    float _2645 = precise::clamp(_2643, 0.0, 1.0);
                    float _2647 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2649 = _2647 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2651 = fma(_2645, _2623, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2653 = fma(_2645, _2629, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2655 = fma(_2645, _2649, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2657 = fma(_2645, _2633, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2659 = fma(_2645, _2637, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2661 = fma(_2645, _2641, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2495 = _2655;
                    _2483 = _2659;
                    _2489 = _2653;
                    _2507 = _2651;
                    _2501 = _2657;
                    _2515 = _2661;
                    _2577 = true;
                }
                else
                {
                    _2495 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2483 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2489 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2507 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2501 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2515 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2577 = false;
    float _2663 = _2495;
    float _2665 = _2483;
    float _2667 = _2489;
    float _2669 = _2507;
    float _2671 = _2501;
    float _2673 = _2515;
    float _2675 = fma(_2427, -0.5, 0.5);
    float _2677 = precise::clamp(_2675, 0.0, 1.0);
    float _2679 = -_2663;
    float _2681 = _2679 + _2665;
    float _2683 = _2469 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2685 = -_2667;
    float _2687 = _2685 + _2669;
    float _2689 = fma(_2677, _2681, _2663);
    out.m_82.x = 0.0;
    float _2691 = -_2671;
    float _2693 = _2691 + _2673;
    float _2695 = fma(_2677, _2687, _2667);
    float _2697 = _2689 * 0.586610972881317138671875;
    out.m_53.x = _2683;
    bool _2699 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2701 = fma(_2677, _2693, _2671);
    float _2703 = fma(_2695, 0.298911988735198974609375, _2697);
    bool _2705 = _1850 > 0.0;
    bool _2707 = isnan(_1850);
    bool _2709 = _2705 || _2707;
    bool _2711 = isnan(0.0);
    bool _2713 = _2709 || _2711;
    float _2715 = fma(_2701, 0.114477999508380889892578125, _2703);
    bool _2717 = _1908 <= 0.0;
    bool _2719 = !_2713;
    bool _2721 = _2717 || _2719;
    float _2723 = -_2715;
    float _2725 = _2695 + _2723;
    float _2727 = -_2715;
    float _2729 = _2689 + _2727;
    float _2731 = -_2715;
    float _2733 = _2701 + _2731;
    float _2735 = fma(_2725, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2715);
    float _2737 = fma(_2729, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2715);
    float _2739 = fma(_2733, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2715);
    bool _2741 = !_2699;
    if (!_2741)
    {
        float _2743 = -_1784;
        float _2745 = _2743 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2747 = -_1786;
        float _2749 = _2747 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2751 = -_1788;
        float _2753 = _2751 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2755 = _2745 * _2745;
        float _2757 = fma(_2749, _2749, _2755);
        float _2759 = fma(_2753, _2753, _2757);
        float _2761 = sqrt(_2759);
        float _2763 = rsqrt(_2759);
        float _2765 = -_2761;
        float _2767 = _2765 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2769 = _2767 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2771 = precise::clamp(_2769, 0.0, 1.0);
        float _2773 = _2749 * _2763;
        float _2775 = _2745 * _2763;
        float _2777 = abs(_2771);
        float _2779 = log2(_2777);
        float _2781 = _2753 * _2763;
        float _2783 = _2773 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2785 = _2427 * _2775;
        float _2787 = -_2775;
        float _2789 = -_2783;
        float _2791 = fma(_2787, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2789);
        float _2793 = fma(_2423, _2773, _2785);
        float _2795 = -_2781;
        float _2797 = fma(_2795, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2791);
        float _2799 = fma(_2425, _2781, _2793);
        float _2801 = precise::clamp(_2799, 0.0, 1.0);
        float _2803 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2805 = _2797 + _2803;
        float _2807 = _2779 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2809 = _2805 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2811 = precise::clamp(_2809, 0.0, 1.0);
        float _2813 = exp2(_2807);
        float _2815 = _2813 * _2811;
        float _2817 = _2801 * _2815;
        float _2819 = _2817 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2821 = _2817 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2823 = _2817 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_82.x = _2819;
        out.m_82.y = _2821;
        out.m_82.z = _2823;
    }
    out.m_84.x = _2735;
    out.m_84.y = _2737;
    out.m_84.z = _2739;
    if (!_2721)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2825 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_53.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2825;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2577 = false;
    bool _201 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _98 = in.m_46.w;
    float _100 = in.m_48.w;
    float _102 = trunc(_98);
    int _105 = int(_102);
    float _107 = -_100;
    float _109 = _107 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _109;
    bool _113 = _105 >= 1;
    float _115 = 0.0;
    float _117 = as_type<float>(_105);
    float _119 = _109;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _115;
    if (!_113)
    {
        out.m_53.x = 0.0;
    }
    int _123 = 0;
    if (!_113)
    {
        float _125 = _121 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2894 = as_type<float>(_127);
        out.gl_Position.z = _2894;
    }
    if (!_113)
    {
        return out;
    }
    bool _131 = _100 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_100);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = float(_105);
    bool _143 = _109 >= _141;
    bool _145 = !_139;
    bool _147 = _143 || _145;
    if (_147)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _149 = _117;
    if (_147)
    {
        out.m_53.x = 0.0;
    }
    if (_147)
    {
        float _151 = _149 * 5.0;
        _129 = as_type<int>(_151);
    }
    int _153 = _129;
    if (_147)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2949 = as_type<float>(_153);
        out.gl_Position.z = _2949;
    }
    if (_147)
    {
        return out;
    }
    float _155 = as_type<float>(int(gl_VertexIndex));
    float _157 = 1.0 / _141;
    bool _159 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _161 = _109 * _157;
    int _163 = as_type<int>(_155) & 1;
    bool _165 = _163 != 0;
    int _167 = as_type<int>(_155) & 2;
    bool _169 = _167 != 0;
    bool _171 = !_165;
    float _173 = _171 ? (-0.5) : 0.5;
    bool _175 = !_169;
    float _177 = _175 ? (-0.5) : 0.5;
    bool _179 = !_159;
    float _181 = _161;
    float _199;
    if (!_179)
    {
        float _183 = in.m_58.x;
        float _185 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _187 = _183 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _189 = fma(_187, (*spvDescriptorSet0.vp_c9)._m0[12].x, _109);
        float _191 = _189 * _185;
        float _193 = floor(_191);
        float _195 = -_193;
        float _197 = _191 + _195;
        _199 = _197;
        _201 = true;
    }
    else
    {
        _199 = _161;
    }
    _201 = false;
    float _203 = _199;
    float _205 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _207 = _203 + _205;
    bool _209 = _203 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _211 = isnan(_203);
    bool _213 = _209 || _211;
    bool _215 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _217 = _213 || _215;
    float _219 = float(_217);
    float _221 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _223 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _221;
    float _225 = -_219;
    float _227 = _225 + 1.0;
    bool _229 = _203 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _231 = isnan(_203);
    bool _233 = _229 || _231;
    bool _235 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _237 = _233 || _235;
    float _239 = float(_237);
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _243 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _241;
    bool _245 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _247 = 1.0 / _223;
    float _249 = _239 * _227;
    float _251 = -_239;
    float _253 = _251 + 1.0;
    float _255 = _207 * _247;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _257;
    float _261 = fma(_243, _255, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _263 = fma(_259, _255, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _265 = _261 * _249;
    float _267 = _263 * _249;
    float _269 = fma(_253, (*spvDescriptorSet0.vp_c9)._m0[143].x, _265);
    float _271 = fma(_253, (*spvDescriptorSet0.vp_c9)._m0[143].y, _267);
    float _273 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[144].x, _269);
    float _275 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[144].y, _271);
    bool _277 = !_245;
    if (!_277)
    {
        float _279 = in.m_58.x;
        float _281 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _283 = _279 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _285 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[11].y, _109);
        float _287 = _285 * _281;
        float _289 = floor(_287);
        float _291 = -_289;
        float _293 = _287 + _291;
        _181 = _293;
    }
    float _295 = _181;
    float _297 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _299 = int(_297);
    float _301 = in.m_58.x;
    float _303 = in.m_58.y;
    float _305 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _307 = int(_305);
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _313 = float(_299);
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _315;
    float _319 = 1.0 / _313;
    float _321 = float(uint(_307));
    int _323 = ~_307;
    int _325 = _323 + 1;
    float _327 = 1.0 / _321;
    int _329 = ~_307;
    int _331 = _329 + 1;
    float _333 = _319 * _109;
    float _335 = trunc(_333);
    int _337 = int(_335);
    int _339 = as_type<int>(_327) + (-2);
    int _341 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _343 = _341 != 0;
    float _345 = float(uint(_337));
    float _347 = float(_337);
    float _349 = as_type<float>(_339) * _345;
    float _351 = trunc(_349);
    float _353 = precise::max(_351, 0.0);
    uint _356 = uint(_353);
    int _358 = _331 * int(_356);
    int _360 = _358 + _337;
    float _362 = float(uint(_360));
    float _364 = as_type<float>(_339) * _362;
    bool _366 = !_343;
    float _368 = _366 ? 7.345489978790283203125 : 1.0;
    float _370 = trunc(_364);
    float _372 = precise::max(_370, 0.0);
    uint _374 = uint(_372);
    float _376 = _368 * _301;
    float _378 = floor(_376);
    int _380 = int(_356) + int(_374);
    float _382 = float(_307);
    int _384 = _325 * _380;
    int _386 = _384 + _337;
    bool _388 = _347 >= _382;
    bool _390 = isnan(_347);
    bool _392 = _388 || _390;
    bool _394 = isnan(_382);
    bool _396 = _392 || _394;
    float _398 = float(_396);
    float _400 = _382 * _109;
    float _402 = -_378;
    float _404 = _376 + _402;
    bool _406 = uint(_386) >= uint(_307);
    float _408 = _400 * _157;
    float _410 = trunc(_398);
    int _412 = int(_410);
    float _414 = _404 * _382;
    bool _416 = !_406;
    int _418 = _416 ? 0 : (-1);
    int _420 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _422 = _420 != 0;
    int _424 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _426 = _424 != 0;
    int _428 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _430 = _428 != 0;
    int _432 = ~_380;
    int _434 = _432 + _418;
    int _436 = _434 + 1;
    bool _438 = _307 == 0;
    float _440 = trunc(_414);
    int _442 = int(_440);
    bool _444 = !_426;
    int _446 = _444 ? 0 : 1;
    int _448 = _307 * _436;
    int _450 = _448 + _337;
    int _452 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _454 = _452 != 0;
    float _456 = in.m_60.x;
    float _458 = in.m_60.y;
    int _460 = _307 + (-1);
    int _462 = ~_412;
    int _464 = _462 + 1;
    int _466 = _464 + 1;
    float _468 = trunc(_408);
    int _470 = int(_468);
    bool _472 = !_438;
    int _474 = _472 ? _450 : (-1);
    bool _476 = !_422;
    int _478 = _476 ? 0 : 1;
    int _480 = abs(_446);
    int _482 = _474 * _466;
    bool _484 = !_454;
    int _486 = _484 ? 0 : 1;
    int _488 = abs(_478);
    int _490 = _412 * _460;
    int _492 = _490 + _482;
    float _494 = _303 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _496 = abs(_486);
    bool _498 = !_430;
    int _500 = _498 ? 0 : 1;
    int _502 = _492 * _480;
    int _504 = _442 * _496;
    int _506 = _504 + _337;
    int _508 = abs(_500);
    float _510 = fma(_494, -2.0, _311);
    int _512 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _514 = _512 != 0;
    int _516 = _470 * _488;
    int _518 = _516 + _502;
    int _520 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _522 = _520 != 0;
    float _524 = _273 * _456;
    int _526 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _528 = _526 != 0;
    float _530 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _532 = log2(_530);
    int _534 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _536 = _534 != 0;
    int _538 = _506 * _508;
    int _540 = _538 + _518;
    bool _542 = !_514;
    int _544 = _542 ? 0 : 1;
    float _546 = in.m_46.x;
    float _548 = in.m_46.y;
    float _550 = in.m_46.z;
    float _552 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[76].y, _510);
    int _554 = abs(_544);
    float _556 = _301 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _560 = _558 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _562 = _442 * _554;
    int _564 = _562 + _540;
    float _566 = -_309;
    float _568 = fma(_556, 2.0, _566);
    float _570 = 1.0 / _560;
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _574 = _572 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _576 = float(uint(_564));
    float _578 = _532 * _109;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _582 = 1.0 / _574;
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _586 = _584 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _590 = as_type<float>(_339) * _576;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _594 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _596 = _548 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _598 = _548 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _600 = 1.0 / _586;
    float _602 = _588 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _604 = _594 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _606 = ~_307;
    int _608 = _606 + 1;
    float _610 = _548 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _612 = fma(_546, (*spvDescriptorSet0.vp_c10)._m0[4].x, _596);
    float _614 = fma(_546, (*spvDescriptorSet0.vp_c10)._m0[5].x, _598);
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _618 = _616 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _620 = trunc(_590);
    float _622 = precise::max(_620, 0.0);
    uint _624 = uint(_622);
    float _626 = _592 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _628 = _301 * 2.0;
    float _630 = fma(_546, (*spvDescriptorSet0.vp_c10)._m0[6].x, _610);
    float _632 = _618 * _582;
    out.m_62.x = _602;
    out.m_62.y = _626;
    out.m_62.z = _604;
    out.m_62.w = _580;
    float _634 = _317 * _570;
    float _636 = floor(_628);
    bool _638 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _640 = isnan(1.0);
    bool _642 = _638 || _640;
    bool _644 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _646 = _642 || _644;
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _650 = 1.0 + _648;
    bool _652 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _654 = isnan(0.0);
    bool _656 = _652 || _654;
    bool _658 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _660 = _656 || _658;
    bool _662 = _301 > 0.5;
    float _664 = exp2(_578);
    float _666 = in.m_58.z;
    int _668 = _608 * int(_624);
    int _670 = _668 + _564;
    float _672 = float(uint(_506));
    float _674 = float(uint(_670));
    float _676 = 1.0 / _650;
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _678;
    float _682 = as_type<float>(_339) * _674;
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _686 = _680 * _600;
    float _688 = trunc(_682);
    float _690 = precise::max(_688, 0.0);
    uint _692 = uint(_690);
    float _694 = -_664;
    float _696 = _694 + 1.0;
    float _698 = -_173;
    int _700 = _662 ? as_type<int>(_698) : as_type<int>(_173);
    float _702 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _704 = _636 > 0.0;
    float _706 = _303 * 2.0;
    float _708 = _660 ? _696 : 0.0;
    float _710 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[78].z, _684);
    bool _712 = _636 >= 0.0;
    bool _714 = isnan(_636);
    bool _716 = _712 || _714;
    bool _718 = isnan(0.0);
    bool _720 = _716 || _718;
    float _722 = -_109;
    float _724 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[76].x, _568);
    float _726 = _666 * 2.0;
    float _728 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[78].w, _702);
    float _730 = floor(_706);
    float _732 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[77].z, _710);
    float _734 = _303 + _666;
    float _736 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[77].w, _728);
    if (_646)
    {
        float _738 = _708 * _676;
        _119 = _738;
    }
    float _740 = _119;
    int _742 = int(_624) + int(_692);
    float _744 = _303 + _301;
    float _746 = floor(_726);
    int _748 = ~_307;
    int _750 = _748 + 1;
    float _752 = _734 + (-1.0);
    float _754 = _744 + (-1.0);
    int _756 = _720 ? 0 : 1;
    float _758 = fma(_752, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _760 = _750 * _742;
    int _762 = _760 + _564;
    bool _764 = _303 > 0.5;
    float _766 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _768 = ~_756;
    int _770 = _768 + 1;
    int _772 = _770 + 1;
    int _774 = _772;
    float _776 = _766;
    if (!_704)
    {
        int _778 = ~_756;
        int _780 = _778 + 1;
        _774 = _780;
    }
    int _782 = _774;
    float _784 = -_177;
    int _786 = _764 ? as_type<int>(_784) : as_type<int>(_177);
    bool _788 = _730 >= 0.0;
    bool _790 = isnan(_730);
    bool _792 = _788 || _790;
    bool _794 = isnan(0.0);
    bool _796 = _792 || _794;
    bool _798 = !_528;
    float _800 = _798 ? _173 : as_type<float>(_700);
    float _802 = fma(_550, (*spvDescriptorSet0.vp_c10)._m0[5].z, _614);
    bool _804 = uint(_762) >= uint(_307);
    bool _806 = _730 > 0.0;
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _810 = _295 + _808;
    bool _812 = _746 >= 0.0;
    bool _814 = isnan(_746);
    bool _816 = _812 || _814;
    bool _818 = isnan(0.0);
    bool _820 = _816 || _818;
    bool _822 = !_536;
    float _824 = _822 ? _177 : as_type<float>(_786);
    int _826 = _796 ? 0 : 1;
    bool _828 = !_804;
    int _830 = _828 ? 0 : (-1);
    int _832 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _834 = _832 != 0;
    int _836 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _838 = _836 != 0;
    int _840 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _842 = _840 != 0;
    float _844 = fma(_550, (*spvDescriptorSet0.vp_c10)._m0[4].z, _612);
    float _846 = fma(_550, (*spvDescriptorSet0.vp_c10)._m0[6].z, _630);
    int _848 = ~_742;
    int _850 = _848 + _830;
    int _852 = _850 + 1;
    float _854 = as_type<float>(_339) * _672;
    bool _856 = _295 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _858 = isnan(_295);
    bool _860 = _856 || _858;
    bool _862 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _864 = _860 || _862;
    float _866 = float(_864);
    float _868 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _870 = _295 + _868;
    int _872 = _820 ? 0 : 1;
    int _874 = _307 * _852;
    int _876 = _874 + _564;
    bool _878 = _746 > 0.0;
    float _880 = trunc(_854);
    float _882 = precise::max(_880, 0.0);
    uint _884 = uint(_882);
    bool _886 = _295 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _888 = isnan(_295);
    bool _890 = _886 || _888;
    bool _892 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _894 = _890 || _892;
    float _896 = float(_894);
    float _898 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _900 = _295 + _898;
    bool _902 = _295 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _904 = isnan(_295);
    bool _906 = _902 || _904;
    bool _908 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _910 = _906 || _908;
    float _912 = float(_910);
    float _914 = -_866;
    float _916 = _914 + 1.0;
    bool _918 = _295 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _920 = isnan(_295);
    bool _922 = _918 || _920;
    bool _924 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _926 = _922 || _924;
    float _928 = float(_926);
    float _930 = fma(_634, _870, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _932 = !_438;
    int _934 = _932 ? _876 : (-1);
    float _936 = _912 * _916;
    float _938 = -_912;
    float _940 = _938 + 1.0;
    int _942 = ~_307;
    int _944 = _942 + 1;
    float _946 = -_928;
    float _948 = _946 + 1.0;
    int _950 = _934 >> 31;
    float _952 = _928 * _940;
    float _954 = fma(_632, _900, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _956 = fma(_686, _810, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    int _958 = _950 & 3;
    int _960 = _944 * int(_884);
    int _962 = _960 + _506;
    float _964 = _800 + 0.5;
    float _966 = _896 * _948;
    int _968 = _934 + _958;
    float _970 = _824 + (-0.5);
    float _972 = float(uint(_962));
    float _974 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[80].x, _724);
    int _976 = _968 >> 2;
    float _978 = _930 * _966;
    float _980 = -_896;
    float _982 = _980 + 1.0;
    float _984 = as_type<float>(_339) * _972;
    int _986 = _976 << 4;
    int _988 = _986 + 368;
    float _990 = -_732;
    float _992 = _990 + 1.0;
    float _994 = -_970;
    float _996 = -_552;
    float _998 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[80].y, _996);
    float _1000 = -_736;
    float _1002 = _1000 + 1.0;
    uint _1004 = uint(int(uint(_988) >> uint(2)));
    uint _1006 = uint(int(uint(int(_1004)) >> uint(2)));
    int _1008 = int(_1004) & 3;
    float _1010 = (*spvDescriptorSet0.vp_c9)._m0[int(_1006)][_1008];
    int _1012 = int(_1004) + 1;
    uint _1014 = uint(int(uint(_1012) >> uint(2)));
    int _1016 = _1012 & 3;
    float _1018 = (*spvDescriptorSet0.vp_c9)._m0[int(_1014)][_1016];
    float _1020 = trunc(_984);
    float _1022 = precise::max(_1020, 0.0);
    uint _1024 = uint(_1022);
    float _1026 = fma(_982, (*spvDescriptorSet0.vp_c9)._m0[115].x, _978);
    int _1028 = ~_826;
    int _1030 = _1028 + 1;
    int _1032 = _1030 + 1;
    float _1034 = -_992;
    float _1036 = fma(_800, _1034, _974);
    float _1038 = fma(_824, _1002, _998);
    int _1040 = _1032;
    if (!_806)
    {
        int _1042 = ~_826;
        int _1044 = _1042 + 1;
        _1040 = _1044;
    }
    int _1046 = _1040;
    float _1048 = fma(_954, _952, _1026);
    int _1050 = _934 & 3;
    bool _1052 = _1050 != 0;
    int _1054 = ~_872;
    int _1056 = _1054 + 1;
    int _1058 = _1056 + 1;
    out.m_64.x = _1036;
    out.m_64.y = _1038;
    int _1060 = _1058;
    if (!_878)
    {
        int _1062 = ~_872;
        int _1064 = _1062 + 1;
        _1060 = _1064;
    }
    int _1066 = _1060;
    float _1068 = fma(_956, _936, _1048);
    bool _1070 = uint(_1050) > 1u;
    bool _1072 = !_834;
    int _1074 = _1072 ? 0 : 1;
    float _1076 = fma(_866, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1068);
    int _1078 = _934 & 3;
    bool _1080 = _1078 != 0;
    int _1082 = ~_307;
    int _1084 = _1082 + 1;
    int _1086 = _988 + 8;
    uint _1088 = uint(int(uint(_1086) >> uint(2)));
    uint _1090 = uint(int(uint(int(_1088)) >> uint(2)));
    int _1092 = int(_1088) & 3;
    float _1094 = (*spvDescriptorSet0.vp_c9)._m0[int(_1090)][_1092];
    int _1096 = int(_1088) + 1;
    uint _1098 = uint(int(uint(_1096) >> uint(2)));
    int _1100 = _1096 & 3;
    float _1102 = (*spvDescriptorSet0.vp_c9)._m0[int(_1098)][_1100];
    bool _1104 = !_838;
    int _1106 = _1104 ? 0 : 1;
    int _1108 = int(_884) + int(_1024);
    int _1110 = _1080 ? 0 : 1;
    int _1112 = abs(_1074);
    int _1114 = abs(_1106);
    int _1116 = ~_1110;
    int _1118 = _1116 + 1;
    int _1120 = _1118 + 1;
    int _1122 = _1084 * _1108;
    int _1124 = _1122 + _506;
    int _1126 = _1120;
    if (!_1070)
    {
        int _1128 = ~_1110;
        int _1130 = _1128 + 1;
        _1126 = _1130;
    }
    int _1132 = _1126;
    float _1134 = float(_782);
    float _1136 = float(_1114);
    bool _1138 = uint(_1050) >= 2u;
    int _1140 = abs(_1132);
    float _1142 = _1136 * _1134;
    bool _1144 = _1050 != 3;
    int _1146 = _1138 ? 0 : 1;
    bool _1148 = uint(_1124) >= uint(_307);
    float _1150 = float(_1112);
    float _1152 = float(_1066);
    bool _1154 = !_1148;
    int _1156 = _1154 ? 0 : (-1);
    int _1158 = ~_1140;
    int _1160 = _1158 + 1;
    int _1162 = _1160 + 1;
    float _1164 = _1150 * _1152;
    bool _1166 = _1050 != 3;
    float _1168 = _802 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1170 = ~_1108;
    int _1172 = _1170 + _1156;
    int _1174 = _1172 + 1;
    float _1176 = _844 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1178 = ~_1146;
    int _1180 = _1178 + 1;
    int _1182 = _1180 + 1;
    int _1184 = _1162 * as_type<int>(_1018);
    float _1186 = _846 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1188 = _1182;
    if (_1144)
    {
        int _1190 = ~_1146;
        int _1192 = _1190 + 1;
        _1188 = _1192;
    }
    int _1194 = _1188;
    float _1196 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1198 = _1168 + _1196;
    bool _1200 = !_1052;
    int _1202 = _1200 ? 0 : 1;
    float _1204 = in.m_66.x;
    float _1206 = in.m_66.y;
    float _1208 = in.m_66.z;
    float _1210 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1212 = _1176 + _1210;
    float _1214 = _1198 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1216 = abs(_1202);
    int _1218 = _307 * _1174;
    int _1220 = _1218 + _506;
    bool _1222 = !_1166;
    int _1224 = _1222 ? 0 : (-1);
    float _1226 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1214);
    int _1228 = abs(_1194);
    float _1230 = _1164 * (-2.0);
    int _1232 = abs(_1224);
    float _1234 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1236 = _1186 + _1234;
    int _1238 = ~_1216;
    int _1240 = _1238 + 1;
    int _1242 = _1240 + 1;
    float _1244 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1226);
    int _1246 = _1242 * as_type<int>(_1010);
    int _1248 = _1246 + _1184;
    int _1250 = ~_1228;
    int _1252 = _1250 + 1;
    int _1254 = _1252 + 1;
    int _1256 = ~_1232;
    int _1258 = _1256 + 1;
    int _1260 = _1258 + 1;
    bool _1262 = !_522;
    int _1264 = _1262 ? 0 : 1;
    int _1266 = _1254 * as_type<int>(_1094);
    int _1268 = _1266 + _1248;
    bool _1270 = _1244 >= 0.0;
    float _1272 = fma(_1230, _1204, _1204);
    bool _1274 = !_438;
    int _1276 = _1274 ? _1220 : (-1);
    int _1278 = _1260 * as_type<int>(_1102);
    int _1280 = _1278 + _1268;
    float _1282 = _1198 * _1198;
    int _1284 = abs(_1264);
    float _1286 = _1142 * (-2.0);
    float _1288 = fma(_766, _1230, _766);
    float _1290 = fma(_1212, _1212, _1282);
    int _1292 = ~_1284;
    int _1294 = _1292 + 1;
    int _1296 = _1294 + 1;
    float _1298 = fma(_758, _1286, _758);
    float _1300 = fma(_1286, _1206, _1206);
    float _1302 = fma(_1236, _1236, _1290);
    int _1304 = _1280 * _1296;
    float _1306 = _1076 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1308 = rsqrt(_1302);
    int _1310 = _1276 * _1284;
    int _1312 = _1310 + _1304;
    float _1314 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    if (_1270)
    {
        _776 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1316 = _776;
    float _1318 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1320 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1322 = _524 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1324 = _301 + (-0.5);
    float _1326 = _1318 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1328 = _1314 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1330 = _1320 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1332 = as_type<int>(_1316);
    if (_1270)
    {
        float _1334 = _1316 * 5.0;
        _1332 = as_type<int>(_1334);
    }
    int _1336 = _1332;
    float _1338 = float(_1312);
    float _1340 = _1322 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1342 = fma(_1324, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1272);
    bool _1344 = !_842;
    int _1346 = _1344 ? 0 : 1;
    out.m_68.x = _1326;
    out.m_68.y = _1328;
    out.m_68.z = _1330;
    out.m_68.w = _1306;
    float _1348 = _1340 * _1308;
    float _1350 = fma(_1288, _740, _1342);
    float _1352 = _303 + (-0.5);
    if (_1270)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4734 = as_type<float>(_1336);
        out.gl_Position.z = _4734;
    }
    float _1354 = _1198 * _1348;
    out.m_70.x = _1338;
    if (_1270)
    {
        out.m_53.x = 0.0;
    }
    int _1356 = abs(_1346);
    float _1358 = _1212 * _1348;
    if (_1270)
    {
        return out;
    }
    float _1360 = -_1354;
    float _1362 = _1168 + _1360;
    float _1364 = _1236 * _1348;
    float _1366 = -_1358;
    float _1368 = _1176 + _1366;
    float _1370 = -_1354;
    float _1372 = _1198 + _1370;
    float _1374 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1376 = _1362 + _1374;
    float _1378 = -_1364;
    float _1380 = _1186 + _1378;
    float _1382 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1384 = _1368 + _1382;
    float _1386 = float(_1046);
    float _1388 = _1376 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1390 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1392 = _1380 + _1390;
    float _1394 = float(_1356);
    float _1396 = fma(_1352, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1300);
    float _1398 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1388);
    float _1400 = -_1358;
    float _1402 = _1212 + _1400;
    float _1404 = _1372 * _1372;
    float _1406 = fma(_1298, _740, _1396);
    float _1408 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1398);
    float _1410 = _666 + _301;
    float _1412 = fma(_1402, _1402, _1404);
    float _1414 = -_1364;
    float _1416 = _1236 + _1414;
    float _1418 = _1394 * _1386;
    bool _1420 = _1408 >= 0.0;
    float _1422 = _1406 * 0.15915493667125701904296875;
    float _1424 = _1410 + (-1.0);
    float _1426 = fma(_1416, _1416, _1412);
    float _1428 = _1418 * (-2.0);
    float _1430 = _1350 * 0.15915493667125701904296875;
    float _1432 = fma(_1424, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1434 = _1422 * 6.283185482025146484375;
    float _1436 = sin(_1434);
    float _1438 = fma(_1428, _1208, _1208);
    float _1440 = _666 + (-0.5);
    float _1442 = fma(_1432, _1428, _1432);
    float _1444 = _1416;
    int _1446 = as_type<int>(_1438);
    float _1448 = _1364;
    float _1450 = _1384;
    if (_1420)
    {
        _1444 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1452 = _1444;
    float _1454 = fma(_1440, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1438);
    float _1456 = _1430 * 6.283185482025146484375;
    float _1458 = sin(_1456);
    if (_1420)
    {
        out.m_53.x = 0.0;
    }
    if (_1420)
    {
        float _1460 = _1452 * 5.0;
        _1446 = as_type<int>(_1460);
    }
    int _1462 = _1446;
    float _1464 = fma(_1442, _740, _1454);
    if (_1420)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4922 = as_type<float>(_1462);
        out.gl_Position.z = _4922;
    }
    float _1466 = _1430 * 6.283185482025146484375;
    float _1468 = cos(_1466);
    float _1470 = _1464 * 0.15915493667125701904296875;
    float _1472 = sqrt(_1426);
    float _1474 = _1422 * 6.283185482025146484375;
    float _1476 = cos(_1474);
    if (_1420)
    {
        return out;
    }
    float _1478 = _1470 * 6.283185482025146484375;
    float _1480 = cos(_1478);
    float _1482 = _275 * _458;
    float _1484 = _1308 * _1472;
    float _1486 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _177);
    float _1488 = _1468 * _1476;
    float _1490 = _1482 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1492 = _1322 * _1484;
    float _1494 = _1468 * _1436;
    float _1496 = _1470 * 6.283185482025146484375;
    float _1498 = sin(_1496);
    float _1500 = _1490 * _1484;
    float _1502 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _173);
    bool _1504 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1506 = isnan(0.5);
    bool _1508 = _1504 || _1506;
    bool _1510 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1512 = _1508 || _1510;
    float _1514 = _1486 * _1500;
    float _1516 = _1458 * _1436;
    float _1518 = _1458 * _1476;
    float _1520 = _1468 * _1480;
    float _1522 = _1502 * _1492;
    float _1524 = _1476 * _1480;
    float _1526 = _1458 * _1480;
    float _1528 = _1520 * _1514;
    float _1530 = _1484 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1532 = _1530 * 0.5;
    float _1534 = _1436 * _1480;
    bool _1536 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1538 = isnan(0.5);
    bool _1540 = _1536 || _1538;
    bool _1542 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1544 = _1540 || _1542;
    float _1546 = fma(_1498, _1488, _1516);
    float _1548 = -_1518;
    float _1550 = fma(_1498, _1494, _1548);
    float _1552 = -_1514;
    float _1554 = _1498 * _1552;
    float _1556 = -_1494;
    float _1558 = fma(_1498, _1518, _1556);
    float _1560 = fma(_1546, _1522, _1528);
    float _1562 = _1526 * _1514;
    float _1564 = fma(_1524, _1522, _1554);
    float _1566 = fma(_1498, _1516, _1488);
    float _1568 = fma(_1550, _1532, _1560);
    float _1570 = fma(_1558, _1522, _1562);
    float _1572 = fma(_1534, _1532, _1564);
    float _1574 = _1568 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1576 = fma(_1566, _1532, _1570);
    float _1578 = _1568 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1580 = fma(_1572, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1574);
    float _1582 = _1362 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1584 = fma(_1572, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1578);
    float _1586 = fma(_1576, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1580);
    float _1588 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1582);
    float _1590 = fma(_1576, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1584);
    float _1592 = _1362 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1594 = _1586 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1596 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1588);
    float _1598 = _1590 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1600 = _1186 + _1594;
    float _1602 = _1596 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1604 = _1176 + _1598;
    float _1606 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1592);
    float _1608 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1610 = _1600 + _1608;
    float _1612 = 1.0 / _1602;
    float _1614 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1616 = _1604 + _1614;
    float _1618 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1606);
    float _1620 = _1610 * _1610;
    float _1622 = _1568 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1624 = _1618 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1626 = fma(_1616, _1616, _1620);
    float _1628 = fma(_1572, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1622);
    float _1630 = _1624 + _1602;
    float _1632 = sqrt(_1626);
    float _1634 = fma(_1576, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1628);
    float _1636 = _1630 * _1612;
    float _1638 = _1636 * 0.5;
    float _1640 = _1634 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1642 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1644 = fma(_1638, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1642);
    float _1646 = _1168 + _1640;
    float _1648 = 1.0 / _1644;
    bool _1650 = _1632 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1652 = _1622;
    float _1654 = _1638;
    float _1656 = _1640;
    if (!_1650)
    {
        _1652 = _1604;
    }
    float _1658 = _1652;
    float _1660 = _1658;
    if (!_1650)
    {
        _1654 = _1600;
    }
    float _1662 = _1654;
    float _1664 = _1662;
    if (!_1650)
    {
        _1656 = _1646;
    }
    float _1666 = _1656;
    bool _1668 = !_1650;
    float _1670 = _1666;
    if (!_1668)
    {
        float _1672 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1674 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1676 = _1632 + _1674;
        float _1678 = _1646 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1680 = rsqrt(_1626);
        float _1682 = _1676 * _1672;
        float _1684 = _1682 * 0.15915493667125701904296875;
        float _1686 = _1684 * 6.283185482025146484375;
        float _1688 = cos(_1686);
        float _1690 = _1684 * 6.283185482025146484375;
        float _1692 = sin(_1690);
        float _1694 = _1688 + (-1.0);
        float _1696 = _1694 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1698 = fma(_1692, _1678, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1700 = fma(_1646, _1688, _1696);
        float _1702 = _1680 * _1698;
        float _1704 = fma(_1616, _1702, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1706 = fma(_1610, _1702, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1670 = _1700;
        _1664 = _1706;
        _1660 = _1704;
    }
    float _1708 = _1670;
    float _1710 = _1664;
    float _1712 = _1660;
    float _1714 = -_1354;
    float _1716 = _1714 + _1708;
    float _1718 = -_1364;
    float _1720 = _1718 + _1710;
    float _1722 = -_1358;
    float _1724 = _1722 + _1712;
    float _1726 = _1716;
    float _1728 = _1724;
    float _1730 = _1720;
    float _1732 = _1710;
    if (_1544)
    {
        _1448 = 1.0;
    }
    float _1734 = _1448;
    float _1736 = _1734;
    if (!_1512)
    {
        float _1738 = _1376 * _1376;
        float _1740 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1742 = -_1186;
        float _1744 = _1742 + _1710;
        float _1746 = -_1168;
        float _1748 = _1746 + _1708;
        float _1750 = fma(_1384, _1384, _1738);
        float _1752 = -_1176;
        float _1754 = _1752 + _1712;
        float _1756 = fma(_1392, _1392, _1750);
        float _1758 = 1.0 / _1484;
        float _1760 = sqrt(_1756);
        float _1762 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1764 = precise::min(_1760, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1766 = _1764 * _1740;
        float _1768 = _1762 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1770 = _1766 * _1758;
        float _1772 = _1768 * _1770;
        float _1774 = _1744 * _1770;
        float _1776 = fma(_1748, _1772, _1362);
        float _1778 = fma(_1754, _1772, _1368);
        float _1780 = fma(_1768, _1774, _1380);
        _1450 = _1760;
        _1726 = _1776;
        _1728 = _1778;
        _1730 = _1780;
    }
    float _1782 = _1450;
    float _1784 = _1726;
    float _1786 = _1728;
    float _1788 = _1730;
    float _1790 = _1782;
    if (_1544)
    {
        _1732 = 1.0;
    }
    float _1792 = _1732;
    float _1794 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1796 = _1648 * _1794;
    float _1798 = _1792;
    if (!_1544)
    {
        float _1800 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1802 = _1800 * 0.15915493667125701904296875;
        float _1804 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1806 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1808 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1806;
        float _1810 = _1802 * 6.283185482025146484375;
        float _1812 = cos(_1810);
        float _1814 = _1804 * 0.15915493667125701904296875;
        float _1816 = _1802 * 6.283185482025146484375;
        float _1818 = sin(_1816);
        float _1820 = 1.0 / _1812;
        float _1822 = _1814 * 6.283185482025146484375;
        float _1824 = cos(_1822);
        float _1826 = _1818 * _1820;
        float _1828 = _1814 * 6.283185482025146484375;
        float _1830 = sin(_1828);
        float _1832 = _1824 * _1826;
        float _1834 = 1.0 / _1808;
        float _1836 = 1.0 / _1832;
        float _1838 = _1830 * _1836;
        float _1840 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1842 = fma(_1796, _1838, _1840);
        float _1844 = _1842 * _1834;
        float _1846 = precise::clamp(_1844, 0.0, 1.0);
        _1790 = _1826;
        _1736 = _1846;
    }
    float _1848 = _1790;
    float _1850 = _1736;
    float _1852 = _1848;
    if (!_1544)
    {
        float _1854 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1856 = _1854 * 0.15915493667125701904296875;
        float _1858 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1860 = _1856 * 6.283185482025146484375;
        float _1862 = cos(_1860);
        float _1864 = _1858 * 0.15915493667125701904296875;
        float _1866 = _1856 * 6.283185482025146484375;
        float _1868 = sin(_1866);
        float _1870 = 1.0 / _1862;
        float _1872 = _1864 * 6.283185482025146484375;
        float _1874 = cos(_1872);
        float _1876 = _1868 * _1870;
        float _1878 = _1864 * 6.283185482025146484375;
        float _1880 = sin(_1878);
        float _1882 = _1874 * _1876;
        float _1884 = 1.0 / _1882;
        float _1886 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1888 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1886;
        float _1890 = 1.0 / _1888;
        float _1892 = _1880 * _1884;
        float _1894 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1896 = fma(_1796, _1892, _1894);
        float _1898 = _1896 * _1890;
        float _1900 = precise::clamp(_1898, 0.0, 1.0);
        float _1902 = -_1900;
        float _1904 = _1902 + 1.0;
        _1852 = _1870;
        _1798 = _1904;
    }
    float _1906 = _1852;
    float _1908 = _1798;
    float _1910 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1912 = _1784 + _1910;
    float _1914 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1916 = _1786 + _1914;
    float _1918 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1920 = _1788 + _1918;
    float _1922 = _1784 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1924 = _1912 * _1912;
    float _1926 = fma(_1916, _1916, _1924);
    float _1928 = fma(_1920, _1920, _1926);
    float _1930 = rsqrt(_1928);
    float _1932 = sqrt(_1928);
    float _1934 = _1930 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1936 = _1916 * _1934;
    float _1938 = _1920 * _1934;
    float _1940 = _1936 * _1936;
    float _1942 = _1938 * _1938;
    float _1944 = _1940 + _1942;
    float _1946 = sqrt(_1944);
    bool _1948 = _1946 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1950 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1952 = _1946 + _1950;
    float _1954 = _1920;
    float _1956 = _1930;
    float _1958 = _1952;
    float _1960 = _1906;
    if (_1948)
    {
        float _1962 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1954 = _1962;
    }
    float _1964 = _1954;
    if (_1948)
    {
        float _1966 = rsqrt(_1944);
        _1956 = _1966;
    }
    float _1968 = _1956;
    float _1970 = _1968;
    if (_1948)
    {
        float _1972 = _1952 * _1964;
        _1958 = _1972;
    }
    float _1974 = _1958;
    if (_1948)
    {
        float _1976 = _1974 * 0.15915493667125701904296875;
        _1960 = _1976;
    }
    float _1978 = _1960;
    float _1980 = _1964;
    float _1982 = _1978;
    if (_1948)
    {
        float _1984 = _1978 * 6.283185482025146484375;
        float _1986 = sin(_1984);
        _1980 = _1986;
    }
    float _1988 = _1980;
    float _1990 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1992 = precise::max(0.0, _1990);
    float _1994 = _1924;
    float _1996 = _1992;
    if (_1948)
    {
        float _1998 = _1978 * 6.283185482025146484375;
        float _2000 = cos(_1998);
        _1994 = _2000;
    }
    float _2002 = _1994;
    float _2004 = -_1934;
    float _2006 = -_1992;
    float _2008 = fma(_1912, _2004, _2006);
    float _2010 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    float _2012 = _2008;
    if (_1948)
    {
        float _2014 = _2008 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1996 = _2014;
    }
    float _2016 = _1996;
    float _2018 = _2016;
    if (!_1948)
    {
        _1982 = _1940;
    }
    float _2020 = _1982;
    float _2022 = fma(_1368, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2024 = _1988;
    float _2026 = _2020;
    if (_1948)
    {
        float _2028 = fma(_1988, _2016, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2024 = _2028;
    }
    float _2030 = _2024;
    float _2032 = _2030;
    float _2034 = _2002;
    if (_1948)
    {
        float _2036 = _2002 + (-1.0);
        _2018 = _2036;
    }
    float _2038 = _2018;
    float _2040 = _2038;
    if (_1948)
    {
        float _2042 = _1968 * _2030;
        _2010 = _2042;
    }
    float _2044 = _2010;
    if (!_1948)
    {
        _1970 = _1936;
    }
    float _2046 = _1970;
    float _2048 = fma(_1380, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2050 = _2046;
    if (_1948)
    {
        float _2052 = _2038 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2040 = _2052;
    }
    float _2054 = _2040;
    if (_1948)
    {
        float _2056 = _1936 * _2044;
        _2050 = _2056;
    }
    float _2058 = _2050;
    if (!_1948)
    {
        _2032 = _1938;
    }
    float _2060 = _2032;
    float _2062 = _2060;
    if (_1948)
    {
        float _2064 = _1938 * _2044;
        _2062 = _2064;
    }
    float _2066 = _2062;
    if (_1948)
    {
        float _2068 = fma(_2008, _2002, _2054);
        _2012 = _2068;
    }
    float _2070 = _2012;
    if (_1948)
    {
        float _2072 = _2058 * _2058;
        _2026 = _2072;
    }
    float _2074 = _2026;
    if (!_1948)
    {
        _2034 = _1942;
    }
    float _2076 = _2034;
    float _2078 = _2076;
    if (_1948)
    {
        float _2080 = _2066 * _2066;
        _2078 = _2080;
    }
    float _2082 = _2078;
    float _2084 = fma(_2070, _2070, _2074);
    float _2086 = _1784 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2088 = floor(_2022);
    float _2090 = _2084 + _2082;
    float _2092 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2086);
    float _2094 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2096 = fma(_1932, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2094);
    float _2098 = precise::clamp(_2096, 0.0, 1.0);
    float _2100 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1922);
    float _2102 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2092);
    float _2104 = -_2098;
    float _2106 = _2104 + 1.0;
    float _2108 = rsqrt(_2090);
    float _2110 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2112 = _2102 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2114 = _1784 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2116 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2100);
    float _2118 = _2112 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2120 = abs(_2106);
    float _2122 = log2(_2120);
    float _2124 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2114);
    float _2126 = -_2118;
    float _2128 = fma(_2126, _2110, 1.0);
    float _2130 = _1784 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2132 = _2116 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2134 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2124);
    float _2136 = -_2088;
    float _2138 = _2022 + _2136;
    float _2140 = _2108 * _2058;
    float _2142 = _2108 * _2066;
    float _2144 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2130);
    float _2146 = _2108 * _2070;
    float _2148 = _2140 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2150 = _2134 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2152 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2144);
    float _2154 = floor(_2048);
    float _2156 = -_2148;
    float _2158 = fma(_2146, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2156);
    float _2160 = _2150 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2162 = _2152 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2164 = _2122 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2166 = -_2142;
    float _2168 = fma(_2166, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2158);
    float _2170 = _2150 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2172 = fma(_2162, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2160);
    float _2174 = exp2(_2164);
    float _2176 = fma(_2168, -0.5, 0.5);
    float _2178 = _2150 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2180 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2172);
    float _2182 = fma(_2162, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2170);
    float _2184 = _2146 + 1.0;
    float _2186 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2180);
    float _2188 = sqrt(_2176);
    float _2190 = -_2154;
    float _2192 = _2048 + _2190;
    float _2194 = fma(_2162, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2178);
    float _2196 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2182);
    float _2198 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2194);
    float _2200 = 1.0 / _2186;
    float _2202 = log2(_2128);
    float _2204 = _2188 * 0.636619746685028076171875;
    float _2206 = fma(_2168, 0.5, 0.5);
    float _2208 = -_2146;
    float _2210 = fma(_2174, _2184, _2208);
    float _2212 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2196);
    float _2214 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2198);
    float _2216 = fma(_2206, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float2 _6105 = float2(_2138, _2192);
    float _2218 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6105, float2(0.0), isnan(_6105)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6105, float2(0.0), isnan(_6105)), level(0.0)).x;
    float _2220 = _2212 * _2200;
    float _2222 = _2202 * 0.693147182464599609375;
    float _2224 = fma(_2206, _2216, -0.212114393711090087890625);
    float _2226 = _2214 * _2200;
    float _2228 = fma(_2210, 0.5, 0.5);
    float _2230 = _2222 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2232 = fma(_2206, _2224, 1.570728778839111328125);
    float _2234 = fma(_2226, -0.5, 0.5);
    float _2236 = -_2232;
    float _2238 = fma(_2204, _2236, 1.0);
    float _2240 = fma(_2220, 0.5, 0.5);
    float3 _6148 = float3(_2240, _2234, _2230);
    float _2242 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6148, float3(0.0), isnan(_6148)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6148, float3(0.0), isnan(_6148)), level(0.0)).x;
    float3 _6159 = float3(_2240, _2234, _2230);
    float4 _2245 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6159, float3(0.0), isnan(_6159)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6159, float3(0.0), isnan(_6159)), level(0.0)).xyzw;
    float _2247 = _2245.x;
    float _2249 = _2245.y;
    float _2251 = _2245.z;
    float _2253 = _2245.w;
    float2 _6175 = float2(_2238, _2228);
    float3 _2257 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6175, float2(0.0), isnan(_6175)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6175, float2(0.0), isnan(_6175)), level(0.0)).xyz;
    float _2259 = _2257.x;
    float _2261 = _2257.y;
    float _2263 = _2257.z;
    float _2265 = abs(_1796);
    float _2267 = log2(_2265);
    float _2269 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2271 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2273 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2275 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2269);
    float _2277 = _1520 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2279 = _2150 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2281 = _177 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2283 = _173 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2285 = _1932 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2287 = isnan(_1932);
    bool _2289 = _2285 || _2287;
    bool _2291 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2293 = _2289 || _2291;
    float _2295 = _2267 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2297 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2271);
    float _2299 = _1520 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2301 = _1520 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2303 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2273);
    float _2305 = -_1498;
    float _2307 = fma(_2305, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2277);
    float _2309 = exp2(_2295);
    float _2311 = _1550 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2313 = _1550 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2315 = _1550 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2317 = -_1498;
    float _2319 = fma(_2317, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2299);
    float _2321 = -_1498;
    float _2323 = fma(_2321, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2301);
    float _2325 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2311);
    float _2327 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2313);
    float _2329 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2315);
    float _2331 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2307);
    float _2333 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2319);
    float _2335 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2323);
    float _2337 = fma(_2162, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2279);
    float _2339 = _2122 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2341 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2275);
    float _2343 = fma(_2309, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2345 = precise::clamp(_2343, 0.0, 1.0);
    float _2347 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2337);
    float _2349 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2297);
    float _2351 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2303);
    float _2353 = fma(_2345, -2.0, 3.0);
    float _2355 = _2345 * _2345;
    float _2357 = exp2(_2339);
    float _2359 = in.m_72.x;
    float _2361 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2325);
    float _2363 = _2355 * _2353;
    float _2365 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2327);
    float _2367 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2329);
    float _2369 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2347);
    float _2371 = -_2363;
    float _2373 = _2371 + 1.0;
    bool _2375 = _1796 <= 8000.0;
    bool _2377 = isnan(_1796);
    bool _2379 = _2375 || _2377;
    bool _2381 = isnan(8000.0);
    bool _2383 = _2379 || _2381;
    float _2385 = float(_2383);
    float _2387 = _2281 * _2331;
    float _2389 = _2281 * _2333;
    float _2391 = fma(_2373, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2363);
    float _2393 = _2281 * _2335;
    float _2395 = fma(_2283, _2341, _2387);
    float _2397 = _2369 + _2186;
    float _2399 = _2385 * _2391;
    float _2401 = -_2357;
    float _2403 = _2401 + 1.0;
    float _2405 = _2212 + _2186;
    float _2407 = _2186 * 0.5;
    float _2409 = _2399 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2411 = fma(_2283, _2351, _2393);
    float _2413 = _2403 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2415 = _2397 * 0.5;
    float _2417 = _2405 * 0.5;
    float _2419 = fma(_2214, -0.5, _2407);
    out.gl_Position.x = _2212;
    out.gl_Position.y = _2214;
    out.gl_Position.z = _2369;
    out.gl_Position.w = _2186;
    float _2421 = fma(_2283, _2349, _2389);
    float _2423 = _2361 + _2395;
    float _2425 = _2367 + _2411;
    out.m_74.x = _2417;
    out.m_74.y = _2419;
    out.m_74.z = _2415;
    out.m_74.w = _2186;
    float _2427 = _2365 + _2421;
    float _2429 = _2283;
    if (!_2293)
    {
        _2429 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2431 = _2429;
    out.m_76.x = _2423;
    out.m_76.y = _2427;
    out.m_76.z = _2425;
    float _2433 = -_2413;
    float _2435 = _2433 + 1.0;
    float _2437 = -_2218;
    float _2439 = _2437 + 1.0;
    float _2441 = _2439 * _2409;
    float _2443 = precise::clamp(_2441, 0.0, 1.0);
    float _2445 = -_2443;
    float _2447 = fma(_2445, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2449 = _2447 * _2359;
    float _2451 = _2413 * _2242;
    float _2453 = _2449 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2455 = _2253 * _2435;
    float _2457 = _1850 * _1908;
    float _2459 = _2253 * _2451;
    float _2461 = _2263 * _2451;
    out.m_78.x = _2453;
    float _2463 = fma(_2259, _2459, _2247);
    float _2465 = fma(_2261, _2459, _2249);
    float _2467 = fma(_2253, _2461, _2251);
    float _2469 = _2457 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2471 = _2249;
    float _2473 = _2259;
    float _2475 = _2251;
    float _2477 = _2247;
    float _2479 = _2457;
    float _2481 = _2431;
    float _2483 = _2431;
    if (!_2293)
    {
        _2471 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2485 = _2471;
    float _2487 = _2485;
    float _2489 = _2485;
    if (!_2293)
    {
        _2473 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2491 = _2473;
    out.m_80.x = _2463;
    out.m_80.y = _2465;
    out.m_80.z = _2467;
    out.m_80.w = _2455;
    float _2493 = _2491;
    float _2495 = _2491;
    if (!_2293)
    {
        _2475 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2497 = _2475;
    float _2499 = _2497;
    float _2501 = _2497;
    if (!_2293)
    {
        _2477 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2503 = _2477;
    float _2505 = _2503;
    float _2507 = _2503;
    if (!_2293)
    {
        _2479 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2509 = _2479;
    bool _2511 = !_2293;
    float _2513 = _2509;
    float _2515 = _2509;
    if (!_2511)
    {
        bool _2517 = _1932 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2519 = isnan(_1932);
        bool _2521 = _2517 || _2519;
        bool _2523 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2525 = _2521 || _2523;
        if (!_2525)
        {
            float _2527 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2529 = _1932 + _2527;
            float _2531 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2533 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2531;
            float _2535 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2537 = _2535 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2539 = 1.0 / _2533;
            float _2541 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2543 = _2541 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2545 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2547 = _2545 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2549 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2551 = _2549 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2553 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2555 = _2553 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2557 = _2529 * _2539;
            float _2559 = precise::clamp(_2557, 0.0, 1.0);
            float _2561 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2563 = _2561 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2565 = fma(_2559, _2537, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2567 = fma(_2559, _2543, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2569 = fma(_2559, _2563, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2571 = fma(_2559, _2547, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2573 = fma(_2559, _2551, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2575 = fma(_2559, _2555, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2495 = _2569;
            _2483 = _2573;
            _2489 = _2567;
            _2507 = _2565;
            _2501 = _2571;
            _2515 = _2575;
            _2577 = true;
        }
        else
        {
            bool _2579 = _1932 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2581 = isnan(_1932);
            bool _2583 = _2579 || _2581;
            bool _2585 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2587 = _2583 || _2585;
            if (!_2587)
            {
                _2487 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2589 = _2487;
            _2489 = _2589;
            if (!_2587)
            {
                _2493 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2591 = _2493;
            _2495 = _2591;
            if (!_2587)
            {
                _2499 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2593 = _2499;
            _2501 = _2593;
            if (!_2587)
            {
                _2505 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2595 = _2505;
            _2507 = _2595;
            if (!_2587)
            {
                _2481 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2597 = _2481;
            _2483 = _2597;
            if (!_2587)
            {
                _2513 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2599 = _2513;
            bool _2601 = !_2587;
            _2515 = _2599;
            if (!_2601)
            {
                bool _2603 = _1932 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2605 = isnan(_1932);
                bool _2607 = _2603 || _2605;
                bool _2609 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2611 = _2607 || _2609;
                if (!_2611)
                {
                    float _2613 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2615 = _1932 + _2613;
                    float _2617 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2619 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2617;
                    float _2621 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2623 = _2621 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2625 = 1.0 / _2619;
                    float _2627 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2629 = _2627 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2631 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2633 = _2631 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2635 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2637 = _2635 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2639 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2641 = _2639 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2643 = _2615 * _2625;
                    float _2645 = precise::clamp(_2643, 0.0, 1.0);
                    float _2647 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2649 = _2647 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2651 = fma(_2645, _2623, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2653 = fma(_2645, _2629, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2655 = fma(_2645, _2649, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2657 = fma(_2645, _2633, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2659 = fma(_2645, _2637, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2661 = fma(_2645, _2641, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2495 = _2655;
                    _2483 = _2659;
                    _2489 = _2653;
                    _2507 = _2651;
                    _2501 = _2657;
                    _2515 = _2661;
                    _2577 = true;
                }
                else
                {
                    _2495 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2483 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2489 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2507 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2501 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2515 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2577 = false;
    float _2663 = _2495;
    float _2665 = _2483;
    float _2667 = _2489;
    float _2669 = _2507;
    float _2671 = _2501;
    float _2673 = _2515;
    float _2675 = fma(_2427, -0.5, 0.5);
    float _2677 = precise::clamp(_2675, 0.0, 1.0);
    float _2679 = -_2663;
    float _2681 = _2679 + _2665;
    float _2683 = _2469 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2685 = -_2667;
    float _2687 = _2685 + _2669;
    float _2689 = fma(_2677, _2681, _2663);
    out.m_82.x = 0.0;
    float _2691 = -_2671;
    float _2693 = _2691 + _2673;
    float _2695 = fma(_2677, _2687, _2667);
    float _2697 = _2689 * 0.586610972881317138671875;
    out.m_53.x = _2683;
    bool _2699 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2701 = fma(_2677, _2693, _2671);
    float _2703 = fma(_2695, 0.298911988735198974609375, _2697);
    bool _2705 = _1850 > 0.0;
    bool _2707 = isnan(_1850);
    bool _2709 = _2705 || _2707;
    bool _2711 = isnan(0.0);
    bool _2713 = _2709 || _2711;
    float _2715 = fma(_2701, 0.114477999508380889892578125, _2703);
    bool _2717 = _1908 <= 0.0;
    bool _2719 = !_2713;
    bool _2721 = _2717 || _2719;
    float _2723 = -_2715;
    float _2725 = _2695 + _2723;
    float _2727 = -_2715;
    float _2729 = _2689 + _2727;
    float _2731 = -_2715;
    float _2733 = _2701 + _2731;
    float _2735 = fma(_2725, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2715);
    float _2737 = fma(_2729, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2715);
    float _2739 = fma(_2733, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2715);
    bool _2741 = !_2699;
    if (!_2741)
    {
        float _2743 = -_1784;
        float _2745 = _2743 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2747 = -_1786;
        float _2749 = _2747 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2751 = -_1788;
        float _2753 = _2751 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2755 = _2745 * _2745;
        float _2757 = fma(_2749, _2749, _2755);
        float _2759 = fma(_2753, _2753, _2757);
        float _2761 = sqrt(_2759);
        float _2763 = rsqrt(_2759);
        float _2765 = -_2761;
        float _2767 = _2765 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2769 = _2767 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2771 = precise::clamp(_2769, 0.0, 1.0);
        float _2773 = _2749 * _2763;
        float _2775 = _2745 * _2763;
        float _2777 = abs(_2771);
        float _2779 = log2(_2777);
        float _2781 = _2753 * _2763;
        float _2783 = _2773 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2785 = _2427 * _2775;
        float _2787 = -_2775;
        float _2789 = -_2783;
        float _2791 = fma(_2787, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2789);
        float _2793 = fma(_2423, _2773, _2785);
        float _2795 = -_2781;
        float _2797 = fma(_2795, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2791);
        float _2799 = fma(_2425, _2781, _2793);
        float _2801 = precise::clamp(_2799, 0.0, 1.0);
        float _2803 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2805 = _2797 + _2803;
        float _2807 = _2779 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2809 = _2805 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2811 = precise::clamp(_2809, 0.0, 1.0);
        float _2813 = exp2(_2807);
        float _2815 = _2813 * _2811;
        float _2817 = _2801 * _2815;
        float _2819 = _2817 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2821 = _2817 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2823 = _2817 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_82.x = _2819;
        out.m_82.y = _2821;
        out.m_82.z = _2823;
    }
    out.m_84.x = _2735;
    out.m_84.y = _2737;
    out.m_84.z = _2739;
    if (!_2721)
    {
        return out;
    }
    float _2825 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_53.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2825;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint dm_vid = gl_VertexIndex;
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2577 = false;
    bool _201 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _98 = in.m_46.w;
    float _100 = in.m_48.w;
    float _102 = trunc(_98);
    int _105 = int(_102);
    float _107 = -_100;
    float _109 = _107 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _109;
    bool _113 = _105 >= 1;
    float _115 = 0.0;
    float _117 = as_type<float>(_105);
    float _119 = _109;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _115;
    if (!_113)
    {
        out.m_53.x = 0.0;
    }
    int _123 = 0;
    if (!_113)
    {
        float _125 = _121 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2894 = as_type<float>(_127);
        out.gl_Position.z = _2894;
    }
    if (!_113)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _131 = _100 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_100);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = float(_105);
    bool _143 = _109 >= _141;
    bool _145 = !_139;
    bool _147 = _143 || _145;
    if (_147)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _149 = _117;
    if (_147)
    {
        out.m_53.x = 0.0;
    }
    if (_147)
    {
        float _151 = _149 * 5.0;
        _129 = as_type<int>(_151);
    }
    int _153 = _129;
    if (_147)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2949 = as_type<float>(_153);
        out.gl_Position.z = _2949;
    }
    if (_147)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _155 = as_type<float>(int(gl_VertexIndex));
    float _157 = 1.0 / _141;
    bool _159 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _161 = _109 * _157;
    int _163 = as_type<int>(_155) & 1;
    bool _165 = _163 != 0;
    int _167 = as_type<int>(_155) & 2;
    bool _169 = _167 != 0;
    bool _171 = !_165;
    float _173 = _171 ? (-0.5) : 0.5;
    bool _175 = !_169;
    float _177 = _175 ? (-0.5) : 0.5;
    bool _179 = !_159;
    float _181 = _161;
    float _199;
    if (!_179)
    {
        float _183 = in.m_58.x;
        float _185 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _187 = _183 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _189 = fma(_187, (*spvDescriptorSet0.vp_c9)._m0[12].x, _109);
        float _191 = _189 * _185;
        float _193 = floor(_191);
        float _195 = -_193;
        float _197 = _191 + _195;
        _199 = _197;
        _201 = true;
    }
    else
    {
        _199 = _161;
    }
    _201 = false;
    float _203 = _199;
    float _205 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _207 = _203 + _205;
    bool _209 = _203 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _211 = isnan(_203);
    bool _213 = _209 || _211;
    bool _215 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _217 = _213 || _215;
    float _219 = float(_217);
    float _221 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _223 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _221;
    float _225 = -_219;
    float _227 = _225 + 1.0;
    bool _229 = _203 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _231 = isnan(_203);
    bool _233 = _229 || _231;
    bool _235 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _237 = _233 || _235;
    float _239 = float(_237);
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _243 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _241;
    bool _245 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _247 = 1.0 / _223;
    float _249 = _239 * _227;
    float _251 = -_239;
    float _253 = _251 + 1.0;
    float _255 = _207 * _247;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _257;
    float _261 = fma(_243, _255, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _263 = fma(_259, _255, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _265 = _261 * _249;
    float _267 = _263 * _249;
    float _269 = fma(_253, (*spvDescriptorSet0.vp_c9)._m0[143].x, _265);
    float _271 = fma(_253, (*spvDescriptorSet0.vp_c9)._m0[143].y, _267);
    float _273 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[144].x, _269);
    float _275 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[144].y, _271);
    bool _277 = !_245;
    if (!_277)
    {
        float _279 = in.m_58.x;
        float _281 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _283 = _279 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _285 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[11].y, _109);
        float _287 = _285 * _281;
        float _289 = floor(_287);
        float _291 = -_289;
        float _293 = _287 + _291;
        _181 = _293;
    }
    float _295 = _181;
    float _297 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _299 = int(_297);
    float _301 = in.m_58.x;
    float _303 = in.m_58.y;
    float _305 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _307 = int(_305);
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _313 = float(_299);
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _315;
    float _319 = 1.0 / _313;
    float _321 = float(uint(_307));
    int _323 = ~_307;
    int _325 = _323 + 1;
    float _327 = 1.0 / _321;
    int _329 = ~_307;
    int _331 = _329 + 1;
    float _333 = _319 * _109;
    float _335 = trunc(_333);
    int _337 = int(_335);
    int _339 = as_type<int>(_327) + (-2);
    int _341 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _343 = _341 != 0;
    float _345 = float(uint(_337));
    float _347 = float(_337);
    float _349 = as_type<float>(_339) * _345;
    float _351 = trunc(_349);
    float _353 = precise::max(_351, 0.0);
    uint _356 = uint(_353);
    int _358 = _331 * int(_356);
    int _360 = _358 + _337;
    float _362 = float(uint(_360));
    float _364 = as_type<float>(_339) * _362;
    bool _366 = !_343;
    float _368 = _366 ? 7.345489978790283203125 : 1.0;
    float _370 = trunc(_364);
    float _372 = precise::max(_370, 0.0);
    uint _374 = uint(_372);
    float _376 = _368 * _301;
    float _378 = floor(_376);
    int _380 = int(_356) + int(_374);
    float _382 = float(_307);
    int _384 = _325 * _380;
    int _386 = _384 + _337;
    bool _388 = _347 >= _382;
    bool _390 = isnan(_347);
    bool _392 = _388 || _390;
    bool _394 = isnan(_382);
    bool _396 = _392 || _394;
    float _398 = float(_396);
    float _400 = _382 * _109;
    float _402 = -_378;
    float _404 = _376 + _402;
    bool _406 = uint(_386) >= uint(_307);
    float _408 = _400 * _157;
    float _410 = trunc(_398);
    int _412 = int(_410);
    float _414 = _404 * _382;
    bool _416 = !_406;
    int _418 = _416 ? 0 : (-1);
    int _420 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _422 = _420 != 0;
    int _424 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _426 = _424 != 0;
    int _428 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _430 = _428 != 0;
    int _432 = ~_380;
    int _434 = _432 + _418;
    int _436 = _434 + 1;
    bool _438 = _307 == 0;
    float _440 = trunc(_414);
    int _442 = int(_440);
    bool _444 = !_426;
    int _446 = _444 ? 0 : 1;
    int _448 = _307 * _436;
    int _450 = _448 + _337;
    int _452 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _454 = _452 != 0;
    float _456 = in.m_60.x;
    float _458 = in.m_60.y;
    int _460 = _307 + (-1);
    int _462 = ~_412;
    int _464 = _462 + 1;
    int _466 = _464 + 1;
    float _468 = trunc(_408);
    int _470 = int(_468);
    bool _472 = !_438;
    int _474 = _472 ? _450 : (-1);
    bool _476 = !_422;
    int _478 = _476 ? 0 : 1;
    int _480 = abs(_446);
    int _482 = _474 * _466;
    bool _484 = !_454;
    int _486 = _484 ? 0 : 1;
    int _488 = abs(_478);
    int _490 = _412 * _460;
    int _492 = _490 + _482;
    float _494 = _303 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _496 = abs(_486);
    bool _498 = !_430;
    int _500 = _498 ? 0 : 1;
    int _502 = _492 * _480;
    int _504 = _442 * _496;
    int _506 = _504 + _337;
    int _508 = abs(_500);
    float _510 = fma(_494, -2.0, _311);
    int _512 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _514 = _512 != 0;
    int _516 = _470 * _488;
    int _518 = _516 + _502;
    int _520 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _522 = _520 != 0;
    float _524 = _273 * _456;
    int _526 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _528 = _526 != 0;
    float _530 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _532 = log2(_530);
    int _534 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _536 = _534 != 0;
    int _538 = _506 * _508;
    int _540 = _538 + _518;
    bool _542 = !_514;
    int _544 = _542 ? 0 : 1;
    float _546 = in.m_46.x;
    float _548 = in.m_46.y;
    float _550 = in.m_46.z;
    float _552 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[76].y, _510);
    int _554 = abs(_544);
    float _556 = _301 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _560 = _558 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _562 = _442 * _554;
    int _564 = _562 + _540;
    float _566 = -_309;
    float _568 = fma(_556, 2.0, _566);
    float _570 = 1.0 / _560;
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _574 = _572 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _576 = float(uint(_564));
    float _578 = _532 * _109;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _582 = 1.0 / _574;
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _586 = _584 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _590 = as_type<float>(_339) * _576;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _594 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _596 = _548 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _598 = _548 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _600 = 1.0 / _586;
    float _602 = _588 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _604 = _594 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _606 = ~_307;
    int _608 = _606 + 1;
    float _610 = _548 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _612 = fma(_546, (*spvDescriptorSet0.vp_c10)._m0[4].x, _596);
    float _614 = fma(_546, (*spvDescriptorSet0.vp_c10)._m0[5].x, _598);
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _618 = _616 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _620 = trunc(_590);
    float _622 = precise::max(_620, 0.0);
    uint _624 = uint(_622);
    float _626 = _592 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _628 = _301 * 2.0;
    float _630 = fma(_546, (*spvDescriptorSet0.vp_c10)._m0[6].x, _610);
    float _632 = _618 * _582;
    out.m_62.x = _602;
    out.m_62.y = _626;
    out.m_62.z = _604;
    out.m_62.w = _580;
    float _634 = _317 * _570;
    float _636 = floor(_628);
    bool _638 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _640 = isnan(1.0);
    bool _642 = _638 || _640;
    bool _644 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _646 = _642 || _644;
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _650 = 1.0 + _648;
    bool _652 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _654 = isnan(0.0);
    bool _656 = _652 || _654;
    bool _658 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _660 = _656 || _658;
    bool _662 = _301 > 0.5;
    float _664 = exp2(_578);
    float _666 = in.m_58.z;
    int _668 = _608 * int(_624);
    int _670 = _668 + _564;
    float _672 = float(uint(_506));
    float _674 = float(uint(_670));
    float _676 = 1.0 / _650;
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _678;
    float _682 = as_type<float>(_339) * _674;
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _686 = _680 * _600;
    float _688 = trunc(_682);
    float _690 = precise::max(_688, 0.0);
    uint _692 = uint(_690);
    float _694 = -_664;
    float _696 = _694 + 1.0;
    float _698 = -_173;
    int _700 = _662 ? as_type<int>(_698) : as_type<int>(_173);
    float _702 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _704 = _636 > 0.0;
    float _706 = _303 * 2.0;
    float _708 = _660 ? _696 : 0.0;
    float _710 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[78].z, _684);
    bool _712 = _636 >= 0.0;
    bool _714 = isnan(_636);
    bool _716 = _712 || _714;
    bool _718 = isnan(0.0);
    bool _720 = _716 || _718;
    float _722 = -_109;
    float _724 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[76].x, _568);
    float _726 = _666 * 2.0;
    float _728 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[78].w, _702);
    float _730 = floor(_706);
    float _732 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[77].z, _710);
    float _734 = _303 + _666;
    float _736 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[77].w, _728);
    if (_646)
    {
        float _738 = _708 * _676;
        _119 = _738;
    }
    float _740 = _119;
    int _742 = int(_624) + int(_692);
    float _744 = _303 + _301;
    float _746 = floor(_726);
    int _748 = ~_307;
    int _750 = _748 + 1;
    float _752 = _734 + (-1.0);
    float _754 = _744 + (-1.0);
    int _756 = _720 ? 0 : 1;
    float _758 = fma(_752, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _760 = _750 * _742;
    int _762 = _760 + _564;
    bool _764 = _303 > 0.5;
    float _766 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _768 = ~_756;
    int _770 = _768 + 1;
    int _772 = _770 + 1;
    int _774 = _772;
    float _776 = _766;
    if (!_704)
    {
        int _778 = ~_756;
        int _780 = _778 + 1;
        _774 = _780;
    }
    int _782 = _774;
    float _784 = -_177;
    int _786 = _764 ? as_type<int>(_784) : as_type<int>(_177);
    bool _788 = _730 >= 0.0;
    bool _790 = isnan(_730);
    bool _792 = _788 || _790;
    bool _794 = isnan(0.0);
    bool _796 = _792 || _794;
    bool _798 = !_528;
    float _800 = _798 ? _173 : as_type<float>(_700);
    float _802 = fma(_550, (*spvDescriptorSet0.vp_c10)._m0[5].z, _614);
    bool _804 = uint(_762) >= uint(_307);
    bool _806 = _730 > 0.0;
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _810 = _295 + _808;
    bool _812 = _746 >= 0.0;
    bool _814 = isnan(_746);
    bool _816 = _812 || _814;
    bool _818 = isnan(0.0);
    bool _820 = _816 || _818;
    bool _822 = !_536;
    float _824 = _822 ? _177 : as_type<float>(_786);
    int _826 = _796 ? 0 : 1;
    bool _828 = !_804;
    int _830 = _828 ? 0 : (-1);
    int _832 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _834 = _832 != 0;
    int _836 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _838 = _836 != 0;
    int _840 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _842 = _840 != 0;
    float _844 = fma(_550, (*spvDescriptorSet0.vp_c10)._m0[4].z, _612);
    float _846 = fma(_550, (*spvDescriptorSet0.vp_c10)._m0[6].z, _630);
    int _848 = ~_742;
    int _850 = _848 + _830;
    int _852 = _850 + 1;
    float _854 = as_type<float>(_339) * _672;
    bool _856 = _295 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _858 = isnan(_295);
    bool _860 = _856 || _858;
    bool _862 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _864 = _860 || _862;
    float _866 = float(_864);
    float _868 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _870 = _295 + _868;
    int _872 = _820 ? 0 : 1;
    int _874 = _307 * _852;
    int _876 = _874 + _564;
    bool _878 = _746 > 0.0;
    float _880 = trunc(_854);
    float _882 = precise::max(_880, 0.0);
    uint _884 = uint(_882);
    bool _886 = _295 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _888 = isnan(_295);
    bool _890 = _886 || _888;
    bool _892 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _894 = _890 || _892;
    float _896 = float(_894);
    float _898 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _900 = _295 + _898;
    bool _902 = _295 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _904 = isnan(_295);
    bool _906 = _902 || _904;
    bool _908 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _910 = _906 || _908;
    float _912 = float(_910);
    float _914 = -_866;
    float _916 = _914 + 1.0;
    bool _918 = _295 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _920 = isnan(_295);
    bool _922 = _918 || _920;
    bool _924 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _926 = _922 || _924;
    float _928 = float(_926);
    float _930 = fma(_634, _870, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _932 = !_438;
    int _934 = _932 ? _876 : (-1);
    float _936 = _912 * _916;
    float _938 = -_912;
    float _940 = _938 + 1.0;
    int _942 = ~_307;
    int _944 = _942 + 1;
    float _946 = -_928;
    float _948 = _946 + 1.0;
    int _950 = _934 >> 31;
    float _952 = _928 * _940;
    float _954 = fma(_632, _900, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _956 = fma(_686, _810, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    int _958 = _950 & 3;
    int _960 = _944 * int(_884);
    int _962 = _960 + _506;
    float _964 = _800 + 0.5;
    float _966 = _896 * _948;
    int _968 = _934 + _958;
    float _970 = _824 + (-0.5);
    float _972 = float(uint(_962));
    float _974 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[80].x, _724);
    int _976 = _968 >> 2;
    float _978 = _930 * _966;
    float _980 = -_896;
    float _982 = _980 + 1.0;
    float _984 = as_type<float>(_339) * _972;
    int _986 = _976 << 4;
    int _988 = _986 + 368;
    float _990 = -_732;
    float _992 = _990 + 1.0;
    float _994 = -_970;
    float _996 = -_552;
    float _998 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[80].y, _996);
    float _1000 = -_736;
    float _1002 = _1000 + 1.0;
    uint _1004 = uint(int(uint(_988) >> uint(2)));
    uint _1006 = uint(int(uint(int(_1004)) >> uint(2)));
    int _1008 = int(_1004) & 3;
    float _1010 = (*spvDescriptorSet0.vp_c9)._m0[int(_1006)][_1008];
    int _1012 = int(_1004) + 1;
    uint _1014 = uint(int(uint(_1012) >> uint(2)));
    int _1016 = _1012 & 3;
    float _1018 = (*spvDescriptorSet0.vp_c9)._m0[int(_1014)][_1016];
    float _1020 = trunc(_984);
    float _1022 = precise::max(_1020, 0.0);
    uint _1024 = uint(_1022);
    float _1026 = fma(_982, (*spvDescriptorSet0.vp_c9)._m0[115].x, _978);
    int _1028 = ~_826;
    int _1030 = _1028 + 1;
    int _1032 = _1030 + 1;
    float _1034 = -_992;
    float _1036 = fma(_800, _1034, _974);
    float _1038 = fma(_824, _1002, _998);
    int _1040 = _1032;
    if (!_806)
    {
        int _1042 = ~_826;
        int _1044 = _1042 + 1;
        _1040 = _1044;
    }
    int _1046 = _1040;
    float _1048 = fma(_954, _952, _1026);
    int _1050 = _934 & 3;
    bool _1052 = _1050 != 0;
    int _1054 = ~_872;
    int _1056 = _1054 + 1;
    int _1058 = _1056 + 1;
    out.m_64.x = _1036;
    out.m_64.y = _1038;
    int _1060 = _1058;
    if (!_878)
    {
        int _1062 = ~_872;
        int _1064 = _1062 + 1;
        _1060 = _1064;
    }
    int _1066 = _1060;
    float _1068 = fma(_956, _936, _1048);
    bool _1070 = uint(_1050) > 1u;
    bool _1072 = !_834;
    int _1074 = _1072 ? 0 : 1;
    float _1076 = fma(_866, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1068);
    int _1078 = _934 & 3;
    bool _1080 = _1078 != 0;
    int _1082 = ~_307;
    int _1084 = _1082 + 1;
    int _1086 = _988 + 8;
    uint _1088 = uint(int(uint(_1086) >> uint(2)));
    uint _1090 = uint(int(uint(int(_1088)) >> uint(2)));
    int _1092 = int(_1088) & 3;
    float _1094 = (*spvDescriptorSet0.vp_c9)._m0[int(_1090)][_1092];
    int _1096 = int(_1088) + 1;
    uint _1098 = uint(int(uint(_1096) >> uint(2)));
    int _1100 = _1096 & 3;
    float _1102 = (*spvDescriptorSet0.vp_c9)._m0[int(_1098)][_1100];
    bool _1104 = !_838;
    int _1106 = _1104 ? 0 : 1;
    int _1108 = int(_884) + int(_1024);
    int _1110 = _1080 ? 0 : 1;
    int _1112 = abs(_1074);
    int _1114 = abs(_1106);
    int _1116 = ~_1110;
    int _1118 = _1116 + 1;
    int _1120 = _1118 + 1;
    int _1122 = _1084 * _1108;
    int _1124 = _1122 + _506;
    int _1126 = _1120;
    if (!_1070)
    {
        int _1128 = ~_1110;
        int _1130 = _1128 + 1;
        _1126 = _1130;
    }
    int _1132 = _1126;
    float _1134 = float(_782);
    float _1136 = float(_1114);
    bool _1138 = uint(_1050) >= 2u;
    int _1140 = abs(_1132);
    float _1142 = _1136 * _1134;
    bool _1144 = _1050 != 3;
    int _1146 = _1138 ? 0 : 1;
    bool _1148 = uint(_1124) >= uint(_307);
    float _1150 = float(_1112);
    float _1152 = float(_1066);
    bool _1154 = !_1148;
    int _1156 = _1154 ? 0 : (-1);
    int _1158 = ~_1140;
    int _1160 = _1158 + 1;
    int _1162 = _1160 + 1;
    float _1164 = _1150 * _1152;
    bool _1166 = _1050 != 3;
    float _1168 = _802 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1170 = ~_1108;
    int _1172 = _1170 + _1156;
    int _1174 = _1172 + 1;
    float _1176 = _844 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1178 = ~_1146;
    int _1180 = _1178 + 1;
    int _1182 = _1180 + 1;
    int _1184 = _1162 * as_type<int>(_1018);
    float _1186 = _846 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1188 = _1182;
    if (_1144)
    {
        int _1190 = ~_1146;
        int _1192 = _1190 + 1;
        _1188 = _1192;
    }
    int _1194 = _1188;
    float _1196 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1198 = _1168 + _1196;
    bool _1200 = !_1052;
    int _1202 = _1200 ? 0 : 1;
    float _1204 = in.m_66.x;
    float _1206 = in.m_66.y;
    float _1208 = in.m_66.z;
    float _1210 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1212 = _1176 + _1210;
    float _1214 = _1198 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1216 = abs(_1202);
    int _1218 = _307 * _1174;
    int _1220 = _1218 + _506;
    bool _1222 = !_1166;
    int _1224 = _1222 ? 0 : (-1);
    float _1226 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1214);
    int _1228 = abs(_1194);
    float _1230 = _1164 * (-2.0);
    int _1232 = abs(_1224);
    float _1234 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1236 = _1186 + _1234;
    int _1238 = ~_1216;
    int _1240 = _1238 + 1;
    int _1242 = _1240 + 1;
    float _1244 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1226);
    int _1246 = _1242 * as_type<int>(_1010);
    int _1248 = _1246 + _1184;
    int _1250 = ~_1228;
    int _1252 = _1250 + 1;
    int _1254 = _1252 + 1;
    int _1256 = ~_1232;
    int _1258 = _1256 + 1;
    int _1260 = _1258 + 1;
    bool _1262 = !_522;
    int _1264 = _1262 ? 0 : 1;
    int _1266 = _1254 * as_type<int>(_1094);
    int _1268 = _1266 + _1248;
    bool _1270 = _1244 >= 0.0;
    float _1272 = fma(_1230, _1204, _1204);
    bool _1274 = !_438;
    int _1276 = _1274 ? _1220 : (-1);
    int _1278 = _1260 * as_type<int>(_1102);
    int _1280 = _1278 + _1268;
    float _1282 = _1198 * _1198;
    int _1284 = abs(_1264);
    float _1286 = _1142 * (-2.0);
    float _1288 = fma(_766, _1230, _766);
    float _1290 = fma(_1212, _1212, _1282);
    int _1292 = ~_1284;
    int _1294 = _1292 + 1;
    int _1296 = _1294 + 1;
    float _1298 = fma(_758, _1286, _758);
    float _1300 = fma(_1286, _1206, _1206);
    float _1302 = fma(_1236, _1236, _1290);
    int _1304 = _1280 * _1296;
    float _1306 = _1076 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1308 = rsqrt(_1302);
    int _1310 = _1276 * _1284;
    int _1312 = _1310 + _1304;
    float _1314 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    if (_1270)
    {
        _776 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1316 = _776;
    float _1318 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1320 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1322 = _524 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1324 = _301 + (-0.5);
    float _1326 = _1318 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1328 = _1314 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1330 = _1320 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1332 = as_type<int>(_1316);
    if (_1270)
    {
        float _1334 = _1316 * 5.0;
        _1332 = as_type<int>(_1334);
    }
    int _1336 = _1332;
    float _1338 = float(_1312);
    float _1340 = _1322 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1342 = fma(_1324, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1272);
    bool _1344 = !_842;
    int _1346 = _1344 ? 0 : 1;
    out.m_68.x = _1326;
    out.m_68.y = _1328;
    out.m_68.z = _1330;
    out.m_68.w = _1306;
    float _1348 = _1340 * _1308;
    float _1350 = fma(_1288, _740, _1342);
    float _1352 = _303 + (-0.5);
    if (_1270)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4734 = as_type<float>(_1336);
        out.gl_Position.z = _4734;
    }
    float _1354 = _1198 * _1348;
    out.m_70.x = _1338;
    if (_1270)
    {
        out.m_53.x = 0.0;
    }
    int _1356 = abs(_1346);
    float _1358 = _1212 * _1348;
    if (_1270)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1360 = -_1354;
    float _1362 = _1168 + _1360;
    float _1364 = _1236 * _1348;
    float _1366 = -_1358;
    float _1368 = _1176 + _1366;
    float _1370 = -_1354;
    float _1372 = _1198 + _1370;
    float _1374 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1376 = _1362 + _1374;
    float _1378 = -_1364;
    float _1380 = _1186 + _1378;
    float _1382 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1384 = _1368 + _1382;
    float _1386 = float(_1046);
    float _1388 = _1376 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1390 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1392 = _1380 + _1390;
    float _1394 = float(_1356);
    float _1396 = fma(_1352, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1300);
    float _1398 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1388);
    float _1400 = -_1358;
    float _1402 = _1212 + _1400;
    float _1404 = _1372 * _1372;
    float _1406 = fma(_1298, _740, _1396);
    float _1408 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1398);
    float _1410 = _666 + _301;
    float _1412 = fma(_1402, _1402, _1404);
    float _1414 = -_1364;
    float _1416 = _1236 + _1414;
    float _1418 = _1394 * _1386;
    bool _1420 = _1408 >= 0.0;
    float _1422 = _1406 * 0.15915493667125701904296875;
    float _1424 = _1410 + (-1.0);
    float _1426 = fma(_1416, _1416, _1412);
    float _1428 = _1418 * (-2.0);
    float _1430 = _1350 * 0.15915493667125701904296875;
    float _1432 = fma(_1424, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1434 = _1422 * 6.283185482025146484375;
    float _1436 = sin(_1434);
    float _1438 = fma(_1428, _1208, _1208);
    float _1440 = _666 + (-0.5);
    float _1442 = fma(_1432, _1428, _1432);
    float _1444 = _1416;
    int _1446 = as_type<int>(_1438);
    float _1448 = _1364;
    float _1450 = _1384;
    if (_1420)
    {
        _1444 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1452 = _1444;
    float _1454 = fma(_1440, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1438);
    float _1456 = _1430 * 6.283185482025146484375;
    float _1458 = sin(_1456);
    if (_1420)
    {
        out.m_53.x = 0.0;
    }
    if (_1420)
    {
        float _1460 = _1452 * 5.0;
        _1446 = as_type<int>(_1460);
    }
    int _1462 = _1446;
    float _1464 = fma(_1442, _740, _1454);
    if (_1420)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4922 = as_type<float>(_1462);
        out.gl_Position.z = _4922;
    }
    float _1466 = _1430 * 6.283185482025146484375;
    float _1468 = cos(_1466);
    float _1470 = _1464 * 0.15915493667125701904296875;
    float _1472 = sqrt(_1426);
    float _1474 = _1422 * 6.283185482025146484375;
    float _1476 = cos(_1474);
    if (_1420)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1478 = _1470 * 6.283185482025146484375;
    float _1480 = cos(_1478);
    float _1482 = _275 * _458;
    float _1484 = _1308 * _1472;
    float _1486 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _177);
    float _1488 = _1468 * _1476;
    float _1490 = _1482 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1492 = _1322 * _1484;
    float _1494 = _1468 * _1436;
    float _1496 = _1470 * 6.283185482025146484375;
    float _1498 = sin(_1496);
    float _1500 = _1490 * _1484;
    float _1502 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _173);
    bool _1504 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1506 = isnan(0.5);
    bool _1508 = _1504 || _1506;
    bool _1510 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1512 = _1508 || _1510;
    float _1514 = _1486 * _1500;
    float _1516 = _1458 * _1436;
    float _1518 = _1458 * _1476;
    float _1520 = _1468 * _1480;
    float _1522 = _1502 * _1492;
    float _1524 = _1476 * _1480;
    float _1526 = _1458 * _1480;
    float _1528 = _1520 * _1514;
    float _1530 = _1484 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1532 = _1530 * 0.5;
    float _1534 = _1436 * _1480;
    bool _1536 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1538 = isnan(0.5);
    bool _1540 = _1536 || _1538;
    bool _1542 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1544 = _1540 || _1542;
    float _1546 = fma(_1498, _1488, _1516);
    float _1548 = -_1518;
    float _1550 = fma(_1498, _1494, _1548);
    float _1552 = -_1514;
    float _1554 = _1498 * _1552;
    float _1556 = -_1494;
    float _1558 = fma(_1498, _1518, _1556);
    float _1560 = fma(_1546, _1522, _1528);
    float _1562 = _1526 * _1514;
    float _1564 = fma(_1524, _1522, _1554);
    float _1566 = fma(_1498, _1516, _1488);
    float _1568 = fma(_1550, _1532, _1560);
    float _1570 = fma(_1558, _1522, _1562);
    float _1572 = fma(_1534, _1532, _1564);
    float _1574 = _1568 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1576 = fma(_1566, _1532, _1570);
    float _1578 = _1568 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1580 = fma(_1572, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1574);
    float _1582 = _1362 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1584 = fma(_1572, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1578);
    float _1586 = fma(_1576, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1580);
    float _1588 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1582);
    float _1590 = fma(_1576, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1584);
    float _1592 = _1362 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1594 = _1586 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1596 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1588);
    float _1598 = _1590 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1600 = _1186 + _1594;
    float _1602 = _1596 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1604 = _1176 + _1598;
    float _1606 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1592);
    float _1608 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1610 = _1600 + _1608;
    float _1612 = 1.0 / _1602;
    float _1614 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1616 = _1604 + _1614;
    float _1618 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1606);
    float _1620 = _1610 * _1610;
    float _1622 = _1568 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1624 = _1618 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1626 = fma(_1616, _1616, _1620);
    float _1628 = fma(_1572, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1622);
    float _1630 = _1624 + _1602;
    float _1632 = sqrt(_1626);
    float _1634 = fma(_1576, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1628);
    float _1636 = _1630 * _1612;
    float _1638 = _1636 * 0.5;
    float _1640 = _1634 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1642 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1644 = fma(_1638, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1642);
    float _1646 = _1168 + _1640;
    float _1648 = 1.0 / _1644;
    bool _1650 = _1632 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1652 = _1622;
    float _1654 = _1638;
    float _1656 = _1640;
    if (!_1650)
    {
        _1652 = _1604;
    }
    float _1658 = _1652;
    float _1660 = _1658;
    if (!_1650)
    {
        _1654 = _1600;
    }
    float _1662 = _1654;
    float _1664 = _1662;
    if (!_1650)
    {
        _1656 = _1646;
    }
    float _1666 = _1656;
    bool _1668 = !_1650;
    float _1670 = _1666;
    if (!_1668)
    {
        float _1672 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1674 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1676 = _1632 + _1674;
        float _1678 = _1646 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1680 = rsqrt(_1626);
        float _1682 = _1676 * _1672;
        float _1684 = _1682 * 0.15915493667125701904296875;
        float _1686 = _1684 * 6.283185482025146484375;
        float _1688 = cos(_1686);
        float _1690 = _1684 * 6.283185482025146484375;
        float _1692 = sin(_1690);
        float _1694 = _1688 + (-1.0);
        float _1696 = _1694 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1698 = fma(_1692, _1678, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1700 = fma(_1646, _1688, _1696);
        float _1702 = _1680 * _1698;
        float _1704 = fma(_1616, _1702, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1706 = fma(_1610, _1702, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1670 = _1700;
        _1664 = _1706;
        _1660 = _1704;
    }
    float _1708 = _1670;
    float _1710 = _1664;
    float _1712 = _1660;
    float _1714 = -_1354;
    float _1716 = _1714 + _1708;
    float _1718 = -_1364;
    float _1720 = _1718 + _1710;
    float _1722 = -_1358;
    float _1724 = _1722 + _1712;
    float _1726 = _1716;
    float _1728 = _1724;
    float _1730 = _1720;
    float _1732 = _1710;
    if (_1544)
    {
        _1448 = 1.0;
    }
    float _1734 = _1448;
    float _1736 = _1734;
    if (!_1512)
    {
        float _1738 = _1376 * _1376;
        float _1740 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1742 = -_1186;
        float _1744 = _1742 + _1710;
        float _1746 = -_1168;
        float _1748 = _1746 + _1708;
        float _1750 = fma(_1384, _1384, _1738);
        float _1752 = -_1176;
        float _1754 = _1752 + _1712;
        float _1756 = fma(_1392, _1392, _1750);
        float _1758 = 1.0 / _1484;
        float _1760 = sqrt(_1756);
        float _1762 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1764 = precise::min(_1760, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1766 = _1764 * _1740;
        float _1768 = _1762 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1770 = _1766 * _1758;
        float _1772 = _1768 * _1770;
        float _1774 = _1744 * _1770;
        float _1776 = fma(_1748, _1772, _1362);
        float _1778 = fma(_1754, _1772, _1368);
        float _1780 = fma(_1768, _1774, _1380);
        _1450 = _1760;
        _1726 = _1776;
        _1728 = _1778;
        _1730 = _1780;
    }
    float _1782 = _1450;
    float _1784 = _1726;
    float _1786 = _1728;
    float _1788 = _1730;
    float _1790 = _1782;
    if (_1544)
    {
        _1732 = 1.0;
    }
    float _1792 = _1732;
    float _1794 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1796 = _1648 * _1794;
    float _1798 = _1792;
    if (!_1544)
    {
        float _1800 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1802 = _1800 * 0.15915493667125701904296875;
        float _1804 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1806 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1808 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1806;
        float _1810 = _1802 * 6.283185482025146484375;
        float _1812 = cos(_1810);
        float _1814 = _1804 * 0.15915493667125701904296875;
        float _1816 = _1802 * 6.283185482025146484375;
        float _1818 = sin(_1816);
        float _1820 = 1.0 / _1812;
        float _1822 = _1814 * 6.283185482025146484375;
        float _1824 = cos(_1822);
        float _1826 = _1818 * _1820;
        float _1828 = _1814 * 6.283185482025146484375;
        float _1830 = sin(_1828);
        float _1832 = _1824 * _1826;
        float _1834 = 1.0 / _1808;
        float _1836 = 1.0 / _1832;
        float _1838 = _1830 * _1836;
        float _1840 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1842 = fma(_1796, _1838, _1840);
        float _1844 = _1842 * _1834;
        float _1846 = precise::clamp(_1844, 0.0, 1.0);
        _1790 = _1826;
        _1736 = _1846;
    }
    float _1848 = _1790;
    float _1850 = _1736;
    float _1852 = _1848;
    if (!_1544)
    {
        float _1854 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1856 = _1854 * 0.15915493667125701904296875;
        float _1858 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1860 = _1856 * 6.283185482025146484375;
        float _1862 = cos(_1860);
        float _1864 = _1858 * 0.15915493667125701904296875;
        float _1866 = _1856 * 6.283185482025146484375;
        float _1868 = sin(_1866);
        float _1870 = 1.0 / _1862;
        float _1872 = _1864 * 6.283185482025146484375;
        float _1874 = cos(_1872);
        float _1876 = _1868 * _1870;
        float _1878 = _1864 * 6.283185482025146484375;
        float _1880 = sin(_1878);
        float _1882 = _1874 * _1876;
        float _1884 = 1.0 / _1882;
        float _1886 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1888 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1886;
        float _1890 = 1.0 / _1888;
        float _1892 = _1880 * _1884;
        float _1894 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1896 = fma(_1796, _1892, _1894);
        float _1898 = _1896 * _1890;
        float _1900 = precise::clamp(_1898, 0.0, 1.0);
        float _1902 = -_1900;
        float _1904 = _1902 + 1.0;
        _1852 = _1870;
        _1798 = _1904;
    }
    float _1906 = _1852;
    float _1908 = _1798;
    float _1910 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1912 = _1784 + _1910;
    float _1914 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1916 = _1786 + _1914;
    float _1918 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1920 = _1788 + _1918;
    float _1922 = _1784 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1924 = _1912 * _1912;
    float _1926 = fma(_1916, _1916, _1924);
    float _1928 = fma(_1920, _1920, _1926);
    float _1930 = rsqrt(_1928);
    float _1932 = sqrt(_1928);
    float _1934 = _1930 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1936 = _1916 * _1934;
    float _1938 = _1920 * _1934;
    float _1940 = _1936 * _1936;
    float _1942 = _1938 * _1938;
    float _1944 = _1940 + _1942;
    float _1946 = sqrt(_1944);
    bool _1948 = _1946 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1950 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1952 = _1946 + _1950;
    float _1954 = _1920;
    float _1956 = _1930;
    float _1958 = _1952;
    float _1960 = _1906;
    if (_1948)
    {
        float _1962 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1954 = _1962;
    }
    float _1964 = _1954;
    if (_1948)
    {
        float _1966 = rsqrt(_1944);
        _1956 = _1966;
    }
    float _1968 = _1956;
    float _1970 = _1968;
    if (_1948)
    {
        float _1972 = _1952 * _1964;
        _1958 = _1972;
    }
    float _1974 = _1958;
    if (_1948)
    {
        float _1976 = _1974 * 0.15915493667125701904296875;
        _1960 = _1976;
    }
    float _1978 = _1960;
    float _1980 = _1964;
    float _1982 = _1978;
    if (_1948)
    {
        float _1984 = _1978 * 6.283185482025146484375;
        float _1986 = sin(_1984);
        _1980 = _1986;
    }
    float _1988 = _1980;
    float _1990 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1992 = precise::max(0.0, _1990);
    float _1994 = _1924;
    float _1996 = _1992;
    if (_1948)
    {
        float _1998 = _1978 * 6.283185482025146484375;
        float _2000 = cos(_1998);
        _1994 = _2000;
    }
    float _2002 = _1994;
    float _2004 = -_1934;
    float _2006 = -_1992;
    float _2008 = fma(_1912, _2004, _2006);
    float _2010 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    float _2012 = _2008;
    if (_1948)
    {
        float _2014 = _2008 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1996 = _2014;
    }
    float _2016 = _1996;
    float _2018 = _2016;
    if (!_1948)
    {
        _1982 = _1940;
    }
    float _2020 = _1982;
    float _2022 = fma(_1368, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2024 = _1988;
    float _2026 = _2020;
    if (_1948)
    {
        float _2028 = fma(_1988, _2016, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2024 = _2028;
    }
    float _2030 = _2024;
    float _2032 = _2030;
    float _2034 = _2002;
    if (_1948)
    {
        float _2036 = _2002 + (-1.0);
        _2018 = _2036;
    }
    float _2038 = _2018;
    float _2040 = _2038;
    if (_1948)
    {
        float _2042 = _1968 * _2030;
        _2010 = _2042;
    }
    float _2044 = _2010;
    if (!_1948)
    {
        _1970 = _1936;
    }
    float _2046 = _1970;
    float _2048 = fma(_1380, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2050 = _2046;
    if (_1948)
    {
        float _2052 = _2038 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2040 = _2052;
    }
    float _2054 = _2040;
    if (_1948)
    {
        float _2056 = _1936 * _2044;
        _2050 = _2056;
    }
    float _2058 = _2050;
    if (!_1948)
    {
        _2032 = _1938;
    }
    float _2060 = _2032;
    float _2062 = _2060;
    if (_1948)
    {
        float _2064 = _1938 * _2044;
        _2062 = _2064;
    }
    float _2066 = _2062;
    if (_1948)
    {
        float _2068 = fma(_2008, _2002, _2054);
        _2012 = _2068;
    }
    float _2070 = _2012;
    if (_1948)
    {
        float _2072 = _2058 * _2058;
        _2026 = _2072;
    }
    float _2074 = _2026;
    if (!_1948)
    {
        _2034 = _1942;
    }
    float _2076 = _2034;
    float _2078 = _2076;
    if (_1948)
    {
        float _2080 = _2066 * _2066;
        _2078 = _2080;
    }
    float _2082 = _2078;
    float _2084 = fma(_2070, _2070, _2074);
    float _2086 = _1784 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2088 = floor(_2022);
    float _2090 = _2084 + _2082;
    float _2092 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2086);
    float _2094 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2096 = fma(_1932, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2094);
    float _2098 = precise::clamp(_2096, 0.0, 1.0);
    float _2100 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1922);
    float _2102 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2092);
    float _2104 = -_2098;
    float _2106 = _2104 + 1.0;
    float _2108 = rsqrt(_2090);
    float _2110 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2112 = _2102 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2114 = _1784 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2116 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2100);
    float _2118 = _2112 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2120 = abs(_2106);
    float _2122 = log2(_2120);
    float _2124 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2114);
    float _2126 = -_2118;
    float _2128 = fma(_2126, _2110, 1.0);
    float _2130 = _1784 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2132 = _2116 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2134 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2124);
    float _2136 = -_2088;
    float _2138 = _2022 + _2136;
    float _2140 = _2108 * _2058;
    float _2142 = _2108 * _2066;
    float _2144 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2130);
    float _2146 = _2108 * _2070;
    float _2148 = _2140 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2150 = _2134 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2152 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2144);
    float _2154 = floor(_2048);
    float _2156 = -_2148;
    float _2158 = fma(_2146, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2156);
    float _2160 = _2150 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2162 = _2152 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2164 = _2122 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2166 = -_2142;
    float _2168 = fma(_2166, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2158);
    float _2170 = _2150 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2172 = fma(_2162, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2160);
    float _2174 = exp2(_2164);
    float _2176 = fma(_2168, -0.5, 0.5);
    float _2178 = _2150 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2180 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2172);
    float _2182 = fma(_2162, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2170);
    float _2184 = _2146 + 1.0;
    float _2186 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2180);
    float _2188 = sqrt(_2176);
    float _2190 = -_2154;
    float _2192 = _2048 + _2190;
    float _2194 = fma(_2162, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2178);
    float _2196 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2182);
    float _2198 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2194);
    float _2200 = 1.0 / _2186;
    float _2202 = log2(_2128);
    float _2204 = _2188 * 0.636619746685028076171875;
    float _2206 = fma(_2168, 0.5, 0.5);
    float _2208 = -_2146;
    float _2210 = fma(_2174, _2184, _2208);
    float _2212 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2196);
    float _2214 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2198);
    float _2216 = fma(_2206, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float2 _6105 = float2(_2138, _2192);
    float _2218 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6105, float2(0.0), isnan(_6105)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6105, float2(0.0), isnan(_6105)), level(0.0)).x;
    float _2220 = _2212 * _2200;
    float _2222 = _2202 * 0.693147182464599609375;
    float _2224 = fma(_2206, _2216, -0.212114393711090087890625);
    float _2226 = _2214 * _2200;
    float _2228 = fma(_2210, 0.5, 0.5);
    float _2230 = _2222 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2232 = fma(_2206, _2224, 1.570728778839111328125);
    float _2234 = fma(_2226, -0.5, 0.5);
    float _2236 = -_2232;
    float _2238 = fma(_2204, _2236, 1.0);
    float _2240 = fma(_2220, 0.5, 0.5);
    float3 _6148 = float3(_2240, _2234, _2230);
    float _2242 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6148, float3(0.0), isnan(_6148)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6148, float3(0.0), isnan(_6148)), level(0.0)).x;
    float3 _6159 = float3(_2240, _2234, _2230);
    float4 _2245 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6159, float3(0.0), isnan(_6159)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6159, float3(0.0), isnan(_6159)), level(0.0)).xyzw;
    float _2247 = _2245.x;
    float _2249 = _2245.y;
    float _2251 = _2245.z;
    float _2253 = _2245.w;
    float2 _6175 = float2(_2238, _2228);
    float3 _2257 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6175, float2(0.0), isnan(_6175)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6175, float2(0.0), isnan(_6175)), level(0.0)).xyz;
    float _2259 = _2257.x;
    float _2261 = _2257.y;
    float _2263 = _2257.z;
    float _2265 = abs(_1796);
    float _2267 = log2(_2265);
    float _2269 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2271 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2273 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2275 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2269);
    float _2277 = _1520 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2279 = _2150 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2281 = _177 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2283 = _173 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2285 = _1932 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2287 = isnan(_1932);
    bool _2289 = _2285 || _2287;
    bool _2291 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2293 = _2289 || _2291;
    float _2295 = _2267 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2297 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2271);
    float _2299 = _1520 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2301 = _1520 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2303 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2273);
    float _2305 = -_1498;
    float _2307 = fma(_2305, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2277);
    float _2309 = exp2(_2295);
    float _2311 = _1550 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2313 = _1550 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2315 = _1550 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2317 = -_1498;
    float _2319 = fma(_2317, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2299);
    float _2321 = -_1498;
    float _2323 = fma(_2321, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2301);
    float _2325 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2311);
    float _2327 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2313);
    float _2329 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2315);
    float _2331 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2307);
    float _2333 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2319);
    float _2335 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2323);
    float _2337 = fma(_2162, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2279);
    float _2339 = _2122 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2341 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2275);
    float _2343 = fma(_2309, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2345 = precise::clamp(_2343, 0.0, 1.0);
    float _2347 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2337);
    float _2349 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2297);
    float _2351 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2303);
    float _2353 = fma(_2345, -2.0, 3.0);
    float _2355 = _2345 * _2345;
    float _2357 = exp2(_2339);
    float _2359 = in.m_72.x;
    float _2361 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2325);
    float _2363 = _2355 * _2353;
    float _2365 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2327);
    float _2367 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2329);
    float _2369 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2347);
    float _2371 = -_2363;
    float _2373 = _2371 + 1.0;
    bool _2375 = _1796 <= 8000.0;
    bool _2377 = isnan(_1796);
    bool _2379 = _2375 || _2377;
    bool _2381 = isnan(8000.0);
    bool _2383 = _2379 || _2381;
    float _2385 = float(_2383);
    float _2387 = _2281 * _2331;
    float _2389 = _2281 * _2333;
    float _2391 = fma(_2373, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2363);
    float _2393 = _2281 * _2335;
    float _2395 = fma(_2283, _2341, _2387);
    float _2397 = _2369 + _2186;
    float _2399 = _2385 * _2391;
    float _2401 = -_2357;
    float _2403 = _2401 + 1.0;
    float _2405 = _2212 + _2186;
    float _2407 = _2186 * 0.5;
    float _2409 = _2399 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2411 = fma(_2283, _2351, _2393);
    float _2413 = _2403 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2415 = _2397 * 0.5;
    float _2417 = _2405 * 0.5;
    float _2419 = fma(_2214, -0.5, _2407);
    out.gl_Position.x = _2212;
    out.gl_Position.y = _2214;
    out.gl_Position.z = _2369;
    out.gl_Position.w = _2186;
    float _2421 = fma(_2283, _2349, _2389);
    float _2423 = _2361 + _2395;
    float _2425 = _2367 + _2411;
    out.m_74.x = _2417;
    out.m_74.y = _2419;
    out.m_74.z = _2415;
    out.m_74.w = _2186;
    float _2427 = _2365 + _2421;
    float _2429 = _2283;
    if (!_2293)
    {
        _2429 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2431 = _2429;
    out.m_76.x = _2423;
    out.m_76.y = _2427;
    out.m_76.z = _2425;
    float _2433 = -_2413;
    float _2435 = _2433 + 1.0;
    float _2437 = -_2218;
    float _2439 = _2437 + 1.0;
    float _2441 = _2439 * _2409;
    float _2443 = precise::clamp(_2441, 0.0, 1.0);
    float _2445 = -_2443;
    float _2447 = fma(_2445, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2449 = _2447 * _2359;
    float _2451 = _2413 * _2242;
    float _2453 = _2449 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2455 = _2253 * _2435;
    float _2457 = _1850 * _1908;
    float _2459 = _2253 * _2451;
    float _2461 = _2263 * _2451;
    out.m_78.x = _2453;
    float _2463 = fma(_2259, _2459, _2247);
    float _2465 = fma(_2261, _2459, _2249);
    float _2467 = fma(_2253, _2461, _2251);
    float _2469 = _2457 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2471 = _2249;
    float _2473 = _2259;
    float _2475 = _2251;
    float _2477 = _2247;
    float _2479 = _2457;
    float _2481 = _2431;
    float _2483 = _2431;
    if (!_2293)
    {
        _2471 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2485 = _2471;
    float _2487 = _2485;
    float _2489 = _2485;
    if (!_2293)
    {
        _2473 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2491 = _2473;
    out.m_80.x = _2463;
    out.m_80.y = _2465;
    out.m_80.z = _2467;
    out.m_80.w = _2455;
    float _2493 = _2491;
    float _2495 = _2491;
    if (!_2293)
    {
        _2475 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2497 = _2475;
    float _2499 = _2497;
    float _2501 = _2497;
    if (!_2293)
    {
        _2477 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2503 = _2477;
    float _2505 = _2503;
    float _2507 = _2503;
    if (!_2293)
    {
        _2479 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2509 = _2479;
    bool _2511 = !_2293;
    float _2513 = _2509;
    float _2515 = _2509;
    if (!_2511)
    {
        bool _2517 = _1932 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2519 = isnan(_1932);
        bool _2521 = _2517 || _2519;
        bool _2523 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2525 = _2521 || _2523;
        if (!_2525)
        {
            float _2527 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2529 = _1932 + _2527;
            float _2531 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2533 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2531;
            float _2535 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2537 = _2535 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2539 = 1.0 / _2533;
            float _2541 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2543 = _2541 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2545 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2547 = _2545 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2549 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2551 = _2549 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2553 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2555 = _2553 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2557 = _2529 * _2539;
            float _2559 = precise::clamp(_2557, 0.0, 1.0);
            float _2561 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2563 = _2561 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2565 = fma(_2559, _2537, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2567 = fma(_2559, _2543, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2569 = fma(_2559, _2563, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2571 = fma(_2559, _2547, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2573 = fma(_2559, _2551, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2575 = fma(_2559, _2555, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2495 = _2569;
            _2483 = _2573;
            _2489 = _2567;
            _2507 = _2565;
            _2501 = _2571;
            _2515 = _2575;
            _2577 = true;
        }
        else
        {
            bool _2579 = _1932 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2581 = isnan(_1932);
            bool _2583 = _2579 || _2581;
            bool _2585 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2587 = _2583 || _2585;
            if (!_2587)
            {
                _2487 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2589 = _2487;
            _2489 = _2589;
            if (!_2587)
            {
                _2493 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2591 = _2493;
            _2495 = _2591;
            if (!_2587)
            {
                _2499 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2593 = _2499;
            _2501 = _2593;
            if (!_2587)
            {
                _2505 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2595 = _2505;
            _2507 = _2595;
            if (!_2587)
            {
                _2481 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2597 = _2481;
            _2483 = _2597;
            if (!_2587)
            {
                _2513 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2599 = _2513;
            bool _2601 = !_2587;
            _2515 = _2599;
            if (!_2601)
            {
                bool _2603 = _1932 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2605 = isnan(_1932);
                bool _2607 = _2603 || _2605;
                bool _2609 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2611 = _2607 || _2609;
                if (!_2611)
                {
                    float _2613 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2615 = _1932 + _2613;
                    float _2617 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2619 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2617;
                    float _2621 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2623 = _2621 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2625 = 1.0 / _2619;
                    float _2627 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2629 = _2627 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2631 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2633 = _2631 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2635 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2637 = _2635 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2639 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2641 = _2639 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2643 = _2615 * _2625;
                    float _2645 = precise::clamp(_2643, 0.0, 1.0);
                    float _2647 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2649 = _2647 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2651 = fma(_2645, _2623, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2653 = fma(_2645, _2629, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2655 = fma(_2645, _2649, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2657 = fma(_2645, _2633, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2659 = fma(_2645, _2637, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2661 = fma(_2645, _2641, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2495 = _2655;
                    _2483 = _2659;
                    _2489 = _2653;
                    _2507 = _2651;
                    _2501 = _2657;
                    _2515 = _2661;
                    _2577 = true;
                }
                else
                {
                    _2495 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2483 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2489 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2507 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2501 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2515 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2577 = false;
    float _2663 = _2495;
    float _2665 = _2483;
    float _2667 = _2489;
    float _2669 = _2507;
    float _2671 = _2501;
    float _2673 = _2515;
    float _2675 = fma(_2427, -0.5, 0.5);
    float _2677 = precise::clamp(_2675, 0.0, 1.0);
    float _2679 = -_2663;
    float _2681 = _2679 + _2665;
    float _2683 = _2469 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2685 = -_2667;
    float _2687 = _2685 + _2669;
    float _2689 = fma(_2677, _2681, _2663);
    out.m_82.x = 0.0;
    float _2691 = -_2671;
    float _2693 = _2691 + _2673;
    float _2695 = fma(_2677, _2687, _2667);
    float _2697 = _2689 * 0.586610972881317138671875;
    out.m_53.x = _2683;
    bool _2699 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2701 = fma(_2677, _2693, _2671);
    float _2703 = fma(_2695, 0.298911988735198974609375, _2697);
    bool _2705 = _1850 > 0.0;
    bool _2707 = isnan(_1850);
    bool _2709 = _2705 || _2707;
    bool _2711 = isnan(0.0);
    bool _2713 = _2709 || _2711;
    float _2715 = fma(_2701, 0.114477999508380889892578125, _2703);
    bool _2717 = _1908 <= 0.0;
    bool _2719 = !_2713;
    bool _2721 = _2717 || _2719;
    float _2723 = -_2715;
    float _2725 = _2695 + _2723;
    float _2727 = -_2715;
    float _2729 = _2689 + _2727;
    float _2731 = -_2715;
    float _2733 = _2701 + _2731;
    float _2735 = fma(_2725, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2715);
    float _2737 = fma(_2729, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2715);
    float _2739 = fma(_2733, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2715);
    bool _2741 = !_2699;
    if (!_2741)
    {
        float _2743 = -_1784;
        float _2745 = _2743 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2747 = -_1786;
        float _2749 = _2747 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2751 = -_1788;
        float _2753 = _2751 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2755 = _2745 * _2745;
        float _2757 = fma(_2749, _2749, _2755);
        float _2759 = fma(_2753, _2753, _2757);
        float _2761 = sqrt(_2759);
        float _2763 = rsqrt(_2759);
        float _2765 = -_2761;
        float _2767 = _2765 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2769 = _2767 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2771 = precise::clamp(_2769, 0.0, 1.0);
        float _2773 = _2749 * _2763;
        float _2775 = _2745 * _2763;
        float _2777 = abs(_2771);
        float _2779 = log2(_2777);
        float _2781 = _2753 * _2763;
        float _2783 = _2773 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2785 = _2427 * _2775;
        float _2787 = -_2775;
        float _2789 = -_2783;
        float _2791 = fma(_2787, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2789);
        float _2793 = fma(_2423, _2773, _2785);
        float _2795 = -_2781;
        float _2797 = fma(_2795, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2791);
        float _2799 = fma(_2425, _2781, _2793);
        float _2801 = precise::clamp(_2799, 0.0, 1.0);
        float _2803 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2805 = _2797 + _2803;
        float _2807 = _2779 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2809 = _2805 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2811 = precise::clamp(_2809, 0.0, 1.0);
        float _2813 = exp2(_2807);
        float _2815 = _2813 * _2811;
        float _2817 = _2801 * _2815;
        float _2819 = _2817 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2821 = _2817 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2823 = _2817 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_82.x = _2819;
        out.m_82.y = _2821;
        out.m_82.z = _2823;
    }
    out.m_84.x = _2735;
    out.m_84.y = _2737;
    out.m_84.z = _2739;
    if (!_2721)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2825 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_53.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2825;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

