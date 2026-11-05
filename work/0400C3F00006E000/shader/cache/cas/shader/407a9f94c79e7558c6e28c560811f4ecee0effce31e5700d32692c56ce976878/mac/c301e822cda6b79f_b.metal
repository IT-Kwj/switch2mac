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
    texture2d<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    sampler fp_t_tcb_8Smplr_w [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    constant dm_border_t* dm_border [[id(8)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
    float4 m_33 [[user(locn1)]];
};

static inline __attribute__((always_inline))
int _42(thread const int& _862, thread const int& _863, constant _10& support_buffer)
{
    int _866 = 1 + _863;
    float _868 = support_buffer._m5[_866].x;
    float _870 = abs(_868);
    bool _872 = _870 == 1.0;
    if (_872)
    {
        return _862;
    }
    float _874 = float(_862);
    float _876 = _874 / _870;
    int _878 = int(_876);
    return _878;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _46 = gl_FragCoord.w;
    float _48 = in.m_31.x;
    float _50 = gl_FragCoord.w;
    float _52 = _48 * _50;
    float _54 = in.m_31.y;
    float _56 = gl_FragCoord.w;
    float _58 = _54 * _56;
    float _60 = 1.0 / _46;
    float _62 = _60 * _52;
    float _64 = _60 * _58;
    float2 _412 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_412, float2(0.0), isnan(_412))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_412, float2(0.0), isnan(_412))).x;
    float _68 = in.m_33.x;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = in.m_33.y;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = in.m_33.z;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = _60 * _72;
    float _88 = _60 * _78;
    float _90 = _60 * _84;
    float _92 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _94 = precise::clamp(_92, 0.0, 1.0);
    float _96 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].y, (*spvDescriptorSet0.fp_c3)._m0[5].y);
    float _98 = precise::clamp(_96, 0.0, 1.0);
    float _100 = precise::max(_94, _98);
    float _102 = precise::max(_100, _90);
    bool _106 = _102 != 0.0;
    bool _108 = isnan(_102);
    bool _110 = _106 || _108;
    bool _112 = isnan(0.0);
    bool _114 = _110 || _112;
    bool _116 = !_114;
    if (!_116)
    {
        float _118 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _120 = fma(_102, _118, 1.0);
        float _122 = log2(_120);
        float _124 = _122 + (-1.0);
        float _126 = trunc(_124);
        int _128 = int(_126);
        int _130 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_128), spvDescriptorSet0.fp_t_tcb_A.get_height(_128)).x;
        int _132 = _130;
        int _134 = 1;
        int _136 = _42(_132, _134, (*spvDescriptorSet0.support_buffer));
        int _138 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_128), spvDescriptorSet0.fp_t_tcb_A.get_height(_128)).y;
        int _140 = _138;
        int _142 = 1;
        int _144 = _42(_140, _142, (*spvDescriptorSet0.support_buffer));
        float _146 = float(_136);
        float _148 = float(_144);
        float _150 = fma(_62, _146, -0.5);
        float _152 = fma(_64, _148, -0.5);
        float _154 = 1.0 / _146;
        float _156 = floor(_150);
        float _158 = floor(_152);
        float _160 = -_156;
        float _162 = _150 + _160;
        float _164 = -_162;
        float _166 = _164 + 1.0;
        float _168 = -_162;
        float _170 = _168 + 2.0;
        float _172 = -_158;
        float _174 = _152 + _172;
        float _176 = _166 * _166;
        float _178 = _170 * _170;
        float _180 = -_174;
        float _182 = _180 + 1.0;
        float _184 = _166 * _176;
        float _186 = -_174;
        float _188 = _186 + 2.0;
        float _190 = _182 * _182;
        float _192 = _188 * _188;
        float _194 = _182 * _190;
        float _196 = _184 * 4.0;
        float _198 = _194 * 4.0;
        float _200 = -_196;
        float _202 = fma(_170, _178, _200);
        float _204 = -_194;
        float _206 = _204 + 6.0;
        float _208 = -_184;
        float _210 = _208 + 6.0;
        float _212 = -_198;
        float _214 = fma(_188, _192, _212);
        float _216 = 1.0 / _148;
        float _218 = -_202;
        float _220 = _218 + _210;
        float _222 = -_214;
        float _224 = _222 + _206;
        float _226 = _220 * 0.16666667163372039794921875;
        float _228 = _224 * 0.16666667163372039794921875;
        float _230 = _194 + _214;
        float _232 = _184 + _202;
        float _234 = _162 * _162;
        float _236 = _174 * _174;
        float _238 = _230 * 0.16666667163372039794921875;
        float _240 = _232 * 0.16666667163372039794921875;
        float _242 = 1.0 / _226;
        float _244 = _162 * _234;
        float _246 = _174 * _236;
        float _248 = _158 + (-0.5);
        float _250 = _214 * 0.16666667163372039794921875;
        float _252 = _156 + (-0.5);
        float _254 = _158 + 1.5;
        float _256 = _156 + 1.5;
        float _258 = 1.0 / _238;
        float _260 = _202 * 0.16666667163372039794921875;
        float _262 = _244 * 0.16666667163372039794921875;
        float _264 = _246 * 0.16666667163372039794921875;
        float _266 = 1.0 / _240;
        float _268 = 1.0 / _228;
        float _270 = fma(_250, _258, _248);
        float _272 = fma(_262, _242, _256);
        float _274 = _270 * _216;
        float _276 = _272 * _154;
        float _278 = fma(_260, _266, _252);
        float _280 = _278 * _154;
        float _282 = fma(_264, _268, _254);
        float _284 = _282 * _216;
        float2 _706 = float2(_280, _274);
        float3 _288 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_706, float2(0.0), isnan(_706)), level(_124)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_706, float2(0.0), isnan(_706)), level(_124)).xyz;
        float _290 = _288.x;
        float _292 = _288.y;
        float _294 = _288.z;
        float2 _721 = float2(_276, _274);
        float3 _296 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_721, float2(0.0), isnan(_721)), level(_124)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_721, float2(0.0), isnan(_721)), level(_124)).xyz;
        float _298 = _296.x;
        float _300 = _296.y;
        float _302 = _296.z;
        float2 _736 = float2(_280, _284);
        float3 _304 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_736, float2(0.0), isnan(_736)), level(_124)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_736, float2(0.0), isnan(_736)), level(_124)).xyz;
        float _306 = _304.x;
        float _308 = _304.y;
        float _310 = _304.z;
        float2 _751 = float2(_276, _284);
        float3 _312 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_751, float2(0.0), isnan(_751)), level(_124)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_751, float2(0.0), isnan(_751)), level(_124)).xyz;
        float _314 = _312.x;
        float _316 = _312.y;
        float _318 = _312.z;
        float _320 = 0.0 + _122;
        float _322 = precise::clamp(_320, 0.0, 1.0);
        float _324 = fma(_88, _322, _86);
        float _326 = -_298;
        float _328 = _290 + _326;
        float _330 = -_302;
        float _332 = _294 + _330;
        float _334 = -_300;
        float _336 = _292 + _334;
        float _338 = fma(_240, _328, _298);
        float _340 = fma(_240, _332, _302);
        float _342 = fma(_240, _336, _300);
        float _344 = -_314;
        float _346 = _306 + _344;
        float _348 = -_316;
        float _350 = _308 + _348;
        float _352 = -_318;
        float _354 = _310 + _352;
        float _356 = fma(_240, _346, _314);
        float _358 = fma(_240, _350, _316);
        float _360 = fma(_240, _354, _318);
        float _362 = -_356;
        float _364 = _362 + _338;
        float _366 = -_358;
        float _368 = _366 + _342;
        float _370 = -_360;
        float _372 = _370 + _340;
        float _374 = fma(_238, _364, _356);
        float _376 = fma(_238, _368, _358);
        float _378 = fma(_238, _372, _360);
        out.m_36.x = _374;
        out.m_36.y = _376;
        out.m_36.z = _378;
        out.m_36.w = _324;
        return out;
    }
    discard_fragment();
    return out;
}

