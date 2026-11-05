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
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_36 [[user(locn0)]];
    float4 m_31 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _43 = gl_FragCoord.w;
    float _45 = in.m_31.x;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_31.y;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = 1.0 / _43;
    float _59 = _57 * _49;
    float _61 = _57 * _55;
    float2 _377 = float2(_59, _61);
    float4 _64 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_377, float2(0.0), isnan(_377))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_377, float2(0.0), isnan(_377))).xyzw;
    float _66 = _64.x;
    float _68 = _64.y;
    float _70 = _64.z;
    float _72 = _64.w;
    float2 _396 = float2(_59, _61);
    float4 _74 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_396, float2(0.0), isnan(_396)), int2(0), component::x).xyzw;
    float _76 = _74.x;
    float _78 = _74.y;
    float _80 = _74.z;
    float _82 = _74.w;
    float _84 = _68 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _86 = precise::min(_76, _82);
    float _88 = precise::min(_78, _80);
    float _90 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[2].x, _84);
    float _92 = precise::max(_76, _82);
    float _94 = precise::max(_78, _80);
    float _96 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[2].z, _90);
    float _98 = precise::min(_86, _88);
    float _100 = precise::max(_92, _94);
    float _102 = precise::min(_96, _98);
    float _104 = precise::max(_96, _100);
    float _106 = _100 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _108 = -_102;
    float _110 = _108 + _104;
    float _112 = precise::max(_106, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    bool _116 = _110 > _112;
    if (!_116)
    {
        out.m_34.x = _66;
        out.m_34.y = _68;
        out.m_34.z = _70;
        out.m_34.w = _72;
        return out;
    }
    float _118 = -_80;
    float _120 = _76 + _118;
    float _122 = -_82;
    float _124 = _78 + _122;
    float _126 = in.m_36.x;
    float _128 = gl_FragCoord.w;
    float _130 = _126 * _128;
    float _132 = in.m_36.y;
    float _134 = gl_FragCoord.w;
    float _136 = _132 * _134;
    float _138 = in.m_36.z;
    float _140 = gl_FragCoord.w;
    float _142 = _138 * _140;
    float _144 = -_124;
    float _146 = _120 + _144;
    float _148 = _120 + _124;
    float _150 = in.m_36.w;
    float _152 = gl_FragCoord.w;
    float _154 = _150 * _152;
    float _156 = _146 * _146;
    float _158 = fma(_148, _148, _156);
    float _160 = _158 + 0.00260416674427688121795654296875;
    float _162 = rsqrt(_160);
    float _164 = _57 * _130;
    float _166 = _57 * _136;
    float _168 = _57 * _142;
    float _170 = _148 * _162;
    float _172 = _146 * _162;
    float _174 = _57 * _154;
    float _176 = -_164;
    float _178 = fma(_170, _176, _59);
    float _180 = -_166;
    float _182 = fma(_172, _180, _61);
    float _184 = abs(_170);
    float _186 = abs(_172);
    float _188 = precise::min(_184, _186);
    float _190 = fma(_172, _166, _61);
    float _192 = _188 * 2.0;
    float _194 = 1.0 / _192;
    float _196 = _194 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _198 = _196 * 0.5;
    float _200 = fma(_170, _198, 0.5);
    float _202 = precise::clamp(_200, 0.0, 1.0);
    float _204 = fma(_172, _198, 0.5);
    float _206 = precise::clamp(_204, 0.0, 1.0);
    float _208 = fma(_170, _164, _59);
    float _210 = _202 + (-0.5);
    float _212 = _206 + (-0.5);
    float _214 = -_168;
    float _216 = fma(_210, _214, _59);
    float _218 = fma(_210, _168, _59);
    float _220 = -_174;
    float _222 = fma(_212, _220, _61);
    float _224 = fma(_212, _174, _61);
    float2 _633 = float2(_178, _182);
    float4 _226 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_633, float2(0.0), isnan(_633))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_633, float2(0.0), isnan(_633))).xyzw;
    float _228 = _226.x;
    float _230 = _226.y;
    float _232 = _226.z;
    float _234 = _226.w;
    float2 _649 = float2(_208, _190);
    float4 _236 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_649, float2(0.0), isnan(_649))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_649, float2(0.0), isnan(_649))).xyzw;
    float _238 = _236.x;
    float _240 = _236.y;
    float _242 = _236.z;
    float _244 = _236.w;
    float2 _665 = float2(_216, _222);
    float4 _246 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_665, float2(0.0), isnan(_665))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_665, float2(0.0), isnan(_665))).xyzw;
    float _248 = _246.x;
    float _250 = _246.y;
    float _252 = _246.z;
    float _254 = _246.w;
    float2 _681 = float2(_218, _224);
    float4 _256 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_681, float2(0.0), isnan(_681))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_681, float2(0.0), isnan(_681))).xyzw;
    float _258 = _256.x;
    float _260 = _256.y;
    float _262 = _256.z;
    float _264 = _256.w;
    float _266 = _230 + _240;
    float _268 = _228 + _238;
    float _270 = _234 + _244;
    float _272 = _250 + _260;
    float _274 = _248 + _258;
    float _276 = _252 + _262;
    float _278 = _270 * 0.5;
    float _280 = _266 + _272;
    float _282 = _232 + _242;
    float _284 = _268 + _274;
    float _286 = _254 + _264;
    float _288 = _280 * 0.25;
    float _290 = _282 + _276;
    float _292 = _284 * 0.25;
    float _294 = _270 + _286;
    float _296 = _288 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _298 = _290 * 0.25;
    float _300 = fma(_292, (*spvDescriptorSet0.fp_c3)._m0[2].x, _296);
    float _302 = fma(_298, (*spvDescriptorSet0.fp_c3)._m0[2].z, _300);
    bool _304 = _302 >= _100;
    bool _306 = isnan(_302);
    bool _308 = _304 || _306;
    bool _310 = isnan(_100);
    bool _312 = _308 || _310;
    bool _314 = _98 < _302;
    bool _316 = !_312;
    bool _318 = _314 && _316;
    int _321 = as_type<int>(_292);
    int _323 = as_type<int>(_288);
    int _325 = as_type<int>(_298);
    int _327 = as_type<int>(_278);
    if (!_318)
    {
        float _329 = _268 * 0.5;
        _321 = as_type<int>(_329);
    }
    int _331 = _321;
    if (!_318)
    {
        float _333 = _266 * 0.5;
        _323 = as_type<int>(_333);
    }
    int _335 = _323;
    if (!_318)
    {
        float _337 = _282 * 0.5;
        _325 = as_type<int>(_337);
    }
    int _339 = _325;
    if (_318)
    {
        float _341 = _294 * 0.25;
        _327 = as_type<int>(_341);
    }
    int _343 = _327;
    out.m_34.x = as_type<float>(_331);
    out.m_34.y = as_type<float>(_335);
    out.m_34.z = as_type<float>(_339);
    out.m_34.w = as_type<float>(_343);
    return out;
}


