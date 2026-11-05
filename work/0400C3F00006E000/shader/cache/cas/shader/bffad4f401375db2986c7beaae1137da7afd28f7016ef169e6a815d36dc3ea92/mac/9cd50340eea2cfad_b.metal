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
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_E [[id(5)]];
    sampler fp_t_tcb_ESmplr [[id(6)]];
    texture2d<float> fp_t_tcb_C [[id(7)]];
    sampler fp_t_tcb_CSmplr [[id(8)]];
    texture2d<float> fp_t_tcb_10 [[id(9)]];
    sampler fp_t_tcb_10Smplr [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    sampler fp_t_tcb_ESmplr_w [[id(12)]];
    sampler fp_t_tcb_CSmplr_w [[id(13)]];
    sampler fp_t_tcb_10Smplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_40 [[color(0)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0)]];
    float4 m_37 [[user(locn1)]];
};

static inline __attribute__((always_inline))
void _48(thread const int& _906, thread const int& _907, thread const int& _908, thread const int& _909, thread int& _910, thread int& _911, thread int& _912, thread int& _913, thread int& _914)
{
    float _917 = as_type<float>(_909) + 0.0;
    bool _919 = _917 != 0.0;
    bool _921 = isnan(_917);
    bool _923 = _919 || _921;
    bool _925 = isnan(0.0);
    bool _927 = _923 || _925;
    int _929 = _906;
    int _931 = _907;
    int _933 = _927 ? (-1) : 0;
    if (!_927)
    {
        float _935 = as_type<float>(_909) * 1.0;
        _929 = as_type<int>(_935);
    }
    int _937 = _929;
    bool _939 = !_927;
    int _941 = _937;
    int _943 = _937;
    if (!_939)
    {
        float _945 = as_type<float>(_909) + 0.0;
        bool _947 = _945 >= 0.0;
        bool _949 = isnan(_945);
        bool _951 = _947 || _949;
        bool _953 = isnan(0.0);
        bool _955 = _951 || _953;
        _933 = _955 ? (-1) : 0;
        if (!_955)
        {
            _941 = 2147483647;
        }
        int _957 = _941;
        bool _959 = !_955;
        int _961 = _957;
        _943 = _957;
        if (!_959)
        {
            float _963 = abs(as_type<float>(_909));
            float _965 = _963 + 0.0;
            bool _967 = _965 > as_type<float>(0x7f800000u /* inf */);
            bool _969 = isnan(_965);
            bool _971 = _967 || _969;
            bool _973 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _975 = _971 || _973;
            _933 = _975 ? (-1) : 0;
            if (_975)
            {
                float _977 = as_type<float>(_909) + 1.0;
                _961 = as_type<int>(_977);
            }
            int _979 = _961;
            int _981 = _979;
            _943 = _979;
            if (!_975)
            {
                float _983 = abs(as_type<float>(_909));
                float _985 = _983 + (-0.0);
                float _987 = 0.0 + _985;
                bool _989 = _987 != as_type<float>(0x7f800000u /* inf */);
                bool _991 = isnan(_987);
                bool _993 = _989 || _991;
                bool _995 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _997 = _993 || _995;
                _933 = _997 ? (-1) : 0;
                if (!_997)
                {
                    _981 = _909;
                }
                int _999 = _981;
                bool _1001 = !_997;
                _943 = _999;
                if (!_1001)
                {
                    float _1003 = as_type<float>(_909) * 18446744073709551616.0;
                    float _1005 = rsqrt(_1003);
                    float _1007 = _1003 * _1005;
                    float _1009 = _1005 * 0.5;
                    float _1011 = -_1007;
                    float _1013 = 0.0 + _1011;
                    float _1015 = fma(_1009, _1013, 0.5);
                    float _1017 = fma(_1007, _1015, _1007);
                    float _1019 = -_1017;
                    float _1021 = 0.0 + _1019;
                    float _1023 = fma(_1017, _1021, _1003);
                    float _1025 = fma(_1009, _1023, _1017);
                    float _1027 = _1025 * 2.3283064365386962890625e-10;
                    _943 = as_type<int>(_1027);
                    _931 = as_type<int>(_1017);
                }
            }
        }
    }
    int _1029 = _943;
    int _1031 = _931;
    int _1033 = _933;
    _910 = _908;
    _911 = 0;
    _912 = _1029;
    _913 = _1031;
    _914 = _1033;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _232 = false;
    float _52 = gl_FragCoord.w;
    float _54 = in.m_37.y;
    float _56 = gl_FragCoord.w;
    float _58 = _54 * _56;
    float _60 = in.m_37.x;
    float _62 = gl_FragCoord.w;
    float _64 = _60 * _62;
    float _66 = in.m_37.z;
    float _68 = gl_FragCoord.w;
    float _70 = _66 * _68;
    float _72 = (*spvDescriptorSet0.fp_c3)._m0[13].w + (-220.0);
    float _74 = precise::max(0.0, _72);
    float _76 = 1.0 / _52;
    float _78 = _76 * _58;
    float _80 = _76 * _64;
    float _82 = _76 * _70;
    float _84 = _78 * _78;
    float _86 = fma(_80, _80, _84);
    float _88 = fma(_82, _82, _86);
    float _90 = rsqrt(_88);
    float _92 = _80 * _90;
    float _94 = _82 * _90;
    float _96 = _78 * _90;
    float _98 = _92 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _100 = _94 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _102 = -_96;
    float _104 = -_74;
    float _106 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[13].z, _104);
    float _108 = _98 * _98;
    float _110 = _100 * _100;
    float _112 = _108 + _110;
    float _114 = sqrt(_112);
    bool _118 = _114 > (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _120 = _96;
    float _122 = _74;
    float _124 = _106;
    if (!_118)
    {
        _120 = _110;
    }
    float _126 = _120;
    float _128 = _126;
    if (!_118)
    {
        _122 = _108;
    }
    float _130 = _122;
    bool _132 = !_118;
    float _134 = _130;
    if (!_132)
    {
        float _136 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _138 = -(*spvDescriptorSet0.fp_c3)._m0[13].x;
        float _140 = _114 + _138;
        float _142 = _106 + (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _144 = rsqrt(_112);
        float _146 = _140 * _136;
        float _148 = _146 * 0.15915493667125701904296875;
        float _150 = _148 * 6.283185482025146484375;
        float _152 = sin(_150);
        float _154 = _148 * 6.283185482025146484375;
        float _156 = cos(_154);
        float _158 = fma(_152, _142, (*spvDescriptorSet0.fp_c3)._m0[13].x);
        float _160 = _144 * _158;
        float _162 = _156 + (-1.0);
        float _164 = _98 * _160;
        float _166 = _162 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _168 = _100 * _160;
        float _170 = fma(_106, _156, _166);
        float _172 = _164 * _164;
        float _174 = _168 * _168;
        _124 = _170;
        _134 = _172;
        _128 = _174;
    }
    float _176 = _124;
    float _178 = _134;
    float _180 = _128;
    float _182 = fma(_176, _176, _178);
    float _184 = _182 + _180;
    float _186 = rsqrt(_184);
    float _188 = _186 * _176;
    float _190 = -_188;
    float _192 = precise::max(0.0, _190);
    float _194 = abs(_192);
    float _196 = -_194;
    float _198 = _196 + 1.0;
    float _200 = fma(_192, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _202 = as_type<int>(_198) + (-218103808);
    float _204 = fma(_192, _200, -0.212114393711090087890625);
    bool _206 = uint(_202) >= 1920991232u;
    float _208 = fma(_192, _204, 1.570728778839111328125);
    bool _210 = !_206;
    float _230;
    if (!_210)
    {
        int _212 = as_type<int>(_100);
        int _214 = as_type<int>(_204);
        int _216 = 1040;
        int _218 = as_type<int>(_198);
        int _220;
        int _222;
        int _224;
        int _226;
        int _228;
        _48(_212, _214, _216, _218, _220, _222, _224, _226, _228);
        _230 = as_type<float>(_224);
        _232 = true;
    }
    else
    {
        float _234 = rsqrt(_198);
        float _236 = _198 * _234;
        float _238 = _234 * 0.5;
        float _240 = -_236;
        float _242 = 0.0 + _240;
        float _244 = fma(_238, _242, 0.5);
        float _246 = fma(_236, _244, _236);
        float _248 = -_246;
        float _250 = 0.0 + _248;
        float _252 = fma(_246, _250, _198);
        float _254 = fma(_238, _252, _246);
        _230 = _254;
    }
    _232 = false;
    float _256 = _230;
    float _258 = _92 * _92;
    float _260 = _208 * _256;
    bool _262 = _188 > 0.0;
    float _264 = fma(_94, _94, _258);
    float _266 = _260 * 0.636619746685028076171875;
    float _268 = precise::clamp(_266, 0.0, 1.0);
    float _270 = -_268;
    float _272 = _270 + 1.0;
    float _274 = rsqrt(_264);
    float _276 = sqrt(_272);
    float _278 = _94 * _274;
    float _280 = _92 * _274;
    float _282 = abs(_278);
    float _284 = abs(_280);
    float _286 = precise::max(_282, _284);
    float _288 = -_276;
    float _290 = _288 + 1.0;
    int _292 = as_type<int>(_276);
    int _294 = as_type<int>(_290);
    if (_262)
    {
        _292 = 1065353216;
    }
    int _296 = _292;
    float _298 = precise::max(_286, 9.9999997473787516355514526367188e-05);
    float _300 = _290 * 0.5;
    int _302 = as_type<int>(_300);
    if (_262)
    {
        _294 = 1065353216;
    }
    int _304 = _294;
    float _306 = 1.0 / _298;
    float _308 = -_306;
    float _310 = _278 * _308;
    float _312 = _280 * _306;
    int _314 = as_type<int>(_306);
    if (_262)
    {
        _314 = 1065353216;
    }
    int _316 = _314;
    float _318 = fma(_310, _300, 0.5);
    float _320 = fma(_312, _300, 0.5);
    if (_262)
    {
        _302 = 1065353216;
    }
    int _322 = _302;
    if (_262)
    {
        out.m_40.x = as_type<float>(_304);
        out.m_40.y = as_type<float>(_296);
        out.m_40.z = as_type<float>(_316);
        out.m_40.w = as_type<float>(_322);
        return out;
    }
    float2 _783;
    _783.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_318, _320));
    _783.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_318, _320));
    float _324 = _783.x;
    float _326 = _324 * 256.0;
    int _328 = int(_326);
    float _330 = in.m_42.x;
    float _332 = gl_FragCoord.w;
    float _334 = _330 * _332;
    float _336 = in.m_42.y;
    float _338 = gl_FragCoord.w;
    float _340 = _336 * _338;
    float _342 = _76 * _334;
    float _344 = _76 * _340;
    float _346 = float(uint(_328));
    float _348 = _346 * 0.00390625;
    float2 _819 = float2(_318, _320);
    float _350 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_819, float2(0.0), isnan(_819)), level(_348)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_819, float2(0.0), isnan(_819)), level(_348)).y;
    float2 _830 = float2(_318, _320);
    float _352 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_830, float2(0.0), isnan(_830)), level(_348)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_830, float2(0.0), isnan(_830)), level(_348)).y;
    float2 _839 = float2(_318, _320);
    float _354 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_839, float2(0.0), isnan(_839)), level(_348)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_839, float2(0.0), isnan(_839)), level(_348)).y;
    float2 _848 = float2(_342, _344);
    float2 _358 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_848, float2(0.0), isnan(_848))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_848, float2(0.0), isnan(_848))).xz;
    float _360 = _358.x;
    float _362 = _358.y;
    float _364 = -_350;
    float _366 = _364 + _352;
    float _368 = _366 * (*spvDescriptorSet0.fp_c3)._m0[29].x;
    float _370 = _368 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _372 = fma(_350, (*spvDescriptorSet0.fp_c3)._m0[29].x, _370);
    float _374 = -_372;
    float _376 = fma(_354, (*spvDescriptorSet0.fp_c3)._m0[29].y, _374);
    float _378 = -_362;
    float _380 = _378 + 1.0;
    float _382 = fma(_360, _376, _372);
    float _384 = _382 * _380;
    float _386 = _384 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    out.m_40.x = _386;
    out.m_40.y = _386;
    out.m_40.z = _386;
    out.m_40.w = _386;
    return out;
}


