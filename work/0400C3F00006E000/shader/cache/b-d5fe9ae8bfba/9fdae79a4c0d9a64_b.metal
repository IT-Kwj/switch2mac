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
    constant _16* fp_c3 [[id(0)]];
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    texture2d<float> fp_t_tcb_10 [[id(3)]];
    sampler fp_t_tcb_10Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    texture2d<float> fp_t_tcb_12 [[id(7)]];
    sampler fp_t_tcb_12Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_C [[id(9)]];
    sampler fp_t_tcb_CSmplr [[id(10)]];
    texture2d<float> fp_t_tcb_E [[id(11)]];
    sampler fp_t_tcb_ESmplr [[id(12)]];
    texture2d<float> fp_t_tcb_16 [[id(13)]];
    sampler fp_t_tcb_16Smplr [[id(14)]];
    texture2d<float> fp_t_tcb_14 [[id(15)]];
    sampler fp_t_tcb_14Smplr [[id(16)]];
    texture2d<float> fp_t_tcb_18 [[id(17)]];
    sampler fp_t_tcb_18Smplr [[id(18)]];
    texture2d<float> fp_t_tcb_1A [[id(19)]];
    sampler fp_t_tcb_1ASmplr [[id(20)]];
    sampler fp_t_tcb_8Smplr_w [[id(21)]];
    sampler fp_t_tcb_10Smplr_w [[id(22)]];
    sampler fp_t_tcb_ASmplr_w [[id(23)]];
    sampler fp_t_tcb_12Smplr_w [[id(24)]];
    sampler fp_t_tcb_CSmplr_w [[id(25)]];
    sampler fp_t_tcb_ESmplr_w [[id(26)]];
    sampler fp_t_tcb_16Smplr_w [[id(27)]];
    sampler fp_t_tcb_14Smplr_w [[id(28)]];
    sampler fp_t_tcb_18Smplr_w [[id(29)]];
    sampler fp_t_tcb_1ASmplr_w [[id(30)]];
    constant dm_border_t* dm_border [[id(31)]];
};

struct main0_out
{
    float4 m_50 [[color(0)]];
};

struct main0_in
{
    float4 m_52 [[user(locn0)]];
    float4 m_47 [[user(locn1)]];
};

