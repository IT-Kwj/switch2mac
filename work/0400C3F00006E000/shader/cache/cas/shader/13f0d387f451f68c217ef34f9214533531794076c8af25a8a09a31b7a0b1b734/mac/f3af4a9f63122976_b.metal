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
    texture2d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    texture2d<float> fp_t_tcb_E [[id(7)]];
    sampler fp_t_tcb_ESmplr [[id(8)]];
    sampler fp_t_tcb_ASmplr_w [[id(9)]];
    sampler fp_t_tcb_CSmplr_w [[id(10)]];
    sampler fp_t_tcb_ESmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_38 [[color(0)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0)]];
    float4 m_35 [[user(locn1)]];
};

static inline __attribute__((always_inline))
void _46(thread const int& _877, thread const int& _878, thread const int& _879, thread const int& _880, thread int& _881, thread int& _882, thread int& _883, thread int& _884, thread int& _885, thread int& _886)
{
    float _889 = as_type<float>(_878) + 0.0;
    bool _891 = _889 != 0.0;
    bool _893 = isnan(_889);
    bool _895 = _891 || _893;
    bool _897 = isnan(0.0);
    bool _899 = _895 || _897;
    int _901 = _877;
    int _903 = _878;
    int _905 = _879;
    int _907 = _899 ? (-1) : 0;
    if (!_899)
    {
        float _909 = as_type<float>(_878) * 1.0;
        _901 = as_type<int>(_909);
    }
    int _911 = _901;
    bool _913 = !_899;
    int _915 = _911;
    int _917 = _911;
    if (!_913)
    {
        float _919 = as_type<float>(_878) + 0.0;
        bool _921 = _919 >= 0.0;
        bool _923 = isnan(_919);
        bool _925 = _921 || _923;
        bool _927 = isnan(0.0);
        bool _929 = _925 || _927;
        _907 = _929 ? (-1) : 0;
        if (!_929)
        {
            _915 = 2147483647;
        }
        int _931 = _915;
        bool _933 = !_929;
        int _935 = _931;
        _917 = _931;
        if (!_933)
        {
            float _937 = abs(as_type<float>(_878));
            float _939 = _937 + 0.0;
            bool _941 = _939 > as_type<float>(0x7f800000u /* inf */);
            bool _943 = isnan(_939);
            bool _945 = _941 || _943;
            bool _947 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _949 = _945 || _947;
            _907 = _949 ? (-1) : 0;
            if (_949)
            {
                float _951 = as_type<float>(_878) + 1.0;
                _935 = as_type<int>(_951);
            }
            int _953 = _935;
            int _955 = _953;
            _917 = _953;
            if (!_949)
            {
                float _957 = abs(as_type<float>(_878));
                float _959 = _957 + (-0.0);
                float _961 = 0.0 + _959;
                bool _963 = _961 != as_type<float>(0x7f800000u /* inf */);
                bool _965 = isnan(_961);
                bool _967 = _963 || _965;
                bool _969 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _971 = _967 || _969;
                _907 = _971 ? (-1) : 0;
                if (!_971)
                {
                    _955 = _878;
                }
                int _973 = _955;
                bool _975 = !_971;
                _917 = _973;
                if (!_975)
                {
                    float _977 = as_type<float>(_878) * 18446744073709551616.0;
                    float _979 = rsqrt(_977);
                    float _981 = _977 * _979;
                    float _983 = _979 * 0.5;
                    float _985 = -_981;
                    float _987 = 0.0 + _985;
                    float _989 = fma(_983, _987, 0.5);
                    float _991 = fma(_981, _989, _981);
                    float _993 = -_991;
                    float _995 = 0.0 + _993;
                    float _997 = fma(_991, _995, _977);
                    float _999 = fma(_983, _997, _991);
                    float _1001 = _999 * 2.3283064365386962890625e-10;
                    _917 = as_type<int>(_1001);
                    _903 = as_type<int>(_987);
                    _905 = as_type<int>(_991);
                }
            }
        }
    }
    int _1003 = _917;
    int _1005 = _903;
    int _1007 = _905;
    int _1009 = _907;
    _881 = _880;
    _882 = 0;
    _883 = _1003;
    _884 = _1005;
    _885 = _1007;
    _886 = _1009;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _236 = false;
    float _50 = gl_FragCoord.w;
    float _52 = in.m_35.y;
    float _54 = gl_FragCoord.w;
    float _56 = _52 * _54;
    float _58 = in.m_35.x;
    float _60 = gl_FragCoord.w;
    float _62 = _58 * _60;
    float _64 = in.m_35.z;
    float _66 = gl_FragCoord.w;
    float _68 = _64 * _66;
    float _70 = 1.0 / _50;
    float _72 = _70 * _56;
    float _74 = _70 * _62;
    float _76 = _70 * _68;
    float _78 = _72 * _72;
    float _80 = fma(_74, _74, _78);
    float _82 = (*spvDescriptorSet0.fp_c3)._m0[13].w + (-220.0);
    float _84 = fma(_76, _76, _80);
    float _86 = precise::max(0.0, _82);
    float _88 = rsqrt(_84);
    float _90 = _74 * _88;
    float _92 = _76 * _88;
    float _94 = _72 * _88;
    float _96 = _90 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _98 = _92 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _100 = -_94;
    float _102 = -_86;
    float _104 = fma(_100, (*spvDescriptorSet0.fp_c3)._m0[13].z, _102);
    float _106 = _96 * _96;
    float _108 = _98 * _98;
    float _110 = _106 + _108;
    float _112 = sqrt(_110);
    bool _116 = _112 > (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _118 = _94;
    float _120 = _86;
    float _122 = _104;
    int _124 = as_type<int>(_108);
    if (!_116)
    {
        _118 = _108;
    }
    float _126 = _118;
    float _128 = _126;
    if (!_116)
    {
        _120 = _106;
    }
    float _130 = _120;
    bool _132 = !_116;
    float _134 = _130;
    if (!_132)
    {
        float _136 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _138 = -(*spvDescriptorSet0.fp_c3)._m0[13].x;
        float _140 = _112 + _138;
        float _142 = _104 + (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _144 = rsqrt(_110);
        float _146 = _140 * _136;
        float _148 = _146 * 0.15915493667125701904296875;
        float _150 = _148 * 6.283185482025146484375;
        float _152 = sin(_150);
        float _154 = _148 * 6.283185482025146484375;
        float _156 = cos(_154);
        float _158 = fma(_152, _142, (*spvDescriptorSet0.fp_c3)._m0[13].x);
        float _160 = _144 * _158;
        float _162 = _156 + (-1.0);
        float _164 = _96 * _160;
        float _166 = _162 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _168 = _98 * _160;
        float _170 = fma(_104, _156, _166);
        float _172 = _164 * _164;
        float _174 = _168 * _168;
        _122 = _170;
        _134 = _172;
        _128 = _174;
        _124 = as_type<int>(_160);
    }
    float _176 = _122;
    float _178 = _134;
    float _180 = _128;
    int _182 = _124;
    float _184 = fma(_176, _176, _178);
    float _186 = _184 + _180;
    float _188 = rsqrt(_186);
    float _190 = _188 * _176;
    float _192 = -_190;
    float _194 = precise::max(0.0, _192);
    float _196 = abs(_194);
    float _198 = -_196;
    float _200 = _198 + 1.0;
    float _202 = fma(_194, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _204 = as_type<int>(_200) + (-218103808);
    float _206 = fma(_194, _202, -0.212114393711090087890625);
    bool _208 = uint(_204) >= 1920991232u;
    float _210 = fma(_194, _206, 1.570728778839111328125);
    bool _212 = !_208;
    float _234;
    if (!_212)
    {
        int _214 = as_type<int>(_206);
        int _216 = as_type<int>(_200);
        int _218 = _182;
        int _220 = 1040;
        int _222;
        int _224;
        int _226;
        int _228;
        int _230;
        int _232;
        _46(_214, _216, _218, _220, _222, _224, _226, _228, _230, _232);
        _234 = as_type<float>(_226);
        _236 = true;
    }
    else
    {
        float _238 = rsqrt(_200);
        float _240 = _200 * _238;
        float _242 = _238 * 0.5;
        float _244 = -_240;
        float _246 = 0.0 + _244;
        float _248 = fma(_242, _246, 0.5);
        float _250 = fma(_240, _248, _240);
        float _252 = -_250;
        float _254 = 0.0 + _252;
        float _256 = fma(_250, _254, _200);
        float _258 = fma(_242, _256, _250);
        _234 = _258;
    }
    _236 = false;
    float _260 = _234;
    float _262 = _90 * _90;
    float _264 = _210 * _260;
    bool _266 = _190 > 0.0;
    float _268 = fma(_92, _92, _262);
    float _270 = _264 * 0.636619746685028076171875;
    float _272 = precise::clamp(_270, 0.0, 1.0);
    float _274 = -_272;
    float _276 = _274 + 1.0;
    float _278 = rsqrt(_268);
    float _280 = sqrt(_276);
    float _282 = _92 * _278;
    float _284 = _90 * _278;
    float _286 = abs(_282);
    float _288 = abs(_284);
    float _290 = precise::max(_286, _288);
    float _292 = -_280;
    float _294 = _292 + 1.0;
    int _296 = as_type<int>(_280);
    int _298 = as_type<int>(_294);
    if (_266)
    {
        _296 = 1065353216;
    }
    int _300 = _296;
    float _302 = precise::max(_290, 9.9999997473787516355514526367188e-05);
    float _304 = _294 * 0.5;
    int _306 = as_type<int>(_304);
    if (_266)
    {
        _298 = 1065353216;
    }
    int _308 = _298;
    float _310 = 1.0 / _302;
    float _312 = -_310;
    float _314 = _282 * _312;
    float _316 = _284 * _310;
    int _318 = as_type<int>(_310);
    if (_266)
    {
        _318 = 1065353216;
    }
    int _320 = _318;
    float _322 = fma(_314, _304, 0.5);
    float _324 = fma(_316, _304, 0.5);
    if (_266)
    {
        _306 = 1065353216;
    }
    int _326 = _306;
    if (_266)
    {
        out.m_38.x = as_type<float>(_308);
        out.m_38.y = as_type<float>(_300);
        out.m_38.z = as_type<float>(_320);
        out.m_38.w = as_type<float>(_326);
        return out;
    }
    float2 _778;
    _778.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_322, _324));
    _778.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_322, _324));
    float _328 = _778.x;
    float _330 = _328 * 256.0;
    int _332 = int(_330);
    float _334 = in.m_40.x;
    float _336 = gl_FragCoord.w;
    float _338 = _334 * _336;
    float _340 = in.m_40.y;
    float _342 = gl_FragCoord.w;
    float _344 = _340 * _342;
    float _346 = _70 * _338;
    float _348 = _70 * _344;
    float _350 = float(uint(_332));
    float _352 = _350 * 0.00390625;
    float2 _814 = float2(_322, _324);
    float _354 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_814, float2(0.0), isnan(_814)), level(_352)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_814, float2(0.0), isnan(_814)), level(_352)).y;
    float2 _825 = float2(_322, _324);
    float _356 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_825, float2(0.0), isnan(_825)), level(_352)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_825, float2(0.0), isnan(_825)), level(_352)).y;
    float2 _834 = float2(_346, _348);
    float _358 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_834, float2(0.0), isnan(_834))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_834, float2(0.0), isnan(_834))).z;
    float _360 = -_354;
    float _362 = _360 + _356;
    float _364 = _362 * (*spvDescriptorSet0.fp_c3)._m0[29].x;
    float _366 = _364 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _368 = -_358;
    float _370 = _368 + 1.0;
    float _372 = fma(_354, (*spvDescriptorSet0.fp_c3)._m0[29].x, _366);
    float _374 = _372 * _370;
    float _376 = _374 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    out.m_38.x = _376;
    out.m_38.y = _376;
    out.m_38.z = _376;
    out.m_38.w = _376;
    return out;
}


