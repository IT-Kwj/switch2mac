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

template<typename T>
[[clang::optnone]] T spvFAdd(T l, T r)
{
    return fma(T(1), l, r);
}

template <typename T>
static inline depth2d<T> spvDepthCast(texture2d<T> t)
{
    return reinterpret_cast<thread const depth2d<T> &>(t);
}

template <typename T>
static inline depth2d_array<T> spvDepthCast(texture2d_array<T> t)
{
    return reinterpret_cast<thread const depth2d_array<T> &>(t);
}

template <typename T>
static inline depthcube<T> spvDepthCast(texturecube<T> t)
{
    return reinterpret_cast<thread const depthcube<T> &>(t);
}

template <typename T>
static inline depthcube_array<T> spvDepthCast(texturecube_array<T> t)
{
    return reinterpret_cast<thread const depthcube_array<T> &>(t);
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

struct _29
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c7 [[id(2)]];
    constant _16* fp_c11 [[id(3)]];
    constant _16* fp_c4 [[id(4)]];
    const device _29* fp_s0 [[id(5)]];
    const device _29* fp_s1 [[id(6)]];
    texture2d<float> fp_t_tcb_1A [[id(7)]];
    sampler fp_t_tcb_1ASmplr [[id(8)]];
    texture2d<float> fp_t_tcb_20 [[id(9)]];
    sampler fp_t_tcb_20Smplr [[id(10)]];
    texture2d<float> fp_t_tcb_E [[id(11)]];
    sampler fp_t_tcb_ESmplr [[id(12)]];
    texture2d<float> fp_t_tcb_10 [[id(13)]];
    sampler fp_t_tcb_10Smplr [[id(14)]];
    texture2d_array<float> fp_t_tcb_8 [[id(15)]];
    sampler fp_t_tcb_8Smplr [[id(16)]];
    texture2d_array<float> fp_t_tcb_A [[id(17)]];
    sampler fp_t_tcb_ASmplr [[id(18)]];
    texture2d_array<float> fp_t_tcb_C [[id(19)]];
    sampler fp_t_tcb_CSmplr [[id(20)]];
    texture2d_array<float> fp_t_tcb_14 [[id(21)]];
    sampler fp_t_tcb_14Smplr [[id(22)]];
    texturecube_array<float> fp_t_tcb_1C [[id(23)]];
    sampler fp_t_tcb_1CSmplr [[id(24)]];
    texture2d<float> fp_t_tcb_18 [[id(25)]];
    sampler fp_t_tcb_18Smplr [[id(26)]];
    texture2d<float> fp_t_tcb_12 [[id(27)]];
    sampler fp_t_tcb_12Smplr [[id(28)]];
    texture2d<float> fp_t_tcb_16 [[id(29)]];
    sampler fp_t_tcb_16Smplr [[id(30)]];
    texture2d<float> fp_t_tcb_1E [[id(31)]];
    sampler fp_t_tcb_1ESmplr [[id(32)]];
    texture3d<float> fp_t_tcb_24 [[id(33)]];
    sampler fp_t_tcb_24Smplr [[id(34)]];
    sampler fp_t_tcb_1ASmplr_w [[id(35)]];
    sampler fp_t_tcb_ESmplr_w [[id(36)]];
    sampler fp_t_tcb_10Smplr_w [[id(37)]];
    sampler fp_t_tcb_8Smplr_w [[id(38)]];
    sampler fp_t_tcb_ASmplr_w [[id(39)]];
    sampler fp_t_tcb_CSmplr_w [[id(40)]];
    sampler fp_t_tcb_1CSmplr_w [[id(41)]];
    sampler fp_t_tcb_18Smplr_w [[id(42)]];
    sampler fp_t_tcb_12Smplr_w [[id(43)]];
    sampler fp_t_tcb_16Smplr_w [[id(44)]];
    sampler fp_t_tcb_1ESmplr_w [[id(45)]];
    sampler fp_t_tcb_24Smplr_w [[id(46)]];
    constant dm_border_t* dm_border [[id(47)]];
};

struct main0_out
{
    float4 m_103 [[color(0)]];
    float4 m_105 [[color(1)]];
};

struct main0_in
{
    float4 m_82 [[user(locn0)]];
    float4 m_94 [[user(locn1)]];
    float4 m_96 [[user(locn2)]];
    float4 m_98 [[user(locn3)]];
    float4 m_86 [[user(locn4)]];
    float4 m_92 [[user(locn5)]];
    float4 m_90 [[user(locn6)]];
    float4 m_84 [[user(locn7)]];
    float4 m_100 [[user(locn8)]];
    float4 m_88 [[user(locn9)]];
};

