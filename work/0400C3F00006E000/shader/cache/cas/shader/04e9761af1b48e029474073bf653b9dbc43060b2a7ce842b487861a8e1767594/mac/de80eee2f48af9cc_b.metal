#pragma clang diagnostic ignored "-Wmissing-prototypes"
#pragma clang diagnostic ignored "-Wmissing-braces"

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
    constant _16* cp_c4 [[id(0)]];
    constant _16* cp_c3 [[id(1)]];
    texture2d<float> cp_t_tcb_8 [[id(2)]];
    sampler cp_t_tcb_8Smplr [[id(3)]];
    texture2d_array<float> cp_t_tcb_12 [[id(4)]];
    sampler cp_t_tcb_12Smplr [[id(5)]];
    texture2d<float> cp_t_tcb_C [[id(6)]];
    sampler cp_t_tcb_CSmplr [[id(7)]];
    texture2d<float> cp_t_tcb_14 [[id(8)]];
    sampler cp_t_tcb_14Smplr [[id(9)]];
    texture3d<float, access::write> cp_i_tcb_48_ [[id(10)]];
    texture3d<float, access::write> cp_i_tcb_4A_ [[id(11)]];
    sampler cp_t_tcb_8Smplr_w [[id(12)]];
    sampler cp_t_tcb_12Smplr_w [[id(13)]];
    sampler cp_t_tcb_CSmplr_w [[id(14)]];
    sampler cp_t_tcb_14Smplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    threadgroup spvUnsafeArray<uint, 576> _26;
    bool _1608 = false;
    float _59 = as_type<float>(gl_WorkGroupID.y);
    float _61 = as_type<float>(gl_LocalInvocationID.y);
    float _63 = as_type<float>(gl_WorkGroupID.x);
    float _65 = as_type<float>(gl_LocalInvocationID.x);
    int _68 = as_type<int>(_59) << 2;
    int _70 = _68 + as_type<int>(_61);
    float _72 = float(uint(_70));
    int _74 = as_type<int>(_63) << 2;
    int _76 = _74 + as_type<int>(_65);
    float _78 = _72 + 0.5;
    float _80 = float(uint(_76));
    float _82 = -_78;
    float _84 = fma(_82, (*spvDescriptorSet0.cp_c4)._m0[0].y, 0.5);
    float _86 = _80 + 0.5;
    float _88 = fma(_84, (*spvDescriptorSet0.cp_c3)._m0[4].y, (*spvDescriptorSet0.cp_c3)._m0[4].w);
    float _90 = fma(_86, (*spvDescriptorSet0.cp_c4)._m0[0].x, -0.5);
    float _92 = _88 * (*spvDescriptorSet0.cp_c3)._m0[1].y;
    float _94 = _88 * (*spvDescriptorSet0.cp_c3)._m0[2].y;
    float _96 = fma(_90, (*spvDescriptorSet0.cp_c3)._m0[4].x, (*spvDescriptorSet0.cp_c3)._m0[4].z);
    float _98 = _88 * (*spvDescriptorSet0.cp_c3)._m0[0].y;
    float _100 = fma(_96, (*spvDescriptorSet0.cp_c3)._m0[1].x, _92);
    float _102 = fma(_96, (*spvDescriptorSet0.cp_c3)._m0[0].x, _98);
    float _104 = fma(_96, (*spvDescriptorSet0.cp_c3)._m0[2].x, _94);
    float _106 = -(*spvDescriptorSet0.cp_c3)._m0[1].z;
    float _108 = _100 + _106;
    float _110 = -(*spvDescriptorSet0.cp_c3)._m0[0].z;
    float _112 = _102 + _110;
    float _114 = -(*spvDescriptorSet0.cp_c3)._m0[2].z;
    float _116 = _104 + _114;
    float _118 = _108 + (*spvDescriptorSet0.cp_c3)._m0[1].w;
    float _120 = _112 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
    float _122 = _116 + (*spvDescriptorSet0.cp_c3)._m0[2].w;
    float _124 = -(*spvDescriptorSet0.cp_c3)._m0[3].y;
    float _126 = _118 + _124;
    float _128 = -(*spvDescriptorSet0.cp_c3)._m0[3].x;
    float _130 = _120 + _128;
    float _132 = -(*spvDescriptorSet0.cp_c3)._m0[3].z;
    float _134 = _122 + _132;
    float _136 = _126 * _126;
    float _138 = fma(_130, _130, _136);
    float _140 = fma(_134, _134, _138);
    float _142 = as_type<float>(gl_LocalInvocationID.z);
    float _144 = rsqrt(_140);
    float _146 = _130 * _144;
    float _148 = _134 * _144;
    float _150 = _126 * _144;
    float _152 = _146 * (*spvDescriptorSet0.cp_c3)._m0[8].w;
    float _154 = _148 * (*spvDescriptorSet0.cp_c3)._m0[8].w;
    float _156 = (*spvDescriptorSet0.cp_c3)._m0[3].y + (-220.0);
    float _158 = _152 * _152;
    float _160 = _154 * _154;
    float _162 = precise::max(0.0, _156);
    float _164 = _158 + _160;
    float _166 = sqrt(_164);
    float _168 = -_150;
    float _170 = -_162;
    float _172 = fma(_168, (*spvDescriptorSet0.cp_c3)._m0[8].w, _170);
    bool _176 = _166 > (*spvDescriptorSet0.cp_c3)._m0[10].z;
    float _178 = _144;
    float _180 = _172;
    float _182 = _158;
    if (!_176)
    {
        _178 = _160;
    }
    float _184 = _178;
    bool _186 = !_176;
    float _188 = _184;
    if (!_186)
    {
        float _190 = 1.0 / (*spvDescriptorSet0.cp_c3)._m0[10].w;
        float _192 = -(*spvDescriptorSet0.cp_c3)._m0[10].z;
        float _194 = _166 + _192;
        float _196 = rsqrt(_164);
        float _198 = _194 * _190;
        float _200 = _198 * 0.15915493667125701904296875;
        float _202 = _172 + (*spvDescriptorSet0.cp_c3)._m0[10].w;
        float _204 = _200 * 6.283185482025146484375;
        float _206 = sin(_204);
        float _208 = _200 * 6.283185482025146484375;
        float _210 = cos(_208);
        float _212 = fma(_206, _202, (*spvDescriptorSet0.cp_c3)._m0[10].z);
        float _214 = _196 * _212;
        float _216 = _210 + (-1.0);
        float _218 = _152 * _214;
        float _220 = _216 * (*spvDescriptorSet0.cp_c3)._m0[10].w;
        float _222 = _154 * _214;
        float _224 = fma(_172, _210, _220);
        float _226 = _218 * _218;
        float _228 = _222 * _222;
        _180 = _224;
        _182 = _226;
        _188 = _228;
    }
    float _230 = _180;
    float _232 = _182;
    float _234 = _188;
    float _236 = fma(_230, _230, _232);
    bool _238 = as_type<uint>(_142) >= as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].w);
    float _240 = _88 * _88;
    float _242 = _236 + _234;
    float _244 = _146 * (*spvDescriptorSet0.cp_c3)._m0[6].x;
    float _246 = fma(_96, _96, _240);
    float _248 = -_150;
    float _250 = -_244;
    float _252 = fma(_248, (*spvDescriptorSet0.cp_c3)._m0[6].y, _250);
    float _254 = rsqrt(_242);
    float _256 = -_148;
    float _258 = fma(_256, (*spvDescriptorSet0.cp_c3)._m0[6].z, _252);
    if (_238)
    {
        return;
    }
    int _260 = as_type<int>(_61) << 2;
    int _262 = _260 + as_type<int>(_65);
    float _264 = _246 + 1.0;
    float _266 = _254 * _230;
    float _268 = -_258;
    float _270 = fma(_268, (*spvDescriptorSet0.cp_c3)._m0[15].x, _258);
    float _272 = sqrt(_264);
    float _274 = -(*spvDescriptorSet0.cp_c3)._m0[8].y;
    float _276 = _274 + 1.0;
    int _278 = _262 << 2;
    uint _281 = as_type<uint>(_142);
    float _283 = 0.0;
    int _285 = 0;
    int _287 = 0;
    int _289 = 0;
    int _291 = 0;
    float _293 = 0.0;
    float _295 = 0.0;
    do
    {
        uint _297 = _281;
        float _299 = _283;
        int _301 = _285;
        int _303 = _287;
        int _305 = _289;
        int _307 = _291;
        float _309 = _293;
        float _311 = _295;
        float _313 = abs((*spvDescriptorSet0.cp_c4)._m0[1].x);
        float _315 = log2(_313);
        float _317 = float(_297);
        float _319 = _272 * (*spvDescriptorSet0.cp_c4)._m0[1].y;
        int _321 = int(_297) + 1;
        float _323 = _148 * (*spvDescriptorSet0.cp_c4)._m0[1].y;
        float _325 = float(uint(_321));
        float _327 = _315 * (*spvDescriptorSet0.cp_c4)._m0[0].z;
        float _329 = _317 * _327;
        float _331 = _325 * _327;
        float _333 = exp2(_329);
        float _335 = exp2(_331);
        float _337 = _333 + (-1.0);
        float _339 = _337 * (*spvDescriptorSet0.cp_c3)._m0[8].z;
        float _341 = _146 * (*spvDescriptorSet0.cp_c4)._m0[1].y;
        float _343 = _335 + (-1.0);
        float _345 = _272 * _339;
        float _347 = -_339;
        float _349 = fma(_343, (*spvDescriptorSet0.cp_c3)._m0[8].z, _347);
        float _351 = fma(_345, _323, (*spvDescriptorSet0.cp_c3)._m0[3].z);
        float _353 = fma(_345, _341, (*spvDescriptorSet0.cp_c3)._m0[3].x);
        float _355 = _349 * _319;
        float _357 = fma(_148, _355, _351);
        float _359 = fma(_146, _355, _353);
        float _361 = fma(_357, 6.2500002968590706586837768554688e-05, 0.5);
        float _363 = fma(_359, 6.2500002968590706586837768554688e-05, 0.5);
        float2 _2077 = float2(_363, _361);
        float _365 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_2077, float2(0.0), isnan(_2077)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_2077, float2(0.0), isnan(_2077)), level(0.0)).x;
        float3 _2088 = float3(_363, _361, float(0));
        float3 _2092 = select(_2088, float3(0.0), isnan(_2088));
        float4 _368 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _2092.xy, uint(rint(_2092.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _2092.xy, uint(rint(_2092.z)), level(0.0)).xyzw;
        float _370 = _368.x;
        float _372 = _368.y;
        float _374 = _368.z;
        float _376 = _368.w;
        float _378 = -(*spvDescriptorSet0.cp_c3)._m0[3].z;
        float _380 = _357 + _378;
        float _382 = -(*spvDescriptorSet0.cp_c3)._m0[3].x;
        float _384 = _359 + _382;
        float _386 = _339 + _349;
        float _388 = _380 * _380;
        float _390 = _150 * (*spvDescriptorSet0.cp_c4)._m0[1].y;
        float _392 = _386 * _319;
        float _394 = fma(_384, _384, _388);
        float _396 = fma(_345, _390, (*spvDescriptorSet0.cp_c3)._m0[3].y);
        float _398 = _150 * _355;
        float _400 = fma(_392, (*spvDescriptorSet0.cp_c3)._m0[11].y, (*spvDescriptorSet0.cp_c3)._m0[11].x);
        float _402 = precise::clamp(_400, 0.0, 1.0);
        float _404 = sqrt(_394);
        float _406 = fma((*spvDescriptorSet0.cp_c3)._m0[6].w, 0.07999999821186065673828125, 0.0199999995529651641845703125);
        float _408 = _396 + _398;
        float _410 = -_402;
        float _412 = _410 + 1.0;
        float _414 = _406 * 100.0;
        float _416 = _150 * 1.02332699298858642578125;
        float _418 = abs(_412);
        float _420 = log2(_418);
        bool _422 = _404 > (*spvDescriptorSet0.cp_c3)._m0[10].z;
        float _424 = -(*spvDescriptorSet0.cp_c3)._m0[10].z;
        float _426 = _404 + _424;
        float _428 = exp2(_414);
        float _430 = _299;
        float _432 = _402;
        float _434 = _404;
        float _436 = _390;
        float _438 = _396;
        float _440 = _309;
        float _442 = _311;
        if (_422)
        {
            float _444 = 1.0 / (*spvDescriptorSet0.cp_c3)._m0[10].w;
            _430 = _444;
        }
        float _446 = _430;
        if (!_422)
        {
            _432 = _408;
        }
        float _448 = _432;
        float _450 = fma(_428, 512.0, -512.0);
        float _452 = _406 * 5115.0;
        float _454 = 1.0 / _450;
        float _456 = _448;
        if (_422)
        {
            float _458 = _426 * _446;
            _434 = _458;
        }
        float _460 = _434;
        float _462 = 1.0 / _406;
        float _464 = _460;
        if (_422)
        {
            float _466 = _460 * 0.15915493667125701904296875;
            _464 = _466;
        }
        float _468 = _464;
        float _470 = _468;
        if (_422)
        {
            float _472 = _468 * 6.283185482025146484375;
            float _474 = cos(_472);
            _470 = _474;
        }
        float _476 = _470;
        float _478 = _452 * _454;
        float _480 = fma(_270, -0.5, 0.5);
        float _482 = log2(_478);
        if (_422)
        {
            float _484 = _476 + (-1.0);
            _436 = _484;
        }
        float _486 = _436;
        float _488 = sqrt(_480);
        if (_422)
        {
            float _490 = _486 * (*spvDescriptorSet0.cp_c3)._m0[10].w;
            _438 = _490;
        }
        float _492 = _438;
        if (_422)
        {
            float _494 = fma(_408, _476, _492);
            _456 = _494;
        }
        float _496 = _456;
        float _498 = fma(_482, _462, 100.0);
        float _500 = abs(_398);
        bool _502 = _500 > 0.00999999977648258209228515625;
        float _504 = -_496;
        float _506 = fma(_408, 2.0, _504);
        float _508 = _502 ? _398 : 0.00999999977648258209228515625;
        float _510 = _488 * 0.636619746685028076171875;
        float3 _2302 = float3(_363, _361, float(1));
        float3 _2304 = select(_2302, float3(0.0), isnan(_2302));
        float4 _512 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _2304.xy, uint(rint(_2304.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _2304.xy, uint(rint(_2304.z)), level(0.0)).xyzw;
        float _514 = _512.x;
        float _516 = _512.y;
        float _518 = _512.z;
        float _520 = _512.w;
        float3 _2319 = float3(_363, _361, float(2));
        float3 _2321 = select(_2319, float3(0.0), isnan(_2319));
        float4 _522 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _2321.xy, uint(rint(_2321.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _2321.xy, uint(rint(_2321.z)), level(0.0)).xyzw;
        float _524 = _522.x;
        float _526 = _522.y;
        float _528 = _522.z;
        float _530 = _522.w;
        float3 _2336 = float3(_363, _361, float(3));
        float3 _2338 = select(_2336, float3(0.0), isnan(_2336));
        float4 _532 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _2338.xy, uint(rint(_2338.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _2338.xy, uint(rint(_2338.z)), level(0.0)).xyzw;
        float _534 = _532.x;
        float _536 = _532.y;
        float _538 = _532.z;
        float _540 = _532.w;
        float3 _2353 = float3(_363, _361, float(4));
        float3 _2355 = select(_2353, float3(0.0), isnan(_2353));
        float4 _542 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _2355.xy, uint(rint(_2355.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _2355.xy, uint(rint(_2355.z)), level(0.0)).xyzw;
        float _544 = _542.x;
        float _546 = _542.y;
        float _548 = _542.z;
        float _550 = _542.w;
        float _552 = _406 * _508;
        float _554 = precise::max(_552, -127.0);
        float _556 = fma(_365, (*spvDescriptorSet0.cp_c3)._m0[10].y, (*spvDescriptorSet0.cp_c3)._m0[10].x);
        float _558 = _420 * (*spvDescriptorSet0.cp_c3)._m0[12].x;
        float _560 = _376 * _416;
        float _562 = _556 + (*spvDescriptorSet0.cp_c3)._m0[3].w;
        float _564 = exp2(_558);
        float _566 = fma(_370, 0.88622701168060302734375, _560);
        float _568 = -_562;
        float _570 = _506 + _568;
        float _572 = precise::max(0.0, _570);
        float2 _2406 = float2(_363, _361);
        float _574 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, select(_2406, float2(0.0), isnan(_2406)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, select(_2406, float2(0.0), isnan(_2406)), level(0.0)).z;
        float _576 = -_554;
        float _578 = exp2(_576);
        float _580 = -_498;
        float _582 = _580 + _572;
        float _584 = _406 * _582;
        float _586 = _266 + 1.0;
        float _588 = 1.0 / _554;
        float _590 = -_266;
        float _592 = fma(_564, _586, _590);
        float _594 = fma(_592, 0.5, 0.5);
        float _596 = -_584;
        float _598 = exp2(_596);
        float _600 = fma(_270, 0.5, 0.5);
        float _602 = -_578;
        float _604 = _602 + 1.0;
        float _606 = fma(_600, -0.0187292993068695068359375, 0.07426099479198455810546875);
        float _608 = fma(_600, _606, -0.212114393711090087890625);
        float _610 = fma(_600, _608, 1.570728778839111328125);
        float _612 = _598 * _604;
        float _614 = -_610;
        float _616 = fma(_510, _614, 1.0);
        float _618 = _612 * _588;
        float3 _2472 = float3(_363, _361, float(6));
        float3 _2474 = select(_2472, float3(0.0), isnan(_2472));
        float4 _620 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _2474.xy, uint(rint(_2474.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _2474.xy, uint(rint(_2474.z)), level(0.0)).xyzw;
        float _622 = _620.x;
        float _624 = _620.y;
        float _626 = _620.z;
        float _628 = _620.w;
        float3 _2490 = float3(_363, _361, float(7));
        float3 _2492 = select(_2490, float3(0.0), isnan(_2490));
        float4 _630 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _2492.xy, uint(rint(_2492.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _2492.xy, uint(rint(_2492.z)), level(0.0)).xyzw;
        float _632 = _630.x;
        float _634 = _630.y;
        float _636 = _630.z;
        float _638 = _630.w;
        float3 _2508 = float3(_363, _361, float(5));
        float3 _2510 = select(_2508, float3(0.0), isnan(_2508));
        float4 _640 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _2510.xy, uint(rint(_2510.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _2510.xy, uint(rint(_2510.z)), level(0.0)).xyzw;
        float _642 = _640.x;
        float _644 = _640.y;
        float _646 = _640.z;
        float _648 = _640.w;
        float2 _2524 = float2(_616, _594);
        float3 _652 = dm_bs(spvDescriptorSet0.cp_t_tcb_14.sample(spvDescriptorSet0.cp_t_tcb_14Smplr, select(_2524, float2(0.0), isnan(_2524)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.cp_t_tcb_14, spvDescriptorSet0.cp_t_tcb_14Smplr_w, select(_2524, float2(0.0), isnan(_2524)), level(0.0)).xyz;
        float _654 = _652.x;
        float _656 = _652.y;
        float _658 = _652.z;
        float _660 = _420 * (*spvDescriptorSet0.cp_c3)._m0[11].z;
        bool _662 = as_type<int>(_142) != 0;
        float _664 = exp2(_660);
        float _666 = _514 * _416;
        float _668 = _516 * _416;
        float _670 = fma(_372, 0.88622701168060302734375, _666);
        float _672 = fma(_374, 0.88622701168060302734375, _668);
        float _674 = _148 * 1.02332699298858642578125;
        float _676 = _544 * _416;
        float _678 = _146 * 1.02332699298858642578125;
        float _680 = _540 * _416;
        float _682 = fma(_520, _674, _670);
        float _684 = fma(_524, _674, _672);
        float _686 = fma(_536, 0.88622701168060302734375, _676);
        float _688 = fma(_530, _678, _684);
        float _690 = fma(_518, _674, _566);
        float _692 = fma(_534, 0.88622701168060302734375, _680);
        float _694 = fma(_550, _674, _686);
        float _696 = fma((*spvDescriptorSet0.cp_c3)._m0[7].w, -0.99447572231292724609375, 1.0);
        float _698 = fma(_526, _678, _690);
        float _700 = 1.0 / _355;
        float _702 = fma(_528, _678, _682);
        float _704 = _546 * _416;
        float _706 = fma(_548, _674, _692);
        float _708 = precise::max(0.0, _688);
        float _710 = fma(_538, 0.88622701168060302734375, _704);
        float _712 = precise::max(0.0, _702);
        float _714 = log2(_696);
        float _716 = fma(_574, _574, 1.0);
        float _718 = _574 * 2.0;
        float _720 = -_718;
        float _722 = fma(_270, _720, _716);
        float _724 = -_718;
        float _726 = _716 + _724;
        float _728 = _714 * (-0.0199999995529651641845703125);
        float _730 = abs(_722);
        float _732 = log2(_730);
        float _734 = _355 * _728;
        float _736 = _618 * _734;
        float _738 = -(*spvDescriptorSet0.cp_c3)._m0[5].w;
        float _740 = _392 + _738;
        float _742 = abs(_726);
        float _744 = log2(_742);
        float _746 = _732 * 1.5;
        float _748 = _740 * _700;
        float _750 = precise::clamp(_748, 0.0, 1.0);
        float _752 = _736 * _750;
        float _754 = exp2(_746);
        float _756 = precise::min((*spvDescriptorSet0.cp_c3)._m0[28].w, (*spvDescriptorSet0.cp_c3)._m0[7].x);
        float _758 = _744 * 1.5;
        float _760 = precise::min((*spvDescriptorSet0.cp_c3)._m0[28].w, (*spvDescriptorSet0.cp_c3)._m0[7].y);
        float _762 = precise::min((*spvDescriptorSet0.cp_c3)._m0[28].w, (*spvDescriptorSet0.cp_c3)._m0[7].z);
        float _764 = exp2(_758);
        float _766 = _624 * _416;
        float _768 = fma(_622, 0.88622701168060302734375, _766);
        float _770 = _634 * _416;
        float _772 = _754 * 12.56637096405029296875;
        float _774 = fma(_642, _674, _710);
        float _776 = fma(_626, _674, _768);
        float _778 = fma(_632, 0.88622701168060302734375, _770);
        float _780 = precise::max(0.0, _698);
        float _782 = fma(_644, _678, _706);
        float _784 = fma(_628, _678, _776);
        float _786 = _764 * 12.56637096405029296875;
        float _788 = 1.0 / _772;
        float _790 = fma(_636, _674, _778);
        float _792 = _784 * 0.31830990314483642578125;
        float _794 = precise::clamp(_792, 0.0, 1.0);
        float _796 = fma(_646, _678, _694);
        float _798 = fma(_648, _678, _774);
        float _800 = fma(_638, _678, _790);
        float _802 = _780 * _756;
        float _804 = precise::min(_794, (*spvDescriptorSet0.cp_c3)._m0[28].w);
        float _806 = 1.0 / _786;
        float _808 = _712 * _760;
        float _810 = _708 * _762;
        float _812 = _800 * 0.31830990314483642578125;
        float _814 = precise::clamp(_812, 0.0, 1.0);
        float _816 = _804 * 0.88622701168060302734375;
        float _818 = -_574;
        float _820 = fma(_818, _574, 1.0);
        float _822 = precise::max(0.0, _782);
        float _824 = _814 + (*spvDescriptorSet0.cp_c3)._m0[9].w;
        float _826 = precise::clamp(_824, 0.0, 1.0);
        float _828 = precise::max(0.0, _796);
        float _830 = fma(_816, (*spvDescriptorSet0.cp_c3)._m0[9].x, _802);
        float _832 = precise::max(0.0, _798);
        float _834 = fma(_816, (*spvDescriptorSet0.cp_c3)._m0[9].y, _808);
        float _836 = fma(_816, (*spvDescriptorSet0.cp_c3)._m0[9].z, _810);
        float _838 = _820 * _788;
        float _840 = precise::min((*spvDescriptorSet0.cp_c3)._m0[28].w, 1.0);
        float _842 = fma(_822, _826, _830);
        float _844 = _820 * _806;
        float _846 = fma(_828, _826, _834);
        float _848 = fma(_832, _826, _836);
        float _850 = _840 * _838;
        float _852 = _842 * _844;
        float _854 = _846 * _844;
        float _856 = _848 * _844;
        float _858 = -_664;
        float _860 = _858 + 1.0;
        float _862 = fma(_850, (*spvDescriptorSet0.cp_c3)._m0[7].x, _852);
        float _864 = fma(_850, (*spvDescriptorSet0.cp_c3)._m0[7].y, _854);
        float _866 = fma(_850, (*spvDescriptorSet0.cp_c3)._m0[7].z, _856);
        float _868 = _355 * _840;
        float _870 = _840 * _654;
        float _872 = _840 * _656;
        float _874 = _840 * _658;
        int _876 = _278 + as_type<int>(_142);
        float _878 = _862 * (*spvDescriptorSet0.cp_c3)._m0[5].x;
        float _880 = _864 * (*spvDescriptorSet0.cp_c3)._m0[5].y;
        float _882 = _866 * (*spvDescriptorSet0.cp_c3)._m0[5].z;
        float _884 = _860 * (*spvDescriptorSet0.cp_c3)._m0[11].w;
        int _886 = _876 << 2;
        int _888 = _886 + 1024;
        uint _890 = uint(int(uint(_888) >> uint(2)));
        _26[int(_890)] = as_type<uint>(_868);
        float _892 = _632;
        float _894 = _844;
        float _896 = _826;
        float _898 = _854;
        if (_662)
        {
            _892 = as_type<float>(_301);
        }
        int _900 = as_type<int>(_892);
        int _902 = _900;
        if (_662)
        {
            _894 = as_type<float>(_303);
        }
        int _904 = as_type<int>(_894);
        int _906 = _876 << 4;
        int _908 = _906 + 1280;
        uint _910 = uint(int(uint(_908) >> uint(2)));
        _26[int(_910)] = as_type<uint>(_878);
        int _912 = _906 + 1284;
        uint _914 = uint(int(uint(_912) >> uint(2)));
        _26[int(_914)] = as_type<uint>(_880);
        int _916 = _906 + 1288;
        uint _918 = uint(int(uint(_916) >> uint(2)));
        _26[int(_918)] = as_type<uint>(_882);
        int _920 = _906 + 1292;
        uint _922 = uint(int(uint(_920) >> uint(2)));
        _26[int(_922)] = as_type<uint>(_752);
        int _924 = _904;
        if (_662)
        {
            _896 = as_type<float>(_305);
        }
        int _926 = as_type<int>(_896);
        int _928 = _926;
        if (_662)
        {
            _898 = as_type<float>(_307);
        }
        int _930 = as_type<int>(_898);
        int _932 = _876 << 4;
        uint _934 = uint(int(uint(_932) >> uint(2)));
        _26[int(_934)] = as_type<uint>(_870);
        int _936 = _932 + 4;
        uint _938 = uint(int(uint(_936) >> uint(2)));
        _26[int(_938)] = as_type<uint>(_872);
        int _940 = _932 + 8;
        uint _942 = uint(int(uint(_940) >> uint(2)));
        _26[int(_942)] = as_type<uint>(_874);
        int _944 = _932 + 12;
        uint _946 = uint(int(uint(_944) >> uint(2)));
        _26[int(_946)] = as_type<uint>(_884);
        threadgroup_barrier(mem_flags::mem_threadgroup);
        int _948 = _930;
        if (!_662)
        {
            int _950 = _278 << 4;
            int _952 = _950 + 1280;
            uint _954 = uint(int(uint(_952) >> uint(2)));
            float _956 = as_type<float>(_26[int(_954)]);
            int _958 = _950 + 1284;
            uint _960 = uint(int(uint(_958) >> uint(2)));
            float _962 = as_type<float>(_26[int(_960)]);
            int _964 = _950 + 1288;
            uint _966 = uint(int(uint(_964) >> uint(2)));
            float _968 = as_type<float>(_26[int(_966)]);
            int _970 = _950 + 1292;
            uint _972 = uint(int(uint(_970) >> uint(2)));
            float _974 = as_type<float>(_26[int(_972)]);
            int _976 = _278 << 4;
            int _978 = _976 + 1296;
            uint _980 = uint(int(uint(_978) >> uint(2)));
            float _982 = as_type<float>(_26[int(_980)]);
            int _984 = _976 + 1300;
            uint _986 = uint(int(uint(_984) >> uint(2)));
            float _988 = as_type<float>(_26[int(_986)]);
            int _990 = _976 + 1304;
            uint _992 = uint(int(uint(_990) >> uint(2)));
            float _994 = as_type<float>(_26[int(_992)]);
            int _996 = _976 + 1308;
            uint _998 = uint(int(uint(_996) >> uint(2)));
            float _1000 = as_type<float>(_26[int(_998)]);
            int _1002 = _278 << 4;
            int _1004 = _1002 + 1312;
            uint _1006 = uint(int(uint(_1004) >> uint(2)));
            float _1008 = as_type<float>(_26[int(_1006)]);
            int _1010 = _1002 + 1316;
            uint _1012 = uint(int(uint(_1010) >> uint(2)));
            float _1014 = as_type<float>(_26[int(_1012)]);
            int _1016 = _1002 + 1320;
            uint _1018 = uint(int(uint(_1016) >> uint(2)));
            float _1020 = as_type<float>(_26[int(_1018)]);
            int _1022 = _1002 + 1324;
            uint _1024 = uint(int(uint(_1022) >> uint(2)));
            float _1026 = as_type<float>(_26[int(_1024)]);
            int _1028 = _278 << 4;
            uint _1030 = uint(int(uint(_1028) >> uint(2)));
            float _1032 = as_type<float>(_26[int(_1030)]);
            int _1034 = _1028 + 4;
            uint _1036 = uint(int(uint(_1034) >> uint(2)));
            float _1038 = as_type<float>(_26[int(_1036)]);
            int _1040 = _1028 + 8;
            uint _1042 = uint(int(uint(_1040) >> uint(2)));
            float _1044 = as_type<float>(_26[int(_1042)]);
            int _1046 = _1028 + 12;
            uint _1048 = uint(int(uint(_1046) >> uint(2)));
            float _1050 = as_type<float>(_26[int(_1048)]);
            int _1052 = _278 << 4;
            int _1054 = _1052 + 16;
            uint _1056 = uint(int(uint(_1054) >> uint(2)));
            float _1058 = as_type<float>(_26[int(_1056)]);
            int _1060 = _1052 + 20;
            uint _1062 = uint(int(uint(_1060) >> uint(2)));
            float _1064 = as_type<float>(_26[int(_1062)]);
            int _1066 = _1052 + 24;
            uint _1068 = uint(int(uint(_1066) >> uint(2)));
            float _1070 = as_type<float>(_26[int(_1068)]);
            int _1072 = _1052 + 28;
            uint _1074 = uint(int(uint(_1072) >> uint(2)));
            float _1076 = as_type<float>(_26[int(_1074)]);
            int _1078 = _278 << 4;
            int _1080 = _1078 + 1328;
            uint _1082 = uint(int(uint(_1080) >> uint(2)));
            float _1084 = as_type<float>(_26[int(_1082)]);
            int _1086 = _1078 + 1332;
            uint _1088 = uint(int(uint(_1086) >> uint(2)));
            float _1090 = as_type<float>(_26[int(_1088)]);
            int _1092 = _1078 + 1336;
            uint _1094 = uint(int(uint(_1092) >> uint(2)));
            float _1096 = as_type<float>(_26[int(_1094)]);
            int _1098 = _1078 + 1340;
            uint _1100 = uint(int(uint(_1098) >> uint(2)));
            float _1102 = as_type<float>(_26[int(_1100)]);
            float _1104 = as_type<float>(_307) + _974;
            float _1106 = -_1104;
            float _1108 = exp2(_1106);
            float _1110 = _1104 + _1000;
            float _1112 = _1110 + _1026;
            float _1114 = -_1110;
            float _1116 = exp2(_1114);
            float _1118 = -_956;
            float _1120 = _1118 + _1032;
            float _1122 = -_962;
            float _1124 = _1122 + _1038;
            float _1126 = -_968;
            float _1128 = _1126 + _1044;
            float _1130 = -_982;
            float _1132 = _1130 + _1058;
            float _1134 = -_988;
            float _1136 = _1134 + _1064;
            float _1138 = -_1108;
            float _1140 = _1138 + 1.0;
            float _1142 = -_1112;
            float _1144 = exp2(_1142);
            int _1146 = _278 << 4;
            int _1148 = _1146 + 32;
            uint _1150 = uint(int(uint(_1148) >> uint(2)));
            float _1152 = as_type<float>(_26[int(_1150)]);
            int _1154 = _1146 + 36;
            uint _1156 = uint(int(uint(_1154) >> uint(2)));
            float _1158 = as_type<float>(_26[int(_1156)]);
            int _1160 = _1146 + 40;
            uint _1162 = uint(int(uint(_1160) >> uint(2)));
            float _1164 = as_type<float>(_26[int(_1162)]);
            int _1166 = _1146 + 44;
            uint _1168 = uint(int(uint(_1166) >> uint(2)));
            float _1170 = as_type<float>(_26[int(_1168)]);
            float _1172 = _1112 + _1102;
            float _1174 = precise::min(_1140, (*spvDescriptorSet0.cp_c3)._m0[8].y);
            float _1176 = -_1116;
            float _1178 = _1176 + 1.0;
            float _1180 = -_309;
            float _1182 = _1174 + _1180;
            float _1184 = precise::min(_1178, (*spvDescriptorSet0.cp_c3)._m0[8].y);
            float _1186 = _1182 * _1050;
            float _1188 = _1120 * _1186;
            float _1190 = _1124 * _1186;
            float _1192 = _1128 * _1186;
            float _1194 = fma(_956, _1182, _1188);
            float _1196 = -_1174;
            float _1198 = _1196 + _1184;
            float _1200 = fma(_968, _1182, _1192);
            float _1202 = -_1144;
            float _1204 = _1202 + 1.0;
            int _1206 = _278 << 4;
            int _1208 = _1206 + 48;
            uint _1210 = uint(int(uint(_1208) >> uint(2)));
            float _1212 = as_type<float>(_26[int(_1210)]);
            int _1214 = _1206 + 52;
            uint _1216 = uint(int(uint(_1214) >> uint(2)));
            float _1218 = as_type<float>(_26[int(_1216)]);
            int _1220 = _1206 + 56;
            uint _1222 = uint(int(uint(_1220) >> uint(2)));
            float _1224 = as_type<float>(_26[int(_1222)]);
            int _1226 = _1206 + 60;
            uint _1228 = uint(int(uint(_1226) >> uint(2)));
            float _1230 = as_type<float>(_26[int(_1228)]);
            float _1232 = _1198 * _1076;
            float _1234 = fma(_962, _1182, _1190);
            float _1236 = -_994;
            float _1238 = _1236 + _1070;
            int _1240 = _278 << 2;
            int _1242 = _1240 + 1032;
            uint _1244 = uint(int(uint(_1242) >> uint(2)));
            float _1246 = as_type<float>(_26[int(_1244)]);
            float _1248 = _1132 * _1232;
            float _1250 = _1136 * _1232;
            float _1252 = precise::min(_1204, (*spvDescriptorSet0.cp_c3)._m0[8].y);
            int _1254 = _278 << 2;
            int _1256 = _1254 + 1024;
            uint _1258 = uint(int(uint(_1256) >> uint(2)));
            float _1260 = as_type<float>(_26[int(_1258)]);
            float _1262 = fma(_982, _1198, _1248);
            float _1264 = fma(_988, _1198, _1250);
            float _1266 = -_1172;
            float _1268 = exp2(_1266);
            int _1270 = _278 << 2;
            int _1272 = _1270 + 1028;
            uint _1274 = uint(int(uint(_1272) >> uint(2)));
            float _1276 = as_type<float>(_26[int(_1274)]);
            float _1278 = -_1184;
            float _1280 = _1278 + _1252;
            float _1282 = _1238 * _1232;
            float _1284 = -_1008;
            float _1286 = _1284 + _1152;
            float _1288 = _1280 * _1170;
            int _1290 = _278 << 2;
            int _1292 = _1290 + 1036;
            uint _1294 = uint(int(uint(_1292) >> uint(2)));
            float _1296 = as_type<float>(_26[int(_1294)]);
            float _1298 = -_1014;
            float _1300 = _1298 + _1158;
            float _1302 = -_1020;
            float _1304 = _1302 + _1164;
            float _1306 = _1286 * _1288;
            float _1308 = _1300 * _1288;
            float _1310 = fma(_994, _1198, _1282);
            float _1312 = _1304 * _1288;
            float _1314 = _1234 + as_type<float>(_303);
            float _1316 = -_1268;
            float _1318 = _1316 + 1.0;
            float _1320 = fma(_1014, _1280, _1308);
            float _1322 = fma(_1020, _1280, _1312);
            float _1324 = _1194 + as_type<float>(_301);
            float _1326 = _1200 + as_type<float>(_305);
            float _1328 = precise::min(_1318, (*spvDescriptorSet0.cp_c3)._m0[8].y);
            float _1330 = _1314 + _1264;
            float _1332 = fma(_1008, _1280, _1306);
            float _1334 = _1324 + _1262;
            float _1336 = _1326 + _1310;
            float _1338 = -_1252;
            float _1340 = _1328 + _1338;
            float _1342 = _1330 + _1320;
            float _1344 = _1334 + _1332;
            float _1346 = -_1084;
            float _1348 = _1346 + _1212;
            float _1350 = _1340 * _1230;
            float _1352 = -_1090;
            float _1354 = _1352 + _1218;
            float _1356 = -_1096;
            float _1358 = _1356 + _1224;
            float _1360 = _1336 + _1322;
            int _1362 = _278 << 4;
            int _1364 = _1362 + 1280;
            uint _1366 = uint(int(uint(_1364) >> uint(2)));
            _26[int(_1366)] = as_type<uint>(_1324);
            int _1368 = _1362 + 1284;
            uint _1370 = uint(int(uint(_1368) >> uint(2)));
            _26[int(_1370)] = as_type<uint>(_1314);
            int _1372 = _1362 + 1288;
            uint _1374 = uint(int(uint(_1372) >> uint(2)));
            _26[int(_1374)] = as_type<uint>(_1326);
            int _1376 = _1362 + 1292;
            uint _1378 = uint(int(uint(_1376) >> uint(2)));
            _26[int(_1378)] = as_type<uint>(_1104);
            float _1380 = _1354 * _1350;
            float _1382 = _1358 * _1350;
            float _1384 = _1260 + _311;
            float _1386 = _1348 * _1350;
            float _1388 = fma(_1090, _1340, _1380);
            float _1390 = fma(_1096, _1340, _1382);
            float _1392 = _1384 + _1276;
            float _1394 = fma(_1084, _1340, _1386);
            float _1396 = _1388 + _1342;
            float _1398 = _1390 + _1360;
            float _1400 = _1392 + _1246;
            float _1402 = _1394 + _1344;
            int _1404 = _278 << 4;
            int _1406 = _1404 + 1296;
            uint _1408 = uint(int(uint(_1406) >> uint(2)));
            _26[int(_1408)] = as_type<uint>(_1334);
            int _1410 = _1404 + 1300;
            uint _1412 = uint(int(uint(_1410) >> uint(2)));
            _26[int(_1412)] = as_type<uint>(_1330);
            int _1414 = _1404 + 1304;
            uint _1416 = uint(int(uint(_1414) >> uint(2)));
            _26[int(_1416)] = as_type<uint>(_1336);
            int _1418 = _1404 + 1308;
            uint _1420 = uint(int(uint(_1418) >> uint(2)));
            _26[int(_1420)] = as_type<uint>(_1110);
            float _1422 = _1400 + _1296;
            int _1424 = _278 << 4;
            int _1426 = _1424 + 1312;
            uint _1428 = uint(int(uint(_1426) >> uint(2)));
            _26[int(_1428)] = as_type<uint>(_1344);
            int _1430 = _1424 + 1316;
            uint _1432 = uint(int(uint(_1430) >> uint(2)));
            _26[int(_1432)] = as_type<uint>(_1342);
            int _1434 = _1424 + 1320;
            uint _1436 = uint(int(uint(_1434) >> uint(2)));
            _26[int(_1436)] = as_type<uint>(_1360);
            int _1438 = _1424 + 1324;
            uint _1440 = uint(int(uint(_1438) >> uint(2)));
            _26[int(_1440)] = as_type<uint>(_1112);
            int _1442 = _278 << 2;
            int _1444 = _1442 + 1024;
            uint _1446 = uint(int(uint(_1444) >> uint(2)));
            _26[int(_1446)] = as_type<uint>(_1384);
            int _1448 = _278 << 2;
            int _1450 = _1448 + 1028;
            uint _1452 = uint(int(uint(_1450) >> uint(2)));
            _26[int(_1452)] = as_type<uint>(_1392);
            int _1454 = _278 << 2;
            int _1456 = _1454 + 1032;
            uint _1458 = uint(int(uint(_1456) >> uint(2)));
            _26[int(_1458)] = as_type<uint>(_1400);
            int _1460 = _278 << 2;
            int _1462 = _1460 + 1036;
            uint _1464 = uint(int(uint(_1462) >> uint(2)));
            _26[int(_1464)] = as_type<uint>(_1422);
            int _1466 = _278 << 4;
            int _1468 = _1466 + 1328;
            uint _1470 = uint(int(uint(_1468) >> uint(2)));
            _26[int(_1470)] = as_type<uint>(_1402);
            int _1472 = _1466 + 1332;
            uint _1474 = uint(int(uint(_1472) >> uint(2)));
            _26[int(_1474)] = as_type<uint>(_1396);
            int _1476 = _1466 + 1336;
            uint _1478 = uint(int(uint(_1476) >> uint(2)));
            _26[int(_1478)] = as_type<uint>(_1398);
            int _1480 = _1466 + 1340;
            uint _1482 = uint(int(uint(_1480) >> uint(2)));
            _26[int(_1482)] = as_type<uint>(_1172);
            _440 = _1328;
            _442 = _1422;
            _902 = as_type<int>(_1402);
            _924 = as_type<int>(_1396);
            _928 = as_type<int>(_1398);
            _948 = as_type<int>(_1172);
        }
        float _1484 = _440;
        float _1486 = _442;
        int _1488 = _902;
        int _1490 = _924;
        int _1492 = _928;
        int _1494 = _948;
        threadgroup_barrier(mem_flags::mem_threadgroup);
        int _1496 = _876 << 4;
        int _1498 = _1496 + 1280;
        uint _1500 = uint(int(uint(_1498) >> uint(2)));
        float _1502 = as_type<float>(_26[int(_1500)]);
        int _1504 = _1496 + 1284;
        uint _1506 = uint(int(uint(_1504) >> uint(2)));
        float _1508 = as_type<float>(_26[int(_1506)]);
        int _1510 = _1496 + 1288;
        uint _1512 = uint(int(uint(_1510) >> uint(2)));
        float _1514 = as_type<float>(_26[int(_1512)]);
        int _1516 = _1496 + 1292;
        uint _1518 = uint(int(uint(_1516) >> uint(2)));
        float _1520 = as_type<float>(_26[int(_1518)]);
        float _1522 = -(*spvDescriptorSet0.cp_c3)._m0[13].y;
        float _1524 = _392 + _1522;
        float _1526 = 1.0 / _392;
        int _1528 = _876 << 2;
        int _1530 = _1528 + 1024;
        uint _1532 = uint(int(uint(_1530) >> uint(2)));
        float _1534 = as_type<float>(_26[int(_1532)]);
        float _1536 = _1524 * (*spvDescriptorSet0.cp_c3)._m0[13].z;
        float _1538 = precise::clamp(_1536, 0.0, 1.0);
        float _1540 = abs(_1538);
        float _1542 = log2(_1540);
        float _1544 = _1542 * (*spvDescriptorSet0.cp_c3)._m0[13].w;
        float _1546 = exp2(_1544);
        float _1548 = -_1520;
        float _1550 = exp2(_1548);
        float _1552 = _1546 * (*spvDescriptorSet0.cp_c3)._m0[14].w;
        float _1554 = precise::max(_1550, _276);
        float _1556 = -_1554;
        float _1558 = _1556 + 1.0;
        float _1560 = -_1552;
        float _1562 = _1560 + 1.0;
        float _1564 = 1.0 / _1558;
        bool _1566 = _1562 > _1558;
        bool _1568 = isnan(_1562);
        bool _1570 = _1566 || _1568;
        bool _1572 = isnan(_1558);
        bool _1574 = _1570 || _1572;
        float _1576 = _1562 * _1564;
        bool _1578 = !_1574;
        float _1580 = _1578 ? _1576 : 1.0;
        float _1582 = _1502 * _1580;
        float _1584 = _1508 * _1580;
        float _1586 = _1514 * _1580;
        float _1588 = _1534 * _1526;
        float _1590 = fma(_1558, _1580, _1552);
        float _1592 = precise::clamp(_1590, 0.0, 1.0);
        float _1594 = fma(_1552, (*spvDescriptorSet0.cp_c3)._m0[14].x, _1582);
        float _1596 = fma(_1552, (*spvDescriptorSet0.cp_c3)._m0[14].y, _1584);
        float _1598 = fma(_1552, (*spvDescriptorSet0.cp_c3)._m0[14].z, _1586);
        float _1600 = -_1592;
        float _1602 = _1600 + 1.0;
        spvDescriptorSet0.cp_i_tcb_48_.write(float4(_1594, _1596, _1598, _1602), uint3(int3(_76, _70, int(_297))));
        spvDescriptorSet0.cp_i_tcb_4A_.write(float4(_1588, _1588, _1588, _1588), uint3(int3(_76, _70, int(_297))));
        int _1604 = int(_297) + 4;
        bool _1606 = uint(_1604) >= as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].w);
        _281 = uint(_1604);
        _283 = _1602;
        _285 = _1488;
        _287 = _1490;
        _289 = _1492;
        _291 = _1494;
        _293 = _1484;
        _295 = _1486;
        if (_1606)
        {
            _1608 = true;
            if (_1608)
            {
                break;
            }
        }
    } while (true);
    _1608 = false;
}

