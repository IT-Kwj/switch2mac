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
};

static inline __attribute__((always_inline))
int _40(thread const int& _879, thread const int& _880, constant _10& support_buffer)
{
    int _883 = 1 + _880;
    float _885 = support_buffer._m5[_883].x;
    float _887 = abs(_885);
    bool _890 = _887 == 1.0;
    if (_890)
    {
        return _879;
    }
    float _892 = float(_879);
    float _894 = _892 / _887;
    int _896 = int(_894);
    return _896;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    int _43 = int2(spvDescriptorSet0.fp_t_tcb_8.get_width(), spvDescriptorSet0.fp_t_tcb_8.get_height()).x;
    int _45 = _43;
    int _47 = 0;
    int _49 = _40(_45, _47, (*spvDescriptorSet0.support_buffer));
    int _51 = int2(spvDescriptorSet0.fp_t_tcb_8.get_width(), spvDescriptorSet0.fp_t_tcb_8.get_height()).y;
    int _53 = _51;
    int _55 = 0;
    int _57 = _40(_53, _55, (*spvDescriptorSet0.support_buffer));
    float _60 = gl_FragCoord.w;
    float _62 = in.m_31.x;
    float _64 = gl_FragCoord.w;
    float _66 = _62 * _64;
    float _68 = in.m_31.y;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = 1.0 / _60;
    float _76 = float(_49);
    float _78 = _74 * _66;
    float _80 = float(_57);
    float _82 = _74 * _72;
    float _84 = fma(_78, _76, -0.5);
    float _86 = fma(_82, _80, -0.5);
    float _88 = 1.0 / _76;
    float _90 = floor(_84);
    float _92 = floor(_86);
    float _94 = -_90;
    float _96 = _84 + _94;
    float _98 = 1.0 / _80;
    float _100 = -_96;
    float _102 = _100 + 1.0;
    float _104 = -_96;
    float _106 = _104 + 2.0;
    float _108 = -_92;
    float _110 = _86 + _108;
    float _112 = _102 * _102;
    float _114 = _106 * _106;
    float _116 = -_110;
    float _118 = _116 + 1.0;
    float _120 = _102 * _112;
    float _122 = _118 * _118;
    float _124 = _120 * 4.0;
    float _126 = -_120;
    float _128 = _126 + 6.0;
    float _130 = _118 * _122;
    float _132 = -_110;
    float _134 = _132 + 2.0;
    float _136 = -_124;
    float _138 = fma(_106, _114, _136);
    float _140 = _130 * 4.0;
    float _142 = _134 * _134;
    float _144 = -_130;
    float _146 = _144 + 6.0;
    float _148 = -_138;
    float _150 = _148 + _128;
    float _152 = _120 + _138;
    float _154 = -_140;
    float _156 = fma(_134, _142, _154);
    float _158 = _96 * _96;
    float _160 = _150 * 0.16666667163372039794921875;
    float _162 = _152 * 0.16666667163372039794921875;
    float _164 = -_156;
    float _166 = _164 + _146;
    float _168 = _130 + _156;
    float _170 = _110 * _110;
    float _172 = 1.0 / _162;
    float _174 = _166 * 0.16666667163372039794921875;
    float _176 = _168 * 0.16666667163372039794921875;
    float _178 = in.m_31.w;
    float _180 = gl_FragCoord.w;
    float _182 = _178 * _180;
    float _184 = _96 * _158;
    float _186 = _110 * _170;
    float _188 = _90 + (-0.5);
    float _190 = _90 + 1.5;
    float _192 = 1.0 / _176;
    float _194 = _92 + (-0.5);
    float _196 = _156 * 0.16666667163372039794921875;
    float _198 = _138 * 0.16666667163372039794921875;
    float _200 = _184 * 0.16666667163372039794921875;
    float _202 = _92 + 1.5;
    float _204 = _186 * 0.16666667163372039794921875;
    float _206 = 1.0 / _160;
    float _208 = fma(_198, _172, _188);
    float _210 = 1.0 / _174;
    float _212 = fma(_196, _192, _194);
    float _214 = _212 * _98;
    float _216 = fma(_200, _206, _190);
    float _218 = _74 * _182;
    float _220 = _216 * _88;
    float _222 = fma(_204, _210, _202);
    float _224 = _208 * _88;
    float _226 = _222 * _98;
    float2 _611 = float2(_224, _214);
    float4 _229 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_611, float2(0.0), isnan(_611)), level(_218)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_611, float2(0.0), isnan(_611)), level(_218)).xyzw;
    float _231 = _229.x;
    float _233 = _229.y;
    float _235 = _229.z;
    float _237 = _229.w;
    float2 _632 = float2(_220, _214);
    float4 _239 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_632, float2(0.0), isnan(_632)), level(_218)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_632, float2(0.0), isnan(_632)), level(_218)).xyzw;
    float _241 = _239.x;
    float _243 = _239.y;
    float _245 = _239.z;
    float _247 = _239.w;
    float2 _649 = float2(_224, _226);
    float4 _249 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_649, float2(0.0), isnan(_649)), level(_218)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_649, float2(0.0), isnan(_649)), level(_218)).xyzw;
    float _251 = _249.x;
    float _253 = _249.y;
    float _255 = _249.z;
    float _257 = _249.w;
    float2 _666 = float2(_220, _226);
    float4 _259 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_666, float2(0.0), isnan(_666)), level(_218)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_666, float2(0.0), isnan(_666)), level(_218)).xyzw;
    float _261 = _259.x;
    float _263 = _259.y;
    float _265 = _259.z;
    float _267 = _259.w;
    float2 _683 = float2(_78, _82);
    float4 _269 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_683, float2(0.0), isnan(_683)), level(_218)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_683, float2(0.0), isnan(_683)), level(_218)).xyzw;
    float _271 = _269.x;
    float _273 = _269.y;
    float _275 = _269.z;
    float _277 = _269.w;
    float _279 = -_241;
    float _281 = _231 + _279;
    float _283 = -_243;
    float _285 = _233 + _283;
    float _287 = -_245;
    float _289 = _235 + _287;
    float _291 = -_247;
    float _293 = _237 + _291;
    float _295 = fma(_162, _281, _241);
    float _297 = -_261;
    float _299 = _251 + _297;
    float _301 = fma(_162, _289, _245);
    float _303 = -_263;
    float _305 = _253 + _303;
    float _307 = -_265;
    float _309 = _255 + _307;
    float _311 = fma(_162, _299, _261);
    float _313 = -_267;
    float _315 = _257 + _313;
    float _317 = fma(_162, _285, _243);
    float _319 = fma(_162, _293, _247);
    float _321 = -_311;
    float _323 = _321 + _295;
    float _325 = fma(_162, _305, _263);
    float _327 = fma(_162, _309, _265);
    float _329 = fma(_162, _315, _267);
    float _331 = fma(_176, _323, _311);
    float _333 = -_325;
    float _335 = _333 + _317;
    float _337 = -_327;
    float _339 = _337 + _301;
    float _341 = -_329;
    float _343 = _341 + _319;
    float _345 = fma(_273, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[7].y);
    float _347 = fma(_176, _335, _325);
    float _349 = fma(_176, _339, _327);
    float _351 = fma(_176, _343, _329);
    float _353 = fma(_271, (*spvDescriptorSet0.fp_c3)._m0[6].x, (*spvDescriptorSet0.fp_c3)._m0[7].x);
    float _355 = fma(_275, (*spvDescriptorSet0.fp_c3)._m0[6].z, (*spvDescriptorSet0.fp_c3)._m0[7].z);
    float _357 = fma(_277, (*spvDescriptorSet0.fp_c3)._m0[6].w, (*spvDescriptorSet0.fp_c3)._m0[7].w);
    float _359 = fma(_347, (*spvDescriptorSet0.fp_c3)._m0[5].y, _345);
    float _361 = fma(_331, (*spvDescriptorSet0.fp_c3)._m0[5].x, _353);
    float _363 = fma(_349, (*spvDescriptorSet0.fp_c3)._m0[5].z, _355);
    float _365 = fma(_351, (*spvDescriptorSet0.fp_c3)._m0[5].w, _357);
    float _367 = _359 + (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _369 = _361 + (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _371 = _363 + (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _373 = _365 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    out.m_34.x = _369;
    out.m_34.y = _367;
    out.m_34.z = _371;
    out.m_34.w = _373;
    return out;
}