struct main0_out_u
{
    uint4 m_38 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _236 = false;
    float _50 = gl_FragCoord.w;
    float _52 = in.m_35.y;
    float _54 = gl_FragCoord.w;
    float _56 = _52 * _54;
    float _58 = in.m_35.x;
    float _60 = gl_FragCoord.w;
    float _62 = _58 * _60;
    float _64 = in.m_35.z;
    float _66 = gl_FragCoord.w;
    float _68 = _64 * _66;
    float _70 = 1.0 / _50;
    float _72 = _70 * _56;
    float _74 = _70 * _62;
    float _76 = _70 * _68;
    float _78 = _72 * _72;
    float _80 = fma(_74, _74, _78);
    float _82 = (*spvDescriptorSet0.fp_c3)._m0[13].w + (-220.0);
    float _84 = fma(_76, _76, _80);
    float _86 = precise::max(0.0, _82);
    float _88 = rsqrt(_84);
    float _90 = _74 * _88;
    float _92 = _76 * _88;
    float _94 = _72 * _88;
    float _96 = _90 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _98 = _92 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _100 = -_94;
    float _102 = -_86;
    float _104 = fma(_100, (*spvDescriptorSet0.fp_c3)._m0[13].z, _102);
    float _106 = _96 * _96;
    float _108 = _98 * _98;
    float _110 = _106 + _108;
    float _112 = sqrt(_110);
    bool _116 = _112 > (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _118 = _94;
    float _120 = _86;
    float _122 = _104;
    int _124 = as_type<int>(_108);
    if (!_116)
    {
        _118 = _108;
    }
    float _126 = _118;
    float _128 = _126;
    if (!_116)
    {
        _120 = _106;
    }
    float _130 = _120;
    bool _132 = !_116;
    float _134 = _130;
    if (!_132)
    {
        float _136 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _138 = -(*spvDescriptorSet0.fp_c3)._m0[13].x;
        float _140 = _112 + _138;
        float _142 = _104 + (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _144 = rsqrt(_110);
        float _146 = _140 * _136;
        float _148 = _146 * 0.15915493667125701904296875;
        float _150 = _148 * 6.283185482025146484375;
        float _152 = sin(_150);
        float _154 = _148 * 6.283185482025146484375;
        float _156 = cos(_154);
        float _158 = fma(_152, _142, (*spvDescriptorSet0.fp_c3)._m0[13].x);
        float _160 = _144 * _158;
        float _162 = _156 + (-1.0);
        float _164 = _96 * _160;
        float _166 = _162 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _168 = _98 * _160;
        float _170 = fma(_104, _156, _166);
        float _172 = _164 * _164;
        float _174 = _168 * _168;
        _122 = _170;
        _134 = _172;
        _128 = _174;
        _124 = as_type<int>(_160);
    }
    float _176 = _122;
    float _178 = _134;
    float _180 = _128;
    int _182 = _124;
    float _184 = fma(_176, _176, _178);
    float _186 = _184 + _180;
    float _188 = rsqrt(_186);
    float _190 = _188 * _176;
    float _192 = -_190;
    float _194 = precise::max(0.0, _192);
    float _196 = abs(_194);
    float _198 = -_196;
    float _200 = _198 + 1.0;
    float _202 = fma(_194, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _204 = as_type<int>(_200) + (-218103808);
    float _206 = fma(_194, _202, -0.212114393711090087890625);
    bool _208 = uint(_204) >= 1920991232u;
    float _210 = fma(_194, _206, 1.570728778839111328125);
    bool _212 = !_208;
    float _234;
    if (!_212)
    {
        int _214 = as_type<int>(_206);
        int _216 = as_type<int>(_200);
        int _218 = _182;
        int _220 = 1040;
        int _222;
        int _224;
        int _226;
        int _228;
        int _230;
        int _232;
        _46(_214, _216, _218, _220, _222, _224, _226, _228, _230, _232);
        _234 = as_type<float>(_226);
        _236 = true;
    }
    else
    {
        float _238 = rsqrt(_200);
        float _240 = _200 * _238;
        float _242 = _238 * 0.5;
        float _244 = -_240;
        float _246 = 0.0 + _244;
        float _248 = fma(_242, _246, 0.5);
        float _250 = fma(_240, _248, _240);
        float _252 = -_250;
        float _254 = 0.0 + _252;
        float _256 = fma(_250, _254, _200);
        float _258 = fma(_242, _256, _250);
        _234 = _258;
    }
    _236 = false;
    float _260 = _234;
    float _262 = _90 * _90;
    float _264 = _210 * _260;
    bool _266 = _190 > 0.0;
    float _268 = fma(_92, _92, _262);
    float _270 = _264 * 0.636619746685028076171875;
    float _272 = precise::clamp(_270, 0.0, 1.0);
    float _274 = -_272;
    float _276 = _274 + 1.0;
    float _278 = rsqrt(_268);
    float _280 = sqrt(_276);
    float _282 = _92 * _278;
    float _284 = _90 * _278;
    float _286 = abs(_282);
    float _288 = abs(_284);
    float _290 = precise::max(_286, _288);
    float _292 = -_280;
    float _294 = _292 + 1.0;
    int _296 = as_type<int>(_280);
    int _298 = as_type<int>(_294);
    if (_266)
    {
        _296 = 1065353216;
    }
    int _300 = _296;
    float _302 = precise::max(_290, 9.9999997473787516355514526367188e-05);
    float _304 = _294 * 0.5;
    int _306 = as_type<int>(_304);
    if (_266)
    {
        _298 = 1065353216;
    }
    int _308 = _298;
    float _310 = 1.0 / _302;
    float _312 = -_310;
    float _314 = _282 * _312;
    float _316 = _284 * _310;
    int _318 = as_type<int>(_310);
    if (_266)
    {
        _318 = 1065353216;
    }
    int _320 = _318;
    float _322 = fma(_314, _304, 0.5);
    float _324 = fma(_316, _304, 0.5);
    if (_266)
    {
        _306 = 1065353216;
    }
    int _326 = _306;
    if (_266)
    {
        out.m_38.x = as_type<float>(_308);
        out.m_38.y = as_type<float>(_300);
        out.m_38.z = as_type<float>(_320);
        out.m_38.w = as_type<float>(_326);
        return main0_out_u{as_type<uint4>(out.m_38)};
    }
    float2 _778;
    _778.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_322, _324));
    _778.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_322, _324));
    float _328 = _778.x;
    float _330 = _328 * 256.0;
    int _332 = int(_330);
    float _334 = in.m_40.x;
    float _336 = gl_FragCoord.w;
    float _338 = _334 * _336;
    float _340 = in.m_40.y;
    float _342 = gl_FragCoord.w;
    float _344 = _340 * _342;
    float _346 = _70 * _338;
    float _348 = _70 * _344;
    float _350 = float(uint(_332));
    float _352 = _350 * 0.00390625;
    float2 _814 = float2(_322, _324);
    float _354 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_814, float2(0.0), isnan(_814)), level(_352)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_814, float2(0.0), isnan(_814)), level(_352)).y;
    float2 _825 = float2(_322, _324);
    float _356 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_825, float2(0.0), isnan(_825)), level(_352)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_825, float2(0.0), isnan(_825)), level(_352)).y;
    float2 _834 = float2(_346, _348);
    float _358 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_834, float2(0.0), isnan(_834))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_834, float2(0.0), isnan(_834))).z;
    float _360 = -_354;
    float _362 = _360 + _356;
    float _364 = _362 * (*spvDescriptorSet0.fp_c3)._m0[29].x;
    float _366 = _364 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _368 = -_358;
    float _370 = _368 + 1.0;
    float _372 = fma(_354, (*spvDescriptorSet0.fp_c3)._m0[29].x, _366);
    float _374 = _372 * _370;
    float _376 = _374 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    out.m_38.x = _376;
    out.m_38.y = _376;
    out.m_38.z = _376;
    out.m_38.w = _376;
    return main0_out_u{as_type<uint4>(out.m_38)};
}

