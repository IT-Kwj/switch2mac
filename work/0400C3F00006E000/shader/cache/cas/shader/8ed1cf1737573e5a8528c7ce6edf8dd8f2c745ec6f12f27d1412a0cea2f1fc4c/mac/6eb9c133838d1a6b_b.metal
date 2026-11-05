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
    texture2d<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    sampler fp_t_tcb_CSmplr_w [[id(7)]];
    sampler fp_t_tcb_ASmplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_38 [[user(locn0)]];
    float4 m_33 [[user(locn1)]];
};

static inline __attribute__((always_inline))
void _44(thread const int& _842, thread const int& _843, thread const int& _844, thread const int& _845, thread int& _846, thread int& _847, thread int& _848, thread int& _849, thread int& _850, thread int& _851)
{
    float _854 = as_type<float>(_843) + 0.0;
    bool _856 = _854 != 0.0;
    bool _858 = isnan(_854);
    bool _860 = _856 || _858;
    bool _862 = isnan(0.0);
    bool _864 = _860 || _862;
    int _866 = _842;
    int _868 = _843;
    int _870 = _844;
    int _872 = _864 ? (-1) : 0;
    if (!_864)
    {
        float _874 = as_type<float>(_843) * 1.0;
        _866 = as_type<int>(_874);
    }
    int _876 = _866;
    bool _878 = !_864;
    int _880 = _876;
    int _882 = _876;
    if (!_878)
    {
        float _884 = as_type<float>(_843) + 0.0;
        bool _886 = _884 >= 0.0;
        bool _888 = isnan(_884);
        bool _890 = _886 || _888;
        bool _892 = isnan(0.0);
        bool _894 = _890 || _892;
        _872 = _894 ? (-1) : 0;
        if (!_894)
        {
            _880 = 2147483647;
        }
        int _896 = _880;
        bool _898 = !_894;
        int _900 = _896;
        _882 = _896;
        if (!_898)
        {
            float _902 = abs(as_type<float>(_843));
            float _904 = _902 + 0.0;
            bool _906 = _904 > as_type<float>(0x7f800000u /* inf */);
            bool _908 = isnan(_904);
            bool _910 = _906 || _908;
            bool _912 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _914 = _910 || _912;
            _872 = _914 ? (-1) : 0;
            if (_914)
            {
                float _916 = as_type<float>(_843) + 1.0;
                _900 = as_type<int>(_916);
            }
            int _918 = _900;
            int _920 = _918;
            _882 = _918;
            if (!_914)
            {
                float _922 = abs(as_type<float>(_843));
                float _924 = _922 + (-0.0);
                float _926 = 0.0 + _924;
                bool _928 = _926 != as_type<float>(0x7f800000u /* inf */);
                bool _930 = isnan(_926);
                bool _932 = _928 || _930;
                bool _934 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _936 = _932 || _934;
                _872 = _936 ? (-1) : 0;
                if (!_936)
                {
                    _920 = _843;
                }
                int _938 = _920;
                bool _940 = !_936;
                _882 = _938;
                if (!_940)
                {
                    float _942 = as_type<float>(_843) * 18446744073709551616.0;
                    float _944 = rsqrt(_942);
                    float _946 = _942 * _944;
                    float _948 = _944 * 0.5;
                    float _950 = -_946;
                    float _952 = 0.0 + _950;
                    float _954 = fma(_948, _952, 0.5);
                    float _956 = fma(_946, _954, _946);
                    float _958 = -_956;
                    float _960 = 0.0 + _958;
                    float _962 = fma(_956, _960, _942);
                    float _964 = fma(_948, _962, _956);
                    float _966 = _964 * 2.3283064365386962890625e-10;
                    _882 = as_type<int>(_966);
                    _868 = as_type<int>(_952);
                    _870 = as_type<int>(_956);
                }
            }
        }
    }
    int _968 = _882;
    int _970 = _868;
    int _972 = _870;
    int _974 = _872;
    _846 = _845;
    _847 = 0;
    _848 = _968;
    _849 = _970;
    _850 = _972;
    _851 = _974;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _234 = false;
    float _48 = gl_FragCoord.w;
    float _50 = in.m_33.y;
    float _52 = gl_FragCoord.w;
    float _54 = _50 * _52;
    float _56 = in.m_33.x;
    float _58 = gl_FragCoord.w;
    float _60 = _56 * _58;
    float _62 = in.m_33.z;
    float _64 = gl_FragCoord.w;
    float _66 = _62 * _64;
    float _68 = 1.0 / _48;
    float _70 = _68 * _54;
    float _72 = _68 * _60;
    float _74 = _68 * _66;
    float _76 = _70 * _70;
    float _78 = fma(_72, _72, _76);
    float _80 = (*spvDescriptorSet0.fp_c3)._m0[13].w + (-220.0);
    float _82 = fma(_74, _74, _78);
    float _84 = precise::max(0.0, _80);
    float _86 = rsqrt(_82);
    float _88 = _72 * _86;
    float _90 = _74 * _86;
    float _92 = _70 * _86;
    float _94 = _88 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _96 = _90 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _98 = -_92;
    float _100 = -_84;
    float _102 = fma(_98, (*spvDescriptorSet0.fp_c3)._m0[13].z, _100);
    float _104 = _94 * _94;
    float _106 = _96 * _96;
    float _108 = _104 + _106;
    float _110 = sqrt(_108);
    bool _114 = _110 > (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _116 = _92;
    float _118 = _84;
    float _120 = _102;
    int _122 = as_type<int>(_106);
    if (!_114)
    {
        _116 = _106;
    }
    float _124 = _116;
    float _126 = _124;
    if (!_114)
    {
        _118 = _104;
    }
    float _128 = _118;
    bool _130 = !_114;
    float _132 = _128;
    if (!_130)
    {
        float _134 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _136 = -(*spvDescriptorSet0.fp_c3)._m0[13].x;
        float _138 = _110 + _136;
        float _140 = _102 + (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _142 = rsqrt(_108);
        float _144 = _138 * _134;
        float _146 = _144 * 0.15915493667125701904296875;
        float _148 = _146 * 6.283185482025146484375;
        float _150 = sin(_148);
        float _152 = _146 * 6.283185482025146484375;
        float _154 = cos(_152);
        float _156 = fma(_150, _140, (*spvDescriptorSet0.fp_c3)._m0[13].x);
        float _158 = _142 * _156;
        float _160 = _154 + (-1.0);
        float _162 = _94 * _158;
        float _164 = _160 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _166 = _96 * _158;
        float _168 = fma(_102, _154, _164);
        float _170 = _162 * _162;
        float _172 = _166 * _166;
        _120 = _168;
        _132 = _170;
        _126 = _172;
        _122 = as_type<int>(_158);
    }
    float _174 = _120;
    float _176 = _132;
    float _178 = _126;
    int _180 = _122;
    float _182 = fma(_174, _174, _176);
    float _184 = _182 + _178;
    float _186 = rsqrt(_184);
    float _188 = _186 * _174;
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
    float _232;
    if (!_210)
    {
        int _212 = as_type<int>(_204);
        int _214 = as_type<int>(_198);
        int _216 = _180;
        int _218 = 1040;
        int _220;
        int _222;
        int _224;
        int _226;
        int _228;
        int _230;
        _44(_212, _214, _216, _218, _220, _222, _224, _226, _228, _230);
        _232 = as_type<float>(_224);
        _234 = true;
    }
    else
    {
        float _236 = rsqrt(_198);
        float _238 = _198 * _236;
        float _240 = _236 * 0.5;
        float _242 = -_238;
        float _244 = 0.0 + _242;
        float _246 = fma(_240, _244, 0.5);
        float _248 = fma(_238, _246, _238);
        float _250 = -_248;
        float _252 = 0.0 + _250;
        float _254 = fma(_248, _252, _198);
        float _256 = fma(_240, _254, _248);
        _232 = _256;
    }
    _234 = false;
    float _258 = _232;
    float _260 = _88 * _88;
    float _262 = _208 * _258;
    bool _264 = _188 > 0.0;
    float _266 = fma(_90, _90, _260);
    float _268 = _262 * 0.636619746685028076171875;
    float _270 = precise::clamp(_268, 0.0, 1.0);
    float _272 = -_270;
    float _274 = _272 + 1.0;
    float _276 = rsqrt(_266);
    float _278 = sqrt(_274);
    float _280 = _90 * _276;
    float _282 = _88 * _276;
    float _284 = abs(_280);
    float _286 = abs(_282);
    float _288 = precise::max(_284, _286);
    float _290 = -_278;
    float _292 = _290 + 1.0;
    int _294 = as_type<int>(_278);
    int _296 = as_type<int>(_292);
    if (_264)
    {
        _294 = 1065353216;
    }
    int _298 = _294;
    float _300 = precise::max(_288, 9.9999997473787516355514526367188e-05);
    float _302 = _292 * 0.5;
    int _304 = as_type<int>(_302);
    if (_264)
    {
        _296 = 1065353216;
    }
    int _306 = _296;
    float _308 = 1.0 / _300;
    float _310 = -_308;
    float _312 = _280 * _310;
    float _314 = _282 * _308;
    int _316 = as_type<int>(_308);
    if (_264)
    {
        _316 = 1065353216;
    }
    int _318 = _316;
    float _320 = fma(_312, _302, 0.5);
    float _322 = fma(_314, _302, 0.5);
    if (_264)
    {
        _304 = 1065353216;
    }
    int _324 = _304;
    if (_264)
    {
        out.m_36.x = as_type<float>(_306);
        out.m_36.y = as_type<float>(_298);
        out.m_36.z = as_type<float>(_318);
        out.m_36.w = as_type<float>(_324);
        return out;
    }
    float2 _766;
    _766.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_320, _322));
    _766.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_320, _322));
    float _326 = _766.x;
    float _328 = _326 * 256.0;
    int _330 = int(_328);
    float _332 = in.m_38.x;
    float _334 = gl_FragCoord.w;
    float _336 = _332 * _334;
    float _338 = in.m_38.y;
    float _340 = gl_FragCoord.w;
    float _342 = _338 * _340;
    float _344 = _68 * _336;
    float _346 = _68 * _342;
    float2 _796 = float2(_344, _346);
    float _348 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_796, float2(0.0), isnan(_796))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_796, float2(0.0), isnan(_796))).z;
    float _350 = float(uint(_330));
    float _352 = _350 * 0.00390625;
    float2 _812 = float2(_320, _322);
    float _354 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_812, float2(0.0), isnan(_812)), level(_352)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_812, float2(0.0), isnan(_812)), level(_352)).y;
    float _356 = -_348;
    float _358 = _356 + 1.0;
    float _360 = _354 * (*spvDescriptorSet0.fp_c3)._m0[29].x;
    float _362 = _360 * _358;
    float _364 = _362 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    out.m_36.x = _364;
    out.m_36.y = _364;
    out.m_36.z = _364;
    out.m_36.w = _364;
    return out;
}


