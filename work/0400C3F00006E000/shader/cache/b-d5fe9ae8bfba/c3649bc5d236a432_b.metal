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
    texture2d<float> fp_t_tcb_C [[id(1)]];
    sampler fp_t_tcb_CSmplr [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    texture2d<float> fp_t_tcb_E [[id(7)]];
    sampler fp_t_tcb_ESmplr [[id(8)]];
    sampler fp_t_tcb_CSmplr_w [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_ESmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_42 [[color(0)]];
};

struct main0_in
{
    float4 m_37 [[user(locn0)]];
    float4 m_35 [[user(locn1)]];
    float4 m_39 [[user(locn2)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _49 = gl_FragCoord.w;
    float _51 = in.m_35.x;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_35.y;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = 1.0 / _49;
    float _65 = _63 * _55;
    float _67 = _63 * _61;
    float2 _418 = float2(_65, _67);
    float _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_418, float2(0.0), isnan(_418))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_418, float2(0.0), isnan(_418))).x;
    float2 _429 = float2(_65, _67);
    float4 _72 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_429, float2(0.0), isnan(_429))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_429, float2(0.0), isnan(_429))).xyzw;
    float _74 = _72.x;
    float _76 = _72.y;
    float _78 = _72.z;
    float _80 = _72.w;
    float2 _445 = float2(_65, _67);
    float4 _82 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_445, float2(0.0), isnan(_445)), int2(0), component::x).xyzw;
    float _84 = _82.x;
    float _86 = _82.y;
    float _88 = _82.z;
    float _90 = _82.w;
    float _92 = in.m_37.x;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = in.m_37.w;
    float _100 = gl_FragCoord.w;
    float _102 = _98 * _100;
    float _104 = in.m_37.y;
    float _106 = gl_FragCoord.w;
    float _108 = _104 * _106;
    float _110 = in.m_39.x;
    float _112 = gl_FragCoord.w;
    float _114 = _110 * _112;
    float _116 = in.m_39.y;
    float _118 = gl_FragCoord.w;
    float _120 = _116 * _118;
    float _122 = in.m_39.w;
    float _124 = gl_FragCoord.w;
    float _126 = _122 * _124;
    float _128 = _63 * _96;
    float _130 = _63 * _102;
    float _132 = _63 * _108;
    float _134 = _63 * _114;
    float _136 = _63 * _120;
    float _138 = _63 * _126;
    float _140 = -_69;
    float _142 = -(*spvDescriptorSet0.fp_c3)._m0[12].z;
    float _144 = _140 + _142;
    float _146 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[12].y, (*spvDescriptorSet0.fp_c3)._m0[12].w);
    float _148 = _138 * _146;
    float _150 = fma(_130, _144, _148);
    float _152 = _134 * _146;
    float _154 = _136 * _146;
    float _156 = fma(_128, _144, _152);
    float _158 = 1.0 / _150;
    float _160 = fma(_132, _144, _154);
    float _162 = _156 * _158;
    float _164 = _160 * _158;
    float2 _568 = float2(_162, _164);
    float4 _166 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_568, float2(0.0), isnan(_568))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_568, float2(0.0), isnan(_568))).xyzw;
    float _168 = _166.x;
    float _170 = _166.y;
    float _172 = _166.z;
    float _174 = _166.w;
    float _176 = -_67;
    float _178 = _176 + _164;
    float _180 = _76 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _182 = -_65;
    float _184 = _182 + _162;
    float _186 = _178 * (*spvDescriptorSet0.fp_c3)._m0[10].w;
    float _188 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[2].x, _180);
    float _190 = precise::min(_84, _90);
    float _192 = _184 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _194 = precise::min(_86, _88);
    float _196 = _186 * _186;
    float _198 = precise::max(_84, _90);
    float _200 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[2].z, _188);
    float _202 = precise::max(_86, _88);
    float _204 = fma(_192, _192, _196);
    float _206 = precise::min(_190, _194);
    float _208 = precise::max(_198, _202);
    float _210 = precise::min(_200, _206);
    float _212 = sqrt(_204);
    float _214 = precise::max(_200, _208);
    float _216 = _208 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _218 = -_210;
    float _220 = _218 + _214;
    float _222 = precise::max(_216, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    bool _226 = _220 > _222;
    float _228 = 0.0 + _212;
    float _230 = precise::clamp(_228, 0.0, 1.0);
    float _232 = fma(_230, -0.5, 0.5);
    float _234 = 0.5;
    float _236 = _220;
    float _238 = _78;
    float _240 = _74;
    if (!_226)
    {
        _234 = _78;
    }
    float _242 = _234;
    float _244 = _242;
    if (!_226)
    {
        _236 = _76;
    }
    float _246 = _236;
    float _248 = _246;
    if (!_226)
    {
        _238 = _80;
    }
    float _250 = _238;
    bool _252 = !_226;
    float _254 = _250;
    if (!_252)
    {
        float _256 = _88 + _90;
        float _258 = -_88;
        float _260 = _84 + _258;
        float _262 = -_90;
        float _264 = _86 + _262;
        float _266 = _84 + _256;
        float _268 = _260 + _264;
        float _270 = -_264;
        float _272 = _260 + _270;
        float _274 = _86 + _266;
        float _276 = (*spvDescriptorSet0.fp_c3)._m0[4].z * 0.25;
        float _278 = abs(_268);
        float _280 = abs(_272);
        float _282 = precise::min(_278, _280);
        float _284 = fma(_274, _276, (*spvDescriptorSet0.fp_c3)._m0[4].w);
        float _286 = precise::max(_284, _282);
        float _288 = 1.0 / _286;
        float _290 = _268 * _288;
        float _292 = _272 * _288;
        float _294 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
        float _296 = precise::max(_290, _294);
        float _298 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
        float _300 = precise::max(_292, _298);
        float _302 = precise::min(_296, (*spvDescriptorSet0.fp_c3)._m0[4].y);
        float _304 = precise::min(_300, (*spvDescriptorSet0.fp_c3)._m0[4].y);
        float _306 = -_302;
        float _308 = fma(_306, (*spvDescriptorSet0.fp_c3)._m0[1].x, _65);
        float _310 = fma(_302, (*spvDescriptorSet0.fp_c3)._m0[1].x, _65);
        float _312 = -_304;
        float _314 = fma(_312, (*spvDescriptorSet0.fp_c3)._m0[1].y, _67);
        float _316 = fma(_304, (*spvDescriptorSet0.fp_c3)._m0[1].y, _67);
        float2 _802 = float2(_308, _314);
        float4 _318 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_802, float2(0.0), isnan(_802))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_802, float2(0.0), isnan(_802))).xyzw;
        float _320 = _318.x;
        float _322 = _318.y;
        float _324 = _318.z;
        float _326 = _318.w;
        float2 _818 = float2(_310, _316);
        float4 _328 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_818, float2(0.0), isnan(_818))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_818, float2(0.0), isnan(_818))).xyzw;
        float _330 = _328.x;
        float _332 = _328.y;
        float _334 = _328.z;
        float _336 = _328.w;
        float _338 = _320 + _330;
        float _340 = _322 + _332;
        float _342 = _324 + _334;
        float _344 = _326 + _336;
        float _346 = _338 * 0.5;
        float _348 = _340 * 0.5;
        float _350 = _342 * 0.5;
        float _352 = _344 * 0.5;
        _240 = _346;
        _248 = _348;
        _244 = _350;
        _254 = _352;
    }
    float _354 = _240;
    float _356 = _248;
    float _358 = _244;
    float _360 = _254;
    float _362 = -_354;
    float _364 = _168 + _362;
    float _366 = -_356;
    float _368 = _170 + _366;
    float _370 = -_358;
    float _372 = _172 + _370;
    float _374 = -_360;
    float _376 = _174 + _374;
    float _378 = fma(_232, _364, _354);
    float _380 = fma(_232, _368, _356);
    float _382 = fma(_232, _372, _358);
    float _384 = fma(_232, _376, _360);
    out.m_42.x = _378;
    out.m_42.y = _380;
    out.m_42.z = _382;
    out.m_42.w = _384;
    return out;
}

