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
    constant _16* fp_c3 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    sampler fp_t_tcb_8Smplr_w [[id(4)]];
    constant dm_border_t* dm_border [[id(5)]];
};

struct main0_out
{
    float4 m_30 [[color(0)]];
};

fragment main0_out main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _37 = gl_FragCoord.x;
    float _39 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _41 = _37 / _39;
    float _43 = gl_FragCoord.y;
    float _45 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _47 = _43 / _45;
    float _49 = _41 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _51 = _47 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _53 = _49 + (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _55 = _51 + (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _57 = _49 + (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _59 = _51 + (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float2 _420 = float2(_53, _55);
    float4 _62 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_420, float2(0.0), isnan(_420))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_420, float2(0.0), isnan(_420))).xyzw;
    float _64 = _62.x;
    float _66 = _62.y;
    float _68 = _62.z;
    float _70 = _62.w;
    float2 _439 = float2(_49, _51);
    float4 _72 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_439, float2(0.0), isnan(_439))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_439, float2(0.0), isnan(_439))).xyzw;
    float _74 = _72.x;
    float _76 = _72.y;
    float _78 = _72.z;
    float _80 = _72.w;
    float2 _455 = float2(_57, _59);
    float4 _82 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_455, float2(0.0), isnan(_455))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_455, float2(0.0), isnan(_455))).xyzw;
    float _84 = _82.x;
    float _86 = _82.y;
    float _88 = _82.z;
    float _90 = _82.w;
    float _92 = _49 + (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _94 = _51 + (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _96 = _49 + (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _98 = _49 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _100 = _49 + (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _102 = _49 + (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _104 = _49 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _106 = _51 + (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _108 = _51 + (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _110 = _51 + (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _112 = _51 + (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _114 = _51 + (*spvDescriptorSet0.fp_c3)._m0[8].y;
    bool _118 = _70 > 0.0;
    float _120 = _51 + (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _122 = _78;
    float _124 = _74;
    float _126 = _76;
    if (_118)
    {
        float _128 = precise::min(_78, _68);
        _122 = _128;
    }
    float _130 = _122;
    float _132 = _49 + (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _134 = _130;
    if (_118)
    {
        float _136 = precise::min(_74, _64);
        _124 = _136;
    }
    float _138 = _124;
    float2 _556 = float2(_92, _94);
    float4 _140 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_556, float2(0.0), isnan(_556))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_556, float2(0.0), isnan(_556))).xyzw;
    float _142 = _140.x;
    float _144 = _140.y;
    float _146 = _140.z;
    float _148 = _140.w;
    float2 _572 = float2(_96, _106);
    float4 _150 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_572, float2(0.0), isnan(_572))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_572, float2(0.0), isnan(_572))).xyzw;
    float _152 = _150.x;
    float _154 = _150.y;
    float _156 = _150.z;
    float _158 = _150.w;
    float2 _588 = float2(_98, _108);
    float4 _160 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_588, float2(0.0), isnan(_588))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_588, float2(0.0), isnan(_588))).xyzw;
    float _162 = _160.x;
    float _164 = _160.y;
    float _166 = _160.z;
    float _168 = _160.w;
    float2 _604 = float2(_100, _110);
    float4 _170 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_604, float2(0.0), isnan(_604))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_604, float2(0.0), isnan(_604))).xyzw;
    float _172 = _170.x;
    float _174 = _170.y;
    float _176 = _170.z;
    float _178 = _170.w;
    float2 _620 = float2(_102, _112);
    float4 _180 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_620, float2(0.0), isnan(_620))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_620, float2(0.0), isnan(_620))).xyzw;
    float _182 = _180.x;
    float _184 = _180.y;
    float _186 = _180.z;
    float _188 = _180.w;
    float2 _636 = float2(_104, _114);
    float4 _190 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_636, float2(0.0), isnan(_636))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_636, float2(0.0), isnan(_636))).xyzw;
    float _192 = _190.x;
    float _194 = _190.y;
    float _196 = _190.z;
    float _198 = _190.w;
    float _200 = _138;
    if (_118)
    {
        float _202 = precise::min(_76, _66);
        _126 = _202;
    }
    float _204 = _126;
    float2 _661 = float2(_132, _120);
    float4 _206 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_661, float2(0.0), isnan(_661))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_661, float2(0.0), isnan(_661))).xyzw;
    float _208 = _206.x;
    float _210 = _206.y;
    float _212 = _206.z;
    float _214 = _206.w;
    bool _216 = _90 > 0.0;
    float _218 = _204;
    if (_216)
    {
        float _220 = precise::min(_84, _138);
        _200 = _220;
    }
    float _222 = _200;
    float _224 = _222;
    if (_216)
    {
        float _226 = precise::min(_86, _204);
        _218 = _226;
    }
    float _228 = _218;
    float _230 = _228;
    if (_216)
    {
        float _232 = precise::min(_88, _130);
        _134 = _232;
    }
    float _234 = _134;
    bool _236 = _148 > 0.0;
    bool _238 = _168 > 0.0;
    float _240 = _234;
    if (_236)
    {
        float _242 = precise::min(_142, _222);
        _224 = _242;
    }
    float _244 = _224;
    float _246 = _244;
    if (_236)
    {
        float _248 = precise::min(_144, _228);
        _230 = _248;
    }
    float _250 = _230;
    float _252 = _250;
    if (_236)
    {
        float _254 = precise::min(_146, _234);
        _240 = _254;
    }
    float _256 = _240;
    bool _258 = _158 > 0.0;
    bool _260 = _188 > 0.0;
    float _262 = _256;
    if (_258)
    {
        float _264 = precise::min(_152, _244);
        _246 = _264;
    }
    float _266 = _246;
    if (_258)
    {
        float _268 = precise::min(_154, _250);
        _252 = _268;
    }
    float _270 = _252;
    if (_258)
    {
        float _272 = precise::min(_156, _256);
        _262 = _272;
    }
    float _274 = _262;
    bool _276 = _178 > 0.0;
    float _278 = _274;
    float _280 = _266;
    float _282 = _270;
    if (_238)
    {
        float _284 = precise::min(_166, _274);
        _278 = _284;
    }
    float _286 = _278;
    float _288 = _286;
    if (_238)
    {
        float _290 = precise::min(_162, _266);
        _280 = _290;
    }
    float _292 = _280;
    float _294 = _292;
    if (_238)
    {
        float _296 = precise::min(_164, _270);
        _282 = _296;
    }
    float _298 = _282;
    bool _300 = _198 > 0.0;
    float _302 = _298;
    if (_276)
    {
        float _304 = precise::min(_172, _292);
        _294 = _304;
    }
    float _306 = _294;
    float _308 = _306;
    if (_276)
    {
        float _310 = precise::min(_174, _298);
        _302 = _310;
    }
    float _312 = _302;
    float _314 = _312;
    if (_276)
    {
        float _316 = precise::min(_176, _286);
        _288 = _316;
    }
    float _318 = _288;
    bool _320 = _214 > 0.0;
    float _322 = _318;
    if (_260)
    {
        float _324 = precise::min(_182, _306);
        _308 = _324;
    }
    float _326 = _308;
    float _328 = _326;
    if (_260)
    {
        float _330 = precise::min(_184, _312);
        _314 = _330;
    }
    float _332 = _314;
    float _334 = _332;
    if (_260)
    {
        float _336 = precise::min(_186, _318);
        _322 = _336;
    }
    float _338 = _322;
    float _340 = _338;
    if (_300)
    {
        float _342 = precise::min(_192, _326);
        _328 = _342;
    }
    float _344 = _328;
    int _347 = as_type<int>(_344);
    if (_300)
    {
        float _349 = precise::min(_194, _332);
        _334 = _349;
    }
    float _351 = _334;
    int _353 = as_type<int>(_351);
    if (_300)
    {
        float _355 = precise::min(_196, _338);
        _340 = _355;
    }
    float _357 = _340;
    int _359 = as_type<int>(_357);
    if (_320)
    {
        float _361 = precise::min(_208, _344);
        _347 = as_type<int>(_361);
    }
    int _363 = _347;
    if (_320)
    {
        float _365 = precise::min(_210, _351);
        _353 = as_type<int>(_365);
    }
    int _367 = _353;
    if (_320)
    {
        float _369 = precise::min(_212, _357);
        _359 = as_type<int>(_369);
    }
    int _371 = _359;
    out.m_30.x = as_type<float>(_363);
    out.m_30.y = as_type<float>(_367);
    out.m_30.z = as_type<float>(_371);
    out.m_30.w = _80;
    return out;
}


