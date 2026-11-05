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
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
    float4 m_36 [[user(locn1)]];
};

static inline __attribute__((always_inline))
int _42(thread const int& _972, thread const int& _973, constant _10& support_buffer)
{
    int _976 = 1 + _973;
    float _978 = support_buffer._m5[_976].x;
    float _980 = abs(_978);
    bool _982 = _980 == 1.0;
    if (_982)
    {
        return _972;
    }
    float _984 = float(_972);
    float _986 = _984 / _980;
    int _988 = int(_986);
    return _988;
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
    float2 _446 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_446, float2(0.0), isnan(_446))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_446, float2(0.0), isnan(_446))).x;
    bool _70 = _66 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_70)
    {
        discard_fragment();
    }
    if (_70)
    {
        out.m_34.x = 0.0;
        out.m_34.y = 0.0;
        out.m_34.z = 0.0;
        out.m_34.w = 0.0;
        return out;
    }
    float _72 = in.m_36.z;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = in.m_36.x;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_36.y;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _92 = precise::clamp(_90, 0.0, 1.0);
    float _94 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].y, (*spvDescriptorSet0.fp_c3)._m0[5].y);
    float _96 = precise::clamp(_94, 0.0, 1.0);
    float _98 = precise::max(_92, _96);
    float _100 = _60 * _76;
    float _102 = precise::max(_98, _100);
    float _104 = _60 * _82;
    float _106 = _60 * _88;
    bool _108 = _102 != 0.0;
    bool _110 = isnan(_102);
    bool _112 = _108 || _110;
    bool _114 = isnan(0.0);
    bool _116 = _112 || _114;
    bool _118 = !_116;
    if (!_118)
    {
        float _120 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _122 = fma(_102, _120, 1.0);
        float _124 = log2(_122);
        float _126 = _124 + (-1.0);
        float _128 = trunc(_126);
        int _130 = int(_128);
        int _132 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_130), spvDescriptorSet0.fp_t_tcb_A.get_height(_130)).x;
        int _134 = _132;
        int _136 = 1;
        int _138 = _42(_134, _136, (*spvDescriptorSet0.support_buffer));
        int _140 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_130), spvDescriptorSet0.fp_t_tcb_A.get_height(_130)).y;
        int _142 = _140;
        int _144 = 1;
        int _146 = _42(_142, _144, (*spvDescriptorSet0.support_buffer));
        float _148 = float(_138);
        float _150 = float(_146);
        float _152 = fma(_62, _148, -0.5);
        float _154 = fma(_64, _150, -0.5);
        float _156 = 1.0 / _148;
        float _158 = floor(_152);
        float _160 = floor(_154);
        float _162 = -_158;
        float _164 = _152 + _162;
        float _166 = -_164;
        float _168 = _166 + 1.0;
        float _170 = -_164;
        float _172 = _170 + 2.0;
        float _174 = -_160;
        float _176 = _154 + _174;
        float _178 = _168 * _168;
        float _180 = -_176;
        float _182 = _180 + 1.0;
        float _184 = _168 * _178;
        float _186 = -_176;
        float _188 = _186 + 2.0;
        float _190 = _172 * _172;
        float _192 = _182 * _182;
        float _194 = _184 * 4.0;
        float _196 = -_184;
        float _198 = _196 + 6.0;
        float _200 = _182 * _192;
        float _202 = _188 * _188;
        float _204 = -_194;
        float _206 = fma(_172, _190, _204);
        float _208 = _200 * 4.0;
        float _210 = 1.0 / _150;
        float _212 = -_206;
        float _214 = _212 + _198;
        float _216 = -_208;
        float _218 = fma(_188, _202, _216);
        float _220 = -_200;
        float _222 = _220 + 6.0;
        float _224 = _214 * 0.16666667163372039794921875;
        float _226 = _184 + _206;
        float _228 = _164 * _164;
        float _230 = -_218;
        float _232 = _230 + _222;
        float _234 = _176 * _176;
        float _236 = _226 * 0.16666667163372039794921875;
        float _238 = 1.0 / _224;
        float _240 = _232 * 0.16666667163372039794921875;
        float _242 = _200 + _218;
        float _244 = _164 * _228;
        float _246 = _176 * _234;
        float _248 = _160 + (-0.5);
        float _250 = _242 * 0.16666667163372039794921875;
        float _252 = _218 * 0.16666667163372039794921875;
        float _254 = 1.0 / _240;
        float _256 = _158 + (-0.5);
        float _258 = _158 + 1.5;
        float _260 = _160 + 1.5;
        float _262 = _244 * 0.16666667163372039794921875;
        float _264 = _246 * 0.16666667163372039794921875;
        float _266 = _206 * 0.16666667163372039794921875;
        float _268 = 1.0 / _250;
        float _270 = fma(_262, _238, _258);
        float _272 = _270 * _156;
        float _274 = 1.0 / _236;
        float _276 = fma(_264, _254, _260);
        float _278 = _276 * _210;
        float _280 = fma(_252, _268, _248);
        float _282 = _280 * _210;
        float _284 = fma(_266, _274, _256);
        float _286 = _284 * _156;
        float2 _755 = float2(_286, _282);
        float3 _290 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_755, float2(0.0), isnan(_755)), level(_126)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_755, float2(0.0), isnan(_755)), level(_126)).xyz;
        float _292 = _290.x;
        float _294 = _290.y;
        float _296 = _290.z;
        float2 _770 = float2(_272, _282);
        float3 _298 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_770, float2(0.0), isnan(_770)), level(_126)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_770, float2(0.0), isnan(_770)), level(_126)).xyz;
        float _300 = _298.x;
        float _302 = _298.y;
        float _304 = _298.z;
        float2 _785 = float2(_286, _278);
        float3 _306 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_785, float2(0.0), isnan(_785)), level(_126)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_785, float2(0.0), isnan(_785)), level(_126)).xyz;
        float _308 = _306.x;
        float _310 = _306.y;
        float _312 = _306.z;
        float2 _800 = float2(_272, _278);
        float3 _314 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_800, float2(0.0), isnan(_800)), level(_126)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_800, float2(0.0), isnan(_800)), level(_126)).xyz;
        float _316 = _314.x;
        float _318 = _314.y;
        float _320 = _314.z;
        float _322 = -_300;
        float _324 = _292 + _322;
        float _326 = -_302;
        float _328 = _294 + _326;
        float _330 = -_316;
        float _332 = _308 + _330;
        float _334 = -_304;
        float _336 = _296 + _334;
        float _338 = -_318;
        float _340 = _310 + _338;
        float _342 = -_320;
        float _344 = _312 + _342;
        float _346 = 0.0 + _124;
        float _348 = precise::clamp(_346, 0.0, 1.0);
        float _350 = fma(_236, _324, _300);
        float _352 = fma(_236, _328, _302);
        float _354 = fma(_236, _336, _304);
        float _356 = fma(_236, _332, _316);
        float _358 = fma(_236, _340, _318);
        float _360 = fma(_236, _344, _320);
        float _362 = fma(_106, _348, _104);
        float _364 = -_356;
        float _366 = _364 + _350;
        float _368 = -_358;
        float _370 = _368 + _352;
        float _372 = -_360;
        float _374 = _372 + _354;
        float _376 = 1.0 / _362;
        float _378 = fma(_250, _366, _356);
        float _380 = fma(_250, _370, _358);
        float _382 = fma(_250, _374, _360);
        float _384 = _348 * _378;
        float _386 = _348 * _380;
        float _388 = _348 * _382;
        float _390 = -_384;
        float _392 = _390 + (*spvDescriptorSet0.fp_c3)._m0[12].x;
        float _394 = -_386;
        float _396 = _394 + (*spvDescriptorSet0.fp_c3)._m0[12].y;
        float _398 = -_388;
        float _400 = _398 + (*spvDescriptorSet0.fp_c3)._m0[12].z;
        float _402 = fma(_104, _392, _384);
        float _404 = fma(_104, _396, _386);
        float _406 = fma(_104, _400, _388);
        float _408 = _402 * _376;
        float _410 = _404 * _376;
        float _412 = _406 * _376;
        out.m_34.x = _408;
        out.m_34.y = _410;
        out.m_34.z = _412;
        out.m_34.w = _362;
        return out;
    }
    out.m_34.x = (*spvDescriptorSet0.fp_c3)._m0[12].x;
    out.m_34.y = (*spvDescriptorSet0.fp_c3)._m0[12].y;
    out.m_34.z = (*spvDescriptorSet0.fp_c3)._m0[12].z;
    out.m_34.w = _104;
    return out;
}