static inline __attribute__((always_inline))
int _111(thread const int& _8203, const device _29& fp_s1)
{
    uint _8206 = uint(int(uint(_8203) >> uint(2)));
    float _8208 = as_type<float>(fp_s1._m0[int(_8206)]);
    int _8210 = _8203 & 3;
    int _8212 = _8210 << 3;
    int _8214 = as_type<int>(_8208) >> _8212;
    int _8216 = extract_bits(_8214, 0u, 16u);
    return _8216;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _2245 = false;
    float _115 = gl_FragCoord.x;
    float _117 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _119 = _115 / _117;
    float _121 = gl_FragCoord.y;
    float _123 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _125 = _121 / _123;
    float _127 = _119 * (*spvDescriptorSet0.fp_c9)._m0[989].x;
    float _129 = _125 * (*spvDescriptorSet0.fp_c9)._m0[989].y;
    float2 _3364 = float2(_127, _129);
    float2 _133 = dm_bs(spvDescriptorSet0.fp_t_tcb_1A.sample(spvDescriptorSet0.fp_t_tcb_1ASmplr, select(_3364, float2(0.0), isnan(_3364))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_1A, spvDescriptorSet0.fp_t_tcb_1ASmplr_w, select(_3364, float2(0.0), isnan(_3364))).xy;
    float _135 = _133.x;
    float _137 = _133.y;
    float _139 = gl_FragCoord.w;
    float _141 = in.m_82.y;
    float _143 = gl_FragCoord.w;
    float _145 = _141 * _143;
    float _147 = in.m_82.x;
    float _149 = gl_FragCoord.w;
    float _151 = _147 * _149;
    int _153 = as_type<int>((*spvDescriptorSet0.fp_c7)._m0[11].z) * as_type<int>((*spvDescriptorSet0.fp_c11)._m0[33].z);
    int _155 = _153 + as_type<int>((*spvDescriptorSet0.fp_c11)._m0[33].w);
    int _157 = _155 * 96;
    int _159 = _157 + 80;
    uint _162 = uint(int(uint(_157) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.fp_s0)._m0[int(_162)];
    float _164 = as_type<float>(_dmw0.x);
    int _166 = _157 + 4;
    uint _168 = uint(int(uint(_166) >> uint(2)));
    float _170 = as_type<float>(_dmw0.y);
    uint _172 = uint(int(uint(_159) >> uint(2)));
    float _174 = as_type<float>((*spvDescriptorSet0.fp_s0)._m0[int(_172)]);
    int _176 = _157 + 16;
    int _178 = _157 + 24;
    uint _180 = uint(int(uint(_176) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.fp_s0)._m0[int(_180)];
    float _182 = as_type<float>(_dmw1.x);
    int _184 = _176 + 4;
    uint _186 = uint(int(uint(_184) >> uint(2)));
    float _188 = as_type<float>(_dmw1.y);
    int _190 = _157 + 8;
    uint _192 = uint(int(uint(_178) >> uint(2)));
    float _194 = as_type<float>(_dmw1.z);
    int _196 = _178 + 4;
    uint _198 = uint(int(uint(_196) >> uint(2)));
    float _200 = as_type<float>(_dmw1.w);
    float _202 = 1.0 / _139;
    uint _204 = uint(int(uint(_190) >> uint(2)));
    float _206 = as_type<float>(_dmw0.z);
    int _208 = _190 + 4;
    uint _210 = uint(int(uint(_208) >> uint(2)));
    float _212 = as_type<float>(_dmw0.w);
    float _214 = (*spvDescriptorSet0.fp_c9)._m0[983].y * 0.0625;
    float _216 = (*spvDescriptorSet0.fp_c9)._m0[983].y * 0.75;
    float _218 = _202 * _145;
    float _220 = _202 * _151;
    float _222 = _218 + _214;
    float _224 = -_214;
    float _226 = fma(_218, 0.75, _224);
    float _228 = _220 + _214;
    float _230 = -_214;
    float _232 = fma(_220, 0.75, _230);
    float _234 = -_216;
    float _236 = fma(_234, (*spvDescriptorSet0.fp_c11)._m0[40].z, _222);
    float _238 = -_216;
    float _240 = fma(_238, (*spvDescriptorSet0.fp_c11)._m0[40].z, _226);
    float _242 = fma(_135, 2.0, -1.0);
    float _244 = fma(_137, 2.0, -1.0);
    float _246 = fma(_242, (*spvDescriptorSet0.fp_c9)._m0[983].z, _127);
    float _248 = fma(_244, (*spvDescriptorSet0.fp_c9)._m0[983].w, _129);
    float2 _3574 = float2(_246, _248);
    float4 _251 = spvDescriptorSet0.fp_t_tcb_20.gather(spvDescriptorSet0.fp_t_tcb_20Smplr, select(_3574, float2(0.0), isnan(_3574)), int2(0), component::x).xyzw;
    float _253 = _251.x;
    float _255 = _251.y;
    float _257 = _251.z;
    float _259 = _251.w;
    float2 _3590 = float2(_228, _236);
    float2 _261 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_3590, float2(0.0), isnan(_3590))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_3590, float2(0.0), isnan(_3590))).xy;
    float _263 = _261.x;
    float _265 = _261.y;
    float2 _3602 = float2(_232, _240);
    float2 _267 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_3602, float2(0.0), isnan(_3602))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_3602, float2(0.0), isnan(_3602))).xy;
    float _269 = _267.x;
    float _271 = _267.y;
    float _273 = in.m_84.z;
    float _275 = gl_FragCoord.w;
    float _277 = _273 * _275;
    float _279 = in.m_84.x;
    float _281 = gl_FragCoord.w;
    float _283 = _279 * _281;
    float _285 = _202 * _277;
    float _287 = _202 * _283;
    float _289 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _291 = _285 + _289;
    float _293 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _295 = _287 + _293;
    float _297 = _291 * _291;
    float _299 = fma(_295, _295, _297);
    float _301 = sqrt(_299);
    float _303 = in.m_86.z;
    float _305 = gl_FragCoord.w;
    float _307 = _303 * _305;
    float _309 = in.m_86.w;
    float _311 = gl_FragCoord.w;
    float _313 = _309 * _311;
    bool _317 = _301 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _319 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _321 = _301 + _319;
    float _323 = _297;
    if (_317)
    {
        float _325 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _323 = _325;
    }
    float _327 = _323;
    int _329 = as_type<int>(_174) << 6;
    float _331 = _202 * _307;
    float _333 = in.m_88.w;
    float _335 = gl_FragCoord.w;
    float _337 = _333 * _335;
    int _339 = _329 + 25920;
    uint _341 = uint(int(uint(_339) >> uint(2)));
    uint _343 = uint(int(uint(int(_341)) >> uint(2)));
    int _345 = int(_341) & 3;
    float _347 = (*spvDescriptorSet0.fp_c9)._m0[int(_343)][_345];
    int _349 = int(_341) + 1;
    uint _351 = uint(int(uint(_349) >> uint(2)));
    int _353 = _349 & 3;
    float _355 = (*spvDescriptorSet0.fp_c9)._m0[int(_351)][_353];
    float _357 = fma(_331, _182, _194);
    float _359 = _174;
    if (_317)
    {
        float _361 = _321 * _327;
        _359 = _361;
    }
    float _363 = _359;
    int _365 = _329 + 25912;
    uint _367 = uint(int(uint(_365) >> uint(2)));
    uint _369 = uint(int(uint(int(_367)) >> uint(2)));
    int _371 = int(_367) & 3;
    float _373 = (*spvDescriptorSet0.fp_c9)._m0[int(_369)][_371];
    int _375 = int(_367) + 1;
    uint _377 = uint(int(uint(_375) >> uint(2)));
    int _379 = _375 & 3;
    float _381 = (*spvDescriptorSet0.fp_c9)._m0[int(_377)][_379];
    float _383 = _202 * _313;
    int _385 = _329 + 25904;
    uint _387 = uint(int(uint(_385) >> uint(2)));
    uint _389 = uint(int(uint(int(_387)) >> uint(2)));
    int _391 = int(_387) & 3;
    float _393 = (*spvDescriptorSet0.fp_c9)._m0[int(_389)][_391];
    int _395 = int(_387) + 1;
    uint _397 = uint(int(uint(_395) >> uint(2)));
    int _399 = _395 & 3;
    float _401 = (*spvDescriptorSet0.fp_c9)._m0[int(_397)][_399];
    float _403 = in.m_84.y;
    float _405 = gl_FragCoord.w;
    float _407 = _403 * _405;
    float _409 = 0.0;
    if (_317)
    {
        float _411 = _363 * 0.15915493667125701904296875;
        _409 = _411;
    }
    float _413 = _409;
    float _415 = fma(_383, _188, _200);
    float _417 = fma(_383, _170, _212);
    float _419 = fma(_248, (*spvDescriptorSet0.fp_c9)._m0[47].y, -0.5);
    float _421 = 0.0;
    if (_317)
    {
        float _423 = rsqrt(_299);
        _421 = _423;
    }
    float _425 = _421;
    float _427 = fma(_246, (*spvDescriptorSet0.fp_c9)._m0[47].x, -0.5);
    float _429 = _417 * _401;
    float _431 = floor(_419);
    float _433 = floor(_427);
    float _435 = _357 * _347;
    float _437 = _307;
    float _439 = _355;
    float _441 = _381;
    float _443 = _425;
    if (_317)
    {
        float _445 = _413 * 6.283185482025146484375;
        float _447 = sin(_445);
        _437 = _447;
    }
    float _449 = _437;
    float _451 = _415 * _401;
    float _453 = _415 * _381;
    float _455 = _415 * _355;
    float _457 = _202 * _407;
    float _459 = -_431;
    float _461 = _419 + _459;
    float _463 = _202 * _337;
    if (_317)
    {
        float _465 = _457 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _439 = _465;
    }
    float _467 = _439;
    float _469 = -_433;
    float _471 = _427 + _469;
    float _473 = 0.0;
    if (_317)
    {
        float _475 = _413 * 6.283185482025146484375;
        float _477 = cos(_475);
        _473 = _477;
    }
    float _479 = _473;
    if (_317)
    {
        float _481 = fma(_449, _467, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        _441 = _481;
    }
    float _483 = _441;
    float _485 = -_471;
    float _487 = _485 + 1.0;
    float _489 = _471 * _461;
    float _491 = _487;
    if (_317)
    {
        float _493 = _425 * _483;
        _443 = _493;
    }
    float _495 = _443;
    float _497 = fma(_331, _164, _206);
    float _499 = _497 * _393;
    float _501 = _357 * _393;
    float _503 = _357 * _373;
    int _505 = _157 + 64;
    uint _507 = uint(int(uint(_505) >> uint(2)));
    float _509 = as_type<float>((*spvDescriptorSet0.fp_s0)._m0[int(_507)]);
    float _511 = -_257;
    float _513 = fma(_511, (*spvDescriptorSet0.fp_c9)._m0[2645].w, 1.0);
    float _515 = -_259;
    float _517 = fma(_515, (*spvDescriptorSet0.fp_c9)._m0[2645].w, 1.0);
    float _519 = 1.0 / _513;
    float _521 = -_253;
    float _523 = fma(_521, (*spvDescriptorSet0.fp_c9)._m0[2645].w, 1.0);
    float _525 = -_255;
    float _527 = fma(_525, (*spvDescriptorSet0.fp_c9)._m0[2645].w, 1.0);
    float _529 = 1.0 / _517;
    float _531 = 1.0 / _523;
    float _533 = -(*spvDescriptorSet0.fp_c4)._m0[14].x;
    float _535 = _519 * _533;
    float _537 = -_461;
    float _539 = _537 + 1.0;
    float _541 = 1.0 / _527;
    float _543 = -(*spvDescriptorSet0.fp_c4)._m0[14].x;
    float _545 = _529 * _543;
    float _547 = precise::min(_463, _535);
    float _549 = _471 * _539;
    float _551 = _487 * _539;
    float _553 = precise::min(_463, _545);
    float _555 = _547 * _549;
    float _557 = -(*spvDescriptorSet0.fp_c4)._m0[14].x;
    float _559 = _531 * _557;
    float _561 = fma(_553, _551, _555);
    float _563 = _461 * _487;
    float _565 = precise::min(_463, _559);
    float _567 = -(*spvDescriptorSet0.fp_c4)._m0[14].x;
    float _569 = _541 * _567;
    float _571 = _531;
    float _573 = _555;
    float _575 = _541;
    if (_317)
    {
        float _577 = _479 + (-1.0);
        _571 = _577;
    }
    float _579 = _571;
    float _581 = fma(_565, _563, _561);
    float _583 = precise::min(_463, _569);
    if (_317)
    {
        float _585 = _579 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _491 = _585;
    }
    float _587 = _491;
    bool _589 = _263 >= 0.5;
    bool _591 = isnan(_263);
    bool _593 = _589 || _591;
    bool _595 = isnan(0.5);
    bool _597 = _593 || _595;
    bool _599 = _265 >= 0.5;
    bool _601 = isnan(_265);
    bool _603 = _599 || _601;
    bool _605 = isnan(0.5);
    bool _607 = _603 || _605;
    float _609 = fma(_583, _489, _581);
    float _611 = -_263;
    float _613 = _611 + 1.0;
    float _615 = _263 * _269;
    float _617 = _615 * 2.0;
    float _619 = _617;
    float _621 = _613;
    float _623 = _609;
    if (!_317)
    {
        _573 = _457;
    }
    float _625 = _573;
    float _627 = -_609;
    float _629 = _463 + _627;
    float _631 = _625;
    if (!_317)
    {
        _575 = _287;
    }
    float _633 = _575;
    float _635 = _633;
    if (_317)
    {
        float _637 = fma(_457, _479, _587);
        _631 = _637;
    }
    float _639 = _631;
    float _641 = -_269;
    float _643 = _641 + 1.0;
    if (_317)
    {
        float _645 = fma(_295, _495, (*spvDescriptorSet0.fp_c9)._m0[26].x);
        _635 = _645;
    }
    float _647 = _635;
    float _649 = -_265;
    float _651 = _649 + 1.0;
    float _653 = -_271;
    float _655 = _653 + 1.0;
    float _657 = _265 * _271;
    float _659 = _657 * 2.0;
    float _661 = _629 * 0.5;
    float _663 = _613 * _643;
    float _665 = _651 * _655;
    float _667 = precise::max(_661, 0.100000001490116119384765625);
    float _669 = _659;
    if (_597)
    {
        float _671 = fma(_663, -2.0, 1.0);
        _619 = _671;
    }
    float _673 = _619;
    if (_607)
    {
        float _675 = fma(_665, -2.0, 1.0);
        _669 = _675;
    }
    float _677 = _669;
    float _679 = precise::min(_667, 4.0);
    float _681 = fma(-0.0500000007450580596923828125, _673, 0.02500000037252902984619140625);
    float _683 = fma(0.0500000007450580596923828125, _677, -0.02500000037252902984619140625);
    float _685 = fma(_681, _679, _246);
    float _687 = fma(_683, _679, _248);
    float2 _4223 = float2(_685, _687);
    float4 _689 = spvDescriptorSet0.fp_t_tcb_20.gather(spvDescriptorSet0.fp_t_tcb_20Smplr, select(_4223, float2(0.0), isnan(_4223)), int2(0), component::x).xyzw;
    float _691 = _689.x;
    float _693 = _689.y;
    float _695 = _689.z;
    float _697 = _689.w;
    float2 _4240;
    _4240.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_501, _451));
    _4240.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_501, _451));
    float _699 = _4240.x;
    float _701 = _699 * 256.0;
    int _703 = int(_701);
    float2 _4251;
    _4251.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_499, _429));
    _4251.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_499, _429));
    float _705 = _4251.x;
    float _707 = _705 * 256.0;
    int _709 = int(_707);
    int _711 = _157 + 68;
    uint _713 = uint(int(uint(_711) >> uint(2)));
    float _715 = as_type<float>((*spvDescriptorSet0.fp_s0)._m0[int(_713)]);
    if (!_317)
    {
        _621 = _285;
    }
    float _717 = _621;
    float _719 = _717;
    if (_317)
    {
        float _721 = fma(_291, _495, (*spvDescriptorSet0.fp_c9)._m0[26].z);
        _719 = _721;
    }
    float _723 = _719;
    float2 _4289;
    _4289.x = spvDescriptorSet0.fp_t_tcb_A.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_ASmplr, float2(_503, _453));
    _4289.y = spvDescriptorSet0.fp_t_tcb_A.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_ASmplr, float2(_503, _453));
    float _725 = _4289.x;
    float _727 = _725 * 256.0;
    int _729 = int(_727);
    float2 _4299;
    _4299.x = spvDescriptorSet0.fp_t_tcb_C.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_CSmplr, float2(_435, _455));
    _4299.y = spvDescriptorSet0.fp_t_tcb_C.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_CSmplr, float2(_435, _455));
    float _731 = _4299.x;
    float _733 = _731 * 256.0;
    int _735 = int(_733);
    float _737 = -(*spvDescriptorSet0.fp_c9)._m0[26].y;
    float _739 = _639 + _737;
    float _741 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _743 = _647 + _741;
    float _745 = _739 * _739;
    float _747 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _749 = _723 + _747;
    float _751 = fma(_743, _743, _745);
    float _753 = fma(_749, _749, _751);
    float _755 = in.m_90.w;
    float _757 = gl_FragCoord.w;
    float _759 = _755 * _757;
    float _761 = in.m_90.y;
    float _763 = gl_FragCoord.w;
    float _765 = _761 * _763;
    float _767 = rsqrt(_753);
    float _769 = in.m_90.x;
    float _771 = gl_FragCoord.w;
    float _773 = _769 * _771;
    float _775 = in.m_90.z;
    float _777 = gl_FragCoord.w;
    float _779 = _775 * _777;
    float _781 = in.m_92.y;
    float _783 = gl_FragCoord.w;
    float _785 = _781 * _783;
    float _787 = in.m_92.x;
    float _789 = gl_FragCoord.w;
    float _791 = _787 * _789;
    float _793 = in.m_92.z;
    float _795 = gl_FragCoord.w;
    float _797 = _793 * _795;
    float _799 = _767 * (*spvDescriptorSet0.fp_c9)._m0[26].w;
    float _801 = _743 * _799;
    float _803 = _749 * _799;
    float _805 = _801 * _801;
    float _807 = _803 * _803;
    float _809 = (-1.0) + (*spvDescriptorSet0.fp_c9)._m0[71].y;
    float _811 = _129 * (*spvDescriptorSet0.fp_c9)._m0[71].y;
    float _813 = _805 + _807;
    float _815 = _202 * _759;
    float _817 = sqrt(_813);
    float _819 = precise::min(_811, _809);
    float _821 = (*spvDescriptorSet0.fp_c9)._m0[71].z + (-1.0);
    float _823 = _202 * _765;
    float _825 = 0.0 + _815;
    float _827 = precise::clamp(_825, 0.0, 1.0);
    float _829 = _202 * _773;
    float _831 = _823 * _823;
    float _833 = fma(_827, _821, 1.0);
    float _835 = _202 * _779;
    float _837 = fma(_829, _829, _831);
    float _839 = log2(_833);
    float _841 = fma(_835, _835, _837);
    bool _843 = _817 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _845 = _202 * _785;
    float _847 = _202 * _791;
    float _849 = floor(_819);
    float _851 = _202 * _797;
    float _853 = _845 * _845;
    float _855 = fma(_847, _847, _853);
    float _857 = in.m_92.w;
    float _859 = gl_FragCoord.w;
    float _861 = _857 * _859;
    float _863 = _791;
    float _865 = _785;
    float _867 = _801;
    float _869 = _805;
    if (_843)
    {
        float _871 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _863 = _871;
    }
    float _873 = _863;
    float _875 = fma(_851, _851, _855);
    float _877 = _839 * 0.693147182464599609375;
    float _879 = (-1.0) + (*spvDescriptorSet0.fp_c9)._m0[71].x;
    float _881 = _127 * (*spvDescriptorSet0.fp_c9)._m0[71].x;
    float _883 = _877 * (*spvDescriptorSet0.fp_c9)._m0[72].x;
    float _885 = precise::clamp(_883, 0.0, 1.0);
    float _887 = rsqrt(_841);
    float _889 = precise::min(_881, _879);
    float _891 = _885 * (*spvDescriptorSet0.fp_c9)._m0[71].z;
    float _893 = rsqrt(_875);
    float _895 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _897 = _817 + _895;
    float _899 = precise::min(_821, _891);
    float _901 = _897;
    float _903 = _873;
    if (_843)
    {
        float _905 = _897 * _873;
        _901 = _905;
    }
    float _907 = _901;
    float _909 = (*spvDescriptorSet0.fp_c9)._m0[26].y + (-220.0);
    float _911 = _829 * _887;
    float _913 = floor(_899);
    if (_843)
    {
        float _915 = _907 * 0.15915493667125701904296875;
        _903 = _915;
    }
    float _917 = _903;
    float _919 = fma(_849, (*spvDescriptorSet0.fp_c9)._m0[71].x, _889);
    float _921 = precise::max(0.0, _909);
    float _923 = _823 * _887;
    float _925 = _851 * _893;
    float _927 = _835 * _887;
    float _929 = _847 * _893;
    float _931 = _845 * _893;
    float _933 = (*spvDescriptorSet0.fp_c9)._m0[26].y;
    float _935 = _919;
    if (_843)
    {
        float _937 = _917 * 6.283185482025146484375;
        float _939 = sin(_937);
        _933 = _939;
    }
    float _941 = _933;
    float _943 = _911 * _925;
    float _945 = -_799;
    float _947 = -_921;
    float _949 = fma(_739, _945, _947);
    float _951 = _927 * _931;
    float _953 = _923 * _929;
    float _955 = _202 * _861;
    float _957 = -_943;
    float _959 = fma(_927, _929, _957);
    float _961 = -_951;
    float _963 = fma(_923, _925, _961);
    float _965 = -_953;
    float _967 = fma(_911, _931, _965);
    float _969 = _955 * _959;
    float _971 = _913 * (*spvDescriptorSet0.fp_c9)._m0[71].y;
    float _973 = _955 * _963;
    float _975 = _913;
    float _977 = _949;
    if (_843)
    {
        float _979 = _949 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _975 = _979;
    }
    float _981 = _975;
    float _983 = _955 * _967;
    float _985 = _969 * _969;
    float _987 = fma(_971, (*spvDescriptorSet0.fp_c9)._m0[71].x, _919);
    if (_843)
    {
        float _989 = fma(_941, _981, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        _935 = _989;
    }
    float _991 = _935;
    float _993 = fma(_973, _973, _985);
    float _995 = _921;
    if (_843)
    {
        float _997 = rsqrt(_813);
        _995 = _997;
    }
    float _999 = _995;
    float _1001 = fma(_983, _983, _993);
    float _1003 = _917;
    if (_843)
    {
        float _1005 = _917 * 6.283185482025146484375;
        float _1007 = cos(_1005);
        _1003 = _1007;
    }
    float _1009 = _1003;
    float _1011 = -(*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _1013 = _457 + _1011;
    float _1015 = fma(2.007874011993408203125, _677, -1.007874011993408203125);
    float _1017 = fma(2.007874011993408203125, _673, -1.007874011993408203125);
    float _1019 = rsqrt(_1001);
    float _1021 = -(*spvDescriptorSet0.fp_c4)._m0[11].w;
    float _1023 = _287 + _1021;
    float _1025 = _1013 * _1013;
    float _1027 = _1015 * _1015;
    float _1029 = 0.0;
    float _1031 = _1027;
    if (_843)
    {
        float _1033 = _999 * _991;
        _1029 = _1033;
    }
    float _1035 = _1029;
    float _1037 = -_463;
    bool _1039 = _1037 > (*spvDescriptorSet0.fp_c4)._m0[58].x;
    float _1041 = float(_1039);
    float _1043 = -(*spvDescriptorSet0.fp_c4)._m0[13].w;
    float _1045 = _285 + _1043;
    float _1047 = -_463;
    bool _1049 = _1047 > (*spvDescriptorSet0.fp_c4)._m0[58].y;
    float _1051 = float(_1049);
    float _1053 = 0.0;
    float _1055 = _1019;
    if (_843)
    {
        float _1057 = _1009 + (-1.0);
        _1053 = _1057;
    }
    float _1059 = _1053;
    float _1061 = fma(_1023, _1023, _1025);
    float _1063 = fma(_1017, _1017, _1027);
    if (_843)
    {
        float _1065 = _1059 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _865 = _1065;
    }
    float _1067 = _865;
    float _1069 = fma(_1045, _1045, _1061);
    float _1071 = _1041 + _1051;
    float _1073 = -_1063;
    float _1075 = _1073 + 1.0;
    float _1077 = precise::clamp(_1075, 0.0, 1.0);
    float _1079 = _1019 * _1015;
    float _1081 = sqrt(_1069);
    if (!_843)
    {
        _1055 = _807;
    }
    float _1083 = _1055;
    float _1085 = in.m_94.x;
    float _1087 = gl_FragCoord.w;
    float _1089 = _1085 * _1087;
    float _1091 = in.m_96.w;
    float _1093 = gl_FragCoord.w;
    float _1095 = _1091 * _1093;
    float _1097 = _1083;
    if (!_843)
    {
        _1031 = _803;
    }
    float _1099 = _1031;
    float _1101 = _1099;
    if (_843)
    {
        float _1103 = _803 * _1035;
        _1101 = _1103;
    }
    float _1105 = _1101;
    float _1107 = sqrt(_1077);
    float _1109 = precise::min(_1071, (*spvDescriptorSet0.fp_c9)._m0[42].w);
    float _1111 = in.m_94.w;
    float _1113 = gl_FragCoord.w;
    float _1115 = _1111 * _1113;
    float _1117 = _969 * _1079;
    float _1119 = trunc(_1109);
    int _1121 = int(_1119);
    if (_843)
    {
        float _1123 = fma(_949, _1009, _1067);
        _977 = _1123;
    }
    float _1125 = _977;
    if (_843)
    {
        float _1127 = _801 * _1035;
        _867 = _1127;
    }
    float _1129 = _867;
    float _1131 = _973 * _1079;
    float _1133 = fma(_931, _1017, _1117);
    float _1135 = in.m_96.x;
    float _1137 = gl_FragCoord.w;
    float _1139 = _1135 * _1137;
    if (_843)
    {
        float _1141 = _1129 * _1129;
        _869 = _1141;
    }
    float _1143 = _869;
    float _1145 = _983 * _1079;
    float _1147 = fma(_929, _1017, _1131);
    float _1149 = fma(_923, _1107, _1133);
    if (_843)
    {
        float _1151 = _1105 * _1105;
        _1097 = _1151;
    }
    float _1153 = _1097;
    float _1155 = fma(_1125, _1125, _1143);
    float _1157 = fma(_925, _1017, _1145);
    float _1159 = fma(_911, _1107, _1147);
    float _1161 = _1149 * _1149;
    int _1163 = _1121 << 4;
    float _1165 = _1155 + _1153;
    float _1167 = spvFAdd(_1081, 9.9999997473787516355514526367188e-06);
    float _1169 = fma(_927, _1107, _1157);
    bool _1171 = _1163 == 16;
    float _1173 = fma(_1159, _1159, _1161);
    float _1175 = 1.0 / _1167;
    float _1177 = fma(_1169, _1169, _1173);
    float _1179 = _202 * _1089;
    float _1181 = _202 * _1095;
    float _1183 = rsqrt(_1165);
    float _1185 = in.m_98.w;
    float _1187 = gl_FragCoord.w;
    float _1189 = _1185 * _1187;
    float _1191 = in.m_94.y;
    float _1193 = gl_FragCoord.w;
    float _1195 = _1191 * _1193;
    float _1197 = _202 * _1115;
    float _1199 = in.m_96.y;
    float _1201 = gl_FragCoord.w;
    float _1203 = _1199 * _1201;
    float _1205 = rsqrt(_1177);
    float _1207 = _1197;
    float _1209 = _1179;
    float _1211 = _1177;
    float _1213 = as_type<float>(_1163);
    if (_1171)
    {
        _1207 = _1181;
    }
    float _1215 = _1207;
    float _1217 = in.m_98.y;
    float _1219 = gl_FragCoord.w;
    float _1221 = _1217 * _1219;
    float _1223 = _1045 * _1175;
    float _1225 = _202 * _1139;
    float _1227 = _1023 * _1175;
    float _1229 = _1183 * _1129;
    float _1231 = _1183 * _1125;
    float _1233 = _1183 * _1105;
    float _1235 = _1013 * _1175;
    float _1237 = in.m_94.z;
    float _1239 = gl_FragCoord.w;
    float _1241 = _1237 * _1239;
    float _1243 = in.m_96.z;
    float _1245 = gl_FragCoord.w;
    float _1247 = _1243 * _1245;
    float _1249 = _1159 * _1205;
    float _1251 = _1149 * _1205;
    float _1253 = _1169 * _1205;
    float _1255 = _1229 * (*spvDescriptorSet0.fp_c9)._m0[69].x;
    float _1257 = -(*spvDescriptorSet0.fp_c9)._m0[63].y;
    float _1259 = fma(_1081, (*spvDescriptorSet0.fp_c9)._m0[63].x, _1257);
    float _1261 = precise::clamp(_1259, 0.0, 1.0);
    float _1263 = -_1255;
    float _1265 = fma(_1231, (*spvDescriptorSet0.fp_c9)._m0[69].y, _1263);
    float _1267 = -_1261;
    float _1269 = _1267 + 1.0;
    float _1271 = in.m_98.z;
    float _1273 = gl_FragCoord.w;
    float _1275 = _1271 * _1273;
    float _1277 = _1235 * _1251;
    float _1279 = -_1233;
    float _1281 = fma(_1279, (*spvDescriptorSet0.fp_c9)._m0[69].z, _1265);
    bool _1283 = _1163 == 32;
    float _1285 = abs(_1269);
    float _1287 = log2(_1285);
    bool _1289 = _1163 == 0;
    float _1291 = fma(_1227, _1249, _1277);
    float _1293 = _202 * _1189;
    float _1295 = fma(_1281, -0.5, 0.5);
    float _1297 = fma(_1223, _1253, _1291);
    float _1299 = _202 * _1195;
    float _1301 = _1215;
    if (_1171)
    {
        _1209 = _1225;
    }
    float _1303 = _1209;
    float _1305 = _202 * _1203;
    float _1307 = sqrt(_1295);
    float _1309 = _1297 + _1297;
    float _1311 = _202 * _1221;
    float _1313 = fma(_1281, 0.5, 0.5);
    float _1315 = _1303;
    if (_1283)
    {
        _1301 = _1293;
    }
    float _1317 = _1301;
    float _1319 = in.m_98.x;
    float _1321 = gl_FragCoord.w;
    float _1323 = _1319 * _1321;
    if (_1289)
    {
        _1211 = _1299;
    }
    float _1325 = _1211;
    float _1327 = -_1309;
    float _1329 = fma(_1251, _1327, _1235);
    float _1331 = -_1309;
    float _1333 = fma(_1249, _1331, _1227);
    float _1335 = _1325;
    if (_1171)
    {
        _1335 = _1305;
    }
    float _1337 = _1335;
    float _1339 = fma(_1313, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1341 = _1337;
    if (_1283)
    {
        _1341 = _1311;
    }
    float _1343 = _1341;
    float _1345 = 1.0 / _1317;
    int _1347 = _329 + 25944;
    uint _1349 = uint(int(uint(_1347) >> uint(2)));
    uint _1351 = uint(int(uint(int(_1349)) >> uint(2)));
    int _1353 = int(_1349) & 3;
    float _1355 = (*spvDescriptorSet0.fp_c9)._m0[int(_1351)][_1353];
    float _1357 = -_1223;
    float _1359 = fma(_1253, _1309, _1357);
    float _1361 = abs(_1329);
    float _1363 = abs(_1333);
    float _1365 = precise::max(_1361, _1363);
    float _1367 = fma(_1313, _1339, -0.212114393711090087890625);
    float _1369 = _202 * _1241;
    float _1371 = _202 * _1247;
    float _1373 = -_693;
    float _1375 = fma(_1373, (*spvDescriptorSet0.fp_c9)._m0[2645].w, 1.0);
    float _1377 = fma(_1313, _1367, 1.570728778839111328125);
    float _1379 = abs(_1359);
    float _1381 = precise::max(_1379, _1365);
    float _1383 = _1307 * 0.636619746685028076171875;
    if (_1289)
    {
        _1213 = _1369;
    }
    float _1385 = _1213;
    float _1387 = _1385;
    if (_1171)
    {
        _1387 = _1371;
    }
    float _1389 = _1387;
    float _1391 = 1.0 / _1381;
    float _1393 = -_1377;
    float _1395 = fma(_1383, _1393, 1.0);
    float _1397 = _202 * _1275;
    float _1399 = -_691;
    float _1401 = fma(_1399, (*spvDescriptorSet0.fp_c9)._m0[2645].w, 1.0);
    float _1403 = -_695;
    float _1405 = fma(_1403, (*spvDescriptorSet0.fp_c9)._m0[2645].w, 1.0);
    float _1407 = _1345 * _1343;
    float _1409 = 1.0 / _1375;
    int _1411 = _329 + 25936;
    uint _1413 = uint(int(uint(_1411) >> uint(2)));
    uint _1415 = uint(int(uint(int(_1413)) >> uint(2)));
    int _1417 = int(_1413) & 3;
    float _1419 = (*spvDescriptorSet0.fp_c9)._m0[int(_1415)][_1417];
    int _1421 = int(_1413) + 1;
    uint _1423 = uint(int(uint(_1421) >> uint(2)));
    int _1425 = _1421 & 3;
    float _1427 = (*spvDescriptorSet0.fp_c9)._m0[int(_1423)][_1425];
    float _1429 = _1389;
    if (_1283)
    {
        _1429 = _1397;
    }
    float _1431 = _1429;
    float _1433 = -_697;
    float _1435 = fma(_1433, (*spvDescriptorSet0.fp_c9)._m0[2645].w, 1.0);
    float _1437 = 1.0 / _1401;
    float _1439 = _1345 * _1431;
    float _1441 = precise::clamp(_1439, 0.0, 1.0);
    float _1443 = precise::max(_715, _1355);
    int _1445 = _329 + 25952;
    uint _1447 = uint(int(uint(_1445) >> uint(2)));
    uint _1449 = uint(int(uint(int(_1447)) >> uint(2)));
    int _1451 = int(_1447) & 3;
    float _1453 = (*spvDescriptorSet0.fp_c9)._m0[int(_1449)][_1451];
    float _1455 = 1.0 / _1405;
    float _1457 = _202 * _1323;
    float _1459 = -(*spvDescriptorSet0.fp_c4)._m0[14].x;
    float _1461 = _1409 * _1459;
    float _1463 = 1.0 / _1435;
    float _1465 = -(*spvDescriptorSet0.fp_c4)._m0[14].x;
    float _1467 = _1437 * _1465;
    float _1469 = trunc(_987);
    int _1471 = int(_1469);
    if (_1283)
    {
        _1315 = _1457;
    }
    float _1473 = _1315;
    float _1475 = abs(_1329);
    float _1477 = _1475 * _1391;
    bool _1479 = _1461 > _463;
    float _1481 = _1359 * _1391;
    float _1483 = precise::max(_715, _1427);
    float _1485 = -(*spvDescriptorSet0.fp_c4)._m0[14].x;
    float _1487 = _1455 * _1485;
    float _1489 = precise::max(_715, _1419);
    float _1491 = _1287 * (*spvDescriptorSet0.fp_c9)._m0[64].x;
    bool _1493 = _1467 > _463;
    bool _1495 = _1493 || _1479;
    float _1497 = float(uint(_709));
    float _1499 = -(*spvDescriptorSet0.fp_c4)._m0[14].x;
    float _1501 = _1463 * _1499;
    bool _1503 = _1487 > _463;
    bool _1505 = _1503 || _1495;
    int _1507 = as_type<int>((*spvDescriptorSet0.fp_c9)._m0[71].w) * as_type<int>((*spvDescriptorSet0.fp_c4)._m0[66].x);
    int _1509 = _1507 + _1471;
    float _1511 = precise::max(_509, _1419);
    float _1513 = _1497 * 0.00390625;
    float _1515 = exp2(_1491);
    float _1517 = float(uint(_735));
    int _1519 = _1509 * 136;
    bool _1521 = _1501 > _463;
    bool _1523 = _1521 || _1505;
    float _1525 = float(uint(_729));
    float _1527 = precise::max(_1511, _1513);
    float _1529 = rint(_1453);
    float _1531 = precise::max(_1529, 0.0);
    uint _1533 = uint(_1531);
    uint _1535 = clamp(_1533, 0u, 65535u);
    float _1537 = float(uint(_703));
    float _1539 = _1525 * 0.00390625;
    int _1541 = _1519 + 4;
    float _1543 = _1517 * 0.00390625;
    float _1545 = _1537 * 0.00390625;
    float _1547 = _1231 + 1.0;
    float _1549 = precise::max(_1483, _1539);
    uint _1551 = uint(int(uint(_1541) >> uint(2)));
    float _1553 = as_type<float>((*spvDescriptorSet0.fp_s1)._m0[int(_1551)]);
    uint _1555 = uint(int(uint(_1519) >> uint(2)));
    float _1557 = as_type<float>((*spvDescriptorSet0.fp_s1)._m0[int(_1555)]);
    float _1559 = _1345 * _1473;
    float _1561 = _1333 * _1391;
    float _1563 = -_1231;
    float _1565 = fma(_1515, _1547, _1563);
    float _1567 = precise::max(_1489, _1545);
    float _1569 = precise::max(_1443, _1543);
    float _1571 = _1455;
    float _1573 = _1463;
    if (_1523)
    {
        _1571 = _246;
    }
    float _1575 = _1571;
    float _1577 = _1575;
    if (_1523)
    {
        _1573 = _248;
    }
    float _1579 = _1573;
    float _1581 = _1579;
    if (!_1523)
    {
        float _1583 = fma(_687, (*spvDescriptorSet0.fp_c9)._m0[47].y, -0.5);
        float _1585 = fma(_685, (*spvDescriptorSet0.fp_c9)._m0[47].x, -0.5);
        float _1587 = precise::min(_463, _1487);
        float _1589 = floor(_1583);
        float _1591 = precise::min(_463, _1501);
        float _1593 = precise::min(_463, _1467);
        float _1595 = precise::min(_463, _1461);
        float _1597 = floor(_1585);
        float _1599 = -_1589;
        float _1601 = _1583 + _1599;
        float _1603 = -_1601;
        float _1605 = _1603 + 1.0;
        float _1607 = -_1597;
        float _1609 = _1585 + _1607;
        float _1611 = -_1609;
        float _1613 = _1611 + 1.0;
        float _1615 = _1609 * _1605;
        float _1617 = _1609 * _1601;
        float _1619 = _1613 * _1605;
        float _1621 = _1587 * _1615;
        float _1623 = _1601 * _1613;
        float _1625 = fma(_1591, _1619, _1621);
        float _1627 = fma(_1593, _1623, _1625);
        float _1629 = fma(_1595, _1617, _1627);
        _1577 = _685;
        _1581 = _687;
        _623 = _1629;
    }
    float _1631 = _1577;
    float _1633 = _1581;
    float _1635 = _623;
    float _1637 = _1081 + (-250.0);
    float _1639 = fma(_287, 6.2500002968590706586837768554688e-05, 0.5);
    float _1641 = precise::clamp(_1639, 0.0, 1.0);
    float _1643 = fma(_285, 6.2500002968590706586837768554688e-05, 0.5);
    float _1645 = precise::clamp(_1643, 0.0, 1.0);
    float _1647 = precise::max(0.0, _1637);
    float _1649 = rint(_1109);
    float _1651 = precise::max(_1649, 0.0);
    uint _1653 = uint(_1651);
    uint _1655 = clamp(_1653, 0u, 65535u);
    float _1657 = fma(_1565, 0.5, 0.5);
    float _1659 = _1647 * 0.001000000047497451305389404296875;
    float _1661 = precise::clamp(_1659, 0.0, 1.0);
    float3 _5656 = float3(_435, _455, float(int(_1535)));
    float3 _5660 = select(_5656, float3(0.0), isnan(_5656));
    float3 _1665 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, _5660.xy, uint(rint(_5660.z)), level(_1569)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, _5660.xy, uint(rint(_5660.z)), level(_1569)).xyz;
    float _1667 = _1665.x;
    float _1669 = _1665.y;
    float _1671 = _1665.z;
    float3 _5676 = float3(_501, _451, float(int(_1535)));
    float3 _5678 = select(_5676, float3(0.0), isnan(_5676));
    float2 _1673 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _5678.xy, uint(rint(_5678.z)), level(_1567)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _5678.xy, uint(rint(_5678.z)), level(_1567)).yz;
    float _1675 = _1673.x;
    float _1677 = _1673.y;
    float3 _5692 = float3(_503, _453, float(int(_1535)));
    float3 _5694 = select(_5692, float3(0.0), isnan(_5692));
    float3 _1679 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _5694.xy, uint(rint(_5694.z)), level(_1549)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _5694.xy, uint(rint(_5694.z)), level(_1549)).xyz;
    float _1681 = _1679.x;
    float _1683 = _1679.y;
    float _1685 = _1679.z;
    float3 _5710 = float3(_1559, _1407, float(int(_1655)));
    float3 _5712 = select(_5710, float3(0.0), isnan(_5710));
    float _1687 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_14).sample_compare(spvDescriptorSet0.fp_t_tcb_14Smplr, _5712.xy, uint(rint(_5712.z)), _1441);
    float _1689 = fma(_1661, 1.39999997615814208984375, 0.070000000298023223876953125);
    float4 _5724 = float4(_1561, _1477, _1481, float(1));
    float4 _5728 = select(_5724, float4(0.0), isnan(_5724));
    float3 _1691 = dm_bs(spvDescriptorSet0.fp_t_tcb_1C.sample(spvDescriptorSet0.fp_t_tcb_1CSmplr, _5728.xyz, uint(rint(_5728.w)), level(_1689)), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_1C, spvDescriptorSet0.fp_t_tcb_1CSmplr_w, _5728.xyz, uint(rint(_5728.w)), level(_1689)).xyz;
    float _1693 = _1691.x;
    float _1695 = _1691.y;
    float _1697 = _1691.z;
    float2 _5741 = float2(_1395, _1657);
    float3 _1699 = dm_bs(spvDescriptorSet0.fp_t_tcb_18.sample(spvDescriptorSet0.fp_t_tcb_18Smplr, select(_5741, float2(0.0), isnan(_5741))), spvDescriptorSet0.dm_border, 7u, spvDescriptorSet0.fp_t_tcb_18, spvDescriptorSet0.fp_t_tcb_18Smplr_w, select(_5741, float2(0.0), isnan(_5741))).xyz;
    float _1701 = _1699.x;
    float _1703 = _1699.y;
    float _1705 = _1699.z;
    float2 _5755 = float2(_1641, _1645);
    float4 _1707 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_5755, float2(0.0), isnan(_5755))), spvDescriptorSet0.dm_border, 8u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_5755, float2(0.0), isnan(_5755))).xyzw;
    float _1709 = _1707.x;
    float _1711 = _1707.y;
    float _1713 = _1707.z;
    float _1715 = _1707.w;
    float2 _5771 = float2(_246, _248);
    float4 _1717 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_5771, float2(0.0), isnan(_5771))), spvDescriptorSet0.dm_border, 9u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_5771, float2(0.0), isnan(_5771))).xyzw;
    float _1719 = _1717.x;
    float _1721 = _1717.y;
    float _1723 = _1717.z;
    float _1725 = _1717.w;
    float3 _5790 = float3(_499, _429, float(int(_1535)));
    float3 _5792 = select(_5790, float3(0.0), isnan(_5790));
    float _1727 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _5792.xy, uint(rint(_5792.z)), level(_1527)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _5792.xy, uint(rint(_5792.z)), level(_1527)).x;
    float2 _5799 = float2(_1631, _1633);
    float3 _1729 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_5799, float2(0.0), isnan(_5799))), spvDescriptorSet0.dm_border, 10u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_5799, float2(0.0), isnan(_5799))).xyz;
    float _1731 = _1729.x;
    float _1733 = _1729.y;
    float _1735 = _1729.z;
    float _1737 = _1235 + (*spvDescriptorSet0.fp_c9)._m0[69].y;
    float _1739 = _1227 + (*spvDescriptorSet0.fp_c9)._m0[69].x;
    float _1741 = -(*spvDescriptorSet0.fp_c9)._m0[2645].w;
    float _1743 = spvFAdd(_1741, 1.000010013580322265625);
    float _1745 = _1737 * _1737;
    float _1747 = in.m_88.x;
    float _1749 = gl_FragCoord.w;
    float _1751 = _1747 * _1749;
    float _1753 = in.m_88.y;
    float _1755 = gl_FragCoord.w;
    float _1757 = _1753 * _1755;
    float _1759 = fma(_1251, 0.5, 0.5);
    float _1761 = fma(_1739, _1739, _1745);
    float _1763 = _1223 + (*spvDescriptorSet0.fp_c9)._m0[69].z;
    float _1765 = (*spvDescriptorSet0.fp_c9)._m0[914].x * 0.28209483623504638671875;
    float _1767 = precise::clamp(_1765, 0.0, 1.0);
    float _1769 = 1.0 / _1743;
    float _1771 = fma(_1763, _1763, _1761);
    float _1773 = -_1767;
    float _1775 = _1773 + 1.0;
    float _1777 = (*spvDescriptorSet0.fp_c9)._m0[915].x * 0.5641896724700927734375;
    float _1779 = precise::clamp(_1777, 0.0, 1.0);
    float _1781 = -(*spvDescriptorSet0.fp_c9)._m0[1007].z;
    float _1783 = _1781 + (*spvDescriptorSet0.fp_c9)._m0[1006].z;
    float _1785 = fma(_1775, (*spvDescriptorSet0.fp_c9)._m0[37].y, _1767);
    bool _1787 = 0.0 < (*spvDescriptorSet0.fp_c9)._m0[43].w;
    float _1789 = rsqrt(_1771);
    float _1791 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c9)._m0[908].x;
    float _1793 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c9)._m0[908].y;
    float _1795 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c9)._m0[908].z;
    float _1797 = _1779 * 0.88622701168060302734375;
    float _1799 = in.m_88.z;
    float _1801 = gl_FragCoord.w;
    float _1803 = _1799 * _1801;
    float _1805 = -_1779;
    float _1807 = _1805 + 1.0;
    float _1809 = _1791 * (*spvDescriptorSet0.fp_c9)._m0[68].x;
    float _1811 = _1793 * (*spvDescriptorSet0.fp_c9)._m0[68].y;
    float _1813 = _1797 * (*spvDescriptorSet0.fp_c9)._m0[991].x;
    float _1815 = _1797 * (*spvDescriptorSet0.fp_c9)._m0[991].y;
    float _1817 = _1795 * (*spvDescriptorSet0.fp_c9)._m0[68].z;
    float _1819 = _1797 * (*spvDescriptorSet0.fp_c9)._m0[991].z;
    float _1821 = fma(_1809, _1807, _1813);
    float _1823 = fma(_1811, _1807, _1815);
    float _1825 = _1785 * 0.88622701168060302734375;
    float _1827 = fma(_1817, _1807, _1819);
    float _1829 = _1737 * _1789;
    float _1831 = _1739 * _1789;
    float _1833 = _1763 * _1789;
    float _1835 = _1769 * (*spvDescriptorSet0.fp_c4)._m0[14].x;
    float _1837 = _1829 * (*spvDescriptorSet0.fp_c9)._m0[69].y;
    float _1839 = fma(_1825, (*spvDescriptorSet0.fp_c9)._m0[911].x, _1821);
    float _1841 = _202 * _1751;
    float _1843 = _1835 * 0.25;
    float _1845 = fma(_1831, (*spvDescriptorSet0.fp_c9)._m0[69].x, _1837);
    float _1847 = fma(_1825, (*spvDescriptorSet0.fp_c9)._m0[911].y, _1823);
    float _1849 = -_463;
    float _1851 = fma(_1835, -0.75, _1849);
    float _1853 = 1.0 / _1843;
    float _1855 = fma(_1833, (*spvDescriptorSet0.fp_c9)._m0[69].z, _1845);
    float _1857 = precise::clamp(_1855, 0.0, 1.0);
    float _1859 = _1847 * 0.18672408163547515869140625;
    float _1861 = _1831 * _1249;
    float _1863 = fma(_1825, (*spvDescriptorSet0.fp_c9)._m0[911].z, _1827);
    float _1865 = -_1857;
    float _1867 = _1865 + 1.0;
    float _1869 = fma(_1839, 0.095146648585796356201171875, _1859);
    float _1871 = _202 * _1757;
    float _1873 = _202 * _1803;
    float _1875 = -_1829;
    float _1877 = -_1861;
    float _1879 = fma(_1875, _1251, _1877);
    float _1881 = fma(_1661, 0.20000000298023223876953125, 0.00999999977648258209228515625);
    float _1883 = _1867 * _1867;
    float _1885 = fma(_1661, -0.20000000298023223876953125, 0.9900000095367431640625);
    float _1887 = fma(_1863, 0.0364394821226596832275390625, _1869);
    float _1889 = -(*spvDescriptorSet0.fp_c9)._m0[1007].y;
    float _1891 = _1889 + (*spvDescriptorSet0.fp_c9)._m0[1006].y;
    float _1893 = fma(_1881, 0.5, 0.5);
    float _1895 = -_1227;
    float _1897 = -_1277;
    float _1899 = fma(_1895, _1249, _1897);
    float _1901 = _1883 * _1883;
    float _1903 = fma(_1881, _1881, 0.00999999977648258209228515625);
    float _1905 = precise::clamp(_1903, 0.0, 1.0);
    float _1907 = -_1833;
    float _1909 = fma(_1907, _1253, _1879);
    float _1911 = precise::clamp(_1909, 0.0, 1.0);
    float _1913 = -(*spvDescriptorSet0.fp_c9)._m0[1007].x;
    float _1915 = _1913 + (*spvDescriptorSet0.fp_c9)._m0[1006].x;
    float _1917 = fma(_1759, _1891, (*spvDescriptorSet0.fp_c9)._m0[1007].y);
    float _1919 = _1851 * _1853;
    float _1921 = precise::clamp(_1919, 0.0, 1.0);
    float _1923 = -_1223;
    float _1925 = fma(_1923, _1253, _1899);
    float _1927 = precise::clamp(_1925, 0.0, 1.0);
    float _1929 = _1249 * (*spvDescriptorSet0.fp_c9)._m0[69].x;
    float _1931 = _1905 * _1905;
    float _1933 = fma(_1759, _1915, (*spvDescriptorSet0.fp_c9)._m0[1007].x);
    float _1935 = _1917 * 0.715200006961822509765625;
    float _1937 = _1867 * _1901;
    float _1939 = _1893 * _1893;
    float _1941 = _1939 * 0.5;
    float _1943 = _1927 * (-9.27999973297119140625);
    float _1945 = -_1251;
    float _1947 = -_1929;
    float _1949 = fma(_1945, (*spvDescriptorSet0.fp_c9)._m0[69].y, _1947);
    float _1951 = -(*spvDescriptorSet0.fp_c9)._m0[1001].x;
    float _1953 = _1951 + (*spvDescriptorSet0.fp_c9)._m0[1000].x;
    float _1955 = _1931 + (-1.0);
    float _1957 = _1911 * _1911;
    float _1959 = fma(_1759, _1783, (*spvDescriptorSet0.fp_c9)._m0[1007].z);
    float _1961 = fma(_1933, 0.2125999927520751953125, _1935);
    float _1963 = -(*spvDescriptorSet0.fp_c9)._m0[1001].y;
    float _1965 = _1963 + (*spvDescriptorSet0.fp_c9)._m0[1000].y;
    float _1967 = -_1941;
    float _1969 = _1967 + 1.0;
    float _1971 = -_1253;
    float _1973 = fma(_1971, (*spvDescriptorSet0.fp_c9)._m0[69].z, _1949);
    float _1975 = precise::clamp(_1973, 0.0, 1.0);
    float _1977 = fma(_1759, _1953, (*spvDescriptorSet0.fp_c9)._m0[1001].x);
    float _1979 = fma(_1957, _1955, 1.0);
    float _1981 = exp2(_1943);
    float _1983 = fma(_1959, 0.072200000286102294921875, _1961);
    float _1985 = fma(_1927, _1969, _1941);
    float _1987 = fma(_1975, _1969, _1941);
    float _1989 = fma(_1759, _1965, (*spvDescriptorSet0.fp_c9)._m0[1001].y);
    float _1991 = _1979 * _1979;
    float _1993 = _1985 * _1987;
    float _1995 = 1.0 / _1983;
    float _1997 = _1931 * 0.31830990314483642578125;
    float _1999 = -(*spvDescriptorSet0.fp_c9)._m0[1001].z;
    float _2001 = _1999 + (*spvDescriptorSet0.fp_c9)._m0[1000].z;
    float _2003 = -(*spvDescriptorSet0.fp_c9)._m0[1001].w;
    float _2005 = fma(_1081, (*spvDescriptorSet0.fp_c9)._m0[1000].w, _2003);
    float _2007 = precise::clamp(_2005, 0.0, 1.0);
    float _2009 = _1885 * _1885;
    float _2011 = 1.0 / _1991;
    float _2013 = fma(_1759, _2001, (*spvDescriptorSet0.fp_c9)._m0[1001].z);
    float _2015 = fma(_1881, 0.02199999988079071044921875, -0.039999999105930328369140625);
    float _2017 = precise::min(_2009, _1981);
    float _2019 = _2013 * 0.31830990314483642578125;
    float _2021 = fma(_1881, -0.0274999998509883880615234375, 0.0425000004470348358154296875);
    float _2023 = 1.0 / _1993;
    float _2025 = _1995 * (*spvDescriptorSet0.fp_c9)._m0[39].z;
    float _2027 = precise::clamp(_2025, 0.0, 1.0);
    float _2029 = fma(_1881, -0.572000026702880859375, 1.03999996185302734375);
    float _2031 = fma(_1885, _2017, _2021);
    float _2033 = fma(_2027, (*spvDescriptorSet0.fp_c9)._m0[39].y, (*spvDescriptorSet0.fp_c9)._m0[39].x);
    float _2035 = _1997 * _2011;
    float _2037 = _2033 * 0.31830990314483642578125;
    float _2039 = fma(_1937, 0.979940712451934814453125, 0.02005931176245212554931640625);
    float _2041 = _1871 * 0.18672408163547515869140625;
    float _2043 = _1975 * _2035;
    float _2045 = fma(_2031, -1.03999996185302734375, _2029);
    float _2047 = precise::clamp(_2045, 0.0, 1.0);
    float _2049 = _1917 * _2037;
    float _2051 = fma(_2031, 1.03999996185302734375, _2015);
    float _2053 = precise::clamp(_2051, 0.0, 1.0);
    float _2055 = _2043 * _2023;
    float _2057 = _2055 * 0.25;
    float _2059 = fma(_1841, 0.095146648585796356201171875, _2041);
    float _2061 = _1933 * _2037;
    float _2063 = _1959 * _2037;
    float _2065 = _2039 * _2057;
    float _2067 = fma(_1873, 0.0364394821226596832275390625, _2059);
    float _2069 = precise::max(_1887, 0.00999999977648258209228515625);
    float _2071 = precise::max(_2067, 0.00999999977648258209228515625);
    float _2073 = 1.0 / _2071;
    float _2075 = _1669 * 0.4774648249149322509765625;
    float _2077 = _1667 * 0.4774648249149322509765625;
    float _2079 = _1677 * 0.2820948064327239990234375;
    float _2081 = _2075 * (*spvDescriptorSet0.fp_c9)._m0[68].y;
    float _2083 = _2077 * (*spvDescriptorSet0.fp_c9)._m0[68].x;
    float _2085 = _1675 + (*spvDescriptorSet0.fp_c9)._m0[37].y;
    float _2087 = precise::clamp(_2085, 0.0, 1.0);
    float _2089 = _2079 * (*spvDescriptorSet0.fp_c9)._m0[991].y;
    float _2091 = _2079 * (*spvDescriptorSet0.fp_c9)._m0[991].x;
    float _2093 = _2079 * (*spvDescriptorSet0.fp_c9)._m0[991].z;
    float _2095 = _1683 * (*spvDescriptorSet0.fp_c9)._m0[40].z;
    float _2097 = _2081 + _2089;
    float _2099 = _2083 + _2091;
    float _2101 = _1671 * 0.4774648249149322509765625;
    float _2103 = _1977 * 0.31830990314483642578125;
    float _2105 = _2097 * 0.586610972881317138671875;
    float _2107 = _1681 * (*spvDescriptorSet0.fp_c9)._m0[40].z;
    float _2109 = fma(_2087, _2095, _2081);
    float _2111 = _2101 * (*spvDescriptorSet0.fp_c9)._m0[68].z;
    float _2113 = fma(_2099, 0.298911988735198974609375, _2105);
    float _2115 = _1989 * 0.31830990314483642578125;
    float _2117 = _1685 * (*spvDescriptorSet0.fp_c9)._m0[40].z;
    float _2119 = 1.0 / _2069;
    float _2121 = fma(_2087, _2107, _2083);
    float _2123 = _2089 + _2109;
    float _2125 = precise::max(_2095, _2115);
    float _2127 = _2111 + _2093;
    float _2129 = precise::max(_2107, _2103);
    float _2131 = _2091 + _2121;
    float _2133 = precise::max(_2117, _2019);
    float _2135 = _2123 * 0.586610972881317138671875;
    float _2137 = precise::max(_2083, _2061);
    float _2139 = fma(_2087, _2117, _2111);
    float _2141 = fma(_2127, 0.114477999508380889892578125, _2113);
    float _2143 = _1287 * (*spvDescriptorSet0.fp_c9)._m0[64].y;
    float _2145 = fma(_2131, 0.298911988735198974609375, _2135);
    float _2147 = _2093 + _2139;
    float _2149 = _463 + (-20.0);
    float _2151 = _2141 * _2073;
    float _2153 = precise::max(_2111, _2063);
    float _2155 = exp2(_2143);
    float _2157 = fma(_2147, 0.114477999508380889892578125, _2145);
    float _2159 = -_1635;
    float _2161 = _2149 + _2159;
    float _2163 = -_463;
    float _2165 = -(*spvDescriptorSet0.fp_c9)._m0[41].x;
    float _2167 = _2163 + _2165;
    float _2169 = precise::max(_2081, _2049);
    float _2171 = _2157 * _2119;
    float _2173 = fma(_1921, _2161, _1635);
    float _2175 = precise::min(_2151, (*spvDescriptorSet0.fp_c9)._m0[27].w);
    float _2177 = _2167 * (*spvDescriptorSet0.fp_c9)._m0[41].y;
    float _2179 = precise::clamp(_2177, 0.0, 1.0);
    float _2181 = -_1687;
    float _2183 = _2181 + 1.0;
    float _2185 = precise::min(_2171, (*spvDescriptorSet0.fp_c9)._m0[27].w);
    float _2187 = fma(_2047, 0.02005931176245212554931640625, _2053);
    float _2189 = _2175 * 0.31830990314483642578125;
    float _2191 = fma(_2179, _2183, _1687);
    float _2193 = _2185 * _1693;
    float _2195 = _2185 * _1695;
    float _2197 = _2185 * _1697;
    float _2199 = -_2155;
    float _2201 = _2199 + 1.0;
    float _2203 = -_2193;
    float _2205 = fma(_1841, _2189, _2203);
    float _2207 = -_2195;
    float _2209 = fma(_1871, _2189, _2207);
    float _2211 = -_2197;
    float _2213 = fma(_1873, _2189, _2211);
    float _2215 = _2201 * (*spvDescriptorSet0.fp_c9)._m0[64].z;
    float _2217 = fma(_2007, _2205, _2193);
    float _2219 = fma(_2007, _2209, _2195);
    float _2221 = fma(_2007, _2213, _2197);
    float _2223 = _1701 * _2215;
    float _2225 = _1703 * _2215;
    float _2227 = _1705 * _2215;
    float _2229 = -_2215;
    float _2231 = _2229 + 1.0;
    float _2233;
    float _2235;
    float _2237;
    float _2239;
    float _2241;
    float _2243;
    if (!_1787)
    {
        _2233 = 0.0;
        _2235 = 0.0;
        _2237 = 0.0;
        _2239 = 0.0;
        _2241 = 0.0;
        _2243 = 0.0;
        _2245 = true;
    }
    else
    {
        float _2247 = -_457;
        float _2249 = _2247 + (*spvDescriptorSet0.fp_c9)._m0[43].y;
        float _2251 = -_287;
        float _2253 = _2251 + (*spvDescriptorSet0.fp_c9)._m0[43].x;
        float _2255 = -_285;
        float _2257 = _2255 + (*spvDescriptorSet0.fp_c9)._m0[43].z;
        float _2259 = _2249 * _2249;
        float _2261 = fma(_2253, _2253, _2259);
        float _2263 = fma(_2257, _2257, _2261);
        float _2265 = rsqrt(_2263);
        float _2267 = sqrt(_2263);
        float _2269 = _2249 * _2265;
        float _2271 = _2253 * _2265;
        float _2273 = _2257 * _2265;
        float _2275 = -_1235;
        float _2277 = _2275 + _2269;
        float _2279 = -_1227;
        float _2281 = _2279 + _2271;
        float _2283 = -_1223;
        float _2285 = _2283 + _2273;
        float _2287 = _2277 * _2277;
        float _2289 = -_2267;
        float _2291 = _2289 + (*spvDescriptorSet0.fp_c9)._m0[43].w;
        float _2293 = fma(_2281, _2281, _2287);
        float _2295 = _2291 * (*spvDescriptorSet0.fp_c9)._m0[46].y;
        float _2297 = precise::clamp(_2295, 0.0, 1.0);
        float _2299 = fma(_2285, _2285, _2293);
        float _2301 = abs(_2297);
        float _2303 = log2(_2301);
        float _2305 = rsqrt(_2299);
        float _2307 = _2277 * _2305;
        float _2309 = _2281 * _2305;
        float _2311 = _2285 * _2305;
        float _2313 = _1251 * _2307;
        float _2315 = fma(_1249, _2309, _2313);
        float _2317 = _2271 * (*spvDescriptorSet0.fp_c9)._m0[44].x;
        float _2319 = fma(_1253, _2311, _2315);
        float _2321 = precise::clamp(_2319, 0.0, 1.0);
        float _2323 = _2303 * (*spvDescriptorSet0.fp_c9)._m0[45].w;
        float _2325 = _2321 * _2321;
        float _2327 = exp2(_2323);
        float _2329 = fma(_1955, _2325, 1.0);
        float _2331 = -_2269;
        float _2333 = -_2317;
        float _2335 = fma(_2331, (*spvDescriptorSet0.fp_c9)._m0[44].y, _2333);
        float _2337 = _1251 * _2269;
        float _2339 = _2329 * _2329;
        float _2341 = -_2273;
        float _2343 = fma(_2341, (*spvDescriptorSet0.fp_c9)._m0[44].z, _2335);
        float _2345 = fma(_1249, _2271, _2337);
        float _2347 = 1.0 / _2339;
        float _2349 = -(*spvDescriptorSet0.fp_c9)._m0[44].w;
        float _2351 = _2343 + _2349;
        float _2353 = fma(_1253, _2273, _2345);
        float _2355 = precise::clamp(_2353, 0.0, 1.0);
        float _2357 = _2351 * (*spvDescriptorSet0.fp_c9)._m0[46].w;
        float _2359 = precise::clamp(_2357, 0.0, 1.0);
        float _2361 = _2327 * _2359;
        float _2363 = _2355 * _2361;
        float _2365 = _1931 * _2347;
        float _2367 = _2363 * (*spvDescriptorSet0.fp_c9)._m0[45].x;
        float _2369 = _2363 * (*spvDescriptorSet0.fp_c9)._m0[45].y;
        float _2371 = _2363 * (*spvDescriptorSet0.fp_c9)._m0[45].z;
        float _2373 = _2365 * _2363;
        float _2375 = _2373 * (*spvDescriptorSet0.fp_c9)._m0[45].x;
        float _2377 = _2373 * (*spvDescriptorSet0.fp_c9)._m0[45].y;
        float _2379 = _2373 * (*spvDescriptorSet0.fp_c9)._m0[45].z;
        _2233 = _2367;
        _2235 = _2369;
        _2237 = _2371;
        _2239 = _2375;
        _2241 = _2377;
        _2243 = _2379;
    }
    _2245 = false;
    float _2381 = _2233;
    float _2383 = _2235;
    float _2385 = _2237;
    float _2387 = _2239;
    float _2389 = _2241;
    float _2391 = _2243;
    float _2393 = gl_FragCoord.w;
    float _2395 = in.m_88.w;
    float _2397 = gl_FragCoord.w;
    float _2399 = _2395 * _2397;
    float _2401 = gl_FragCoord.x;
    float _2403 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _2405 = _2401 / _2403;
    float _2407 = gl_FragCoord.y;
    float _2409 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _2411 = _2407 / _2409;
    float _2413 = (*spvDescriptorSet0.fp_c9)._m0[62].z + (-1.0);
    float _2415 = 1.0 / _2393;
    float _2417 = _2405 * (*spvDescriptorSet0.fp_c9)._m0[989].x;
    float _2419 = _2411 * (*spvDescriptorSet0.fp_c9)._m0[989].y;
    float _2421 = _2415 * _2399;
    float _2423 = _2421 * (*spvDescriptorSet0.fp_c9)._m0[62].y;
    float _2425 = -_2423;
    float _2427 = fma(_2425, _2413, 1.0);
    float _2429 = log2(_2427);
    float _2431 = _2429 * 0.693147182464599609375;
    float _2433 = _2431 * (*spvDescriptorSet0.fp_c9)._m0[62].w;
    float3 _6886 = float3(_2417, _2419, _2433);
    float _2435 = dm_bs(spvDescriptorSet0.fp_t_tcb_24.sample(spvDescriptorSet0.fp_t_tcb_24Smplr, select(_6886, float3(0.0), isnan(_6886))), spvDescriptorSet0.dm_border, 11u, spvDescriptorSet0.fp_t_tcb_24, spvDescriptorSet0.fp_t_tcb_24Smplr_w, select(_6886, float3(0.0), isnan(_6886))).x;
    float _2437 = _1235 * _1251;
    float _2439 = _1235 * 0.75187969207763671875;
    float _2441 = _1227 * 0.75187969207763671875;
    float _2443 = fma(_2087, _2133, _2153);
    float _2445 = fma(_1227, _1249, _2437);
    float _2447 = -_2173;
    float _2449 = _2421 + _2447;
    float _2451 = fma(_1223, _1253, _2445);
    float _2453 = _2093 + _2443;
    float _2455 = _1927 + 1.0;
    bool _2457 = as_type<uint>(_1553) > 0u;
    float _2459 = _2451 * _2451;
    float _2461 = fma(_2459, 0.565323054790496826171875, 0.434676945209503173828125);
    float _2463 = sqrt(_2461);
    bool _2465 = _2461 >= 0.0;
    bool _2467 = isnan(_2461);
    bool _2469 = _2465 || _2467;
    bool _2471 = isnan(0.0);
    bool _2473 = _2469 || _2471;
    float _2475 = _1223 * 0.75187969207763671875;
    float _2477 = fma(_2451, 0.75187969207763671875, _2463);
    float _2479 = -_2439;
    float _2481 = fma(_1251, _2477, _2479);
    float _2483 = -_2441;
    float _2485 = fma(_1249, _2477, _2483);
    float _2487 = -_2475;
    float _2489 = fma(_1253, _2477, _2487);
    float _2491 = fma((*spvDescriptorSet0.fp_c11)._m0[15].w, (*spvDescriptorSet0.fp_c11)._m0[15].w, 1.0);
    float _2493 = (*spvDescriptorSet0.fp_c11)._m0[15].w * 2.0;
    float _2495 = _2473 ? _2481 : (-0.0);
    float _2497 = fma(_2087, _2129, _2137);
    float _2499 = _2473 ? _2485 : (-0.0);
    float _2501 = _1727 * _2191;
    float _2503 = _2473 ? _2489 : (-0.0);
    float _2505 = _2495 * (*spvDescriptorSet0.fp_c9)._m0[69].y;
    bool _2507 = as_type<uint>(_1557) > 0u;
    float _2509 = fma(_2499, (*spvDescriptorSet0.fp_c9)._m0[69].x, _2505);
    float _2511 = fma(_2503, (*spvDescriptorSet0.fp_c9)._m0[69].z, _2509);
    float _2513 = -_2493;
    float _2515 = fma(_2511, _2513, _2491);
    float _2517 = _1715 + (*spvDescriptorSet0.fp_c11)._m0[15].x;
    float _2519 = fma(_2087, _2125, _2169);
    float _2521 = _2091 + _2497;
    float _2523 = 1.0 / _2517;
    float _2525 = _2089 + _2519;
    float _2527 = abs(_2515);
    float _2529 = log2(_2527);
    float _2531 = _2529 * 1.5;
    float _2533 = exp2(_2531);
    bool _2535 = !_2507;
    float _2537 = 0.0;
    float _2539 = 0.0;
    float _2541 = 0.0;
    float _2543 = 0.0;
    float _2545 = 0.0;
    float _2547 = 0.0;
    float _2549 = 0.0;
    float _2551 = 0.0;
    float _2553 = 0.0;
    float _2555 = 0.0;
    float _2557 = 0.0;
    float _2559 = 0.0;
    if (!_2535)
    {
        int _2561 = 0;
        bool _2563;
        do
        {
            int _2565 = _2561;
            float _2567 = _2537;
            float _2569 = _2539;
            float _2571 = _2541;
            float _2573 = _2543;
            float _2575 = _2545;
            float _2577 = _2547;
            int _2579 = _2565 << 1;
            int _2581 = _2579 + _1519;
            int _2583 = _2581 + 8;
            int _2585 = _2583;
            int _2587 = _111(_2585, (*spvDescriptorSet0.fp_s1));
            int _2589 = _2565 + 1;
            bool _2591 = uint(_2589) >= as_type<uint>(_1557);
            int _2593 = _2587 & 65535;
            int _2595 = _2593 * 48;
            int _2597 = _2595 + 1168;
            uint _2599 = uint(int(uint(_2597) >> uint(2)));
            uint _2601 = uint(int(uint(int(_2599)) >> uint(2)));
            int _2603 = int(_2599) & 3;
            float _2605 = (*spvDescriptorSet0.fp_c9)._m0[int(_2601)][_2603];
            int _2607 = int(_2599) + 1;
            uint _2609 = uint(int(uint(_2607) >> uint(2)));
            int _2611 = _2607 & 3;
            float _2613 = (*spvDescriptorSet0.fp_c9)._m0[int(_2609)][_2611];
            int _2615 = _2595 + 1176;
            uint _2617 = uint(int(uint(_2615) >> uint(2)));
            uint _2619 = uint(int(uint(int(_2617)) >> uint(2)));
            int _2621 = int(_2617) & 3;
            float _2623 = (*spvDescriptorSet0.fp_c9)._m0[int(_2619)][_2621];
            int _2625 = int(_2617) + 1;
            uint _2627 = uint(int(uint(_2625) >> uint(2)));
            int _2629 = _2625 & 3;
            float _2631 = (*spvDescriptorSet0.fp_c9)._m0[int(_2627)][_2629];
            float _2633 = -_457;
            float _2635 = _2633 + _2613;
            float _2637 = -_287;
            float _2639 = _2637 + _2605;
            float _2641 = _2635 * _2635;
            float _2643 = -_285;
            float _2645 = _2643 + _2623;
            float _2647 = fma(_2639, _2639, _2641);
            float _2649 = fma(_2645, _2645, _2647);
            int _2651 = _2595 + 1200;
            uint _2653 = uint(int(uint(_2651) >> uint(2)));
            uint _2655 = uint(int(uint(int(_2653)) >> uint(2)));
            int _2657 = int(_2653) & 3;
            float _2659 = (*spvDescriptorSet0.fp_c9)._m0[int(_2655)][_2657];
            float _2661 = rsqrt(_2649);
            float _2663 = sqrt(_2649);
            float _2665 = _2635 * _2661;
            float _2667 = _2639 * _2661;
            float _2669 = _2645 * _2661;
            int _2671 = _2595 + 1192;
            uint _2673 = uint(int(uint(_2671) >> uint(2)));
            uint _2675 = uint(int(uint(int(_2673)) >> uint(2)));
            int _2677 = int(_2673) & 3;
            float _2679 = (*spvDescriptorSet0.fp_c9)._m0[int(_2675)][_2677];
            int _2681 = int(_2673) + 1;
            uint _2683 = uint(int(uint(_2681) >> uint(2)));
            int _2685 = _2681 & 3;
            float _2687 = (*spvDescriptorSet0.fp_c9)._m0[int(_2683)][_2685];
            float _2689 = -_1235;
            float _2691 = _2689 + _2665;
            float _2693 = -_1227;
            float _2695 = _2693 + _2667;
            float _2697 = _2691 * _2691;
            float _2699 = -_2663;
            float _2701 = _2699 + _2631;
            float _2703 = fma(_2695, _2695, _2697);
            float _2705 = -_1223;
            float _2707 = _2705 + _2669;
            float _2709 = fma(_2707, _2707, _2703);
            float _2711 = rsqrt(_2709);
            float _2713 = _2701 * _2659;
            float _2715 = precise::clamp(_2713, 0.0, 1.0);
            int _2717 = _2595 + 1184;
            uint _2719 = uint(int(uint(_2717) >> uint(2)));
            uint _2721 = uint(int(uint(int(_2719)) >> uint(2)));
            int _2723 = int(_2719) & 3;
            float _2725 = (*spvDescriptorSet0.fp_c9)._m0[int(_2721)][_2723];
            int _2727 = int(_2719) + 1;
            uint _2729 = uint(int(uint(_2727) >> uint(2)));
            int _2731 = _2727 & 3;
            float _2733 = (*spvDescriptorSet0.fp_c9)._m0[int(_2729)][_2731];
            float _2735 = abs(_2715);
            float _2737 = log2(_2735);
            float _2739 = _2691 * _2711;
            float _2741 = _2695 * _2711;
            float _2743 = _2707 * _2711;
            float _2745 = _1251 * _2665;
            float _2747 = _1251 * _2739;
            float _2749 = fma(_1249, _2741, _2747);
            float _2751 = fma(_1253, _2743, _2749);
            float _2753 = precise::clamp(_2751, 0.0, 1.0);
            float _2755 = _2737 * _2687;
            float _2757 = fma(_1249, _2667, _2745);
            float _2759 = _2753 * _2753;
            float _2761 = fma(_1253, _2669, _2757);
            float _2763 = precise::clamp(_2761, 0.0, 1.0);
            float _2765 = exp2(_2755);
            float _2767 = fma(_1955, _2759, 1.0);
            float _2769 = _2767 * _2767;
            float _2771 = 1.0 / _2769;
            float _2773 = _2763 * _2765;
            float _2775 = fma(_2773, _2679, _2567);
            float _2777 = fma(_2773, _2725, _2569);
            float _2779 = fma(_2773, _2733, _2571);
            float _2781 = _1931 * _2771;
            float _2783 = _2781 * _2773;
            float _2785 = fma(_2783, _2725, _2573);
            float _2787 = fma(_2783, _2733, _2575);
            float _2789 = fma(_2783, _2679, _2577);
            _2563 = !_2591;
            _2561 = _2589;
            _2537 = _2775;
            _2539 = _2777;
            _2541 = _2779;
            _2543 = _2785;
            _2545 = _2787;
            _2547 = _2789;
            _2549 = _2785;
            _2551 = _2787;
            _2553 = _2777;
            _2555 = _2779;
            _2557 = _2775;
            _2559 = _2789;
        } while (_2563);
    }
    float _2791 = _2549;
    float _2793 = _2551;
    float _2795 = _2553;
    float _2797 = _2555;
    float _2799 = _2557;
    float _2801 = _2559;
    float _2803 = _2449 * _2455;
    bool _2805 = !_2457;
    float _2807 = _2799;
    float _2809 = _2795;
    float _2811 = _2797;
    float _2813 = _2791;
    float _2815 = _2793;
    float _2817 = _2801;
    float _2819 = _2795;
    float _2821 = _2797;
    float _2823 = _2799;
    float _2825 = _2791;
    float _2827 = _2793;
    float _2829 = _2801;
    if (!_2805)
    {
        int _2831 = 0;
        bool _2833;
        do
        {
            int _2835 = _2831;
            float _2837 = _2807;
            float _2839 = _2809;
            float _2841 = _2811;
            float _2843 = _2813;
            float _2845 = _2815;
            float _2847 = _2817;
            int _2849 = _2835 << 1;
            int _2851 = _2849 + _1519;
            int _2853 = _2851 + 72;
            int _2855 = _2853;
            int _2857 = _111(_2855, (*spvDescriptorSet0.fp_s1));
            int _2859 = _2835 + 1;
            bool _2861 = uint(_2859) >= as_type<uint>(_1553);
            int _2863 = _2857 << 6;
            int _2865 = 4194240 & _2863;
            int _2867 = _2865 + 10384;
            uint _2869 = uint(int(uint(_2867) >> uint(2)));
            uint _2871 = uint(int(uint(int(_2869)) >> uint(2)));
            int _2873 = int(_2869) & 3;
            float _2875 = (*spvDescriptorSet0.fp_c9)._m0[int(_2871)][_2873];
            int _2877 = int(_2869) + 1;
            uint _2879 = uint(int(uint(_2877) >> uint(2)));
            int _2881 = _2877 & 3;
            float _2883 = (*spvDescriptorSet0.fp_c9)._m0[int(_2879)][_2881];
            int _2885 = _2865 + 10392;
            uint _2887 = uint(int(uint(_2885) >> uint(2)));
            uint _2889 = uint(int(uint(int(_2887)) >> uint(2)));
            int _2891 = int(_2887) & 3;
            float _2893 = (*spvDescriptorSet0.fp_c9)._m0[int(_2889)][_2891];
            int _2895 = int(_2887) + 1;
            uint _2897 = uint(int(uint(_2895) >> uint(2)));
            int _2899 = _2895 & 3;
            float _2901 = (*spvDescriptorSet0.fp_c9)._m0[int(_2897)][_2899];
            int _2903 = _2865 + 10436;
            uint _2905 = uint(int(uint(_2903) >> uint(2)));
            uint _2907 = uint(int(uint(int(_2905)) >> uint(2)));
            int _2909 = int(_2905) & 3;
            float _2911 = (*spvDescriptorSet0.fp_c9)._m0[int(_2907)][_2909];
            int _2913 = _2865 + 10444;
            uint _2915 = uint(int(uint(_2913) >> uint(2)));
            uint _2917 = uint(int(uint(int(_2915)) >> uint(2)));
            int _2919 = int(_2915) & 3;
            float _2921 = (*spvDescriptorSet0.fp_c9)._m0[int(_2917)][_2919];
            float _2923 = -_457;
            float _2925 = _2923 + _2883;
            float _2927 = -_287;
            float _2929 = _2927 + _2875;
            float _2931 = _2925 * _2925;
            float _2933 = -_285;
            float _2935 = _2933 + _2893;
            float _2937 = fma(_2929, _2929, _2931);
            float _2939 = fma(_2935, _2935, _2937);
            float _2941 = rsqrt(_2939);
            float _2943 = _2925 * _2941;
            float _2945 = _2929 * _2941;
            float _2947 = _2935 * _2941;
            float _2949 = -_1235;
            float _2951 = _2949 + _2943;
            float _2953 = -_1227;
            float _2955 = _2953 + _2945;
            float _2957 = sqrt(_2939);
            float _2959 = -_1223;
            float _2961 = _2959 + _2947;
            float _2963 = _2951 * _2951;
            float _2965 = fma(_2955, _2955, _2963);
            int _2967 = _2865 + 10400;
            uint _2969 = uint(int(uint(_2967) >> uint(2)));
            uint _2971 = uint(int(uint(int(_2969)) >> uint(2)));
            int _2973 = int(_2969) & 3;
            float _2975 = (*spvDescriptorSet0.fp_c9)._m0[int(_2971)][_2973];
            int _2977 = int(_2969) + 1;
            uint _2979 = uint(int(uint(_2977) >> uint(2)));
            int _2981 = _2977 & 3;
            float _2983 = (*spvDescriptorSet0.fp_c9)._m0[int(_2979)][_2981];
            float _2985 = fma(_2961, _2961, _2965);
            int _2987 = _2865 + 10424;
            uint _2989 = uint(int(uint(_2987) >> uint(2)));
            uint _2991 = uint(int(uint(int(_2989)) >> uint(2)));
            int _2993 = int(_2989) & 3;
            float _2995 = (*spvDescriptorSet0.fp_c9)._m0[int(_2991)][_2993];
            int _2997 = int(_2989) + 1;
            uint _2999 = uint(int(uint(_2997) >> uint(2)));
            int _3001 = _2997 & 3;
            float _3003 = (*spvDescriptorSet0.fp_c9)._m0[int(_2999)][_3001];
            float _3005 = rsqrt(_2985);
            float _3007 = -_2957;
            float _3009 = _3007 + _2901;
            float _3011 = _3009 * _2911;
            float _3013 = precise::clamp(_3011, 0.0, 1.0);
            int _3015 = _2865 + 10408;
            uint _3017 = uint(int(uint(_3015) >> uint(2)));
            uint _3019 = uint(int(uint(int(_3017)) >> uint(2)));
            int _3021 = int(_3017) & 3;
            float _3023 = (*spvDescriptorSet0.fp_c9)._m0[int(_3019)][_3021];
            int _3025 = int(_3017) + 1;
            uint _3027 = uint(int(uint(_3025) >> uint(2)));
            int _3029 = _3025 & 3;
            float _3031 = (*spvDescriptorSet0.fp_c9)._m0[int(_3027)][_3029];
            float _3033 = abs(_3013);
            float _3035 = log2(_3033);
            float _3037 = _2951 * _3005;
            float _3039 = _2955 * _3005;
            float _3041 = _2961 * _3005;
            float _3043 = _1251 * _3037;
            float _3045 = fma(_1249, _3039, _3043);
            int _3047 = _2865 + 10416;
            uint _3049 = uint(int(uint(_3047) >> uint(2)));
            uint _3051 = uint(int(uint(int(_3049)) >> uint(2)));
            int _3053 = int(_3049) & 3;
            float _3055 = (*spvDescriptorSet0.fp_c9)._m0[int(_3051)][_3053];
            int _3057 = int(_3049) + 1;
            uint _3059 = uint(int(uint(_3057) >> uint(2)));
            int _3061 = _3057 & 3;
            float _3063 = (*spvDescriptorSet0.fp_c9)._m0[int(_3059)][_3061];
            float _3065 = fma(_1253, _3041, _3045);
            float _3067 = precise::clamp(_3065, 0.0, 1.0);
            float _3069 = _3067 * _3067;
            float _3071 = fma(_1955, _3069, 1.0);
            float _3073 = _2945 * _2975;
            float _3075 = _3071 * _3071;
            float _3077 = -_2943;
            float _3079 = -_3073;
            float _3081 = fma(_3077, _2983, _3079);
            float _3083 = _1251 * _2943;
            float _3085 = 1.0 / _3075;
            float _3087 = _3035 * _3003;
            float _3089 = fma(_1249, _2945, _3083);
            float _3091 = fma(_1253, _2947, _3089);
            float _3093 = precise::clamp(_3091, 0.0, 1.0);
            float _3095 = exp2(_3087);
            float _3097 = -_2947;
            float _3099 = fma(_3097, _3023, _3081);
            float _3101 = -_3031;
            float _3103 = _3099 + _3101;
            float _3105 = _3103 * _2921;
            float _3107 = precise::clamp(_3105, 0.0, 1.0);
            float _3109 = _3095 * _3107;
            float _3111 = _1931 * _3085;
            float _3113 = _3093 * _3109;
            float _3115 = _3111 * _3113;
            float _3117 = fma(_3113, _2995, _2837);
            float _3119 = fma(_3113, _3055, _2839);
            float _3121 = fma(_3113, _3063, _2841);
            float _3123 = fma(_3115, _3055, _2843);
            float _3125 = fma(_3115, _3063, _2845);
            float _3127 = fma(_3115, _2995, _2847);
            _2833 = !_2861;
            _2831 = _2859;
            _2807 = _3117;
            _2809 = _3119;
            _2811 = _3121;
            _2813 = _3123;
            _2815 = _3125;
            _2817 = _3127;
            _2819 = _3119;
            _2821 = _3121;
            _2823 = _3117;
            _2825 = _3123;
            _2827 = _3125;
            _2829 = _3127;
        } while (_2833);
    }
    float _3129 = _2819;
    float _3131 = _2821;
    float _3133 = _2823;
    float _3135 = _2825;
    float _3137 = _2827;
    float _3139 = _2829;
    float _3141 = _2533 * 12.56637096405029296875;
    float _3143 = _1715 + (*spvDescriptorSet0.fp_c11)._m0[15].y;
    float _3145 = _2803 * (-1.44269502162933349609375);
    float _3147 = _3129 + _2381;
    float _3149 = _3131 + _2383;
    float _3151 = _3133 + _2385;
    float _3153 = 1.0 / _3141;
    float _3155 = _3143 * _3145;
    float _3157 = fma(_2521, 3.1415927410125732421875, _3147);
    float _3159 = fma(_2525, 3.1415927410125732421875, _3149);
    float _3161 = fma(_2453, 3.1415927410125732421875, _3151);
    float _3163 = _1715 + (*spvDescriptorSet0.fp_c11)._m0[15].z;
    float _3165 = _2501 * (*spvDescriptorSet0.fp_c9)._m0[70].x;
    float _3167 = _2517 * _3145;
    float _3169 = 1.0 / _3143;
    float _3171 = _3163 * _3145;
    float _3173 = -(*spvDescriptorSet0.fp_c11)._m0[15].w;
    float _3175 = fma(_3173, (*spvDescriptorSet0.fp_c11)._m0[15].w, 1.0);
    float _3177 = _3135 + _2387;
    float _3179 = _3137 + _2389;
    float _3181 = _3139 + _2391;
    float _3183 = _2065 * (*spvDescriptorSet0.fp_c9)._m0[70].x;
    float _3185 = _2217 + _3177;
    float _3187 = exp2(_3167);
    float _3189 = -_2053;
    float _3191 = _3189 + 1.0;
    float _3193 = _3175 * _3153;
    float _3195 = _2219 + _3179;
    float _3197 = _2221 + _3181;
    float _3199 = _3157 * _3191;
    float _3201 = _3159 * _3191;
    float _3203 = _3161 * _3191;
    float _3205 = _1709 * _3165;
    float _3207 = _2501 * (*spvDescriptorSet0.fp_c9)._m0[70].z;
    float _3209 = _1709 * _3199;
    float _3211 = _2501 * (*spvDescriptorSet0.fp_c9)._m0[70].y;
    float _3213 = _1711 * _3201;
    float _3215 = _1713 * _3207;
    float _3217 = _1713 * _3203;
    float _3219 = exp2(_3155);
    float _3221 = _3209 * 0.079577468335628509521484375;
    float _3223 = _1711 * _3211;
    float _3225 = _3213 * 0.079577468335628509521484375;
    float _3227 = _3217 * 0.079577468335628509521484375;
    float _3229 = fma(_3193, _3205, _3221);
    float _3231 = _2187 * _3185;
    float _3233 = fma(_3193, _3223, _3225);
    float _3235 = exp2(_3171);
    float _3237 = in.m_100.x;
    float _3239 = gl_FragCoord.w;
    float _3241 = _3237 * _3239;
    float _3243 = fma(_3193, _3215, _3227);
    float _3245 = _1715 * _3233;
    float _3247 = _2187 * _3195;
    float _3249 = _2065 * (*spvDescriptorSet0.fp_c9)._m0[70].y;
    float _3251 = _1715 * _3229;
    float _3253 = _3245 * _3169;
    float _3255 = 1.0 / _3163;
    float _3257 = _1715 * _3243;
    float _3259 = 0.0 + _3187;
    float _3261 = precise::clamp(_3259, 0.0, 1.0);
    float _3263 = _2187 * _3197;
    float _3265 = _2065 * (*spvDescriptorSet0.fp_c9)._m0[70].z;
    float _3267 = 0.0 + _3219;
    float _3269 = precise::clamp(_3267, 0.0, 1.0);
    float _3271 = fma(_3183, _2501, _3231);
    float _3273 = fma(_3249, _2501, _3247);
    float _3275 = 0.0 + _3235;
    float _3277 = precise::clamp(_3275, 0.0, 1.0);
    float _3279 = _3251 * _2523;
    float _3281 = -_3261;
    float _3283 = _3281 + 1.0;
    float _3285 = fma(_3265, _2501, _3263);
    float _3287 = -_3269;
    float _3289 = _3287 + 1.0;
    float _3291 = _1725 * _2435;
    float _3293 = fma(_3279, _3283, _3271);
    float _3295 = _3257 * _3255;
    float _3297 = -_3277;
    float _3299 = _3297 + 1.0;
    float _3301 = fma(_3253, _3289, _3273);
    float _3303 = fma(_1731, _3261, _3293);
    float _3305 = _1725 * _2231;
    float _3307 = fma(_3295, _3299, _3285);
    float _3309 = fma(_1733, _3269, _3301);
    float _3311 = fma(_2223, _3291, _1719);
    float _3313 = precise::max(0.0, _3303);
    float _3315 = fma(_1735, _3277, _3307);
    float _3317 = fma(_2225, _3291, _1721);
    float _3319 = precise::max(0.0, _3309);
    float _3321 = fma(_2227, _3291, _1723);
    float _3323 = fma(_3305, _3313, _3311);
    float _3325 = precise::max(0.0, _3315);
    float _3327 = _2415 * _3241;
    float _3329 = fma(_3305, _3319, _3317);
    float _3331 = fma(_3305, _3325, _3321);
    out.m_103.x = _3323;
    out.m_103.y = _3329;
    out.m_103.z = _3331;
    out.m_103.w = _3327;
    out.m_105.x = (*spvDescriptorSet0.fp_c11)._m0[44].z;
    return out;
}

