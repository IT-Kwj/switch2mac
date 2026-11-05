#pragma clang diagnostic ignored "-Wmissing-prototypes"

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
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c9 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c16 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_C [[id(7)]];
    sampler vp_t_tcb_CSmplr [[id(8)]];
    texture3d<float> vp_t_tcb_32 [[id(9)]];
    sampler vp_t_tcb_32Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_30 [[id(11)]];
    sampler vp_t_tcb_30Smplr [[id(12)]];
    texture2d<float> vp_t_tcb_1C [[id(13)]];
    sampler vp_t_tcb_1CSmplr [[id(14)]];
    sampler vp_t_tcb_32Smplr_w [[id(15)]];
    sampler vp_t_tcb_30Smplr_w [[id(16)]];
    sampler vp_t_tcb_1CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_59 [[user(locn0)]];
    float4 m_71 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_61 [[user(locn3)]];
    float4 m_67 [[user(locn4)]];
    float4 m_65 [[user(locn5)]];
    float4 m_69 [[user(locn7)]];
    float4 m_73 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_63 [[attribute(1)]];
    float4 m_46 [[attribute(2)]];
    float4 m_51 [[attribute(3)]];
    float4 m_55 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_57 [[attribute(9)]];
};

static inline __attribute__((always_inline))
int _88(thread const int& _5159, thread const int& _5160, constant _10& support_buffer)
{
    float _5163 = as_type<float>(support_buffer._m4);
    int _5165 = _5160 + as_type<int>(_5163);
    int _5167 = 1 + _5165;
    float _5169 = support_buffer._m5[_5167].x;
    float _5171 = abs(_5169);
    bool _5173 = _5171 == 1.0;
    if (_5173)
    {
        return _5159;
    }
    float _5175 = float(_5159);
    float _5177 = _5175 / _5171;
    int _5179 = int(_5177);
    return _5179;
}

static inline __attribute__((always_inline))
int _89(thread const int& _5209, thread const int& _5210, constant _10& support_buffer)
{
    float _5213 = as_type<float>(support_buffer._m4);
    int _5215 = _5210 + as_type<int>(_5213);
    int _5217 = 1 + _5215;
    float _5219 = support_buffer._m5[_5217].x;
    bool _5221 = _5219 == 1.0;
    if (_5221)
    {
        return _5209;
    }
    float _5223 = float(_5209);
    float _5225 = _5223 * _5219;
    int _5227 = int(_5225);
    return _5227;
}

