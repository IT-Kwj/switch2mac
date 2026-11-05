#pragma clang diagnostic ignored "-Wmissing-prototypes"
#pragma clang diagnostic ignored "-Wmissing-braces"

#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

template<typename T, size_t Num>
struct spvUnsafeArray
{
    T elements[Num ? Num : 1];
    
    thread T& operator [] (size_t pos) thread
    {
        return elements[pos];
    }
    constexpr const thread T& operator [] (size_t pos) const thread
    {
        return elements[pos];
    }
    
    device T& operator [] (size_t pos) device
    {
        return elements[pos];
    }
    constexpr const device T& operator [] (size_t pos) const device
    {
        return elements[pos];
    }
    
    constexpr const constant T& operator [] (size_t pos) const constant
    {
        return elements[pos];
    }
    
    threadgroup T& operator [] (size_t pos) threadgroup
    {
        return elements[pos];
    }
    constexpr const threadgroup T& operator [] (size_t pos) const threadgroup
    {
        return elements[pos];
    }
};

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
    constant _16* cp_c5 [[id(1)]];
    constant _16* cp_c6 [[id(2)]];
    constant _16* cp_c3 [[id(3)]];
    constant _16* cp_c4 [[id(4)]];
    device _29* cp_s0 [[id(5)]];
    device _29* cp_s1 [[id(6)]];
    texture2d_array<float> cp_t_tcb_8 [[id(7)]];
    sampler cp_t_tcb_8Smplr [[id(8)]];
};