struct main0_out_u
{
    uint4 m_40 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _232 = false;
    float _52 = gl_FragCoord.w;
    float _54 = in.m_37.y;
    float _56 = gl_FragCoord.w;
    float _58 = _54 * _56;
    float _60 = in.m_37.x;
    float _62 = gl_FragCoord.w;
    float _64 = _60 * _62;
    float _66 = in.m_37.z;
    float _68 = gl_FragCoord.w;
    float _70 = _66 * _68;
    float _72 = (*spvDescriptorSet0.fp_c3)._m0[13].w + (-220.0);
    float _74 = precise::max(0.0, _72);
    float _76 = 1.0 / _52;
    float _78 = _76 * _58;
    float _80 = _76 * _64;
    float _82 = _76 * _70;
    float _84 = _78 * _78;
    float _86 = fma(_80, _80, _84);
    float _88 = fma(_82, _82, _86);
    float _90 = rsqrt(_88);
    float _92 = _80 * _90;
    float _94 = _82 * _90;
    float _96 = _78 * _90;
    float _98 = _92 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _100 = _94 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _102 = -_96;
    float _104 = -_74;
    float _106 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[13].z, _104);
    float _108 = _98 * _98;
    float _110 = _100 * _100;
    float _112 = _108 + _110;
    float _114 = sqrt(_112);
    bool _118 = _114 > (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _120 = _96;
    float _122 = _74;
    float _124 = _106;
    if (!_118)
    {
        _120 = _110;
    }
    float _126 = _120;
    float _128 = _126;
    if (!_118)
    {
        _122 = _108;
    }
    float _130 = _122;
    bool _132 = !_118;
    float _134 = _130;
    if (!_132)
    {
        float _136 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _138 = -(*spvDescriptorSet0.fp_c3)._m0[13].x;
        float _140 = _114 + _138;
        float _142 = _106 + (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _144 = rsqrt(_112);
        float _146 = _140 * _136;
        float _148 = _146 * 0.15915493667125701904296875;
        float _150 = _148 * 6.283185482025146484375;
        float _152 = sin(_150);
        float _154 = _148 * 6.283185482025146484375;
        float _156 = cos(_154);
        float _158 = fma(_152, _142, (*spvDescriptorSet0.fp_c3)._m0[13].x);
        float _160 = _144 * _158;
        float _162 = _156 + (-1.0);
        float _164 = _98 * _160;
        float _166 = _162 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _168 = _100 * _160;
        float _170 = fma(_106, _156, _166);
        float _172 = _164 * _164;
        float _174 = _168 * _168;
        _124 = _170;
        _134 = _172;
        _128 = _174;
    }
    float _176 = _124;
    float _178 = _134;
    float _180 = _128;
    float _182 = fma(_176, _176, _178);
    float _184 = _182 + _180;
    float _186 = rsqrt(_184);
    float _188 = _186 * _176;
    float _190 = -_188;
    float _192 = precise::max(0.0, _190);
    float _194 = abs(_192);
    float _196 = -_194;
    float _198 = _196 + 1.0;
    float _200 = fma(_192, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _202 = as_type<int>(_198) + (-218103808);
    float _204 = fma(_192, _200, -0.212114393711090087890625);
    bool _206 = uint(_202) >= 1920991232u;
    float _208 = fma(_192, _204, 1.570728778839111328125);
    bool _210 = !_206;
    float _230;
    if (!_210)
    {
        int _212 = as_type<int>(_100);
        int _214 = as_type<int>(_204);
        int _216 = 1040;
        int _218 = as_type<int>(_198);
        int _220;
        int _222;
        int _224;
        int _226;
        int _228;
        _48(_212, _214, _216, _218, _220, _222, _224, _226, _228);
        _230 = as_type<float>(_224);
        _232 = true;
    }
    else
    {
        float _234 = rsqrt(_198);
        float _236 = _198 * _234;
        float _238 = _234 * 0.5;
        float _240 = -_236;
        float _242 = 0.0 + _240;
        float _244 = fma(_238, _242, 0.5);
        float _246 = fma(_236, _244, _236);
        float _248 = -_246;
        float _250 = 0.0 + _248;
        float _252 = fma(_246, _250, _198);
        float _254 = fma(_238, _252, _246);
        _230 = _254;
    }
    _232 = false;
    float _256 = _230;
    float _258 = _92 * _92;
    float _260 = _208 * _256;
    bool _262 = _188 > 0.0;
    float _264 = fma(_94, _94, _258);
    float _266 = _260 * 0.636619746685028076171875;
    float _268 = precise::clamp(_266, 0.0, 1.0);
    float _270 = -_268;
    float _272 = _270 + 1.0;
    float _274 = rsqrt(_264);
    float _276 = sqrt(_272);
    float _278 = _94 * _274;
    float _280 = _92 * _274;
    float _282 = abs(_278);
    float _284 = abs(_280);
    float _286 = precise::max(_282, _284);
    float _288 = -_276;
    float _290 = _288 + 1.0;
    int _292 = as_type<int>(_276);
    int _294 = as_type<int>(_290);
    if (_262)
    {
        _292 = 1065353216;
    }
    int _296 = _292;
    float _298 = precise::max(_286, 9.9999997473787516355514526367188e-05);
    float _300 = _290 * 0.5;
    int _302 = as_type<int>(_300);
    if (_262)
    {
        _294 = 1065353216;
    }
    int _304 = _294;
    float _306 = 1.0 / _298;
    float _308 = -_306;
    float _310 = _278 * _308;
    float _312 = _280 * _306;
    int _314 = as_type<int>(_306);
    if (_262)
    {
        _314 = 1065353216;
    }
    int _316 = _314;
    float _318 = fma(_310, _300, 0.5);
    float _320 = fma(_312, _300, 0.5);
    if (_262)
    {
        _302 = 1065353216;
    }
    int _322 = _302;
    if (_262)
    {
        out.m_40.x = as_type<float>(_304);
        out.m_40.y = as_type<float>(_296);
        out.m_40.z = as_type<float>(_316);
        out.m_40.w = as_type<float>(_322);
        return main0_out_u{as_type<uint4>(out.m_40)};
    }
    float2 _783;
    _783.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_318, _320));
    _783.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_318, _320));
    float _324 = _783.x;
    float _326 = _324 * 256.0;
    int _328 = int(_326);
    float _330 = in.m_42.x;
    float _332 = gl_FragCoord.w;
    float _334 = _330 * _332;
    float _336 = in.m_42.y;
    float _338 = gl_FragCoord.w;
    float _340 = _336 * _338;
    float _342 = _76 * _334;
    float _344 = _76 * _340;
    float _346 = float(uint(_328));
    float _348 = _346 * 0.00390625;
    float2 _819 = float2(_318, _320);
    float _350 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_819, float2(0.0), isnan(_819)), level(_348)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_819, float2(0.0), isnan(_819)), level(_348)).y;
    float2 _830 = float2(_318, _320);
    float _352 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_830, float2(0.0), isnan(_830)), level(_348)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_830, float2(0.0), isnan(_830)), level(_348)).y;
    float2 _839 = float2(_318, _320);
    float _354 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_839, float2(0.0), isnan(_839)), level(_348)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_839, float2(0.0), isnan(_839)), level(_348)).y;
    float2 _848 = float2(_342, _344);
    float2 _358 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_848, float2(0.0), isnan(_848))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_848, float2(0.0), isnan(_848))).xz;
    float _360 = _358.x;
    float _362 = _358.y;
    float _364 = -_350;
    float _366 = _364 + _352;
    float _368 = _366 * (*spvDescriptorSet0.fp_c3)._m0[29].x;
    float _370 = _368 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _372 = fma(_350, (*spvDescriptorSet0.fp_c3)._m0[29].x, _370);
    float _374 = -_372;
    float _376 = fma(_354, (*spvDescriptorSet0.fp_c3)._m0[29].y, _374);
    float _378 = -_362;
    float _380 = _378 + 1.0;
    float _382 = fma(_360, _376, _372);
    float _384 = _382 * _380;
    float _386 = _384 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    out.m_40.x = _386;
    out.m_40.y = _386;
    out.m_40.z = _386;
    out.m_40.w = _386;
    return main0_out_u{as_type<uint4>(out.m_40)};
}