static inline __attribute__((always_inline))
void _86(thread int& _5156, thread float4& gl_Position, thread float& gl_PointSize)
{
    gl_PointSize = 1.0;
    _5156 = 0;
}

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1411 = false;
    bool _295 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_46.w;
    float _95 = trunc(_93);
    int _97 = int(_95);
    bool _101 = _97 >= 1;
    float _103 = 0.0;
    float _105 = as_type<float>(_97);
    if (!_101)
    {
        _103 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _107 = _103;
    if (!_101)
    {
        out.m_49.x = 0.0;
    }
    int _109 = 0;
    if (!_101)
    {
        float _111 = _107 * 5.0;
        _109 = as_type<int>(_111);
    }
    int _113 = _109;
    int _115 = _113;
    if (!_101)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2095 = as_type<float>(_113);
        out.gl_Position.z = _2095;
    }
    if (!_101)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _117 = in.m_51.w;
    float _119 = float(_97);
    float _121 = -_117;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _125 = _117 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _127 = isnan(_117);
    bool _129 = _125 || _127;
    bool _131 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _133 = _129 || _131;
    bool _135 = _123 >= _119;
    bool _137 = !_133;
    bool _139 = _135 || _137;
    float _141 = _123;
    if (_139)
    {
        _105 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _143 = _105;
    if (_139)
    {
        out.m_49.x = 0.0;
    }
    if (_139)
    {
        float _145 = _143 * 5.0;
        _115 = as_type<int>(_145);
    }
    int _147 = _115;
    if (_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2159 = as_type<float>(_147);
        out.gl_Position.z = _2159;
    }
    if (_139)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _149 = in.m_53.w;
    float _151 = 1.0 / _119;
    float _153 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _155 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _157 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _159 = _155 || _157;
    bool _161 = isnan(1.0);
    bool _163 = _159 || _161;
    float _165 = in.m_51.x;
    float _167 = in.m_51.y;
    float _169 = in.m_51.z;
    float _171 = in.m_46.x;
    float _173 = in.m_46.y;
    float _175 = in.m_46.z;
    float _177 = 0.0;
    float _179 = _153;
    if (!_163)
    {
        float _181 = _153 * _153;
        float _183 = _181 * 0.5;
        _177 = _183;
    }
    float _185 = _177;
    float _187 = _185;
    if (!_163)
    {
        float _189 = _185 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _187 = _189;
    }
    float _191 = _187;
    bool _193 = !_163;
    float _195 = _191;
    if (!_193)
    {
        float _197 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _199 = log2(_197);
        float _201 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _203 = _201 + 1.0;
        float _205 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _207 = _153 * _199;
        float _209 = 1.0 / _203;
        float _211 = _205 * 0.693147182464599609375;
        float _213 = exp2(_207);
        float _215 = 1.0 / _211;
        float _217 = _213 + (-1.0);
        float _219 = -_217;
        float _221 = fma(_219, _215, _153);
        float _223 = _221 * _209;
        float _225 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _195 = _225;
    }
    float _227 = _195;
    bool _229 = !_163;
    if (!_229)
    {
        float _231 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _233 = log2(_231);
        float _235 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _237 = _235 + 1.0;
        float _239 = 1.0 / _237;
        float _241 = _153 * _233;
        float _243 = exp2(_241);
        float _245 = -_243;
        float _247 = _245 + 1.0;
        float _249 = _247 * _239;
        _179 = _249;
    }
    float _251 = _179;
    bool _253 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _255 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _257 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _259 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _261 = _123 * _151;
    float _263 = fma(_251, _165, _255);
    float _265 = fma(_251, _167, _257);
    float _267 = fma(_251, _169, _259);
    float _269 = fma(_263, _149, _171);
    float _271 = fma(_265, _149, _173);
    float _273 = fma(_267, _149, _175);
    bool _275 = !_253;
    float _293;
    if (!_275)
    {
        float _277 = in.m_55.x;
        float _279 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _281 = _277 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _283 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _285 = _283 * _279;
        float _287 = floor(_285);
        float _289 = -_287;
        float _291 = _285 + _289;
        _293 = _291;
        _295 = true;
    }
    else
    {
        _293 = _261;
    }
    _295 = false;
    float _297 = _293;
    int _299 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _301 = _299;
    int _303 = 0;
    int _305 = _88(_301, _303, (*spvDescriptorSet0.support_buffer));
    float _307 = in.m_57.z;
    float _309 = 0.0 + _261;
    float _311 = precise::clamp(_309, 0.0, 1.0);
    float _313 = trunc(_307);
    int _315 = int(_313);
    int _317 = _305 + (-1);
    float _319 = float(_317);
    float _321 = _311 * _319;
    float _323 = trunc(_321);
    int _325 = int(_323);
    int _327 = _325;
    int _329 = 0;
    int _331 = _89(_327, _329, (*spvDescriptorSet0.support_buffer));
    int _333 = _315;
    int _335 = 0;
    int _337 = _89(_333, _335, (*spvDescriptorSet0.support_buffer));
    float4 _340 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_331, _337)), 0).xyzw;
    float _342 = _340.x;
    float _344 = _340.y;
    float _346 = _340.z;
    float _348 = _340.w;
    float _350 = in.m_55.x;
    float _352 = in.m_55.y;
    float _354 = in.m_55.z;
    float _356 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _358 = in.m_57.y;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _364 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _366 = _364 != 0;
    float _368 = in.m_57.x;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _372 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _374 = _372 != 0;
    float _376 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _382 = 0.0;
    float _384 = _358;
    if (_366)
    {
        float _386 = in.m_55.x;
        _382 = _386;
    }
    float _388 = _382;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _392 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[79].z, _360);
    float _394 = _350 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _396 = fma(_350, (*spvDescriptorSet0.vp_c9)._m0[78].z, _362);
    float _398 = _352 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _400 = -_370;
    float _402 = fma(_394, 2.0, _400);
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _406;
    float _410 = fma(_398, -2.0, _378);
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _414 = 1.0 / _408;
    bool _416 = _352 > 0.5;
    bool _418 = _416 && _374;
    float _420 = _380 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _424 = _412 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _426 = _390 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _428 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[78].w, _404);
    float _430 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[79].x, _392);
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _434 = _297 + _432;
    out.m_59.x = _420;
    out.m_59.y = _424;
    out.m_59.z = _426;
    out.m_59.w = _422;
    bool _436 = _388 > 0.5;
    bool _438 = _436 && _366;
    float _440 = _430 * (-0.15915493667125701904296875);
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _444 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _442;
    float _446 = _420;
    if (_418)
    {
        float _448 = -_358;
        float _450 = _448 + 1.0;
        _384 = _450;
    }
    float _452 = _384;
    float _454 = 0.0;
    if (_366)
    {
        _454 = _368;
    }
    float _456 = _454;
    float _458 = _434 * _414;
    float _460 = _440 * 6.283185482025146484375;
    float _462 = sin(_460);
    float _464 = _376 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _466 = -_123;
    float _468 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[76].x, _402);
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _470;
    float _474 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[76].y, _410);
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _476;
    bool _480 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _482 = isnan(_297);
    bool _484 = _480 || _482;
    bool _486 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _488 = _484 || _486;
    float _490 = float(_488);
    float _492 = fma(_472, _458, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _494 = _356 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _496 = fma(_444, _458, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _498 = fma(_478, _458, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _500 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _502 = isnan(_297);
    bool _504 = _500 || _502;
    bool _506 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _508 = _504 || _506;
    float _510 = float(_508);
    float _512 = fma(_494, _452, -0.5);
    float _514 = _456;
    if (_438)
    {
        float _516 = -_456;
        float _518 = _516 + 1.0;
        _514 = _518;
    }
    float _520 = _514;
    float _522 = in.m_53.x;
    float _524 = in.m_53.y;
    float _526 = in.m_53.z;
    if (!_366)
    {
        _446 = _368;
    }
    float _528 = _446;
    float _530 = -_510;
    float _532 = _530 + 1.0;
    float _534 = _440 * 6.283185482025146484375;
    float _536 = cos(_534);
    float _538 = _528;
    if (_366)
    {
        _538 = _520;
    }
    float _540 = _538;
    float _542 = _462 * _512;
    float _544 = _490 * _532;
    float _546 = -_490;
    float _548 = _546 + 1.0;
    float _550 = fma(_464, _540, -0.5);
    float _552 = _492 * _544;
    float _554 = _496 * _544;
    float _556 = _498 * _544;
    float _558 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].w, _428);
    float _560 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[143].x, _552);
    float _562 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[143].y, _554);
    float _564 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[143].z, _556);
    float _566 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _396);
    float _568 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[144].x, _560);
    float _570 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[144].y, _562);
    float _572 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[144].z, _564);
    float _574 = _536 * _512;
    float _576 = -_542;
    float _578 = fma(_536, _550, _576);
    float _580 = _568 * _522;
    float _582 = _570 * _524;
    float _584 = fma(_462, _550, _574);
    float _586 = fma(_566, _578, _468);
    int _588 = _325 + 1;
    float _590 = _572 * _526;
    float _592 = -_474;
    float _594 = fma(_558, _584, _592);
    float _596 = _586 + 0.5;
    int _598 = min(_317, _588);
    float _600 = _594 + 0.5;
    uint _603 = as_type<uint>(half2(float2(_348, 0.0)));
    uint _605 = extract_bits(_603, 0u, 8u);
    int _607 = int(_605) & 255;
    uint _609 = extract_bits(_603, 8u, 8u);
    int _611 = int(_609) & 255;
    int _613 = _611 << 8;
    int _615 = _607 | _613;
    bool _617 = _615 >= 32768;
    int _619 = _615 + (-1024);
    int _621 = _619;
    if (_617)
    {
        int _623 = ~_615;
        int _625 = _623 + 33792;
        int _627 = _625 + 1;
        _621 = _627;
    }
    int _629 = _621;
    int _631 = _629 + 30719;
    float _633 = float(_631);
    float _635 = fma(_633, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _637 = abs(_635);
    float _639 = -_637;
    float _641 = _639 + 1.0;
    int _643 = as_type<int>(_641) + (-218103808);
    bool _645 = uint(_643) >= 1920991232u;
    bool _647 = !_645;
    if (!_647)
    {
        int _649;
        _86(_649, out.gl_Position, out.gl_PointSize);
    }
    int _651 = _598;
    int _653 = 0;
    int _655 = _89(_651, _653, (*spvDescriptorSet0.support_buffer));
    int _657 = _315;
    int _659 = 0;
    int _661 = _89(_657, _659, (*spvDescriptorSet0.support_buffer));
    float4 _663 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_655, _661)), 0).xyzw;
    float _665 = _663.x;
    float _667 = _663.y;
    float _669 = _663.z;
    float _671 = _663.w;
    float _673 = floor(_321);
    float _675 = -_673;
    float _677 = _321 + _675;
    uint _679 = as_type<uint>(half2(float2(_671, 0.0)));
    float _681 = -_342;
    float _683 = _681 + _665;
    uint _685 = extract_bits(_679, 0u, 8u);
    int _687 = int(_685) & 255;
    uint _689 = extract_bits(_679, 8u, 8u);
    int _691 = int(_689) & 255;
    int _693 = _691 << 8;
    int _695 = _687 | _693;
    float _697 = fma(_677, _683, _342);
    bool _699 = _695 >= 32768;
    int _701 = _695 + (-1024);
    int _703 = _701;
    if (_699)
    {
        int _705 = ~_695;
        int _707 = _705 + 33792;
        int _709 = _707 + 1;
        _703 = _709;
    }
    int _711 = _703;
    int _713 = _711 + 30719;
    float _715 = float(_713);
    float _717 = fma(_715, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _719 = -_346;
    float _721 = _719 + _669;
    float _723 = abs(_717);
    float _725 = -_723;
    float _727 = _725 + 1.0;
    float _729 = fma(_677, _721, _346);
    int _731 = as_type<int>(_727) + (-218103808);
    bool _733 = uint(_731) >= 1920991232u;
    float _735 = -_344;
    float _737 = _735 + _667;
    float _739 = fma(_677, _737, _344);
    bool _741 = !_733;
    if (!_741)
    {
        int _743;
        _86(_743, out.gl_Position, out.gl_PointSize);
    }
    float _745 = in.m_55.x;
    float _747 = in.m_55.y;
    float _749 = in.m_55.z;
    float _751 = _271 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _753 = _271 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _755 = _271 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _757 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _759 = log2(_757);
    float _761 = fma(_269, (*spvDescriptorSet0.vp_c10)._m0[5].x, _751);
    float _763 = fma(_269, (*spvDescriptorSet0.vp_c10)._m0[4].x, _753);
    float _765 = fma(_269, (*spvDescriptorSet0.vp_c10)._m0[6].x, _755);
    float _767 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[5].z, _761);
    float _769 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[4].z, _763);
    float _771 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[6].z, _765);
    float _773 = _767 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _775 = _769 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _777 = _771 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    out.m_61.x = _596;
    out.m_61.y = _600;
    float _779 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _781 = _773 + _779;
    float _783 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _785 = _775 + _783;
    float _787 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _789 = _777 + _787;
    float _791 = _759 * _123;
    float _793 = _781 * _781;
    float _795 = _580 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _797 = _749 * 2.0;
    float _799 = _745 * 2.0;
    float _801 = fma(_785, _785, _793);
    float _803 = _747 * 2.0;
    float _805 = floor(_799);
    float _807 = floor(_797);
    float _809 = fma(_789, _789, _801);
    float _811 = rsqrt(_809);
    bool _813 = _807 > 0.0;
    float _815 = floor(_803);
    bool _817 = _807 >= 0.0;
    bool _819 = isnan(_807);
    bool _821 = _817 || _819;
    bool _823 = isnan(0.0);
    bool _825 = _821 || _823;
    float _827 = _747 + _749;
    int _829 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _831 = _829 != 0;
    int _833 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _835 = _833 != 0;
    int _837 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _839 = _837 != 0;
    float _841 = _827 + (-1.0);
    bool _843 = _805 > 0.0;
    float _845 = _781 * _811;
    int _847 = _825 ? 0 : 1;
    float _849 = fma(_841, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _851 = _781 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _853 = _805 >= 0.0;
    bool _855 = isnan(_805);
    bool _857 = _853 || _855;
    bool _859 = isnan(0.0);
    bool _861 = _857 || _859;
    float _863 = _785 * _811;
    int _865 = ~_847;
    int _867 = _865 + 1;
    int _869 = _867 + 1;
    float _871 = fma(_785, (*spvDescriptorSet0.vp_c8)._m0[28].x, _851);
    int _873 = _861 ? 0 : 1;
    float _875 = -_845;
    float _877 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[18].w, _781);
    int _879 = _869;
    if (!_813)
    {
        int _881 = ~_847;
        int _883 = _881 + 1;
        _879 = _883;
    }
    int _885 = _879;
    float _887 = -_863;
    float _889 = fma(_887, (*spvDescriptorSet0.vp_c9)._m0[18].w, _785);
    bool _891 = _815 > 0.0;
    float _893 = _789 * _811;
    bool _895 = _815 >= 0.0;
    bool _897 = isnan(_815);
    bool _899 = _895 || _897;
    bool _901 = isnan(0.0);
    bool _903 = _899 || _901;
    float _905 = fma(_789, (*spvDescriptorSet0.vp_c8)._m0[28].z, _871);
    int _907 = ~_873;
    int _909 = _907 + 1;
    int _911 = _909 + 1;
    float _913 = _877 * _877;
    float _915 = exp2(_791);
    int _917 = _911;
    if (!_843)
    {
        int _919 = ~_873;
        int _921 = _919 + 1;
        _917 = _921;
    }
    int _923 = _917;
    float _925 = -_893;
    float _927 = fma(_925, (*spvDescriptorSet0.vp_c9)._m0[18].w, _789);
    float _929 = fma(_889, _889, _913);
    bool _931 = _905 >= 0.0;
    bool _933 = !_831;
    int _935 = _933 ? 0 : 1;
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _939 = 1.0 + _937;
    float _941 = fma(_927, _927, _929);
    bool _943 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _945 = isnan(1.0);
    bool _947 = _943 || _945;
    bool _949 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _951 = _947 || _949;
    float _953 = _747 + _745;
    float _955 = 1.0 / _939;
    int _957 = abs(_935);
    float _959 = in.m_63.x;
    float _961 = in.m_63.y;
    float _963 = in.m_63.z;
    bool _965 = !_835;
    int _967 = _965 ? 0 : 1;
    float _969 = -_915;
    float _971 = _969 + 1.0;
    bool _973 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _975 = isnan(0.0);
    bool _977 = _973 || _975;
    bool _979 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _981 = _977 || _979;
    float _983 = _953 + (-1.0);
    float _985 = float(_885);
    float _987 = sqrt(_941);
    float _989 = float(_957);
    float _991 = fma(_983, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _993 = abs(_967);
    int _995 = as_type<int>(_991);
    if (_931)
    {
        out.m_49.x = 0.0;
    }
    float _997 = _981 ? _971 : 0.0;
    float _999 = _989 * _985;
    float _1001 = float(_993);
    float _1003 = _582 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1005 = float(_923);
    float _1007 = _997;
    if (_951)
    {
        float _1009 = _997 * _955;
        _141 = _1009;
    }
    float _1011 = _141;
    float _1013 = _999 * (-2.0);
    if (_931)
    {
        _1007 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1015 = _1007;
    float _1017 = _1001 * _1005;
    float _1019 = _590 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1021 = _811 * _987;
    float _1023 = fma(_991, _1013, _991);
    if (_931)
    {
        float _1025 = _1015 * 5.0;
        _995 = as_type<int>(_1025);
    }
    int _1027 = _995;
    float _1029 = _795 * _1021;
    float _1031 = _1003 * _1021;
    float _1033 = _1019 * _1021;
    int _1035 = _903 ? 0 : 1;
    if (_931)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3493 = as_type<float>(_1027);
        out.gl_Position.z = _3493;
    }
    float _1037 = fma(_1013, _959, _959);
    float _1039 = _745 + (-0.5);
    int _1041 = ~_1035;
    int _1043 = _1041 + 1;
    int _1045 = _1043 + 1;
    out.m_65.x = _1029;
    out.m_65.y = _1031;
    out.m_65.z = _1033;
    int _1047 = _1045;
    float _1049 = _963;
    if (!_891)
    {
        int _1051 = ~_1035;
        int _1053 = _1051 + 1;
        _1047 = _1053;
    }
    int _1055 = _1047;
    bool _1057 = !_839;
    int _1059 = _1057 ? 0 : 1;
    if (_931)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1061 = -_845;
    float _1063 = fma(_1061, (*spvDescriptorSet0.vp_c9)._m0[18].w, _773);
    float _1065 = -_863;
    float _1067 = fma(_1065, (*spvDescriptorSet0.vp_c9)._m0[18].w, _775);
    float _1069 = fma(_1039, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1037);
    float _1071 = _1017 * (-2.0);
    float _1073 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1075 = _1063 + _1073;
    int _1077 = abs(_1059);
    float _1079 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1081 = _1067 + _1079;
    float _1083 = fma(_849, _1071, _849);
    float _1085 = _1075 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1087 = fma(_1071, _961, _961);
    float _1089 = fma(_1023, _1011, _1069);
    float _1091 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1085);
    float _1093 = -_893;
    float _1095 = fma(_1093, (*spvDescriptorSet0.vp_c9)._m0[18].w, _777);
    float _1097 = _747 + (-0.5);
    float _1099 = float(_1077);
    float _1101 = _1089 * 0.15915493667125701904296875;
    float _1103 = float(_1055);
    float _1105 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1107 = _1095 + _1105;
    float _1109 = fma(_1097, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1087);
    float _1111 = _749 + _745;
    float _1113 = _1099 * _1103;
    float _1115 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1091);
    float _1117 = fma(_1083, _1011, _1109);
    float _1119 = _1111 + (-1.0);
    float _1121 = _1113 * (-2.0);
    float _1123 = _749 + (-0.5);
    bool _1125 = _1115 >= 0.0;
    float _1127 = _1117 * 0.15915493667125701904296875;
    float _1129 = fma(_1119, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1131 = fma(_1121, _963, _963);
    float _1133 = _1101 * 6.283185482025146484375;
    float _1135 = sin(_1133);
    float _1137 = fma(_1129, _1121, _1129);
    float _1139 = fma(_1123, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1131);
    float _1141 = fma(_1137, _1011, _1139);
    float _1143 = _1101 * 6.283185482025146484375;
    float _1145 = cos(_1143);
    if (_1125)
    {
        _1049 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1147 = _1049;
    int _1149 = as_type<int>(_1147);
    if (_1125)
    {
        out.m_49.x = 0.0;
    }
    float _1151 = _1141 * 0.15915493667125701904296875;
    if (_1125)
    {
        float _1153 = _1147 * 5.0;
        _1149 = as_type<int>(_1153);
    }
    int _1155 = _1149;
    float _1157 = _1127 * 6.283185482025146484375;
    float _1159 = sin(_1157);
    if (_1125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3704 = as_type<float>(_1155);
        out.gl_Position.z = _3704;
    }
    float _1161 = _1127 * 6.283185482025146484375;
    float _1163 = cos(_1161);
    float _1165 = _1151 * 6.283185482025146484375;
    float _1167 = sin(_1165);
    if (_1125)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1169 = _1151 * 6.283185482025146484375;
    float _1171 = cos(_1169);
    float _1173 = _1135 * _1159;
    float _1175 = _1145 * _1163;
    float _1177 = _1135 * _1163;
    float _1179 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _739);
    float _1181 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _697);
    float _1183 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _729);
    float _1185 = fma(_1167, _1175, _1173);
    float _1187 = _1031 * _1179;
    float _1189 = _1029 * _1181;
    float _1191 = _1145 * _1159;
    float _1193 = _1033 * _1183;
    float _1195 = fma(_1167, _1173, _1175);
    float _1197 = _1171 * _1187;
    float _1199 = _1159 * _1171;
    float _1201 = _1163 * _1171;
    float _1203 = -_1187;
    float _1205 = _1167 * _1203;
    float _1207 = _1145 * _1197;
    float _1209 = -_1177;
    float _1211 = fma(_1167, _1191, _1209);
    float _1213 = -_1191;
    float _1215 = fma(_1167, _1177, _1213);
    float _1217 = _1135 * _1197;
    float _1219 = fma(_1185, _1189, _1207);
    float _1221 = fma(_1201, _1189, _1205);
    float _1223 = fma(_1215, _1189, _1217);
    float _1225 = fma(_1211, _1193, _1219);
    float _1227 = fma(_1199, _1193, _1221);
    float _1229 = fma(_1195, _1193, _1223);
    float _1231 = _1225 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1233 = _1225 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1235 = _1225 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1237 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1231);
    float _1239 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1233);
    float _1241 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1235);
    float _1243 = fma(_1229, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1237);
    float _1245 = fma(_1229, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1239);
    float _1247 = fma(_1229, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1241);
    float _1249 = _1243 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1251 = _1245 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1253 = _1247 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1255 = _775 + _1249;
    float _1257 = _777 + _1251;
    float _1259 = _773 + _1253;
    float _1261 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1263 = _1255 + _1261;
    float _1265 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1267 = _1257 + _1265;
    float _1269 = _1263 * _1263;
    float _1271 = _1267 * _1267;
    float _1273 = _1269 + _1271;
    float _1275 = sqrt(_1273);
    bool _1277 = _1275 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1279 = _1229;
    float _1281 = _1253;
    float _1283 = _1269;
    float _1285 = _1271;
    float _1287 = _1255;
    float _1289 = _1267;
    if (!_1277)
    {
        _1279 = _1257;
    }
    float _1291 = _1279;
    float _1293 = _1291;
    if (!_1277)
    {
        _1281 = _1259;
    }
    float _1295 = _1281;
    bool _1297 = !_1277;
    float _1299 = _1295;
    if (!_1297)
    {
        float _1301 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1303 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1305 = _1275 + _1303;
        float _1307 = _1259 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1309 = rsqrt(_1273);
        float _1311 = _1305 * _1301;
        float _1313 = _1311 * 0.15915493667125701904296875;
        float _1315 = _1313 * 6.283185482025146484375;
        float _1317 = sin(_1315);
        float _1319 = _1313 * 6.283185482025146484375;
        float _1321 = cos(_1319);
        float _1323 = fma(_1317, _1307, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1325 = _1309 * _1323;
        float _1327 = _1321 + (-1.0);
        float _1329 = _1327 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1331 = _1263 * _1325;
        float _1333 = _1267 * _1325;
        float _1335 = fma(_1259, _1321, _1329);
        float _1337 = _1331 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1339 = _1333 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1341 = _1331 * _1331;
        float _1343 = _1333 * _1333;
        _1299 = _1335;
        _1283 = _1341;
        _1285 = _1343;
        _1287 = _1337;
        _1293 = _1339;
    }
    float _1345 = _1299;
    float _1347 = _1283;
    float _1349 = _1285;
    float _1351 = _1287;
    float _1353 = _1293;
    float _1355 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1357 = _1345 + _1355;
    float _1359 = fma(_1357, _1357, _1347);
    float _1361 = _1359 + _1349;
    float _1363 = sqrt(_1361);
    bool _1365 = _1363 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1367 = isnan(_1363);
    bool _1369 = _1365 || _1367;
    bool _1371 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1373 = _1369 || _1371;
    float _1375 = _1347;
    if (!_1373)
    {
        _1375 = 1.0;
    }
    float _1377 = _1375;
    bool _1379 = !_1373;
    float _1381 = _1377;
    if (!_1379)
    {
        bool _1383 = _1363 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1385 = isnan(_1363);
        bool _1387 = _1383 || _1385;
        bool _1389 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1391 = _1387 || _1389;
        if (!_1391)
        {
            float _1393 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1395 = _1363 + _1393;
            float _1397 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1399 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1397;
            float _1401 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1403 = _1401 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1405 = 1.0 / _1399;
            float _1407 = _1395 * _1405;
            float _1409 = fma(_1407, _1403, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1381 = _1409;
            _1411 = true;
        }
        else
        {
            bool _1413 = _1363 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1415 = isnan(_1363);
            bool _1417 = _1413 || _1415;
            bool _1419 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1421 = _1417 || _1419;
            if (!_1421)
            {
                float _1423 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1425 = _1363 + _1423;
                float _1427 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1429 = _1427 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1431 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1433 = _1431 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1435 = 1.0 / _1429;
                float _1437 = _1425 * _1435;
                float _1439 = fma(_1437, _1433, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1381 = _1439;
                _1411 = true;
            }
            else
            {
                _1381 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1411 = false;
    float _1441 = _1381;
    float _1443 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1445 = _1345 + _1443;
    float _1447 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1449 = _1351 + _1447;
    float _1451 = fma(_1445, _1441, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1453 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1455 = _1353 + _1453;
    float _1457 = fma(_1449, _1441, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1459 = -_845;
    float _1461 = fma(_1459, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1451);
    float _1463 = fma(_1455, _1441, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1465 = -_863;
    float _1467 = fma(_1465, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1457);
    float _1469 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1471 = _1461 + _1469;
    float _1473 = -_893;
    float _1475 = fma(_1473, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1463);
    float _1477 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1479 = _1467 + _1477;
    float _1481 = _1471 * _1471;
    float _1483 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1485 = _1475 + _1483;
    float _1487 = fma(_1479, _1479, _1481);
    float _1489 = fma(_1485, _1485, _1487);
    float _1491 = rsqrt(_1489);
    float _1493 = _1491 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1495 = _1479 * _1493;
    float _1497 = _1485 * _1493;
    float _1499 = _1495 * _1495;
    float _1501 = _1497 * _1497;
    float _1503 = _1499 + _1501;
    float _1505 = sqrt(_1503);
    bool _1507 = _1505 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1509 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1511 = _1505 + _1509;
    float _1513 = _1273;
    float _1515 = _1503;
    float _1517 = _1511;
    float _1519 = _1471;
    float _1521 = _1493;
    float _1523 = _1495;
    if (_1507)
    {
        float _1525 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1513 = _1525;
    }
    float _1527 = _1513;
    if (_1507)
    {
        float _1529 = rsqrt(_1503);
        _1515 = _1529;
    }
    float _1531 = _1515;
    float _1533 = _1527;
    float _1535 = _1531;
    if (_1507)
    {
        float _1537 = _1511 * _1527;
        _1517 = _1537;
    }
    float _1539 = _1517;
    if (_1507)
    {
        float _1541 = _1539 * 0.15915493667125701904296875;
        _1289 = _1541;
    }
    float _1543 = _1289;
    float _1545 = _1485;
    if (_1507)
    {
        float _1547 = _1543 * 6.283185482025146484375;
        float _1549 = sin(_1547);
        _1545 = _1549;
    }
    float _1551 = _1545;
    float _1553 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1555 = precise::max(0.0, _1553);
    float _1557 = _1363;
    float _1559 = _1555;
    if (_1507)
    {
        float _1561 = _1543 * 6.283185482025146484375;
        float _1563 = cos(_1561);
        _1557 = _1563;
    }
    float _1565 = _1557;
    float _1567 = -_1493;
    float _1569 = -_1555;
    float _1571 = fma(_1471, _1567, _1569);
    if (_1507)
    {
        float _1573 = _1571 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1519 = _1573;
    }
    float _1575 = _1519;
    float _1577 = sqrt(_1489);
    float _1579 = _1551;
    float _1581 = _1575;
    if (_1507)
    {
        float _1583 = fma(_1551, _1575, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1579 = _1583;
    }
    float _1585 = _1579;
    float _1587 = _1585;
    if (!_1507)
    {
        _1581 = _1497;
    }
    float _1589 = _1581;
    float _1591 = _1589;
    if (_1507)
    {
        float _1593 = _1565 + (-1.0);
        _1559 = _1593;
    }
    float _1595 = _1559;
    float _1597 = _1595;
    if (_1507)
    {
        float _1599 = _1531 * _1585;
        _1521 = _1599;
    }
    float _1601 = _1521;
    if (!_1507)
    {
        _1587 = _1571;
    }
    float _1603 = _1587;
    float _1605 = _1603;
    if (_1507)
    {
        float _1607 = _1595 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1533 = _1607;
    }
    float _1609 = _1533;
    if (_1507)
    {
        float _1611 = _1495 * _1601;
        _1523 = _1611;
    }
    float _1613 = _1523;
    if (!_1507)
    {
        _1535 = _1499;
    }
    float _1615 = _1535;
    float _1617 = _1615;
    if (_1507)
    {
        float _1619 = _1497 * _1601;
        _1591 = _1619;
    }
    float _1621 = _1591;
    if (_1507)
    {
        float _1623 = fma(_1571, _1565, _1609);
        _1605 = _1623;
    }
    float _1625 = _1605;
    if (_1507)
    {
        float _1627 = _1613 * _1613;
        _1617 = _1627;
    }
    float _1629 = _1617;
    if (!_1507)
    {
        _1597 = _1501;
    }
    float _1631 = _1597;
    float _1633 = _1631;
    if (_1507)
    {
        float _1635 = _1621 * _1621;
        _1633 = _1635;
    }
    float _1637 = _1633;
    float _1639 = fma(_1625, _1625, _1629);
    float _1641 = _1461 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1643 = _1639 + _1637;
    float _1645 = _1461 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1647 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1649 = fma(_1577, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1647);
    float _1651 = precise::clamp(_1649, 0.0, 1.0);
    float _1653 = fma(_1467, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1641);
    float _1655 = rsqrt(_1643);
    float _1657 = fma(_1467, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1645);
    float _1659 = _1461 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1661 = -_1651;
    float _1663 = _1661 + 1.0;
    float _1665 = _1461 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1667 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1657);
    float _1669 = fma(_1467, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1659);
    float _1671 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1673 = fma(_1467, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1665);
    float _1675 = _1667 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1677 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1669);
    float _1679 = abs(_1663);
    float _1681 = log2(_1679);
    float _1683 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1673);
    float _1685 = _1675 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1687 = _1677 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1689 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1653);
    float _1691 = _1655 * _1613;
    float _1693 = _1655 * _1625;
    float _1695 = _1683 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1697 = _1687 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1699 = _1691 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1701 = _1655 * _1621;
    float _1703 = -_1685;
    float _1705 = fma(_1703, _1671, 1.0);
    float _1707 = fma(_1695, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1697);
    float _1709 = -_1699;
    float _1711 = fma(_1693, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1709);
    float _1713 = _1689 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1715 = _1687 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1717 = _1681 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1719 = -_1701;
    float _1721 = fma(_1719, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1711);
    float _1723 = fma(_1675, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1707);
    float _1725 = log2(_1705);
    float _1727 = _1687 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1729 = fma(_1721, -0.5, 0.5);
    float _1731 = fma(_1713, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1723);
    float _1733 = fma(_1721, 0.5, 0.5);
    float _1735 = fma(_1695, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1727);
    float _1737 = fma(_1695, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1715);
    float _1739 = _1693 + 1.0;
    float _1741 = exp2(_1717);
    float _1743 = fma(_1733, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1745 = fma(_1675, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1735);
    float _1747 = fma(_1675, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1737);
    float _1749 = fma(_1733, _1743, -0.212114393711090087890625);
    float _1751 = fma(_1713, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1745);
    float _1753 = 1.0 / _1731;
    float _1755 = fma(_1733, _1749, 1.570728778839111328125);
    float _1757 = _1725 * 0.693147182464599609375;
    float _1759 = _1757 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1761 = sqrt(_1729);
    float _1763 = -_1693;
    float _1765 = fma(_1741, _1739, _1763);
    float _1767 = fma(_1713, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1747);
    float _1769 = fma(_1765, 0.5, 0.5);
    float _1771 = _1751 * _1753;
    float _1773 = _1767 * _1753;
    float _1775 = fma(_1771, 0.5, 0.5);
    float _1777 = fma(_1773, -0.5, 0.5);
    float _1779 = _1761 * 0.636619746685028076171875;
    float _1781 = -_1755;
    float _1783 = fma(_1779, _1781, 1.0);
    float3 _4733 = float3(_1775, _1777, _1759);
    float _1785 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4733, float3(0.0), isnan(_4733)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4733, float3(0.0), isnan(_4733)), level(0.0)).x;
    float3 _4744 = float3(_1775, _1777, _1759);
    float4 _1787 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4744, float3(0.0), isnan(_4744)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4744, float3(0.0), isnan(_4744)), level(0.0)).xyzw;
    float _1789 = _1787.x;
    float _1791 = _1787.y;
    float _1793 = _1787.z;
    float _1795 = _1787.w;
    float2 _4760 = float2(_1783, _1769);
    float3 _1799 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4760, float2(0.0), isnan(_4760)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4760, float2(0.0), isnan(_4760)), level(0.0)).xyz;
    float _1801 = _1799.x;
    float _1803 = _1799.y;
    float _1805 = _1799.z;
    float _1807 = _1063 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    out.m_67.x = _1067;
    out.m_67.y = _1063;
    out.m_67.z = _1095;
    float _1809 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1807);
    float _1811 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1809);
    float _1813 = _1063 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1815 = _1811 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1817 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1813);
    float _1819 = 1.0 / _1815;
    float _1821 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1817);
    float _1823 = _1821 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1825 = _1823 + _1815;
    float _1827 = _1825 * _1819;
    float _1829 = _1827 * 0.5;
    float _1831 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1833 = fma(_1829, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1831);
    bool _1835 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1837 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1839 = _1835 || _1837;
    bool _1841 = isnan(0.5);
    bool _1843 = _1839 || _1841;
    float _1845 = _1687 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1847 = _1681 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1849 = 1.0 / _1833;
    float _1851 = fma(_1695, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1845);
    float _1853 = fma(_1675, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1851);
    float _1855 = exp2(_1847);
    float _1857 = fma(_1713, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1853);
    float _1859 = _1851;
    float _1861 = _1675;
    if (_1843)
    {
        _1859 = 1.0;
    }
    float _1863 = _1859;
    float _1865 = _1863;
    if (_1843)
    {
        _1861 = 1.0;
    }
    float _1867 = _1861;
    float _1869 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1871 = _1849 * _1869;
    float _1873 = _1867;
    if (!_1843)
    {
        float _1875 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1877 = _1875 * 0.15915493667125701904296875;
        float _1879 = _1877 * 6.283185482025146484375;
        float _1881 = cos(_1879);
        float _1883 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1885 = _1883 * 0.15915493667125701904296875;
        float _1887 = _1877 * 6.283185482025146484375;
        float _1889 = sin(_1887);
        float _1891 = 1.0 / _1881;
        float _1893 = _1885 * 6.283185482025146484375;
        float _1895 = cos(_1893);
        float _1897 = _1889 * _1891;
        float _1899 = _1885 * 6.283185482025146484375;
        float _1901 = sin(_1899);
        float _1903 = _1895 * _1897;
        float _1905 = 1.0 / _1903;
        float _1907 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1909 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1907;
        float _1911 = 1.0 / _1909;
        float _1913 = _1901 * _1905;
        float _1915 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1917 = fma(_1871, _1913, _1915);
        float _1919 = _1917 * _1911;
        float _1921 = precise::clamp(_1919, 0.0, 1.0);
        _1865 = _1921;
    }
    float _1923 = _1865;
    if (!_1843)
    {
        float _1925 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1927 = _1925 * 0.15915493667125701904296875;
        float _1929 = _1927 * 6.283185482025146484375;
        float _1931 = cos(_1929);
        float _1933 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1935 = _1933 * 0.15915493667125701904296875;
        float _1937 = _1927 * 6.283185482025146484375;
        float _1939 = sin(_1937);
        float _1941 = 1.0 / _1931;
        float _1943 = _1935 * 6.283185482025146484375;
        float _1945 = cos(_1943);
        float _1947 = _1939 * _1941;
        float _1949 = _1935 * 6.283185482025146484375;
        float _1951 = sin(_1949);
        float _1953 = _1945 * _1947;
        float _1955 = 1.0 / _1953;
        float _1957 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1959 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1957;
        float _1961 = 1.0 / _1959;
        float _1963 = _1951 * _1955;
        float _1965 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1967 = fma(_1871, _1963, _1965);
        float _1969 = _1967 * _1961;
        float _1971 = precise::clamp(_1969, 0.0, 1.0);
        float _1973 = -_1971;
        float _1975 = _1973 + 1.0;
        _1873 = _1975;
    }
    float _1977 = _1873;
    float _1979 = -_1855;
    float _1981 = _1979 + 1.0;
    bool _1983 = _1923 > 0.0;
    bool _1985 = isnan(_1923);
    bool _1987 = _1983 || _1985;
    bool _1989 = isnan(0.0);
    bool _1991 = _1987 || _1989;
    float _1993 = _1923 * _1977;
    float _1995 = _1857 + _1731;
    float _1997 = _1981 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _1999 = _1977 <= 0.0;
    bool _2001 = !_1991;
    bool _2003 = _1999 || _2001;
    float _2005 = _1751 + _1731;
    float _2007 = _1731 * 0.5;
    float _2009 = _1997 * _1785;
    float _2011 = -_1997;
    float _2013 = _2011 + 1.0;
    float _2015 = _1993 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_69.x = _1467;
    out.m_69.y = _1461;
    out.m_69.z = _1475;
    float _2017 = _1795 * _2009;
    float _2019 = _1805 * _2009;
    float _2021 = _1995 * 0.5;
    float _2023 = fma(_1801, _2017, _1789);
    float _2025 = fma(_1803, _2017, _1791);
    float _2027 = _1795 * _2013;
    float _2029 = _2005 * 0.5;
    float _2031 = fma(_1767, -0.5, _2007);
    float _2033 = _2015 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2035 = fma(_1795, _2019, _1793);
    out.gl_Position.x = _1751;
    out.gl_Position.y = _1767;
    out.gl_Position.z = _1857;
    out.gl_Position.w = _1731;
    out.m_71.x = _2029;
    out.m_71.y = _2031;
    out.m_71.z = _2021;
    out.m_71.w = _1731;
    out.m_49.x = _2033;
    out.m_73.x = _2023;
    out.m_73.y = _2025;
    out.m_73.z = _2035;
    out.m_73.w = _2027;
    if (!_2003)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _2037 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2037;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1411 = false;
    bool _295 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_46.w;
    float _95 = trunc(_93);
    int _97 = int(_95);
    bool _101 = _97 >= 1;
    float _103 = 0.0;
    float _105 = as_type<float>(_97);
    if (!_101)
    {
        _103 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _107 = _103;
    if (!_101)
    {
        out.m_49.x = 0.0;
    }
    int _109 = 0;
    if (!_101)
    {
        float _111 = _107 * 5.0;
        _109 = as_type<int>(_111);
    }
    int _113 = _109;
    int _115 = _113;
    if (!_101)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2095 = as_type<float>(_113);
        out.gl_Position.z = _2095;
    }
    if (!_101)
    {
        return out;
    }
    float _117 = in.m_51.w;
    float _119 = float(_97);
    float _121 = -_117;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _125 = _117 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _127 = isnan(_117);
    bool _129 = _125 || _127;
    bool _131 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _133 = _129 || _131;
    bool _135 = _123 >= _119;
    bool _137 = !_133;
    bool _139 = _135 || _137;
    float _141 = _123;
    if (_139)
    {
        _105 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _143 = _105;
    if (_139)
    {
        out.m_49.x = 0.0;
    }
    if (_139)
    {
        float _145 = _143 * 5.0;
        _115 = as_type<int>(_145);
    }
    int _147 = _115;
    if (_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2159 = as_type<float>(_147);
        out.gl_Position.z = _2159;
    }
    if (_139)
    {
        return out;
    }
    float _149 = in.m_53.w;
    float _151 = 1.0 / _119;
    float _153 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _155 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _157 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _159 = _155 || _157;
    bool _161 = isnan(1.0);
    bool _163 = _159 || _161;
    float _165 = in.m_51.x;
    float _167 = in.m_51.y;
    float _169 = in.m_51.z;
    float _171 = in.m_46.x;
    float _173 = in.m_46.y;
    float _175 = in.m_46.z;
    float _177 = 0.0;
    float _179 = _153;
    if (!_163)
    {
        float _181 = _153 * _153;
        float _183 = _181 * 0.5;
        _177 = _183;
    }
    float _185 = _177;
    float _187 = _185;
    if (!_163)
    {
        float _189 = _185 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _187 = _189;
    }
    float _191 = _187;
    bool _193 = !_163;
    float _195 = _191;
    if (!_193)
    {
        float _197 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _199 = log2(_197);
        float _201 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _203 = _201 + 1.0;
        float _205 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _207 = _153 * _199;
        float _209 = 1.0 / _203;
        float _211 = _205 * 0.693147182464599609375;
        float _213 = exp2(_207);
        float _215 = 1.0 / _211;
        float _217 = _213 + (-1.0);
        float _219 = -_217;
        float _221 = fma(_219, _215, _153);
        float _223 = _221 * _209;
        float _225 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _195 = _225;
    }
    float _227 = _195;
    bool _229 = !_163;
    if (!_229)
    {
        float _231 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _233 = log2(_231);
        float _235 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _237 = _235 + 1.0;
        float _239 = 1.0 / _237;
        float _241 = _153 * _233;
        float _243 = exp2(_241);
        float _245 = -_243;
        float _247 = _245 + 1.0;
        float _249 = _247 * _239;
        _179 = _249;
    }
    float _251 = _179;
    bool _253 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _255 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _257 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _259 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _261 = _123 * _151;
    float _263 = fma(_251, _165, _255);
    float _265 = fma(_251, _167, _257);
    float _267 = fma(_251, _169, _259);
    float _269 = fma(_263, _149, _171);
    float _271 = fma(_265, _149, _173);
    float _273 = fma(_267, _149, _175);
    bool _275 = !_253;
    float _293;
    if (!_275)
    {
        float _277 = in.m_55.x;
        float _279 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _281 = _277 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _283 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _285 = _283 * _279;
        float _287 = floor(_285);
        float _289 = -_287;
        float _291 = _285 + _289;
        _293 = _291;
        _295 = true;
    }
    else
    {
        _293 = _261;
    }
    _295 = false;
    float _297 = _293;
    int _299 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _301 = _299;
    int _303 = 0;
    int _305 = _88(_301, _303, (*spvDescriptorSet0.support_buffer));
    float _307 = in.m_57.z;
    float _309 = 0.0 + _261;
    float _311 = precise::clamp(_309, 0.0, 1.0);
    float _313 = trunc(_307);
    int _315 = int(_313);
    int _317 = _305 + (-1);
    float _319 = float(_317);
    float _321 = _311 * _319;
    float _323 = trunc(_321);
    int _325 = int(_323);
    int _327 = _325;
    int _329 = 0;
    int _331 = _89(_327, _329, (*spvDescriptorSet0.support_buffer));
    int _333 = _315;
    int _335 = 0;
    int _337 = _89(_333, _335, (*spvDescriptorSet0.support_buffer));
    float4 _340 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_331, _337)), 0).xyzw;
    float _342 = _340.x;
    float _344 = _340.y;
    float _346 = _340.z;
    float _348 = _340.w;
    float _350 = in.m_55.x;
    float _352 = in.m_55.y;
    float _354 = in.m_55.z;
    float _356 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _358 = in.m_57.y;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _364 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _366 = _364 != 0;
    float _368 = in.m_57.x;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _372 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _374 = _372 != 0;
    float _376 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _382 = 0.0;
    float _384 = _358;
    if (_366)
    {
        float _386 = in.m_55.x;
        _382 = _386;
    }
    float _388 = _382;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _392 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[79].z, _360);
    float _394 = _350 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _396 = fma(_350, (*spvDescriptorSet0.vp_c9)._m0[78].z, _362);
    float _398 = _352 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _400 = -_370;
    float _402 = fma(_394, 2.0, _400);
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _406;
    float _410 = fma(_398, -2.0, _378);
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _414 = 1.0 / _408;
    bool _416 = _352 > 0.5;
    bool _418 = _416 && _374;
    float _420 = _380 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _424 = _412 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _426 = _390 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _428 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[78].w, _404);
    float _430 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[79].x, _392);
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _434 = _297 + _432;
    out.m_59.x = _420;
    out.m_59.y = _424;
    out.m_59.z = _426;
    out.m_59.w = _422;
    bool _436 = _388 > 0.5;
    bool _438 = _436 && _366;
    float _440 = _430 * (-0.15915493667125701904296875);
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _444 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _442;
    float _446 = _420;
    if (_418)
    {
        float _448 = -_358;
        float _450 = _448 + 1.0;
        _384 = _450;
    }
    float _452 = _384;
    float _454 = 0.0;
    if (_366)
    {
        _454 = _368;
    }
    float _456 = _454;
    float _458 = _434 * _414;
    float _460 = _440 * 6.283185482025146484375;
    float _462 = sin(_460);
    float _464 = _376 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _466 = -_123;
    float _468 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[76].x, _402);
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _470;
    float _474 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[76].y, _410);
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _476;
    bool _480 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _482 = isnan(_297);
    bool _484 = _480 || _482;
    bool _486 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _488 = _484 || _486;
    float _490 = float(_488);
    float _492 = fma(_472, _458, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _494 = _356 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _496 = fma(_444, _458, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _498 = fma(_478, _458, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _500 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _502 = isnan(_297);
    bool _504 = _500 || _502;
    bool _506 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _508 = _504 || _506;
    float _510 = float(_508);
    float _512 = fma(_494, _452, -0.5);
    float _514 = _456;
    if (_438)
    {
        float _516 = -_456;
        float _518 = _516 + 1.0;
        _514 = _518;
    }
    float _520 = _514;
    float _522 = in.m_53.x;
    float _524 = in.m_53.y;
    float _526 = in.m_53.z;
    if (!_366)
    {
        _446 = _368;
    }
    float _528 = _446;
    float _530 = -_510;
    float _532 = _530 + 1.0;
    float _534 = _440 * 6.283185482025146484375;
    float _536 = cos(_534);
    float _538 = _528;
    if (_366)
    {
        _538 = _520;
    }
    float _540 = _538;
    float _542 = _462 * _512;
    float _544 = _490 * _532;
    float _546 = -_490;
    float _548 = _546 + 1.0;
    float _550 = fma(_464, _540, -0.5);
    float _552 = _492 * _544;
    float _554 = _496 * _544;
    float _556 = _498 * _544;
    float _558 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].w, _428);
    float _560 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[143].x, _552);
    float _562 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[143].y, _554);
    float _564 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[143].z, _556);
    float _566 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _396);
    float _568 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[144].x, _560);
    float _570 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[144].y, _562);
    float _572 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[144].z, _564);
    float _574 = _536 * _512;
    float _576 = -_542;
    float _578 = fma(_536, _550, _576);
    float _580 = _568 * _522;
    float _582 = _570 * _524;
    float _584 = fma(_462, _550, _574);
    float _586 = fma(_566, _578, _468);
    int _588 = _325 + 1;
    float _590 = _572 * _526;
    float _592 = -_474;
    float _594 = fma(_558, _584, _592);
    float _596 = _586 + 0.5;
    int _598 = min(_317, _588);
    float _600 = _594 + 0.5;
    uint _603 = as_type<uint>(half2(float2(_348, 0.0)));
    uint _605 = extract_bits(_603, 0u, 8u);
    int _607 = int(_605) & 255;
    uint _609 = extract_bits(_603, 8u, 8u);
    int _611 = int(_609) & 255;
    int _613 = _611 << 8;
    int _615 = _607 | _613;
    bool _617 = _615 >= 32768;
    int _619 = _615 + (-1024);
    int _621 = _619;
    if (_617)
    {
        int _623 = ~_615;
        int _625 = _623 + 33792;
        int _627 = _625 + 1;
        _621 = _627;
    }
    int _629 = _621;
    int _631 = _629 + 30719;
    float _633 = float(_631);
    float _635 = fma(_633, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _637 = abs(_635);
    float _639 = -_637;
    float _641 = _639 + 1.0;
    int _643 = as_type<int>(_641) + (-218103808);
    bool _645 = uint(_643) >= 1920991232u;
    bool _647 = !_645;
    if (!_647)
    {
        int _649;
        _86(_649, out.gl_Position, out.gl_PointSize);
    }
    int _651 = _598;
    int _653 = 0;
    int _655 = _89(_651, _653, (*spvDescriptorSet0.support_buffer));
    int _657 = _315;
    int _659 = 0;
    int _661 = _89(_657, _659, (*spvDescriptorSet0.support_buffer));
    float4 _663 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_655, _661)), 0).xyzw;
    float _665 = _663.x;
    float _667 = _663.y;
    float _669 = _663.z;
    float _671 = _663.w;
    float _673 = floor(_321);
    float _675 = -_673;
    float _677 = _321 + _675;
    uint _679 = as_type<uint>(half2(float2(_671, 0.0)));
    float _681 = -_342;
    float _683 = _681 + _665;
    uint _685 = extract_bits(_679, 0u, 8u);
    int _687 = int(_685) & 255;
    uint _689 = extract_bits(_679, 8u, 8u);
    int _691 = int(_689) & 255;
    int _693 = _691 << 8;
    int _695 = _687 | _693;
    float _697 = fma(_677, _683, _342);
    bool _699 = _695 >= 32768;
    int _701 = _695 + (-1024);
    int _703 = _701;
    if (_699)
    {
        int _705 = ~_695;
        int _707 = _705 + 33792;
        int _709 = _707 + 1;
        _703 = _709;
    }
    int _711 = _703;
    int _713 = _711 + 30719;
    float _715 = float(_713);
    float _717 = fma(_715, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _719 = -_346;
    float _721 = _719 + _669;
    float _723 = abs(_717);
    float _725 = -_723;
    float _727 = _725 + 1.0;
    float _729 = fma(_677, _721, _346);
    int _731 = as_type<int>(_727) + (-218103808);
    bool _733 = uint(_731) >= 1920991232u;
    float _735 = -_344;
    float _737 = _735 + _667;
    float _739 = fma(_677, _737, _344);
    bool _741 = !_733;
    if (!_741)
    {
        int _743;
        _86(_743, out.gl_Position, out.gl_PointSize);
    }
    float _745 = in.m_55.x;
    float _747 = in.m_55.y;
    float _749 = in.m_55.z;
    float _751 = _271 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _753 = _271 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _755 = _271 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _757 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _759 = log2(_757);
    float _761 = fma(_269, (*spvDescriptorSet0.vp_c10)._m0[5].x, _751);
    float _763 = fma(_269, (*spvDescriptorSet0.vp_c10)._m0[4].x, _753);
    float _765 = fma(_269, (*spvDescriptorSet0.vp_c10)._m0[6].x, _755);
    float _767 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[5].z, _761);
    float _769 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[4].z, _763);
    float _771 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[6].z, _765);
    float _773 = _767 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _775 = _769 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _777 = _771 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    out.m_61.x = _596;
    out.m_61.y = _600;
    float _779 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _781 = _773 + _779;
    float _783 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _785 = _775 + _783;
    float _787 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _789 = _777 + _787;
    float _791 = _759 * _123;
    float _793 = _781 * _781;
    float _795 = _580 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _797 = _749 * 2.0;
    float _799 = _745 * 2.0;
    float _801 = fma(_785, _785, _793);
    float _803 = _747 * 2.0;
    float _805 = floor(_799);
    float _807 = floor(_797);
    float _809 = fma(_789, _789, _801);
    float _811 = rsqrt(_809);
    bool _813 = _807 > 0.0;
    float _815 = floor(_803);
    bool _817 = _807 >= 0.0;
    bool _819 = isnan(_807);
    bool _821 = _817 || _819;
    bool _823 = isnan(0.0);
    bool _825 = _821 || _823;
    float _827 = _747 + _749;
    int _829 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _831 = _829 != 0;
    int _833 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _835 = _833 != 0;
    int _837 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _839 = _837 != 0;
    float _841 = _827 + (-1.0);
    bool _843 = _805 > 0.0;
    float _845 = _781 * _811;
    int _847 = _825 ? 0 : 1;
    float _849 = fma(_841, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _851 = _781 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _853 = _805 >= 0.0;
    bool _855 = isnan(_805);
    bool _857 = _853 || _855;
    bool _859 = isnan(0.0);
    bool _861 = _857 || _859;
    float _863 = _785 * _811;
    int _865 = ~_847;
    int _867 = _865 + 1;
    int _869 = _867 + 1;
    float _871 = fma(_785, (*spvDescriptorSet0.vp_c8)._m0[28].x, _851);
    int _873 = _861 ? 0 : 1;
    float _875 = -_845;
    float _877 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[18].w, _781);
    int _879 = _869;
    if (!_813)
    {
        int _881 = ~_847;
        int _883 = _881 + 1;
        _879 = _883;
    }
    int _885 = _879;
    float _887 = -_863;
    float _889 = fma(_887, (*spvDescriptorSet0.vp_c9)._m0[18].w, _785);
    bool _891 = _815 > 0.0;
    float _893 = _789 * _811;
    bool _895 = _815 >= 0.0;
    bool _897 = isnan(_815);
    bool _899 = _895 || _897;
    bool _901 = isnan(0.0);
    bool _903 = _899 || _901;
    float _905 = fma(_789, (*spvDescriptorSet0.vp_c8)._m0[28].z, _871);
    int _907 = ~_873;
    int _909 = _907 + 1;
    int _911 = _909 + 1;
    float _913 = _877 * _877;
    float _915 = exp2(_791);
    int _917 = _911;
    if (!_843)
    {
        int _919 = ~_873;
        int _921 = _919 + 1;
        _917 = _921;
    }
    int _923 = _917;
    float _925 = -_893;
    float _927 = fma(_925, (*spvDescriptorSet0.vp_c9)._m0[18].w, _789);
    float _929 = fma(_889, _889, _913);
    bool _931 = _905 >= 0.0;
    bool _933 = !_831;
    int _935 = _933 ? 0 : 1;
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _939 = 1.0 + _937;
    float _941 = fma(_927, _927, _929);
    bool _943 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _945 = isnan(1.0);
    bool _947 = _943 || _945;
    bool _949 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _951 = _947 || _949;
    float _953 = _747 + _745;
    float _955 = 1.0 / _939;
    int _957 = abs(_935);
    float _959 = in.m_63.x;
    float _961 = in.m_63.y;
    float _963 = in.m_63.z;
    bool _965 = !_835;
    int _967 = _965 ? 0 : 1;
    float _969 = -_915;
    float _971 = _969 + 1.0;
    bool _973 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _975 = isnan(0.0);
    bool _977 = _973 || _975;
    bool _979 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _981 = _977 || _979;
    float _983 = _953 + (-1.0);
    float _985 = float(_885);
    float _987 = sqrt(_941);
    float _989 = float(_957);
    float _991 = fma(_983, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _993 = abs(_967);
    int _995 = as_type<int>(_991);
    if (_931)
    {
        out.m_49.x = 0.0;
    }
    float _997 = _981 ? _971 : 0.0;
    float _999 = _989 * _985;
    float _1001 = float(_993);
    float _1003 = _582 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1005 = float(_923);
    float _1007 = _997;
    if (_951)
    {
        float _1009 = _997 * _955;
        _141 = _1009;
    }
    float _1011 = _141;
    float _1013 = _999 * (-2.0);
    if (_931)
    {
        _1007 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1015 = _1007;
    float _1017 = _1001 * _1005;
    float _1019 = _590 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1021 = _811 * _987;
    float _1023 = fma(_991, _1013, _991);
    if (_931)
    {
        float _1025 = _1015 * 5.0;
        _995 = as_type<int>(_1025);
    }
    int _1027 = _995;
    float _1029 = _795 * _1021;
    float _1031 = _1003 * _1021;
    float _1033 = _1019 * _1021;
    int _1035 = _903 ? 0 : 1;
    if (_931)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3493 = as_type<float>(_1027);
        out.gl_Position.z = _3493;
    }
    float _1037 = fma(_1013, _959, _959);
    float _1039 = _745 + (-0.5);
    int _1041 = ~_1035;
    int _1043 = _1041 + 1;
    int _1045 = _1043 + 1;
    out.m_65.x = _1029;
    out.m_65.y = _1031;
    out.m_65.z = _1033;
    int _1047 = _1045;
    float _1049 = _963;
    if (!_891)
    {
        int _1051 = ~_1035;
        int _1053 = _1051 + 1;
        _1047 = _1053;
    }
    int _1055 = _1047;
    bool _1057 = !_839;
    int _1059 = _1057 ? 0 : 1;
    if (_931)
    {
        return out;
    }
    float _1061 = -_845;
    float _1063 = fma(_1061, (*spvDescriptorSet0.vp_c9)._m0[18].w, _773);
    float _1065 = -_863;
    float _1067 = fma(_1065, (*spvDescriptorSet0.vp_c9)._m0[18].w, _775);
    float _1069 = fma(_1039, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1037);
    float _1071 = _1017 * (-2.0);
    float _1073 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1075 = _1063 + _1073;
    int _1077 = abs(_1059);
    float _1079 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1081 = _1067 + _1079;
    float _1083 = fma(_849, _1071, _849);
    float _1085 = _1075 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1087 = fma(_1071, _961, _961);
    float _1089 = fma(_1023, _1011, _1069);
    float _1091 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1085);
    float _1093 = -_893;
    float _1095 = fma(_1093, (*spvDescriptorSet0.vp_c9)._m0[18].w, _777);
    float _1097 = _747 + (-0.5);
    float _1099 = float(_1077);
    float _1101 = _1089 * 0.15915493667125701904296875;
    float _1103 = float(_1055);
    float _1105 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1107 = _1095 + _1105;
    float _1109 = fma(_1097, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1087);
    float _1111 = _749 + _745;
    float _1113 = _1099 * _1103;
    float _1115 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1091);
    float _1117 = fma(_1083, _1011, _1109);
    float _1119 = _1111 + (-1.0);
    float _1121 = _1113 * (-2.0);
    float _1123 = _749 + (-0.5);
    bool _1125 = _1115 >= 0.0;
    float _1127 = _1117 * 0.15915493667125701904296875;
    float _1129 = fma(_1119, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1131 = fma(_1121, _963, _963);
    float _1133 = _1101 * 6.283185482025146484375;
    float _1135 = sin(_1133);
    float _1137 = fma(_1129, _1121, _1129);
    float _1139 = fma(_1123, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1131);
    float _1141 = fma(_1137, _1011, _1139);
    float _1143 = _1101 * 6.283185482025146484375;
    float _1145 = cos(_1143);
    if (_1125)
    {
        _1049 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1147 = _1049;
    int _1149 = as_type<int>(_1147);
    if (_1125)
    {
        out.m_49.x = 0.0;
    }
    float _1151 = _1141 * 0.15915493667125701904296875;
    if (_1125)
    {
        float _1153 = _1147 * 5.0;
        _1149 = as_type<int>(_1153);
    }
    int _1155 = _1149;
    float _1157 = _1127 * 6.283185482025146484375;
    float _1159 = sin(_1157);
    if (_1125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3704 = as_type<float>(_1155);
        out.gl_Position.z = _3704;
    }
    float _1161 = _1127 * 6.283185482025146484375;
    float _1163 = cos(_1161);
    float _1165 = _1151 * 6.283185482025146484375;
    float _1167 = sin(_1165);
    if (_1125)
    {
        return out;
    }
    float _1169 = _1151 * 6.283185482025146484375;
    float _1171 = cos(_1169);
    float _1173 = _1135 * _1159;
    float _1175 = _1145 * _1163;
    float _1177 = _1135 * _1163;
    float _1179 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _739);
    float _1181 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _697);
    float _1183 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _729);
    float _1185 = fma(_1167, _1175, _1173);
    float _1187 = _1031 * _1179;
    float _1189 = _1029 * _1181;
    float _1191 = _1145 * _1159;
    float _1193 = _1033 * _1183;
    float _1195 = fma(_1167, _1173, _1175);
    float _1197 = _1171 * _1187;
    float _1199 = _1159 * _1171;
    float _1201 = _1163 * _1171;
    float _1203 = -_1187;
    float _1205 = _1167 * _1203;
    float _1207 = _1145 * _1197;
    float _1209 = -_1177;
    float _1211 = fma(_1167, _1191, _1209);
    float _1213 = -_1191;
    float _1215 = fma(_1167, _1177, _1213);
    float _1217 = _1135 * _1197;
    float _1219 = fma(_1185, _1189, _1207);
    float _1221 = fma(_1201, _1189, _1205);
    float _1223 = fma(_1215, _1189, _1217);
    float _1225 = fma(_1211, _1193, _1219);
    float _1227 = fma(_1199, _1193, _1221);
    float _1229 = fma(_1195, _1193, _1223);
    float _1231 = _1225 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1233 = _1225 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1235 = _1225 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1237 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1231);
    float _1239 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1233);
    float _1241 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1235);
    float _1243 = fma(_1229, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1237);
    float _1245 = fma(_1229, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1239);
    float _1247 = fma(_1229, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1241);
    float _1249 = _1243 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1251 = _1245 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1253 = _1247 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1255 = _775 + _1249;
    float _1257 = _777 + _1251;
    float _1259 = _773 + _1253;
    float _1261 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1263 = _1255 + _1261;
    float _1265 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1267 = _1257 + _1265;
    float _1269 = _1263 * _1263;
    float _1271 = _1267 * _1267;
    float _1273 = _1269 + _1271;
    float _1275 = sqrt(_1273);
    bool _1277 = _1275 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1279 = _1229;
    float _1281 = _1253;
    float _1283 = _1269;
    float _1285 = _1271;
    float _1287 = _1255;
    float _1289 = _1267;
    if (!_1277)
    {
        _1279 = _1257;
    }
    float _1291 = _1279;
    float _1293 = _1291;
    if (!_1277)
    {
        _1281 = _1259;
    }
    float _1295 = _1281;
    bool _1297 = !_1277;
    float _1299 = _1295;
    if (!_1297)
    {
        float _1301 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1303 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1305 = _1275 + _1303;
        float _1307 = _1259 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1309 = rsqrt(_1273);
        float _1311 = _1305 * _1301;
        float _1313 = _1311 * 0.15915493667125701904296875;
        float _1315 = _1313 * 6.283185482025146484375;
        float _1317 = sin(_1315);
        float _1319 = _1313 * 6.283185482025146484375;
        float _1321 = cos(_1319);
        float _1323 = fma(_1317, _1307, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1325 = _1309 * _1323;
        float _1327 = _1321 + (-1.0);
        float _1329 = _1327 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1331 = _1263 * _1325;
        float _1333 = _1267 * _1325;
        float _1335 = fma(_1259, _1321, _1329);
        float _1337 = _1331 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1339 = _1333 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1341 = _1331 * _1331;
        float _1343 = _1333 * _1333;
        _1299 = _1335;
        _1283 = _1341;
        _1285 = _1343;
        _1287 = _1337;
        _1293 = _1339;
    }
    float _1345 = _1299;
    float _1347 = _1283;
    float _1349 = _1285;
    float _1351 = _1287;
    float _1353 = _1293;
    float _1355 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1357 = _1345 + _1355;
    float _1359 = fma(_1357, _1357, _1347);
    float _1361 = _1359 + _1349;
    float _1363 = sqrt(_1361);
    bool _1365 = _1363 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1367 = isnan(_1363);
    bool _1369 = _1365 || _1367;
    bool _1371 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1373 = _1369 || _1371;
    float _1375 = _1347;
    if (!_1373)
    {
        _1375 = 1.0;
    }
    float _1377 = _1375;
    bool _1379 = !_1373;
    float _1381 = _1377;
    if (!_1379)
    {
        bool _1383 = _1363 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1385 = isnan(_1363);
        bool _1387 = _1383 || _1385;
        bool _1389 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1391 = _1387 || _1389;
        if (!_1391)
        {
            float _1393 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1395 = _1363 + _1393;
            float _1397 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1399 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1397;
            float _1401 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1403 = _1401 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1405 = 1.0 / _1399;
            float _1407 = _1395 * _1405;
            float _1409 = fma(_1407, _1403, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1381 = _1409;
            _1411 = true;
        }
        else
        {
            bool _1413 = _1363 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1415 = isnan(_1363);
            bool _1417 = _1413 || _1415;
            bool _1419 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1421 = _1417 || _1419;
            if (!_1421)
            {
                float _1423 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1425 = _1363 + _1423;
                float _1427 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1429 = _1427 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1431 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1433 = _1431 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1435 = 1.0 / _1429;
                float _1437 = _1425 * _1435;
                float _1439 = fma(_1437, _1433, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1381 = _1439;
                _1411 = true;
            }
            else
            {
                _1381 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1411 = false;
    float _1441 = _1381;
    float _1443 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1445 = _1345 + _1443;
    float _1447 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1449 = _1351 + _1447;
    float _1451 = fma(_1445, _1441, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1453 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1455 = _1353 + _1453;
    float _1457 = fma(_1449, _1441, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1459 = -_845;
    float _1461 = fma(_1459, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1451);
    float _1463 = fma(_1455, _1441, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1465 = -_863;
    float _1467 = fma(_1465, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1457);
    float _1469 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1471 = _1461 + _1469;
    float _1473 = -_893;
    float _1475 = fma(_1473, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1463);
    float _1477 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1479 = _1467 + _1477;
    float _1481 = _1471 * _1471;
    float _1483 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1485 = _1475 + _1483;
    float _1487 = fma(_1479, _1479, _1481);
    float _1489 = fma(_1485, _1485, _1487);
    float _1491 = rsqrt(_1489);
    float _1493 = _1491 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1495 = _1479 * _1493;
    float _1497 = _1485 * _1493;
    float _1499 = _1495 * _1495;
    float _1501 = _1497 * _1497;
    float _1503 = _1499 + _1501;
    float _1505 = sqrt(_1503);
    bool _1507 = _1505 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1509 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1511 = _1505 + _1509;
    float _1513 = _1273;
    float _1515 = _1503;
    float _1517 = _1511;
    float _1519 = _1471;
    float _1521 = _1493;
    float _1523 = _1495;
    if (_1507)
    {
        float _1525 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1513 = _1525;
    }
    float _1527 = _1513;
    if (_1507)
    {
        float _1529 = rsqrt(_1503);
        _1515 = _1529;
    }
    float _1531 = _1515;
    float _1533 = _1527;
    float _1535 = _1531;
    if (_1507)
    {
        float _1537 = _1511 * _1527;
        _1517 = _1537;
    }
    float _1539 = _1517;
    if (_1507)
    {
        float _1541 = _1539 * 0.15915493667125701904296875;
        _1289 = _1541;
    }
    float _1543 = _1289;
    float _1545 = _1485;
    if (_1507)
    {
        float _1547 = _1543 * 6.283185482025146484375;
        float _1549 = sin(_1547);
        _1545 = _1549;
    }
    float _1551 = _1545;
    float _1553 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1555 = precise::max(0.0, _1553);
    float _1557 = _1363;
    float _1559 = _1555;
    if (_1507)
    {
        float _1561 = _1543 * 6.283185482025146484375;
        float _1563 = cos(_1561);
        _1557 = _1563;
    }
    float _1565 = _1557;
    float _1567 = -_1493;
    float _1569 = -_1555;
    float _1571 = fma(_1471, _1567, _1569);
    if (_1507)
    {
        float _1573 = _1571 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1519 = _1573;
    }
    float _1575 = _1519;
    float _1577 = sqrt(_1489);
    float _1579 = _1551;
    float _1581 = _1575;
    if (_1507)
    {
        float _1583 = fma(_1551, _1575, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1579 = _1583;
    }
    float _1585 = _1579;
    float _1587 = _1585;
    if (!_1507)
    {
        _1581 = _1497;
    }
    float _1589 = _1581;
    float _1591 = _1589;
    if (_1507)
    {
        float _1593 = _1565 + (-1.0);
        _1559 = _1593;
    }
    float _1595 = _1559;
    float _1597 = _1595;
    if (_1507)
    {
        float _1599 = _1531 * _1585;
        _1521 = _1599;
    }
    float _1601 = _1521;
    if (!_1507)
    {
        _1587 = _1571;
    }
    float _1603 = _1587;
    float _1605 = _1603;
    if (_1507)
    {
        float _1607 = _1595 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1533 = _1607;
    }
    float _1609 = _1533;
    if (_1507)
    {
        float _1611 = _1495 * _1601;
        _1523 = _1611;
    }
    float _1613 = _1523;
    if (!_1507)
    {
        _1535 = _1499;
    }
    float _1615 = _1535;
    float _1617 = _1615;
    if (_1507)
    {
        float _1619 = _1497 * _1601;
        _1591 = _1619;
    }
    float _1621 = _1591;
    if (_1507)
    {
        float _1623 = fma(_1571, _1565, _1609);
        _1605 = _1623;
    }
    float _1625 = _1605;
    if (_1507)
    {
        float _1627 = _1613 * _1613;
        _1617 = _1627;
    }
    float _1629 = _1617;
    if (!_1507)
    {
        _1597 = _1501;
    }
    float _1631 = _1597;
    float _1633 = _1631;
    if (_1507)
    {
        float _1635 = _1621 * _1621;
        _1633 = _1635;
    }
    float _1637 = _1633;
    float _1639 = fma(_1625, _1625, _1629);
    float _1641 = _1461 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1643 = _1639 + _1637;
    float _1645 = _1461 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1647 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1649 = fma(_1577, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1647);
    float _1651 = precise::clamp(_1649, 0.0, 1.0);
    float _1653 = fma(_1467, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1641);
    float _1655 = rsqrt(_1643);
    float _1657 = fma(_1467, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1645);
    float _1659 = _1461 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1661 = -_1651;
    float _1663 = _1661 + 1.0;
    float _1665 = _1461 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1667 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1657);
    float _1669 = fma(_1467, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1659);
    float _1671 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1673 = fma(_1467, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1665);
    float _1675 = _1667 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1677 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1669);
    float _1679 = abs(_1663);
    float _1681 = log2(_1679);
    float _1683 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1673);
    float _1685 = _1675 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1687 = _1677 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1689 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1653);
    float _1691 = _1655 * _1613;
    float _1693 = _1655 * _1625;
    float _1695 = _1683 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1697 = _1687 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1699 = _1691 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1701 = _1655 * _1621;
    float _1703 = -_1685;
    float _1705 = fma(_1703, _1671, 1.0);
    float _1707 = fma(_1695, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1697);
    float _1709 = -_1699;
    float _1711 = fma(_1693, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1709);
    float _1713 = _1689 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1715 = _1687 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1717 = _1681 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1719 = -_1701;
    float _1721 = fma(_1719, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1711);
    float _1723 = fma(_1675, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1707);
    float _1725 = log2(_1705);
    float _1727 = _1687 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1729 = fma(_1721, -0.5, 0.5);
    float _1731 = fma(_1713, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1723);
    float _1733 = fma(_1721, 0.5, 0.5);
    float _1735 = fma(_1695, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1727);
    float _1737 = fma(_1695, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1715);
    float _1739 = _1693 + 1.0;
    float _1741 = exp2(_1717);
    float _1743 = fma(_1733, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1745 = fma(_1675, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1735);
    float _1747 = fma(_1675, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1737);
    float _1749 = fma(_1733, _1743, -0.212114393711090087890625);
    float _1751 = fma(_1713, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1745);
    float _1753 = 1.0 / _1731;
    float _1755 = fma(_1733, _1749, 1.570728778839111328125);
    float _1757 = _1725 * 0.693147182464599609375;
    float _1759 = _1757 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1761 = sqrt(_1729);
    float _1763 = -_1693;
    float _1765 = fma(_1741, _1739, _1763);
    float _1767 = fma(_1713, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1747);
    float _1769 = fma(_1765, 0.5, 0.5);
    float _1771 = _1751 * _1753;
    float _1773 = _1767 * _1753;
    float _1775 = fma(_1771, 0.5, 0.5);
    float _1777 = fma(_1773, -0.5, 0.5);
    float _1779 = _1761 * 0.636619746685028076171875;
    float _1781 = -_1755;
    float _1783 = fma(_1779, _1781, 1.0);
    float3 _4733 = float3(_1775, _1777, _1759);
    float _1785 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4733, float3(0.0), isnan(_4733)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4733, float3(0.0), isnan(_4733)), level(0.0)).x;
    float3 _4744 = float3(_1775, _1777, _1759);
    float4 _1787 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4744, float3(0.0), isnan(_4744)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4744, float3(0.0), isnan(_4744)), level(0.0)).xyzw;
    float _1789 = _1787.x;
    float _1791 = _1787.y;
    float _1793 = _1787.z;
    float _1795 = _1787.w;
    float2 _4760 = float2(_1783, _1769);
    float3 _1799 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4760, float2(0.0), isnan(_4760)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4760, float2(0.0), isnan(_4760)), level(0.0)).xyz;
    float _1801 = _1799.x;
    float _1803 = _1799.y;
    float _1805 = _1799.z;
    float _1807 = _1063 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    out.m_67.x = _1067;
    out.m_67.y = _1063;
    out.m_67.z = _1095;
    float _1809 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1807);
    float _1811 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1809);
    float _1813 = _1063 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1815 = _1811 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1817 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1813);
    float _1819 = 1.0 / _1815;
    float _1821 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1817);
    float _1823 = _1821 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1825 = _1823 + _1815;
    float _1827 = _1825 * _1819;
    float _1829 = _1827 * 0.5;
    float _1831 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1833 = fma(_1829, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1831);
    bool _1835 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1837 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1839 = _1835 || _1837;
    bool _1841 = isnan(0.5);
    bool _1843 = _1839 || _1841;
    float _1845 = _1687 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1847 = _1681 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1849 = 1.0 / _1833;
    float _1851 = fma(_1695, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1845);
    float _1853 = fma(_1675, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1851);
    float _1855 = exp2(_1847);
    float _1857 = fma(_1713, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1853);
    float _1859 = _1851;
    float _1861 = _1675;
    if (_1843)
    {
        _1859 = 1.0;
    }
    float _1863 = _1859;
    float _1865 = _1863;
    if (_1843)
    {
        _1861 = 1.0;
    }
    float _1867 = _1861;
    float _1869 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1871 = _1849 * _1869;
    float _1873 = _1867;
    if (!_1843)
    {
        float _1875 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1877 = _1875 * 0.15915493667125701904296875;
        float _1879 = _1877 * 6.283185482025146484375;
        float _1881 = cos(_1879);
        float _1883 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1885 = _1883 * 0.15915493667125701904296875;
        float _1887 = _1877 * 6.283185482025146484375;
        float _1889 = sin(_1887);
        float _1891 = 1.0 / _1881;
        float _1893 = _1885 * 6.283185482025146484375;
        float _1895 = cos(_1893);
        float _1897 = _1889 * _1891;
        float _1899 = _1885 * 6.283185482025146484375;
        float _1901 = sin(_1899);
        float _1903 = _1895 * _1897;
        float _1905 = 1.0 / _1903;
        float _1907 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1909 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1907;
        float _1911 = 1.0 / _1909;
        float _1913 = _1901 * _1905;
        float _1915 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1917 = fma(_1871, _1913, _1915);
        float _1919 = _1917 * _1911;
        float _1921 = precise::clamp(_1919, 0.0, 1.0);
        _1865 = _1921;
    }
    float _1923 = _1865;
    if (!_1843)
    {
        float _1925 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1927 = _1925 * 0.15915493667125701904296875;
        float _1929 = _1927 * 6.283185482025146484375;
        float _1931 = cos(_1929);
        float _1933 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1935 = _1933 * 0.15915493667125701904296875;
        float _1937 = _1927 * 6.283185482025146484375;
        float _1939 = sin(_1937);
        float _1941 = 1.0 / _1931;
        float _1943 = _1935 * 6.283185482025146484375;
        float _1945 = cos(_1943);
        float _1947 = _1939 * _1941;
        float _1949 = _1935 * 6.283185482025146484375;
        float _1951 = sin(_1949);
        float _1953 = _1945 * _1947;
        float _1955 = 1.0 / _1953;
        float _1957 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1959 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1957;
        float _1961 = 1.0 / _1959;
        float _1963 = _1951 * _1955;
        float _1965 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1967 = fma(_1871, _1963, _1965);
        float _1969 = _1967 * _1961;
        float _1971 = precise::clamp(_1969, 0.0, 1.0);
        float _1973 = -_1971;
        float _1975 = _1973 + 1.0;
        _1873 = _1975;
    }
    float _1977 = _1873;
    float _1979 = -_1855;
    float _1981 = _1979 + 1.0;
    bool _1983 = _1923 > 0.0;
    bool _1985 = isnan(_1923);
    bool _1987 = _1983 || _1985;
    bool _1989 = isnan(0.0);
    bool _1991 = _1987 || _1989;
    float _1993 = _1923 * _1977;
    float _1995 = _1857 + _1731;
    float _1997 = _1981 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _1999 = _1977 <= 0.0;
    bool _2001 = !_1991;
    bool _2003 = _1999 || _2001;
    float _2005 = _1751 + _1731;
    float _2007 = _1731 * 0.5;
    float _2009 = _1997 * _1785;
    float _2011 = -_1997;
    float _2013 = _2011 + 1.0;
    float _2015 = _1993 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_69.x = _1467;
    out.m_69.y = _1461;
    out.m_69.z = _1475;
    float _2017 = _1795 * _2009;
    float _2019 = _1805 * _2009;
    float _2021 = _1995 * 0.5;
    float _2023 = fma(_1801, _2017, _1789);
    float _2025 = fma(_1803, _2017, _1791);
    float _2027 = _1795 * _2013;
    float _2029 = _2005 * 0.5;
    float _2031 = fma(_1767, -0.5, _2007);
    float _2033 = _2015 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2035 = fma(_1795, _2019, _1793);
    out.gl_Position.x = _1751;
    out.gl_Position.y = _1767;
    out.gl_Position.z = _1857;
    out.gl_Position.w = _1731;
    out.m_71.x = _2029;
    out.m_71.y = _2031;
    out.m_71.z = _2021;
    out.m_71.w = _1731;
    out.m_49.x = _2033;
    out.m_73.x = _2023;
    out.m_73.y = _2025;
    out.m_73.z = _2035;
    out.m_73.w = _2027;
    if (!_2003)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _2037 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2037;
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
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1411 = false;
    bool _295 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_46.w;
    float _95 = trunc(_93);
    int _97 = int(_95);
    bool _101 = _97 >= 1;
    float _103 = 0.0;
    float _105 = as_type<float>(_97);
    if (!_101)
    {
        _103 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _107 = _103;
    if (!_101)
    {
        out.m_49.x = 0.0;
    }
    int _109 = 0;
    if (!_101)
    {
        float _111 = _107 * 5.0;
        _109 = as_type<int>(_111);
    }
    int _113 = _109;
    int _115 = _113;
    if (!_101)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2095 = as_type<float>(_113);
        out.gl_Position.z = _2095;
    }
    if (!_101)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _117 = in.m_51.w;
    float _119 = float(_97);
    float _121 = -_117;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _125 = _117 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _127 = isnan(_117);
    bool _129 = _125 || _127;
    bool _131 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _133 = _129 || _131;
    bool _135 = _123 >= _119;
    bool _137 = !_133;
    bool _139 = _135 || _137;
    float _141 = _123;
    if (_139)
    {
        _105 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _143 = _105;
    if (_139)
    {
        out.m_49.x = 0.0;
    }
    if (_139)
    {
        float _145 = _143 * 5.0;
        _115 = as_type<int>(_145);
    }
    int _147 = _115;
    if (_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2159 = as_type<float>(_147);
        out.gl_Position.z = _2159;
    }
    if (_139)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _149 = in.m_53.w;
    float _151 = 1.0 / _119;
    float _153 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _155 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _157 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _159 = _155 || _157;
    bool _161 = isnan(1.0);
    bool _163 = _159 || _161;
    float _165 = in.m_51.x;
    float _167 = in.m_51.y;
    float _169 = in.m_51.z;
    float _171 = in.m_46.x;
    float _173 = in.m_46.y;
    float _175 = in.m_46.z;
    float _177 = 0.0;
    float _179 = _153;
    if (!_163)
    {
        float _181 = _153 * _153;
        float _183 = _181 * 0.5;
        _177 = _183;
    }
    float _185 = _177;
    float _187 = _185;
    if (!_163)
    {
        float _189 = _185 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _187 = _189;
    }
    float _191 = _187;
    bool _193 = !_163;
    float _195 = _191;
    if (!_193)
    {
        float _197 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _199 = log2(_197);
        float _201 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _203 = _201 + 1.0;
        float _205 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _207 = _153 * _199;
        float _209 = 1.0 / _203;
        float _211 = _205 * 0.693147182464599609375;
        float _213 = exp2(_207);
        float _215 = 1.0 / _211;
        float _217 = _213 + (-1.0);
        float _219 = -_217;
        float _221 = fma(_219, _215, _153);
        float _223 = _221 * _209;
        float _225 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _195 = _225;
    }
    float _227 = _195;
    bool _229 = !_163;
    if (!_229)
    {
        float _231 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _233 = log2(_231);
        float _235 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _237 = _235 + 1.0;
        float _239 = 1.0 / _237;
        float _241 = _153 * _233;
        float _243 = exp2(_241);
        float _245 = -_243;
        float _247 = _245 + 1.0;
        float _249 = _247 * _239;
        _179 = _249;
    }
    float _251 = _179;
    bool _253 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _255 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _257 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _259 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _261 = _123 * _151;
    float _263 = fma(_251, _165, _255);
    float _265 = fma(_251, _167, _257);
    float _267 = fma(_251, _169, _259);
    float _269 = fma(_263, _149, _171);
    float _271 = fma(_265, _149, _173);
    float _273 = fma(_267, _149, _175);
    bool _275 = !_253;
    float _293;
    if (!_275)
    {
        float _277 = in.m_55.x;
        float _279 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _281 = _277 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _283 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _285 = _283 * _279;
        float _287 = floor(_285);
        float _289 = -_287;
        float _291 = _285 + _289;
        _293 = _291;
        _295 = true;
    }
    else
    {
        _293 = _261;
    }
    _295 = false;
    float _297 = _293;
    int _299 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _301 = _299;
    int _303 = 0;
    int _305 = _88(_301, _303, (*spvDescriptorSet0.support_buffer));
    float _307 = in.m_57.z;
    float _309 = 0.0 + _261;
    float _311 = precise::clamp(_309, 0.0, 1.0);
    float _313 = trunc(_307);
    int _315 = int(_313);
    int _317 = _305 + (-1);
    float _319 = float(_317);
    float _321 = _311 * _319;
    float _323 = trunc(_321);
    int _325 = int(_323);
    int _327 = _325;
    int _329 = 0;
    int _331 = _89(_327, _329, (*spvDescriptorSet0.support_buffer));
    int _333 = _315;
    int _335 = 0;
    int _337 = _89(_333, _335, (*spvDescriptorSet0.support_buffer));
    float4 _340 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_331, _337)), 0).xyzw;
    float _342 = _340.x;
    float _344 = _340.y;
    float _346 = _340.z;
    float _348 = _340.w;
    float _350 = in.m_55.x;
    float _352 = in.m_55.y;
    float _354 = in.m_55.z;
    float _356 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _358 = in.m_57.y;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _364 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _366 = _364 != 0;
    float _368 = in.m_57.x;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _372 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _374 = _372 != 0;
    float _376 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _382 = 0.0;
    float _384 = _358;
    if (_366)
    {
        float _386 = in.m_55.x;
        _382 = _386;
    }
    float _388 = _382;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _392 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[79].z, _360);
    float _394 = _350 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _396 = fma(_350, (*spvDescriptorSet0.vp_c9)._m0[78].z, _362);
    float _398 = _352 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _400 = -_370;
    float _402 = fma(_394, 2.0, _400);
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _406;
    float _410 = fma(_398, -2.0, _378);
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _414 = 1.0 / _408;
    bool _416 = _352 > 0.5;
    bool _418 = _416 && _374;
    float _420 = _380 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _424 = _412 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _426 = _390 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _428 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[78].w, _404);
    float _430 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[79].x, _392);
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _434 = _297 + _432;
    out.m_59.x = _420;
    out.m_59.y = _424;
    out.m_59.z = _426;
    out.m_59.w = _422;
    bool _436 = _388 > 0.5;
    bool _438 = _436 && _366;
    float _440 = _430 * (-0.15915493667125701904296875);
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _444 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _442;
    float _446 = _420;
    if (_418)
    {
        float _448 = -_358;
        float _450 = _448 + 1.0;
        _384 = _450;
    }
    float _452 = _384;
    float _454 = 0.0;
    if (_366)
    {
        _454 = _368;
    }
    float _456 = _454;
    float _458 = _434 * _414;
    float _460 = _440 * 6.283185482025146484375;
    float _462 = sin(_460);
    float _464 = _376 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _466 = -_123;
    float _468 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[76].x, _402);
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _470;
    float _474 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[76].y, _410);
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _476;
    bool _480 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _482 = isnan(_297);
    bool _484 = _480 || _482;
    bool _486 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _488 = _484 || _486;
    float _490 = float(_488);
    float _492 = fma(_472, _458, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _494 = _356 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _496 = fma(_444, _458, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _498 = fma(_478, _458, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _500 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _502 = isnan(_297);
    bool _504 = _500 || _502;
    bool _506 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _508 = _504 || _506;
    float _510 = float(_508);
    float _512 = fma(_494, _452, -0.5);
    float _514 = _456;
    if (_438)
    {
        float _516 = -_456;
        float _518 = _516 + 1.0;
        _514 = _518;
    }
    float _520 = _514;
    float _522 = in.m_53.x;
    float _524 = in.m_53.y;
    float _526 = in.m_53.z;
    if (!_366)
    {
        _446 = _368;
    }
    float _528 = _446;
    float _530 = -_510;
    float _532 = _530 + 1.0;
    float _534 = _440 * 6.283185482025146484375;
    float _536 = cos(_534);
    float _538 = _528;
    if (_366)
    {
        _538 = _520;
    }
    float _540 = _538;
    float _542 = _462 * _512;
    float _544 = _490 * _532;
    float _546 = -_490;
    float _548 = _546 + 1.0;
    float _550 = fma(_464, _540, -0.5);
    float _552 = _492 * _544;
    float _554 = _496 * _544;
    float _556 = _498 * _544;
    float _558 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].w, _428);
    float _560 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[143].x, _552);
    float _562 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[143].y, _554);
    float _564 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[143].z, _556);
    float _566 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _396);
    float _568 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[144].x, _560);
    float _570 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[144].y, _562);
    float _572 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[144].z, _564);
    float _574 = _536 * _512;
    float _576 = -_542;
    float _578 = fma(_536, _550, _576);
    float _580 = _568 * _522;
    float _582 = _570 * _524;
    float _584 = fma(_462, _550, _574);
    float _586 = fma(_566, _578, _468);
    int _588 = _325 + 1;
    float _590 = _572 * _526;
    float _592 = -_474;
    float _594 = fma(_558, _584, _592);
    float _596 = _586 + 0.5;
    int _598 = min(_317, _588);
    float _600 = _594 + 0.5;
    uint _603 = as_type<uint>(half2(float2(_348, 0.0)));
    uint _605 = extract_bits(_603, 0u, 8u);
    int _607 = int(_605) & 255;
    uint _609 = extract_bits(_603, 8u, 8u);
    int _611 = int(_609) & 255;
    int _613 = _611 << 8;
    int _615 = _607 | _613;
    bool _617 = _615 >= 32768;
    int _619 = _615 + (-1024);
    int _621 = _619;
    if (_617)
    {
        int _623 = ~_615;
        int _625 = _623 + 33792;
        int _627 = _625 + 1;
        _621 = _627;
    }
    int _629 = _621;
    int _631 = _629 + 30719;
    float _633 = float(_631);
    float _635 = fma(_633, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _637 = abs(_635);
    float _639 = -_637;
    float _641 = _639 + 1.0;
    int _643 = as_type<int>(_641) + (-218103808);
    bool _645 = uint(_643) >= 1920991232u;
    bool _647 = !_645;
    if (!_647)
    {
        int _649;
        _86(_649, out.gl_Position, out.gl_PointSize);
    }
    int _651 = _598;
    int _653 = 0;
    int _655 = _89(_651, _653, (*spvDescriptorSet0.support_buffer));
    int _657 = _315;
    int _659 = 0;
    int _661 = _89(_657, _659, (*spvDescriptorSet0.support_buffer));
    float4 _663 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_655, _661)), 0).xyzw;
    float _665 = _663.x;
    float _667 = _663.y;
    float _669 = _663.z;
    float _671 = _663.w;
    float _673 = floor(_321);
    float _675 = -_673;
    float _677 = _321 + _675;
    uint _679 = as_type<uint>(half2(float2(_671, 0.0)));
    float _681 = -_342;
    float _683 = _681 + _665;
    uint _685 = extract_bits(_679, 0u, 8u);
    int _687 = int(_685) & 255;
    uint _689 = extract_bits(_679, 8u, 8u);
    int _691 = int(_689) & 255;
    int _693 = _691 << 8;
    int _695 = _687 | _693;
    float _697 = fma(_677, _683, _342);
    bool _699 = _695 >= 32768;
    int _701 = _695 + (-1024);
    int _703 = _701;
    if (_699)
    {
        int _705 = ~_695;
        int _707 = _705 + 33792;
        int _709 = _707 + 1;
        _703 = _709;
    }
    int _711 = _703;
    int _713 = _711 + 30719;
    float _715 = float(_713);
    float _717 = fma(_715, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _719 = -_346;
    float _721 = _719 + _669;
    float _723 = abs(_717);
    float _725 = -_723;
    float _727 = _725 + 1.0;
    float _729 = fma(_677, _721, _346);
    int _731 = as_type<int>(_727) + (-218103808);
    bool _733 = uint(_731) >= 1920991232u;
    float _735 = -_344;
    float _737 = _735 + _667;
    float _739 = fma(_677, _737, _344);
    bool _741 = !_733;
    if (!_741)
    {
        int _743;
        _86(_743, out.gl_Position, out.gl_PointSize);
    }
    float _745 = in.m_55.x;
    float _747 = in.m_55.y;
    float _749 = in.m_55.z;
    float _751 = _271 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _753 = _271 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _755 = _271 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _757 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _759 = log2(_757);
    float _761 = fma(_269, (*spvDescriptorSet0.vp_c10)._m0[5].x, _751);
    float _763 = fma(_269, (*spvDescriptorSet0.vp_c10)._m0[4].x, _753);
    float _765 = fma(_269, (*spvDescriptorSet0.vp_c10)._m0[6].x, _755);
    float _767 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[5].z, _761);
    float _769 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[4].z, _763);
    float _771 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[6].z, _765);
    float _773 = _767 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _775 = _769 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _777 = _771 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    out.m_61.x = _596;
    out.m_61.y = _600;
    float _779 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _781 = _773 + _779;
    float _783 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _785 = _775 + _783;
    float _787 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _789 = _777 + _787;
    float _791 = _759 * _123;
    float _793 = _781 * _781;
    float _795 = _580 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _797 = _749 * 2.0;
    float _799 = _745 * 2.0;
    float _801 = fma(_785, _785, _793);
    float _803 = _747 * 2.0;
    float _805 = floor(_799);
    float _807 = floor(_797);
    float _809 = fma(_789, _789, _801);
    float _811 = rsqrt(_809);
    bool _813 = _807 > 0.0;
    float _815 = floor(_803);
    bool _817 = _807 >= 0.0;
    bool _819 = isnan(_807);
    bool _821 = _817 || _819;
    bool _823 = isnan(0.0);
    bool _825 = _821 || _823;
    float _827 = _747 + _749;
    int _829 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _831 = _829 != 0;
    int _833 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _835 = _833 != 0;
    int _837 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _839 = _837 != 0;
    float _841 = _827 + (-1.0);
    bool _843 = _805 > 0.0;
    float _845 = _781 * _811;
    int _847 = _825 ? 0 : 1;
    float _849 = fma(_841, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _851 = _781 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _853 = _805 >= 0.0;
    bool _855 = isnan(_805);
    bool _857 = _853 || _855;
    bool _859 = isnan(0.0);
    bool _861 = _857 || _859;
    float _863 = _785 * _811;
    int _865 = ~_847;
    int _867 = _865 + 1;
    int _869 = _867 + 1;
    float _871 = fma(_785, (*spvDescriptorSet0.vp_c8)._m0[28].x, _851);
    int _873 = _861 ? 0 : 1;
    float _875 = -_845;
    float _877 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[18].w, _781);
    int _879 = _869;
    if (!_813)
    {
        int _881 = ~_847;
        int _883 = _881 + 1;
        _879 = _883;
    }
    int _885 = _879;
    float _887 = -_863;
    float _889 = fma(_887, (*spvDescriptorSet0.vp_c9)._m0[18].w, _785);
    bool _891 = _815 > 0.0;
    float _893 = _789 * _811;
    bool _895 = _815 >= 0.0;
    bool _897 = isnan(_815);
    bool _899 = _895 || _897;
    bool _901 = isnan(0.0);
    bool _903 = _899 || _901;
    float _905 = fma(_789, (*spvDescriptorSet0.vp_c8)._m0[28].z, _871);
    int _907 = ~_873;
    int _909 = _907 + 1;
    int _911 = _909 + 1;
    float _913 = _877 * _877;
    float _915 = exp2(_791);
    int _917 = _911;
    if (!_843)
    {
        int _919 = ~_873;
        int _921 = _919 + 1;
        _917 = _921;
    }
    int _923 = _917;
    float _925 = -_893;
    float _927 = fma(_925, (*spvDescriptorSet0.vp_c9)._m0[18].w, _789);
    float _929 = fma(_889, _889, _913);
    bool _931 = _905 >= 0.0;
    bool _933 = !_831;
    int _935 = _933 ? 0 : 1;
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _939 = 1.0 + _937;
    float _941 = fma(_927, _927, _929);
    bool _943 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _945 = isnan(1.0);
    bool _947 = _943 || _945;
    bool _949 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _951 = _947 || _949;
    float _953 = _747 + _745;
    float _955 = 1.0 / _939;
    int _957 = abs(_935);
    float _959 = in.m_63.x;
    float _961 = in.m_63.y;
    float _963 = in.m_63.z;
    bool _965 = !_835;
    int _967 = _965 ? 0 : 1;
    float _969 = -_915;
    float _971 = _969 + 1.0;
    bool _973 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _975 = isnan(0.0);
    bool _977 = _973 || _975;
    bool _979 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _981 = _977 || _979;
    float _983 = _953 + (-1.0);
    float _985 = float(_885);
    float _987 = sqrt(_941);
    float _989 = float(_957);
    float _991 = fma(_983, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _993 = abs(_967);
    int _995 = as_type<int>(_991);
    if (_931)
    {
        out.m_49.x = 0.0;
    }
    float _997 = _981 ? _971 : 0.0;
    float _999 = _989 * _985;
    float _1001 = float(_993);
    float _1003 = _582 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1005 = float(_923);
    float _1007 = _997;
    if (_951)
    {
        float _1009 = _997 * _955;
        _141 = _1009;
    }
    float _1011 = _141;
    float _1013 = _999 * (-2.0);
    if (_931)
    {
        _1007 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1015 = _1007;
    float _1017 = _1001 * _1005;
    float _1019 = _590 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1021 = _811 * _987;
    float _1023 = fma(_991, _1013, _991);
    if (_931)
    {
        float _1025 = _1015 * 5.0;
        _995 = as_type<int>(_1025);
    }
    int _1027 = _995;
    float _1029 = _795 * _1021;
    float _1031 = _1003 * _1021;
    float _1033 = _1019 * _1021;
    int _1035 = _903 ? 0 : 1;
    if (_931)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3493 = as_type<float>(_1027);
        out.gl_Position.z = _3493;
    }
    float _1037 = fma(_1013, _959, _959);
    float _1039 = _745 + (-0.5);
    int _1041 = ~_1035;
    int _1043 = _1041 + 1;
    int _1045 = _1043 + 1;
    out.m_65.x = _1029;
    out.m_65.y = _1031;
    out.m_65.z = _1033;
    int _1047 = _1045;
    float _1049 = _963;
    if (!_891)
    {
        int _1051 = ~_1035;
        int _1053 = _1051 + 1;
        _1047 = _1053;
    }
    int _1055 = _1047;
    bool _1057 = !_839;
    int _1059 = _1057 ? 0 : 1;
    if (_931)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1061 = -_845;
    float _1063 = fma(_1061, (*spvDescriptorSet0.vp_c9)._m0[18].w, _773);
    float _1065 = -_863;
    float _1067 = fma(_1065, (*spvDescriptorSet0.vp_c9)._m0[18].w, _775);
    float _1069 = fma(_1039, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1037);
    float _1071 = _1017 * (-2.0);
    float _1073 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1075 = _1063 + _1073;
    int _1077 = abs(_1059);
    float _1079 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1081 = _1067 + _1079;
    float _1083 = fma(_849, _1071, _849);
    float _1085 = _1075 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1087 = fma(_1071, _961, _961);
    float _1089 = fma(_1023, _1011, _1069);
    float _1091 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1085);
    float _1093 = -_893;
    float _1095 = fma(_1093, (*spvDescriptorSet0.vp_c9)._m0[18].w, _777);
    float _1097 = _747 + (-0.5);
    float _1099 = float(_1077);
    float _1101 = _1089 * 0.15915493667125701904296875;
    float _1103 = float(_1055);
    float _1105 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1107 = _1095 + _1105;
    float _1109 = fma(_1097, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1087);
    float _1111 = _749 + _745;
    float _1113 = _1099 * _1103;
    float _1115 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1091);
    float _1117 = fma(_1083, _1011, _1109);
    float _1119 = _1111 + (-1.0);
    float _1121 = _1113 * (-2.0);
    float _1123 = _749 + (-0.5);
    bool _1125 = _1115 >= 0.0;
    float _1127 = _1117 * 0.15915493667125701904296875;
    float _1129 = fma(_1119, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1131 = fma(_1121, _963, _963);
    float _1133 = _1101 * 6.283185482025146484375;
    float _1135 = sin(_1133);
    float _1137 = fma(_1129, _1121, _1129);
    float _1139 = fma(_1123, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1131);
    float _1141 = fma(_1137, _1011, _1139);
    float _1143 = _1101 * 6.283185482025146484375;
    float _1145 = cos(_1143);
    if (_1125)
    {
        _1049 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1147 = _1049;
    int _1149 = as_type<int>(_1147);
    if (_1125)
    {
        out.m_49.x = 0.0;
    }
    float _1151 = _1141 * 0.15915493667125701904296875;
    if (_1125)
    {
        float _1153 = _1147 * 5.0;
        _1149 = as_type<int>(_1153);
    }
    int _1155 = _1149;
    float _1157 = _1127 * 6.283185482025146484375;
    float _1159 = sin(_1157);
    if (_1125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3704 = as_type<float>(_1155);
        out.gl_Position.z = _3704;
    }
    float _1161 = _1127 * 6.283185482025146484375;
    float _1163 = cos(_1161);
    float _1165 = _1151 * 6.283185482025146484375;
    float _1167 = sin(_1165);
    if (_1125)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1169 = _1151 * 6.283185482025146484375;
    float _1171 = cos(_1169);
    float _1173 = _1135 * _1159;
    float _1175 = _1145 * _1163;
    float _1177 = _1135 * _1163;
    float _1179 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _739);
    float _1181 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _697);
    float _1183 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _729);
    float _1185 = fma(_1167, _1175, _1173);
    float _1187 = _1031 * _1179;
    float _1189 = _1029 * _1181;
    float _1191 = _1145 * _1159;
    float _1193 = _1033 * _1183;
    float _1195 = fma(_1167, _1173, _1175);
    float _1197 = _1171 * _1187;
    float _1199 = _1159 * _1171;
    float _1201 = _1163 * _1171;
    float _1203 = -_1187;
    float _1205 = _1167 * _1203;
    float _1207 = _1145 * _1197;
    float _1209 = -_1177;
    float _1211 = fma(_1167, _1191, _1209);
    float _1213 = -_1191;
    float _1215 = fma(_1167, _1177, _1213);
    float _1217 = _1135 * _1197;
    float _1219 = fma(_1185, _1189, _1207);
    float _1221 = fma(_1201, _1189, _1205);
    float _1223 = fma(_1215, _1189, _1217);
    float _1225 = fma(_1211, _1193, _1219);
    float _1227 = fma(_1199, _1193, _1221);
    float _1229 = fma(_1195, _1193, _1223);
    float _1231 = _1225 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1233 = _1225 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1235 = _1225 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1237 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1231);
    float _1239 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1233);
    float _1241 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1235);
    float _1243 = fma(_1229, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1237);
    float _1245 = fma(_1229, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1239);
    float _1247 = fma(_1229, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1241);
    float _1249 = _1243 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1251 = _1245 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1253 = _1247 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1255 = _775 + _1249;
    float _1257 = _777 + _1251;
    float _1259 = _773 + _1253;
    float _1261 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1263 = _1255 + _1261;
    float _1265 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1267 = _1257 + _1265;
    float _1269 = _1263 * _1263;
    float _1271 = _1267 * _1267;
    float _1273 = _1269 + _1271;
    float _1275 = sqrt(_1273);
    bool _1277 = _1275 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1279 = _1229;
    float _1281 = _1253;
    float _1283 = _1269;
    float _1285 = _1271;
    float _1287 = _1255;
    float _1289 = _1267;
    if (!_1277)
    {
        _1279 = _1257;
    }
    float _1291 = _1279;
    float _1293 = _1291;
    if (!_1277)
    {
        _1281 = _1259;
    }
    float _1295 = _1281;
    bool _1297 = !_1277;
    float _1299 = _1295;
    if (!_1297)
    {
        float _1301 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1303 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1305 = _1275 + _1303;
        float _1307 = _1259 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1309 = rsqrt(_1273);
        float _1311 = _1305 * _1301;
        float _1313 = _1311 * 0.15915493667125701904296875;
        float _1315 = _1313 * 6.283185482025146484375;
        float _1317 = sin(_1315);
        float _1319 = _1313 * 6.283185482025146484375;
        float _1321 = cos(_1319);
        float _1323 = fma(_1317, _1307, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1325 = _1309 * _1323;
        float _1327 = _1321 + (-1.0);
        float _1329 = _1327 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1331 = _1263 * _1325;
        float _1333 = _1267 * _1325;
        float _1335 = fma(_1259, _1321, _1329);
        float _1337 = _1331 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1339 = _1333 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1341 = _1331 * _1331;
        float _1343 = _1333 * _1333;
        _1299 = _1335;
        _1283 = _1341;
        _1285 = _1343;
        _1287 = _1337;
        _1293 = _1339;
    }
    float _1345 = _1299;
    float _1347 = _1283;
    float _1349 = _1285;
    float _1351 = _1287;
    float _1353 = _1293;
    float _1355 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1357 = _1345 + _1355;
    float _1359 = fma(_1357, _1357, _1347);
    float _1361 = _1359 + _1349;
    float _1363 = sqrt(_1361);
    bool _1365 = _1363 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1367 = isnan(_1363);
    bool _1369 = _1365 || _1367;
    bool _1371 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1373 = _1369 || _1371;
    float _1375 = _1347;
    if (!_1373)
    {
        _1375 = 1.0;
    }
    float _1377 = _1375;
    bool _1379 = !_1373;
    float _1381 = _1377;
    if (!_1379)
    {
        bool _1383 = _1363 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1385 = isnan(_1363);
        bool _1387 = _1383 || _1385;
        bool _1389 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1391 = _1387 || _1389;
        if (!_1391)
        {
            float _1393 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1395 = _1363 + _1393;
            float _1397 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1399 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1397;
            float _1401 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1403 = _1401 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1405 = 1.0 / _1399;
            float _1407 = _1395 * _1405;
            float _1409 = fma(_1407, _1403, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1381 = _1409;
            _1411 = true;
        }
        else
        {
            bool _1413 = _1363 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1415 = isnan(_1363);
            bool _1417 = _1413 || _1415;
            bool _1419 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1421 = _1417 || _1419;
            if (!_1421)
            {
                float _1423 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1425 = _1363 + _1423;
                float _1427 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1429 = _1427 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1431 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1433 = _1431 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1435 = 1.0 / _1429;
                float _1437 = _1425 * _1435;
                float _1439 = fma(_1437, _1433, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1381 = _1439;
                _1411 = true;
            }
            else
            {
                _1381 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1411 = false;
    float _1441 = _1381;
    float _1443 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1445 = _1345 + _1443;
    float _1447 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1449 = _1351 + _1447;
    float _1451 = fma(_1445, _1441, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1453 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1455 = _1353 + _1453;
    float _1457 = fma(_1449, _1441, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1459 = -_845;
    float _1461 = fma(_1459, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1451);
    float _1463 = fma(_1455, _1441, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1465 = -_863;
    float _1467 = fma(_1465, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1457);
    float _1469 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1471 = _1461 + _1469;
    float _1473 = -_893;
    float _1475 = fma(_1473, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1463);
    float _1477 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1479 = _1467 + _1477;
    float _1481 = _1471 * _1471;
    float _1483 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1485 = _1475 + _1483;
    float _1487 = fma(_1479, _1479, _1481);
    float _1489 = fma(_1485, _1485, _1487);
    float _1491 = rsqrt(_1489);
    float _1493 = _1491 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1495 = _1479 * _1493;
    float _1497 = _1485 * _1493;
    float _1499 = _1495 * _1495;
    float _1501 = _1497 * _1497;
    float _1503 = _1499 + _1501;
    float _1505 = sqrt(_1503);
    bool _1507 = _1505 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1509 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1511 = _1505 + _1509;
    float _1513 = _1273;
    float _1515 = _1503;
    float _1517 = _1511;
    float _1519 = _1471;
    float _1521 = _1493;
    float _1523 = _1495;
    if (_1507)
    {
        float _1525 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1513 = _1525;
    }
    float _1527 = _1513;
    if (_1507)
    {
        float _1529 = rsqrt(_1503);
        _1515 = _1529;
    }
    float _1531 = _1515;
    float _1533 = _1527;
    float _1535 = _1531;
    if (_1507)
    {
        float _1537 = _1511 * _1527;
        _1517 = _1537;
    }
    float _1539 = _1517;
    if (_1507)
    {
        float _1541 = _1539 * 0.15915493667125701904296875;
        _1289 = _1541;
    }
    float _1543 = _1289;
    float _1545 = _1485;
    if (_1507)
    {
        float _1547 = _1543 * 6.283185482025146484375;
        float _1549 = sin(_1547);
        _1545 = _1549;
    }
    float _1551 = _1545;
    float _1553 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1555 = precise::max(0.0, _1553);
    float _1557 = _1363;
    float _1559 = _1555;
    if (_1507)
    {
        float _1561 = _1543 * 6.283185482025146484375;
        float _1563 = cos(_1561);
        _1557 = _1563;
    }
    float _1565 = _1557;
    float _1567 = -_1493;
    float _1569 = -_1555;
    float _1571 = fma(_1471, _1567, _1569);
    if (_1507)
    {
        float _1573 = _1571 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1519 = _1573;
    }
    float _1575 = _1519;
    float _1577 = sqrt(_1489);
    float _1579 = _1551;
    float _1581 = _1575;
    if (_1507)
    {
        float _1583 = fma(_1551, _1575, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1579 = _1583;
    }
    float _1585 = _1579;
    float _1587 = _1585;
    if (!_1507)
    {
        _1581 = _1497;
    }
    float _1589 = _1581;
    float _1591 = _1589;
    if (_1507)
    {
        float _1593 = _1565 + (-1.0);
        _1559 = _1593;
    }
    float _1595 = _1559;
    float _1597 = _1595;
    if (_1507)
    {
        float _1599 = _1531 * _1585;
        _1521 = _1599;
    }
    float _1601 = _1521;
    if (!_1507)
    {
        _1587 = _1571;
    }
    float _1603 = _1587;
    float _1605 = _1603;
    if (_1507)
    {
        float _1607 = _1595 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1533 = _1607;
    }
    float _1609 = _1533;
    if (_1507)
    {
        float _1611 = _1495 * _1601;
        _1523 = _1611;
    }
    float _1613 = _1523;
    if (!_1507)
    {
        _1535 = _1499;
    }
    float _1615 = _1535;
    float _1617 = _1615;
    if (_1507)
    {
        float _1619 = _1497 * _1601;
        _1591 = _1619;
    }
    float _1621 = _1591;
    if (_1507)
    {
        float _1623 = fma(_1571, _1565, _1609);
        _1605 = _1623;
    }
    float _1625 = _1605;
    if (_1507)
    {
        float _1627 = _1613 * _1613;
        _1617 = _1627;
    }
    float _1629 = _1617;
    if (!_1507)
    {
        _1597 = _1501;
    }
    float _1631 = _1597;
    float _1633 = _1631;
    if (_1507)
    {
        float _1635 = _1621 * _1621;
        _1633 = _1635;
    }
    float _1637 = _1633;
    float _1639 = fma(_1625, _1625, _1629);
    float _1641 = _1461 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1643 = _1639 + _1637;
    float _1645 = _1461 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1647 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1649 = fma(_1577, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1647);
    float _1651 = precise::clamp(_1649, 0.0, 1.0);
    float _1653 = fma(_1467, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1641);
    float _1655 = rsqrt(_1643);
    float _1657 = fma(_1467, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1645);
    float _1659 = _1461 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1661 = -_1651;
    float _1663 = _1661 + 1.0;
    float _1665 = _1461 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1667 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1657);
    float _1669 = fma(_1467, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1659);
    float _1671 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1673 = fma(_1467, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1665);
    float _1675 = _1667 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1677 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1669);
    float _1679 = abs(_1663);
    float _1681 = log2(_1679);
    float _1683 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1673);
    float _1685 = _1675 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1687 = _1677 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1689 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1653);
    float _1691 = _1655 * _1613;
    float _1693 = _1655 * _1625;
    float _1695 = _1683 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1697 = _1687 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1699 = _1691 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1701 = _1655 * _1621;
    float _1703 = -_1685;
    float _1705 = fma(_1703, _1671, 1.0);
    float _1707 = fma(_1695, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1697);
    float _1709 = -_1699;
    float _1711 = fma(_1693, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1709);
    float _1713 = _1689 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1715 = _1687 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1717 = _1681 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1719 = -_1701;
    float _1721 = fma(_1719, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1711);
    float _1723 = fma(_1675, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1707);
    float _1725 = log2(_1705);
    float _1727 = _1687 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1729 = fma(_1721, -0.5, 0.5);
    float _1731 = fma(_1713, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1723);
    float _1733 = fma(_1721, 0.5, 0.5);
    float _1735 = fma(_1695, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1727);
    float _1737 = fma(_1695, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1715);
    float _1739 = _1693 + 1.0;
    float _1741 = exp2(_1717);
    float _1743 = fma(_1733, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1745 = fma(_1675, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1735);
    float _1747 = fma(_1675, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1737);
    float _1749 = fma(_1733, _1743, -0.212114393711090087890625);
    float _1751 = fma(_1713, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1745);
    float _1753 = 1.0 / _1731;
    float _1755 = fma(_1733, _1749, 1.570728778839111328125);
    float _1757 = _1725 * 0.693147182464599609375;
    float _1759 = _1757 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1761 = sqrt(_1729);
    float _1763 = -_1693;
    float _1765 = fma(_1741, _1739, _1763);
    float _1767 = fma(_1713, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1747);
    float _1769 = fma(_1765, 0.5, 0.5);
    float _1771 = _1751 * _1753;
    float _1773 = _1767 * _1753;
    float _1775 = fma(_1771, 0.5, 0.5);
    float _1777 = fma(_1773, -0.5, 0.5);
    float _1779 = _1761 * 0.636619746685028076171875;
    float _1781 = -_1755;
    float _1783 = fma(_1779, _1781, 1.0);
    float3 _4733 = float3(_1775, _1777, _1759);
    float _1785 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4733, float3(0.0), isnan(_4733)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4733, float3(0.0), isnan(_4733)), level(0.0)).x;
    float3 _4744 = float3(_1775, _1777, _1759);
    float4 _1787 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4744, float3(0.0), isnan(_4744)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4744, float3(0.0), isnan(_4744)), level(0.0)).xyzw;
    float _1789 = _1787.x;
    float _1791 = _1787.y;
    float _1793 = _1787.z;
    float _1795 = _1787.w;
    float2 _4760 = float2(_1783, _1769);
    float3 _1799 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4760, float2(0.0), isnan(_4760)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4760, float2(0.0), isnan(_4760)), level(0.0)).xyz;
    float _1801 = _1799.x;
    float _1803 = _1799.y;
    float _1805 = _1799.z;
    float _1807 = _1063 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    out.m_67.x = _1067;
    out.m_67.y = _1063;
    out.m_67.z = _1095;
    float _1809 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1807);
    float _1811 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1809);
    float _1813 = _1063 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1815 = _1811 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1817 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1813);
    float _1819 = 1.0 / _1815;
    float _1821 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1817);
    float _1823 = _1821 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1825 = _1823 + _1815;
    float _1827 = _1825 * _1819;
    float _1829 = _1827 * 0.5;
    float _1831 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1833 = fma(_1829, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1831);
    bool _1835 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1837 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1839 = _1835 || _1837;
    bool _1841 = isnan(0.5);
    bool _1843 = _1839 || _1841;
    float _1845 = _1687 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1847 = _1681 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1849 = 1.0 / _1833;
    float _1851 = fma(_1695, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1845);
    float _1853 = fma(_1675, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1851);
    float _1855 = exp2(_1847);
    float _1857 = fma(_1713, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1853);
    float _1859 = _1851;
    float _1861 = _1675;
    if (_1843)
    {
        _1859 = 1.0;
    }
    float _1863 = _1859;
    float _1865 = _1863;
    if (_1843)
    {
        _1861 = 1.0;
    }
    float _1867 = _1861;
    float _1869 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1871 = _1849 * _1869;
    float _1873 = _1867;
    if (!_1843)
    {
        float _1875 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1877 = _1875 * 0.15915493667125701904296875;
        float _1879 = _1877 * 6.283185482025146484375;
        float _1881 = cos(_1879);
        float _1883 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1885 = _1883 * 0.15915493667125701904296875;
        float _1887 = _1877 * 6.283185482025146484375;
        float _1889 = sin(_1887);
        float _1891 = 1.0 / _1881;
        float _1893 = _1885 * 6.283185482025146484375;
        float _1895 = cos(_1893);
        float _1897 = _1889 * _1891;
        float _1899 = _1885 * 6.283185482025146484375;
        float _1901 = sin(_1899);
        float _1903 = _1895 * _1897;
        float _1905 = 1.0 / _1903;
        float _1907 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1909 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1907;
        float _1911 = 1.0 / _1909;
        float _1913 = _1901 * _1905;
        float _1915 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1917 = fma(_1871, _1913, _1915);
        float _1919 = _1917 * _1911;
        float _1921 = precise::clamp(_1919, 0.0, 1.0);
        _1865 = _1921;
    }
    float _1923 = _1865;
    if (!_1843)
    {
        float _1925 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1927 = _1925 * 0.15915493667125701904296875;
        float _1929 = _1927 * 6.283185482025146484375;
        float _1931 = cos(_1929);
        float _1933 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1935 = _1933 * 0.15915493667125701904296875;
        float _1937 = _1927 * 6.283185482025146484375;
        float _1939 = sin(_1937);
        float _1941 = 1.0 / _1931;
        float _1943 = _1935 * 6.283185482025146484375;
        float _1945 = cos(_1943);
        float _1947 = _1939 * _1941;
        float _1949 = _1935 * 6.283185482025146484375;
        float _1951 = sin(_1949);
        float _1953 = _1945 * _1947;
        float _1955 = 1.0 / _1953;
        float _1957 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1959 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1957;
        float _1961 = 1.0 / _1959;
        float _1963 = _1951 * _1955;
        float _1965 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1967 = fma(_1871, _1963, _1965);
        float _1969 = _1967 * _1961;
        float _1971 = precise::clamp(_1969, 0.0, 1.0);
        float _1973 = -_1971;
        float _1975 = _1973 + 1.0;
        _1873 = _1975;
    }
    float _1977 = _1873;
    float _1979 = -_1855;
    float _1981 = _1979 + 1.0;
    bool _1983 = _1923 > 0.0;
    bool _1985 = isnan(_1923);
    bool _1987 = _1983 || _1985;
    bool _1989 = isnan(0.0);
    bool _1991 = _1987 || _1989;
    float _1993 = _1923 * _1977;
    float _1995 = _1857 + _1731;
    float _1997 = _1981 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _1999 = _1977 <= 0.0;
    bool _2001 = !_1991;
    bool _2003 = _1999 || _2001;
    float _2005 = _1751 + _1731;
    float _2007 = _1731 * 0.5;
    float _2009 = _1997 * _1785;
    float _2011 = -_1997;
    float _2013 = _2011 + 1.0;
    float _2015 = _1993 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_69.x = _1467;
    out.m_69.y = _1461;
    out.m_69.z = _1475;
    float _2017 = _1795 * _2009;
    float _2019 = _1805 * _2009;
    float _2021 = _1995 * 0.5;
    float _2023 = fma(_1801, _2017, _1789);
    float _2025 = fma(_1803, _2017, _1791);
    float _2027 = _1795 * _2013;
    float _2029 = _2005 * 0.5;
    float _2031 = fma(_1767, -0.5, _2007);
    float _2033 = _2015 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2035 = fma(_1795, _2019, _1793);
    out.gl_Position.x = _1751;
    out.gl_Position.y = _1767;
    out.gl_Position.z = _1857;
    out.gl_Position.w = _1731;
    out.m_71.x = _2029;
    out.m_71.y = _2031;
    out.m_71.z = _2021;
    out.m_71.w = _1731;
    out.m_49.x = _2033;
    out.m_73.x = _2023;
    out.m_73.y = _2025;
    out.m_73.z = _2035;
    out.m_73.w = _2027;
    if (!_2003)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _2037 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2037;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