static inline __attribute__((always_inline))
int _56(thread const int& _2883, thread const int& _2884, constant _10& support_buffer)
{
    int _2887 = 1 + _2884;
    float _2889 = support_buffer._m5[_2887].x;
    bool _2891 = _2889 == 1.0;
    if (_2891)
    {
        return _2883;
    }
    float _2893 = float(_2883);
    float _2895 = _2893 * _2889;
    int _2897 = int(_2895);
    return _2897;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _39 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _625 = false;
    float _60 = as_type<float>(gl_WorkGroupID.x);
    float _62 = as_type<float>(gl_LocalInvocationID.x);
    int _64 = as_type<int>(_60) << 6;
    int _66 = _64 + as_type<int>(_62);
    bool _70 = uint(_66) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    if (_70)
    {
        return;
    }
    int _72 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * 48;
    uint _75 = uint(int(uint(_72) >> uint(2)));
    uint _77 = uint(int(uint(int(_75)) >> uint(2)));
    int _79 = int(_75) & 3;
    float _81 = (*spvDescriptorSet0.cp_c5)._m0[int(_77)][_79];
    int _83 = _66;
    int _85 = 0;
    int _87 = _56(_83, _85, (*spvDescriptorSet0.support_buffer));
    int _89 = as_type<int>(_81);
    int _91 = 0;
    int _93 = _56(_89, _91, (*spvDescriptorSet0.support_buffer));
    int3 _1135 = int3(_87, _93, 1);
    float3 _97 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1135.xy), uint(_1135.z), 0).xyz;
    float _99 = _97.x;
    float _101 = _97.y;
    float _103 = _97.z;
    int _105 = _66;
    int _107 = 0;
    int _109 = _56(_105, _107, (*spvDescriptorSet0.support_buffer));
    int _111 = as_type<int>(_81);
    int _113 = 0;
    int _115 = _56(_111, _113, (*spvDescriptorSet0.support_buffer));
    int3 _1153 = int3(_109, _115, 0);
    float3 _117 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1153.xy), uint(_1153.z), 0).xyz;
    float _119 = _117.x;
    float _121 = _117.y;
    float _123 = _117.z;
    int _125 = _66;
    int _127 = 0;
    int _129 = _56(_125, _127, (*spvDescriptorSet0.support_buffer));
    int _131 = as_type<int>(_81);
    int _133 = 0;
    int _135 = _56(_131, _133, (*spvDescriptorSet0.support_buffer));
    int3 _1171 = int3(_129, _135, 2);
    float3 _137 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1171.xy), uint(_1171.z), 0).xyz;
    float _139 = _137.x;
    float _141 = _137.y;
    float _143 = _137.z;
    bool _145 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x);
    int _147 = _66 * 48;
    bool _149 = _66 != 0;
    float _151 = _99 * 0.15915493667125701904296875;
    float _153 = _103 * 0.15915493667125701904296875;
    float _155 = _101 * 0.15915493667125701904296875;
    float _157 = _151 * 6.283185482025146484375;
    float _159 = cos(_157);
    float _161 = _153 * 6.283185482025146484375;
    float _163 = sin(_161);
    float _165 = _153 * 6.283185482025146484375;
    float _167 = cos(_165);
    float _169 = _155 * 6.283185482025146484375;
    float _171 = cos(_169);
    float _173 = _151 * 6.283185482025146484375;
    float _175 = sin(_173);
    float _177 = _159 * _167;
    float _179 = _155 * 6.283185482025146484375;
    float _181 = sin(_179);
    float _183 = _163 * _159;
    float _185 = _159 * _171;
    float _187 = _171 * _119;
    float _189 = _175 * _167;
    float _191 = _175 * _163;
    float _193 = _175 * _171;
    float _195 = _175 * _181;
    float _197 = -_189;
    float _199 = fma(_181, _183, _197);
    float _201 = fma(_181, _177, _191);
    float _203 = _119 * _181;
    float _205 = fma(_163, _195, _177);
    float _207 = -_183;
    float _209 = fma(_167, _195, _207);
    float _211 = _121 * _193;
    float _213 = _163 * _187;
    float _215 = _123 * _199;
    float _217 = _121 * _209;
    float _219 = _121 * _205;
    float _221 = _123 * _185;
    float _223 = _167 * _187;
    float _225 = -_203;
    float _227 = _225 + (-0.0);
    float _229 = _123 * _201;
    float _231 = _193;
    float _233 = _201;
    float _235 = _191;
    float _237 = _167;
    float _239 = _155;
    float _241 = _199;
    float _243 = _185;
    float _245 = _217;
    float _247 = _219;
    float _249 = _213;
    float _251 = _215;
    float _253 = _229;
    if (!_145)
    {
        int _255 = _66 * 48;
        float _257 = -_203;
        float _259 = _257 + (-0.0);
        int _261 = _255 + 16;
        uint _263 = uint(int(uint(_255) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_263)] = as_type<uint>(_223);
        int _265 = _255 + 4;
        uint _267 = uint(int(uint(_265) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_267)] = as_type<uint>(_217);
        int _269 = _255 + 8;
        uint _271 = uint(int(uint(_269) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_271)] = as_type<uint>(_229);
        int _273 = _255 + 12;
        uint _275 = uint(int(uint(_273) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_275)] = as_type<uint>(_139);
        int _277 = _255 + 32;
        uint _279 = uint(int(uint(_261) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_279)] = as_type<uint>(_213);
        int _281 = _261 + 4;
        uint _283 = uint(int(uint(_281) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_283)] = as_type<uint>(_219);
        int _285 = _261 + 8;
        uint _287 = uint(int(uint(_285) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_287)] = as_type<uint>(_215);
        int _289 = _261 + 12;
        uint _291 = uint(int(uint(_289) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_291)] = as_type<uint>(_141);
        uint _293 = uint(int(uint(_277) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_293)] = as_type<uint>(_259);
        int _295 = _277 + 4;
        uint _297 = uint(int(uint(_295) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_297)] = as_type<uint>(_211);
        int _299 = _277 + 8;
        uint _301 = uint(int(uint(_299) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_301)] = as_type<uint>(_221);
        int _303 = _277 + 12;
        uint _305 = uint(int(uint(_303) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_305)] = as_type<uint>(_143);
        _231 = as_type<float>(_255);
        _233 = as_type<float>(_261);
        _235 = as_type<float>(_277);
        _237 = _141;
    }
    float _307 = _231;
    float _309 = _233;
    float _311 = _235;
    float _313 = _237;
    int _315 = _147 + 16;
    uint _317 = uint(int(uint(_315) >> uint(2)));
    _39[int(_317)] = as_type<uint>(_213);
    int _319 = _147 + 20;
    uint _321 = uint(int(uint(_319) >> uint(2)));
    _39[int(_321)] = as_type<uint>(_219);
    int _323 = _147 + 24;
    uint _325 = uint(int(uint(_323) >> uint(2)));
    _39[int(_325)] = as_type<uint>(_215);
    int _327 = _147 + 28;
    uint _329 = uint(int(uint(_327) >> uint(2)));
    _39[int(_329)] = as_type<uint>(_141);
    int _331 = _66 * 112;
    uint _333 = uint(int(uint(_147) >> uint(2)));
    _39[int(_333)] = as_type<uint>(_223);
    int _335 = _147 + 4;
    uint _337 = uint(int(uint(_335) >> uint(2)));
    _39[int(_337)] = as_type<uint>(_217);
    int _339 = _147 + 8;
    uint _341 = uint(int(uint(_339) >> uint(2)));
    _39[int(_341)] = as_type<uint>(_229);
    int _343 = _147 + 12;
    uint _345 = uint(int(uint(_343) >> uint(2)));
    _39[int(_345)] = as_type<uint>(_139);
    float _347 = _313;
    float _349 = _311;
    float _351 = _309;
    float _353 = _307;
    if (!_149)
    {
        _239 = _139;
    }
    float _355 = _239;
    float _357 = _355;
    if (!_149)
    {
        _241 = _141;
    }
    float _359 = _241;
    int _361 = _147 + 32;
    uint _363 = uint(int(uint(_361) >> uint(2)));
    _39[int(_363)] = as_type<uint>(_227);
    int _365 = _147 + 36;
    uint _367 = uint(int(uint(_365) >> uint(2)));
    _39[int(_367)] = as_type<uint>(_211);
    int _369 = _147 + 40;
    uint _371 = uint(int(uint(_369) >> uint(2)));
    _39[int(_371)] = as_type<uint>(_221);
    int _373 = _147 + 44;
    uint _375 = uint(int(uint(_373) >> uint(2)));
    _39[int(_375)] = as_type<uint>(_143);
    float _377 = _359;
    if (!_149)
    {
        _347 = _143;
    }
    float _379 = _347;
    float _381 = _379;
    if (!_149)
    {
        _349 = _227;
    }
    float _383 = _349;
    float _385 = _383;
    if (!_149)
    {
        _243 = _223;
    }
    float _387 = _243;
    float _389 = _387;
    if (!_149)
    {
        _351 = _211;
    }
    float _391 = _351;
    float _393 = _391;
    if (!_149)
    {
        _353 = _221;
    }
    float _395 = _353;
    bool _397 = !_149;
    float _399 = _395;
    if (!_397)
    {
        bool _401 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
        bool _403 = !_401;
        if (!_403)
        {
            uint _405 = uint(int(uint(_331) >> uint(2)));
            uint _407 = uint(int(uint(int(_405)) >> uint(2)));
            int _409 = int(_405) & 3;
            float _411 = (*spvDescriptorSet0.cp_c6)._m0[int(_407)][_409];
            int _413 = as_type<int>(_411) * 48;
            int _415 = 0;
            bool _417;
            float _515;
            float _517;
            float _521;
            float _527;
            float _545;
            float _547;
            float _549;
            float _551;
            float _571;
            float _573;
            float _575;
            float _577;
            do
            {
                int _419 = _415;
                threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup);
                uint _421 = uint(int(uint(_413) >> uint(2)));
                float _423 = as_type<float>(_39[int(_421)]);
                int _425 = _413 + 4;
                uint _427 = uint(int(uint(_425) >> uint(2)));
                float _429 = as_type<float>(_39[int(_427)]);
                int _431 = _413 + 8;
                uint _433 = uint(int(uint(_431) >> uint(2)));
                float _435 = as_type<float>(_39[int(_433)]);
                int _437 = _413 + 12;
                uint _439 = uint(int(uint(_437) >> uint(2)));
                float _441 = as_type<float>(_39[int(_439)]);
                int _443 = _419 + 1;
                int _445 = _413 + 16;
                uint _447 = uint(int(uint(_445) >> uint(2)));
                float _449 = as_type<float>(_39[int(_447)]);
                int _451 = _413 + 20;
                uint _453 = uint(int(uint(_451) >> uint(2)));
                float _455 = as_type<float>(_39[int(_453)]);
                int _457 = _413 + 24;
                uint _459 = uint(int(uint(_457) >> uint(2)));
                float _461 = as_type<float>(_39[int(_459)]);
                int _463 = _413 + 28;
                uint _465 = uint(int(uint(_463) >> uint(2)));
                float _467 = as_type<float>(_39[int(_465)]);
                bool _469 = uint(_443) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
                int _471 = _413 + 32;
                uint _473 = uint(int(uint(_471) >> uint(2)));
                float _475 = as_type<float>(_39[int(_473)]);
                int _477 = _413 + 36;
                uint _479 = uint(int(uint(_477) >> uint(2)));
                float _481 = as_type<float>(_39[int(_479)]);
                int _483 = _413 + 40;
                uint _485 = uint(int(uint(_483) >> uint(2)));
                float _487 = as_type<float>(_39[int(_485)]);
                int _489 = _413 + 44;
                uint _491 = uint(int(uint(_489) >> uint(2)));
                float _493 = as_type<float>(_39[int(_491)]);
                float _495 = _141 * _429;
                float _497 = _213 * _429;
                float _499 = _219 * _429;
                float _501 = _215 * _429;
                float _503 = fma(_139, _423, _495);
                float _505 = fma(_223, _423, _497);
                float _507 = fma(_217, _423, _499);
                float _509 = fma(_229, _423, _501);
                float _511 = fma(_143, _435, _503);
                float _513 = -_203;
                _515 = fma(_513, _435, _505);
                _517 = fma(_211, _435, _507);
                float _519 = _141 * _455;
                _521 = fma(_221, _435, _509);
                float _523 = _213 * _455;
                float _525 = _219 * _455;
                _527 = _441 + _511;
                float _529 = _215 * _455;
                float _531 = fma(_139, _449, _519);
                float _533 = fma(_223, _449, _523);
                float _535 = fma(_217, _449, _525);
                float _537 = fma(_229, _449, _529);
                float _539 = fma(_143, _461, _531);
                float _541 = _141 * _481;
                float _543 = -_203;
                _545 = fma(_543, _461, _533);
                _547 = fma(_211, _461, _535);
                _549 = fma(_221, _461, _537);
                _551 = _467 + _539;
                float _553 = _213 * _481;
                float _555 = _219 * _481;
                float _557 = _215 * _481;
                float _559 = fma(_139, _475, _541);
                float _561 = fma(_223, _475, _553);
                float _563 = fma(_217, _475, _555);
                float _565 = fma(_229, _475, _557);
                float _567 = fma(_143, _487, _559);
                float _569 = -_203;
                _571 = fma(_569, _487, _561);
                _573 = fma(_211, _487, _563);
                _575 = fma(_221, _487, _565);
                _577 = _493 + _567;
                uint _579 = uint(int(uint(_147) >> uint(2)));
                _39[int(_579)] = as_type<uint>(_515);
                int _581 = _147 + 4;
                uint _583 = uint(int(uint(_581) >> uint(2)));
                _39[int(_583)] = as_type<uint>(_517);
                int _585 = _147 + 8;
                uint _587 = uint(int(uint(_585) >> uint(2)));
                _39[int(_587)] = as_type<uint>(_521);
                int _589 = _147 + 12;
                uint _591 = uint(int(uint(_589) >> uint(2)));
                _39[int(_591)] = as_type<uint>(_527);
                int _593 = _147 + 16;
                uint _595 = uint(int(uint(_593) >> uint(2)));
                _39[int(_595)] = as_type<uint>(_545);
                int _597 = _147 + 20;
                uint _599 = uint(int(uint(_597) >> uint(2)));
                _39[int(_599)] = as_type<uint>(_547);
                int _601 = _147 + 24;
                uint _603 = uint(int(uint(_601) >> uint(2)));
                _39[int(_603)] = as_type<uint>(_549);
                int _605 = _147 + 28;
                uint _607 = uint(int(uint(_605) >> uint(2)));
                _39[int(_607)] = as_type<uint>(_551);
                int _609 = _147 + 32;
                uint _611 = uint(int(uint(_609) >> uint(2)));
                _39[int(_611)] = as_type<uint>(_571);
                int _613 = _147 + 36;
                uint _615 = uint(int(uint(_613) >> uint(2)));
                _39[int(_615)] = as_type<uint>(_573);
                int _617 = _147 + 40;
                uint _619 = uint(int(uint(_617) >> uint(2)));
                _39[int(_619)] = as_type<uint>(_575);
                int _621 = _147 + 44;
                uint _623 = uint(int(uint(_621) >> uint(2)));
                _39[int(_623)] = as_type<uint>(_577);
                _417 = !_469;
                _415 = _443;
            } while (_417);
            _245 = _517;
            _393 = _573;
            _247 = _547;
            _389 = _515;
            _385 = _571;
            _249 = _545;
            _251 = _549;
            _253 = _521;
            _399 = _575;
            _377 = _551;
            _357 = _527;
            _381 = _577;
            _625 = true;
        }
        else
        {
            _245 = 0.0;
            _393 = 0.0;
            _247 = 0.0;
            _389 = 0.0;
            _385 = 0.0;
            _249 = 0.0;
            _251 = 0.0;
            _253 = 0.0;
            _399 = 0.0;
            _377 = 0.0;
            _357 = 0.0;
            _381 = 0.0;
        }
    }
    _625 = false;
    float _627 = _245;
    float _629 = _393;
    float _631 = _247;
    float _633 = _389;
    float _635 = _385;
    float _637 = _249;
    float _639 = _251;
    float _641 = _253;
    float _643 = _399;
    float _645 = _377;
    float _647 = _357;
    float _649 = _381;
    int _651 = _331 + 80;
    uint _653 = uint(int(uint(_651) >> uint(2)));
    uint _655 = uint(int(uint(int(_653)) >> uint(2)));
    int _657 = int(_653) & 3;
    float _659 = (*spvDescriptorSet0.cp_c6)._m0[int(_655)][_657];
    int _661 = int(_653) + 1;
    uint _663 = uint(int(uint(_661) >> uint(2)));
    int _665 = _661 & 3;
    float _667 = (*spvDescriptorSet0.cp_c6)._m0[int(_663)][_665];
    int _669 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _671 = _669 + _66;
    int _673 = _331 + 64;
    uint _675 = uint(int(uint(_673) >> uint(2)));
    uint _677 = uint(int(uint(int(_675)) >> uint(2)));
    int _679 = int(_675) & 3;
    float _681 = (*spvDescriptorSet0.cp_c6)._m0[int(_677)][_679];
    int _683 = int(_675) + 1;
    uint _685 = uint(int(uint(_683) >> uint(2)));
    int _687 = _683 & 3;
    float _689 = (*spvDescriptorSet0.cp_c6)._m0[int(_685)][_687];
    int _691 = _671 * 48;
    int _693 = _331 + 88;
    uint _695 = uint(int(uint(_693) >> uint(2)));
    uint _697 = uint(int(uint(int(_695)) >> uint(2)));
    int _699 = int(_695) & 3;
    float _701 = (*spvDescriptorSet0.cp_c6)._m0[int(_697)][_699];
    int _703 = int(_695) + 1;
    uint _705 = uint(int(uint(_703) >> uint(2)));
    int _707 = _703 & 3;
    float _709 = (*spvDescriptorSet0.cp_c6)._m0[int(_705)][_707];
    int _711 = _331 + 72;
    uint _713 = uint(int(uint(_711) >> uint(2)));
    uint _715 = uint(int(uint(int(_713)) >> uint(2)));
    int _717 = int(_713) & 3;
    float _719 = (*spvDescriptorSet0.cp_c6)._m0[int(_715)][_717];
    int _721 = int(_713) + 1;
    uint _723 = uint(int(uint(_721) >> uint(2)));
    int _725 = _721 & 3;
    float _727 = (*spvDescriptorSet0.cp_c6)._m0[int(_723)][_725];
    int _729 = _331 + 96;
    uint _731 = uint(int(uint(_729) >> uint(2)));
    uint _733 = uint(int(uint(int(_731)) >> uint(2)));
    int _735 = int(_731) & 3;
    float _737 = (*spvDescriptorSet0.cp_c6)._m0[int(_733)][_735];
    int _739 = int(_731) + 1;
    uint _741 = uint(int(uint(_739) >> uint(2)));
    int _743 = _739 & 3;
    float _745 = (*spvDescriptorSet0.cp_c6)._m0[int(_741)][_743];
    int _747 = _331 + 104;
    uint _749 = uint(int(uint(_747) >> uint(2)));
    uint _751 = uint(int(uint(int(_749)) >> uint(2)));
    int _753 = int(_749) & 3;
    float _755 = (*spvDescriptorSet0.cp_c6)._m0[int(_751)][_753];
    int _757 = int(_749) + 1;
    uint _759 = uint(int(uint(_757) >> uint(2)));
    int _761 = _757 & 3;
    float _763 = (*spvDescriptorSet0.cp_c6)._m0[int(_759)][_761];
    float _765 = _627 * _659;
    float _767 = _629 * _659;
    int _769 = _331 + 16;
    uint _771 = uint(int(uint(_769) >> uint(2)));
    uint _773 = uint(int(uint(int(_771)) >> uint(2)));
    int _775 = int(_771) & 3;
    float _777 = (*spvDescriptorSet0.cp_c6)._m0[int(_773)][_775];
    int _779 = int(_771) + 1;
    uint _781 = uint(int(uint(_779) >> uint(2)));
    int _783 = _779 & 3;
    float _785 = (*spvDescriptorSet0.cp_c6)._m0[int(_781)][_783];
    float _787 = _631 * _659;
    float _789 = fma(_633, _681, _765);
    float _791 = fma(_635, _681, _767);
    float _793 = _627 * _667;
    float _795 = _631 * _667;
    float _797 = _629 * _667;
    int _799 = _331 + 32;
    uint _801 = uint(int(uint(_799) >> uint(2)));
    uint _803 = uint(int(uint(int(_801)) >> uint(2)));
    int _805 = int(_801) & 3;
    float _807 = (*spvDescriptorSet0.cp_c6)._m0[int(_803)][_805];
    int _809 = int(_801) + 1;
    uint _811 = uint(int(uint(_809) >> uint(2)));
    int _813 = _809 & 3;
    float _815 = (*spvDescriptorSet0.cp_c6)._m0[int(_811)][_813];
    float _817 = fma(_633, _689, _793);
    float _819 = fma(_637, _681, _787);
    float _821 = fma(_635, _689, _797);
    float _823 = _627 * _701;
    float _825 = _627 * _709;
    float _827 = _631 * _701;
    float _829 = _629 * _701;
    int _831 = _331 + 48;
    uint _833 = uint(int(uint(_831) >> uint(2)));
    uint _835 = uint(int(uint(int(_833)) >> uint(2)));
    int _837 = int(_833) & 3;
    float _839 = (*spvDescriptorSet0.cp_c6)._m0[int(_835)][_837];
    int _841 = int(_833) + 1;
    uint _843 = uint(int(uint(_841) >> uint(2)));
    int _845 = _841 & 3;
    float _847 = (*spvDescriptorSet0.cp_c6)._m0[int(_843)][_845];
    float _849 = _631 * _709;
    float _851 = _629 * _709;
    float _853 = fma(_633, _719, _823);
    float _855 = fma(_633, _727, _825);
    float _857 = fma(_637, _719, _827);
    float _859 = fma(_637, _727, _849);
    float _861 = fma(_635, _719, _829);
    int _863 = _331 + 24;
    uint _865 = uint(int(uint(_863) >> uint(2)));
    uint _867 = uint(int(uint(int(_865)) >> uint(2)));
    int _869 = int(_865) & 3;
    float _871 = (*spvDescriptorSet0.cp_c6)._m0[int(_867)][_869];
    int _873 = int(_865) + 1;
    uint _875 = uint(int(uint(_873) >> uint(2)));
    int _877 = _873 & 3;
    float _879 = (*spvDescriptorSet0.cp_c6)._m0[int(_875)][_877];
    float _881 = fma(_635, _727, _851);
    float _883 = fma(_637, _689, _795);
    float _885 = fma(_639, _737, _819);
    float _887 = fma(_641, _745, _817);
    float _889 = fma(_641, _737, _789);
    float _891 = fma(_639, _745, _883);
    float _893 = fma(_643, _737, _791);
    int _895 = _331 + 40;
    uint _897 = uint(int(uint(_895) >> uint(2)));
    uint _899 = uint(int(uint(int(_897)) >> uint(2)));
    int _901 = int(_897) & 3;
    float _903 = (*spvDescriptorSet0.cp_c6)._m0[int(_899)][_901];
    int _905 = int(_897) + 1;
    uint _907 = uint(int(uint(_905) >> uint(2)));
    int _909 = _905 & 3;
    float _911 = (*spvDescriptorSet0.cp_c6)._m0[int(_907)][_909];
    float _913 = fma(_643, _745, _821);
    float _915 = fma(_641, _763, _855);
    float _917 = fma(_639, _755, _857);
    float _919 = fma(_639, _763, _859);
    float _921 = fma(_641, _755, _853);
    float _923 = fma(_643, _763, _881);
    int _925 = _331 + 56;
    uint _927 = uint(int(uint(_925) >> uint(2)));
    uint _929 = uint(int(uint(int(_927)) >> uint(2)));
    int _931 = int(_927) & 3;
    float _933 = (*spvDescriptorSet0.cp_c6)._m0[int(_929)][_931];
    int _935 = int(_927) + 1;
    uint _937 = uint(int(uint(_935) >> uint(2)));
    int _939 = _935 & 3;
    float _941 = (*spvDescriptorSet0.cp_c6)._m0[int(_937)][_939];
    float _943 = _919 + _645;
    float _945 = _915 + _647;
    float _947 = fma(_643, _755, _861);
    float _949 = _923 + _649;
    float _951 = _943 * _785;
    float _953 = _891 * _785;
    float _955 = _885 * _785;
    float _957 = _917 * _785;
    float _959 = fma(_945, _777, _951);
    float _961 = fma(_887, _777, _953);
    float _963 = fma(_889, _777, _955);
    float _965 = fma(_921, _777, _957);
    int _967 = _691 + 32;
    float _969 = _943 * _815;
    float _971 = _891 * _815;
    float _973 = _885 * _815;
    float _975 = _917 * _815;
    float _977 = fma(_945, _807, _969);
    float _979 = fma(_887, _807, _971);
    float _981 = fma(_889, _807, _973);
    float _983 = fma(_921, _807, _975);
    float _985 = _943 * _847;
    float _987 = _885 * _847;
    float _989 = _891 * _847;
    float _991 = _917 * _847;
    float _993 = fma(_945, _839, _985);
    float _995 = fma(_889, _839, _987);
    float _997 = fma(_887, _839, _989);
    float _999 = fma(_921, _839, _991);
    float _1001 = fma(_949, _871, _959);
    float _1003 = fma(_913, _871, _961);
    float _1005 = fma(_893, _871, _963);
    float _1007 = fma(_947, _871, _965);
    float _1009 = _1001 + _879;
    int _1011 = _691 + 16;
    int _1013 = _691 + 48;
    float _1015 = fma(_949, _903, _977);
    float _1017 = fma(_913, _903, _979);
    float _1019 = fma(_893, _903, _981);
    float _1021 = fma(_947, _903, _983);
    float _1023 = _1015 + _911;
    uint _1025 = uint(int(uint(_1011) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1025)] = as_type<uint>(_1005);
    int _1027 = _1011 + 4;
    uint _1029 = uint(int(uint(_1027) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1029)] = as_type<uint>(_1003);
    int _1031 = _1011 + 8;
    uint _1033 = uint(int(uint(_1031) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1033)] = as_type<uint>(_1007);
    int _1035 = _1011 + 12;
    uint _1037 = uint(int(uint(_1035) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1037)] = as_type<uint>(_1009);
    float _1039 = fma(_949, _933, _993);
    float _1041 = fma(_893, _933, _995);
    float _1043 = fma(_913, _933, _997);
    float _1045 = fma(_947, _933, _999);
    float _1047 = _1039 + _941;
    uint _1049 = uint(int(uint(_967) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1049)] = as_type<uint>(_1019);
    int _1051 = _967 + 4;
    uint _1053 = uint(int(uint(_1051) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1053)] = as_type<uint>(_1017);
    int _1055 = _967 + 8;
    uint _1057 = uint(int(uint(_1055) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1057)] = as_type<uint>(_1021);
    int _1059 = _967 + 12;
    uint _1061 = uint(int(uint(_1059) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1061)] = as_type<uint>(_1023);
    uint _1063 = uint(int(uint(_1013) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1063)] = as_type<uint>(_1041);
    int _1065 = _1013 + 4;
    uint _1067 = uint(int(uint(_1065) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1067)] = as_type<uint>(_1043);
    int _1069 = _1013 + 8;
    uint _1071 = uint(int(uint(_1069) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1071)] = as_type<uint>(_1045);
    int _1073 = _1013 + 12;
    uint _1075 = uint(int(uint(_1073) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1075)] = as_type<uint>(_1047);
}