struct main0_out_u
{
    uint4 m_30 [[color(0)]];
};

fragment main0_out_u main0_u(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _37 = gl_FragCoord.x;
    float _39 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _41 = _37 / _39;
    float _43 = gl_FragCoord.y;
    float _45 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _47 = _43 / _45;
    float _49 = _41 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _51 = _47 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _53 = _49 + (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _55 = _51 + (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _57 = _49 + (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _59 = _51 + (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float2 _420 = float2(_53, _55);
    float4 _62 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_420, float2(0.0), isnan(_420))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_420, float2(0.0), isnan(_420))).xyzw;
    float _64 = _62.x;
    float _66 = _62.y;
    float _68 = _62.z;
    float _70 = _62.w;
    float2 _439 = float2(_49, _51);
    float4 _72 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_439, float2(0.0), isnan(_439))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_439, float2(0.0), isnan(_439))).xyzw;
    float _74 = _72.x;
    float _76 = _72.y;
    float _78 = _72.z;
    float _80 = _72.w;
    float2 _455 = float2(_57, _59);
    float4 _82 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_455, float2(0.0), isnan(_455))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_455, float2(0.0), isnan(_455))).xyzw;
    float _84 = _82.x;
    float _86 = _82.y;
    float _88 = _82.z;
    float _90 = _82.w;
    float _92 = _49 + (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _94 = _51 + (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _96 = _49 + (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _98 = _49 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _100 = _49 + (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _102 = _49 + (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _104 = _49 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _106 = _51 + (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _108 = _51 + (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _110 = _51 + (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _112 = _51 + (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _114 = _51 + (*spvDescriptorSet0.fp_c3)._m0[8].y;
    bool _118 = _70 > 0.0;
    float _120 = _51 + (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _122 = _78;
    float _124 = _74;
    float _126 = _76;
    if (_118)
    {
        float _128 = precise::min(_78, _68);
        _122 = _128;
    }
    float _130 = _122;
    float _132 = _49 + (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _134 = _130;
    if (_118)
    {
        float _136 = precise::min(_74, _64);
        _124 = _136;
    }
    float _138 = _124;
    float2 _556 = float2(_92, _94);
    float4 _140 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_556, float2(0.0), isnan(_556))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_556, float2(0.0), isnan(_556))).xyzw;
    float _142 = _140.x;
    float _144 = _140.y;
    float _146 = _140.z;
    float _148 = _140.w;
    float2 _572 = float2(_96, _106);
    float4 _150 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_572, float2(0.0), isnan(_572))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_572, float2(0.0), isnan(_572))).xyzw;
    float _152 = _150.x;
    float _154 = _150.y;
    float _156 = _150.z;
    float _158 = _150.w;
    float2 _588 = float2(_98, _108);
    float4 _160 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_588, float2(0.0), isnan(_588))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_588, float2(0.0), isnan(_588))).xyzw;
    float _162 = _160.x;
    float _164 = _160.y;
    float _166 = _160.z;
    float _168 = _160.w;
    float2 _604 = float2(_100, _110);
    float4 _170 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_604, float2(0.0), isnan(_604))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_604, float2(0.0), isnan(_604))).xyzw;
    float _172 = _170.x;
    float _174 = _170.y;
    float _176 = _170.z;
    float _178 = _170.w;
    float2 _620 = float2(_102, _112);
    float4 _180 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_620, float2(0.0), isnan(_620))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_620, float2(0.0), isnan(_620))).xyzw;
    float _182 = _180.x;
    float _184 = _180.y;
    float _186 = _180.z;
    float _188 = _180.w;
    float2 _636 = float2(_104, _114);
    float4 _190 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_636, float2(0.0), isnan(_636))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_636, float2(0.0), isnan(_636))).xyzw;
    float _192 = _190.x;
    float _194 = _190.y;
    float _196 = _190.z;
    float _198 = _190.w;
    float _200 = _138;
    if (_118)
    {
        float _202 = precise::min(_76, _66);
        _126 = _202;
    }
    float _204 = _126;
    float2 _661 = float2(_132, _120);
    float4 _206 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_661, float2(0.0), isnan(_661))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_661, float2(0.0), isnan(_661))).xyzw;
    float _208 = _206.x;
    float _210 = _206.y;
    float _212 = _206.z;
    float _214 = _206.w;
    bool _216 = _90 > 0.0;
    float _218 = _204;
    if (_216)
    {
        float _220 = precise::min(_84, _138);
        _200 = _220;
    }
    float _222 = _200;
    float _224 = _222;
    if (_216)
    {
        float _226 = precise::min(_86, _204);
        _218 = _226;
    }
    float _228 = _218;
    float _230 = _228;
    if (_216)
    {
        float _232 = precise::min(_88, _130);
        _134 = _232;
    }
    float _234 = _134;
    bool _236 = _148 > 0.0;
    bool _238 = _168 > 0.0;
    float _240 = _234;
    if (_236)
    {
        float _242 = precise::min(_142, _222);
        _224 = _242;
    }
    float _244 = _224;
    float _246 = _244;
    if (_236)
    {
        float _248 = precise::min(_144, _228);
        _230 = _248;
    }
    float _250 = _230;
    float _252 = _250;
    if (_236)
    {
        float _254 = precise::min(_146, _234);
        _240 = _254;
    }
    float _256 = _240;
    bool _258 = _158 > 0.0;
    bool _260 = _188 > 0.0;
    float _262 = _256;
    if (_258)
    {
        float _264 = precise::min(_152, _244);
        _246 = _264;
    }
    float _266 = _246;
    if (_258)
    {
        float _268 = precise::min(_154, _250);
        _252 = _268;
    }
    float _270 = _252;
    if (_258)
    {
        float _272 = precise::min(_156, _256);
        _262 = _272;
    }
    float _274 = _262;
    bool _276 = _178 > 0.0;
    float _278 = _274;
    float _280 = _266;
    float _282 = _270;
    if (_238)
    {
        float _284 = precise::min(_166, _274);
        _278 = _284;
    }
    float _286 = _278;
    float _288 = _286;
    if (_238)
    {
        float _290 = precise::min(_162, _266);
        _280 = _290;
    }
    float _292 = _280;
    float _294 = _292;
    if (_238)
    {
        float _296 = precise::min(_164, _270);
        _282 = _296;
    }
    float _298 = _282;
    bool _300 = _198 > 0.0;
    float _302 = _298;
    if (_276)
    {
        float _304 = precise::min(_172, _292);
        _294 = _304;
    }
    float _306 = _294;
    float _308 = _306;
    if (_276)
    {
        float _310 = precise::min(_174, _298);
        _302 = _310;
    }
    float _312 = _302;
    float _314 = _312;
    if (_276)
    {
        float _316 = precise::min(_176, _286);
        _288 = _316;
    }
    float _318 = _288;
    bool _320 = _214 > 0.0;
    float _322 = _318;
    if (_260)
    {
        float _324 = precise::min(_182, _306);
        _308 = _324;
    }
    float _326 = _308;
    float _328 = _326;
    if (_260)
    {
        float _330 = precise::min(_184, _312);
        _314 = _330;
    }
    float _332 = _314;
    float _334 = _332;
    if (_260)
    {
        float _336 = precise::min(_186, _318);
        _322 = _336;
    }
    float _338 = _322;
    float _340 = _338;
    if (_300)
    {
        float _342 = precise::min(_192, _326);
        _328 = _342;
    }
    float _344 = _328;
    int _347 = as_type<int>(_344);
    if (_300)
    {
        float _349 = precise::min(_194, _332);
        _334 = _349;
    }
    float _351 = _334;
    int _353 = as_type<int>(_351);
    if (_300)
    {
        float _355 = precise::min(_196, _338);
        _340 = _355;
    }
    float _357 = _340;
    int _359 = as_type<int>(_357);
    if (_320)
    {
        float _361 = precise::min(_208, _344);
        _347 = as_type<int>(_361);
    }
    int _363 = _347;
    if (_320)
    {
        float _365 = precise::min(_210, _351);
        _353 = as_type<int>(_365);
    }
    int _367 = _353;
    if (_320)
    {
        float _369 = precise::min(_212, _357);
        _359 = as_type<int>(_369);
    }
    int _371 = _359;
    out.m_30.x = as_type<float>(_363);
    out.m_30.y = as_type<float>(_367);
    out.m_30.z = as_type<float>(_371);
    out.m_30.w = _80;
    return main0_out_u{as_type<uint4>(out.m_30)};
}

