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

struct _25
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* cp_c3 [[id(1)]];
    constant _16* cp_c4 [[id(2)]];
    constant _16* cp_c5 [[id(3)]];
    const device _25* cp_s0 [[id(4)]];
    texture2d_array<float> cp_t_tcb_A [[id(5)]];
    sampler cp_t_tcb_ASmplr [[id(6)]];
    texture2d_array<float> cp_t_tcb_8 [[id(7)]];
    sampler cp_t_tcb_8Smplr [[id(8)]];
    texture2d_array<float, access::write> cp_i_tcb_4A_ [[id(9)]];
    texture2d_array<float> cp_i_tcb_48_ [[id(10)]];
    sampler cp_t_tcb_ASmplr_w [[id(11)]];
    sampler cp_t_tcb_8Smplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

static inline __attribute__((always_inline))
int _53(thread const int& _1857, thread const int& _1858, constant _10& support_buffer)
{
    int _1861 = 1 + _1858;
    float _1863 = support_buffer._m5[_1861].x;
    bool _1865 = _1863 == 1.0;
    if (_1865)
    {
        return _1857;
    }
    float _1867 = float(_1857);
    float _1869 = _1867 * _1863;
    int _1871 = int(_1869);
    return _1871;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    float _57 = as_type<float>(gl_WorkGroupID.y);
    float _59 = as_type<float>(gl_WorkGroupID.z);
    float _61 = as_type<float>(gl_WorkGroupID.x);
    int _63 = as_type<int>(_59) << 5;
    int _65 = _63 + as_type<int>(_57);
    int _67 = _65 << 4;
    int _69 = _67 + as_type<int>(_61);
    int _71 = _69 << 2;
    uint _74 = uint(int(uint(_71) >> uint(2)));
    float _76 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_74)]);
    float _78 = as_type<float>(gl_LocalInvocationID.x);
    float _80 = as_type<float>(gl_LocalInvocationID.y);
    int _82 = as_type<int>(_61) << 3;
    int _84 = _82 + as_type<int>(_78);
    int _86 = as_type<int>(_57) << 2;
    int _88 = _86 + as_type<int>(_80);
    bool _92 = as_type<int>(_76) != 0;
    if (!_92)
    {
        int3 _862 = int3(_84, _88, as_type<int>(_59));
        spvDescriptorSet0.cp_i_tcb_4A_.write(float4(0.0), uint2(_862.xy), uint(_862.z));
    }
    if (!_92)
    {
        return;
    }
    int _94 = as_type<int>(_59) + as_type<int>((*spvDescriptorSet0.cp_c3)._m0[16].z);
    float _96 = float(as_type<int>(_59));
    int _98 = _94 << 4;
    float _100 = rint(_96);
    float _102 = precise::max(_100, 0.0);
    uint _104 = uint(_102);
    uint _106 = clamp(_104, 0u, 65535u);
    float _108 = float(_88);
    int _110 = _98 + 4;
    uint _112 = uint(int(uint(_110) >> uint(2)));
    uint _114 = uint(int(uint(int(_112)) >> uint(2)));
    int _116 = int(_112) & 3;
    float _118 = (*spvDescriptorSet0.cp_c3)._m0[int(_114)][_116];
    float _120 = float(_84);
    float _122 = _108 + 0.5;
    float _124 = _120 + 0.5;
    float _126 = 1.0 / _118;
    float _128 = _122 * _126;
    float _130 = _124 * _126;
    float3 _935 = float3(_130, _128, float(int(_106)));
    float3 _939 = select(_935, float3(0.0), isnan(_935));
    float3 _134 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, _939.xy, uint(rint(_939.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, _939.xy, uint(rint(_939.z)), level(0.0)).xyw;
    float _136 = _134.x;
    float _138 = _134.y;
    float _140 = _134.z;
    int _142 = _84;
    int _144 = 3;
    int _146 = _53(_142, _144, (*spvDescriptorSet0.support_buffer));
    int _148 = _88;
    int _150 = 3;
    int _152 = _53(_148, _150, (*spvDescriptorSet0.support_buffer));
    int3 _957 = int3(_146, _152, as_type<int>(_59));
    float4 _155 = (spvDescriptorSet0.cp_i_tcb_48_.read(uint2(_957.xy), uint(_957.z)).xyzw);
    float _157 = _155.x;
    float _159 = _155.y;
    float _161 = _155.z;
    float _163 = _155.w;
    int _165 = _98 + 12;
    uint _167 = uint(int(uint(_165) >> uint(2)));
    uint _169 = uint(int(uint(int(_167)) >> uint(2)));
    int _171 = int(_167) & 3;
    float _173 = (*spvDescriptorSet0.cp_c3)._m0[int(_169)][_171];
    float _175 = _130 + (-0.5);
    float _177 = _118 * _173;
    float _179 = _128 + (-0.5);
    float _181 = fma(_177, _179, (*spvDescriptorSet0.cp_c3)._m0[16].y);
    float _183 = fma(_177, _175, (*spvDescriptorSet0.cp_c3)._m0[16].x);
    float _185 = -(*spvDescriptorSet0.cp_c3)._m0[16].y;
    float _187 = _181 + _185;
    float _189 = -(*spvDescriptorSet0.cp_c3)._m0[16].x;
    float _191 = _183 + _189;
    float _193 = _187 * _187;
    float _195 = fma(_191, _191, _193);
    bool _197 = _138 > 0.001000000047497451305389404296875;
    float _199 = _193;
    float _201 = _191;
    float _203 = as_type<float>(_98);
    float _205 = _140;
    if (!_197)
    {
        _199 = 0.0;
    }
    float _207 = _199;
    float _209 = _207;
    if (!_197)
    {
        _201 = 0.0;
        _203 = 0.0;
    }
    float _211 = _201;
    float _213 = _203;
    bool _215 = !_197;
    float _217 = _211;
    float _219 = _213;
    if (!_215)
    {
        float _221 = sqrt(_195);
        float _223 = fma(_221, 0.00312500004656612873077392578125, -1.0);
        float _225 = precise::clamp(_223, 0.0, 1.0);
        float _227 = fma(_221, 0.001562500023283064365386962890625, -1.0);
        float _229 = precise::clamp(_227, 0.0, 1.0);
        float _231 = fma(_221, 0.0007812500116415321826934814453125, -1.0);
        float _233 = precise::clamp(_231, 0.0, 1.0);
        float _235 = fma(_221, 0.00039062500582076609134674072265625, -1.0);
        float _237 = precise::clamp(_235, 0.0, 1.0);
        float _239 = -_225;
        float _241 = _239 + 1.0;
        float _243 = -_229;
        float _245 = _243 + 1.0;
        float _247 = -_233;
        float _249 = _247 + 1.0;
        float _251 = -_237;
        float _253 = _251 + 1.0;
        bool _255 = _241 > 0.001000000047497451305389404296875;
        bool _257 = _245 > 0.001000000047497451305389404296875;
        bool _259 = _249 > 0.001000000047497451305389404296875;
        bool _261 = _253 > 0.001000000047497451305389404296875;
        float _263 = _221;
        float _265 = _237;
        float _267 = _233;
        float _269 = _225;
        if (_255)
        {
            float _271 = _181 * 0.015625;
            _263 = _271;
        }
        float _273 = _263;
        float _275 = 0.0;
        if (_255)
        {
            float _277 = _183 * 0.015625;
            _275 = _277;
        }
        float _279 = _275;
        if (_257)
        {
            float _281 = _181 * 0.0078125;
            _265 = _281;
        }
        float _283 = _265;
        float _285 = 0.0;
        if (_257)
        {
            float _287 = _183 * 0.0078125;
            _285 = _287;
        }
        float _289 = _285;
        if (_259)
        {
            float _291 = _181 * 0.00390625;
            _267 = _291;
        }
        float _293 = _267;
        float _295 = 0.0;
        if (_257)
        {
            _295 = 1.4012984643248170709237295832899e-45;
        }
        float _297 = _295;
        if (_261)
        {
            float _299 = _181 * 0.001953125;
            _269 = _299;
        }
        float _301 = _269;
        float _303 = 0.0;
        if (_259)
        {
            float _305 = _183 * 0.00390625;
            _303 = _305;
        }
        float _307 = _303;
        float _309 = _181;
        float _311 = _273;
        float _313 = 0.0;
        if (_255)
        {
            float3 _1168 = float3(_279, _273, float(0));
            float3 _1170 = select(_1168, float3(0.0), isnan(_1168));
            float3 _315 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, _1170.xy, uint(rint(_1170.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, _1170.xy, uint(rint(_1170.z)), level(0.0)).xyz;
            float _317 = _315.x;
            float _319 = _315.y;
            float _321 = _315.z;
            _309 = _317;
            _311 = _319;
            _313 = _321;
        }
        float _323 = _309;
        float _325 = _311;
        float _327 = _313;
        float _329 = _283;
        float _331 = 0.0;
        float _333 = 0.0;
        if (_257)
        {
            float3 _1195 = float3(_289, _283, float(as_type<int>(_297)));
            float3 _1197 = select(_1195, float3(0.0), isnan(_1195));
            float3 _335 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, _1197.xy, uint(rint(_1197.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, _1197.xy, uint(rint(_1197.z)), level(0.0)).xyz;
            float _337 = _335.x;
            float _339 = _335.y;
            float _341 = _335.z;
            _329 = _337;
            _331 = _339;
            _333 = _341;
        }
        float _343 = _329;
        float _345 = _331;
        float _347 = _333;
        float _349 = 0.0;
        if (_259)
        {
            _349 = 2.8025969286496341418474591665798e-45;
        }
        float _351 = _349;
        float _353 = 0.0;
        if (_261)
        {
            float _355 = _183 * 0.001953125;
            _353 = _355;
        }
        float _357 = _353;
        float _359 = 0.0;
        if (_261)
        {
            _359 = 4.2038953929744512127711887498697e-45;
        }
        float _361 = _359;
        float _363 = _293;
        float _365 = _183;
        float _367 = 0.0;
        if (_259)
        {
            float3 _1240 = float3(_307, _293, float(as_type<int>(_351)));
            float3 _1242 = select(_1240, float3(0.0), isnan(_1240));
            float3 _369 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, _1242.xy, uint(rint(_1242.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, _1242.xy, uint(rint(_1242.z)), level(0.0)).xyz;
            float _371 = _369.x;
            float _373 = _369.y;
            float _375 = _369.z;
            _363 = _371;
            _365 = _373;
            _367 = _375;
        }
        float _377 = _363;
        float _379 = _365;
        float _381 = _367;
        float _383 = _301;
        float _385 = _229;
        float _387 = _357;
        if (_261)
        {
            float3 _1269 = float3(_357, _301, float(as_type<int>(_361)));
            float3 _1271 = select(_1269, float3(0.0), isnan(_1269));
            float3 _389 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, _1271.xy, uint(rint(_1271.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, _1271.xy, uint(rint(_1271.z)), level(0.0)).xyz;
            float _391 = _389.x;
            float _393 = _389.y;
            float _395 = _389.z;
            _383 = _391;
            _385 = _393;
            _387 = _395;
        }
        float _397 = _383;
        float _399 = _385;
        float _401 = _387;
        float _403 = 1.0 / (*spvDescriptorSet0.cp_c4)._m0[0].z;
        float _405 = _136 * 100.0;
        float _407 = 1.0 / (*spvDescriptorSet0.cp_c5)._m0[0].z;
        float _409 = fma(_403, 0.3183098733425140380859375, 0.079577468335628509521484375);
        float _411 = _409 * 64.0;
        float _413 = _409 * 128.0;
        float _415 = _409 * 256.0;
        float _417 = _409 * 512.0;
        float _419 = 1.0 / _411;
        float _421 = _405 * _407;
        float _423 = precise::clamp(_421, 0.0, 1.0);
        float _425 = fma(_423, -2.0, 3.0);
        float _427 = _423 * _423;
        float _429 = 1.0 / _413;
        float _431 = (*spvDescriptorSet0.cp_c5)._m0[0].x * 2.0;
        float _433 = _425 * _427;
        float _435 = 1.0 / _415;
        float _437 = 1.0 / _417;
        float _439 = _431 * _419;
        float _441 = _431 * _429;
        float _443 = _405 * _441;
        float _445 = precise::clamp(_443, 0.0, 1.0);
        float _447 = _441 * (*spvDescriptorSet0.cp_c5)._m0[0].z;
        float _449 = precise::clamp(_447, 0.0, 1.0);
        float _451 = _431 * _435;
        float _453 = -_445;
        float _455 = _453 + 1.0;
        float _457 = -_449;
        float _459 = _457 + 1.0;
        float _461 = _405 * _451;
        float _463 = precise::clamp(_461, 0.0, 1.0);
        float _465 = _451 * (*spvDescriptorSet0.cp_c5)._m0[0].z;
        float _467 = precise::clamp(_465, 0.0, 1.0);
        float _469 = -_455;
        float _471 = fma(_469, (*spvDescriptorSet0.cp_c5)._m0[0].y, 1.0);
        float _473 = _459 * (*spvDescriptorSet0.cp_c5)._m0[0].y;
        float _475 = _431 * _437;
        float _477 = _405 * _439;
        float _479 = precise::clamp(_477, 0.0, 1.0);
        float _481 = _439 * (*spvDescriptorSet0.cp_c5)._m0[0].z;
        float _483 = precise::clamp(_481, 0.0, 1.0);
        float _485 = -_467;
        float _487 = _485 + 1.0;
        float _489 = _405 * _475;
        float _491 = precise::clamp(_489, 0.0, 1.0);
        float _493 = _475 * (*spvDescriptorSet0.cp_c5)._m0[0].z;
        float _495 = precise::clamp(_493, 0.0, 1.0);
        float _497 = -_483;
        float _499 = _497 + 1.0;
        float _501 = -_479;
        float _503 = _501 + 1.0;
        float _505 = _487 * (*spvDescriptorSet0.cp_c5)._m0[0].y;
        float _507 = -_495;
        float _509 = _507 + 1.0;
        float _511 = _499 * (*spvDescriptorSet0.cp_c5)._m0[0].y;
        float _513 = -_503;
        float _515 = fma(_513, (*spvDescriptorSet0.cp_c5)._m0[0].y, 1.0);
        float _517 = _405 * _473;
        float _519 = _509 * (*spvDescriptorSet0.cp_c5)._m0[0].y;
        float _521 = _405 * _511;
        float _523 = -_463;
        float _525 = _523 + 1.0;
        float _527 = _405 * _505;
        float _529 = _405 * _519;
        float _531 = -_521;
        float _533 = fma(_531, _407, 1.0);
        float _535 = -_517;
        float _537 = fma(_535, _407, 1.0);
        float _539 = -_525;
        float _541 = fma(_539, (*spvDescriptorSet0.cp_c5)._m0[0].y, 1.0);
        float _543 = -_529;
        float _545 = fma(_543, _407, 1.0);
        float _547 = -_533;
        float _549 = _515 + _547;
        float _551 = -_527;
        float _553 = fma(_551, _407, 1.0);
        float _555 = -_537;
        float _557 = _471 + _555;
        float _559 = -_491;
        float _561 = _559 + 1.0;
        float _563 = fma(_433, _549, _533);
        float _565 = -_553;
        float _567 = _541 + _565;
        float _569 = fma(_433, _557, _537);
        float _571 = -_561;
        float _573 = fma(_571, (*spvDescriptorSet0.cp_c5)._m0[0].y, 1.0);
        float _575 = _563;
        float _577 = _553;
        float _579 = _569;
        float _581 = _537;
        float _583 = _533;
        if (_255)
        {
            float _585 = _563 * _241;
            _575 = _585;
        }
        float _587 = _575;
        float _589 = fma(_433, _567, _553);
        float _591 = _589;
        if (!_255)
        {
            _577 = 0.0;
        }
        float _593 = _577;
        float _595 = _593;
        if (_257)
        {
            float _597 = _569 * _245;
            _579 = _597;
        }
        float _599 = _579;
        if (!_255)
        {
            _581 = 0.0;
        }
        float _601 = _581;
        float _603 = _601;
        if (_259)
        {
            float _605 = _589 * _249;
            _591 = _605;
        }
        float _607 = _591;
        float _609 = -_545;
        float _611 = _573 + _609;
        float _613 = fma(_433, _611, _545);
        float _615 = _613;
        if (_261)
        {
            float _617 = _613 * _253;
            _615 = _617;
        }
        float _619 = _615;
        float _621 = _325;
        float _623 = _345;
        float _625 = _379;
        float _627 = _399;
        if (_255)
        {
            float _629 = _241 * _325;
            _583 = _629;
        }
        float _631 = _583;
        if (!_255)
        {
            _621 = 0.0;
        }
        float _633 = _621;
        float _635 = _633;
        if (_257)
        {
            float _637 = _245 * _345;
            _623 = _637;
        }
        float _639 = _623;
        if (_255)
        {
            float _641 = _323 * _587;
            _635 = _641;
        }
        float _643 = _635;
        float _645 = _643;
        if (_255)
        {
            float _647 = _515 * _631;
            _595 = _647;
        }
        float _649 = _595;
        float _651 = _649;
        if (_255)
        {
            float _653 = _327 * _587;
            _603 = _653;
        }
        float _655 = _603;
        float _657 = _655;
        if (_259)
        {
            float _659 = _249 * _379;
            _625 = _659;
        }
        float _661 = _625;
        if (_257)
        {
            float _663 = fma(_343, _599, _643);
            _645 = _663;
        }
        float _665 = _645;
        float _667 = _665;
        if (_257)
        {
            float _669 = fma(_471, _639, _649);
            _651 = _669;
        }
        float _671 = _651;
        float _673 = _671;
        if (_257)
        {
            float _675 = fma(_347, _599, _655);
            _657 = _675;
        }
        float _677 = _657;
        float _679 = _677;
        if (_259)
        {
            float _681 = fma(_377, _607, _665);
            _667 = _681;
        }
        float _683 = _667;
        if (_259)
        {
            float _685 = fma(_541, _661, _671);
            _673 = _685;
        }
        float _687 = _673;
        if (_261)
        {
            float _689 = _253 * _399;
            _627 = _689;
        }
        float _691 = _627;
        if (_259)
        {
            float _693 = fma(_381, _607, _677);
            _679 = _693;
        }
        float _695 = _679;
        float _697 = _695;
        float _699 = _683;
        float _701 = _687;
        if (_261)
        {
            float _703 = fma(_401, _619, _695);
            _697 = _703;
        }
        float _705 = _697;
        if (_261)
        {
            float _707 = fma(_397, _619, _683);
            _699 = _707;
        }
        float _709 = _699;
        if (_261)
        {
            float _711 = fma(_573, _691, _687);
            _701 = _711;
        }
        float _713 = _701;
        float _715 = _138 * _705;
        float _717 = _138 * _713;
        float _719 = _138 * _709;
        _209 = _719;
        _217 = _717;
        _219 = _715;
    }
    float _721 = _209;
    float _723 = _217;
    float _725 = _219;
    float _727 = -_140;
    float _729 = _727 + 1.0;
    int _731 = (-2) + as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].w);
    int _733 = _731 + 1;
    float _735 = _729 * _721;
    float _737 = _729 * _723;
    float _739 = _729 * _725;
    bool _741 = as_type<int>(_59) != _733;
    float _743 = _723;
    float _745 = _739;
    if (_741)
    {
        _743 = _735;
    }
    float _747 = _743;
    float _749 = _747;
    if (_741)
    {
        _205 = _737;
    }
    float _751 = _205;
    float _753 = _751;
    if (!_741)
    {
        float _755 = -_130;
        float _757 = _755 + 1.0;
        float _759 = -_128;
        float _761 = _759 + 1.0;
        float _763 = precise::min(_130, _757);
        float _765 = precise::min(_128, _761);
        float _767 = precise::min(_763, _765);
        float _769 = _767 * 10.0;
        float _771 = precise::clamp(_769, 0.0, 1.0);
        float _773 = _735 * _771;
        float _775 = _737 * _771;
        float _777 = _739 * _771;
        _749 = _773;
        _753 = _775;
        _745 = _777;
    }
    float _779 = _749;
    float _781 = _753;
    float _783 = _745;
    float _785 = _157 + _779;
    float _787 = _159 + _781;
    float _789 = _161 + _783;
    int3 _1851 = int3(_84, _88, as_type<int>(_59));
    spvDescriptorSet0.cp_i_tcb_4A_.write(float4(_785, _787, _789, _163), uint2(_1851.xy), uint(_1851.z));
}