struct main0_out_u
{
    uint4 m_34 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _43 = gl_FragCoord.w;
    float _45 = in.m_31.x;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_31.y;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = 1.0 / _43;
    float _59 = _57 * _49;
    float _61 = _57 * _55;
    float2 _377 = float2(_59, _61);
    float4 _64 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_377, float2(0.0), isnan(_377))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_377, float2(0.0), isnan(_377))).xyzw;
    float _66 = _64.x;
    float _68 = _64.y;
    float _70 = _64.z;
    float _72 = _64.w;
    float2 _396 = float2(_59, _61);
    float4 _74 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_396, float2(0.0), isnan(_396)), int2(0), component::x).xyzw;
    float _76 = _74.x;
    float _78 = _74.y;
    float _80 = _74.z;
    float _82 = _74.w;
    float _84 = _68 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _86 = precise::min(_76, _82);
    float _88 = precise::min(_78, _80);
    float _90 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[2].x, _84);
    float _92 = precise::max(_76, _82);
    float _94 = precise::max(_78, _80);
    float _96 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[2].z, _90);
    float _98 = precise::min(_86, _88);
    float _100 = precise::max(_92, _94);
    float _102 = precise::min(_96, _98);
    float _104 = precise::max(_96, _100);
    float _106 = _100 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _108 = -_102;
    float _110 = _108 + _104;
    float _112 = precise::max(_106, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    bool _116 = _110 > _112;
    if (!_116)
    {
        out.m_34.x = _66;
        out.m_34.y = _68;
        out.m_34.z = _70;
        out.m_34.w = _72;
        return main0_out_u{as_type<uint4>(out.m_34)};
    }
    float _118 = -_80;
    float _120 = _76 + _118;
    float _122 = -_82;
    float _124 = _78 + _122;
    float _126 = in.m_36.x;
    float _128 = gl_FragCoord.w;
    float _130 = _126 * _128;
    float _132 = in.m_36.y;
    float _134 = gl_FragCoord.w;
    float _136 = _132 * _134;
    float _138 = in.m_36.z;
    float _140 = gl_FragCoord.w;
    float _142 = _138 * _140;
    float _144 = -_124;
    float _146 = _120 + _144;
    float _148 = _120 + _124;
    float _150 = in.m_36.w;
    float _152 = gl_FragCoord.w;
    float _154 = _150 * _152;
    float _156 = _146 * _146;
    float _158 = fma(_148, _148, _156);
    float _160 = _158 + 0.00260416674427688121795654296875;
    float _162 = rsqrt(_160);
    float _164 = _57 * _130;
    float _166 = _57 * _136;
    float _168 = _57 * _142;
    float _170 = _148 * _162;
    float _172 = _146 * _162;
    float _174 = _57 * _154;
    float _176 = -_164;
    float _178 = fma(_170, _176, _59);
    float _180 = -_166;
    float _182 = fma(_172, _180, _61);
    float _184 = abs(_170);
    float _186 = abs(_172);
    float _188 = precise::min(_184, _186);
    float _190 = fma(_172, _166, _61);
    float _192 = _188 * 2.0;
    float _194 = 1.0 / _192;
    float _196 = _194 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _198 = _196 * 0.5;
    float _200 = fma(_170, _198, 0.5);
    float _202 = precise::clamp(_200, 0.0, 1.0);
    float _204 = fma(_172, _198, 0.5);
    float _206 = precise::clamp(_204, 0.0, 1.0);
    float _208 = fma(_170, _164, _59);
    float _210 = _202 + (-0.5);
    float _212 = _206 + (-0.5);
    float _214 = -_168;
    float _216 = fma(_210, _214, _59);
    float _218 = fma(_210, _168, _59);
    float _220 = -_174;
    float _222 = fma(_212, _220, _61);
    float _224 = fma(_212, _174, _61);
    float2 _633 = float2(_178, _182);
    float4 _226 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_633, float2(0.0), isnan(_633))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_633, float2(0.0), isnan(_633))).xyzw;
    float _228 = _226.x;
    float _230 = _226.y;
    float _232 = _226.z;
    float _234 = _226.w;
    float2 _649 = float2(_208, _190);
    float4 _236 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_649, float2(0.0), isnan(_649))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_649, float2(0.0), isnan(_649))).xyzw;
    float _238 = _236.x;
    float _240 = _236.y;
    float _242 = _236.z;
    float _244 = _236.w;
    float2 _665 = float2(_216, _222);
    float4 _246 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_665, float2(0.0), isnan(_665))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_665, float2(0.0), isnan(_665))).xyzw;
    float _248 = _246.x;
    float _250 = _246.y;
    float _252 = _246.z;
    float _254 = _246.w;
    float2 _681 = float2(_218, _224);
    float4 _256 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_681, float2(0.0), isnan(_681))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_681, float2(0.0), isnan(_681))).xyzw;
    float _258 = _256.x;
    float _260 = _256.y;
    float _262 = _256.z;
    float _264 = _256.w;
    float _266 = _230 + _240;
    float _268 = _228 + _238;
    float _270 = _234 + _244;
    float _272 = _250 + _260;
    float _274 = _248 + _258;
    float _276 = _252 + _262;
    float _278 = _270 * 0.5;
    float _280 = _266 + _272;
    float _282 = _232 + _242;
    float _284 = _268 + _274;
    float _286 = _254 + _264;
    float _288 = _280 * 0.25;
    float _290 = _282 + _276;
    float _292 = _284 * 0.25;
    float _294 = _270 + _286;
    float _296 = _288 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _298 = _290 * 0.25;
    float _300 = fma(_292, (*spvDescriptorSet0.fp_c3)._m0[2].x, _296);
    float _302 = fma(_298, (*spvDescriptorSet0.fp_c3)._m0[2].z, _300);
    bool _304 = _302 >= _100;
    bool _306 = isnan(_302);
    bool _308 = _304 || _306;
    bool _310 = isnan(_100);
    bool _312 = _308 || _310;
    bool _314 = _98 < _302;
    bool _316 = !_312;
    bool _318 = _314 && _316;
    int _321 = as_type<int>(_292);
    int _323 = as_type<int>(_288);
    int _325 = as_type<int>(_298);
    int _327 = as_type<int>(_278);
    if (!_318)
    {
        float _329 = _268 * 0.5;
        _321 = as_type<int>(_329);
    }
    int _331 = _321;
    if (!_318)
    {
        float _333 = _266 * 0.5;
        _323 = as_type<int>(_333);
    }
    int _335 = _323;
    if (!_318)
    {
        float _337 = _282 * 0.5;
        _325 = as_type<int>(_337);
    }
    int _339 = _325;
    if (_318)
    {
        float _341 = _294 * 0.25;
        _327 = as_type<int>(_341);
    }
    int _343 = _327;
    out.m_34.x = as_type<float>(_331);
    out.m_34.y = as_type<float>(_335);
    out.m_34.z = as_type<float>(_339);
    out.m_34.w = as_type<float>(_343);
    return main0_out_u{as_type<uint4>(out.m_34)};
}

