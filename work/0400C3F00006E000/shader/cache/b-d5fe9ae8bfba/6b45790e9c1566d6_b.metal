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
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
    float4 m_29 [[user(locn1)]];
};

static inline __attribute__((always_inline))
int _40(thread const int& _853, thread const int& _854, constant _10& support_buffer)
{
    int _857 = 1 + _854;
    float _859 = support_buffer._m5[_857].x;
    float _861 = abs(_859);
    bool _863 = _861 == 1.0;
    if (_863)
    {
        return _853;
    }
    float _865 = float(_853);
    float _867 = _865 / _861;
    int _869 = int(_867);
    return _869;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _44 = gl_FragCoord.w;
    float _46 = in.m_29.z;
    float _48 = gl_FragCoord.w;
    float _50 = _46 * _48;
    float _52 = in.m_29.x;
    float _54 = gl_FragCoord.w;
    float _56 = _52 * _54;
    float _58 = 1.0 / _44;
    float _60 = _58 * _50;
    float _62 = _58 * _56;
    bool _66 = _60 != 0.0;
    bool _68 = isnan(_60);
    bool _70 = _66 || _68;
    bool _72 = isnan(0.0);
    bool _74 = _70 || _72;
    bool _76 = !_74;
    if (!_76)
    {
        float _78 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _80 = fma(_60, _78, 1.0);
        float _82 = log2(_80);
        float _84 = _82 + (-1.0);
        float _86 = trunc(_84);
        int _88 = int(_86);
        int _90 = int2(spvDescriptorSet0.fp_t_tcb_8.get_width(_88), spvDescriptorSet0.fp_t_tcb_8.get_height(_88)).x;
        int _92 = _90;
        int _94 = 0;
        int _96 = _40(_92, _94, (*spvDescriptorSet0.support_buffer));
        int _98 = int2(spvDescriptorSet0.fp_t_tcb_8.get_width(_88), spvDescriptorSet0.fp_t_tcb_8.get_height(_88)).y;
        int _100 = _98;
        int _102 = 0;
        int _104 = _40(_100, _102, (*spvDescriptorSet0.support_buffer));
        float _106 = in.m_31.x;
        float _108 = gl_FragCoord.w;
        float _110 = _106 * _108;
        float _112 = in.m_31.y;
        float _114 = gl_FragCoord.w;
        float _116 = _112 * _114;
        float _118 = _58 * _110;
        float _120 = float(_96);
        float _122 = _58 * _116;
        float _124 = float(_104);
        float _126 = fma(_118, _120, -0.5);
        float _128 = fma(_122, _124, -0.5);
        float _130 = floor(_126);
        float _132 = floor(_128);
        float _134 = -_130;
        float _136 = _126 + _134;
        float _138 = 1.0 / _124;
        float _140 = -_136;
        float _142 = _140 + 1.0;
        float _144 = -_136;
        float _146 = _144 + 2.0;
        float _148 = -_132;
        float _150 = _128 + _148;
        float _152 = _142 * _142;
        float _154 = _146 * _146;
        float _156 = -_150;
        float _158 = _156 + 1.0;
        float _160 = _142 * _152;
        float _162 = -_150;
        float _164 = _162 + 2.0;
        float _166 = _158 * _158;
        float _168 = _164 * _164;
        float _170 = _158 * _166;
        float _172 = _160 * 4.0;
        float _174 = _170 * 4.0;
        float _176 = -_172;
        float _178 = fma(_146, _154, _176);
        float _180 = -_160;
        float _182 = _180 + 6.0;
        float _184 = -_170;
        float _186 = _184 + 6.0;
        float _188 = -_174;
        float _190 = fma(_164, _168, _188);
        float _192 = _160 + _178;
        float _194 = -_178;
        float _196 = _194 + _182;
        float _198 = 1.0 / _120;
        float _200 = _170 + _190;
        float _202 = -_190;
        float _204 = _202 + _186;
        float _206 = _196 * 0.16666667163372039794921875;
        float _208 = _192 * 0.16666667163372039794921875;
        float _210 = _200 * 0.16666667163372039794921875;
        float _212 = _204 * 0.16666667163372039794921875;
        float _214 = _136 * _136;
        float _216 = 1.0 / _208;
        float _218 = _150 * _150;
        float _220 = _190 * 0.16666667163372039794921875;
        float _222 = _136 * _214;
        float _224 = _132 + (-0.5);
        float _226 = _150 * _218;
        float _228 = _130 + (-0.5);
        float _230 = _178 * 0.16666667163372039794921875;
        float _232 = 1.0 / _210;
        float _234 = _132 + 1.5;
        float _236 = _226 * 0.16666667163372039794921875;
        float _238 = 1.0 / _206;
        float _240 = fma(_230, _216, _228);
        float _242 = _240 * _198;
        float _244 = 1.0 / _212;
        float _246 = fma(_220, _232, _224);
        float _248 = _130 + 1.5;
        float _250 = _222 * 0.16666667163372039794921875;
        float _252 = fma(_250, _238, _248);
        float _254 = _246 * _138;
        float _256 = fma(_236, _244, _234);
        float _258 = _252 * _198;
        float _260 = _256 * _138;
        float2 _660 = float2(_242, _254);
        float3 _264 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_660, float2(0.0), isnan(_660)), level(_84)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_660, float2(0.0), isnan(_660)), level(_84)).xyz;
        float _266 = _264.x;
        float _268 = _264.y;
        float _270 = _264.z;
        float2 _677 = float2(_258, _254);
        float3 _272 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_677, float2(0.0), isnan(_677)), level(_84)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_677, float2(0.0), isnan(_677)), level(_84)).xyz;
        float _274 = _272.x;
        float _276 = _272.y;
        float _278 = _272.z;
        float2 _692 = float2(_242, _260);
        float3 _280 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_692, float2(0.0), isnan(_692)), level(_84)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_692, float2(0.0), isnan(_692)), level(_84)).xyz;
        float _282 = _280.x;
        float _284 = _280.y;
        float _286 = _280.z;
        float2 _707 = float2(_258, _260);
        float3 _288 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_707, float2(0.0), isnan(_707)), level(_84)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_707, float2(0.0), isnan(_707)), level(_84)).xyz;
        float _290 = _288.x;
        float _292 = _288.y;
        float _294 = _288.z;
        float _296 = in.m_29.y;
        float _298 = gl_FragCoord.w;
        float _300 = _296 * _298;
        float _302 = 0.0 + _82;
        float _304 = precise::clamp(_302, 0.0, 1.0);
        float _306 = _58 * _300;
        float _308 = fma(_306, _304, _62);
        float _310 = _304 * _306;
        float _312 = -_274;
        float _314 = _266 + _312;
        float _316 = -_278;
        float _318 = _270 + _316;
        float _320 = -_276;
        float _322 = _268 + _320;
        float _324 = 1.0 / _308;
        float _326 = -_294;
        float _328 = _286 + _326;
        float _330 = fma(_208, _314, _274);
        float _332 = -_290;
        float _334 = _282 + _332;
        float _336 = -_292;
        float _338 = _284 + _336;
        float _340 = fma(_208, _318, _278);
        float _342 = fma(_208, _328, _294);
        float _344 = fma(_208, _334, _290);
        float _346 = fma(_208, _322, _276);
        float _348 = fma(_208, _338, _292);
        float _350 = -_342;
        float _352 = _350 + _340;
        float _354 = -_344;
        float _356 = _354 + _330;
        float _358 = -_348;
        float _360 = _358 + _346;
        float _362 = fma(_210, _352, _342);
        float _364 = fma(_210, _356, _344);
        float _366 = _324 * _310;
        float _368 = fma(_210, _360, _348);
        float _370 = _362 * _310;
        float _372 = _364 * _366;
        float _374 = _368 * _366;
        float _376 = _370 * _324;
        out.m_34.x = _372;
        out.m_34.y = _374;
        out.m_34.z = _376;
        out.m_34.w = _308;
        return out;
    }
    out.m_34.x = 0.0;
    out.m_34.y = 0.0;
    out.m_34.z = 0.0;
    out.m_34.w = _62;
    return out;
}