static inline __attribute__((always_inline))
void _58(thread const int& _2891, thread const int& _2892, thread const int& _2893, thread const int& _2894, thread int& _2895, thread int& _2896, thread int& _2897, thread int& _2898, thread int& _2899)
{
    float _2902 = as_type<float>(_2893) + 0.0;
    bool _2904 = _2902 != 0.0;
    bool _2906 = isnan(_2902);
    bool _2908 = _2904 || _2906;
    bool _2910 = isnan(0.0);
    bool _2912 = _2908 || _2910;
    int _2914 = as_type<int>(_2902);
    int _2916 = _2892;
    int _2918 = _2912 ? (-1) : 0;
    if (!_2912)
    {
        float _2920 = as_type<float>(_2893) * 1.0;
        _2914 = as_type<int>(_2920);
    }
    int _2922 = _2914;
    bool _2924 = !_2912;
    int _2926 = _2922;
    if (!_2924)
    {
        float _2928 = as_type<float>(_2893) + 0.0;
        bool _2930 = _2928 >= 0.0;
        bool _2932 = isnan(_2928);
        bool _2934 = _2930 || _2932;
        bool _2936 = isnan(0.0);
        bool _2938 = _2934 || _2936;
        int _2940 = as_type<int>(_2928);
        _2918 = _2938 ? (-1) : 0;
        if (!_2938)
        {
            _2940 = 2147483647;
        }
        int _2942 = _2940;
        bool _2944 = !_2938;
        _2926 = _2942;
        if (!_2944)
        {
            float _2946 = abs(as_type<float>(_2893));
            float _2948 = _2946 + 0.0;
            bool _2950 = _2948 > as_type<float>(0x7f800000u /* inf */);
            bool _2952 = isnan(_2948);
            bool _2954 = _2950 || _2952;
            bool _2956 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _2958 = _2954 || _2956;
            int _2960 = as_type<int>(_2948);
            _2918 = _2958 ? (-1) : 0;
            if (_2958)
            {
                float _2962 = as_type<float>(_2893) + 1.0;
                _2960 = as_type<int>(_2962);
            }
            int _2964 = _2960;
            _2926 = _2964;
            if (!_2958)
            {
                float _2966 = abs(as_type<float>(_2893));
                float _2968 = _2966 + (-0.0);
                float _2970 = 0.0 + _2968;
                bool _2972 = _2970 != as_type<float>(0x7f800000u /* inf */);
                bool _2974 = isnan(_2970);
                bool _2976 = _2972 || _2974;
                bool _2978 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _2980 = _2976 || _2978;
                int _2982 = as_type<int>(_2970);
                _2918 = _2980 ? (-1) : 0;
                if (!_2980)
                {
                    _2982 = _2893;
                }
                int _2984 = _2982;
                bool _2986 = !_2980;
                _2926 = _2984;
                if (!_2986)
                {
                    float _2988 = as_type<float>(_2893) * 18446744073709551616.0;
                    float _2990 = rsqrt(_2988);
                    float _2992 = _2988 * _2990;
                    float _2994 = _2990 * 0.5;
                    float _2996 = -_2992;
                    float _2998 = 0.0 + _2996;
                    float _3000 = fma(_2994, _2998, 0.5);
                    float _3002 = fma(_2992, _3000, _2992);
                    float _3004 = -_3002;
                    float _3006 = 0.0 + _3004;
                    float _3008 = fma(_3002, _3006, _2988);
                    float _3010 = fma(_2994, _3008, _3002);
                    float _3012 = _3010 * 2.3283064365386962890625e-10;
                    _2926 = as_type<int>(_3012);
                    _2916 = as_type<int>(_3002);
                }
            }
        }
    }
    int _3014 = _2926;
    int _3016 = _2916;
    int _3018 = _2918;
    _2895 = _3014;
    _2896 = _2894;
    _2897 = 0;
    _2898 = _3016;
    _2899 = _3018;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _254 = false;
    float _62 = gl_FragCoord.w;
    float _64 = in.m_47.y;
    float _66 = gl_FragCoord.w;
    float _68 = _64 * _66;
    float _70 = in.m_47.x;
    float _72 = gl_FragCoord.w;
    float _74 = _70 * _72;
    float _76 = in.m_47.z;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = 1.0 / _62;
    float _84 = _82 * _68;
    float _86 = _82 * _74;
    float _88 = _82 * _80;
    float _90 = _84 * _84;
    float _92 = fma(_86, _86, _90);
    float _94 = fma(_88, _88, _92);
    float _96 = (*spvDescriptorSet0.fp_c3)._m0[13].w + (-220.0);
    float _98 = rsqrt(_94);
    float _100 = precise::max(0.0, _96);
    float _102 = _86 * _98;
    float _104 = _88 * _98;
    float _106 = _84 * _98;
    float _108 = _102 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _110 = _104 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _112 = -_106;
    float _114 = -_100;
    float _116 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[13].z, _114);
    float _118 = _108 * _108;
    float _120 = _110 * _110;
    float _122 = _118 + _120;
    float _124 = sqrt(_122);
    bool _128 = _124 > (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _130 = _96;
    float _132 = _98;
    float _134 = _116;
    float _136 = _108;
    float _138 = _110;
    if (!_128)
    {
        _130 = _120;
    }
    float _140 = _130;
    float _142 = _140;
    if (!_128)
    {
        _132 = _118;
    }
    float _144 = _132;
    bool _146 = !_128;
    float _148 = _144;
    if (!_146)
    {
        float _150 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _152 = -(*spvDescriptorSet0.fp_c3)._m0[13].x;
        float _154 = _124 + _152;
        float _156 = _116 + (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _158 = rsqrt(_122);
        float _160 = _154 * _150;
        float _162 = _160 * 0.15915493667125701904296875;
        float _164 = _162 * 6.283185482025146484375;
        float _166 = sin(_164);
        float _168 = _162 * 6.283185482025146484375;
        float _170 = cos(_168);
        float _172 = fma(_166, _156, (*spvDescriptorSet0.fp_c3)._m0[13].x);
        float _174 = _158 * _172;
        float _176 = _170 + (-1.0);
        float _178 = _108 * _174;
        float _180 = _110 * _174;
        float _182 = _176 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _184 = _180 * _180;
        float _186 = fma(_116, _170, _182);
        float _188 = _178 * _178;
        _134 = _186;
        _148 = _188;
        _142 = _184;
        _136 = _178;
        _138 = _180;
    }
    float _190 = _134;
    float _192 = _148;
    float _194 = _142;
    float _196 = _136;
    float _198 = _138;
    float _200 = fma(_190, _190, _192);
    float _202 = _200 + _194;
    float _204 = rsqrt(_202);
    float _206 = _204 * _190;
    float _208 = _204 * _196;
    float _210 = _204 * _198;
    float _212 = -_206;
    float _214 = precise::max(0.0, _212);
    float _216 = abs(_214);
    float _218 = -_216;
    float _220 = _218 + 1.0;
    float _222 = fma(_214, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _224 = as_type<int>(_220) + (-218103808);
    float _226 = fma(_214, _222, -0.212114393711090087890625);
    bool _228 = uint(_224) >= 1920991232u;
    float _230 = fma(_214, _226, 1.570728778839111328125);
    bool _232 = !_228;
    float _252;
    if (!_232)
    {
        int _234 = 0;
        int _236 = 0;
        int _238 = as_type<int>(_220);
        int _240 = 1104;
        int _242;
        int _244;
        int _246;
        int _248;
        int _250;
        _58(_234, _236, _238, _240, _242, _244, _246, _248, _250);
        _252 = as_type<float>(_242);
        _254 = true;
    }
    else
    {
        float _256 = rsqrt(_220);
        float _258 = _220 * _256;
        float _260 = _256 * 0.5;
        float _262 = -_258;
        float _264 = 0.0 + _262;
        float _266 = fma(_260, _264, 0.5);
        float _268 = fma(_258, _266, _258);
        float _270 = -_268;
        float _272 = 0.0 + _270;
        float _274 = fma(_268, _272, _220);
        float _276 = fma(_260, _274, _268);
        _252 = _276;
    }
    _254 = false;
    float _278 = _252;
    bool _280 = _206 > 0.0;
    float _282 = _104 * _104;
    float _284 = _102 * _102;
    float _286 = _282 + _284;
    if (_280)
    {
        discard_fragment();
    }
    float _288 = rsqrt(_286);
    float _290 = _230 * _278;
    float _292 = _290 * 0.636619746685028076171875;
    float _294 = precise::clamp(_292, 0.0, 1.0);
    float _296 = -_294;
    float _298 = _296 + 1.0;
    float _300 = sqrt(_298);
    float _302 = _104 * _288;
    float _304 = _102 * _288;
    float _306 = abs(_302);
    float _308 = abs(_304);
    float _310 = precise::max(_306, _308);
    float _312 = precise::max(_310, 9.9999997473787516355514526367188e-05);
    float _314 = -_300;
    float _316 = _314 + 1.0;
    float _318 = 1.0 / _312;
    float _320 = _316 * 0.5;
    float _322 = -_318;
    float _324 = _302 * _322;
    float _326 = _304 * _318;
    float _328 = fma(_324, _320, 0.5);
    float _330 = fma(_326, _320, 0.5);
    if (_280)
    {
        out.m_50.x = 0.0;
        out.m_50.y = 0.0;
        out.m_50.z = 0.0;
        out.m_50.w = 0.0;
        return out;
    }
    float2 _1538;
    _1538.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_328, _330));
    _1538.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_328, _330));
    float _332 = _1538.x;
    float _334 = _332 * 256.0;
    int _336 = int(_334);
    float _338 = float(uint(_336));
    float _340 = _338 * 0.00390625;
    float2 _1554 = float2(_328, _330);
    float4 _343 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1554, float2(0.0), isnan(_1554)), level(_340)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1554, float2(0.0), isnan(_1554)), level(_340)).xyzw;
    float _345 = _343.x;
    float _347 = _343.y;
    float _349 = _343.z;
    float _351 = _343.w;
    float2 _1573 = float2(_328, _330);
    float4 _353 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1573, float2(0.0), isnan(_1573)), level(_340)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1573, float2(0.0), isnan(_1573)), level(_340)).xyzw;
    float _355 = _353.x;
    float _357 = _353.y;
    float _359 = _353.z;
    float _361 = _353.w;
    float2 _1590 = float2(_328, _330);
    float2 _365 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1590, float2(0.0), isnan(_1590)), level(_340)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1590, float2(0.0), isnan(_1590)), level(_340)).xy;
    float _367 = _365.x;
    float _369 = _365.y;
    float2 _1603 = float2(_328, _330);
    float2 _371 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_1603, float2(0.0), isnan(_1603)), level(_340)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_1603, float2(0.0), isnan(_1603)), level(_340)).xy;
    float _373 = _371.x;
    float _375 = _371.y;
    float _377 = -_106;
    float _379 = fma(_377, _106, _284);
    float _381 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _383 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _385 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _387 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _389 = _106 * _381;
    float _391 = _106 * _383;
    float _393 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _395 = _106 * _385;
    float _397 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].x, _389);
    float _399 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].y, _391);
    float _401 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _403 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].z, _395);
    float _405 = -_104;
    float _407 = fma(_405, _393, _397);
    float _409 = fma(_104, _393, _397);
    float _411 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _413 = -_104;
    float _415 = fma(_413, _401, _399);
    float _417 = fma(_104, _401, _399);
    float _419 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _421 = -_104;
    float _423 = fma(_421, _411, _403);
    float _425 = fma(_104, _411, _403);
    float _427 = -_102;
    float _429 = fma(_427, _387, _407);
    float _431 = -_102;
    float _433 = fma(_431, _419, _415);
    float _435 = fma(_102, _419, _417);
    float _437 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _439 = fma(_102, _387, _409);
    float _441 = _102 * _106;
    float _443 = -_102;
    float _445 = fma(_443, _437, _423);
    float _447 = fma(_102, _437, _425);
    float _449 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _451 = -_106;
    float _453 = _102 * _451;
    float _455 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _457 = _102 * _104;
    float _459 = fma(_449, _441, _439);
    float _461 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _463 = fma(_449, _453, _429);
    float _465 = fma(_455, _453, _445);
    float _467 = fma(_455, _441, _447);
    float _469 = fma(_461, _453, _433);
    float _471 = fma(_461, _441, _435);
    float _473 = -_104;
    float _475 = _106 * _473;
    float _477 = _106 * _104;
    float _479 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _481 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _483 = fma(_479, _475, _469);
    float _485 = fma(_479, _477, _471);
    float _487 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _489 = fma(_481, _475, _463);
    float _491 = fma(_481, _477, _459);
    float _493 = fma(_487, _475, _465);
    float _495 = fma(_487, _477, _467);
    float _497 = -_106;
    float _499 = _497 + 1.0;
    float _501 = precise::clamp(_499, 0.0, 1.0);
    float _503 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _505 = fma(_503, _457, _489);
    float _507 = abs(_501);
    float _509 = log2(_507);
    float _511 = fma(_503, _457, _491);
    float _513 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _515 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _517 = fma(_513, _457, _483);
    float _519 = fma(_513, _457, _485);
    float _521 = fma(_515, _457, _493);
    float _523 = fma(_515, _457, _495);
    float _525 = _104 * (-3.0);
    float _527 = -_104;
    float _529 = fma(_527, _525, -1.0);
    float _531 = fma(_282, 3.0, -1.0);
    float _533 = _509 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _535 = exp2(_533);
    float _537 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _539 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _541 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _543 = fma(_537, _529, _517);
    float _545 = fma(_539, _529, _505);
    float _547 = fma(_537, _531, _519);
    float _549 = fma(_539, _531, _511);
    float _551 = fma(_541, _531, _523);
    float _553 = fma(_541, _529, _521);
    float _555 = _208 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _557 = in.m_52.y;
    float _559 = gl_FragCoord.w;
    float _561 = _557 * _559;
    float _563 = _535 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _565 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _567 = -_555;
    float _569 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[11].y, _567);
    float _571 = fma(_563, (*spvDescriptorSet0.fp_c3)._m0[12].x, (*spvDescriptorSet0.fp_c3)._m0[12].y);
    float _573 = precise::clamp(_571, 0.0, 1.0);
    float _575 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _577 = fma(_565, _379, _545);
    float _579 = fma(_565, _379, _549);
    float _581 = -_573;
    float _583 = _581 + 1.0;
    float _585 = -_210;
    float _587 = fma(_585, (*spvDescriptorSet0.fp_c3)._m0[11].z, _569);
    float _589 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _591 = in.m_52.x;
    float _593 = gl_FragCoord.w;
    float _595 = _591 * _593;
    float _597 = fma(_575, _379, _543);
    float _599 = fma(_587, -0.5, 0.5);
    float _601 = abs(_583);
    float _603 = log2(_601);
    float _605 = fma(_589, _379, _553);
    float _607 = fma(_575, _379, _547);
    float _609 = fma(_589, _379, _551);
    float _611 = fma(_587, 0.5, 0.5);
    float _613 = sqrt(_599);
    float _615 = fma(_611, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _617 = fma(_611, _615, -0.212114393711090087890625);
    float _619 = _603 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _621 = fma(_611, _617, 1.570728778839111328125);
    float _623 = exp2(_619);
    float _625 = _613 * 0.636619746685028076171875;
    float _627 = _206 + 1.0;
    float _629 = -_621;
    float _631 = fma(_625, _629, 1.0);
    float _633 = _82 * _595;
    float _635 = _82 * _561;
    float _637 = -_206;
    float _639 = fma(_623, _627, _637);
    float _641 = _351 * _351;
    float _643 = _361 * _361;
    float _645 = _641 * _641;
    float _647 = _643 * _643;
    float _649 = _645 * 16.0;
    float _651 = _647 * 16.0;
    float _653 = _369 * _649;
    float _655 = _375 * _651;
    float _657 = _367 * _369;
    float _659 = -_369;
    float _661 = _659 + _375;
    float _663 = _345 * _653;
    float _665 = _347 * _653;
    float _667 = _349 * _653;
    float _669 = -_657;
    float _671 = fma(_373, _375, _669);
    float _673 = -_663;
    float _675 = fma(_355, _655, _673);
    float _677 = -_665;
    float _679 = fma(_357, _655, _677);
    float _681 = -_667;
    float _683 = fma(_359, _655, _681);
    float _685 = fma(_661, (*spvDescriptorSet0.fp_c3)._m0[0].x, _369);
    float _687 = fma(_671, (*spvDescriptorSet0.fp_c3)._m0[0].x, _657);
    float _689 = fma(_675, (*spvDescriptorSet0.fp_c3)._m0[0].x, _663);
    float _691 = fma(_683, (*spvDescriptorSet0.fp_c3)._m0[0].x, _667);
    float _693 = fma(_679, (*spvDescriptorSet0.fp_c3)._m0[0].x, _665);
    float2 _2139 = float2(_328, _330);
    float4 _695 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2139, float2(0.0), isnan(_2139)), level(_340)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2139, float2(0.0), isnan(_2139)), level(_340)).xyzw;
    float _697 = _695.x;
    float _699 = _695.y;
    float _701 = _695.z;
    float _703 = _695.w;
    float2 _2156 = float2(_328, _330);
    float2 _705 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2156, float2(0.0), isnan(_2156)), level(_340)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2156, float2(0.0), isnan(_2156)), level(_340)).xy;
    float _707 = _705.x;
    float _709 = _705.y;
    float2 _2169 = float2(_328, _330);
    float2 _711 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_2169, float2(0.0), isnan(_2169)), level(_340)), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_2169, float2(0.0), isnan(_2169)), level(_340)).xy;
    float _713 = _711.x;
    float _715 = _711.y;
    float _717 = fma(_639, 0.5, 0.5);
    float _719 = fma(_206, -0.5, 0.5);
    float2 _2186 = float2(_328, _330);
    float4 _721 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2186, float2(0.0), isnan(_2186)), level(_340)), spvDescriptorSet0.dm_border, 7u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_2186, float2(0.0), isnan(_2186)), level(_340)).xyzw;
    float _723 = _721.x;
    float _725 = _721.y;
    float _727 = _721.z;
    float _729 = _721.w;
    float2 _2203 = float2(_633, _635);
    float3 _733 = dm_bs(spvDescriptorSet0.fp_t_tcb_18.sample(spvDescriptorSet0.fp_t_tcb_18Smplr, select(_2203, float2(0.0), isnan(_2203))), spvDescriptorSet0.dm_border, 8u, spvDescriptorSet0.fp_t_tcb_18, spvDescriptorSet0.fp_t_tcb_18Smplr_w, select(_2203, float2(0.0), isnan(_2203))).xyz;
    float _735 = _733.x;
    float _737 = _733.y;
    float _739 = _733.z;
    float2 _2217 = float2(_631, _717);
    float3 _741 = dm_bs(spvDescriptorSet0.fp_t_tcb_1A.sample(spvDescriptorSet0.fp_t_tcb_1ASmplr, select(_2217, float2(0.0), isnan(_2217))), spvDescriptorSet0.dm_border, 9u, spvDescriptorSet0.fp_t_tcb_1A, spvDescriptorSet0.fp_t_tcb_1ASmplr_w, select(_2217, float2(0.0), isnan(_2217))).xyz;
    float _743 = _741.x;
    float _745 = _741.y;
    float _747 = _741.z;
    float2 _2231 = float2(_631, _719);
    float3 _749 = dm_bs(spvDescriptorSet0.fp_t_tcb_1A.sample(spvDescriptorSet0.fp_t_tcb_1ASmplr, select(_2231, float2(0.0), isnan(_2231))), spvDescriptorSet0.dm_border, 9u, spvDescriptorSet0.fp_t_tcb_1A, spvDescriptorSet0.fp_t_tcb_1ASmplr_w, select(_2231, float2(0.0), isnan(_2231))).xyz;
    float _751 = _749.x;
    float _753 = _749.y;
    float _755 = _749.z;
    float _757 = _703 * _703;
    float _759 = _757 * _757;
    float _761 = _729 * _729;
    float _763 = _735 * _737;
    float _765 = _759 * 16.0;
    float _767 = _761 * _761;
    float _769 = _709 * _765;
    float _771 = _697 * _769;
    float _773 = _699 * _769;
    float _775 = _701 * _769;
    float _777 = -_709;
    float _779 = _777 + _715;
    float _781 = precise::max(_685, 1.52587890625e-05);
    float _783 = fma(_779, (*spvDescriptorSet0.fp_c3)._m0[0].x, _709);
    float _785 = _707 * _709;
    float _787 = 1.0 / _781;
    float _789 = _685 * _787;
    float _791 = _689 * _789;
    float _793 = _693 * _789;
    float _795 = _691 * _789;
    float _797 = _687 * _789;
    float _799 = -(*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _801 = _206 * _799;
    float _803 = _206 * (-10000.0);
    float _805 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[26].x, _801);
    float _807 = _767 * 16.0;
    float _809 = abs(_803);
    bool _811 = _809 > 0.00999999977648258209228515625;
    float _813 = (*spvDescriptorSet0.fp_c3)._m0[24].x * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _815 = fma(_210, (*spvDescriptorSet0.fp_c3)._m0[26].z, _805);
    float _817 = _715 * _807;
    float _819 = _811 ? _803 : 0.00999999977648258209228515625;
    float _821 = -_813;
    float _823 = exp2(_821);
    float _825 = -_771;
    float _827 = fma(_723, _817, _825);
    float _829 = _819 * (*spvDescriptorSet0.fp_c3)._m0[24].x;
    float _831 = -_785;
    float _833 = fma(_713, _715, _831);
    float _835 = fma(_827, (*spvDescriptorSet0.fp_c3)._m0[0].x, _771);
    float _837 = -_773;
    float _839 = fma(_725, _817, _837);
    float _841 = precise::max(_829, -127.0);
    float _843 = fma(_833, (*spvDescriptorSet0.fp_c3)._m0[0].x, _785);
    float _845 = fma(_815, 2.0, (*spvDescriptorSet0.fp_c3)._m0[24].w);
    float _847 = precise::max(_783, 1.52587890625e-05);
    float _849 = -_841;
    float _851 = exp2(_849);
    float _853 = -_775;
    float _855 = fma(_727, _817, _853);
    float _857 = fma(_845, (*spvDescriptorSet0.fp_c3)._m0[24].w, 1.0);
    float _859 = _603 * (*spvDescriptorSet0.fp_c3)._m0[12].z;
    float _861 = -(*spvDescriptorSet0.fp_c3)._m0[24].w;
    float _863 = fma(_861, (*spvDescriptorSet0.fp_c3)._m0[24].w, 1.0);
    float _865 = fma(_855, (*spvDescriptorSet0.fp_c3)._m0[0].x, _775);
    float _867 = abs(_857);
    float _869 = log2(_867);
    float _871 = -_851;
    float _873 = _871 + 1.0;
    float _875 = 1.0 / _847;
    float _877 = _823 * _873;
    float _879 = _869 * 1.5;
    float _881 = 1.0 / _841;
    float _883 = exp2(_859);
    float _885 = _843 * _875;
    float _887 = -(*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _889 = _887 + 1.0;
    float _891 = _877 * _881;
    float _893 = exp2(_879);
    float _895 = _893 * 12.56637096405029296875;
    float _897 = -_685;
    float _899 = _897 + _783;
    float _901 = fma(_735, _899, _685);
    float _903 = 1.0 / _895;
    float _905 = -_763;
    float _907 = _905 + 1.0;
    float _909 = fma(_907, _889, (*spvDescriptorSet0.fp_c3)._m0[2].z);
    float _911 = -_883;
    float _913 = _911 + 1.0;
    float _915 = _885 * _909;
    float _917 = fma(_839, (*spvDescriptorSet0.fp_c3)._m0[0].x, _773);
    float _919 = -_739;
    float _921 = _919 + 1.0;
    float _923 = _913 * (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _925 = -_797;
    float _927 = fma(_783, _915, _925);
    float _929 = _901 * _921;
    float _931 = _863 * _903;
    float _933 = precise::max(_901, 1.52587890625e-05);
    float _935 = fma(_735, _927, _797);
    float _937 = -_923;
    float _939 = _937 + 1.0;
    float _941 = _929 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _943 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _945 = _943 + 1.0;
    float _947 = 1.0 / _933;
    float _949 = -_941;
    float _951 = _949 + 1.0;
    float _953 = fma(_907, _945, (*spvDescriptorSet0.fp_c3)._m0[2].y);
    float _955 = _953 * _875;
    float _957 = abs(_939);
    float _959 = log2(_957);
    float _961 = _783 * _955;
    float _963 = -_793;
    float _965 = fma(_917, _961, _963);
    float _967 = _935 * _947;
    float _969 = fma(_735, _965, _793);
    float _971 = _967 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _973 = _967 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _975 = _971 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _977 = _973 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _979 = abs(_951);
    float _981 = log2(_979);
    float _983 = _959 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _985 = _607 * _975;
    float _987 = _579 * _975;
    float _989 = _959 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _991 = _609 * _975;
    float _993 = fma(_597, _977, _985);
    float _995 = fma(_577, _977, _987);
    float _997 = exp2(_983);
    float _999 = _865 * _955;
    float _1001 = _993 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _1003 = fma(_605, _977, _991);
    float _1005 = _995 * (*spvDescriptorSet0.fp_c3)._m0[23].x;
    float _1007 = -_791;
    float _1009 = fma(_835, _961, _1007);
    float _1011 = _1001 * 0.715200006961822509765625;
    float _1013 = _1003 * (*spvDescriptorSet0.fp_c3)._m0[23].z;
    float _1015 = _981 * (*spvDescriptorSet0.fp_c3)._m0[29].z;
    float _1017 = exp2(_989);
    float _1019 = fma(_1005, 0.2125999927520751953125, _1011);
    float _1021 = -_795;
    float _1023 = fma(_783, _999, _1021);
    float _1025 = _763 * (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _1027 = fma(_735, _1009, _791);
    float _1029 = fma(_1013, 0.072200000286102294921875, _1019);
    float _1031 = fma(_735, _1023, _795);
    float _1033 = _997 * _947;
    float _1035 = exp2(_1015);
    float _1037 = -_1001;
    float _1039 = _1037 + _1029;
    float _1041 = -_1005;
    float _1043 = _1041 + _1029;
    float _1045 = _969 * _1033;
    float _1047 = _1027 * _1033;
    float _1049 = fma(_1025, _1039, _1001);
    float _1051 = _1031 * _1033;
    float _1053 = fma(_1025, _1043, _1005);
    float _1055 = -_1013;
    float _1057 = _1055 + _1029;
    float _1059 = _1017 * _1049;
    float _1061 = _1017 * _1053;
    float _1063 = fma(_1025, _1057, _1013);
    float _1065 = _1059 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _1067 = _1061 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _1069 = -_1035;
    float _1071 = spvFAdd(_1069, 1.00010001659393310546875);
    float _1073 = -_1035;
    float _1075 = _1073 + 1.0;
    float _1077 = _1017 * _1063;
    float _1079 = fma(_1045, (*spvDescriptorSet0.fp_c3)._m0[27].y, _1065);
    float _1081 = _923 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1083 = -_941;
    float _1085 = _1083 + _1075;
    float _1087 = 1.0 / _1071;
    float _1089 = fma(_1047, (*spvDescriptorSet0.fp_c3)._m0[27].x, _1067);
    float _1091 = _1077 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _1093 = _1085 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1095 = fma(_745, _1081, _1079);
    float _1097 = fma(_743, _1081, _1089);
    float _1099 = fma(_1051, (*spvDescriptorSet0.fp_c3)._m0[27].z, _1091);
    float _1101 = _753 * _1093;
    float _1103 = _751 * _1093;
    float _1105 = _755 * _1093;
    float _1107 = fma(_747, _1081, _1099);
    float _1109 = fma(_941, _1095, _1101);
    float _1111 = fma(_941, _1097, _1103);
    float _1113 = fma(_941, _1107, _1105);
    float _1115 = _1087 * _1109;
    float _1117 = _1087 * _1111;
    float _1119 = _1087 * _1113;
    float _1121 = (*spvDescriptorSet0.fp_c3)._m0[24].z * 10000.0;
    float _1123 = _1115 * 0.715200006961822509765625;
    float _1125 = _891 * _1121;
    float _1127 = fma(_1117, 0.2125999927520751953125, _1123);
    float _1129 = fma(_1119, 0.072200000286102294921875, _1127);
    float _1131 = -_1125;
    float _1133 = exp2(_1131);
    float _1135 = 1.0 / _1129;
    float _1137 = -_1133;
    float _1139 = _1137 + 1.0;
    float _1141 = _931 * _1139;
    float _1143 = _1135 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1145 = precise::clamp(_1143, 0.0, 1.0);
    float _1147 = _1141 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _1149 = fma(_1145, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1151 = _1141 * (*spvDescriptorSet0.fp_c3)._m0[25].x;
    float _1153 = _1133 * _1149;
    float _1155 = _1141 * (*spvDescriptorSet0.fp_c3)._m0[25].z;
    float _1157 = fma(_1117, _1153, _1151);
    float _1159 = fma(_1115, _1153, _1147);
    float _1161 = fma(_1119, _1153, _1155);
    out.m_50.x = _1157;
    out.m_50.y = _1159;
    out.m_50.z = _1161;
    out.m_50.w = _1075;
    return out;
}

