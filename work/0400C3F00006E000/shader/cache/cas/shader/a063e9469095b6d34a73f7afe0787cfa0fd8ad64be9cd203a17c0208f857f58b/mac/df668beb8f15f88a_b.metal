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
    float4 m_32 [[color(0)]];
};

struct main0_in
{
    float4 m_29 [[user(locn0)]];
};

static inline __attribute__((always_inline))
int _38(thread const int& _765, thread const int& _766, constant _10& support_buffer)
{
    int _769 = 1 + _766;
    float _771 = support_buffer._m5[_769].x;
    float _773 = abs(_771);
    bool _776 = _773 == 1.0;
    if (_776)
    {
        return _765;
    }
    float _778 = float(_765);
    float _780 = _778 / _773;
    int _782 = int(_780);
    return _782;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    int _41 = int2(spvDescriptorSet0.fp_t_tcb_8.get_width(), spvDescriptorSet0.fp_t_tcb_8.get_height()).x;
    int _43 = _41;
    int _45 = 0;
    int _47 = _38(_43, _45, (*spvDescriptorSet0.support_buffer));
    int _49 = int2(spvDescriptorSet0.fp_t_tcb_8.get_width(), spvDescriptorSet0.fp_t_tcb_8.get_height()).y;
    int _51 = _49;
    int _53 = 0;
    int _55 = _38(_51, _53, (*spvDescriptorSet0.support_buffer));
    float _58 = gl_FragCoord.w;
    float _60 = in.m_29.x;
    float _62 = gl_FragCoord.w;
    float _64 = _60 * _62;
    float _66 = in.m_29.y;
    float _68 = gl_FragCoord.w;
    float _70 = _66 * _68;
    float _72 = 1.0 / _58;
    float _74 = _72 * _70;
    float _76 = float(_47);
    float _78 = _72 * _64;
    float _80 = float(_55);
    float _82 = fma(_78, _76, -0.5);
    float _84 = 1.0 / _80;
    float _86 = fma(_74, _80, -0.5);
    float _88 = floor(_82);
    float _90 = floor(_86);
    float _92 = -_88;
    float _94 = _82 + _92;
    float _96 = -_94;
    float _98 = _96 + 1.0;
    float _100 = -_94;
    float _102 = _100 + 2.0;
    float _104 = -_90;
    float _106 = _86 + _104;
    float _108 = _98 * _98;
    float _110 = _102 * _102;
    float _112 = -_106;
    float _114 = _112 + 1.0;
    float _116 = _98 * _108;
    float _118 = -_106;
    float _120 = _118 + 2.0;
    float _122 = _114 * _114;
    float _124 = _116 * 4.0;
    float _126 = _120 * _120;
    float _128 = _114 * _122;
    float _130 = -_124;
    float _132 = fma(_102, _110, _130);
    float _134 = -_116;
    float _136 = _134 + 6.0;
    float _138 = _128 * 4.0;
    float _140 = -_128;
    float _142 = _140 + 6.0;
    float _144 = -_132;
    float _146 = _144 + _136;
    float _148 = _116 + _132;
    float _150 = -_138;
    float _152 = fma(_120, _126, _150);
    float _154 = _132 * 0.16666667163372039794921875;
    float _156 = _146 * 0.16666667163372039794921875;
    float _158 = _148 * 0.16666667163372039794921875;
    float _160 = -_152;
    float _162 = _160 + _142;
    float _164 = _128 + _152;
    float _166 = 1.0 / _76;
    float _168 = _106 * _106;
    float _170 = _162 * 0.16666667163372039794921875;
    float _172 = _164 * 0.16666667163372039794921875;
    float _174 = _90 + (-0.5);
    float _176 = _106 * _168;
    float _178 = _152 * 0.16666667163372039794921875;
    float _180 = _88 + 1.5;
    float _182 = 1.0 / _158;
    float _184 = _94 * _94;
    float _186 = _176 * 0.16666667163372039794921875;
    float _188 = _94 * _184;
    float _190 = _88 + (-0.5);
    float _192 = _90 + 1.5;
    float _194 = 1.0 / _172;
    float _196 = _188 * 0.16666667163372039794921875;
    float _198 = 1.0 / _156;
    float _200 = fma(_154, _182, _190);
    float _202 = _200 * _166;
    float _204 = 1.0 / _170;
    float _206 = fma(_178, _194, _174);
    float _208 = fma(_196, _198, _180);
    float _210 = _206 * _84;
    float _212 = _208 * _166;
    float _214 = fma(_186, _204, _192);
    float2 _562 = float2(_202, _210);
    float4 _217 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_562, float2(0.0), isnan(_562))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_562, float2(0.0), isnan(_562))).xyzw;
    float _219 = _217.x;
    float _221 = _217.y;
    float _223 = _217.z;
    float _225 = _217.w;
    float2 _582 = float2(_212, _210);
    float4 _227 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_582, float2(0.0), isnan(_582))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_582, float2(0.0), isnan(_582))).xyzw;
    float _229 = _227.x;
    float _231 = _227.y;
    float _233 = _227.z;
    float _235 = _227.w;
    float _237 = _214 * _84;
    float2 _601 = float2(_202, _237);
    float4 _239 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_601, float2(0.0), isnan(_601))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_601, float2(0.0), isnan(_601))).xyzw;
    float _241 = _239.x;
    float _243 = _239.y;
    float _245 = _239.z;
    float _247 = _239.w;
    float2 _617 = float2(_212, _237);
    float4 _249 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_617, float2(0.0), isnan(_617))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_617, float2(0.0), isnan(_617))).xyzw;
    float _251 = _249.x;
    float _253 = _249.y;
    float _255 = _249.z;
    float _257 = _249.w;
    float _259 = -_231;
    float _261 = _221 + _259;
    float _263 = -_229;
    float _265 = _219 + _263;
    float _267 = -_233;
    float _269 = _223 + _267;
    float _271 = -_235;
    float _273 = _225 + _271;
    float _275 = fma(_158, _261, _231);
    float _277 = fma(_158, _265, _229);
    float _279 = fma(_158, _269, _233);
    float _281 = -_251;
    float _283 = _241 + _281;
    float _285 = -_253;
    float _287 = _243 + _285;
    float _289 = -_255;
    float _291 = _245 + _289;
    float _293 = -_257;
    float _295 = _247 + _293;
    float _297 = fma(_158, _283, _251);
    float _299 = fma(_158, _287, _253);
    float _301 = fma(_158, _291, _255);
    float _303 = fma(_158, _273, _235);
    float _305 = fma(_158, _295, _257);
    float _307 = -_297;
    float _309 = _307 + _277;
    float _311 = -_299;
    float _313 = _311 + _275;
    float _315 = -_301;
    float _317 = _315 + _279;
    float _319 = -_305;
    float _321 = _319 + _303;
    float _323 = fma(_172, _309, _297);
    float _325 = fma(_172, _313, _299);
    float _327 = fma(_172, _317, _301);
    float _329 = fma(_172, _321, _305);
    float _331 = _323 + (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _333 = _325 + (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _335 = _327 + (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _337 = _329 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    out.m_32.x = _331;
    out.m_32.y = _333;
    out.m_32.z = _335;
    out.m_32.w = _337;
    return out;
}