struct main0_out_u
{
    uint4 m_36 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _234 = false;
    float _48 = gl_FragCoord.w;
    float _50 = in.m_33.y;
    float _52 = gl_FragCoord.w;
    float _54 = _50 * _52;
    float _56 = in.m_33.x;
    float _58 = gl_FragCoord.w;
    float _60 = _56 * _58;
    float _62 = in.m_33.z;
    float _64 = gl_FragCoord.w;
    float _66 = _62 * _64;
    float _68 = 1.0 / _48;
    float _70 = _68 * _54;
    float _72 = _68 * _60;
    float _74 = _68 * _66;
    float _76 = _70 * _70;
    float _78 = fma(_72, _72, _76);
    float _80 = (*spvDescriptorSet0.fp_c3)._m0[13].w + (-220.0);
    float _82 = fma(_74, _74, _78);
    float _84 = precise::max(0.0, _80);
    float _86 = rsqrt(_82);
    float _88 = _72 * _86;
    float _90 = _74 * _86;
    float _92 = _70 * _86;
    float _94 = _88 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _96 = _90 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _98 = -_92;
    float _100 = -_84;
    float _102 = fma(_98, (*spvDescriptorSet0.fp_c3)._m0[13].z, _100);
    float _104 = _94 * _94;
    float _106 = _96 * _96;
    float _108 = _104 + _106;
    float _110 = sqrt(_108);
    bool _114 = _110 > (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _116 = _92;
    float _118 = _84;
    float _120 = _102;
    int _122 = as_type<int>(_106);
    if (!_114)
    {
        _116 = _106;
    }
    float _124 = _116;
    float _126 = _124;
    if (!_114)
    {
        _118 = _104;
    }
    float _128 = _118;
    bool _130 = !_114;
    float _132 = _128;
    if (!_130)
    {
        float _134 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _136 = -(*spvDescriptorSet0.fp_c3)._m0[13].x;
        float _138 = _110 + _136;
        float _140 = _102 + (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _142 = rsqrt(_108);
        float _144 = _138 * _134;
        float _146 = _144 * 0.15915493667125701904296875;
        float _148 = _146 * 6.283185482025146484375;
        float _150 = sin(_148);
        float _152 = _146 * 6.283185482025146484375;
        float _154 = cos(_152);
        float _156 = fma(_150, _140, (*spvDescriptorSet0.fp_c3)._m0[13].x);
        float _158 = _142 * _156;
        float _160 = _154 + (-1.0);
        float _162 = _94 * _158;
        float _164 = _160 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _166 = _96 * _158;
        float _168 = fma(_102, _154, _164);
        float _170 = _162 * _162;
        float _172 = _166 * _166;
        _120 = _168;
        _132 = _170;
        _126 = _172;
        _122 = as_type<int>(_158);
    }
    float _174 = _120;
    float _176 = _132;
    float _178 = _126;
    int _180 = _122;
    float _182 = fma(_174, _174, _176);
    float _184 = _182 + _178;
    float _186 = rsqrt(_184);
    float _188 = _186 * _174;
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
    float _232;
    if (!_210)
    {
        int _212 = as_type<int>(_204);
        int _214 = as_type<int>(_198);
        int _216 = _180;
        int _218 = 1040;
        int _220;
        int _222;
        int _224;
        int _226;
        int _228;
        int _230;
        _44(_212, _214, _216, _218, _220, _222, _224, _226, _228, _230);
        _232 = as_type<float>(_224);
        _234 = true;
    }
    else
    {
        float _236 = rsqrt(_198);
        float _238 = _198 * _236;
        float _240 = _236 * 0.5;
        float _242 = -_238;
        float _244 = 0.0 + _242;
        float _246 = fma(_240, _244, 0.5);
        float _248 = fma(_238, _246, _238);
        float _250 = -_248;
        float _252 = 0.0 + _250;
        float _254 = fma(_248, _252, _198);
        float _256 = fma(_240, _254, _248);
        _232 = _256;
    }
    _234 = false;
    float _258 = _232;
    float _260 = _88 * _88;
    float _262 = _208 * _258;
    bool _264 = _188 > 0.0;
    float _266 = fma(_90, _90, _260);
    float _268 = _262 * 0.636619746685028076171875;
    float _270 = precise::clamp(_268, 0.0, 1.0);
    float _272 = -_270;
    float _274 = _272 + 1.0;
    float _276 = rsqrt(_266);
    float _278 = sqrt(_274);
    float _280 = _90 * _276;
    float _282 = _88 * _276;
    float _284 = abs(_280);
    float _286 = abs(_282);
    float _288 = precise::max(_284, _286);
    float _290 = -_278;
    float _292 = _290 + 1.0;
    int _294 = as_type<int>(_278);
    int _296 = as_type<int>(_292);
    if (_264)
    {
        _294 = 1065353216;
    }
    int _298 = _294;
    float _300 = precise::max(_288, 9.9999997473787516355514526367188e-05);
    float _302 = _292 * 0.5;
    int _304 = as_type<int>(_302);
    if (_264)
    {
        _296 = 1065353216;
    }
    int _306 = _296;
    float _308 = 1.0 / _300;
    float _310 = -_308;
    float _312 = _280 * _310;
    float _314 = _282 * _308;
    int _316 = as_type<int>(_308);
    if (_264)
    {
        _316 = 1065353216;
    }
    int _318 = _316;
    float _320 = fma(_312, _302, 0.5);
    float _322 = fma(_314, _302, 0.5);
    if (_264)
    {
        _304 = 1065353216;
    }
    int _324 = _304;
    if (_264)
    {
        out.m_36.x = as_type<float>(_306);
        out.m_36.y = as_type<float>(_298);
        out.m_36.z = as_type<float>(_318);
        out.m_36.w = as_type<float>(_324);
        return main0_out_u{as_type<uint4>(out.m_36)};
    }
    float2 _766;
    _766.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_320, _322));
    _766.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_320, _322));
    float _326 = _766.x;
    float _328 = _326 * 256.0;
    int _330 = int(_328);
    float _332 = in.m_38.x;
    float _334 = gl_FragCoord.w;
    float _336 = _332 * _334;
    float _338 = in.m_38.y;
    float _340 = gl_FragCoord.w;
    float _342 = _338 * _340;
    float _344 = _68 * _336;
    float _346 = _68 * _342;
    float2 _796 = float2(_344, _346);
    float _348 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_796, float2(0.0), isnan(_796))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_796, float2(0.0), isnan(_796))).z;
    float _350 = float(uint(_330));
    float _352 = _350 * 0.00390625;
    float2 _812 = float2(_320, _322);
    float _354 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_812, float2(0.0), isnan(_812)), level(_352)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_812, float2(0.0), isnan(_812)), level(_352)).y;
    float _356 = -_348;
    float _358 = _356 + 1.0;
    float _360 = _354 * (*spvDescriptorSet0.fp_c3)._m0[29].x;
    float _362 = _360 * _358;
    float _364 = _362 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    out.m_36.x = _364;
    out.m_36.y = _364;
    out.m_36.z = _364;
    out.m_36.w = _364;
    return main0_out_u{as_type<uint4>(out.m_36)};
}

